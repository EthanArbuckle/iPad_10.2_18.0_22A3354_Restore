@implementation NTKAstronomyFaceView

- (NTKAstronomyFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  NTKAstronomyFaceView *v9;
  NTKDigitialUtilitarianFaceViewComplicationFactory *v10;
  NTKDigitialUtilitarianFaceViewComplicationFactory *faceViewComplicationFactory;
  objc_super v13;

  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)NTKAstronomyFaceView;
  v9 = -[NTKFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v13, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, v8, a5);
  if (v9)
  {
    v10 = -[NTKDigitialUtilitarianFaceViewComplicationFactory initForDevice:]([NTKDigitialUtilitarianFaceViewComplicationFactory alloc], "initForDevice:", v8);
    faceViewComplicationFactory = v9->_faceViewComplicationFactory;
    v9->_faceViewComplicationFactory = v10;

    -[NTKDigitialUtilitarianFaceViewComplicationFactory setUsesLegibility:faceView:](v9->_faceViewComplicationFactory, "setUsesLegibility:faceView:", 1, v9);
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[NTKAstronomyFaceView _unloadSnapshotContentViews](self, "_unloadSnapshotContentViews");
  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView dealloc](&v3, sel_dealloc);
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return -[NTKDigitialUtilitarianFaceViewComplicationFactory newLegacyViewForComplication:family:slot:faceView:](self->_faceViewComplicationFactory, "newLegacyViewForComplication:family:slot:faceView:", a3, a4, a5, self);
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return -[NTKFaceViewComplicationFactory legacyLayoutOverrideforComplicationType:slot:faceView:](self->_faceViewComplicationFactory, "legacyLayoutOverrideforComplicationType:slot:faceView:", a3, a4, self);
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  -[NTKDigitialUtilitarianFaceViewComplicationFactory configureComplicationView:forSlot:faceView:](self->_faceViewComplicationFactory, "configureComplicationView:forSlot:faceView:", a3, a4, self);
}

- (id)_detachedComplicationDisplays
{
  return -[NTKFaceViewComplicationFactory detachedComplicationDisplaysForFaceView:](self->_faceViewComplicationFactory, "detachedComplicationDisplaysForFaceView:", self);
}

- (void)_loadLayoutRules
{
  -[NTKDigitialUtilitarianFaceViewComplicationFactory loadLayoutRulesForFaceView:](self->_faceViewComplicationFactory, "loadLayoutRulesForFaceView:", self);
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  double result;

  -[NTKFaceViewComplicationFactory keylineCornerRadiusForComplicationSlot:faceView:](self->_faceViewComplicationFactory, "keylineCornerRadiusForComplicationSlot:faceView:", a3, self);
  return result;
}

- (double)keylineStyleForComplicationSlot:(id)a3
{
  return (double)-[NTKFaceViewComplicationFactory keylineStyleForComplicationSlot:](self->_faceViewComplicationFactory, "keylineStyleForComplicationSlot:", a3);
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return -[NTKDigitialUtilitarianFaceViewComplicationFactory fadesComplicationSlot:inEditMode:faceView:](self->_faceViewComplicationFactory, "fadesComplicationSlot:inEditMode:faceView:", a3, a4, self);
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  double result;

  -[NTKFaceViewComplicationFactory minimumBreathingScaleForComplicationSlot:faceView:](self->_faceViewComplicationFactory, "minimumBreathingScaleForComplicationSlot:faceView:", a3, self);
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  UIPanGestureRecognizer *v6;
  UITapGestureRecognizer *interactiveModeTapGesture;
  BOOL v8;

  v6 = (UIPanGestureRecognizer *)a4;
  interactiveModeTapGesture = self->_interactiveModeTapGesture;
  v8 = (interactiveModeTapGesture == a3 || self->_spheroidPanGesture == a3)
    && (interactiveModeTapGesture == (UITapGestureRecognizer *)v6 || self->_spheroidPanGesture == v6);

  return v8;
}

- (void)_interpolateFromPose:(const NTKAstronomyFaceViewAnimationPose *)a3 toPose:(const NTKAstronomyFaceViewAnimationPose *)a4 progress:(float)a5
{
  void *v6;
  int IsRTL;
  void *v8;
  double v9;
  float v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CLKUIColoringLabel *overrideDateLabel;
  CLKUIColoringLabel *scrubLabel;
  CLKUIColoringLabel *phaseLabel;
  NTKDigitialUtilitarianFaceViewComplicationFactory *faceViewComplicationFactory;

  -[NTKFaceView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKAstronomyLayoutForDevice(v6);

  IsRTL = CLKLayoutIsRTL();
  if ((IsRTL & 1) != 0)
  {
    -[NTKFaceView device](self, "device");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "screenBounds");
    v10 = v9 - *(float *)&dword_1EF175C5C;

  }
  else
  {
    v10 = *(float *)&dword_1EF175C5C;
  }
  v11 = v10;
  v12 = 1024;
  v13 = 8;
  do
  {
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v12);
    if (v14)
    {
      v15 = v14;
      CLKInterpolateBetweenFloatsClipped();
      objc_msgSend(v15, "setAlpha:");
      objc_msgSend(v15, "frame");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      CLKInterpolateBetweenFloatsClipped();
      if (IsRTL)
        v22 = -v22 - v19;
      objc_msgSend(v15, "setFrame:", v22 + v11, v17, v19, v21);

    }
    v12 += 8;
    --v13;
  }
  while (v13);
  if (!-[NTKFaceView editing](self, "editing"))
  {
    -[NTKFaceView timeView](self, "timeView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    CLKInterpolateBetweenFloatsClipped();
    objc_msgSend(v23, "setAlpha:");

    overrideDateLabel = self->_overrideDateLabel;
    CLKInterpolateBetweenFloatsClipped();
    -[CLKUIColoringLabel setAlpha:](overrideDateLabel, "setAlpha:");
    scrubLabel = self->_scrubLabel;
    CLKInterpolateBetweenFloatsClipped();
    -[CLKUIColoringLabel setAlpha:](scrubLabel, "setAlpha:");
    phaseLabel = self->_phaseLabel;
    CLKInterpolateBetweenFloatsClipped();
    -[CLKUIColoringLabel setAlpha:](phaseLabel, "setAlpha:");
    faceViewComplicationFactory = self->_faceViewComplicationFactory;
    CLKInterpolateBetweenFloatsClipped();
    -[NTKDigitialUtilitarianFaceViewComplicationFactory setAlpha:faceView:](faceViewComplicationFactory, "setAlpha:faceView:", self);
  }
}

- (id)_date
{
  NSDate *overrideDate;
  NSDate *v3;

  overrideDate = self->_overrideDate;
  if (overrideDate || (overrideDate = self->_crownDate) != 0)
  {
    v3 = overrideDate;
  }
  else
  {
    +[NTKDate faceDate](NTKDate, "faceDate");
    v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)_animateTransitionToViewMode:(int64_t)a3
{
  -[NTKAstronomyFaceView _animateTransitionToViewMode:completion:](self, "_animateTransitionToViewMode:completion:", a3, 0);
}

- (void)_animateTransitionToViewMode:(int64_t)a3 completion:(id)a4
{
  int64_t v6;
  void *v7;
  NTKDelayedBlock *wheelDelayedBlock;
  NTKDelayedBlock *physicalButtonDelayedBlock;
  id v10;

  v10 = a4;
  v6 = -[NTKDigitalFaceView viewMode](self, "viewMode");
  if (((*((_BYTE *)self + 1264) & 1) != 0 || v6 != a3)
    && ((*((_BYTE *)self + 1264) & 1) == 0 || self->_animatingToViewMode != a3))
  {
    self->_animatingToViewMode = a3;
    -[NTKDelayedBlock cancel](self->_wheelDelayedBlock, "cancel");
    wheelDelayedBlock = self->_wheelDelayedBlock;
    self->_wheelDelayedBlock = 0;

    -[NTKDelayedBlock cancel](self->_physicalButtonDelayedBlock, "cancel");
    physicalButtonDelayedBlock = self->_physicalButtonDelayedBlock;
    self->_physicalButtonDelayedBlock = 0;

    *((_BYTE *)self + 1264) |= 1u;
    -[NUNIAstronomyVistaView applyVista:transitionStyle:](self->_astronomyVistaView, "applyVista:transitionStyle:", self->_vista, 0);
    -[NUNIAstronomyVistaView showSupplemental:animated:](self->_astronomyVistaView, "showSupplemental:animated:", a3 == 3, 0);
    -[NTKAstronomyFaceView _setIsAnimatingViewMode:](self, "_setIsAnimatingViewMode:", 0);
    -[NTKAstronomyFaceView setViewMode:](self, "setViewMode:", a3);
    goto LABEL_8;
  }
  v7 = v10;
  if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
LABEL_8:
    v7 = v10;
  }

}

- (void)_setIsAnimatingViewMode:(BOOL)a3
{
  *((_BYTE *)self + 1264) = *((_BYTE *)self + 1264) & 0xFE | a3;
}

- (void)setViewMode:(int64_t)a3
{
  if ((*((_BYTE *)self + 1264) & 2) != 0
    && (-[NTKDigitalFaceView viewMode](self, "viewMode") != a3 || (*((_BYTE *)self + 1264) & 1) != 0))
  {
    -[NTKAstronomyFaceView _applyViewMode:](self, "_applyViewMode:", a3);
  }
}

- (void)_applyViewMode:(int64_t)a3
{
  void *v5;
  double v6;
  void *v7;
  double v8;
  unint64_t *p_vista;
  uint64_t v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NTKAstronomyFaceView;
  -[NTKDigitalFaceView setViewMode:](&v12, sel_setViewMode_);
  -[NTKDigitalFaceView invalidateDigitalTimeLabelStyle](self, "invalidateDigitalTimeLabelStyle");
  *((_BYTE *)self + 1264) &= ~1u;
  -[NTKFaceView delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "faceViewWantsStatusBarHidden:animated:", -[NTKAstronomyFaceView _shouldHideStatusBarForViewMode:](self, "_shouldHideStatusBarForViewMode:", a3), 0);

  switch(a3)
  {
    case 0:
      -[NTKAstronomyFaceView _setAstronomyFaceViewModeDefault](self, "_setAstronomyFaceViewModeDefault");
      goto LABEL_4;
    case 1:
      -[NTKAstronomyFaceView _setAstronomyFaceViewModeNonInteractive](self, "_setAstronomyFaceViewModeNonInteractive");
      goto LABEL_4;
    case 2:
      -[NTKAstronomyFaceView _setAstronomyFaceViewModeInteractive](self, "_setAstronomyFaceViewModeInteractive");
      p_vista = &self->_vista;
      v10 = 28;
      if (self->_vista == 1)
        v10 = 56;
      LODWORD(v8) = 1.0;
      -[NTKAstronomyFaceView _interpolateFromPose:toPose:progress:](self, "_interpolateFromPose:toPose:progress:", (char *)&_NTKAstronomyFaceViewGetPose_s_animationPoses + v10, (char *)&_NTKAstronomyFaceViewGetPose_s_animationPoses + v10, v8);
      goto LABEL_12;
    case 3:
      -[NTKAstronomyFaceView _setAstronomyFaceViewModeSupplemental](self, "_setAstronomyFaceViewModeSupplemental");
      v7 = &_NTKAstronomyFaceViewGetPose_s_animationPoses;
      goto LABEL_9;
    default:
LABEL_4:
      v7 = &unk_1B755FB1C;
LABEL_9:
      p_vista = &self->_vista;
      LODWORD(v6) = 1.0;
      -[NTKAstronomyFaceView _interpolateFromPose:toPose:progress:](self, "_interpolateFromPose:toPose:progress:", v7, v7, v6);
      if (self->_vista != 2
        && (-[NUNIAstronomyRotationModel isAtHomeCoordinate](self->_rotationModel, "isAtHomeCoordinate") & 1) == 0)
      {
        -[NUNIAstronomyRotationModel stop](self->_rotationModel, "stop");
        -[NUNIAstronomyVistaView rotatable:](self->_astronomyVistaView, "rotatable:", *p_vista);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "homeCoordinate");
        objc_msgSend(v11, "setCenterCoordinate:animated:", 0);

      }
LABEL_12:
      -[NUNIAstronomyVistaView applyVista:transitionStyle:](self->_astronomyVistaView, "applyVista:transitionStyle:", *p_vista, 0);
      -[NUNIAstronomyVistaView showSupplemental:animated:](self->_astronomyVistaView, "showSupplemental:animated:", a3 == 3, 0);
      return;
  }
}

- (BOOL)_shouldHideStatusBarForViewMode:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)_startClockUpdates
{
  void *v3;
  CLKClockTimerToken *v4;
  CLKClockTimerToken *clockTimerToken;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  if (!self->_clockTimerToken)
  {
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__NTKAstronomyFaceView__startClockUpdates__block_invoke;
    v6[3] = &unk_1E6BCED08;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "startUpdatesWithUpdateFrequency:withHandler:identificationLog:", 0, v6, &__block_literal_global_33);
    v4 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
  }
  objc_destroyWeak(&location);
}

void __42__NTKAstronomyFaceView__startClockUpdates__block_invoke(uint64_t a1, void *a2, id *a3)
{
  id WeakRetained;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTimeAnimated:", 1);

}

const __CFString *__42__NTKAstronomyFaceView__startClockUpdates__block_invoke_31()
{
  return CFSTR("astronomy face view");
}

- (void)_stopClockUpdates
{
  void *v3;
  CLKClockTimerToken *clockTimerToken;

  if (self->_clockTimerToken)
  {
    objc_msgSend(MEMORY[0x1E0C94130], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopUpdatesForToken:", self->_clockTimerToken);

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;

  }
}

- (void)_setAstronomyFaceViewModeSupplemental
{
  CLKUIColoringLabel *overrideDateLabel;
  void *v4;

  -[NTKAstronomyFaceView _disableCrown](self, "_disableCrown");
  overrideDateLabel = self->_overrideDateLabel;
  _NTKAstronomyFaceViewLocalizedNow();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setText:](overrideDateLabel, "setText:", v4);

  -[CLKUIColoringLabel setText:](self->_scrubLabel, "setText:", &stru_1E6BDC918);
  -[CLKUIColoringLabel setText:](self->_phaseLabel, "setText:", &stru_1E6BDC918);
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 1);
  -[UITapGestureRecognizer setEnabled:](self->_supplementalModeDoubleTapGesture, "setEnabled:", 1);
  -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 0);
  -[NTKAstronomyFaceView _hideLocationDot](self, "_hideLocationDot");
  -[NUNIAstronomyVistaView setFrameInterval:](self->_astronomyVistaView, "setFrameInterval:", 3);
  -[NUNIAstronomyVistaView startAnimation](self->_astronomyVistaView, "startAnimation");
  -[NTKAstronomyFaceView _startClockUpdates](self, "_startClockUpdates");
}

- (void)_setAstronomyFaceViewModeDefault
{
  CLKUIColoringLabel *overrideDateLabel;
  void *v4;
  NUNIAstronomyVistaView *astronomyVistaView;
  uint64_t v6;

  -[NTKAstronomyFaceView _enableCrownForAstronomyVista:](self, "_enableCrownForAstronomyVista:", self->_vista);
  overrideDateLabel = self->_overrideDateLabel;
  _NTKAstronomyFaceViewLocalizedNow();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setText:](overrideDateLabel, "setText:", v4);

  -[CLKUIColoringLabel setText:](self->_scrubLabel, "setText:", &stru_1E6BDC918);
  -[CLKUIColoringLabel setText:](self->_phaseLabel, "setText:", &stru_1E6BDC918);
  -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_astronomyVistaView, "updateSunLocationAnimated:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 1);
  -[UITapGestureRecognizer setEnabled:](self->_supplementalModeDoubleTapGesture, "setEnabled:", 1);
  -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 0);
  -[NTKAstronomyFaceView _showLocationDotIfNeeded](self, "_showLocationDotIfNeeded");
  astronomyVistaView = self->_astronomyVistaView;
  if (-[NTKFaceView editing](self, "editing"))
    v6 = 0;
  else
    v6 = 3;
  -[NUNIAstronomyVistaView setFrameInterval:](astronomyVistaView, "setFrameInterval:", v6);
  -[NUNIAstronomyVistaView startAnimation](self->_astronomyVistaView, "startAnimation");
  -[NTKAstronomyFaceView _startClockUpdates](self, "_startClockUpdates");
}

- (void)_setAstronomyFaceViewModeNonInteractive
{
  CLKUIColoringLabel *overrideDateLabel;
  void *v4;

  -[NTKAstronomyFaceView _disableCrown](self, "_disableCrown");
  overrideDateLabel = self->_overrideDateLabel;
  _NTKAstronomyFaceViewLocalizedNow();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setText:](overrideDateLabel, "setText:", v4);

  -[CLKUIColoringLabel setText:](self->_scrubLabel, "setText:", &stru_1E6BDC918);
  -[CLKUIColoringLabel setText:](self->_phaseLabel, "setText:", &stru_1E6BDC918);
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 0);
  -[UITapGestureRecognizer setEnabled:](self->_supplementalModeDoubleTapGesture, "setEnabled:", 0);
  -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 0);
  -[NTKAstronomyFaceView _hideLocationDot](self, "_hideLocationDot");
  -[NUNIAstronomyVistaView setFrameInterval:](self->_astronomyVistaView, "setFrameInterval:", 3);
  -[NUNIAstronomyVistaView stopAnimation](self->_astronomyVistaView, "stopAnimation");
  -[NTKAstronomyFaceView _stopClockUpdates](self, "_stopClockUpdates");
}

- (void)_setAstronomyFaceViewModeInteractive
{
  -[NTKAstronomyFaceView _enableCrownForAstronomyVista:](self, "_enableCrownForAstronomyVista:", self->_vista);
  -[UITapGestureRecognizer setEnabled:](self->_interactiveModeTapGesture, "setEnabled:", 1);
  -[UITapGestureRecognizer setEnabled:](self->_supplementalModeDoubleTapGesture, "setEnabled:", 1);
  -[UIPanGestureRecognizer setEnabled:](self->_spheroidPanGesture, "setEnabled:", 1);
  -[NTKAstronomyFaceView _hideLocationDot](self, "_hideLocationDot");
  -[NUNIAstronomyVistaView setFrameInterval:](self->_astronomyVistaView, "setFrameInterval:", 0);
  -[NUNIAstronomyVistaView startAnimation](self->_astronomyVistaView, "startAnimation");
  -[NTKAstronomyFaceView _startClockUpdates](self, "_startClockUpdates");
}

- (void)_handleInteractiveModeGesture:(id)a3
{
  int64_t v4;
  uint64_t v5;

  if (objc_msgSend(a3, "state") == 3 && (*((_BYTE *)self + 1264) & 1) == 0)
  {
    v4 = -[NTKDigitalFaceView viewMode](self, "viewMode");
    if ((unint64_t)(v4 - 2) >= 2)
    {
      if (v4)
        return;
      v5 = 2;
    }
    else
    {
      v5 = 0;
    }
    -[NTKAstronomyFaceView _animateTransitionToViewMode:](self, "_animateTransitionToViewMode:", v5);
  }
}

- (void)_handleSupplementalModeGesture:(id)a3
{
  int64_t v4;
  uint64_t v5;

  if (objc_msgSend(a3, "state") == 3 && (*((_BYTE *)self + 1264) & 1) == 0 && self->_vista == 2)
  {
    v4 = -[NTKDigitalFaceView viewMode](self, "viewMode");
    v5 = 3;
    if (v4 && v4 != 2)
    {
      if (v4 != 3)
        return;
      v5 = 0;
    }
    -[NTKAstronomyFaceView _animateTransitionToViewMode:](self, "_animateTransitionToViewMode:", v5);
  }
}

- (void)_handleSpheroidPanGesture:(id)a3
{
  id v4;
  void *v5;
  float32x2_t *v6;
  double v7;
  unint64_t vista;
  void *v9;
  BOOL v10;
  double v11;
  uint64_t v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  NUNIAstronomyRotationModel *rotationModel;
  void *v16;
  float64_t v17;
  float64x2_t v18;
  void *v19;
  float64_t v20;
  float64x2_t v21;
  float32x2_t v22;
  float32x2_t v23;
  float v24;
  float recentMovement;
  float v26;
  double v27;
  float v28;
  float v29;
  id v30;

  v4 = a3;
  if (self->_vista != 2 && !self->_overrideDate)
  {
    v30 = v4;
    -[NUNIAstronomyRotationModel rotatable](self->_rotationModel, "rotatable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (float32x2_t *)-[NUNIAstronomyRotationModel interactionSettings](self->_rotationModel, "interactionSettings");
    vista = self->_vista;
    if (vista)
    {
      LODWORD(v7) = 1.0;
      v27 = v7;
      if (vista == 1)
      {
        -[NUNIAstronomyRotationModel setPulling:](self->_rotationModel, "setPulling:", 1, *(_QWORD *)&v7);
        -[NUNIAstronomyVistaView rotatable:](self->_astronomyVistaView, "rotatable:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "homeCoordinate");
        v10 = v11 < 0.0;
        LODWORD(v11) = 1.0;
        if (v10)
          *(float *)&v11 = -1.0;
        v27 = v11;

      }
    }
    else
    {
      LODWORD(v7) = 1.0;
      v27 = v7;
      -[NUNIAstronomyRotationModel setPulling:](self->_rotationModel, "setPulling:", 0);
    }
    v12 = objc_msgSend(v30, "state", *(_QWORD *)&v27);
    switch(v12)
    {
      case 3:
        rotationModel = self->_rotationModel;
        objc_msgSend(v30, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "velocityInView:", v16);
        v18.f64[1] = v17;
        -[NUNIAstronomyRotationModel push:](rotationModel, "push:", COERCE_DOUBLE(vmul_f32(v6[1], vmul_n_f32(vcvt_f32_f64(v18), v28))));

        break;
      case 2:
        objc_msgSend(v30, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "translationInView:", v19);
        v21.f64[1] = v20;
        v22 = vmul_n_f32(vcvt_f32_f64(v21), v28);

        v23 = vsub_f32(*(float32x2_t *)self->_previousTranslation, v22);
        v24 = sqrtf(vmlas_n_f32(COERCE_FLOAT(vmul_f32(v23, v23).i32[1]), v23.f32[0], v23.f32[0]));
        recentMovement = self->_recentMovement;
        if (recentMovement != 0.0)
          v24 = (float)(recentMovement * 0.6) + (float)(v24 * 0.4);
        self->_recentMovement = v24;
        v29 = vmul_f32(v22, *v6).f32[0];
        *(float32x2_t *)self->_previousTranslation = v22;
        NUNIAstronomyClampLatitude();
        objc_msgSend(v5, "setCenterCoordinate:", v26, self->_initialCoordinate.longitude + v29);
        break;
      case 1:
        -[NUNIAstronomyRotationModel stop](self->_rotationModel, "stop");
        objc_msgSend(v5, "centerCoordinate");
        self->_recentMovement = 0.0;
        self->_initialCoordinate.latitude = v13;
        self->_initialCoordinate.longitude = v14;
        *(_QWORD *)self->_previousTranslation = 0;
        break;
    }

    v4 = v30;
  }

}

- (void)astronomyVistaViewContentsAnimationFinished:(id)a3
{
  if ((-[NTKDigitalFaceView viewMode](self, "viewMode", a3) & 0xFFFFFFFFFFFFFFFDLL) == 0
    && (*((_BYTE *)self + 1264) & 1) == 0)
  {
    -[NTKAstronomyFaceView _enableCrownForAstronomyVista:](self, "_enableCrownForAstronomyVista:", self->_vista);
  }
  -[NTKAstronomyFaceView _showLocationDotIfNeeded](self, "_showLocationDotIfNeeded");
  kdebug_trace();
}

- (void)_applyDataMode
{
  int64_t v3;
  _BOOL8 v4;

  v3 = -[NTKFaceView dataMode](self, "dataMode");
  if (v3 == 1)
    v4 = 1;
  else
    v4 = v3 != 2 && self->_previousDataMode == 1;
  -[NTKAstronomyFaceView _applyDataModeAnimated:](self, "_applyDataModeAnimated:", v4);
}

- (void)_applyDataModeAnimated:(BOOL)a3
{
  int64_t v5;
  int64_t v6;
  uint64_t v7;

  if ((*((_BYTE *)self + 1264) & 2) != 0 && !-[NTKFaceView zooming](self, "zooming"))
  {
    v5 = -[NTKDigitalFaceView viewMode](self, "viewMode");
    v6 = -[NTKFaceView dataMode](self, "dataMode");
    if (self->_previousDataMode != v6)
      self->_previousDataMode = v6;
    if (v6 == 1)
      v7 = 0;
    else
      v7 = -[NTKFaceView editing](self, "editing") ^ 1;
    if (((*((_BYTE *)self + 1264) & 1) != 0 || v7 != v5)
      && ((*((_BYTE *)self + 1264) & 1) == 0 || v7 != self->_animatingToViewMode || !a3))
    {
      if (a3)
      {
        -[NTKAstronomyFaceView _animateTransitionToViewMode:](self, "_animateTransitionToViewMode:", v7);
      }
      else
      {
        -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_astronomyVistaView, "updateSunLocationAnimated:", 0);
        -[NTKAstronomyFaceView _applyViewMode:](self, "_applyViewMode:", v7);
      }
    }
  }
}

- (void)_loadSnapshotContentViews
{
  NTKAstronomyFaceView *v2;
  void *v3;
  uint64_t v4;
  NUNIAstronomyRotationModel *rotationModel;
  uint64_t v6;
  NSDateFormatter *v7;
  uint64_t v8;
  NSDateFormatter *v9;
  uint64_t v10;
  NSDateFormatter *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NTKDateComplicationLabel *v27;
  void *v28;
  uint64_t v29;
  NTKDateComplicationLabel *legacyDateLabel;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  UIImageView *legacyLeftBottomImageView;
  id v38;
  void *v39;
  uint64_t v40;
  UIImageView *legacyRightBottomImageView;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  double v51;
  double v52;
  double v53;
  double v54;
  uint64_t v55;
  CLKUIColoringLabel *scrubLabel;
  uint64_t v57;
  CLKUIColoringLabel *phaseLabel;
  CLKUIColoringLabel *v59;
  void *v60;
  CLKUIColoringLabel *v61;
  void *v62;
  uint64_t v63;
  CLKUIColoringLabel *overrideDateLabel;
  void *v65;
  uint64_t v66;
  CLKUIColoringLabel *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NUNIAstronomyLocationDot *v72;
  NUNIAstronomyLocationDot *locationDot;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  double v80;
  int v81;
  uint64_t v82;
  NSObject *v83;
  id v84;
  id v85;
  NTKAstronomyFaceView *v86;
  uint64_t v87;
  UIPanGestureRecognizer *spheroidPanGesture;
  uint64_t v89;
  UITapGestureRecognizer *supplementalModeDoubleTapGesture;
  uint64_t v91;
  UITapGestureRecognizer *interactiveModeTapGesture;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  NTKAstronomyFaceView *v99;
  void *v100;
  _QWORD block[4];
  id v102;
  id v103;
  id v104;
  int v105;
  id location;
  objc_super v107;
  objc_super v108;

  v2 = self;
  v108.receiver = self;
  v108.super_class = (Class)NTKAstronomyFaceView;
  -[NTKDigitalFaceView _loadSnapshotContentViews](&v108, sel__loadSnapshotContentViews);
  if ((*((_BYTE *)v2 + 1264) & 2) == 0)
  {
    -[NTKFaceView foregroundContainerView](v2, "foregroundContainerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v107.receiver = v2;
    v107.super_class = (Class)NTKAstronomyFaceView;
    -[NTKDigitalFaceView setViewMode:](&v107, sel_setViewMode_, 1);
    *((_BYTE *)v2 + 1264) &= ~1u;
    *((_BYTE *)v2 + 1264) &= ~8u;
    v4 = objc_opt_new();
    rotationModel = v2->_rotationModel;
    v2->_rotationModel = (NUNIAstronomyRotationModel *)v4;

    -[NUNIAstronomyRotationModel setObserver:](v2->_rotationModel, "setObserver:", v2);
    v6 = objc_opt_new();
    v7 = v2->_scrubDateFormatter[0];
    v2->_scrubDateFormatter[0] = (NSDateFormatter *)v6;

    v8 = objc_opt_new();
    v9 = v2->_scrubDateFormatter[1];
    v2->_scrubDateFormatter[1] = (NSDateFormatter *)v8;

    v10 = objc_opt_new();
    v11 = v2->_scrubDateFormatter[2];
    v2->_scrubDateFormatter[2] = (NSDateFormatter *)v10;

    -[NTKFaceView device](v2, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKAstronomyLayoutForDevice(v12);

    -[NTKAstronomyFaceView _setupAstronomyVistaView](v2, "_setupAstronomyVistaView");
    -[NUNIAstronomyVistaView setObserver:](v2->_astronomyVistaView, "setObserver:", v2);
    +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentLocation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *((_BYTE *)v2 + 1264);
    v97 = v13;
    if (v14)
    {
      *((_BYTE *)v2 + 1264) = v15 | 4;
      objc_msgSend(v13, "currentLocation");
    }
    else
    {
      *((_BYTE *)v2 + 1264) = v15 & 0xFB;
      objc_msgSend(v13, "anyLocation");
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinate");
    v18 = v17;
    v20 = v19;

    -[NUNIAstronomyVistaView rotatable:](v2->_astronomyVistaView, "rotatable:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NUNIAstronomyVistaView rotatable:](v2->_astronomyVistaView, "rotatable:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setHomeCoordinate:", 0.0, 0.0);
    v95 = v22;
    objc_msgSend(v22, "setCenterCoordinate:", 0.0, 0.0);
    objc_msgSend(v21, "setHomeCoordinate:", v18, v20);
    v96 = v21;
    objc_msgSend(v21, "setCenterCoordinate:", v18, v20);
    -[NTKFaceView timeView](v2, "timeView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setOverrideDate:duration:", v2->_overrideDate, 0.0);

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[NTKFaceView device](v2, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = objc_msgSend(v26, "nrDeviceVersion");

    if (v22 >> 16 <= 4)
    {
      v27 = [NTKDateComplicationLabel alloc];
      -[NTKFaceView device](v2, "device");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[NTKDateComplicationLabel initWithSizeStyle:accentType:forDevice:](v27, "initWithSizeStyle:accentType:forDevice:", 1, 1, v28);
      legacyDateLabel = v2->_legacyDateLabel;
      v2->_legacyDateLabel = (NTKDateComplicationLabel *)v29;

      objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", *(float *)&_NTKAstronomyLayoutForDevice_constants);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDateComplicationLabel setFont:](v2->_legacyDateLabel, "setFont:", v31);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKDateComplicationLabel setTextColor:](v2->_legacyDateLabel, "setTextColor:", v32);

      if (objc_msgSend(v25, "isEqualToString:", CFSTR("he")))
        v33 = 2048;
      else
        v33 = 8;
      -[NTKDateComplicationLabel setOverrideDateStyle:](v2->_legacyDateLabel, "setOverrideDateStyle:", v33);
      -[NTKDateComplicationLabel setUserInteractionEnabled:](v2->_legacyDateLabel, "setUserInteractionEnabled:", 0);
      -[NTKAstronomyFaceView addSubview:](v2, "addSubview:", v2->_legacyDateLabel);
      v34 = objc_alloc(MEMORY[0x1E0DC3890]);
      NTKImageNamed(CFSTR("AstronomyLegacyLeftBottom"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v34, "initWithImage:", v35);
      legacyLeftBottomImageView = v2->_legacyLeftBottomImageView;
      v2->_legacyLeftBottomImageView = (UIImageView *)v36;

      -[UIImageView setUserInteractionEnabled:](v2->_legacyLeftBottomImageView, "setUserInteractionEnabled:", 0);
      -[NTKAstronomyFaceView addSubview:](v2, "addSubview:", v2->_legacyLeftBottomImageView);
      v38 = objc_alloc(MEMORY[0x1E0DC3890]);
      NTKImageNamed(CFSTR("AstronomyLegacyRightBottom"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v38, "initWithImage:", v39);
      legacyRightBottomImageView = v2->_legacyRightBottomImageView;
      v2->_legacyRightBottomImageView = (UIImageView *)v40;

      -[UIImageView setUserInteractionEnabled:](v2->_legacyRightBottomImageView, "setUserInteractionEnabled:", 0);
      -[NTKAstronomyFaceView addSubview:](v2, "addSubview:", v2->_legacyRightBottomImageView);
    }
    -[NTKAstronomyFaceView digitalTimeLabelSmallInUpperRightCornerStyle](v2, "digitalTimeLabelSmallInUpperRightCornerStyle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "designatorFont");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "pointSize");
    v45 = v44;

    v46 = *MEMORY[0x1E0DC1448];
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v45, *MEMORY[0x1E0DC1448]);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "CLKFontWithMonospacedNumbers");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "CLKFontWithAlternativePunctuation");
    v49 = objc_claimAutoreleasedReturnValue();

    v50 = objc_alloc((Class)off_1E6BCA6E0);
    v51 = *MEMORY[0x1E0C9D648];
    v52 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v53 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v54 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v55 = objc_msgSend(v50, "initWithFrame:options:", 0, *MEMORY[0x1E0C9D648], v52, v53, v54);
    scrubLabel = v2->_scrubLabel;
    v2->_scrubLabel = (CLKUIColoringLabel *)v55;

    -[CLKUIColoringLabel setFont:](v2->_scrubLabel, "setFont:", v49);
    -[CLKUIColoringLabel setUsesLegibility:](v2->_scrubLabel, "setUsesLegibility:", 1);
    objc_msgSend(v3, "addSubview:", v2->_scrubLabel);
    v57 = objc_msgSend(objc_alloc((Class)off_1E6BCA6E0), "initWithFrame:options:", 0, v51, v52, v53, v54);
    phaseLabel = v2->_phaseLabel;
    v2->_phaseLabel = (CLKUIColoringLabel *)v57;

    -[CLKUIColoringLabel setNumberOfLines:](v2->_phaseLabel, "setNumberOfLines:", 0);
    -[CLKUIColoringLabel setUsesLegibility:](v2->_phaseLabel, "setUsesLegibility:", 1);
    v100 = (void *)v49;
    -[CLKUIColoringLabel setFont:](v2->_phaseLabel, "setFont:", v49);
    v59 = v2->_phaseLabel;
    NTKAstronomyComplicationForegroundColor(1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setTextColor:](v59, "setTextColor:", v60);

    v61 = v2->_phaseLabel;
    _NTKAstronomyComplicationShadowColor(1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLKUIColoringLabel setShadowColor:](v61, "setShadowColor:", v62);

    objc_msgSend(v3, "addSubview:", v2->_phaseLabel);
    v63 = objc_msgSend(objc_alloc((Class)off_1E6BCA6E0), "initWithFrame:options:", 0, v51, v52, v53, v54);
    overrideDateLabel = v2->_overrideDateLabel;
    v2->_overrideDateLabel = (CLKUIColoringLabel *)v63;

    -[CLKUIColoringLabel setTextAlignment:](v2->_overrideDateLabel, "setTextAlignment:", 0);
    v98 = v25;
    v99 = v2;
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("th"))
      && (-[NTKFaceView device](v2, "device"),
          v65 = (void *)objc_claimAutoreleasedReturnValue(),
          v66 = objc_msgSend(v65, "deviceCategory"),
          v65,
          v66 == 1))
    {
      v67 = v2->_overrideDateLabel;
      objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:weight:", v45 + -4.0, v46);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "CLKFontWithMonospacedNumbers");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "CLKFontWithAlternativePunctuation");
      v70 = v3;
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      -[CLKUIColoringLabel setFont:](v67, "setFont:", v71);

      v3 = v70;
      v2 = v99;

    }
    else
    {
      -[CLKUIColoringLabel setFont:](v2->_overrideDateLabel, "setFont:", v49);
    }
    -[CLKUIColoringLabel setUsesLegibility:](v2->_overrideDateLabel, "setUsesLegibility:", 1);
    objc_msgSend(v3, "addSubview:", v2->_overrideDateLabel);
    v72 = (NUNIAstronomyLocationDot *)objc_alloc_init(MEMORY[0x1E0D518B8]);
    locationDot = v2->_locationDot;
    v2->_locationDot = v72;

    v74 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v51, v52, v53, v54);
    objc_msgSend(MEMORY[0x1E0C944D0], "systemFontOfSize:", *(float *)&dword_1EF175C54);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setFont:", v75);

    NTKAstronomyComplicationForegroundColor(2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "setTextColor:", v76);

    objc_msgSend(v74, "font");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "lineHeight");
    v79 = v78;
    v94 = v77;
    objc_msgSend(v77, "descender");
    *(float *)&v80 = v79 + v80;
    v2->_supplementalFontLineHeightPlusDescender = roundf(*(float *)&v80);
    objc_initWeak(&location, v2);
    v81 = 0;
    v82 = MEMORY[0x1E0C809B0];
    v83 = MEMORY[0x1E0C80D38];
    do
    {
      block[0] = v82;
      block[1] = 3221225472;
      block[2] = __49__NTKAstronomyFaceView__loadSnapshotContentViews__block_invoke;
      block[3] = &unk_1E6BD8940;
      objc_copyWeak(&v104, &location);
      v105 = v81;
      v84 = v74;
      v102 = v84;
      v85 = v3;
      v103 = v85;
      dispatch_async(v83, block);

      objc_destroyWeak(&v104);
      ++v81;
    }
    while (v81 != 8);
    v86 = v99;
    v87 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v99, sel__handleSpheroidPanGesture_);
    spheroidPanGesture = v99->_spheroidPanGesture;
    v99->_spheroidPanGesture = (UIPanGestureRecognizer *)v87;

    -[UIPanGestureRecognizer setMaximumNumberOfTouches:](v99->_spheroidPanGesture, "setMaximumNumberOfTouches:", 1);
    -[UIPanGestureRecognizer setDelegate:](v86->_spheroidPanGesture, "setDelegate:", v86);
    v89 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v99, sel__handleSupplementalModeGesture_);
    supplementalModeDoubleTapGesture = v99->_supplementalModeDoubleTapGesture;
    v99->_supplementalModeDoubleTapGesture = (UITapGestureRecognizer *)v89;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v99->_supplementalModeDoubleTapGesture, "setNumberOfTapsRequired:", 2);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v99->_supplementalModeDoubleTapGesture, "setNumberOfTouchesRequired:", 1);
    v91 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v99, sel__handleInteractiveModeGesture_);
    interactiveModeTapGesture = v99->_interactiveModeTapGesture;
    v99->_interactiveModeTapGesture = (UITapGestureRecognizer *)v91;

    -[UITapGestureRecognizer setNumberOfTapsRequired:](v99->_interactiveModeTapGesture, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v99->_interactiveModeTapGesture, "setNumberOfTouchesRequired:", 1);
    -[UITapGestureRecognizer setDelegate:](v86->_interactiveModeTapGesture, "setDelegate:", v86);
    -[UITapGestureRecognizer setCancelsTouchesInView:](v99->_interactiveModeTapGesture, "setCancelsTouchesInView:", 0);
    -[UITapGestureRecognizer requireGestureRecognizerToFail:](v86->_interactiveModeTapGesture, "requireGestureRecognizerToFail:", v86->_supplementalModeDoubleTapGesture);
    -[NTKAstronomyFaceView addGestureRecognizer:](v86, "addGestureRecognizer:", v86->_spheroidPanGesture);
    -[NTKAstronomyFaceView addGestureRecognizer:](v86, "addGestureRecognizer:", v86->_interactiveModeTapGesture);
    -[NTKAstronomyFaceView addGestureRecognizer:](v86, "addGestureRecognizer:", v86->_supplementalModeDoubleTapGesture);
    *((_BYTE *)v99 + 1264) |= 2u;
    -[NTKAstronomyFaceView _applyVista:](v86, "_applyVista:", v86->_vista);
    -[NTKAstronomyFaceView _applyViewMode:](v99, "_applyViewMode:", 1);
    -[NTKAstronomyFaceView _applyDataModeAnimated:](v99, "_applyDataModeAnimated:", 0);
    -[NTKAstronomyFaceView _updateLocaleAnimated:](v99, "_updateLocaleAnimated:", 0);
    -[NUNIAstronomyVistaView updateSunLocationAnimated:](v99->_astronomyVistaView, "updateSunLocationAnimated:", 0);
    -[NTKAstronomyFaceView setNeedsLayout](v99, "setNeedsLayout");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "addObserver:selector:name:object:", v99, sel__asyncUpdateTime, *MEMORY[0x1E0DC4838], 0);
    objc_msgSend(v93, "addObserver:selector:name:object:", v99, sel__asyncUpdateTime, *MEMORY[0x1E0C99690], 0);
    objc_msgSend(v93, "addObserver:selector:name:object:", v99, sel__asyncUpdateLocale, *MEMORY[0x1E0C99720], 0);

    objc_destroyWeak(&location);
  }
}

void __49__NTKAstronomyFaceView__loadSnapshotContentViews__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  CGSize v23;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if ((WeakRetained[1264] & 2) != 0)
    {
      v3 = WeakRetained + 1024;
      v4 = *(int *)(a1 + 56);
      if (!*(_QWORD *)&WeakRetained[8 * v4 + 1024])
      {
        v5 = (void *)MEMORY[0x1E0CB3940];
        v22 = WeakRetained;
        v6 = _loadSnapshotContentViews_s_labelLocalizationKey[v4];
        objc_msgSend(v5, "stringWithFormat:", CFSTR("PLANET%d"), v4);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(void **)(a1 + 32);
        NTKClockFaceLocalizedString(v6, v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v9);

        objc_msgSend(*(id *)(a1 + 32), "sizeToFit");
        objc_msgSend(*(id *)(a1 + 32), "bounds");
        v11 = v10;
        v13 = v12;
        objc_msgSend(v22, "device");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "screenScale");
        v16 = v15;
        v23.width = v11;
        v23.height = v13;
        UIGraphicsBeginImageContextWithOptions(v23, 0, v16);

        objc_msgSend(*(id *)(a1 + 32), "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "renderInContext:", UIGraphicsGetCurrentContext());

        UIGraphicsGetImageFromCurrentImageContext();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        UIGraphicsEndImageContext();
        v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v18);
        v20 = *(int *)(a1 + 56);
        v21 = *(void **)&v3[8 * v20];
        *(_QWORD *)&v3[8 * v20] = v19;

        objc_msgSend(*(id *)&v3[8 * *(int *)(a1 + 56)], "setAlpha:", 0.0);
        objc_msgSend(*(id *)(a1 + 40), "addSubview:", *(_QWORD *)&v3[8 * *(int *)(a1 + 56)]);

        objc_msgSend(v22, "_layoutSpheroidLabel:", *(unsigned int *)(a1 + 56));
        WeakRetained = v22;
      }
    }
  }

}

- (BOOL)_needsForegroundContainerView
{
  return 1;
}

- (void)_layoutForegroundContainerView
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
  void *v12;
  double v13;
  double v14;
  void *v15;
  CLKUIColoringLabel *scrubLabel;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CLKUIColoringLabel *v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  NUNIAstronomyLocationDot *locationDot;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView _layoutForegroundContainerView](&v29, sel__layoutForegroundContainerView);
  -[NTKAstronomyFaceView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[NTKAstronomyFaceView digitalTimeLabelSmallInUpperRightCornerStyle](self, "digitalTimeLabelSmallInUpperRightCornerStyle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutRule");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "referenceFrame");
  v14 = v13;

  -[CLKUIColoringLabel text](self->_scrubLabel, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  scrubLabel = self->_scrubLabel;
  _NTKAstronomyFaceViewLocalizedNow();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIColoringLabel setText:](scrubLabel, "setText:", v17);

  -[CLKUIColoringLabel sizeToFit](self->_scrubLabel, "sizeToFit");
  -[CLKUIColoringLabel frame](self->_scrubLabel, "frame");
  v19 = v18;
  -[CLKUIColoringLabel setText:](self->_scrubLabel, "setText:", v15);
  -[NTKFaceView device](self, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKAstronomyLayoutForDevice(v20);
  v21 = *(double *)&qword_1EF175C70;

  -[CLKUIColoringLabel setFrame:](self->_overrideDateLabel, "setFrame:", v21, v14, v21 * -2.0 + v8 * 0.75, v19);
  v22 = self->_scrubLabel;
  -[CLKUIColoringLabel frame](self->_overrideDateLabel, "frame");
  -[CLKUIColoringLabel setFrame:](v22, "setFrame:", v21, v10 - v19 - v23, v8 + v21 * -2.0, v19);
  -[CLKUIColoringLabel frame](self->_scrubLabel, "frame");
  self->_phaseLabelDefaultFrame.origin.x = v21;
  self->_phaseLabelDefaultFrame.origin.y = v24 - v19;
  self->_phaseLabelDefaultFrame.size.width = v8 + v21 * -2.0;
  self->_phaseLabelDefaultFrame.size.height = v19;
  -[NTKAstronomyFaceView _layoutPhaseLabel](self, "_layoutPhaseLabel");
  v25 = 0;
  do
  {
    v26 = -[NTKAstronomyFaceView _layoutSpheroidLabel:](self, "_layoutSpheroidLabel:", v25);
    v25 = (v25 + 1);
  }
  while ((_DWORD)v25 != 8);
  locationDot = self->_locationDot;
  MEMORY[0x1BCCA72B8](v26, v4, v6, v8, v10);
  -[NUNIAstronomyLocationDot setCenter:](locationDot, "setCenter:");
  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "bringSubviewToFront:", self->_locationDot);

  -[NTKAstronomyFaceView _showLocationDotIfNeeded](self, "_showLocationDotIfNeeded");
}

- (void)_unloadSnapshotContentViews
{
  void *v3;
  NTKDelayedBlock *wheelDelayedBlock;
  NTKDelayedBlock *physicalButtonDelayedBlock;
  NUNIAstronomyRotationModel *rotationModel;
  NSDateFormatter *v7;
  NSDateFormatter *v8;
  NSDateFormatter *v9;
  UITapGestureRecognizer *interactiveModeTapGesture;
  UITapGestureRecognizer *supplementalModeDoubleTapGesture;
  UIPanGestureRecognizer *spheroidPanGesture;
  void *v13;
  unsigned int v14;
  NTKDateComplicationLabel *legacyDateLabel;
  UIImageView *legacyLeftBottomImageView;
  UIImageView *legacyRightBottomImageView;
  NUNIAstronomyVistaView *astronomyVistaView;
  CLKUIColoringLabel *scrubLabel;
  CLKUIColoringLabel *phaseLabel;
  CLKUIColoringLabel *overrideDateLabel;
  NUNIAstronomyLocationDot *locationDot;
  NSDate *crownDate;
  NTKDigitalTimeLabelStyle *digitalTimeLabelDefaultStyle;
  NTKDigitalTimeLabelStyle *digitalTimeLabelSmallInUpperRightCornerStyle;
  uint64_t v26;
  UIImageView **spheroidLabels;
  UIImageView *v28;
  UIImageView *v29;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)NTKAstronomyFaceView;
  -[NTKDigitalFaceView _unloadSnapshotContentViews](&v30, sel__unloadSnapshotContentViews);
  if ((*((_BYTE *)self + 1264) & 2) != 0)
  {
    -[NTKAstronomyFaceView _stopClockUpdates](self, "_stopClockUpdates");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4838], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99690], 0);
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C99720], 0);
    -[NTKDelayedBlock cancel](self->_wheelDelayedBlock, "cancel");
    wheelDelayedBlock = self->_wheelDelayedBlock;
    self->_wheelDelayedBlock = 0;

    -[NTKDelayedBlock cancel](self->_physicalButtonDelayedBlock, "cancel");
    physicalButtonDelayedBlock = self->_physicalButtonDelayedBlock;
    self->_physicalButtonDelayedBlock = 0;

    *((_BYTE *)self + 1264) &= ~2u;
    *((_BYTE *)self + 1264) &= ~8u;
    *((_BYTE *)self + 1264) &= ~4u;
    -[NUNIAstronomyRotationModel setObserver:](self->_rotationModel, "setObserver:", 0);
    rotationModel = self->_rotationModel;
    self->_rotationModel = 0;

    v7 = self->_scrubDateFormatter[0];
    self->_scrubDateFormatter[0] = 0;

    v8 = self->_scrubDateFormatter[1];
    self->_scrubDateFormatter[1] = 0;

    v9 = self->_scrubDateFormatter[2];
    self->_scrubDateFormatter[2] = 0;

    -[NTKAstronomyFaceView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_interactiveModeTapGesture);
    -[NTKAstronomyFaceView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_supplementalModeDoubleTapGesture);
    -[NTKAstronomyFaceView removeGestureRecognizer:](self, "removeGestureRecognizer:", self->_spheroidPanGesture);
    interactiveModeTapGesture = self->_interactiveModeTapGesture;
    self->_interactiveModeTapGesture = 0;

    supplementalModeDoubleTapGesture = self->_supplementalModeDoubleTapGesture;
    self->_supplementalModeDoubleTapGesture = 0;

    spheroidPanGesture = self->_spheroidPanGesture;
    self->_spheroidPanGesture = 0;

    -[NTKFaceView device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "nrDeviceVersion");

    if (HIWORD(v14) <= 4u)
    {
      -[NTKDateComplicationLabel removeFromSuperview](self->_legacyDateLabel, "removeFromSuperview");
      -[UIImageView removeFromSuperview](self->_legacyLeftBottomImageView, "removeFromSuperview");
      -[UIImageView removeFromSuperview](self->_legacyRightBottomImageView, "removeFromSuperview");
      legacyDateLabel = self->_legacyDateLabel;
      self->_legacyDateLabel = 0;

      legacyLeftBottomImageView = self->_legacyLeftBottomImageView;
      self->_legacyLeftBottomImageView = 0;

      legacyRightBottomImageView = self->_legacyRightBottomImageView;
      self->_legacyRightBottomImageView = 0;

    }
    -[NUNIAstronomyVistaView removeFromSuperview](self->_astronomyVistaView, "removeFromSuperview");
    -[CLKUIColoringLabel removeFromSuperview](self->_scrubLabel, "removeFromSuperview");
    -[CLKUIColoringLabel removeFromSuperview](self->_phaseLabel, "removeFromSuperview");
    -[CLKUIColoringLabel removeFromSuperview](self->_overrideDateLabel, "removeFromSuperview");
    -[NUNIAstronomyLocationDot removeFromSuperview](self->_locationDot, "removeFromSuperview");
    astronomyVistaView = self->_astronomyVistaView;
    self->_astronomyVistaView = 0;

    scrubLabel = self->_scrubLabel;
    self->_scrubLabel = 0;

    phaseLabel = self->_phaseLabel;
    self->_phaseLabel = 0;

    overrideDateLabel = self->_overrideDateLabel;
    self->_overrideDateLabel = 0;

    locationDot = self->_locationDot;
    self->_locationDot = 0;

    crownDate = self->_crownDate;
    self->_crownDate = 0;

    digitalTimeLabelDefaultStyle = self->_digitalTimeLabelDefaultStyle;
    self->_digitalTimeLabelDefaultStyle = 0;

    digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelSmallInUpperRightCornerStyle;
    self->_digitalTimeLabelSmallInUpperRightCornerStyle = 0;

    v26 = 0;
    spheroidLabels = self->_spheroidLabels;
    do
    {
      v28 = spheroidLabels[v26];
      -[UIImageView removeFromSuperview](v28, "removeFromSuperview");
      v29 = spheroidLabels[v26];
      spheroidLabels[v26] = 0;

      ++v26;
    }
    while (v26 != 8);

  }
}

- (void)_applyShowContentForUnadornedSnapshot
{
  id v3;

  -[NTKFaceView timeView](self, "timeView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", -[NTKFaceView showContentForUnadornedSnapshot](self, "showContentForUnadornedSnapshot"));

}

- (void)_layoutPhaseLabel
{
  CGRect *p_phaseLabelDefaultFrame;
  double x;
  double y;
  double height;
  double v7;

  p_phaseLabelDefaultFrame = &self->_phaseLabelDefaultFrame;
  x = self->_phaseLabelDefaultFrame.origin.x;
  y = self->_phaseLabelDefaultFrame.origin.y;
  height = self->_phaseLabelDefaultFrame.size.height;
  -[CLKUIColoringLabel sizeThatFits:](self->_phaseLabel, "sizeThatFits:", self->_phaseLabelDefaultFrame.size.width, 0.0);
  -[CLKUIColoringLabel setFrame:](self->_phaseLabel, "setFrame:", x, y + height - v7, p_phaseLabelDefaultFrame->size.width, v7);
}

- (void)_layoutSpheroidLabel:(int)a3
{
  UIImageView *v5;
  void *v6;
  void *v7;
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
  UIImageView *v18;

  v5 = self->_spheroidLabels[a3];
  if (v5)
  {
    v18 = v5;
    -[NTKFaceView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKAstronomyLayoutForDevice(v6);

    LODWORD(v6) = CLKLayoutIsRTL();
    -[NTKFaceView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screenBounds");
    v9 = v8 - *(float *)&dword_1EF175C60 - *(float *)&dword_1EF175C64;

    v10 = *(float *)&dword_1EF175C60 + v9 / 7.0 * (double)a3;
    -[UIImageView sizeToFit](v18, "sizeToFit");
    -[UIImageView frame](v18, "frame");
    v12 = v11;
    v14 = v13;
    if ((_DWORD)v6)
    {
      -[NTKFaceView device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "screenBounds");
      v17 = v16 - *(float *)&dword_1EF175C5C - v12;

    }
    else
    {
      v17 = *(float *)&dword_1EF175C5C;
    }
    -[UIImageView setFrame:](v18, "setFrame:", v17, v10 + v14 * -0.5, v12, v14);
    v5 = v18;
  }

}

- (void)_layoutLegacyViews
{
  void *v3;
  unsigned int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;

  -[NTKFaceView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "nrDeviceVersion");

  if (HIWORD(v4) <= 4u)
  {
    -[NTKDateComplicationLabel sizeToFit](self->_legacyDateLabel, "sizeToFit");
    -[NTKDateComplicationLabel frame](self->_legacyDateLabel, "frame");
    v6 = v5;
    v8 = v7;
    -[NTKFaceView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRoundForDevice();
    v11 = v10;

    -[NTKDateComplicationLabel setFrame:](self->_legacyDateLabel, "setFrame:", v11, 0.0, v6, v8);
    -[NTKAstronomyFaceView bounds](self, "bounds");
    v13 = v12;
    v15 = v14;
    -[UIImageView image](self->_legacyLeftBottomImageView, "image");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "size");
    v18 = v17;

    -[UIImageView image](self->_legacyLeftBottomImageView, "image");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "size");
    v21 = v20;

    -[UIImageView setFrame:](self->_legacyLeftBottomImageView, "setFrame:", 0.0, v15 - v21, v18, v21);
    -[UIImageView image](self->_legacyRightBottomImageView, "image");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "size");
    v24 = v23;

    -[UIImageView image](self->_legacyRightBottomImageView, "image");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "size");
    v27 = v26;

    -[UIImageView setFrame:](self->_legacyRightBottomImageView, "setFrame:", v13 - v24, v15 - v27, v24, v27);
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAstronomyFaceView;
  -[NTKDigitalFaceView layoutSubviews](&v3, sel_layoutSubviews);
  -[NTKAstronomyFaceView bounds](self, "bounds");
  -[NUNIAstronomyVistaView setFrame:](self->_astronomyVistaView, "setFrame:");
  -[NTKAstronomyFaceView _layoutLegacyViews](self, "_layoutLegacyViews");
}

- (void)traitCollectionDidChange:(id)a3
{
  NTKDigitalTimeLabelStyle *digitalTimeLabelDefaultStyle;
  id v5;
  NTKDigitalTimeLabelStyle *digitalTimeLabelSmallInUpperRightCornerStyle;
  objc_super v7;

  digitalTimeLabelDefaultStyle = self->_digitalTimeLabelDefaultStyle;
  self->_digitalTimeLabelDefaultStyle = 0;
  v5 = a3;

  digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelSmallInUpperRightCornerStyle;
  self->_digitalTimeLabelSmallInUpperRightCornerStyle = 0;

  v7.receiver = self;
  v7.super_class = (Class)NTKAstronomyFaceView;
  -[NTKAstronomyFaceView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v5);

}

- (void)_showLocationDotIfNeeded
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  void *v6;

  if (self->_astronomyVistaView
    && !self->_vista
    && (*((_BYTE *)self + 1264) & 4) != 0
    && -[NUNIAstronomyRotationModel isAtHomeCoordinate](self->_rotationModel, "isAtHomeCoordinate")
    && (-[NUNIAstronomyLocationDot animating](self->_locationDot, "animating") & 1) == 0)
  {
    -[NUNIAstronomyLocationDot superview](self->_locationDot, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3
      || (v4 = -[NTKDigitalFaceView viewMode](self, "viewMode"), v3 = 0, v4)
      || (v5 = -[NTKFaceView editing](self, "editing"), v3 = 0, v5))
    {

    }
    else if ((*((_BYTE *)self + 1264) & 1) == 0)
    {
      -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addSubview:", self->_locationDot);

      -[NUNIAstronomyLocationDot setAlpha:](self->_locationDot, "setAlpha:", 1.0);
      -[NUNIAstronomyLocationDot startAnimation](self->_locationDot, "startAnimation");
    }
  }
}

- (void)_hideLocationDot
{
  -[NUNIAstronomyLocationDot stopAnimation](self->_locationDot, "stopAnimation");
  -[NUNIAstronomyLocationDot setAlpha:](self->_locationDot, "setAlpha:", 0.0);
  -[NUNIAstronomyLocationDot removeFromSuperview](self->_locationDot, "removeFromSuperview");
}

- (void)_asyncUpdateLocale
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42__NTKAstronomyFaceView__asyncUpdateLocale__block_invoke;
  v2[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __42__NTKAstronomyFaceView__asyncUpdateLocale__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateLocaleAnimated:", 1);

}

- (void)_asyncUpdateTime
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __40__NTKAstronomyFaceView__asyncUpdateTime__block_invoke;
  v2[3] = &unk_1E6BCD7F0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __40__NTKAstronomyFaceView__asyncUpdateTime__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateTimeAnimated:", 1);

}

- (void)_updateLocaleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  const __CFString *v5;
  id v6;

  if ((*((_BYTE *)self + 1264) & 2) != 0)
  {
    v3 = a3;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (CLKLocaleIs24HourMode())
      v5 = CFSTR("H:mm");
    else
      v5 = CFSTR("h:mm a");
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_scrubDateFormatter[0], "setLocalizedDateFormatFromTemplate:", v5);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_scrubDateFormatter[1], "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](self->_scrubDateFormatter[2], "setLocalizedDateFormatFromTemplate:", CFSTR("MM/dd/y"));
    -[NTKAstronomyFaceView _updateTimeAnimated:](self, "_updateTimeAnimated:", v3);

  }
}

- (void)_updateTimeAnimated:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  unsigned int v6;
  unint64_t v7;
  void *v8;
  id v9;

  if ((*((_BYTE *)self + 1264) & 2) != 0 && (*((_BYTE *)self + 1264) & 1) == 0)
  {
    v4 = a3;
    if (!-[NTKDigitalFaceView viewMode](self, "viewMode")
      && !-[NTKFaceView editing](self, "editing")
      && !-[NTKFaceView zooming](self, "zooming"))
    {
      -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_astronomyVistaView, "updateSunLocationAnimated:", v4);
    }
  }
  -[NTKFaceView device](self, "device", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "nrDeviceVersion");

  if (HIWORD(v6) <= 4u && (*((_BYTE *)self + 1264) & 2) != 0)
  {
    v7 = -[NTKDateComplicationLabel overrideDateStyle](self->_legacyDateLabel, "overrideDateStyle");
    -[NTKAstronomyFaceView _date](self, "_date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplicationDateFormatter stringForDate:withStyle:](NTKComplicationDateFormatter, "stringForDate:withStyle:", v8, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[NTKDateComplicationLabel setDateComplicationText:withDayRange:forDateStyle:](self->_legacyDateLabel, "setDateComplicationText:withDayRange:forDateStyle:", v9, 0x7FFFFFFFFFFFFFFFLL, 0, v7);
  }
}

- (void)_updateLocation:(id)a3 lastLocation:(id)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[NUNIAstronomyVistaView rotatable:](self->_astronomyVistaView, "rotatable:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *((_BYTE *)self + 1264);
  if (v9)
  {
    *((_BYTE *)self + 1264) = v8 | 4;
    objc_msgSend(v9, "coordinate");
    objc_msgSend(v7, "setHomeCoordinate:");
    -[NTKAstronomyFaceView _showLocationDotIfNeeded](self, "_showLocationDotIfNeeded");
  }
  else
  {
    *((_BYTE *)self + 1264) = v8 & 0xFB;
    objc_msgSend(v6, "coordinate");
    objc_msgSend(v7, "setHomeCoordinate:");
    -[NTKAstronomyFaceView _hideLocationDot](self, "_hideLocationDot");
  }
  -[NTKAstronomyFaceView _updateTimeAnimated:](self, "_updateTimeAnimated:", 1);

}

- (void)_becameActiveFace
{
  void *v3;
  NSString *v4;
  NSString *locationManagerToken;
  _QWORD v6[4];
  id v7;
  id location;

  +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__NTKAstronomyFaceView__becameActiveFace__block_invoke;
  v6[3] = &unk_1E6BD0A28;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "startLocationUpdatesWithIdentifier:handler:", CFSTR("ntk.astronomyFace"), v6);
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  locationManagerToken = self->_locationManagerToken;
  self->_locationManagerToken = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __41__NTKAstronomyFaceView__becameActiveFace__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_updateLocation:lastLocation:", v6, v5);

}

- (void)_becameInactiveFace
{
  void *v3;
  NSString *locationManagerToken;

  if (self->_locationManagerToken)
  {
    +[NTKLocationManager sharedLocationManager](NTKLocationManager, "sharedLocationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopLocationUpdatesForToken:", self->_locationManagerToken);

    locationManagerToken = self->_locationManagerToken;
    self->_locationManagerToken = 0;

  }
}

- (unint64_t)_detentTypeForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  return 2;
}

- (void)_setupAstronomyVistaView
{
  void *v3;
  int v4;
  int v5;
  int v6;
  int v7;
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
  void *v18;
  NUNIAstronomyVistaView *v19;
  NUNIAstronomyVistaView *astronomyVistaView;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id (*v30)(uint64_t);
  void *v31;
  id v32;
  id location;

  -[NTKFaceView device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKAstronomyLayoutForDevice(v3);
  v4 = dword_1EF175C58;
  v6 = dword_1EF175C60;
  v5 = dword_1EF175C64;
  v7 = dword_1EF175C68;

  -[NTKAstronomyFaceView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)MEMORY[0x1E0D518C8];
  -[NTKFaceView device](self, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "defaultConfigurationWithDevice:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (NUNIAstronomyVistaView *)objc_msgSend(objc_alloc(MEMORY[0x1E0D518D0]), "initWithFrame:configuration:", v18, v9, v11, v13, v15);
  astronomyVistaView = self->_astronomyVistaView;
  self->_astronomyVistaView = v19;

  LODWORD(v21) = v6;
  -[NUNIAstronomyVistaView setSupplementalTopInset:](self->_astronomyVistaView, "setSupplementalTopInset:", v21);
  LODWORD(v22) = v5;
  -[NUNIAstronomyVistaView setSupplementalBottomInset:](self->_astronomyVistaView, "setSupplementalBottomInset:", v22);
  LODWORD(v23) = v4;
  -[NUNIAstronomyVistaView setSupplementalHorizontalInset:](self->_astronomyVistaView, "setSupplementalHorizontalInset:", v23);
  LODWORD(v24) = v7;
  -[NUNIAstronomyVistaView setSupplementalSpheroidSize:](self->_astronomyVistaView, "setSupplementalSpheroidSize:", v24);
  objc_initWeak(&location, self);
  v25 = objc_alloc(MEMORY[0x1E0D518E0]);
  v28 = MEMORY[0x1E0C809B0];
  v29 = 3221225472;
  v30 = __48__NTKAstronomyFaceView__setupAstronomyVistaView__block_invoke;
  v31 = &unk_1E6BCD7C8;
  objc_copyWeak(&v32, &location);
  v26 = (void *)objc_msgSend(v25, "initWithSphereoids:currentDateBlock:", 16515070, &v28);
  objc_msgSend(v26, "setSnap:", 3, v28, v29, v30, v31);
  -[NUNIAstronomyVistaView setScene:](self->_astronomyVistaView, "setScene:", v26);
  -[NTKFaceView contentView](self, "contentView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addSubview:", self->_astronomyVistaView);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

}

id __48__NTKAstronomyFaceView__setupAstronomyVistaView__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_date");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)_timeLabelOptions
{
  return 1;
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3
{
  -[NTKAstronomyFaceView bounds](self, "bounds");
  return -[NTKAstronomyFaceView _digitalTimeLabelStyleFromViewMode:faceBounds:](self, "_digitalTimeLabelStyleFromViewMode:faceBounds:", a3);
}

- (id)_digitalTimeLabelStyleFromViewMode:(int64_t)a3 faceBounds:(CGRect)a4
{
  NTKDigitalTimeLabelStyle **p_digitalTimeLabelSmallInUpperRightCornerStyle;
  NTKDigitalTimeLabelStyle *digitalTimeLabelSmallInUpperRightCornerStyle;
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
  void *v17;
  uint64_t v18;
  NTKDigitalTimeLabelStyle *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;

  if ((unint64_t)a3 > 1)
  {
    p_digitalTimeLabelSmallInUpperRightCornerStyle = &self->_digitalTimeLabelSmallInUpperRightCornerStyle;
    digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelSmallInUpperRightCornerStyle;
    if (!digitalTimeLabelSmallInUpperRightCornerStyle)
    {
      -[NTKAstronomyFaceView bounds](self, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v28 = *MEMORY[0x1E0DC1448];
      -[NTKFaceView device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKDigitalTimeLabelStyle smallInUpperRightCornerStyleForBounds:weight:forDevice:](NTKDigitalTimeLabelStyle, "smallInUpperRightCornerStyleForBounds:weight:forDevice:", v15, v21, v23, v25, v27, v28);
      v29 = objc_claimAutoreleasedReturnValue();
      v17 = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
      *p_digitalTimeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v29;
      goto LABEL_6;
    }
  }
  else
  {
    p_digitalTimeLabelSmallInUpperRightCornerStyle = &self->_digitalTimeLabelDefaultStyle;
    digitalTimeLabelSmallInUpperRightCornerStyle = self->_digitalTimeLabelDefaultStyle;
    if (!digitalTimeLabelSmallInUpperRightCornerStyle)
    {
      -[NTKAstronomyFaceView bounds](self, "bounds", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      -[NTKFaceView device](self, "device");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = NTKDigitalTimeLabelStyleWideRightSideMargin(v15);
      -[NTKFaceView device](self, "device");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKDigitalTimeLabelStyle defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:](NTKDigitalTimeLabelStyle, "defaultStyleForBounds:withRightSideMargin:applyAdvanceFudge:forDevice:", 1, v17, v8, v10, v12, v14, v16);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
      *p_digitalTimeLabelSmallInUpperRightCornerStyle = (NTKDigitalTimeLabelStyle *)v18;

LABEL_6:
      digitalTimeLabelSmallInUpperRightCornerStyle = *p_digitalTimeLabelSmallInUpperRightCornerStyle;
    }
  }
  return digitalTimeLabelSmallInUpperRightCornerStyle;
}

- (id)digitalTimeLabelDefaultStyle
{
  return -[NTKAstronomyFaceView _digitalTimeLabelStyleFromViewMode:](self, "_digitalTimeLabelStyleFromViewMode:", 0);
}

- (id)digitalTimeLabelSmallInUpperRightCornerStyle
{
  return -[NTKAstronomyFaceView _digitalTimeLabelStyleFromViewMode:](self, "_digitalTimeLabelStyleFromViewMode:", 2);
}

- (BOOL)_timeLabelUsesLegibility
{
  return 1;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  NSDate *v7;
  void *v8;
  NSDate *v9;

  v7 = (NSDate *)a3;
  if ((*((_BYTE *)self + 1264) & 2) != 0 && self->_overrideDate != v7)
  {
    v9 = v7;
    objc_storeStrong((id *)&self->_overrideDate, a3);
    -[NTKFaceView timeView](self, "timeView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOverrideDate:duration:", v9, 0.0);
    objc_msgSend(v8, "setFrameUsingCurrentStyle");
    -[NUNIAstronomyVistaView updateSunLocationAnimated:](self->_astronomyVistaView, "updateSunLocationAnimated:", a4 > 0.0);

    v7 = v9;
  }

}

- (void)setTimeOffset:(double)a3
{
  id v4;

  if ((*((_BYTE *)self + 1264) & 2) != 0)
  {
    -[NTKFaceView timeView](self, "timeView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTimeOffset:", a3);

  }
}

- (void)_prepareToZoom
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView _prepareToZoom](&v4, sel__prepareToZoom);
  if ((*((_BYTE *)self + 1264) & 2) != 0)
  {
    -[NUNIAstronomyVistaView scene](self->_astronomyVistaView, "scene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUpdatable:", 0);

  }
}

- (void)_cleanupAfterZoom
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView _cleanupAfterZoom](&v4, sel__cleanupAfterZoom);
  if ((*((_BYTE *)self + 1264) & 2) != 0)
  {
    -[NUNIAstronomyVistaView scene](self->_astronomyVistaView, "scene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUpdatable:", 1);

  }
}

- (BOOL)_wheelChangedWithEvent:(id)a3
{
  id v4;
  BOOL v5;
  NTKDelayedBlock *v7;
  NTKDelayedBlock *v8;
  NTKDelayedBlock *wheelDelayedBlock;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  if (!self->_physicalButtonDelayedBlock)
  {
    if (!-[NTKAstronomyFaceView _canEnterInteractiveMode](self, "_canEnterInteractiveMode"))
    {
      v5 = 1;
      goto LABEL_3;
    }
    if (!self->_wheelDelayedBlock)
    {
      objc_initWeak(&location, self);
      v7 = [NTKDelayedBlock alloc];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __47__NTKAstronomyFaceView__wheelChangedWithEvent___block_invoke;
      v10[3] = &unk_1E6BCE148;
      objc_copyWeak(&v11, &location);
      v8 = -[NTKDelayedBlock initWithDelay:action:](v7, "initWithDelay:action:", v10, 0.2);
      wheelDelayedBlock = self->_wheelDelayedBlock;
      self->_wheelDelayedBlock = v8;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  v5 = 0;
LABEL_3:

  return v5;
}

void __47__NTKAstronomyFaceView__wheelChangedWithEvent___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_wheelDelayedBlockFired");

}

- (void)_wheelDelayedBlockFired
{
  NTKDelayedBlock *wheelDelayedBlock;

  wheelDelayedBlock = self->_wheelDelayedBlock;
  self->_wheelDelayedBlock = 0;

  if (!self->_physicalButtonDelayedBlock)
  {
    if (-[NTKAstronomyFaceView _canEnterInteractiveMode](self, "_canEnterInteractiveMode"))
      -[NTKAstronomyFaceView _animateTransitionToViewMode:](self, "_animateTransitionToViewMode:", 2);
  }
}

- (void)_physicalButtonDelayedBlockFired
{
  NTKDelayedBlock *physicalButtonDelayedBlock;

  physicalButtonDelayedBlock = self->_physicalButtonDelayedBlock;
  self->_physicalButtonDelayedBlock = 0;

}

- (void)_enableCrownForAstronomyVista:(unint64_t)a3
{
  char v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView _enableCrown](&v5, sel__enableCrown, a3);
  if (-[NTKFaceView editing](self, "editing"))
    v4 = 0;
  else
    v4 = 8;
  *((_BYTE *)self + 1264) = *((_BYTE *)self + 1264) & 0xF7 | v4;
}

- (void)_disableCrown
{
  NSDate *crownDate;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView _disableCrown](&v4, sel__disableCrown);
  crownDate = self->_crownDate;
  self->_crownDate = 0;

  *((_BYTE *)self + 1264) &= ~8u;
  -[NTKAstronomyFaceView _updateTimeAnimated:](self, "_updateTimeAnimated:", 1);
}

- (BOOL)_canEnterInteractiveMode
{
  return (*((_BYTE *)self + 1264) & 1) == 0 && -[NTKDigitalFaceView viewMode](self, "viewMode") != 2;
}

- (BOOL)_shouldHandleHardwareEvents
{
  return (*((unsigned __int8 *)self + 1264) >> 3) & 1;
}

- (void)_applyVista:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  kdebug_trace();
  self->_vista = a3;
  if ((*((_BYTE *)self + 1264) & 2) != 0)
  {
    -[NUNIAstronomyRotationModel stop](self->_rotationModel, "stop");
    -[NUNIAstronomyVistaView rotatable:](self->_astronomyVistaView, "rotatable:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[NUNIAstronomyRotationModel setRotatable:](self->_rotationModel, "setRotatable:", v7);
    if (v7)
    {
      objc_msgSend(v7, "homeCoordinate");
      objc_msgSend(v7, "setCenterCoordinate:animated:", 0);
    }
    -[NUNIAstronomyVistaView applyVista:transitionStyle:](self->_astronomyVistaView, "applyVista:transitionStyle:", a3, 0);
    -[NTKAstronomyFaceView _updateTimeAnimated:](self, "_updateTimeAnimated:", 0);
    NTKAstronomyComplicationForegroundColor(self->_vista);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKAstronomyComplicationShadowColor(self->_vista);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKDigitialUtilitarianFaceViewComplicationFactory setShadowColor:faceView:](self->_faceViewComplicationFactory, "setShadowColor:faceView:", v6, self);
    -[NTKDigitialUtilitarianFaceViewComplicationFactory setForegroundColor:faceView:](self->_faceViewComplicationFactory, "setForegroundColor:faceView:", v5, self);
    -[CLKUIColoringLabel setTextColor:](self->_overrideDateLabel, "setTextColor:", v5);
    -[CLKUIColoringLabel setShadowColor:](self->_overrideDateLabel, "setShadowColor:", v6);
    -[CLKUIColoringLabel setTextColor:](self->_scrubLabel, "setTextColor:", v5);
    -[CLKUIColoringLabel setShadowColor:](self->_scrubLabel, "setShadowColor:", v6);

  }
}

- (void)_applyFromVista:(unint64_t)a3 toVista:(unint64_t)a4 fraction:(double)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  NTKAstronomyComplicationForegroundColor(a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NTKAstronomyComplicationForegroundColor(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v8, v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  _NTKAstronomyComplicationShadowColor(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKAstronomyComplicationShadowColor(a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKDigitialUtilitarianFaceViewComplicationFactory setShadowColor:faceView:](self->_faceViewComplicationFactory, "setShadowColor:faceView:", v12, self);
  -[NTKDigitialUtilitarianFaceViewComplicationFactory setForegroundColor:faceView:](self->_faceViewComplicationFactory, "setForegroundColor:faceView:", v13, self);
  -[CLKUIColoringLabel setTextColor:](self->_overrideDateLabel, "setTextColor:", v13);
  -[CLKUIColoringLabel setShadowColor:](self->_overrideDateLabel, "setShadowColor:", v12);
  -[CLKUIColoringLabel setTextColor:](self->_scrubLabel, "setTextColor:", v13);
  -[CLKUIColoringLabel setShadowColor:](self->_scrubLabel, "setShadowColor:", v12);

}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  unint64_t v5;

  v5 = objc_msgSend(a3, "astronomyVista");
  if (v5 > 2)
    return NTKImageNamed(0);
  else
    return NTKImageNamed(off_1E6BD89C0[v5]);
}

- (void)_prepareForEditing
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView _prepareForEditing](&v9, sel__prepareForEditing);
  -[NUNIAstronomyVistaView scene](self->_astronomyVistaView, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpdatable:", 0);

  -[NTKAstronomyFaceView _applyDataModeAnimated:](self, "_applyDataModeAnimated:", 0);
  -[NTKDigitialUtilitarianFaceViewComplicationFactory prepareForEditingForFaceView:](self->_faceViewComplicationFactory, "prepareForEditingForFaceView:", self);
  v4 = 0;
  do
  {
    v5 = v4 + 1;
    if (v4 == 2)
      v6 = 0;
    else
      v6 = v4 + 1;
    -[NUNIAstronomyVistaView generateAnimationArrayFromVista:toVista:transitionStyle:](self->_astronomyVistaView, "generateAnimationArrayFromVista:toVista:transitionStyle:", v4, v6, 0);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v8 = self->_editingAnimations[v4];
    self->_editingAnimations[v4] = v7;

    ++v4;
  }
  while (v5 != 3);
  -[NTKAstronomyFaceView _hideLocationDot](self, "_hideLocationDot");
}

- (void)_cleanupAfterEditing
{
  void *v3;
  uint64_t v4;
  NSArray **editingAnimations;
  NSArray *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView _cleanupAfterEditing](&v7, sel__cleanupAfterEditing);
  -[NTKAstronomyFaceView _applyVista:](self, "_applyVista:", self->_vista);
  -[NUNIAstronomyVistaView scene](self->_astronomyVistaView, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpdatable:", 1);

  -[NTKAstronomyFaceView _applyDataModeAnimated:](self, "_applyDataModeAnimated:", 0);
  -[NTKDigitialUtilitarianFaceViewComplicationFactory cleanupAfterEditingForFaceView:](self->_faceViewComplicationFactory, "cleanupAfterEditingForFaceView:", self);
  v4 = 0;
  editingAnimations = self->_editingAnimations;
  do
  {
    v6 = editingAnimations[v4];
    editingAnimations[v4] = 0;

    ++v4;
  }
  while (v4 != 3);
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  NUNIAstronomyVistaView *astronomyVistaView;
  id v7;

  astronomyVistaView = self->_astronomyVistaView;
  CLKInterpolateBetweenFloatsClipped();
  -[NUNIAstronomyVistaView setAlpha:](astronomyVistaView, "setAlpha:");
  -[NTKFaceView timeView](self, "timeView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v7, "setAlpha:");

}

- (void)_configureForEditMode:(int64_t)a3
{
  NUNIAstronomyVistaView *astronomyVistaView;
  double v6;
  void *v7;
  double v8;
  id v9;

  astronomyVistaView = self->_astronomyVistaView;
  v6 = 0.4;
  if (a3 != 1)
    v6 = 1.0;
  -[NUNIAstronomyVistaView setAlpha:](astronomyVistaView, "setAlpha:", v6);
  -[NTKFaceView timeView](self, "timeView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  v8 = 0.2;
  if (!a3)
    v8 = 1.0;
  objc_msgSend(v7, "setAlpha:", v8);

}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *v15;
  NSArray *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  float v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  if (a6 == 12)
  {
    v12 = objc_msgSend(a4, "astronomyVista");
    v13 = objc_msgSend(v11, "astronomyVista");
    v14 = v13;
    if (v12 + 1 == v13)
    {
      v15 = self->_editingAnimations[v12];
      if (!v15)
        goto LABEL_18;
    }
    else if (v13 + 1 == v12)
    {
      v15 = self->_editingAnimations[v13];
      a3 = 1.0 - a3;
      if (!v15)
        goto LABEL_18;
    }
    else
    {
      if (v12 != v13)
        goto LABEL_18;
      v15 = self->_editingAnimations[v12];
      a3 = 0.0;
      if (!v15)
        goto LABEL_18;
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = v15;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v17)
    {
      v19 = v17;
      v20 = *(_QWORD *)v24;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v16);
          v21 = a3;
          *(float *)&v18 = v21;
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "apply:", v18, (_QWORD)v23);
        }
        while (v19 != v22);
        v19 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

    -[NTKAstronomyFaceView _applyFromVista:toVista:fraction:](self, "_applyFromVista:toVista:fraction:", v12, v14, a3);
  }
LABEL_18:

}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  uint64_t v6;
  unint64_t v7;

  if (a4 == 12)
  {
    v6 = objc_msgSend(a3, "astronomyVista");
    if (self->_vista != v6)
    {
      v7 = v6;
      if (-[NTKFaceView editing](self, "editing"))
        self->_vista = v7;
      else
        -[NTKAstronomyFaceView _applyVista:](self, "_applyVista:", v7);
    }
  }
}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  int64_t v8;
  objc_super v9;
  uint8_t buf[4];
  int64_t v11;
  uint64_t v12;

  v4 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)NTKAstronomyFaceView;
  -[NTKFaceView _renderSynchronouslyWithImageQueueDiscard:inGroup:](&v9, sel__renderSynchronouslyWithImageQueueDiscard_inGroup_, v4, v6);
  if ((*((_BYTE *)self + 1264) & 2) != 0)
  {
    _NTKLoggingObjectForDomain(26, (uint64_t)"NTKLoggingDomainAstro");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = -[NTKFaceView dataMode](self, "dataMode");
      *(_DWORD *)buf = 134217984;
      v11 = v8;
      _os_log_impl(&dword_1B72A3000, v7, OS_LOG_TYPE_DEFAULT, "_renderSynchronouslyWithImageQueueDiscard: dataMode=%ld", buf, 0xCu);
    }

    -[NUNIAstronomyVistaView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_astronomyVistaView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6);
  }

}

- (void).cxx_destruct
{
  uint64_t i;
  uint64_t j;
  uint64_t k;

  objc_destroyWeak((id *)&self->_borrowedHandsView);
  objc_destroyWeak((id *)&self->_borrowedCircleView);
  for (i = 2; i != -1; --i)
    objc_storeStrong((id *)&self->_editingAnimations[i], 0);
  objc_storeStrong((id *)&self->_physicalButtonDelayedBlock, 0);
  objc_storeStrong((id *)&self->_wheelDelayedBlock, 0);
  for (j = 2; j != -1; --j)
    objc_storeStrong((id *)&self->_scrubDateFormatter[j], 0);
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_crownDate, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_locationDot, 0);
  for (k = 7; k != -1; --k)
    objc_storeStrong((id *)&self->_spheroidLabels[k], 0);
  objc_storeStrong((id *)&self->_overrideDateLabel, 0);
  objc_storeStrong((id *)&self->_phaseLabel, 0);
  objc_storeStrong((id *)&self->_scrubLabel, 0);
  objc_storeStrong((id *)&self->_astronomyVistaView, 0);
  objc_storeStrong((id *)&self->_legacyRightBottomImageView, 0);
  objc_storeStrong((id *)&self->_legacyLeftBottomImageView, 0);
  objc_storeStrong((id *)&self->_legacyDateLabel, 0);
  objc_storeStrong((id *)&self->_locationManagerToken, 0);
  objc_storeStrong((id *)&self->_interactiveModeTapGesture, 0);
  objc_storeStrong((id *)&self->_supplementalModeDoubleTapGesture, 0);
  objc_storeStrong((id *)&self->_spheroidPanGesture, 0);
  objc_storeStrong((id *)&self->_rotationModel, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabelSmallInUpperRightCornerStyle, 0);
  objc_storeStrong((id *)&self->_digitalTimeLabelDefaultStyle, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
}

@end
