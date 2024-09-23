@implementation CAMPreviewViewController

- (CAMPreviewViewController)initWithCaptureController:(id)a3 motionController:(id)a4 timelapseController:(id)a5
{
  id v9;
  id v10;
  id v11;
  CAMPreviewViewController *v12;
  CAMPreviewViewController *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *indicatorViewsByType;
  uint64_t v18;
  NSMapTable *metadataObjectsForView;
  CAMPreviewViewController *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CAMPreviewViewController;
  v12 = -[CAMPreviewViewController initWithNibName:bundle:](&v22, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    -[CAMPreviewViewController _initializeExposureBiasSliderParameters](v12, "_initializeExposureBiasSliderParameters");
    v13->_showingStandardControls = 1;
    objc_storeStrong((id *)&v13->__captureController, a3);
    objc_storeStrong((id *)&v13->__motionController, a4);
    objc_storeWeak((id *)&v13->__timelapseController, v11);
    -[CUCaptureController setFocusDelegate:](v13->__captureController, "setFocusDelegate:", v13);
    -[CUCaptureController setExposureDelegate:](v13->__captureController, "setExposureDelegate:", v13);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__captureOrientationChanged_, CFSTR("CAMMotionControllerCaptureOrientationChangedNotification"), 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v13, sel__applicationDidEnterBackground, *MEMORY[0x1E0DC4768], 0);

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    indicatorViewsByType = v13->__indicatorViewsByType;
    v13->__indicatorViewsByType = v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 517, 0, 6);
    metadataObjectsForView = v13->__metadataObjectsForView;
    v13->__metadataObjectsForView = (NSMapTable *)v18;

    v13->__disableDelayedFadeOutForFaces = CFPreferencesGetAppBooleanValue(CFSTR("CAMDebugDisableDelayedFadeOutForFaces"), CFSTR("com.apple.camera"), 0) != 0;
    v13->__disableIndicatorGeometryAnimations = CFPreferencesGetAppBooleanValue(CFSTR("CAMDebugDisablePreviewIndicatorViewAnimations"), CFSTR("com.apple.camera"), 0) != 0;
    v13->__disableAllIndicators = CFPreferencesGetAppBooleanValue(CFSTR("CAMDebugDisablePreviewIndicators"), CFSTR("com.apple.camera"), 0) != 0;
    -[CAMPreviewViewController _resetFaceTracking](v13, "_resetFaceTracking");
    v20 = v13;
  }

  return v13;
}

- (void)_initializeExposureBiasSliderParameters
{
  -[CAMPreviewViewController _setExposureBiasVirtualSliderExponent:](self, "_setExposureBiasVirtualSliderExponent:", 1.4);
  -[CAMPreviewViewController _setExposureBiasVirtualSliderPointsForFirstStop:](self, "_setExposureBiasVirtualSliderPointsForFirstStop:", 120.0);
}

- (void)_setExposureBiasVirtualSliderExponent:(double)a3
{
  self->__exposureBiasVirtualSliderExponent = a3;
}

- (void)_setExposureBiasVirtualSliderPointsForFirstStop:(double)a3
{
  self->__exposureBiasVirtualSliderPointsForFirstStop = a3;
}

- (void)_resetFaceTracking
{
  -[CAMPreviewViewController _setCurrentFacesCount:](self, "_setCurrentFacesCount:", 0);
  -[CAMPreviewViewController _setShouldSuppressExistingFaceIndicators:](self, "_setShouldSuppressExistingFaceIndicators:", 0);
  -[CAMPreviewViewController _fadeOutIndicatorsOfViewType:afterDelay:](self, "_fadeOutIndicatorsOfViewType:afterDelay:", CFSTR("face"), 0.0);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMPreviewViewController _hideAllFocusIndicatorsAnimated:](self, "_hideAllFocusIndicatorsAnimated:", 0);
  }
}

- (void)loadView
{
  CAMPreviewView *v3;
  void *v4;
  CAMPreviewView *v5;

  v3 = [CAMPreviewView alloc];
  v5 = -[CAMPreviewView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (-[CAMPreviewViewController _disableAllIndicators](self, "_disableAllIndicators"))
  {
    -[CAMPreviewView indicatorContainerView](v5, "indicatorContainerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

  }
  -[CAMPreviewViewController setView:](self, "setView:", v5);

}

- (void)viewDidLoad
{
  int64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewViewController;
  -[CAMPreviewViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[CAMPreviewViewController _createCommonGestureRecognizersIfNecessary](self, "_createCommonGestureRecognizersIfNecessary");
  v3 = -[CAMPreviewViewController _interfaceOrientation](self, "_interfaceOrientation");
  -[CAMPreviewViewController previewView](self, "previewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOrientation:", v3);

}

- (void)_createCommonGestureRecognizersIfNecessary
{
  void *v3;
  BOOL v4;

  -[CAMPreviewViewController _createTapToFocusAndExposeGestureRecognizerIfNecessary](self, "_createTapToFocusAndExposeGestureRecognizerIfNecessary");
  -[CAMPreviewViewController _createLongPressToLockGestureRecognizersIfNecessary](self, "_createLongPressToLockGestureRecognizersIfNecessary");
  -[CAMPreviewViewController _createExposureBiasPanGestureRecognizerIfNecessary](self, "_createExposureBiasPanGestureRecognizerIfNecessary");
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = CAMIsTallScreen(v3);

  if (!v4)
    -[CAMPreviewViewController _createAspectRatioToggleDoubleTapGestureRecognizerIfNecessary](self, "_createAspectRatioToggleDoubleTapGestureRecognizerIfNecessary");
}

- (void)_createTapToFocusAndExposeGestureRecognizerIfNecessary
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *tapToFocusAndExposeGestureRecognizer;
  id v5;

  if (!self->__tapToFocusAndExposeGestureRecognizer)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapToFocusAndExpose_);
    tapToFocusAndExposeGestureRecognizer = self->__tapToFocusAndExposeGestureRecognizer;
    self->__tapToFocusAndExposeGestureRecognizer = v3;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->__tapToFocusAndExposeGestureRecognizer, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](self->__tapToFocusAndExposeGestureRecognizer, "setNumberOfTouchesRequired:", 1);
    -[UITapGestureRecognizer setDelegate:](self->__tapToFocusAndExposeGestureRecognizer, "setDelegate:", self);
    -[CAMPreviewViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", self->__tapToFocusAndExposeGestureRecognizer);

  }
}

- (void)_createLongPressToLockGestureRecognizersIfNecessary
{
  UILongPressGestureRecognizer *v3;
  UILongPressGestureRecognizer *longPressToLockGestureRecognizer;
  id v5;

  if (!self->__longPressToLockGestureRecognizer)
  {
    v3 = (UILongPressGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPressToLock_);
    longPressToLockGestureRecognizer = self->__longPressToLockGestureRecognizer;
    self->__longPressToLockGestureRecognizer = v3;

    -[UILongPressGestureRecognizer setMinimumPressDuration:](self->__longPressToLockGestureRecognizer, "setMinimumPressDuration:", 0.5);
    -[UILongPressGestureRecognizer setCancelsTouchesInView:](self->__longPressToLockGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setDelaysTouchesEnded:](self->__longPressToLockGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UILongPressGestureRecognizer setDelegate:](self->__longPressToLockGestureRecognizer, "setDelegate:", self);
    -[CAMPreviewViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", self->__longPressToLockGestureRecognizer);

  }
}

- (void)_createExposureBiasPanGestureRecognizerIfNecessary
{
  UIPanGestureRecognizer *v3;
  UIPanGestureRecognizer *exposureBiasPanGestureRecognizer;
  void *v5;

  if (!self->__exposureBiasPanGestureRecognizer)
  {
    v3 = (UIPanGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel__handleExposureBiasPan_);
    exposureBiasPanGestureRecognizer = self->__exposureBiasPanGestureRecognizer;
    self->__exposureBiasPanGestureRecognizer = v3;

    -[UIPanGestureRecognizer _setCanPanHorizontally:](self->__exposureBiasPanGestureRecognizer, "_setCanPanHorizontally:", 0);
    -[UIPanGestureRecognizer _setCanPanVertically:](self->__exposureBiasPanGestureRecognizer, "_setCanPanVertically:", 1);
    -[UIPanGestureRecognizer setCancelsTouchesInView:](self->__exposureBiasPanGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UIPanGestureRecognizer setDelaysTouchesEnded:](self->__exposureBiasPanGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UIPanGestureRecognizer setDelegate:](self->__exposureBiasPanGestureRecognizer, "setDelegate:", self);
    -[CAMPreviewViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", self->__exposureBiasPanGestureRecognizer);

    -[CAMPreviewViewController _updateExposureBiasPanGestureRecognizerForOrientation](self, "_updateExposureBiasPanGestureRecognizerForOrientation");
  }
}

- (void)_updateExposureBiasPanGestureRecognizerForOrientation
{
  unint64_t v3;
  _BOOL8 v4;

  v3 = -[CAMPreviewViewController _interfaceOrientation](self, "_interfaceOrientation") - 3;
  v4 = v3 > 1;
  -[UIPanGestureRecognizer _setCanPanHorizontally:](self->__exposureBiasPanGestureRecognizer, "_setCanPanHorizontally:", v3 < 2);
  -[UIPanGestureRecognizer _setCanPanVertically:](self->__exposureBiasPanGestureRecognizer, "_setCanPanVertically:", v4);
}

- (int64_t)_interfaceOrientation
{
  void *v2;
  int64_t v3;

  -[CAMPreviewViewController _motionController](self, "_motionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "captureOrientation");

  return v3;
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (BOOL)isFocusLockedByUser
{
  return -[CAMFocusResult deviceSupportsFocus](self->__lastFocusResult, "deviceSupportsFocus")
      && -[CAMPreviewViewController _isFocusAndExposureLockedByUserOrExternally](self, "_isFocusAndExposureLockedByUserOrExternally")|| -[CAMPreviewViewController _cinematicIsFixedFocusLocked](self, "_cinematicIsFixedFocusLocked");
}

- (int64_t)_mode
{
  void *v2;
  int64_t v3;

  -[CAMPreviewViewController _graphConfiguration](self, "_graphConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "mode");

  return v3;
}

- (BOOL)_userLockedFocusAndExposure
{
  return self->__userLockedFocusAndExposure;
}

- (NSArray)cachedMRCResults
{
  return self->_cachedMRCResults;
}

- (void)setLightingType:(int64_t)a3
{
  -[CAMPreviewViewController setLightingType:animated:](self, "setLightingType:animated:", a3, 0);
}

- (void)setLightingType:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_lightingType != a3)
  {
    self->_lightingType = a3;
    if (!-[CAMPreviewViewController _shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:](self, "_shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:"))-[CAMPreviewViewController _hidePortraitModeTrackedSubjectIndicatorsAnimated:](self, "_hidePortraitModeTrackedSubjectIndicatorsAnimated:", 0);
    -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", 1);
  }
}

- (void)_updatePortraitModeViewsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  int v14;
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  unint64_t v22;
  int v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  double v29;
  double v30;
  char v31;
  int v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  BOOL v41;

  v3 = a3;
  v5 = -[CAMPreviewViewController _shouldShowStageLightOverlayViewForMode:device:lightingType:shallowDepthOfFieldStatus:stagePreviewStatus:](self, "_shouldShowStageLightOverlayViewForMode:device:lightingType:shallowDepthOfFieldStatus:stagePreviewStatus:", -[CAMPreviewViewController _mode](self, "_mode"), -[CAMPreviewViewController _device](self, "_device"), -[CAMPreviewViewController lightingType](self, "lightingType"), -[CAMPreviewViewController shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus"), -[CAMPreviewViewController stagePreviewStatus](self, "stagePreviewStatus"));
  if (v5)
  {
    -[CAMPreviewViewController _createStageLightOverlayViewIfNeededWillAnimate:](self, "_createStageLightOverlayViewIfNeededWillAnimate:", v3);
    v6 = -[CAMPreviewViewController _shouldShowStageLightOverlayActive](self, "_shouldShowStageLightOverlayActive");
    -[CAMPreviewViewController _stageLightOverlayView](self, "_stageLightOverlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:animated:", v6, v3);

    v8 = -[CAMPreviewViewController _interfaceOrientation](self, "_interfaceOrientation");
    -[CAMPreviewViewController _stageLightOverlayView](self, "_stageLightOverlayView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOrientation:animated:", v8, v3);

  }
  -[CAMPreviewViewController _stageLightOverlayView](self, "_stageLightOverlayView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setVisible:animated:", v5, v3);

  v11 = -[CAMPreviewViewController _shouldShowIndicatorsAsInactive](self, "_shouldShowIndicatorsAsInactive");
  -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("portraitSubject"));
  v38 = (id)objc_claimAutoreleasedReturnValue();

  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __61__CAMPreviewViewController__updatePortraitModeViewsAnimated___block_invoke;
  v40[3] = &__block_descriptor_33_e33_v32__0__NSString_8__UIView_16_B24l;
  v41 = v11;
  objc_msgSend(v38, "enumerateKeysAndObjectsUsingBlock:", v40);
  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isInactive");
  objc_msgSend(v13, "setInactive:", v11);
  if (v14 && !v11)
    objc_msgSend(v13, "startScalingWithExpansionWidth:duration:repeatCount:", 1, 10.0, 0.3);
  v15 = -[CAMPreviewViewController _shouldShowPortraitModeIndicatorViews](self, "_shouldShowPortraitModeIndicatorViews", v38);
  v16 = -[CAMPreviewViewController isShowingPointIndicator](self, "isShowingPointIndicator");
  v17 = objc_msgSend(v39, "count");
  v18 = -[CAMPreviewViewController _device](self, "_device");
  if ((unint64_t)(v18 - 1) > 0xA)
    v19 = 0;
  else
    v19 = qword_1DB9A7C88[v18 - 1];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isSingleCameraPortraitModeSupportedForDevicePosition:", v19);

  v22 = -[CAMPreviewViewController lightingType](self, "lightingType") - 7;
  v23 = v15 & v21;
  if (v17)
    v23 = 0;
  if (v22 < 0xFFFFFFFFFFFFFFFDLL)
    v24 = v23 & ~v16;
  else
    v24 = 0;
  if (v24 == 1)
  {
    -[CAMPreviewViewController _portraitModeCenteredIndicatorView](self, "_portraitModeCenteredIndicatorView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v25)
    {
      -[CAMPreviewViewController _createPortraitModeCenteredIndicatorViewIfNecessary](self, "_createPortraitModeCenteredIndicatorViewIfNecessary");
      -[CAMPreviewViewController view](self, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "layoutIfNeeded");

    }
  }
  -[CAMPreviewViewController _portraitModeCenteredIndicatorView](self, "_portraitModeCenteredIndicatorView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isInactive");
  objc_msgSend(v27, "alpha");
  v30 = v29;
  objc_msgSend(v27, "setInactive:", -[CAMPreviewViewController _isPortraitEffectActive](self, "_isPortraitEffectActive") ^ 1);
  if (v24 && (objc_msgSend(v27, "isInactive") & 1) != 0)
  {
    if (v30 == 0.0)
      v31 = 0;
    else
      v31 = v28;
    v32 = objc_msgSend(v27, "isInactive");
    if ((v31 & 1) == 0)
    {
      LODWORD(v33) = 0.5;
      LODWORD(v34) = 0;
      LODWORD(v35) = 0.5;
      LODWORD(v36) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v33, v34, v35, v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "startScalingWithExpansionWidth:duration:repeatCount:timingFunction:", -1, v37, 8.0, 0.75);

      goto LABEL_27;
    }
  }
  else
  {
    v32 = objc_msgSend(v27, "isInactive");
  }
  if ((v28 & ~v32) == 1)
    objc_msgSend(v27, "stopScalingWithDuration:", 0.2);
LABEL_27:
  objc_msgSend(v27, "setHidden:animated:", v24 ^ 1u, v3);

}

- (int64_t)_device
{
  void *v2;
  int64_t v3;

  -[CAMPreviewViewController _graphConfiguration](self, "_graphConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "device");

  return v3;
}

- (int64_t)lightingType
{
  return self->_lightingType;
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (CAMStageLightOverlayView)_stageLightOverlayView
{
  return self->__stageLightOverlayView;
}

- (BOOL)_shouldShowIndicatorsAsInactive
{
  BOOL v3;

  v3 = -[CAMPreviewViewController _shouldShowPortraitModeIndicatorViews](self, "_shouldShowPortraitModeIndicatorViews");
  return v3 & !-[CAMPreviewViewController _isPortraitEffectActive](self, "_isPortraitEffectActive");
}

- (BOOL)_shouldShowPortraitModeIndicatorViews
{
  int64_t v3;
  _BOOL4 v4;

  v3 = -[CAMPreviewViewController _mode](self, "_mode");
  v4 = !-[CAMPreviewViewController _isChangingGraphConfiguration](self, "_isChangingGraphConfiguration");
  return v3 == 6 && v4;
}

- (BOOL)_isPortraitEffectActive
{
  unint64_t v2;

  v2 = -[CAMPreviewViewController shallowDepthOfFieldStatus](self, "shallowDepthOfFieldStatus");
  return (v2 < 0xF) & (0x6202u >> v2);
}

- (CAMFocusIndicatorView)_pointIndicator
{
  return self->__pointIndicator;
}

- (void)_updatePreviewViewAspectMode
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[CAMPreviewViewController _mode](self, "_mode");
  if (objc_msgSend(v8, "isPreviewAspectRatioToggleSupportedForMode:", v3))
  {
    +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "previewViewAspectModeForMode:", v3);

  }
  else if (objc_msgSend(v8, "isSpatialOverCaptureSupported"))
  {
    v5 = ~(objc_msgSend(v8, "spatialOverCaptureSupportForMode:device:", -[CAMPreviewViewController _mode](self, "_mode"), -[CAMPreviewViewController _device](self, "_device")) >> 1) & 1;
  }
  else
  {
    v5 = 0;
  }
  -[CAMPreviewViewController previewView](self, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoPreviewView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPreviewViewAspectMode:", v5);

}

- (void)captureController:(id)a3 didOutputExposureResult:(id)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  char v12;
  void *v13;
  BOOL v14;

  v5 = a4;
  v6 = objc_msgSend(v5, "exposureMode");
  objc_msgSend(v5, "pointOfInterest");
  v8 = v7;
  v10 = v9;
  v11 = objc_msgSend(v5, "exposureDidEnd");
  -[CAMPreviewViewController _setLastExposureResult:](self, "_setLastExposureResult:", v5);
  v12 = objc_msgSend(v5, "deviceSupportsFocus");

  if ((v12 & 1) == 0)
  {
    if (v6 == 2 && v8 == 0.5 && v10 == 0.5)
    {
      -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v13, 0);
    }
    else
    {
      v14 = -[CAMPreviewViewController _isLongPressingToLock](self, "_isLongPressingToLock");
      if (!v11
        || v14
        || -[CAMPreviewViewController _isFocusAndExposureLockedByUserOrExternally](self, "_isFocusAndExposureLockedByUserOrExternally"))
      {
        goto LABEL_11;
      }
      -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPreviewViewController _deactivateFocusIndicator:afterDelay:](self, "_deactivateFocusIndicator:afterDelay:", v13, 1.2);
    }

LABEL_11:
    if (v11)
      -[CAMPreviewViewController _fadeOutIndicatorsOfViewType:afterDelay:](self, "_fadeOutIndicatorsOfViewType:afterDelay:", CFSTR("face"), 0.5);
  }
}

- (void)_setLastExposureResult:(id)a3
{
  CAMExposureResult *v5;
  CAMExposureResult *v6;

  v5 = (CAMExposureResult *)a3;
  if (self->__lastExposureResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__lastExposureResult, a3);
    -[CAMPreviewViewController _validateInternalProperties](self, "_validateInternalProperties");
    v5 = v6;
  }

}

- (void)_validateInternalProperties
{
  void *v3;

  -[CAMPreviewViewController _lastExposureResult](self, "_lastExposureResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController _validateExposureTargetBiasFromExposureResult:](self, "_validateExposureTargetBiasFromExposureResult:", v3);

  -[CAMPreviewViewController _validateLastExposureBiasModificationTime](self, "_validateLastExposureBiasModificationTime");
  -[CAMPreviewViewController _validateUserLockedFocusAndExposure](self, "_validateUserLockedFocusAndExposure");
}

- (CAMExposureResult)_lastExposureResult
{
  return self->__lastExposureResult;
}

- (void)_validateExposureTargetBiasFromExposureResult:(id)a3
{
  _BOOL4 v4;
  float v5;
  double v6;

  objc_msgSend(a3, "exposureTargetBias");
  v4 = -[CAMPreviewViewController _isExposureTargetBiasAtBaseline:](self, "_isExposureTargetBiasAtBaseline:");
  -[CAMPreviewViewController cachedExposureTargetBias](self, "cachedExposureTargetBias");
  if (v4 && v5 != 0.0 && !-[CAMPreviewViewController _isPanningExposureBias](self, "_isPanningExposureBias"))
  {
    LODWORD(v6) = 0;
    -[CAMPreviewViewController setCachedExposureTargetBias:](self, "setCachedExposureTargetBias:", v6);
  }
}

- (void)_validateLastExposureBiasModificationTime
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;

  -[CAMPreviewViewController _lastExposureBiasModificationTime](self, "_lastExposureBiasModificationTime");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[CAMPreviewViewController _isFullyAutomaticFocusAndExposure](self, "_isFullyAutomaticFocusAndExposure");

    if (v5)
      -[CAMPreviewViewController _setLastExposureBiasModifiedTime:](self, "_setLastExposureBiasModifiedTime:", 0);
  }
}

- (NSDate)_lastExposureBiasModificationTime
{
  return self->__lastExposureBiasModificationTime;
}

- (void)captureController:(id)a3 didOutputFocusResult:(id)a4
{
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;
  _BOOL4 v15;
  _BOOL4 v16;
  void *v17;
  id v18;

  v18 = a4;
  -[CAMPreviewViewController _setLastFocusResult:](self, "_setLastFocusResult:", v18);
  -[CAMPreviewViewController _timelapseController](self, "_timelapseController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLastFocusResult:", v18);
  if (-[CAMPreviewViewController _mode](self, "_mode") != 7 && objc_msgSend(v18, "deviceSupportsFocus"))
  {
    v6 = objc_msgSend(v18, "focusMode");
    v7 = objc_msgSend(v18, "contrastBasedFocusDidStart");
    v8 = objc_msgSend(v18, "contrastBasedFocusDidEnd");
    objc_msgSend(v18, "pointOfInterest");
    v10 = v9;
    v12 = v11;
    v13 = -[CAMPreviewViewController _isLongPressingToLock](self, "_isLongPressingToLock");
    v15 = v10 == 0.5 && v6 == 3;
    v16 = v12 == 0.5 && v15;
    if (v7)
    {
      if (v16)
        -[CAMPreviewViewController _showUIForResetFocusAndExposure](self, "_showUIForResetFocusAndExposure");
      -[CAMPreviewViewController _setFocusIndicatorsPulsing:](self, "_setFocusIndicatorsPulsing:", 1);
    }
    if (v8)
    {
      if (v16)
      {
        -[CAMPreviewViewController _updateUIForCenteredContrastBasedFocusDidEnd](self, "_updateUIForCenteredContrastBasedFocusDidEnd");
        -[CAMPreviewViewController _setFocusIndicatorsPulsing:](self, "_setFocusIndicatorsPulsing:", 0);
      }
      else
      {
        -[CAMPreviewViewController _setFocusIndicatorsPulsing:](self, "_setFocusIndicatorsPulsing:", 0);
        if (!v13
          && !-[CAMPreviewViewController _isFocusAndExposureLockedByUserOrExternally](self, "_isFocusAndExposureLockedByUserOrExternally"))
        {
          -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[CAMPreviewViewController _deactivateFocusIndicator:afterDelay:](self, "_deactivateFocusIndicator:afterDelay:", v17, 1.2);

        }
      }
      -[CAMPreviewViewController _fadeOutIndicatorsOfViewType:afterDelay:](self, "_fadeOutIndicatorsOfViewType:afterDelay:", CFSTR("face"), 0.5);
    }
  }

}

- (void)_setLastFocusResult:(id)a3
{
  CAMFocusResult *v5;
  CAMFocusResult *v6;

  v5 = (CAMFocusResult *)a3;
  if (self->__lastFocusResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->__lastFocusResult, a3);
    -[CAMPreviewViewController _validateInternalProperties](self, "_validateInternalProperties");
    v5 = v6;
  }

}

- (CAMTimelapseController)_timelapseController
{
  return (CAMTimelapseController *)objc_loadWeakRetained((id *)&self->__timelapseController);
}

- (UILongPressGestureRecognizer)_longPressToLockGestureRecognizer
{
  return self->__longPressToLockGestureRecognizer;
}

- (void)captureControllerWillResetFocusAndExposure:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CAMPreviewViewController _setUserLockedFocusAndExposure:](self, "_setUserLockedFocusAndExposure:", 0);
  -[CAMPreviewViewController _setCinematicIsFixedFocusLocked:](self, "_setCinematicIsFixedFocusLocked:", 0);
  -[CAMPreviewViewController _setCinematicSubjectIsTrackingLocked:](self, "_setCinematicSubjectIsTrackingLocked:", 0);
  if (-[CAMPreviewViewController _isFullyAutomaticFocusAndExposure](self, "_isFullyAutomaticFocusAndExposure"))
  {
    -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v4, 0);
LABEL_6:

    goto LABEL_7;
  }
  -[CAMPreviewViewController _showUIForResetFocusAndExposure](self, "_showUIForResetFocusAndExposure");
  if (!-[CAMPreviewViewController _shouldShowPortraitModeIndicatorViews](self, "_shouldShowPortraitModeIndicatorViews"))
  {
    -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPulsing:", 1);
    -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewViewController _hideFocusIndicator:afterDelay:](self, "_hideFocusIndicator:afterDelay:", v5, 0.8);

    goto LABEL_6;
  }
  -[CAMPreviewViewController _scalePortraitModeFocusIndicators](self, "_scalePortraitModeFocusIndicators");
LABEL_7:
  -[CAMPreviewViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "previewViewControllerWillResetFocusOrExposure:", self);

}

- (void)_showUIForResetFocusAndExposure
{
  id v3;
  _BOOL4 v4;
  BOOL v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v9;

  if (!-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI")
    && -[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls"))
  {
    -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewViewController _hideAllFocusIndicatorsExceptForIndicator:](self, "_hideAllFocusIndicatorsExceptForIndicator:", v3);
    v4 = -[CAMPreviewViewController _shouldShowContinuousIndicator](self, "_shouldShowContinuousIndicator");
    if (-[CAMPreviewViewController _shouldShowPortraitModeIndicatorViews](self, "_shouldShowPortraitModeIndicatorViews"))
    {
      -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", 1);
    }
    else if (v4)
    {
      v5 = -[CAMPreviewViewController _isShowingContinuousIndicator](self, "_isShowingContinuousIndicator");
      if (!v3)
      {
        -[CAMPreviewViewController _createContinuousIndicatorIfNecessary](self, "_createContinuousIndicatorIfNecessary");
        -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
        v3 = (id)objc_claimAutoreleasedReturnValue();
      }
      -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", v3);
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMPreviewViewController _setLastFocusIndictorStartTime:](self, "_setLastFocusIndictorStartTime:", v6);

        objc_msgSend(v3, "startScalingWithExpansionWidth:duration:repeatCount:", 1, 31.0, 0.3);
      }
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__CAMPreviewViewController__showUIForResetFocusAndExposure__block_invoke;
      aBlock[3] = &unk_1EA328868;
      v3 = v3;
      v9 = v3;
      v7 = _Block_copy(aBlock);
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v7, 0, 0.25, 0.0);

    }
  }
}

- (BOOL)_shouldDisableFocusUI
{
  BOOL v3;

  v3 = -[CAMPreviewViewController _isChangingGraphConfiguration](self, "_isChangingGraphConfiguration");
  return -[CAMPreviewViewController layoutStyle](self, "layoutStyle") == 2 || v3;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)isShowingStandardControls
{
  return self->_showingStandardControls;
}

- (CAMFocusIndicatorView)_continuousIndicator
{
  return self->__continuousIndicator;
}

- (void)_hideAllFocusIndicatorsExceptForIndicator:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4 != v6)
    -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v4, 0);
  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 != v6)
    -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v5, 0);

}

- (BOOL)_shouldShowContinuousIndicator
{
  unint64_t v3;
  int v4;
  void *v5;
  int64_t v6;
  char v7;
  char v8;

  v3 = -[CAMPreviewViewController _mode](self, "_mode");
  LOBYTE(v4) = 1;
  if (v3 <= 8)
  {
    if (((1 << v3) & 0x187) != 0)
    {
      -[CAMPreviewViewController _captureController](self, "_captureController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "isCapturingVideo") ^ 1;

    }
    else
    {
      LOBYTE(v4) = v3 != 3;
    }
  }
  v6 = -[CAMPreviewViewController _device](self, "_device");
  if (((0x781u >> (v6 - 1)) & 1) != 0)
    v7 = 0;
  else
    v7 = v4;
  if ((unint64_t)(v6 - 1) <= 0xA)
    v8 = v7;
  else
    v8 = v4;
  return v8 & ~-[CAMPreviewViewController _isShowingIndicatorsOfType:](self, "_isShowingIndicatorsOfType:", CFSTR("face"));
}

- (void)_createContinuousIndicatorIfNecessary
{
  CAMFocusIndicatorView *v3;
  CAMFocusIndicatorView *continuousIndicator;
  id v5;

  if (!self->__continuousIndicator)
  {
    v3 = -[CAMFocusIndicatorView initWithStyle:]([CAMFocusIndicatorView alloc], "initWithStyle:", 0);
    continuousIndicator = self->__continuousIndicator;
    self->__continuousIndicator = v3;

    -[CAMFocusIndicatorView setDelegate:](self->__continuousIndicator, "setDelegate:", self);
    -[CAMPreviewViewController previewView](self, "previewView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContinuousIndicator:", self->__continuousIndicator);

  }
}

- (void)_cancelDelayedHideOrDeactivateForFocusIndicator:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = a3;
    +[CAMPreviewViewController cancelPreviousPerformRequestsWithTarget:selector:object:](CAMPreviewViewController, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideFocusIndicator_, v4);
    +[CAMPreviewViewController cancelPreviousPerformRequestsWithTarget:selector:object:](CAMPreviewViewController, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__deactivateFocusIndicator_, v4);

  }
}

- (void)_setLastFocusIndictorStartTime:(id)a3
{
  objc_storeStrong((id *)&self->__lastFocusIndictorStartTime, a3);
}

uint64_t __59__CAMPreviewViewController__showUIForResetFocusAndExposure__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_hideFocusIndicator:(id)a3 afterDelay:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", v6);
    if (a4 <= 0.0)
      -[CAMPreviewViewController _hideFocusIndicator:](self, "_hideFocusIndicator:", v7);
    else
      -[CAMPreviewViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideFocusIndicator_, v7, a4);
    v6 = v7;
  }

}

- (void)_hideFocusIndicator:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(_QWORD);
  void (**v10)(void *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD aBlock[4];
  id v17;

  v4 = a4;
  v6 = a3;
  if (v6)
  {
    -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", v6);
    objc_msgSend(v6, "setPulsing:", 0);
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__CAMPreviewViewController__hideFocusIndicator_animated___block_invoke;
    aBlock[3] = &unk_1EA328868;
    v8 = v6;
    v17 = v8;
    v9 = (void (**)(_QWORD))_Block_copy(aBlock);
    v11 = v7;
    v12 = 3221225472;
    v13 = __57__CAMPreviewViewController__hideFocusIndicator_animated___block_invoke_2;
    v14 = &unk_1EA328A68;
    v15 = v8;
    v10 = (void (**)(void *, uint64_t))_Block_copy(&v11);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v9, v10, 0.25, 0.0, v11, v12, v13, v14);
    }
    else
    {
      v9[2](v9);
      v10[2](v10, 1);
    }

  }
}

- (void)_setFocusIndicatorsPulsing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  BOOL v10;

  v3 = a3;
  if (!-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI")
    && -[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls"))
  {
    if (-[CAMPreviewViewController _shouldShowPortraitModeIndicatorViews](self, "_shouldShowPortraitModeIndicatorViews"))
    {
      -[CAMPreviewViewController _portraitModeCenteredIndicatorView](self, "_portraitModeCenteredIndicatorView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPulsing:", v3);
      -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("portraitSubject"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __55__CAMPreviewViewController__setFocusIndicatorsPulsing___block_invoke;
      v9[3] = &__block_descriptor_33_e33_v32__0__NSString_8__UIView_16_B24l;
      v10 = v3;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

    }
    else
    {
      -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPulsing:", v3);
    }

    -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPulsing:", v3);

  }
}

- (void)_updateUIForCenteredContrastBasedFocusDidEnd
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  if (!-[CAMPreviewViewController _shouldShowPortraitModeIndicatorViews](self, "_shouldShowPortraitModeIndicatorViews"))
  {
    -[CAMPreviewViewController _lastFocusIndictorStartTime](self, "_lastFocusIndictorStartTime");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v7);
    v5 = v4;

    -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewViewController _hideFocusIndicator:afterDelay:](self, "_hideFocusIndicator:afterDelay:", v6, 0.8 - v5);

  }
}

- (NSDate)_lastFocusIndictorStartTime
{
  return self->__lastFocusIndictorStartTime;
}

- (void)_hideFocusIndicator:(id)a3
{
  -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", a3, 1);
}

uint64_t __57__CAMPreviewViewController__hideFocusIndicator_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (UIPanGestureRecognizer)activeExposureBiasPanGestureRecognizer
{
  void *v3;

  if (-[CAMPreviewViewController _canModifyExposureBias](self, "_canModifyExposureBias"))
  {
    -[CAMPreviewViewController _exposureBiasPanGestureRecognizer](self, "_exposureBiasPanGestureRecognizer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (UIPanGestureRecognizer *)v3;
}

- (BOOL)_canModifyExposureBias
{
  _BOOL4 v3;
  void *v4;
  int v5;

  if (-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI"))
    goto LABEL_5;
  v3 = -[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls");
  if (v3)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isTapAndBiasSupportedForMode:", -[CAMPreviewViewController _mode](self, "_mode"));

    if (!v5 || -[CAMPreviewViewController _isFullyAutomaticFocusAndExposure](self, "_isFullyAutomaticFocusAndExposure"))
    {
LABEL_5:
      LOBYTE(v3) = 0;
      return v3;
    }
    v3 = -[CAMPreviewViewController isShowingPointIndicator](self, "isShowingPointIndicator");
    if (v3)
      LOBYTE(v3) = !-[CUCaptureController isCapturingTimelapse](self->__captureController, "isCapturingTimelapse");
  }
  return v3;
}

- (BOOL)_isFullyAutomaticFocusAndExposure
{
  return -[CAMPreviewViewController _isFullyAutomaticFocus:andExposure:](self, "_isFullyAutomaticFocus:andExposure:", self->__lastFocusResult, self->__lastExposureResult);
}

- (BOOL)_isFullyAutomaticFocus:(id)a3 andExposure:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 1;
  if (!v6 || !v7)
    goto LABEL_12;
  if (objc_msgSend(v6, "deviceSupportsFocus"))
  {
    if (objc_msgSend(v6, "focusMode") != 3)
    {
LABEL_11:
      v9 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v6, "pointOfInterest");
    v9 = 0;
    if (v11 != 0.5 || v10 != 0.5)
      goto LABEL_12;
  }
  if (objc_msgSend(v8, "exposureMode") != 2)
    goto LABEL_11;
  objc_msgSend(v8, "pointOfInterest");
  v9 = 0;
  if (v13 == 0.5 && v12 == 0.5)
  {
    objc_msgSend(v8, "exposureTargetBias");
    v9 = -[CAMPreviewViewController _isExposureTargetBiasAtBaseline:](self, "_isExposureTargetBiasAtBaseline:");
  }
LABEL_12:

  return v9;
}

- (void)notifyShutterButtonPressed
{
  -[CUCaptureController cancelDelayedFocusAndExposureReset](self->__captureController, "cancelDelayedFocusAndExposureReset");
}

- (void)notifyWillStartCapturing
{
  unint64_t v3;
  void *v4;

  v3 = -[CAMPreviewViewController _mode](self, "_mode");
  if (v3 <= 9)
  {
    if (((1 << v3) & 0x251) != 0)
    {
      -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v4, 0);

      -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("face"), 0);
    }
    else if (v3 == 3)
    {
      -[CAMPreviewViewController _hideAllFocusIndicatorsAnimated:](self, "_hideAllFocusIndicatorsAnimated:", 0);
    }
  }
}

- (double)captureControllerDelayBeforeResettingFocusAndExposureAfterCapture:(id)a3
{
  unint64_t v4;
  double result;
  float v6;
  BOOL v7;

  v4 = -[CAMPreviewViewController _mode](self, "_mode", a3);
  result = 0.0;
  if (v4 <= 9 && ((1 << v4) & 0x251) != 0)
  {
    -[CAMPreviewViewController cachedExposureTargetBias](self, "cachedExposureTargetBias", 0.0);
    v7 = v6 == 0.0;
    result = 1.0;
    if (!v7)
      return 1.5;
  }
  return result;
}

- (void)notifyDidStopCapture
{
  unint64_t v3;
  char v4;
  char v5;
  id v6;

  v3 = -[CAMPreviewViewController _mode](self, "_mode");
  if (v3 <= 8 && ((1 << v3) & 0x187) != 0)
  {
    -[CAMPreviewViewController _captureController](self, "_captureController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isCapturingVideo");
    v5 = objc_msgSend(v6, "isCapturingBurst");
    if ((v4 & 1) == 0 && (v5 & 1) == 0)
      -[CAMPreviewViewController _resetFaceTracking](self, "_resetFaceTracking");

  }
}

- (BOOL)captureController:(id)a3 shouldResetFocusAndExposureForReason:(int64_t)a4
{
  BOOL v6;
  BOOL result;

  v6 = -[CAMPreviewViewController _isFocusAndExposureLockedByUserOrExternally](self, "_isFocusAndExposureLockedByUserOrExternally", a3);
  switch(a4)
  {
    case 0:
      if (v6)
        goto LABEL_4;
      result = -[CAMPreviewViewController _shouldResetFocusAndExposureForSubjectAreaDidChange](self, "_shouldResetFocusAndExposureForSubjectAreaDidChange");
      break;
    case 1:
      result = (v6 | -[CAMPreviewViewController _isFullyAutomaticFocusAndExposure](self, "_isFullyAutomaticFocusAndExposure")) ^ 1;
      break;
    case 2:
    case 3:
      result = !v6;
      break;
    default:
LABEL_4:
      result = 0;
      break;
  }
  return result;
}

- (void)_applicationDidEnterBackground
{
  -[CAMPreviewViewController _hideAllFocusIndicatorsAnimated:](self, "_hideAllFocusIndicatorsAnimated:", 0);
  -[CAMPreviewViewController _setUserLockedFocusAndExposure:shouldAnimate:](self, "_setUserLockedFocusAndExposure:shouldAnimate:", 0, 0);
}

- (void)_hideAllFocusIndicatorsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v5, v3);

  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v6, v3);

  -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("face"), v3);
  -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("MRC"), v3);
  -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("textRegion"), v3);
  -[CAMPreviewViewController _hidePortraitModeTrackedSubjectIndicatorsAnimated:](self, "_hidePortraitModeTrackedSubjectIndicatorsAnimated:", v3);
  -[CAMPreviewViewController _hideAllCinematicIndicatorsAnimated:](self, "_hideAllCinematicIndicatorsAnimated:", v3);
  -[CAMPreviewViewController _updateCinematicModeViewsForTrackingChange](self, "_updateCinematicModeViewsForTrackingChange");
}

- (void)_setUserLockedFocusAndExposure:(BOOL)a3 shouldAnimate:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  if (self->__userLockedFocusAndExposure != a3)
  {
    v4 = a4;
    self->__userLockedFocusAndExposure = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "previewViewControllerDidChangeFocusOrExposureLocked:shouldAnimate:", self, v4);

  }
}

- (void)notifyCaptureSessionDidStopRunning
{
  -[CAMPreviewViewController _hidePortraitModeTrackedSubjectIndicatorsAnimated:](self, "_hidePortraitModeTrackedSubjectIndicatorsAnimated:", 0);
  -[CAMPreviewViewController _hideAllCinematicIndicatorsAnimated:](self, "_hideAllCinematicIndicatorsAnimated:", 0);
  -[CAMPreviewViewController _resetFaceTracking](self, "_resetFaceTracking");
}

- (CAMPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[CAMPreviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return -[CAMPreviewViewController initWithCaptureController:motionController:timelapseController:](self, "initWithCaptureController:motionController:timelapseController:", 0, 0, 0);
}

- (CAMPreviewViewController)initWithCoder:(id)a3
{
  -[CAMPreviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return -[CAMPreviewViewController initWithCaptureController:motionController:timelapseController:](self, "initWithCaptureController:motionController:timelapseController:", 0, 0, 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[CUCaptureController setFocusDelegate:](self->__captureController, "setFocusDelegate:", 0);
  -[CUCaptureController setExposureDelegate:](self->__captureController, "setExposureDelegate:", 0);
  -[CAMFocusIndicatorView setDelegate:](self->__continuousIndicator, "setDelegate:", 0);
  -[CAMFocusIndicatorView setDelegate:](self->__pointIndicator, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewController;
  -[CAMPreviewViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewController;
  -[CAMPreviewViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CAMPreviewViewController _cancelDelayedActions](self, "_cancelDelayedActions");
}

- (void)_cancelDelayedActions
{
  -[CAMPreviewViewController _cancelDelayedFocusAndExposureLock](self, "_cancelDelayedFocusAndExposureLock");
  -[CAMPreviewViewController _cancelDelayedFadeOutOfViewType:](self, "_cancelDelayedFadeOutOfViewType:", CFSTR("face"));
  -[CAMPreviewViewController _cancelDelayedFadeOutOfViewType:](self, "_cancelDelayedFadeOutOfViewType:", CFSTR("MRC"));
  -[CAMPreviewViewController _cancelDelayedFadeOutOfViewType:](self, "_cancelDelayedFadeOutOfViewType:", CFSTR("textRegion"));
  -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", self->__continuousIndicator);
  -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", self->__pointIndicator);
  -[CUCaptureController cancelDelayedFocusAndExposureReset](self->__captureController, "cancelDelayedFocusAndExposureReset");
}

- (void)_createPointIndicatorIfNecessary
{
  CAMFocusIndicatorView *v3;
  CAMFocusIndicatorView *pointIndicator;
  id v5;

  if (!self->__pointIndicator)
  {
    v3 = -[CAMFocusIndicatorView initWithStyle:]([CAMFocusIndicatorView alloc], "initWithStyle:", -[CAMPreviewViewController _styleForPointIndicator](self, "_styleForPointIndicator"));
    pointIndicator = self->__pointIndicator;
    self->__pointIndicator = v3;

    -[CAMFocusIndicatorView setDelegate:](self->__pointIndicator, "setDelegate:", self);
    -[CAMPreviewViewController previewView](self, "previewView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPointIndicator:", self->__pointIndicator);
    -[CAMPreviewViewController _initializeExposureBiasParametersForFocusIndicatorView:](self, "_initializeExposureBiasParametersForFocusIndicatorView:", self->__pointIndicator);

  }
}

- (void)_createStageLightOverlayViewIfNeededWillAnimate:(BOOL)a3
{
  _BOOL4 v3;
  CAMStageLightOverlayView *v5;
  CAMStageLightOverlayView *stageLightOverlayView;
  CAMStageLightOverlayView *v7;
  void *v8;
  id v9;

  if (!self->__stageLightOverlayView)
  {
    v3 = a3;
    v5 = objc_alloc_init(CAMStageLightOverlayView);
    stageLightOverlayView = self->__stageLightOverlayView;
    self->__stageLightOverlayView = v5;

    -[CAMStageLightOverlayView setVisible:](self->__stageLightOverlayView, "setVisible:", 0);
    v7 = self->__stageLightOverlayView;
    -[CAMPreviewViewController previewView](self, "previewView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStageLightOverlayView:", v7);

    if (v3)
    {
      -[CAMPreviewViewController previewView](self, "previewView");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "layoutIfNeeded");

    }
  }
}

- (int64_t)_devicePosition
{
  void *v2;
  int64_t v3;

  -[CAMPreviewViewController _graphConfiguration](self, "_graphConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "devicePosition");

  return v3;
}

- (void)willChangeToGraphConfiguration:(id)a3
{
  -[CAMPreviewViewController _setGraphConfiguration:](self, "_setGraphConfiguration:", a3);
  -[CAMPreviewViewController _willChangeGraphConfiguration](self, "_willChangeGraphConfiguration");
}

- (void)didChangeToGraphConfiguration:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _BOOL8 v7;
  void *v8;
  id v9;

  v4 = a4;
  v6 = a3;
  -[CAMPreviewViewController _setGraphConfiguration:](self, "_setGraphConfiguration:", v6);
  -[CAMPreviewViewController _didChangeGraphConfigurationAnimated:](self, "_didChangeGraphConfigurationAnimated:", v4);
  v7 = objc_msgSend(v6, "mode") == 4;
  -[CAMPreviewViewController previewView](self, "previewView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "videoPreviewView");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSquare:animated:", v7, v4);
  -[CAMPreviewViewController _updatePreviewViewAspectMode](self, "_updatePreviewViewAspectMode");
  -[CAMPreviewViewController _updatePreviewIndicatorClippingStyleForGraphConfiguration:](self, "_updatePreviewIndicatorClippingStyleForGraphConfiguration:", v6);

}

- (void)_willChangeGraphConfiguration
{
  -[CAMPreviewViewController _setChangingGraphConfiguration:](self, "_setChangingGraphConfiguration:", 1);
  -[CAMPreviewViewController _resetCachedTimes](self, "_resetCachedTimes");
  -[CAMPreviewViewController _hideAllFocusIndicatorsAnimated:](self, "_hideAllFocusIndicatorsAnimated:", 0);
  -[CAMPreviewViewController _resetFaceTracking](self, "_resetFaceTracking");
}

- (void)_didChangeGraphConfigurationAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CAMPreviewViewController _setChangingGraphConfiguration:](self, "_setChangingGraphConfiguration:", 0);
  -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", v3);
}

- (void)_resetCachedTimes
{
  -[CAMPreviewViewController _setLastTapToFocusTime:](self, "_setLastTapToFocusTime:", 0);
  -[CAMPreviewViewController _setLastExposureBiasModifiedTime:](self, "_setLastExposureBiasModifiedTime:", 0);
  -[CAMPreviewViewController _setLastFocusIndictorStartTime:](self, "_setLastFocusIndictorStartTime:", 0);
}

- (void)_createAspectRatioToggleDoubleTapGestureRecognizerIfNecessary
{
  UITapGestureRecognizer *v3;
  UITapGestureRecognizer *aspectRatioToggleDoubleTapGestureRecognizer;
  id v5;

  if (!self->__aspectRatioToggleDoubleTapGestureRecognizer)
  {
    v3 = (UITapGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleAspectRatioToggleDoubleTap_);
    aspectRatioToggleDoubleTapGestureRecognizer = self->__aspectRatioToggleDoubleTapGestureRecognizer;
    self->__aspectRatioToggleDoubleTapGestureRecognizer = v3;

    -[UITapGestureRecognizer setCancelsTouchesInView:](self->__aspectRatioToggleDoubleTapGestureRecognizer, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer setDelaysTouchesEnded:](self->__aspectRatioToggleDoubleTapGestureRecognizer, "setDelaysTouchesEnded:", 0);
    -[UITapGestureRecognizer setNumberOfTapsRequired:](self->__aspectRatioToggleDoubleTapGestureRecognizer, "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setDelegate:](self->__aspectRatioToggleDoubleTapGestureRecognizer, "setDelegate:", self);
    -[CAMPreviewViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addGestureRecognizer:", self->__aspectRatioToggleDoubleTapGestureRecognizer);

  }
}

- (void)_updateForOrientationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[CAMPreviewViewController _updateExposureBiasPanGestureRecognizerForOrientation](self, "_updateExposureBiasPanGestureRecognizerForOrientation");
  -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", v3);
  -[CAMPreviewViewController _updateMRCIndicatorsIfNecessaryAnimated:](self, "_updateMRCIndicatorsIfNecessaryAnimated:", v3);
  -[CAMPreviewViewController previewView](self, "previewView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOrientation:animated:", -[CAMPreviewViewController _interfaceOrientation](self, "_interfaceOrientation"), v3);

}

uint64_t __55__CAMPreviewViewController__setFocusIndicatorsPulsing___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setPulsing:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_scalePortraitModeFocusIndicators
{
  void *v3;
  void *v4;
  id v5;

  if (!-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI")
    && -[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls"))
  {
    if (-[CAMPreviewViewController _shouldShowPortraitModeIndicatorViews](self, "_shouldShowPortraitModeIndicatorViews"))
    {
      -[CAMPreviewViewController _portraitModeCenteredIndicatorView](self, "_portraitModeCenteredIndicatorView");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startScalingWithExpansionWidth:duration:repeatCount:", 2, 8.0, 0.35);
      -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("portraitSubject"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_52);
    }
  }
}

uint64_t __61__CAMPreviewViewController__scalePortraitModeFocusIndicators__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "startScalingWithExpansionWidth:duration:repeatCount:", 2, 10.0, 0.35);
}

uint64_t __57__CAMPreviewViewController__hideFocusIndicator_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllAnimations:", 1);
}

- (BOOL)_isShowingFocusIndicator:(id)a3
{
  double v3;

  objc_msgSend(a3, "alpha");
  return v3 > 0.0;
}

- (BOOL)_isShowingContinuousIndicator
{
  CAMPreviewViewController *v2;
  void *v3;

  v2 = self;
  -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CAMPreviewViewController _isShowingFocusIndicator:](v2, "_isShowingFocusIndicator:", v3);

  return (char)v2;
}

- (BOOL)isShowingPointIndicator
{
  CAMPreviewViewController *v2;
  void *v3;

  v2 = self;
  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CAMPreviewViewController _isShowingFocusIndicator:](v2, "_isShowingFocusIndicator:", v3);

  return (char)v2;
}

- (void)_activateFocusIndicator:(id)a3
{
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", v4);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__CAMPreviewViewController__activateFocusIndicator___block_invoke;
    aBlock[3] = &unk_1EA328868;
    v7 = v4;
    v5 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v5, 0, 0.25, 0.0);

  }
}

uint64_t __52__CAMPreviewViewController__activateFocusIndicator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_deactivateFocusIndicator:(id)a3 afterDelay:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (v6)
  {
    v7 = v6;
    -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", v6);
    objc_msgSend(v7, "setPulsing:", 0);
    if (a4 <= 0.0)
      -[CAMPreviewViewController _deactivateFocusIndicator:](self, "_deactivateFocusIndicator:", v7);
    else
      -[CAMPreviewViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__deactivateFocusIndicator_, v7, a4);
    v6 = v7;
  }

}

- (void)_deactivateFocusIndicator:(id)a3
{
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", v4);
    objc_msgSend(v4, "setPulsing:", 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__CAMPreviewViewController__deactivateFocusIndicator___block_invoke;
    aBlock[3] = &unk_1EA328868;
    v7 = v4;
    v5 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v5, 0, 0.25, 0.0);

  }
}

uint64_t __54__CAMPreviewViewController__deactivateFocusIndicator___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "alpha");
  if (v3 > 0.0)
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.36);
  return result;
}

- (CGPoint)pointOfInterestInNormalizedCaptureDeviceSpace
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  -[CAMPreviewViewController previewView](self, "previewView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.5;
  v6 = 0.5;
  if (-[CAMPreviewViewController isShowingPointIndicator](self, "isShowingPointIndicator"))
  {
    objc_msgSend(v4, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "center");
    objc_msgSend(v7, "convertPoint:toView:", v3);
    v9 = v8;
    v11 = v10;

    objc_msgSend(v3, "captureDevicePointOfInterestForPoint:", v9, v11);
    v6 = v12;
    v5 = v13;
  }

  v14 = v6;
  v15 = v5;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)_showIndicatorAtPointOfInterest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  CAMPreviewViewController *v21;
  _QWORD v22[5];
  id v23;

  y = a3.y;
  x = a3.x;
  if (!-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI"))
  {
    if (-[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls"))
    {
      -[CAMPreviewViewController _createPointIndicatorIfNecessary](self, "_createPointIndicatorIfNecessary");
      -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __60__CAMPreviewViewController__showIndicatorAtPointOfInterest___block_invoke;
      v22[3] = &unk_1EA328A40;
      v22[4] = self;
      v9 = v6;
      v23 = v9;
      objc_msgSend(v8, "performWithoutAnimation:", v22);
      -[CAMPreviewViewController previewView](self, "previewView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indicatePointOfInterest:", x, y);
      -[CAMPreviewViewController _hideAllFocusIndicatorsExceptForIndicator:](self, "_hideAllFocusIndicatorsExceptForIndicator:", v9);
      -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", v9);
      -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("face"), 1);
      -[CAMPreviewViewController _hidePortraitModeTrackedSubjectIndicatorsAnimated:](self, "_hidePortraitModeTrackedSubjectIndicatorsAnimated:", 1);
      objc_msgSend(v9, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_opacity);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAnimationForKey:", v12);

      objc_msgSend(v9, "startScalingWithExpansionWidth:duration:repeatCount:", 1, 37.0, 0.2);
      objc_msgSend(v9, "setPulsing:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPreviewViewController _setLastFocusIndictorStartTime:](self, "_setLastFocusIndictorStartTime:", v13);

      v16 = v7;
      v17 = 3221225472;
      v18 = __60__CAMPreviewViewController__showIndicatorAtPointOfInterest___block_invoke_2;
      v19 = &unk_1EA328A40;
      v20 = v9;
      v21 = self;
      v14 = v9;
      v15 = _Block_copy(&v16);
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v15, 0, 0.25, 0.0, v16, v17, v18, v19);

    }
  }
}

uint64_t __60__CAMPreviewViewController__showIndicatorAtPointOfInterest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setStyle:", objc_msgSend(*(id *)(a1 + 32), "_styleForPointIndicator"));
  objc_msgSend(*(id *)(a1 + 40), "setShowExposureBias:", objc_msgSend(*(id *)(a1 + 32), "_showExposureBiasSliderForPointView"));
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setInactive:", objc_msgSend(*(id *)(a1 + 32), "_shouldShowIndicatorsAsInactive"));
}

uint64_t __60__CAMPreviewViewController__showIndicatorAtPointOfInterest___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "_updatePortraitModeViewsAnimated:", 1);
}

- (int64_t)_styleForPointIndicator
{
  if (-[CAMPreviewViewController _mode](self, "_mode") == 6)
    return 3;
  else
    return 1;
}

- (int64_t)_largeStyleForPointIndicator
{
  return 2 * (-[CAMPreviewViewController _mode](self, "_mode") == 6);
}

- (void)_showLockedAtPointOfInterest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  CAMPreviewViewController *v21;
  _QWORD v22[5];
  id v23;

  y = a3.y;
  x = a3.x;
  if (!-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI"))
  {
    if (-[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls"))
    {
      -[CAMPreviewViewController _createPointIndicatorIfNecessary](self, "_createPointIndicatorIfNecessary");
      -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MEMORY[0x1E0C809B0];
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __57__CAMPreviewViewController__showLockedAtPointOfInterest___block_invoke;
      v22[3] = &unk_1EA328A40;
      v22[4] = self;
      v9 = v6;
      v23 = v9;
      objc_msgSend(v8, "performWithoutAnimation:", v22);
      -[CAMPreviewViewController _hideAllFocusIndicatorsExceptForIndicator:](self, "_hideAllFocusIndicatorsExceptForIndicator:", v9);
      -[CAMPreviewViewController _cancelDelayedHideOrDeactivateForFocusIndicator:](self, "_cancelDelayedHideOrDeactivateForFocusIndicator:", v9);
      -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("face"), 1);
      -[CAMPreviewViewController _hidePortraitModeTrackedSubjectIndicatorsAnimated:](self, "_hidePortraitModeTrackedSubjectIndicatorsAnimated:", 1);
      -[CAMPreviewViewController previewView](self, "previewView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "indicatePointOfInterest:", x, y);
      objc_msgSend(v9, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_opacity);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeAnimationForKey:", v12);

      objc_msgSend(v9, "setPulsing:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPreviewViewController _setLastFocusIndictorStartTime:](self, "_setLastFocusIndictorStartTime:", v13);

      v16 = v7;
      v17 = 3221225472;
      v18 = __57__CAMPreviewViewController__showLockedAtPointOfInterest___block_invoke_2;
      v19 = &unk_1EA328A40;
      v20 = v9;
      v21 = self;
      v14 = v9;
      v15 = _Block_copy(&v16);
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 2, v15, 0, 0.25, 0.0, v16, v17, v18, v19);

    }
  }
}

uint64_t __57__CAMPreviewViewController__showLockedAtPointOfInterest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setStyle:", objc_msgSend(*(id *)(a1 + 32), "_largeStyleForPointIndicator"));
  objc_msgSend(*(id *)(a1 + 40), "setShowExposureBias:", 0);
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setInactive:", objc_msgSend(*(id *)(a1 + 32), "_shouldShowIndicatorsAsInactive"));
}

uint64_t __57__CAMPreviewViewController__showLockedAtPointOfInterest___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "_updatePortraitModeViewsAnimated:", 1);
}

- (void)_finishFocusingLockedPointOfInterestIndicator
{
  id v2;

  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startScalingWithExpansionWidth:duration:repeatCount:", 2, 31.0, 0.3);
  objc_msgSend(v2, "setPulsing:", 0);

}

- (void)_scaleDownLockedPointOfInterest
{
  int64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  v3 = -[CAMPreviewViewController _styleForPointIndicator](self, "_styleForPointIndicator");
  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__CAMPreviewViewController__scaleDownLockedPointOfInterest__block_invoke;
  v5[3] = &unk_1EA328F00;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  objc_msgSend(v4, "setStyle:animated:completion:", v3, 1, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

void __59__CAMPreviewViewController__scaleDownLockedPointOfInterest__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setShowExposureBias:", objc_msgSend(*(id *)(a1 + 32), "_showExposureBiasSliderForPointView"));

}

- (void)_fadeInView:(id)a3 withDuration:(double)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__CAMPreviewViewController__fadeInView_withDuration___block_invoke;
  v7[3] = &unk_1EA328868;
  v8 = v5;
  v6 = v5;
  +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 6, v7, 0, a4);

}

uint64_t __53__CAMPreviewViewController__fadeInView_withDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_fadeOutView:(id)a3 withDuration:(double)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v7 = a3;
  v11 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__CAMPreviewViewController__fadeOutView_withDuration_completion___block_invoke;
  v12[3] = &unk_1EA328868;
  v13 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__CAMPreviewViewController__fadeOutView_withDuration_completion___block_invoke_2;
  v10[3] = &unk_1EA32A6A8;
  v8 = v11;
  v9 = v7;
  +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", 6, v12, v10, a4);

}

uint64_t __65__CAMPreviewViewController__fadeOutView_withDuration_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __65__CAMPreviewViewController__fadeOutView_withDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- ($47F04D41692EFD9158D1690A2BC73353)_geometryAnimationParametersForViewType:(SEL)a3
{
  id v6;
  int v7;
  int v8;
  double v9;
  double v10;
  double v11;
  $47F04D41692EFD9158D1690A2BC73353 *result;
  double v13;
  double v14;

  v6 = a4;
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("textRegion"));
  v8 = objc_msgSend(v6, "isEqual:", CFSTR("MRC"));

  v9 = 0.6;
  if (v8)
    v9 = 0.15;
  if (v7)
    v10 = 0.3;
  else
    v10 = 0.4;
  if (v7)
    v11 = 0.3;
  else
    v11 = v9;
  result = ($47F04D41692EFD9158D1690A2BC73353 *)-[CAMPreviewViewController _disableIndicatorGeometryAnimations](self, "_disableIndicatorGeometryAnimations", v9);
  v13 = 0.0;
  if ((_DWORD)result)
    v14 = 0.0;
  else
    v14 = v10;
  if (!(_DWORD)result)
    v13 = v11;
  retstr->var0.var0 = v13;
  retstr->var0.var1 = 2;
  retstr->var0.var2 = (v7 | v8) ^ 1;
  *(_DWORD *)(&retstr->var0.var2 + 1) = 0;
  *((_DWORD *)&retstr->var0.var2 + 1) = 0;
  *(_OWORD *)&retstr->var0.var3 = xmmword_1DB9A7C50;
  retstr->var1.var0 = v14;
  *(_OWORD *)&retstr->var1.var1 = xmmword_1DB9A7C60;
  *(_OWORD *)&retstr->var1.var3 = xmmword_1DB9A7C50;
  return result;
}

- (void)_animateIfNeededWithParameters:(id *)a3 animations:(id)a4 completion:(id)a5
{
  double var0;

  var0 = a3->var0;
  if (a3->var2)
    +[CAMView animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](CAMView, "animateIfNeededWithDuration:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", a3->var1, a4, a5, var0, a3->var3, a3->var4);
  else
    +[CAMView animateIfNeededWithDuration:options:animations:completion:](CAMView, "animateIfNeededWithDuration:options:animations:completion:", a3->var1, a4, a5, var0);
}

- (void)_animateView:(id)a3 type:(id)a4 withCenter:(CGPoint)a5 bounds:(CGRect)a6 transform:(CGAffineTransform *)a7
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v12;
  CGFloat v13;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[3];
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  CGFloat v43;
  CGFloat v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[6];

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v12 = a5.y;
  v13 = a5.x;
  v16 = a3;
  v46 = 0u;
  memset(v47, 0, sizeof(v47));
  v45 = 0u;
  -[CAMPreviewViewController _geometryAnimationParametersForViewType:](self, "_geometryAnimationParametersForViewType:", a4);
  v17 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __74__CAMPreviewViewController__animateView_type_withCenter_bounds_transform___block_invoke;
  v41[3] = &unk_1EA32B498;
  v18 = v16;
  v42 = v18;
  v43 = v13;
  v44 = v12;
  v38 = v45;
  v39 = v46;
  v40 = v47[0];
  -[CAMPreviewViewController _animateIfNeededWithParameters:animations:completion:](self, "_animateIfNeededWithParameters:animations:completion:", &v38, v41, 0);
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKeyPath:", CFSTR("transform.rotation.z"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  v22 = v21;

  v23 = atan2(a7->b, a7->a);
  v24 = vabdd_f64(v23, v22);
  if (v24 <= vabdd_f64(v23, v22 + 1.57079633) && v24 <= vabdd_f64(v23, v22 + -1.57079633))
  {
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __74__CAMPreviewViewController__animateView_type_withCenter_bounds_transform___block_invoke_2;
    v28[3] = &unk_1EA32D7B8;
    v29 = v18;
    v30 = x;
    v31 = y;
    v32 = width;
    v33 = height;
    v27 = *(_OWORD *)&a7->c;
    v34 = *(_OWORD *)&a7->a;
    v35 = v27;
    v36 = *(_OWORD *)&a7->tx;
    v38 = *(_OWORD *)&v47[1];
    v39 = *(_OWORD *)&v47[3];
    v40 = v47[5];
    -[CAMPreviewViewController _animateIfNeededWithParameters:animations:completion:](self, "_animateIfNeededWithParameters:animations:completion:", &v38, v28, 0);

  }
  else
  {
    v25 = *(_OWORD *)&a7->c;
    v37[0] = *(_OWORD *)&a7->a;
    v26 = *(_OWORD *)&a7->tx;
    v37[1] = v25;
    v37[2] = v26;
    objc_msgSend(v18, "setTransform:", v37);
    objc_msgSend(v18, "setBounds:", x, y, width, height);
  }

}

uint64_t __74__CAMPreviewViewController__animateView_type_withCenter_bounds_transform___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __74__CAMPreviewViewController__animateView_type_withCenter_bounds_transform___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[3];

  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(_OWORD *)(a1 + 88);
  v4[0] = *(_OWORD *)(a1 + 72);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 104);
  objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)_updatePreviewIndicatorClippingStyleForGraphConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "mode");
  v7 = objc_msgSend(v4, "device");

  LODWORD(v4) = objc_msgSend(v5, "spatialOverCaptureSupportForMode:device:", v6, v7);
  -[CAMPreviewViewController previewView](self, "previewView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIndicatorClippingStyle:", ~(v4 >> 1) & 1);

}

- (void)_addIndicatorView:(id)a3 forType:(id)a4 identifier:(id)a5 underlyingMetadataObject:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v10);

    }
    -[NSObject objectForKeyedSubscript:](v13, "objectForKeyedSubscript:", v11);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15 && v15 != v9)
    {
      objc_msgSend(v15, "removeFromSuperview");
      v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138543618;
        v21 = v10;
        v22 = 2114;
        v23 = v11;
        _os_log_impl(&dword_1DB760000, v17, OS_LOG_TYPE_DEFAULT, "Removed an existing client-managed view that shares the same identifier as a view that is being added (type/identifier: %{public}@/%{public}@", (uint8_t *)&v20, 0x16u);
      }

    }
    -[CAMPreviewViewController previewView](self, "previewView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "indicatorContainerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v9);

    -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v9, v11);
  }
  else
  {
    v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      _os_log_impl(&dword_1DB760000, v13, OS_LOG_TYPE_DEFAULT, "Trying to add nil view for type/identifier: %{public}@/%{public}@", (uint8_t *)&v20, 0x16u);
    }
  }

}

- (void)_removeIndicatorViewForType:(id)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeFromSuperview");
  objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v6);

  v11 = objc_msgSend(v8, "count");
  if (v9 == 1 && !v11 && objc_msgSend(v12, "isEqualToString:", CFSTR("portraitSubject")))
    -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", 1);

}

- (void)_fadeOutAndRemoveIndicatorView:(id)a3 forType:(id)a4 identifier:(id)a5 withDuration:(double)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  _QWORD v15[4];
  id v16;
  CAMPreviewViewController *v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[CAMPreviewViewController _metadataObjectsForView](self, "_metadataObjectsForView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v10);

  objc_msgSend(v10, "alpha");
  if (v14 != 0.0)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __91__CAMPreviewViewController__fadeOutAndRemoveIndicatorView_forType_identifier_withDuration___block_invoke;
    v15[3] = &unk_1EA3290F0;
    v16 = v10;
    v17 = self;
    v18 = v11;
    v19 = v12;
    -[CAMPreviewViewController _fadeOutView:withDuration:completion:](self, "_fadeOutView:withDuration:completion:", v16, v15, a6);

  }
}

uint64_t __91__CAMPreviewViewController__fadeOutAndRemoveIndicatorView_forType_identifier_withDuration___block_invoke(uint64_t a1)
{
  uint64_t result;
  double v3;

  result = objc_msgSend(*(id *)(a1 + 32), "alpha");
  if (v3 == 0.0)
    return objc_msgSend(*(id *)(a1 + 40), "_removeIndicatorViewForType:identifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

- (void)_fadeOutAndRemoveIndicatorViewsOfType:(id)a3 withDuration:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;

  v6 = a3;
  -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "copy");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__CAMPreviewViewController__fadeOutAndRemoveIndicatorViewsOfType_withDuration___block_invoke;
  v11[3] = &unk_1EA32F1E8;
  v11[4] = self;
  v12 = v6;
  v13 = a4;
  v9 = v6;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v11);

}

uint64_t __79__CAMPreviewViewController__fadeOutAndRemoveIndicatorViewsOfType_withDuration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fadeOutAndRemoveIndicatorView:forType:identifier:withDuration:", a3, *(_QWORD *)(a1 + 40), a2, *(double *)(a1 + 48));
}

- (void)_updateIndicatorsForMetadataObjectResults:(id)a3 allowNewAndReappearingIndicators:(BOOL)a4 viewType:(id)a5 viewClass:(Class)a6 geometryCallback:(id)a7 minimumAreaChangeThreshold:(double)a8 minimumAreaFractionChangeThreshold:(double)a9
{
  -[CAMPreviewViewController _updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:viewInitializerCallback:](self, "_updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:viewInitializerCallback:", a3, a4, a5, a6, a7, 0, a8, a9);
}

- (void)_updateIndicatorsForMetadataObjectResults:(id)a3 allowNewAndReappearingIndicators:(BOOL)a4 viewType:(id)a5 viewClass:(Class)a6 geometryCallback:(id)a7 minimumAreaChangeThreshold:(double)a8 minimumAreaFractionChangeThreshold:(double)a9 viewInitializerCallback:(id)a10
{
  id v14;
  id v15;
  void (**v16)(_OWORD *__return_ptr, id, void *);
  void (**v17)(void);
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t j;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  id v66;
  void (**v70)(void);
  id obj;
  id v72;
  uint64_t v73;
  void *v74;
  _BOOL4 v75;
  _OWORD v76[3];
  _OWORD v77[3];
  _OWORD v78[3];
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _QWORD v86[4];
  id v87;
  CAMPreviewViewController *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v75 = a4;
  v96 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = (void (**)(_OWORD *__return_ptr, id, void *))a7;
  v17 = (void (**)(void))a10;
  v18 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v91 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * i), "uniqueIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "addObject:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v90, v95, 16);
    }
    while (v21);
  }
  v70 = v17;

  -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v15);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v26, "copy");

  v86[0] = MEMORY[0x1E0C809B0];
  v86[1] = 3221225472;
  v86[2] = __225__CAMPreviewViewController__updateIndicatorsForMetadataObjectResults_allowNewAndReappearingIndicators_viewType_viewClass_geometryCallback_minimumAreaChangeThreshold_minimumAreaFractionChangeThreshold_viewInitializerCallback___block_invoke;
  v86[3] = &unk_1EA32F210;
  v66 = v18;
  v87 = v66;
  v88 = self;
  v72 = v15;
  v89 = v72;
  v74 = v27;
  objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v86);
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v19;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
  if (v28)
  {
    v29 = v28;
    v73 = *(_QWORD *)v83;
    v30 = *MEMORY[0x1E0C9D648];
    v31 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v83 != v73)
          objc_enumerationMutation(obj);
        v33 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
        objc_msgSend(v33, "uniqueIdentifier", v66);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = 0u;
        v81 = 0u;
        v79 = 0u;
        memset(v78, 0, sizeof(v78));
        v16[2](v78, v16, v33);
        UIRectCenteredAboutPointScale();
        v36 = v35;
        v38 = v37;
        v40 = v39;
        v42 = v41;
        -[CAMPreviewViewController previewView](self, "previewView");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMPreviewViewController previewView](self, "previewView");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "indicatorContainerView");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "convertRect:toView:", v45, v36, v38, v40, v42);
        v47 = v46;
        v49 = v48;
        v51 = v50;
        v53 = v52;

        objc_msgSend(v74, "objectForKeyedSubscript:", v34);
        v54 = objc_claimAutoreleasedReturnValue();
        if (v54)
          v55 = 1;
        else
          v55 = !v75;
        if (v55)
        {
          v56 = (void *)v54;
          if (v54)
          {
            UIRectGetCenter();
            v58 = v57;
            v60 = v59;
            objc_msgSend(v56, "bounds");
            v62 = v61;
            v64 = v63;
            if (!-[CAMPreviewViewController _shouldUpdateIndicatorSizeFrom:to:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:](self, "_shouldUpdateIndicatorSizeFrom:to:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:", v61, v63, v51, v53, a8, a9))
            {
              v51 = v62;
              v53 = v64;
            }
            if (v75)
              -[CAMPreviewViewController _fadeInView:withDuration:](self, "_fadeInView:withDuration:", v56, 0.25);
            v76[0] = v79;
            v76[1] = v80;
            v76[2] = v81;
            -[CAMPreviewViewController _animateView:type:withCenter:bounds:transform:](self, "_animateView:type:withCenter:bounds:transform:", v56, v72, v76, v58, v60, v30, v31, v51, v53);
          }
        }
        else
        {
          v56 = (void *)objc_msgSend([a6 alloc], "initWithFrame:", v47, v49, v51, v53);
          if (v70)
            v70[2]();
          v77[0] = v79;
          v77[1] = v80;
          v77[2] = v81;
          objc_msgSend(v56, "setTransform:", v77);
          objc_msgSend(v56, "layoutIfNeeded");
          -[CAMPreviewViewController _addIndicatorView:forType:identifier:underlyingMetadataObject:](self, "_addIndicatorView:forType:identifier:underlyingMetadataObject:", v56, v72, v34, v33);
          objc_msgSend(v56, "setAlpha:", 0.0);
          -[CAMPreviewViewController _fadeInView:withDuration:](self, "_fadeInView:withDuration:", v56, 0.25);
        }
        -[CAMPreviewViewController _metadataObjectsForView](self, "_metadataObjectsForView");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "setObject:forKey:", v33, v56);

      }
      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v94, 16);
    }
    while (v29);
  }

}

void __225__CAMPreviewViewController__updateIndicatorsForMetadataObjectResults_allowNewAndReappearingIndicators_viewType_viewClass_geometryCallback_minimumAreaChangeThreshold_minimumAreaFractionChangeThreshold_viewInitializerCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "_fadeOutAndRemoveIndicatorView:forType:identifier:withDuration:", v5, *(_QWORD *)(a1 + 48), v6, 0.15);

}

- (BOOL)_isShowingIndicatorsOfType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "count") != 0;
  return (char)v5;
}

- (void)_fadeOutIndicatorsOfViewType:(id)a3 afterDelay:(double)a4
{
  _BOOL4 v6;
  BOOL v7;
  id v8;

  v8 = a3;
  v6 = -[CAMPreviewViewController _disableDelayedFadeOutForFaces](self, "_disableDelayedFadeOutForFaces");
  v7 = a4 <= 0.0 || !v6;
  if (v7 || (objc_msgSend(v8, "isEqualToString:", CFSTR("face")) & 1) == 0)
  {
    -[CAMPreviewViewController _cancelDelayedFadeOutOfViewType:](self, "_cancelDelayedFadeOutOfViewType:", v8);
    -[CAMPreviewViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__fadeOutIndicatorsOfViewType_, v8, a4);
  }

}

- (void)_cancelDelayedFadeOutOfViewType:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__fadeOutIndicatorsOfViewType_, v4);

}

- (void)_fadeOutIndicatorsOfViewType:(id)a3
{
  -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", a3, 1);
}

- (void)_hideIndicatorsOfViewType:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  double v6;
  id v7;

  v4 = a4;
  v7 = a3;
  -[CAMPreviewViewController _cancelDelayedFadeOutOfViewType:](self, "_cancelDelayedFadeOutOfViewType:", v7);
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("face")))
    -[CAMPreviewViewController _setShouldSuppressExistingFaceIndicators:](self, "_setShouldSuppressExistingFaceIndicators:", 1);
  v6 = 0.0;
  if (v4)
    v6 = 0.75;
  -[CAMPreviewViewController _fadeOutAndRemoveIndicatorViewsOfType:withDuration:](self, "_fadeOutAndRemoveIndicatorViewsOfType:withDuration:", v7, v6);

}

- (BOOL)_shouldSuppressNewFaces
{
  CAMPreviewViewController *v2;
  void *v3;
  BOOL v4;

  v2 = self;
  -[CAMPreviewViewController _captureController](self, "_captureController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CAMPreviewViewController isShowingPointIndicator](v2, "isShowingPointIndicator");
  LOBYTE(v2) = -[CAMPreviewViewController _isFocusAndExposureLockedByUserOrExternally](v2, "_isFocusAndExposureLockedByUserOrExternally");
  LOBYTE(v2) = v4 | v2 | objc_msgSend(v3, "isCapturingVideo");

  return (char)v2;
}

- (void)captureController:(id)a3 didOutputFaceResults:(id)a4 headResults:(id)a5 bodyResults:(id)a6 salientObjectResults:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v18 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a7;
  if (!-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI")
    && -[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls"))
  {
    if (objc_msgSend(v18, "count") && objc_msgSend(v12, "count"))
    {
      objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v12);
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v18, "count"))
    {
      v14 = v18;
    }
    else
    {
      v14 = v12;
    }
    v15 = v14;
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v13);
      v16 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v16;
    }
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(v15, "arrayByAddingObjectsFromArray:", v11);
      v17 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v17;
    }
    if (-[CAMPreviewViewController _shouldAllowFaceIndicators](self, "_shouldAllowFaceIndicators"))
      -[CAMPreviewViewController _updateFaceIndicatorsForResults:](self, "_updateFaceIndicatorsForResults:", v15);
    -[CAMPreviewViewController _updatePortraitModeViewsForResults:](self, "_updatePortraitModeViewsForResults:", v15);
    -[CAMPreviewViewController _updateCinematicModeViewsForResults:](self, "_updateCinematicModeViewsForResults:", v15);

  }
}

- (void)_updateFaceIndicatorsForResults:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  -[CAMPreviewViewController _graphConfiguration](self, "_graphConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "mode");

  if (v7
    || !-[CAMPreviewViewController shouldUsePortraitStyleIndicatorsInPhotoMode](self, "shouldUsePortraitStyleIndicatorsInPhotoMode"))
  {
    v8 = 0;
  }
  else
  {
    -[CAMPreviewViewController _cancelDelayedFadeOutOfViewType:](self, "_cancelDelayedFadeOutOfViewType:", CFSTR("face"));
    v8 = 1;
  }
  if (-[CAMPreviewViewController _currentFacesCount](self, "_currentFacesCount") != v5)
  {
    if (-[CAMPreviewViewController _shouldSuppressNewFaces](self, "_shouldSuppressNewFaces"))
    {
      -[CAMPreviewViewController _setCurrentFacesCount:](self, "_setCurrentFacesCount:", 0);
    }
    else
    {
      -[CAMPreviewViewController _setShouldSuppressExistingFaceIndicators:](self, "_setShouldSuppressExistingFaceIndicators:", 0);
      -[CAMPreviewViewController _setCurrentFacesCount:](self, "_setCurrentFacesCount:", v5);
      if ((v8 & 1) == 0)
        -[CAMPreviewViewController _fadeOutIndicatorsOfViewType:afterDelay:](self, "_fadeOutIndicatorsOfViewType:afterDelay:", CFSTR("face"), 1.5);
    }
  }
  v9 = -[CAMPreviewViewController _shouldSuppressExistingFaceIndicators](self, "_shouldSuppressExistingFaceIndicators") ^ 1;
  v10 = objc_opt_class();
  v12[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__CAMPreviewViewController__updateFaceIndicatorsForResults___block_invoke;
  v13[3] = &unk_1EA32F238;
  v13[4] = self;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__CAMPreviewViewController__updateFaceIndicatorsForResults___block_invoke_2;
  v12[3] = &unk_1EA32F260;
  -[CAMPreviewViewController _updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:viewInitializerCallback:](self, "_updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:viewInitializerCallback:", v4, v9, CFSTR("face"), v10, v13, v12, 2500.0, 0.21);

  if (!-[CAMPreviewViewController _shouldSuppressExistingFaceIndicators](self, "_shouldSuppressExistingFaceIndicators"))
  {
    if (v5)
    {
      -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v11, 0);

    }
  }
}

void __60__CAMPreviewViewController__updateFaceIndicatorsForResults___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = *(void **)(a1 + 32);
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v15;
    objc_msgSend(v6, "previewView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "faceIndicatorFrameForFaceResult:", v7);
    v10 = v9;
    v12 = v11;

  }
  else
  {
    objc_msgSend(v6, "previewView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frameForMetadataObjectResult:", v15);
    v10 = v13;
    v12 = v14;
  }

  CAMViewGeometryForFrame(a3, v10, v12);
}

void __60__CAMPreviewViewController__updateFaceIndicatorsForResults___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = a2;
  if (objc_msgSend(v2, "shouldUsePortraitStyleIndicatorsInPhotoMode"))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v4, "setShape:shouldUseCrosshairForAnimation:animated:", v3, 0, 0);

}

- (void)setShouldUsePortraitStyleIndicatorsInPhotoMode:(BOOL)a3
{
  void *v4;
  uint64_t v5;

  if (self->_shouldUsePortraitStyleIndicatorsInPhotoMode != a3)
  {
    self->_shouldUsePortraitStyleIndicatorsInPhotoMode = a3;
    if (a3)
      -[CAMPreviewViewController _setCurrentFacesCount:](self, "_setCurrentFacesCount:", 0);
    else
      -[CAMPreviewViewController _fadeOutIndicatorsOfViewType:afterDelay:](self, "_fadeOutIndicatorsOfViewType:afterDelay:", CFSTR("face"), 1.5);
    -[CAMPreviewViewController _graphConfiguration](self, "_graphConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mode");

    if (!v5)
      -[CAMPreviewViewController _updatePhotoModeIndicatorsStyle](self, "_updatePhotoModeIndicatorsStyle");
  }
}

- (void)_updatePhotoModeIndicatorsStyle
{
  void *v3;
  id v4;
  _QWORD v5[5];

  -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("face"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__CAMPreviewViewController__updatePhotoModeIndicatorsStyle__block_invoke;
  v5[3] = &unk_1EA32F288;
  v5[4] = self;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __59__CAMPreviewViewController__updatePhotoModeIndicatorsStyle__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "shouldUsePortraitStyleIndicatorsInPhotoMode"))
      v4 = 2;
    else
      v4 = 1;
    objc_msgSend(v5, "setShape:shouldUseCrosshairForAnimation:animated:", v4, 0, 1);
  }

}

- (BOOL)_shouldAllowFaceIndicators
{
  unint64_t v2;

  v2 = -[CAMPreviewViewController _mode](self, "_mode");
  return (v2 < 0xA) & (0x33Fu >> v2);
}

- (BOOL)_shouldShowCinematicModeIndicatorViews
{
  int64_t v3;
  _BOOL4 v4;

  v3 = -[CAMPreviewViewController _mode](self, "_mode");
  v4 = !-[CAMPreviewViewController _isChangingGraphConfiguration](self, "_isChangingGraphConfiguration");
  return v3 == 7 && v4;
}

- (void)_updateCinematicModeViewsForResults:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  _QWORD aBlock[5];
  id v12;
  id v13;

  v4 = a3;
  if (-[CAMPreviewViewController _shouldShowCinematicModeIndicatorViews](self, "_shouldShowCinematicModeIndicatorViews"))
  {
    v12 = 0;
    v13 = 0;
    -[CAMPreviewViewController _subjectGroupResultsFromMetadataObjects:nonFixedFocusResults:fixedFocusResults:](self, "_subjectGroupResultsFromMetadataObjects:nonFixedFocusResults:fixedFocusResults:", v4, &v13, &v12);
    v5 = v13;
    v6 = v12;
    v7 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CAMPreviewViewController__updateCinematicModeViewsForResults___block_invoke;
    aBlock[3] = &unk_1EA32F238;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __64__CAMPreviewViewController__updateCinematicModeViewsForResults___block_invoke_2;
    v10[3] = &unk_1EA32F238;
    v10[4] = self;
    v9 = _Block_copy(v10);
    -[CAMPreviewViewController _updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:](self, "_updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:", v5, 1, CFSTR("cinematicSubject"), objc_opt_class(), v8, 2500.0, 0.21);
    -[CAMPreviewViewController _updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:](self, "_updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:", v6, 1, CFSTR("cinematicFixedFocus"), objc_opt_class(), v9, 2500.0, 0.21);
    -[CAMPreviewViewController _updateCinematicModeViewsForTrackingChange](self, "_updateCinematicModeViewsForTrackingChange");

  }
}

void __64__CAMPreviewViewController__updateCinematicModeViewsForResults___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "previewView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0D030], "minimumSuggestedBounds");
  objc_msgSend(v12, "frameForSubjectGroupResult:minimumSize:", v5, v6, v7);
  v9 = v8;
  v11 = v10;

  CAMViewGeometryForFrame(a3, v9, v11);
}

void __64__CAMPreviewViewController__updateCinematicModeViewsForResults___block_invoke_2(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "previewView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frameForMetadataObjectResult:fixedSize:", v5, 75.0, 75.0);
  v7 = v6;
  v9 = v8;

  CAMViewGeometryForFrame(a3, v7, v9);
}

- (void)_subjectGroupResultsFromMetadataObjects:(id)a3 nonFixedFocusResults:(id *)a4 fixedFocusResults:(id *)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v25[4];
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        -[CAMPreviewViewController _groupIDForMetadataObject:](self, "_groupIDForMetadataObject:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v7, "objectForKeyedSubscript:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v13);
        }
        else
        {
          v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v13, 0);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v14);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v10);
  }

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __107__CAMPreviewViewController__subjectGroupResultsFromMetadataObjects_nonFixedFocusResults_fixedFocusResults___block_invoke;
  v25[3] = &unk_1EA32F2B0;
  v26 = v21;
  v27 = v22;
  v17 = v22;
  v18 = v21;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v25);
  v19 = objc_retainAutorelease(v18);
  *a5 = v19;
  v20 = objc_retainAutorelease(v17);
  *a4 = v20;

}

void __107__CAMPreviewViewController__subjectGroupResultsFromMetadataObjects_nonFixedFocusResults_fixedFocusResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  CAMSubjectGroupResult *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  CAMSubjectGroupResult *v11;

  v5 = a3;
  v6 = a2;
  v7 = [CAMSubjectGroupResult alloc];
  v8 = objc_msgSend(v6, "integerValue");

  v11 = -[CAMSubjectGroupResult initWithMetadataObjects:groupID:](v7, "initWithMetadataObjects:groupID:", v5, v8);
  v9 = -[CAMSubjectGroupResult syntheticFocusMode](v11, "syntheticFocusMode");
  v10 = 32;
  if ((v9 & 4) == 0)
    v10 = 40;
  objc_msgSend(*(id *)(a1 + v10), "addObject:", v11);

}

- (id)_groupIDForMetadataObject:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];

  objc_msgSend(a3, "underlyingMetadataObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v3, "groupID") != -1)
  {
    v4 = objc_msgSend(v3, "groupID");
LABEL_6:
    v5 = v4;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "faceID");
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v3, "bodyID") + 1000;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(v3, "objectID") + 2000;
    }
    else
    {
      v5 = arc4random_uniform(0x3E8u);
      v6 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1DB760000, v6, OS_LOG_TYPE_DEFAULT, "Trying to group a metadata object that is not a body, assigning a random groupID", v9, 2u);
      }

    }
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_cinematicModeIndicatorViewAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t i;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat width;
  CGFloat height;
  double v29;
  double v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;
  CGRect v43;
  CGRect v44;

  y = a3.y;
  x = a3.x;
  v42 = *MEMORY[0x1E0C80C00];
  if (-[CAMPreviewViewController _shouldShowCinematicModeIndicatorViews](self, "_shouldShowCinematicModeIndicatorViews"))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cinematicSubject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMPreviewViewController previewView](self, "previewView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewViewController previewView](self, "previewView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "indicatorContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertPoint:toView:", v11, x, y);
    v13 = v12;
    v15 = v14;

    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __63__CAMPreviewViewController__cinematicModeIndicatorViewAtPoint___block_invoke;
    v37[3] = &unk_1EA32F2D8;
    v39 = v13;
    v40 = v15;
    v16 = v6;
    v38 = v16;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v37);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v17 = v16;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v21 = *(_QWORD *)v34;
      v22 = 1.79769313e308;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v34 != v21)
            objc_enumerationMutation(v17);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v24, "frame", (_QWORD)v33);
          v25 = v43.origin.x;
          v26 = v43.origin.y;
          width = v43.size.width;
          height = v43.size.height;
          v29 = CGRectGetWidth(v43);
          v44.origin.x = v25;
          v44.origin.y = v26;
          v44.size.width = width;
          v44.size.height = height;
          v30 = v29 * CGRectGetHeight(v44);
          if (v22 > v30)
          {
            v31 = v24;

            v20 = v31;
            v22 = v30;
          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }
  return v20;
}

void __63__CAMPreviewViewController__cinematicModeIndicatorViewAtPoint___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  CGRect v5;

  v4 = a3;
  objc_msgSend(v4, "frame");
  if (CGRectContainsPoint(v5, *(CGPoint *)(a1 + 40)))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (void)_updateCinematicModeViewsForTrackingChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  int v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  if (-[CAMPreviewViewController _shouldShowCinematicModeIndicatorViews](self, "_shouldShowCinematicModeIndicatorViews"))
  {
    -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("cinematicSubject"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("cinematicFixedFocus"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
    objc_msgSend(v7, "addEntriesFromDictionary:", v6);
    -[CAMPreviewViewController _metadataObjectsForView](self, "_metadataObjectsForView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__28;
    v36 = __Block_byref_object_dispose__28;
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Tracking %ld cinematic subject indicators\n"), objc_msgSend(v10, "count"));
    v37 = (id)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70__CAMPreviewViewController__updateCinematicModeViewsForTrackingChange__block_invoke;
    v19[3] = &unk_1EA32F300;
    v11 = v8;
    v20 = v11;
    v21 = &v28;
    v22 = &v32;
    v23 = &v24;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v19);
    if ((objc_msgSend((id)v33[5], "isEqualToString:", cinematicLogString) & 1) == 0)
    {
      objc_storeStrong((id *)&cinematicLogString, (id)v33[5]);
      v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v39 = cinematicLogString;
        _os_log_impl(&dword_1DB760000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@\n", buf, 0xCu);
      }

    }
    v13 = *((unsigned __int8 *)v29 + 24);
    v14 = *((unsigned __int8 *)v25 + 24);
    if (*((_BYTE *)v29 + 24))
      v15 = v14 == 0;
    else
      v15 = 0;
    v16 = v15;
    -[CAMPreviewViewController _setCinematicSubjectIsTrackingLocked:shouldAnimate:](self, "_setCinematicSubjectIsTrackingLocked:shouldAnimate:", v16, 1);
    if (v13)
      v17 = v14 == 0;
    else
      v17 = 1;
    v18 = !v17;
    -[CAMPreviewViewController _setCinematicIsFixedFocusLocked:shouldAnimate:](self, "_setCinematicIsFixedFocusLocked:shouldAnimate:", v18, 1);

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);

  }
  else
  {
    -[CAMPreviewViewController _setCinematicSubjectIsTrackingLocked:shouldAnimate:](self, "_setCinematicSubjectIsTrackingLocked:shouldAnimate:", 0, 1);
    -[CAMPreviewViewController _setCinematicIsFixedFocusLocked:shouldAnimate:](self, "_setCinematicIsFixedFocusLocked:shouldAnimate:", 0, 1);
  }
}

void __70__CAMPreviewViewController__updateCinematicModeViewsForTrackingChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  char v5;
  _BOOL4 v6;
  BOOL v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "syntheticFocusMode");
    v6 = (v5 & 1) == 0;
    v7 = (v5 & 4) == 0;
    v8 = 1;
    if ((v5 & 2) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      v8 = 0;
    }
  }
  else
  {
    v7 = 1;
    v8 = 1;
    v6 = 1;
  }
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v4, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "underlyingMetadataObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("%@ type:%@ "), v10, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

  if (v7)
  {
    v16 = 2;
    if (v6)
      v16 = 0;
    v17 = CFSTR("is Primary Cinematic Subject with soft focus");
    if (v6)
      v17 = CFSTR("is inactive indicator");
    if (v8)
      v18 = v16;
    else
      v18 = 1;
    if (v8)
      v19 = (__CFString *)v17;
    else
      v19 = CFSTR("is Primary Cinematic Subject with hard focus");
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v20 = CFSTR("is hard fixed focus point");
    if (v8)
      v20 = CFSTR("is soft fixed focus point");
    v19 = v20;
    v18 = 0;
  }
  objc_msgSend(v24, "setHidden:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_22;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = 3;
LABEL_22:
    objc_msgSend(v24, "setShape:animated:", v18, 1);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "stringByAppendingFormat:", CFSTR("%@\n"), v19);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

}

- (void)_updatePortraitModeViewsForResults:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;
  double v7;
  double v8;
  uint64_t v9;
  _QWORD v10[5];
  BOOL v11;

  v4 = a3;
  if (-[CAMPreviewViewController _shouldShowPortraitModeIndicatorViews](self, "_shouldShowPortraitModeIndicatorViews"))
  {
    if (!-[CAMPreviewViewController _shouldSuppressNewPortraitModeTrackedSubjectIndicators](self, "_shouldSuppressNewPortraitModeTrackedSubjectIndicators"))
    {
      v5 = objc_msgSend(v4, "count");
      v6 = v5 < 2;
      if (v5 >= 2)
        v7 = 2500.0;
      else
        v7 = 0.0;
      if (v5 >= 2)
        v8 = 0.21;
      else
        v8 = 0.0;
      v9 = objc_opt_class();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __63__CAMPreviewViewController__updatePortraitModeViewsForResults___block_invoke;
      v10[3] = &unk_1EA32F328;
      v11 = v6;
      v10[4] = self;
      -[CAMPreviewViewController _updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:](self, "_updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:", v4, 1, CFSTR("portraitSubject"), v9, v10, v7, v8);
    }
    -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", 1);
  }

}

void __63__CAMPreviewViewController__updatePortraitModeViewsForResults___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  id v16;

  v16 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v16;
    v6 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "previewView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
      objc_msgSend(v7, "fixedSizeSubjectIndicatorFrameForFaceResult:", v5);
    else
      objc_msgSend(v7, "faceIndicatorFrameForFaceResult:", v5);
LABEL_10:
    v14 = v9;
    v15 = v10;

    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v16;
    v12 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "previewView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13;
    if (v12)
      objc_msgSend(v13, "fixedSizeSubjectIndicatorFrameForBodyResult:", v11);
    else
      objc_msgSend(v13, "frameForMetadataObjectResult:", v11);
    goto LABEL_10;
  }
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 24);
LABEL_11:
  CAMViewGeometryForFrame(a3, v14, v15);

}

- (BOOL)_shouldUpdateIndicatorSizeFrom:(CGSize)a3 to:(CGSize)a4 minimumAreaChangeThreshold:(double)a5 minimumAreaFractionChangeThreshold:(double)a6
{
  double v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  _BOOL4 v11;

  v6 = a3.width * a3.height;
  v7 = a4.width * a4.height;
  v8 = a6 + 1.0;
  v9 = v6 <= 0.0 || v7 / v6 >= v8;
  v10 = vabdd_f64(v7, v6);
  v11 = v7 > 0.0 && v6 / v7 >= v8;
  if (v10 < a5)
    return 0;
  if (v11)
    return 1;
  return v9;
}

- (void)_hidePortraitModeTrackedSubjectIndicatorsAnimated:(BOOL)a3
{
  -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("portraitSubject"), a3);
}

- (void)setCachedMRCResults:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_cachedMRCResults != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cachedMRCResults, a3);
    -[CAMPreviewViewController _updateMRCIndicatorsIfNecessaryAnimated:](self, "_updateMRCIndicatorsIfNecessaryAnimated:", 0);
    v5 = v6;
  }

}

- (void)setCachedSignificantMRCResult:(id)a3
{
  CAMMachineReadableCodeResult *v5;
  CAMMachineReadableCodeResult *v6;

  v5 = (CAMMachineReadableCodeResult *)a3;
  if (self->_cachedSignificantMRCResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cachedSignificantMRCResult, a3);
    -[CAMPreviewViewController _updateMRCIndicatorsIfNecessaryAnimated:](self, "_updateMRCIndicatorsIfNecessaryAnimated:", 0);
    -[CAMPreviewViewController _updateTextRegionIndicatorsIfNecessary](self, "_updateTextRegionIndicatorsIfNecessary");
    v5 = v6;
  }

}

- (BOOL)_shouldAllowMRCIndicators
{
  return (-[CAMPreviewViewController _mode](self, "_mode") & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (void)_updateMRCIndicatorsIfNecessaryAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI")
    && -[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls"))
  {
    if (-[CAMPreviewViewController _shouldAllowMRCIndicators](self, "_shouldAllowMRCIndicators"))
    {
      -[CAMPreviewViewController _updateMRCIndicatorsAnimated:](self, "_updateMRCIndicatorsAnimated:", v3);
      -[CAMPreviewViewController _fadeOutIndicatorsOfViewType:afterDelay:](self, "_fadeOutIndicatorsOfViewType:afterDelay:", CFSTR("MRC"), 0.3);
    }
  }
}

- (void)_updateMRCIndicatorsAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  _QWORD v24[4];
  __CFString *v25;
  CAMPreviewViewController *v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[CAMPreviewViewController cachedSignificantMRCResult](self, "cachedSignificantMRCResult", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "uniqueIdentifier");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1EA3325A0;
  }
  -[CAMPreviewViewController cachedSignificantTextRegionResult](self, "cachedSignificantTextRegionResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[CAMPreviewViewController cachedMRCResults](self, "cachedMRCResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  v11 = v9;
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "uniqueIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "isEqualToString:", v6))
        {
          v17 = objc_msgSend(v15, "isOfSignificantSize");

          if (v17)
          {
            v32 = v15;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_19;
          }
        }
        else
        {

        }
      }
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v12);
    v11 = v9;
  }
LABEL_19:

  v18 = objc_opt_class();
  v19 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __57__CAMPreviewViewController__updateMRCIndicatorsAnimated___block_invoke;
  v27[3] = &unk_1EA32F238;
  v27[4] = self;
  -[CAMPreviewViewController _updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:](self, "_updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:", v11, 1, CFSTR("MRC"), v18, v27, 0.0, 0.0);
  -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("MRC"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v21, "copy");

  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __57__CAMPreviewViewController__updateMRCIndicatorsAnimated___block_invoke_2;
  v24[3] = &unk_1EA32F350;
  v25 = v6;
  v26 = self;
  v23 = v6;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v24);

}

void __57__CAMPreviewViewController__updateMRCIndicatorsAnimated___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "previewView");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frameForMetadataObjectResult:", v5);
  v7 = v6;
  v9 = v8;

  CAMViewGeometryForFrame(a3, v7, v9);
}

void __57__CAMPreviewViewController__updateMRCIndicatorsAnimated___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = a2;
  v6 = objc_msgSend(v13, "isInactive");
  v7 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  objc_msgSend(v13, "setInactive:", v7 ^ 1u);
  if (v6 && v7)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isImageAnalysisSupported"))
      v9 = 1;
    else
      v9 = 2;

    objc_msgSend(v13, "startScalingWithExpansionWidth:duration:repeatCount:", v9, 10.0, 0.2);
  }
  if (v7)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = sel__handleSignificantMRCIndicatorButtonTapped_;
    v12 = v13;
  }
  else
  {
    v12 = v13;
    v10 = 0;
    v11 = 0;
  }
  objc_msgSend(v12, "setTitleTarget:action:", v10, v11);

}

- (void)_handleSignificantMRCIndicatorButtonTapped:(id)a3
{
  void *v4;
  id v5;

  -[CAMPreviewViewController delegate](self, "delegate", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController cachedSignificantMRCResult](self, "cachedSignificantMRCResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previewViewController:didSelectMRCResult:", self, v4);

}

- (BOOL)_mrcIndicatorButtonContainsTouch:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char v11;

  v4 = a3;
  -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MRC"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMPreviewViewController cachedSignificantMRCResult](self, "cachedSignificantMRCResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
    objc_msgSend(v4, "locationInView:", v10);
    v11 = objc_msgSend(v10, "pointInside:withEvent:", 0);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)setCachedSignificantTextRegionResult:(id)a3
{
  CAMTextRegionResult *v5;
  CAMTextRegionResult *v6;

  v5 = (CAMTextRegionResult *)a3;
  if (self->_cachedSignificantTextRegionResult != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cachedSignificantTextRegionResult, a3);
    -[CAMPreviewViewController _updateTextRegionIndicatorsIfNecessary](self, "_updateTextRegionIndicatorsIfNecessary");
    -[CAMPreviewViewController _updateMRCIndicatorsIfNecessaryAnimated:](self, "_updateMRCIndicatorsIfNecessaryAnimated:", 0);
    v5 = v6;
  }

}

- (void)setCachedTextRegionResults:(id)a3
{
  NSArray *v5;
  NSArray *v6;

  v5 = (NSArray *)a3;
  if (self->_cachedTextRegionResults != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cachedTextRegionResults, a3);
    -[CAMPreviewViewController _updateTextRegionIndicatorsIfNecessary](self, "_updateTextRegionIndicatorsIfNecessary");
    v5 = v6;
  }

}

- (void)_updateTextRegionIndicatorsIfNecessary
{
  if (!-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI")
    && -[CAMPreviewViewController isShowingStandardControls](self, "isShowingStandardControls"))
  {
    if (-[CAMPreviewViewController _shouldAllowTextRegionIndicators](self, "_shouldAllowTextRegionIndicators"))
    {
      -[CAMPreviewViewController _updateTextRegionIndicators](self, "_updateTextRegionIndicators");
      -[CAMPreviewViewController _fadeOutIndicatorsOfViewType:afterDelay:](self, "_fadeOutIndicatorsOfViewType:afterDelay:", CFSTR("textRegion"), 0.3);
    }
  }
}

- (BOOL)_shouldAllowTextRegionIndicators
{
  void *v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isImageAnalysisSupportedForMode:devicePosition:", -[CAMPreviewViewController _mode](self, "_mode"), -[CAMPreviewViewController _devicePosition](self, "_devicePosition"));

  return (char)self;
}

- (void)_updateTextRegionIndicators
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  _QWORD v28[4];
  __CFString *v29;
  _BYTE v30[128];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[CAMPreviewViewController cachedSignificantTextRegionResult](self, "cachedSignificantTextRegionResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "uniqueIdentifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1EA3325A0;
  }
  -[CAMPreviewViewController cachedSignificantMRCResult](self, "cachedSignificantMRCResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[CAMPreviewViewController cachedTextRegionResults](self, "cachedTextRegionResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "imageAnalysisShowsInactiveTextRegions");

  v10 = MEMORY[0x1E0C809B0];
  if ((v9 & 1) == 0)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __55__CAMPreviewViewController__updateTextRegionIndicators__block_invoke;
    v28[3] = &unk_1EA32F378;
    v29 = v5;
    v11 = objc_msgSend(v7, "indexOfObjectPassingTest:", v28);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL || !v7)
    {

      v7 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }

  }
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __55__CAMPreviewViewController__updateTextRegionIndicators__block_invoke_2;
  v27[3] = &unk_1EA32F238;
  v27[4] = self;
  -[CAMPreviewViewController _updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:](self, "_updateIndicatorsForMetadataObjectResults:allowNewAndReappearingIndicators:viewType:viewClass:geometryCallback:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:", v7, 1, CFSTR("textRegion"), objc_opt_class(), v27, 0.0, 0.0);
  if (v9)
  {
    -[CAMPreviewViewController _indicatorViewsByType](self, "_indicatorViewsByType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("textRegion"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "objectForKeyedSubscript:", v21, (_QWORD)v23);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setInactive:", objc_msgSend(v21, "isEqualToString:", v5) ^ 1);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
      }
      while (v18);
    }

  }
}

uint64_t __55__CAMPreviewViewController__updateTextRegionIndicators__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __55__CAMPreviewViewController__updateTextRegionIndicators__block_invoke_2(uint64_t a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  __int128 v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "previewView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frameForTextRegionResult:", v5);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "viewportFrame");
  v22 = CGRectInset(v19, 3.0, 3.0);
  v20.origin.x = v8;
  v20.origin.y = v10;
  v20.size.width = v12;
  v20.size.height = v14;
  v21 = CGRectIntersection(v20, v22);
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  objc_msgSend(v5, "baselineAngle", CAMViewGeometryForFrame((uint64_t)a3, v21.size.width, v21.size.height).n128_f64[0]);
  v16 = v15;

  CGAffineTransformMakeRotation(&v18, -v16);
  v17 = *(_OWORD *)&v18.c;
  a3[3] = *(_OWORD *)&v18.a;
  a3[4] = v17;
  a3[5] = *(_OWORD *)&v18.tx;

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  UITapGestureRecognizer *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  CGPoint v26;
  CGRect v27;

  v4 = (UITapGestureRecognizer *)a3;
  -[CAMPreviewViewController _captureController](self, "_captureController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCapturingLowLightImage");

  if ((v6 & 1) != 0)
  {
    LOBYTE(self) = 0;
  }
  else if ((UITapGestureRecognizer *)self->__exposureBiasPanGestureRecognizer == v4)
  {
    -[CAMPreviewViewController previewView](self, "previewView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pointIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CAMPreviewViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "previewViewControllerShouldRestrictExposureBiasPanToTouchesNearSlider:", self);

    if (v8 && v10)
    {
      -[UITapGestureRecognizer locationInView:](v4, "locationInView:", v7);
      v12 = v11;
      v14 = v13;
      objc_msgSend(v7, "pointIndicator");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "boundsIncludingExposureBiasSlider");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;

      objc_msgSend(v7, "pointIndicator");
      v24 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "convertRect:fromView:", v24, v17, v19, v21, v23);

      UIRectCenteredIntegralRectScale();
      v26.x = v12;
      v26.y = v14;
      LODWORD(v24) = CGRectContainsPoint(v27, v26);
      LODWORD(self) = -[CAMPreviewViewController _canModifyExposureBias](self, "_canModifyExposureBias", 0) & v24;
    }
    else
    {
      LOBYTE(self) = -[CAMPreviewViewController _canModifyExposureBias](self, "_canModifyExposureBias");
    }

  }
  else if (self->__tapToFocusAndExposeGestureRecognizer == v4
         || (UITapGestureRecognizer *)self->__longPressToLockGestureRecognizer == v4)
  {
    LOBYTE(self) = -[CAMPreviewViewController _allowUserToChangeFocusAndExposure](self, "_allowUserToChangeFocusAndExposure");
  }
  else if (self->__aspectRatioToggleDoubleTapGestureRecognizer == v4)
  {
    LODWORD(self) = !-[CAMPreviewViewController _shouldDisableAspectRatioToggle](self, "_shouldDisableAspectRatioToggle");
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  UITapGestureRecognizer *v6;
  id v7;
  UITapGestureRecognizer *aspectRatioToggleDoubleTapGestureRecognizer;
  int v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  char v15;
  CGPoint v17;
  CGRect v18;
  CGRect v19;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = a4;
  if (self->__tapToFocusAndExposeGestureRecognizer == v6
    || (UITapGestureRecognizer *)self->__longPressToLockGestureRecognizer == v6
    || (aspectRatioToggleDoubleTapGestureRecognizer = self->__aspectRatioToggleDoubleTapGestureRecognizer,
        aspectRatioToggleDoubleTapGestureRecognizer == v6))
  {
    -[CAMPreviewViewController previewView](self, "previewView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationInView:", v10);
    v12 = v11;
    v14 = v13;
    objc_msgSend(v10, "bounds");
    v19 = CGRectInset(v18, 10.0, 10.0);
    v17.x = v12;
    v17.y = v14;
    v9 = CGRectContainsPoint(v19, v17);

    aspectRatioToggleDoubleTapGestureRecognizer = self->__aspectRatioToggleDoubleTapGestureRecognizer;
  }
  else
  {
    v9 = 1;
  }
  if (aspectRatioToggleDoubleTapGestureRecognizer == v6)
    v9 &= ~-[CAMPreviewViewController _shouldDisableAspectRatioToggle](self, "_shouldDisableAspectRatioToggle");
  v15 = v9 & ~-[CAMPreviewViewController _mrcIndicatorButtonContainsTouch:](self, "_mrcIndicatorButtonContainsTouch:", v7);

  return v15;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  UITapGestureRecognizer *v6;
  UITapGestureRecognizer *v7;
  id WeakRetained;
  char v9;
  _BOOL4 v10;

  v6 = (UITapGestureRecognizer *)a3;
  v7 = (UITapGestureRecognizer *)a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(WeakRetained, "previewViewController:gestureRecognizer:shouldRequireFailureOfGestureRecognizer:", self, v6, v7);

  if ((v9 & 1) != 0)
  {
    LOBYTE(v10) = 1;
  }
  else if (self->__tapToFocusAndExposeGestureRecognizer == v6
         && self->__aspectRatioToggleDoubleTapGestureRecognizer == v7)
  {
    v10 = !-[CAMPreviewViewController _shouldDisableAspectRatioToggle](self, "_shouldDisableAspectRatioToggle");
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_allowUserToChangeFocusAndExposure
{
  _BOOL4 v3;

  v3 = -[CUCaptureController shouldAllowUserToChangeFocusAndExposure](self->__captureController, "shouldAllowUserToChangeFocusAndExposure");
  if (v3)
  {
    if (-[CAMPreviewViewController _shouldDisableFocusUI](self, "_shouldDisableFocusUI"))
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = !-[CAMPreviewViewController isFocusAndExposureExternallyLocked](self, "isFocusAndExposureExternallyLocked");
  }
  return v3;
}

- (BOOL)_focusOnPoint:(CGPoint)a3 shouldShowFocusAndExposureIndicator:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  int v15;
  CUCaptureController *captureController;
  double v17;
  BOOL v18;
  NSObject *v19;
  const char *v20;
  uint8_t *v21;
  __int16 v23;
  __int16 v24;
  CGPoint v25;
  CGRect v26;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  if (-[CAMPreviewViewController _allowUserToChangeFocusAndExposure](self, "_allowUserToChangeFocusAndExposure"))
  {
    -[CAMPreviewViewController previewView](self, "previewView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v25.x = x;
    v25.y = y;
    if (CGRectContainsPoint(v26, v25))
    {
      objc_msgSend(v8, "captureDevicePointOfInterestForPoint:", x, y);
      if (v9 >= 0.0)
      {
        v11 = v9;
        if (v9 <= 1.0)
        {
          v12 = v10;
          if (v10 >= 0.0 && v10 <= 1.0)
          {
            -[CAMPreviewViewController _setUserLockedFocusAndExposure:](self, "_setUserLockedFocusAndExposure:", 0);
            objc_msgSend(MEMORY[0x1E0C99D68], "date");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[CAMPreviewViewController _setLastTapToFocusTime:](self, "_setLastTapToFocusTime:", v13);

            +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isTapToExposeSupportedForMode:", -[CAMPreviewViewController _mode](self, "_mode"));

            captureController = self->__captureController;
            if (v15)
              -[CUCaptureController focusAndExposeAtPoint:lockFocus:resetExposureTargetBias:](captureController, "focusAndExposeAtPoint:lockFocus:resetExposureTargetBias:", 1, 1, v11, v12);
            else
              -[CUCaptureController focusAtPoint:lockFocus:](captureController, "focusAtPoint:lockFocus:", 1, v11, v12);
            if (v4)
              -[CAMPreviewViewController _showIndicatorAtPointOfInterest:](self, "_showIndicatorAtPointOfInterest:", v11, v12);
            LODWORD(v17) = 0;
            -[CAMPreviewViewController setCachedExposureTargetBias:](self, "setCachedExposureTargetBias:", v17);
            v18 = 1;
            goto LABEL_16;
          }
        }
      }
      v19 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v23 = 0;
        v20 = "Ignoring tap outside of the preview layer area";
        v21 = (uint8_t *)&v23;
        goto LABEL_14;
      }
    }
    else
    {
      v19 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 0;
        v20 = "Ignoring tap outside of the preview view bounds";
        v21 = (uint8_t *)&v24;
LABEL_14:
        _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, v20, v21, 2u);
      }
    }

    v18 = 0;
LABEL_16:

    return v18;
  }
  return 0;
}

- (BOOL)_setCinematicFocusForMetadataObject:(id)a3 atPoint:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  BOOL v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  BOOL v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  __CFString *v35;
  __CFString *v36;
  void *v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  __CFString *v44;
  __int16 v45;
  __CFString *v46;
  __int16 v47;
  __CFString *v48;
  uint64_t v49;
  CGPoint v50;
  CGPoint v51;
  CGPoint v52;
  CGPoint v53;

  v6 = a6;
  v7 = a5;
  y = a4.y;
  x = a4.x;
  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  -[CAMPreviewViewController previewView](self, "previewView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "captureDevicePointOfInterestForPoint:", x, y);
  v15 = v13;
  v16 = v13 < 0.0 || v13 > 1.0;
  if (v16 || ((v17 = v14, v14 >= 0.0) ? (v18 = v14 > 1.0) : (v18 = 1), v18))
  {
    v19 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring tap request for cinematic tracker outside of the preview layer area", buf, 2u);
    }

    v20 = 0;
  }
  else
  {
    v21 = os_log_create("com.apple.camera", "Camera");
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v22)
      {
        objc_msgSend(v11, "description");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v50.x = x;
        v50.y = y;
        NSStringFromCGPoint(v50);
        v24 = objc_claimAutoreleasedReturnValue();
        v38 = (void *)v24;
        v51.x = v15;
        v51.y = v17;
        NSStringFromCGPoint(v51);
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v26 = CFSTR("YES");
        if (!v7)
          v26 = CFSTR("NO");
        v27 = v26;
        v28 = CFSTR("YES");
        if (!v6)
          v28 = CFSTR("NO");
        *(_DWORD *)buf = 138544386;
        v40 = v23;
        v41 = 2114;
        v42 = v24;
        v43 = 2114;
        v44 = v25;
        v45 = 2114;
        v46 = v27;
        v47 = 2114;
        v48 = v28;
        v29 = v48;
        _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "Cinematic: Tapped on CinematicSubjectView, attempting to set cinematic focus on:%{public}@ at point:%{public}@, normalized point:%{public}@, useFixedOpticalFocus:%{public}@, hardFocus:%{public}@", buf, 0x34u);

      }
      -[CAMPreviewViewController _captureController](self, "_captureController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", v11, v7, v6, v15, v17);
    }
    else
    {
      if (v22)
      {
        v52.x = x;
        v52.y = y;
        NSStringFromCGPoint(v52);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v53.x = v15;
        v53.y = v17;
        NSStringFromCGPoint(v53);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = CFSTR("NO");
        if (v7)
          v33 = CFSTR("YES");
        v34 = v33;
        v35 = CFSTR("NO");
        if (v6)
          v35 = CFSTR("YES");
        v36 = v35;
        *(_DWORD *)buf = 138544130;
        v40 = v31;
        v41 = 2114;
        v42 = (uint64_t)v32;
        v43 = 2114;
        v44 = v34;
        v45 = 2114;
        v46 = v36;
        _os_log_impl(&dword_1DB760000, v21, OS_LOG_TYPE_DEFAULT, "Cinematic: Tapped outside of CinematicSubjectView, attempting to set cinematic focus at point:%{public}@, normalized point:%{public}@ , useFixedOpticalFocus:%{public}@, hardFocus:%{public}@", buf, 0x2Au);

      }
      -[CAMPreviewViewController _captureController](self, "_captureController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setCinematicFocusAtPoint:useFixedOpticalFocus:useHardFocus:", v7, v6, v15, v17);
    }

    -[CAMPreviewViewController _setUserLockedFocusAndExposure:](self, "_setUserLockedFocusAndExposure:", 0);
    v20 = 1;
  }

  return v20;
}

- (void)_handleTapToFocusAndExpose:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[CAMPreviewViewController previewView](self, "previewView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v9);
  v6 = v5;
  v8 = v7;

  -[CAMPreviewViewController _handleFocusTapForPointInPreviewView:](self, "_handleFocusTapForPointInPreviewView:", v6, v8);
}

- (void)_handleFocusTapForPointInPreviewView:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  id WeakRetained;
  id v13;

  y = a3.y;
  x = a3.x;
  -[CAMPreviewViewController _cinematicModeIndicatorViewAtPoint:](self, "_cinematicModeIndicatorViewAtPoint:");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    if (-[CAMPreviewViewController _mode](self, "_mode") == 7)
    {
      if (!-[CAMPreviewViewController _setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:](self, "_setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", 0, 0, 0, x, y))goto LABEL_10;
    }
    else if (!-[CAMPreviewViewController _focusOnPoint:shouldShowFocusAndExposureIndicator:](self, "_focusOnPoint:shouldShowFocusAndExposureIndicator:", 1, x, y))
    {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  -[CAMPreviewViewController _metadataObjectsForView](self, "_metadataObjectsForView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v8 = objc_msgSend(v7, "syntheticFocusMode") & 1;
  else
    v8 = 0;
  v9 = -[CAMPreviewViewController _setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:](self, "_setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", v7, 0, v8, x, y);
  -[CAMPreviewViewController _continuousIndicator](self, "_continuousIndicator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v10, 1);

  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController _hideFocusIndicator:animated:](self, "_hideFocusIndicator:animated:", v11, 1);

  if (v9)
  {
LABEL_9:
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "previewViewControllerDidChangeFocusOrExposure:", self);

  }
LABEL_10:

}

- (BOOL)_isLongPressingToLock
{
  void *v2;
  uint64_t v3;

  -[CAMPreviewViewController _longPressToLockGestureRecognizer](self, "_longPressToLockGestureRecognizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "state");

  return (unint64_t)(v3 - 1) < 2;
}

- (void)_handleLongPressToLock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;

  v4 = a3;
  if (-[CAMPreviewViewController _allowUserToChangeFocusAndExposure](self, "_allowUserToChangeFocusAndExposure"))
  {
    -[CAMPreviewViewController previewView](self, "previewView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "state");
    if ((unint64_t)(v6 - 3) >= 3)
    {
      if (v6 == 1)
      {
        -[CAMPreviewViewController _cancelDelayedFocusAndExposureLock](self, "_cancelDelayedFocusAndExposureLock");
        objc_msgSend(v4, "locationInView:", v5);
        v9 = v8;
        v11 = v10;
        objc_msgSend(v5, "captureDevicePointOfInterestForPoint:");
        v13 = v12;
        v15 = v14;
        -[CAMPreviewViewController _setUserLockedFocusAndExposure:](self, "_setUserLockedFocusAndExposure:", 0);
        LODWORD(v16) = 0;
        -[CAMPreviewViewController setCachedExposureTargetBias:](self, "setCachedExposureTargetBias:", v16);
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMPreviewViewController _setLastTapToFocusTime:](self, "_setLastTapToFocusTime:", v17);

        if (-[CAMPreviewViewController _mode](self, "_mode") == 7)
        {
          -[CAMPreviewViewController _setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:](self, "_setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", 0, 1, 1, v9, v11);
        }
        else
        {
          -[CUCaptureController focusAndExposeAtPoint:lockFocus:resetExposureTargetBias:](self->__captureController, "focusAndExposeAtPoint:lockFocus:resetExposureTargetBias:", 1, 1, v15, v13);
          -[CAMPreviewViewController _showLockedAtPointOfInterest:](self, "_showLockedAtPointOfInterest:", v15, v13);
          -[CAMPreviewViewController _lockFocusAndExposureAfterDelay:](self, "_lockFocusAndExposureAfterDelay:", 1.0);
        }
      }
    }
    else
    {
      -[CAMPreviewViewController _cancelDelayedFocusAndExposureLock](self, "_cancelDelayedFocusAndExposureLock");
      -[CAMPreviewViewController _scaleDownLockedPointOfInterest](self, "_scaleDownLockedPointOfInterest");
      -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPreviewViewController _deactivateFocusIndicator:afterDelay:](self, "_deactivateFocusIndicator:afterDelay:", v7, 1.2);

    }
  }

}

- (void)_lockFocusAndExposureAfterDelay:(double)a3
{
  -[CAMPreviewViewController _cancelDelayedFocusAndExposureLock](self, "_cancelDelayedFocusAndExposureLock");
  -[CAMPreviewViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__lockFocusAndExposure, 0, a3);
}

- (void)_cancelDelayedFocusAndExposureLock
{
  objc_msgSend((id)objc_opt_class(), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__lockFocusAndExposure, 0);
}

- (void)_lockFocusAndExposure
{
  void *v3;
  int v4;
  id v5;

  -[CAMPreviewViewController _cancelDelayedFocusAndExposureLock](self, "_cancelDelayedFocusAndExposureLock");
  -[CAMPreviewViewController _captureController](self, "_captureController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController _setUserLockedFocusAndExposure:](self, "_setUserLockedFocusAndExposure:", 1);
  objc_msgSend(v5, "forceDisableSubjectAreaChangeMonitoring");
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isTapToExposeSupportedForMode:", -[CAMPreviewViewController _mode](self, "_mode"));

  if (v4)
    objc_msgSend(v5, "changeToLockedExposure");
  -[CAMPreviewViewController _finishFocusingLockedPointOfInterestIndicator](self, "_finishFocusingLockedPointOfInterestIndicator");

}

- (void)setCachedExposureTargetBias:(float)a3
{
  if (self->_cachedExposureTargetBias != a3)
  {
    self->_cachedExposureTargetBias = a3;
    -[CAMPreviewViewController _updateExposureBiasViews](self, "_updateExposureBiasViews");
  }
}

- (BOOL)_showExposureBiasSliderForPointView
{
  void *v3;

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isTapAndBiasSupportedForMode:", -[CAMPreviewViewController _mode](self, "_mode"));

  return (char)self;
}

- (float)_exposureTargetBiasMinimum
{
  float v2;

  -[CAMPreviewViewController _exposureTargetBiasMaximum](self, "_exposureTargetBiasMaximum");
  return -v2;
}

- (float)_exposureTargetBiasMaximum
{
  void *v2;
  void *v3;
  double v4;
  float v5;
  float v6;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CAMExposureBiasMax"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    if (v4 <= 0.0)
    {
      v6 = 4.0;
    }
    else
    {
      v5 = v4;
      v6 = v5;
    }
  }
  else
  {
    v6 = 4.0;
  }

  return v6;
}

- (int)_exposureBiasSide
{
  int64_t v2;

  v2 = -[CAMPreviewViewController _interfaceOrientation](self, "_interfaceOrientation");
  if ((unint64_t)(v2 - 2) > 2)
    return 0;
  else
    return dword_1DB9A7C78[v2 - 2];
}

- (void)_initializeExposureBiasParametersForFocusIndicatorView:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setExposureBiasSide:animated:", -[CAMPreviewViewController _exposureBiasSide](self, "_exposureBiasSide"), 0);
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CAMPreviewViewController _updateExposureBiasViews:](self, "_updateExposureBiasViews:", v5);
}

- (void)_updateExposureBiasViews
{
  id v3;

  -[CAMPreviewViewController _focusIndicatorViewsWithExposureBiasSliders](self, "_focusIndicatorViewsWithExposureBiasSliders");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMPreviewViewController _updateExposureBiasViews:](self, "_updateExposureBiasViews:", v3);

}

- (void)_updateExposureBiasViews:(id)a3
{
  id v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  float v23;
  float v24;
  uint64_t i;
  void *v26;
  double v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CAMPreviewViewController cachedExposureTargetBias](self, "cachedExposureTargetBias");
  v6 = v5;
  -[CAMPreviewViewController _exposureTargetBiasMinimum](self, "_exposureTargetBiasMinimum");
  v8 = v7;
  -[CAMPreviewViewController _exposureTargetBiasMaximum](self, "_exposureTargetBiasMaximum");
  v10 = v9;
  -[CAMPreviewViewController _virtualSliderPositionForExposureBias:](self, "_virtualSliderPositionForExposureBias:", v8);
  v12 = v11;
  -[CAMPreviewViewController _virtualSliderPositionForExposureBias:](self, "_virtualSliderPositionForExposureBias:", v10);
  v14 = v13;
  -[CAMPreviewViewController _virtualSliderPositionForExposureBias:](self, "_virtualSliderPositionForExposureBias:", v6);
  v16 = v15;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v17 = v4;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v18)
  {
    v20 = v18;
    v21 = *(_QWORD *)v30;
    v22 = v12;
    v23 = v14;
    v24 = v16;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v17);
        v26 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        *(float *)&v19 = v22;
        objc_msgSend(v26, "setExposureBiasMinimum:", v19, (_QWORD)v29);
        *(float *)&v27 = v23;
        objc_msgSend(v26, "setExposureBiasMaximum:", v27);
        *(float *)&v28 = v24;
        objc_msgSend(v26, "setExposureBiasValue:", v28);
      }
      v20 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v20);
  }

}

- (id)_focusIndicatorViewsWithExposureBiasSliders
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (BOOL)_isPanningExposureBias
{
  UIPanGestureRecognizer *exposureBiasPanGestureRecognizer;

  exposureBiasPanGestureRecognizer = self->__exposureBiasPanGestureRecognizer;
  if (exposureBiasPanGestureRecognizer)
    LOBYTE(exposureBiasPanGestureRecognizer) = (unint64_t)(-[UIPanGestureRecognizer state](exposureBiasPanGestureRecognizer, "state")- 1) < 2;
  return (char)exposureBiasPanGestureRecognizer;
}

- (void)_handleExposureBiasPan:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  float v7;
  void *v8;
  unint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  float v15;
  float v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  -[CAMPreviewViewController _captureController](self, "_captureController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v20, "state");
  if ((unint64_t)(v5 - 3) < 3)
  {
    -[CAMPreviewViewController _updateExposureBiasViews](self, "_updateExposureBiasViews");
    -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewViewController _deactivateFocusIndicator:afterDelay:](self, "_deactivateFocusIndicator:afterDelay:", v6, 1.2);
LABEL_13:

    goto LABEL_14;
  }
  if ((unint64_t)(v5 - 1) <= 1)
  {
    if (objc_msgSend(v20, "state") == 1)
    {
      -[CAMPreviewViewController cachedExposureTargetBias](self, "cachedExposureTargetBias");
      self->__exposureBiasPanStartValue = v7;
      -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMPreviewViewController _activateFocusIndicator:](self, "_activateFocusIndicator:", v8);
      v9 = -[CAMPreviewViewController _mode](self, "_mode");
      if (v9 <= 9 && ((1 << v9) & 0x251) != 0)
        objc_msgSend(v4, "changeToLockedExposure");

    }
    -[CAMPreviewViewController _pointIndicator](self, "_pointIndicator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "translationInView:", v6);
    -[CAMPreviewViewController _effectiveExposureBiasMovementForTranslation:](self, "_effectiveExposureBiasMovementForTranslation:");
    v11 = v10;
    -[CAMPreviewViewController _virtualSliderPositionForExposureBias:](self, "_virtualSliderPositionForExposureBias:", self->__exposureBiasPanStartValue);
    -[CAMPreviewViewController _exposureBiasForVirtualSliderPosition:](self, "_exposureBiasForVirtualSliderPosition:", v11 + v12);
    v14 = v13;
    -[CAMPreviewViewController _exposureTargetBiasMinimum](self, "_exposureTargetBiasMinimum");
    v16 = v15;
    -[CAMPreviewViewController _exposureTargetBiasMaximum](self, "_exposureTargetBiasMaximum");
    v18 = v16;
    if (v14 >= v16)
    {
      v17 = *(float *)&v17;
      v18 = v14;
      if (v14 > v17)
        v18 = v17;
    }
    *(float *)&v17 = v18;
    -[CAMPreviewViewController setCachedExposureTargetBias:](self, "setCachedExposureTargetBias:", v17);
    -[CAMPreviewViewController _updateCaptureControllerExposureTargetBias](self, "_updateCaptureControllerExposureTargetBias");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMPreviewViewController _setLastExposureBiasModifiedTime:](self, "_setLastExposureBiasModifiedTime:", v19);

    goto LABEL_13;
  }
LABEL_14:

}

- (double)_effectiveExposureBiasMovementForTranslation:(CGPoint)a3
{
  double y;
  double x;

  y = a3.y;
  x = a3.x;
  switch(-[CAMPreviewViewController _exposureBiasSide](self, "_exposureBiasSide"))
  {
    case 0:
      x = -y;
      break;
    case 1:
      x = y;
      break;
    case 2:
      x = -x;
      break;
    case 3:
      return x;
    default:
      x = 0.0;
      break;
  }
  return x;
}

- (double)_virtualSliderPositionForExposureBias:(double)a3
{
  double v5;
  long double v6;
  double v7;
  double v8;
  long double v9;
  double result;

  v5 = -a3;
  if (a3 >= 0.0)
    v6 = a3;
  else
    v6 = v5;
  -[CAMPreviewViewController _exposureBiasVirtualSliderPointsForFirstStop](self, "_exposureBiasVirtualSliderPointsForFirstStop");
  v8 = v7;
  -[CAMPreviewViewController _exposureBiasVirtualSliderExponent](self, "_exposureBiasVirtualSliderExponent");
  result = v8 * (1.0 - pow(v9, v6)) / (1.0 - v9);
  if (a3 < 0.0)
    return -result;
  return result;
}

- (double)_exposureBiasForVirtualSliderPosition:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  long double v10;
  double v11;
  double result;

  v5 = -a3;
  if (a3 >= 0.0)
    v6 = a3;
  else
    v6 = v5;
  -[CAMPreviewViewController _exposureBiasVirtualSliderPointsForFirstStop](self, "_exposureBiasVirtualSliderPointsForFirstStop");
  v8 = v7;
  -[CAMPreviewViewController _exposureBiasVirtualSliderExponent](self, "_exposureBiasVirtualSliderExponent");
  v10 = v9;
  v11 = log(1.0 - v6 * (1.0 - v9) / v8);
  result = v11 / log(v10);
  if (a3 < 0.0)
    return -result;
  return result;
}

- (BOOL)captureController:(id)a3 shouldResetFocusAndExposureAfterCaptureForType:(int64_t)a4
{
  return (unint64_t)(a4 - 2) < 3;
}

- (BOOL)_shouldResetFocusAndExposureForSubjectAreaDidChange
{
  BOOL v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  if (-[CAMPreviewViewController _isPanningExposureBias](self, "_isPanningExposureBias")
    || -[CAMPreviewViewController _isLongPressingToLock](self, "_isLongPressingToLock"))
  {
    return 0;
  }
  -[CAMPreviewViewController _lastExposureBiasModificationTime](self, "_lastExposureBiasModificationTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v4);
    v7 = v6;

    if (v7 < 1.5)
    {
      v3 = 0;
      goto LABEL_9;
    }
    -[CAMPreviewViewController _setLastExposureBiasModifiedTime:](self, "_setLastExposureBiasModifiedTime:", 0);
  }
  v3 = 1;
LABEL_9:
  -[CAMPreviewViewController _lastTapToFocusTime](self, "_lastTapToFocusTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    v11 = v10;

    if (v11 >= 1.0)
      -[CAMPreviewViewController _setLastTapToFocusTime:](self, "_setLastTapToFocusTime:", 0);
    else
      v3 = 0;
  }

  return v3;
}

- (BOOL)captureControllerUserHasAdjustedExposureTargetBiasFromBaseline:(id)a3
{
  float v3;

  -[CAMPreviewViewController cachedExposureTargetBias](self, "cachedExposureTargetBias", a3);
  return v3 != 0.0;
}

- (float)baselineExposureValueForCaptureController:(id)a3
{
  double v3;
  float result;

  LODWORD(v3) = 0;
  -[CAMPreviewViewController setCachedExposureTargetBias:](self, "setCachedExposureTargetBias:", a3, v3);
  -[CAMPreviewViewController baselineExposureBias](self, "baselineExposureBias");
  return result;
}

- (void)_hideAllCinematicIndicatorsAnimated:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("cinematicSubject"), a3);
  -[CAMPreviewViewController _hideIndicatorsOfViewType:animated:](self, "_hideIndicatorsOfViewType:animated:", CFSTR("cinematicFixedFocus"), v3);
}

- (void)_setCinematicSubjectIsTrackingLocked:(BOOL)a3
{
  -[CAMPreviewViewController _setCinematicSubjectIsTrackingLocked:shouldAnimate:](self, "_setCinematicSubjectIsTrackingLocked:shouldAnimate:", a3, 0);
}

- (void)_setCinematicSubjectIsTrackingLocked:(BOOL)a3 shouldAnimate:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  if (self->__cinematicSubjectIsTrackingLocked != a3)
  {
    v4 = a4;
    self->__cinematicSubjectIsTrackingLocked = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "previewViewControllerDidChangeFocusOrExposureLocked:shouldAnimate:", self, v4);

  }
}

- (BOOL)isFocusLockedOnCinematicSubject
{
  return -[CAMPreviewViewController _mode](self, "_mode") == 7
      && -[CAMPreviewViewController _cinematicSubjectIsTrackingLocked](self, "_cinematicSubjectIsTrackingLocked");
}

- (void)_setCinematicIsFixedFocusLocked:(BOOL)a3
{
  -[CAMPreviewViewController _setCinematicIsFixedFocusLocked:shouldAnimate:](self, "_setCinematicIsFixedFocusLocked:shouldAnimate:", a3, 0);
}

- (void)_setCinematicIsFixedFocusLocked:(BOOL)a3 shouldAnimate:(BOOL)a4
{
  _BOOL8 v4;
  id WeakRetained;

  if (self->__cinematicIsFixedFocusLocked != a3)
  {
    v4 = a4;
    self->__cinematicIsFixedFocusLocked = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "previewViewControllerDidChangeFocusOrExposureLocked:shouldAnimate:", self, v4);

  }
}

- (void)_setUserLockedFocusAndExposure:(BOOL)a3
{
  -[CAMPreviewViewController _setUserLockedFocusAndExposure:shouldAnimate:](self, "_setUserLockedFocusAndExposure:shouldAnimate:", a3, 1);
}

- (void)setFocusAndExposureExternallyLocked:(BOOL)a3
{
  id v4;

  if (self->_focusAndExposureExternallyLocked != a3)
  {
    self->_focusAndExposureExternallyLocked = a3;
    if (a3)
    {
      -[CAMPreviewViewController _captureController](self, "_captureController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "changeToLockedFocusAndExposure");
LABEL_7:

      return;
    }
    if (!-[CAMPreviewViewController _userLockedFocusAndExposure](self, "_userLockedFocusAndExposure"))
    {
      -[CAMPreviewViewController _captureController](self, "_captureController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "resetFocusAndExposure");
      goto LABEL_7;
    }
  }
}

- (BOOL)_isFocusAndExposureLockedByUserOrExternally
{
  return -[CAMPreviewViewController _userLockedFocusAndExposure](self, "_userLockedFocusAndExposure")
      || -[CAMPreviewViewController isFocusAndExposureExternallyLocked](self, "isFocusAndExposureExternallyLocked");
}

- (void)setBaselineExposureBias:(float)a3
{
  if (self->_baselineExposureBias != a3)
  {
    self->_baselineExposureBias = a3;
    -[CAMPreviewViewController _updateCaptureControllerExposureTargetBias](self, "_updateCaptureControllerExposureTargetBias");
  }
}

- (BOOL)_isExposureTargetBiasAtBaseline:(float)a3
{
  float v4;

  -[CAMPreviewViewController baselineExposureBias](self, "baselineExposureBias");
  return vabds_f32(a3, v4) < 0.01;
}

- (float)totalExposureBias
{
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;

  -[CAMPreviewViewController cachedExposureTargetBias](self, "cachedExposureTargetBias");
  v4 = v3;
  -[CAMPreviewViewController baselineExposureBias](self, "baselineExposureBias");
  v6 = v4 + v5;
  -[CAMPreviewViewController _exposureTargetBiasMinimum](self, "_exposureTargetBiasMinimum");
  v8 = v7;
  -[CAMPreviewViewController _exposureTargetBiasMaximum](self, "_exposureTargetBiasMaximum");
  return fminf(fmaxf(v8, v6), v9);
}

- (void)_updateCaptureControllerExposureTargetBias
{
  int v3;
  int v4;
  double v5;
  id v6;

  -[CAMPreviewViewController totalExposureBias](self, "totalExposureBias");
  v4 = v3;
  -[CAMPreviewViewController _captureController](self, "_captureController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = v4;
  objc_msgSend(v6, "changeExposureTargetBias:", v5);

}

- (BOOL)_shouldDisableAspectRatioToggle
{
  CAMPreviewViewController *v2;
  int64_t v3;
  void *v4;

  v2 = self;
  v3 = -[CAMPreviewViewController _mode](self, "_mode");
  LOBYTE(v2) = -[CAMPreviewViewController _isChangingGraphConfiguration](v2, "_isChangingGraphConfiguration");
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isPreviewAspectRatioToggleSupportedForMode:", v3);

  return v2 | v3 ^ 1;
}

- (void)_handleAspectRatioToggleDoubleTap:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  -[CAMPreviewViewController previewView](self, "previewView", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "videoPreviewView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "previewViewAspectMode");
  v6 = 1;
  if (v5)
    v6 = v5;
  if (v5 == 1)
    v7 = 0;
  else
    v7 = v6;
  objc_msgSend(v4, "setPreviewViewAspectMode:", v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "previewViewControllerDidChangeVideoFillAspectRatio:", self);

  +[CAMUserPreferences preferences](CAMUserPreferences, "preferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreviewViewAspectMode:forMode:", v7, -[CAMPreviewViewController _mode](self, "_mode"));

}

- (void)_captureOrientationChanged:(id)a3
{
  _BOOL8 v4;

  v4 = +[CAMApplication appOrPlugInState](CAMApplication, "appOrPlugInState", a3) == 0;
  -[CAMPreviewViewController _updateForOrientationAnimated:](self, "_updateForOrientationAnimated:", v4);
  -[CAMPreviewViewController _updateExposureBiasSideAnimated:](self, "_updateExposureBiasSideAnimated:", v4);
}

- (void)_updateExposureBiasSideAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = -[CAMPreviewViewController _exposureBiasSide](self, "_exposureBiasSide");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CAMPreviewViewController _focusIndicatorViewsWithExposureBiasSliders](self, "_focusIndicatorViewsWithExposureBiasSliders", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[CAMPreviewViewController _isShowingFocusIndicator:](self, "_isShowingFocusIndicator:", v11))
        {
          -[CAMPreviewViewController _activateFocusIndicator:](self, "_activateFocusIndicator:", v11);
          -[CAMPreviewViewController _deactivateFocusIndicator:afterDelay:](self, "_deactivateFocusIndicator:afterDelay:", v11, 1.2);
        }
        objc_msgSend(v11, "setExposureBiasSide:animated:", v5, v3);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)focusOnNormalizedPoint:(CGPoint)a3
{
  double y;
  double x;
  CGFloat v6;
  CGFloat v7;
  CGFloat width;
  CGFloat height;
  double v10;
  id v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  -[CAMPreviewViewController previewView](self, "previewView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v6 = v12.origin.x;
  v7 = v12.origin.y;
  width = v12.size.width;
  height = v12.size.height;
  v10 = x * CGRectGetWidth(v12);
  v13.origin.x = v6;
  v13.origin.y = v7;
  v13.size.width = width;
  v13.size.height = height;
  -[CAMPreviewViewController _handleFocusTapForPointInPreviewView:](self, "_handleFocusTapForPointInPreviewView:", v10, y * CGRectGetHeight(v13));

}

- (void)setShowingStandardControls:(BOOL)a3
{
  if (self->_showingStandardControls != a3)
  {
    self->_showingStandardControls = a3;
    -[CAMPreviewViewController _hideAllFocusIndicatorsAnimated:](self, "_hideAllFocusIndicatorsAnimated:", 0);
  }
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
  if (self->_shallowDepthOfFieldStatus != a3)
  {
    self->_shallowDepthOfFieldStatus = a3;
    -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", 1);
  }
}

- (void)setStagePreviewStatus:(int64_t)a3
{
  if (self->_stagePreviewStatus != a3)
  {
    self->_stagePreviewStatus = a3;
    -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", 1);
  }
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3 stagePreviewStatus:(int64_t)a4
{
  if (self->_stagePreviewStatus != a4 || self->_shallowDepthOfFieldStatus != a3)
  {
    self->_stagePreviewStatus = a4;
    self->_shallowDepthOfFieldStatus = a3;
    -[CAMPreviewViewController _updatePortraitModeViewsAnimated:](self, "_updatePortraitModeViewsAnimated:", 1);
  }
}

- (void)_createPortraitModeCenteredIndicatorViewIfNecessary
{
  id v3;
  CEKSubjectIndicatorView *v4;
  CEKSubjectIndicatorView *portraitModeCenteredIndicatorView;
  id v6;

  if (!self->__portraitModeCenteredIndicatorView)
  {
    v3 = objc_alloc(MEMORY[0x1E0D0D0A0]);
    v4 = (CEKSubjectIndicatorView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    portraitModeCenteredIndicatorView = self->__portraitModeCenteredIndicatorView;
    self->__portraitModeCenteredIndicatorView = v4;

    -[CEKSubjectIndicatorView setHidden:animated:](self->__portraitModeCenteredIndicatorView, "setHidden:animated:", 1, 0);
    -[CAMPreviewViewController previewView](self, "previewView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCenteredSubjectIndicatorView:", self->__portraitModeCenteredIndicatorView);

  }
}

- (BOOL)_shouldShowStageLightOverlayViewForMode:(int64_t)a3 device:(int64_t)a4 lightingType:(int64_t)a5 shallowDepthOfFieldStatus:(int64_t)a6 stagePreviewStatus:(int64_t)a7
{
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  char v15;

  if ((unint64_t)(a4 - 1) > 0xA)
    v10 = 0;
  else
    v10 = qword_1DB9A7C88[a4 - 1];
  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isLightingControlSupportedForMode:", a3);

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isLivePreviewSupportedForLightingType:devicePosition:", a5, v10);

  v15 = v14 ^ 1;
  if ((unint64_t)(a5 - 4) < 3 && a7 == 1)
    v15 = 1;
  return v12 & v15;
}

- (BOOL)_shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:(int64_t)a3
{
  return (unint64_t)(a3 - 7) < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)_shouldSuppressNewPortraitModeTrackedSubjectIndicators
{
  BOOL v3;
  _BOOL4 v4;
  int v5;

  v3 = -[CAMPreviewViewController isShowingPointIndicator](self, "isShowingPointIndicator");
  v4 = -[CAMPreviewViewController _isFocusAndExposureLockedByUserOrExternally](self, "_isFocusAndExposureLockedByUserOrExternally");
  v5 = v4 | !-[CAMPreviewViewController _shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:](self, "_shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:", -[CAMPreviewViewController lightingType](self, "lightingType"));
  if (v3)
    return 1;
  else
    return v5;
}

void __61__CAMPreviewViewController__updatePortraitModeViewsAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  int v4;
  id v5;

  v5 = a3;
  v4 = objc_msgSend(v5, "isInactive");
  objc_msgSend(v5, "setInactive:", *(unsigned __int8 *)(a1 + 32));
  if (v4 && !*(_BYTE *)(a1 + 32))
    objc_msgSend(v5, "startScalingWithExpansionWidth:duration:repeatCount:", 1, 10.0, 0.3);

}

- (CGRect)normalizedZoomPIPRect
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

  -[CAMPreviewViewController previewView](self, "previewView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "normalizedZoomPIPRect");
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

- (void)setNormalizedZoomPIPRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[CAMPreviewViewController previewView](self, "previewView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNormalizedZoomPIPRect:", x, y, width, height);

}

- (CAMPreviewViewControllerDelegate)delegate
{
  return (CAMPreviewViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isFocusAndExposureExternallyLocked
{
  return self->_focusAndExposureExternallyLocked;
}

- (float)baselineExposureBias
{
  return self->_baselineExposureBias;
}

- (float)cachedExposureTargetBias
{
  return self->_cachedExposureTargetBias;
}

- (int64_t)stagePreviewStatus
{
  return self->_stagePreviewStatus;
}

- (BOOL)shouldUsePortraitStyleIndicatorsInPhotoMode
{
  return self->_shouldUsePortraitStyleIndicatorsInPhotoMode;
}

- (CAMMachineReadableCodeResult)cachedSignificantMRCResult
{
  return self->_cachedSignificantMRCResult;
}

- (CAMTextRegionResult)cachedSignificantTextRegionResult
{
  return self->_cachedSignificantTextRegionResult;
}

- (NSArray)cachedTextRegionResults
{
  return self->_cachedTextRegionResults;
}

- (CUCaptureController)_captureController
{
  return self->__captureController;
}

- (CAMCaptureGraphConfiguration)_graphConfiguration
{
  return self->__graphConfiguration;
}

- (void)_setGraphConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->__graphConfiguration, a3);
}

- (BOOL)_isChangingGraphConfiguration
{
  return self->__changingGraphConfiguration;
}

- (void)_setChangingGraphConfiguration:(BOOL)a3
{
  self->__changingGraphConfiguration = a3;
}

- (CAMBurstIndicatorView)_burstIndicator
{
  return self->__burstIndicator;
}

- (NSMutableDictionary)_indicatorViewsByType
{
  return self->__indicatorViewsByType;
}

- (NSMapTable)_metadataObjectsForView
{
  return self->__metadataObjectsForView;
}

- (BOOL)_cinematicSubjectIsTrackingLocked
{
  return self->__cinematicSubjectIsTrackingLocked;
}

- (BOOL)_cinematicIsFixedFocusLocked
{
  return self->__cinematicIsFixedFocusLocked;
}

- (CAMFocusResult)_lastFocusResult
{
  return self->__lastFocusResult;
}

- (NSDate)_lastTapToFocusTime
{
  return self->__lastTapToFocusTime;
}

- (void)_setLastTapToFocusTime:(id)a3
{
  objc_storeStrong((id *)&self->__lastTapToFocusTime, a3);
}

- (unint64_t)_currentFacesCount
{
  return self->__currentFacesCount;
}

- (void)_setCurrentFacesCount:(unint64_t)a3
{
  self->__currentFacesCount = a3;
}

- (BOOL)_shouldSuppressExistingFaceIndicators
{
  return self->__shouldSuppressExistingFaceIndicators;
}

- (void)_setShouldSuppressExistingFaceIndicators:(BOOL)a3
{
  self->__shouldSuppressExistingFaceIndicators = a3;
}

- (UITapGestureRecognizer)_tapToFocusAndExposeGestureRecognizer
{
  return self->__tapToFocusAndExposeGestureRecognizer;
}

- (UIPanGestureRecognizer)_exposureBiasPanGestureRecognizer
{
  return self->__exposureBiasPanGestureRecognizer;
}

- (UITapGestureRecognizer)_aspectRatioToggleDoubleTapGestureRecognizer
{
  return self->__aspectRatioToggleDoubleTapGestureRecognizer;
}

- (float)_exposureBiasPanStartValue
{
  return self->__exposureBiasPanStartValue;
}

- (double)_exposureBiasVirtualSliderExponent
{
  return self->__exposureBiasVirtualSliderExponent;
}

- (double)_exposureBiasVirtualSliderPointsForFirstStop
{
  return self->__exposureBiasVirtualSliderPointsForFirstStop;
}

- (void)_setLastExposureBiasModifiedTime:(id)a3
{
  objc_storeStrong((id *)&self->__lastExposureBiasModificationTime, a3);
}

- (CEKSubjectIndicatorView)_portraitModeCenteredIndicatorView
{
  return self->__portraitModeCenteredIndicatorView;
}

- (BOOL)_disableDelayedFadeOutForFaces
{
  return self->__disableDelayedFadeOutForFaces;
}

- (BOOL)_disableIndicatorGeometryAnimations
{
  return self->__disableIndicatorGeometryAnimations;
}

- (BOOL)_disableAllIndicators
{
  return self->__disableAllIndicators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->__stageLightOverlayView, 0);
  objc_storeStrong((id *)&self->__portraitModeCenteredIndicatorView, 0);
  objc_storeStrong((id *)&self->__lastExposureBiasModificationTime, 0);
  objc_storeStrong((id *)&self->__aspectRatioToggleDoubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__exposureBiasPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__longPressToLockGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__tapToFocusAndExposeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__lastTapToFocusTime, 0);
  objc_storeStrong((id *)&self->__lastExposureResult, 0);
  objc_storeStrong((id *)&self->__lastFocusResult, 0);
  objc_storeStrong((id *)&self->__lastFocusIndictorStartTime, 0);
  objc_storeStrong((id *)&self->__metadataObjectsForView, 0);
  objc_storeStrong((id *)&self->__indicatorViewsByType, 0);
  objc_storeStrong((id *)&self->__pointIndicator, 0);
  objc_storeStrong((id *)&self->__continuousIndicator, 0);
  objc_storeStrong((id *)&self->__burstIndicator, 0);
  objc_storeStrong((id *)&self->__graphConfiguration, 0);
  objc_destroyWeak((id *)&self->__timelapseController);
  objc_storeStrong((id *)&self->__captureController, 0);
  objc_storeStrong((id *)&self->_cachedTextRegionResults, 0);
  objc_storeStrong((id *)&self->_cachedSignificantTextRegionResult, 0);
  objc_storeStrong((id *)&self->_cachedMRCResults, 0);
  objc_storeStrong((id *)&self->_cachedSignificantMRCResult, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_focusOnPoint:(uint64_t)a3 shouldShowFocusAndExposureIndicator:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Failed to focus/expose at point! Converted device point of interest is not valid.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_setCinematicFocusForMetadataObject:(uint64_t)a3 atPoint:(uint64_t)a4 useFixedOpticalFocus:(uint64_t)a5 useHardFocus:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Failed to request for cinematic tracker at point! Converted device point of interest is not valid.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_handleLongPressToLock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1DB760000, a1, a3, "Failed to long press focus/expose at point! Converted device point of interest is not valid.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
