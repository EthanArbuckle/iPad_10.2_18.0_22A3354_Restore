@implementation NTKAnalogVideoFaceView

+ (int64_t)uiSensitivity
{
  if (objc_msgSend(a1, "isRichComplicationsEnabled"))
    return NTKBlueRidgeUISensitivity();
  else
    return 0;
}

- (NTKAnalogVideoFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  id v9;
  NTKAnalogVideoFaceView *v10;
  NTKAnalogVideoFaceView *v11;
  uint64_t v12;
  UIColor *complicationColor;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *v14;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *faceViewComplicationFactory;
  void *v16;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *v17;
  uint64_t v18;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v8 = a4;
  v9 = a5;
  v27.receiver = self;
  v27.super_class = (Class)NTKAnalogVideoFaceView;
  v10 = -[NTKAnalogFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v27, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, v8, v9);
  v11 = v10;
  if (v10)
  {
    v10->_previousDataMode = 0;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = objc_claimAutoreleasedReturnValue();
    complicationColor = v11->_complicationColor;
    v11->_complicationColor = (UIColor *)v12;

    v11->_videoDialSize = (CGSize)*MEMORY[0x1E0C9D820];
    v14 = -[NTKColorCircularUtilitarianFaceViewComplicationFactory initWithFaceView:device:graphicCornerComplications:]([NTKColorCircularUtilitarianFaceViewComplicationFactory alloc], "initWithFaceView:device:graphicCornerComplications:", v11, v8, objc_msgSend((id)objc_opt_class(), "isRichComplicationsEnabled"));
    faceViewComplicationFactory = v11->_faceViewComplicationFactory;
    v11->_faceViewComplicationFactory = v14;

    -[NTKAnalogVideoFaceView faceViewComplicationFactory](v11, "faceViewComplicationFactory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setDelegate:", v11);

    -[NTKFaceView setComplicationFactory:](v11, "setComplicationFactory:", v11->_faceViewComplicationFactory);
    objc_initWeak(&location, v11);
    v17 = v11->_faceViewComplicationFactory;
    v18 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__NTKAnalogVideoFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke;
    v24[3] = &unk_1E6BD0EA0;
    objc_copyWeak(&v25, &location);
    -[NTKFaceViewComplicationFactory setForegroundColorProviderBlock:](v17, "setForegroundColorProviderBlock:", v24);
    v19 = v11->_faceViewComplicationFactory;
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __71__NTKAnalogVideoFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke_2;
    v22[3] = &unk_1E6BD0EA0;
    objc_copyWeak(&v23, &location);
    -[NTKFaceViewComplicationFactory setPlatterColorProviderBlock:](v19, "setPlatterColorProviderBlock:", v22);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v11, sel__faceLibraryDismissed, CFSTR("NTKFaceLibraryDismissedNotification"), 0);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __71__NTKAnalogVideoFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_complicationsForegroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __71__NTKAnalogVideoFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_complicationsPlatterColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_loadSnapshotContentViews
{
  id v3;
  UIView *v4;
  UIView *backgroundContainerView;
  void *v6;
  void *v7;
  NTKFaceViewTapControl *v8;
  NTKFaceViewTapControl *faceTapControl;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKAnalogFaceView _loadSnapshotContentViews](&v13, sel__loadSnapshotContentViews);
  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[NTKAnalogVideoFaceView bounds](self, "bounds");
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = v4;

  -[UIView setAutoresizingMask:](self->_backgroundContainerView, "setAutoresizingMask:", 18);
  -[NTKFaceView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertSubview:atIndex:", self->_backgroundContainerView, 0);

  -[NTKAnalogVideoFaceView faceViewComplicationFactory](self, "faceViewComplicationFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applyComplicationContentSpecificAttributesAnimated:faceView:", 0, self);

  -[NTKAnalogVideoFaceView setupVideoPlayerView](self, "setupVideoPlayerView");
  if (!self->_faceTapControl)
  {
    v8 = (NTKFaceViewTapControl *)objc_opt_new();
    faceTapControl = self->_faceTapControl;
    self->_faceTapControl = v8;

    -[NTKFaceViewTapControl addTarget:action:forControlEvents:](self->_faceTapControl, "addTarget:action:forControlEvents:", self, sel_faceViewWasTapped_, 64);
    -[NTKFaceViewTapControl highlightImageView](self->_faceTapControl, "highlightImageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKAnalogVideoFaceView _tapHighlightImage](self, "_tapHighlightImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setImage:", v11);

    -[NTKFaceView contentView](self, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", self->_faceTapControl);

  }
}

- (void)_unloadSnapshotContentViews
{
  UIView *backgroundContainerView;
  NTKVideoPlayerView *videoPlayerView;
  NTKFaceViewTapControl *faceTapControl;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKAnalogFaceView _unloadSnapshotContentViews](&v6, sel__unloadSnapshotContentViews);
  -[UIView removeFromSuperview](self->_backgroundContainerView, "removeFromSuperview");
  backgroundContainerView = self->_backgroundContainerView;
  self->_backgroundContainerView = 0;

  -[NTKVideoPlayerView removeFromSuperview](self->_videoPlayerView, "removeFromSuperview");
  videoPlayerView = self->_videoPlayerView;
  self->_videoPlayerView = 0;

  -[NTKFaceViewTapControl removeFromSuperview](self->_faceTapControl, "removeFromSuperview");
  faceTapControl = self->_faceTapControl;
  self->_faceTapControl = 0;

}

- (void)setNormalComplicationDisplayWrapper:(id)a3 forSlot:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView setNormalComplicationDisplayWrapper:forSlot:](&v4, sel_setNormalComplicationDisplayWrapper_forSlot_, a3, a4);
}

- (id)_newLegacyViewForComplication:(id)a3 family:(int64_t)a4 slot:(id)a5
{
  return -[NTKColorCircularUtilitarianFaceViewComplicationFactory newLegacyViewForComplication:family:slot:faceView:](self->_faceViewComplicationFactory, "newLegacyViewForComplication:family:slot:faceView:", a3, a4, a5, self);
}

- (int64_t)_legacyLayoutOverrideforComplicationType:(unint64_t)a3 slot:(id)a4
{
  return -[NTKFaceViewComplicationFactory legacyLayoutOverrideforComplicationType:slot:faceView:](self->_faceViewComplicationFactory, "legacyLayoutOverrideforComplicationType:slot:faceView:", a3, a4, self);
}

- (void)_configureComplicationView:(id)a3 forSlot:(id)a4
{
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory configureComplicationView:forSlot:faceView:](self->_faceViewComplicationFactory, "configureComplicationView:forSlot:faceView:", a3, a4, self);
}

- (id)_detachedComplicationDisplays
{
  return -[NTKFaceViewComplicationFactory detachedComplicationDisplaysForFaceView:](self->_faceViewComplicationFactory, "detachedComplicationDisplaysForFaceView:", self);
}

- (void)_loadLayoutRules
{
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory loadLayoutRulesForFaceView:](self->_faceViewComplicationFactory, "loadLayoutRulesForFaceView:", self);
}

- (double)_keylineCornerRadiusForComplicationSlot:(id)a3
{
  double result;

  -[NTKFaceViewComplicationFactory keylineCornerRadiusForComplicationSlot:faceView:](self->_faceViewComplicationFactory, "keylineCornerRadiusForComplicationSlot:faceView:", a3, self);
  return result;
}

- (double)keylineStyleForComplicationSlot:(id)a3
{
  return (double)-[NTKColorCircularUtilitarianFaceViewComplicationFactory keylineStyleForComplicationSlot:](self->_faceViewComplicationFactory, "keylineStyleForComplicationSlot:", a3);
}

- (BOOL)_fadesComplicationSlot:(id)a3 inEditMode:(int64_t)a4
{
  return -[NTKFaceViewComplicationFactory fadesComplicationSlot:inEditMode:faceView:](self->_faceViewComplicationFactory, "fadesComplicationSlot:inEditMode:faceView:", a3, a4, self);
}

- (double)_minimumBreathingScaleForComplicationSlot:(id)a3
{
  double result;

  -[NTKFaceViewComplicationFactory minimumBreathingScaleForComplicationSlot:faceView:](self->_faceViewComplicationFactory, "minimumBreathingScaleForComplicationSlot:faceView:", a3, self);
  return result;
}

- (void)setDataMode:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView setDataMode:](&v5, sel_setDataMode_);
  -[NTKFaceViewTapControl setHighlighted:](self->_faceTapControl, "setHighlighted:", 0);
  -[NTKFaceViewTapControl setUserInteractionEnabled:](self->_faceTapControl, "setUserInteractionEnabled:", a3 == 1);
}

- (void)_applyDataMode
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKAnalogFaceView _applyDataMode](&v3, sel__applyDataMode);
  -[NTKVideoPlayerView applyDataMode:comingFromDataMode:](self->_videoPlayerView, "applyDataMode:comingFromDataMode:", -[NTKFaceView dataMode](self, "dataMode"), self->_previousDataMode);
  self->_previousDataMode = -[NTKFaceView dataMode](self, "dataMode");
}

- (void)layoutSubviews
{
  UIView *backgroundContainerView;
  NTKVideoPlayerView *videoPlayerView;
  NTKFaceViewTapControl *faceTapControl;
  double MidX;
  objc_super v7;
  CGRect v8;
  CGRect v9;

  v7.receiver = self;
  v7.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKAnalogFaceView layoutSubviews](&v7, sel_layoutSubviews);
  backgroundContainerView = self->_backgroundContainerView;
  -[NTKAnalogVideoFaceView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](backgroundContainerView, "ntk_setBoundsAndPositionFromFrame:");
  videoPlayerView = self->_videoPlayerView;
  -[NTKAnalogVideoFaceView bounds](self, "bounds");
  -[UIView ntk_setBoundsAndPositionFromFrame:](videoPlayerView, "ntk_setBoundsAndPositionFromFrame:");
  faceTapControl = self->_faceTapControl;
  -[NTKAnalogVideoFaceView bounds](self, "bounds");
  MidX = CGRectGetMidX(v8);
  -[NTKAnalogVideoFaceView bounds](self, "bounds");
  -[NTKFaceViewTapControl setCenter:](faceTapControl, "setCenter:", MidX, CGRectGetMidY(v9));
  -[NTKFaceViewTapControl sizeToFit](self->_faceTapControl, "sizeToFit");
}

- (void)setupVideoPlayerView
{
  NTKVideoPlayerView *v3;
  NTKVideoPlayerView *v4;
  NTKVideoPlayerView *videoPlayerView;

  v3 = [NTKVideoPlayerView alloc];
  -[NTKAnalogVideoFaceView bounds](self, "bounds");
  v4 = -[NTKVideoPlayerView initWithFrame:](v3, "initWithFrame:");
  videoPlayerView = self->_videoPlayerView;
  self->_videoPlayerView = v4;

  -[NTKVideoPlayerView setDelegate:](self->_videoPlayerView, "setDelegate:", self);
  -[NTKVideoPlayerView setVideoPlayerResizeGravity:](self->_videoPlayerView, "setVideoPlayerResizeGravity:", 0);
  -[NTKVideoPlayerView setShouldApplyVideoInsetToPosterImage:](self->_videoPlayerView, "setShouldApplyVideoInsetToPosterImage:", 1);
  -[UIView addSubview:](self->_backgroundContainerView, "addSubview:", self->_videoPlayerView);
  -[NTKAnalogVideoFaceView sendSubviewToBack:](self, "sendSubviewToBack:", self->_backgroundContainerView);
  -[NTKAnalogVideoFaceView _customizeVideoPlayerOnSetup](self, "_customizeVideoPlayerOnSetup");
}

- (void)_setVideoPlayerDataSource:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NTKAnalogVideoFaceView videoPlayerView](self, "videoPlayerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v9)
  {
    -[NTKAnalogVideoFaceView videoPlayerView](self, "videoPlayerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDataSource:", v9);

    -[NTKAnalogVideoFaceView videoPlayerView](self, "videoPlayerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "posterImage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPosterImage:", v8);

  }
}

- (void)_applyFrozen
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView _applyFrozen](&v3, sel__applyFrozen);
  -[NTKVideoPlayerView applyFrozen:](self->_videoPlayerView, "applyFrozen:", -[NTKFaceView isFrozen](self, "isFrozen"));
}

- (void)_applySlow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView _applySlow](&v3, sel__applySlow);
  -[NTKVideoPlayerView applySlow:](self->_videoPlayerView, "applySlow:", -[NTKFaceView isSlow](self, "isSlow"));
}

- (void)_prepareForOrb
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView _prepareForOrb](&v3, sel__prepareForOrb);
  -[NTKVideoPlayerView applyOrbing:](self->_videoPlayerView, "applyOrbing:", 1);
}

- (void)_cleanupAfterOrb:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView _cleanupAfterOrb:](&v4, sel__cleanupAfterOrb_, a3);
  -[NTKVideoPlayerView applyOrbing:](self->_videoPlayerView, "applyOrbing:", 0);
}

- (void)_handleWristRaiseScreenWake
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView _handleWristRaiseScreenWake](&v3, sel__handleWristRaiseScreenWake);
  -[NTKAnalogVideoFaceView _handleEitherScreenWake](self, "_handleEitherScreenWake");
  -[NTKVideoPlayerView handleWristRaiseScreenWake](self->_videoPlayerView, "handleWristRaiseScreenWake");
}

- (void)_handleOrdinaryScreenWake
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView _handleOrdinaryScreenWake](&v3, sel__handleOrdinaryScreenWake);
  -[NTKAnalogVideoFaceView _handleEitherScreenWake](self, "_handleEitherScreenWake");
  -[NTKVideoPlayerView handleOrdinaryScreenWake](self->_videoPlayerView, "handleOrdinaryScreenWake");
}

- (void)screenDidTurnOffAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKFaceView screenDidTurnOffAnimated:](&v4, sel_screenDidTurnOffAnimated_, a3);
  -[NTKAnalogVideoFaceView _tearDownTransitioningView:](self, "_tearDownTransitioningView:", 0);
  -[NTKVideoPlayerView handleScreenOff](self->_videoPlayerView, "handleScreenOff");
}

- (void)faceViewWasTapped:(id)a3
{
  UIColor *v4;
  UIColor *complicationColor;
  void *v6;

  if (-[NTKAnalogVideoFaceView _shouldAnimateComplicationsOnTap](self, "_shouldAnimateComplicationsOnTap", a3))
  {
    -[NTKAnalogVideoFaceView _complicationsTapColor](self, "_complicationsTapColor");
    v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
    complicationColor = self->_complicationColor;
    self->_complicationColor = v4;

    -[NTKAnalogVideoFaceView faceViewComplicationFactory](self, "faceViewComplicationFactory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, self);

  }
  -[NTKVideoPlayerView videoPlayerViewWasTapped](self->_videoPlayerView, "videoPlayerViewWasTapped");
  -[NTKAnalogVideoFaceView _faceViewWasTapped](self, "_faceViewWasTapped");
}

- (id)_tapHighlightImage
{
  void *v2;
  void *v3;

  -[NTKFaceView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKNoHighlightDialTapImage(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_configureTimeView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKAnalogVideoFaceView;
  v3 = a3;
  -[NTKAnalogFaceView _configureTimeView:](&v8, sel__configureTimeView_, v3);
  objc_msgSend(v3, "minuteHandView", v8.receiver, v8.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHandDotColor:", v5);

  objc_msgSend(v3, "secondHandView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setColor:", v7);

}

- (unint64_t)_layoutStyleForSlot:(id)a3
{
  id v4;
  void *v5;
  char v6;
  unint64_t v7;

  v4 = a3;
  -[NTKFaceView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceCategory") == 1)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("bottom-center"));

  if ((v6 & 1) == 0)
    goto LABEL_5;
  v7 = 1;
LABEL_6:

  return v7;
}

- (void)_curvedComplicationCircleRadius:(double *)a3 centerAngle:(double *)a4 maxAngularWidth:(double *)a5 circleCenter:(CGPoint *)a6 interior:(BOOL *)a7 forSlot:(id)a8
{
  int64_t v14;
  void *v15;
  id v16;

  v16 = a8;
  if (-[NTKAnalogVideoFaceView _layoutStyleForSlot:](self, "_layoutStyleForSlot:") == 1)
  {
    v14 = -[NTKAnalogVideoFaceView _utilitySlotForSlot:](self, "_utilitySlotForSlot:", v16);
    -[NTKFaceView device](self, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKUtilityComplicationFactory curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:](NTKUtilityComplicationFactory, "curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:forDevice:", a3, a4, a5, a6, a7, v14, v15);

  }
}

- (CGPoint)_contentCenterOffset
{
  double v3;
  double v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGPoint result;

  if (objc_msgSend((id)objc_opt_class(), "isRichComplicationsEnabled"))
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  else
  {
    -[NTKFaceView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "faceViewComplicationIsEmptyForSlot:", CFSTR("bottom-center"));

    -[NTKFaceView _complicationSlotsHiddenByCurrentConfiguration](self, "_complicationSlotsHiddenByCurrentConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", CFSTR("bottom-center"));

    -[NTKFaceView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = _LayoutConstants_12(v9);
    v12 = v11;
    v3 = v13;
    v4 = v14;

    if ((v6 & 1) == 0 && (v8 & 1) == 0)
    {
      v3 = v10;
      v4 = v12;
    }
  }
  v15 = v3;
  v16 = v4;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)_faceLibraryDismissed
{
  id v3;

  -[NTKVideoPlayerView faceLibraryWasDismissed](self->_videoPlayerView, "faceLibraryWasDismissed");
  -[NTKAnalogVideoFaceView faceViewComplicationFactory](self, "faceViewComplicationFactory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applyComplicationContentSpecificAttributesAnimated:faceView:", 1, self);

}

- (id)_complicationsPlatterColor
{
  void *v2;
  void *v3;

  -[NTKAnalogVideoFaceView _complicationsForegroundColor](self, "_complicationsForegroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NTKColorByPremultiplyingAlpha(v2, 0.15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_complicationsCompanionForegroundColor
{
  return self->_complicationColor;
}

- (id)_complicationsEditingColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (id)_complicationsTapColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
}

- (BOOL)_shouldAnimateComplicationsOnTap
{
  return 1;
}

- (void)_prepareForEditing
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKAnalogFaceView _prepareForEditing](&v7, sel__prepareForEditing);
  -[NTKAnalogVideoFaceView faceViewComplicationFactory](self, "faceViewComplicationFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "prepareForEditingForFaceView:", self);

  -[NTKAnalogVideoFaceView _setupTransitioningViewIfNeeded:](self, "_setupTransitioningViewIfNeeded:", 1);
  -[NTKFaceView _applyEditConfigurationsWithForce:](self, "_applyEditConfigurationsWithForce:", 1);
  -[NTKVideoPlayerView transitionToEditing](self->_videoPlayerView, "transitionToEditing");
  -[NTKFaceView device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "screenCornerRadius");
  v6 = v5;

  NTKApplyViewCornerRadius(self, v6);
}

- (void)_cleanupAfterEditing
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKAnalogVideoFaceView;
  -[NTKAnalogFaceView _cleanupAfterEditing](&v4, sel__cleanupAfterEditing);
  -[NTKAnalogVideoFaceView faceViewComplicationFactory](self, "faceViewComplicationFactory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanupAfterEditingForFaceView:", self);

  -[NTKAnalogVideoFaceView _tearDownTransitioningView:](self, "_tearDownTransitioningView:", 0);
  NTKApplyViewCornerRadius(self, 0.0);
}

- (void)_cleanupAfterTransitionComplicationSlot:(id)a3 selectedComplication:(id)a4
{
  void *v5;
  id v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("bottom-center"), a4))
  {
    -[NTKFaceView delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "faceViewWantsCustomKeylineFramesReloadedForEditMode:", 12);

    -[NTKFaceView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "faceViewWantsCustomKeylineFramesReloadedForEditMode:", 15);

  }
}

- (void)_applyOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  NTKEditOptionTransitioningView *transitioningView;

  transitioningView = self->_transitioningView;
  if (transitioningView)
    -[NTKEditOptionTransitioningView setOption:](transitioningView, "setOption:", a3, a4, a5);
  -[NTKColorCircularUtilitarianFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self->_faceViewComplicationFactory, "applyComplicationContentSpecificAttributesAnimated:faceView:", 0, self, a5);
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  -[NTKEditOptionTransitioningView setTransitionFraction:fromOption:toOption:](self->_transitioningView, "setTransitionFraction:fromOption:toOption:", a4, a5, a6, a7, a3);
}

- (void)_cleanupAfterTransitionToOption:(id)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  -[NTKEditOptionTransitioningView setOption:](self->_transitioningView, "setOption:", a3, a4, a5);
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  _BOOL4 v8;
  void *v9;
  void *v10;
  NTKEditOptionTransitioningView *transitioningView;

  v8 = -[NTKFaceView editing](self, "editing");
  if (a4 && !a5 && v8)
    -[NTKAnalogVideoFaceView _tearDownTransitioningView:](self, "_tearDownTransitioningView:", 0);
  -[NTKFaceView timeView](self, "timeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAnalogVideoFaceView _handAlphaForEditMode:](self, "_handAlphaForEditMode:", a4);
  -[NTKAnalogVideoFaceView _handAlphaForEditMode:](self, "_handAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAnalogVideoFaceView _complicationAlphaForEditMode:](self, "_complicationAlphaForEditMode:", a4);
  -[NTKAnalogVideoFaceView _complicationAlphaForEditMode:](self, "_complicationAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v10, "setAlpha:");

  transitioningView = self->_transitioningView;
  -[NTKAnalogVideoFaceView _contentAlphaForEditMode:](self, "_contentAlphaForEditMode:", a4);
  -[NTKAnalogVideoFaceView _contentAlphaForEditMode:](self, "_contentAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  -[NTKEditOptionTransitioningView setDimmingAlpha:](transitioningView, "setDimmingAlpha:");
}

- (void)_applyBreathingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  -[NTKEditOptionTransitioningView setBreatheFraction:](self->_transitioningView, "setBreatheFraction:", a4, a5, a3);
}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  double v8;
  double v9;

  v8 = NTKAlphaForRubberBandingFraction(a3);
  -[NTKAnalogVideoFaceView _contentAlphaForEditMode:](self, "_contentAlphaForEditMode:", a4);
  -[NTKEditOptionTransitioningView setDimmingAlpha:](self->_transitioningView, "setDimmingAlpha:", v8 * v9);
  -[NTKEditOptionTransitioningView setRubberBandingFraction:](self->_transitioningView, "setRubberBandingFraction:", a3);
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (id)imageForEditOption:(id)a3
{
  return 0;
}

- (BOOL)shouldFadeIncomingView
{
  return 1;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;

  v4 = a3;
  -[NTKFaceView device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "deviceCategory") == 1)
  {

LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {

  }
  else
  {
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("top-right"));

    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  v7 = 1;
LABEL_8:

  return v7;
}

- (CGRect)_keylineFrameForComplicationSlot:(id)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  v4 = a4;
  v6 = a3;
  if (objc_msgSend((id)objc_opt_class(), "isRichComplicationsEnabled")
    && ((objc_msgSend(v6, "isEqualToString:", CFSTR("top-left")) & 1) != 0
     || objc_msgSend(v6, "isEqualToString:", CFSTR("top-right"))))
  {
    -[NTKAnalogVideoFaceView faceViewComplicationFactory](self, "faceViewComplicationFactory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keylineFrameForCornerComplicationSlot:selected:", v6, v4);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)NTKAnalogVideoFaceView;
    -[NTKFaceView _keylineFrameForComplicationSlot:selected:](&v24, sel__keylineFrameForComplicationSlot_selected_, v6, v4);
    v9 = v16;
    v11 = v17;
    v13 = v18;
    v15 = v19;
  }

  v20 = v9;
  v21 = v11;
  v22 = v13;
  v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)_supportsUnadornedSnapshot
{
  return 0;
}

- (void)customizeFaceViewForListing:(id)a3 changeEvent:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  UIColor *complicationColor;
  UIColor *v13;
  UIColor *v14;
  UIColor *v15;
  void *v16;

  v5 = a5;
  v8 = a3;
  v16 = v8;
  if (a4 != 2
    || (v9 = -[NTKAnalogVideoFaceView _shouldAnimateComplicationsOnTap](self, "_shouldAnimateComplicationsOnTap"),
        v8 = v16,
        !v9))
  {
    objc_msgSend(v8, "color");
    v10 = objc_claimAutoreleasedReturnValue();
    v8 = v16;
    if (v10)
    {
      v11 = (void *)v10;
      complicationColor = self->_complicationColor;
      objc_msgSend(v16, "color");
      v13 = (UIColor *)objc_claimAutoreleasedReturnValue();

      v8 = v16;
      if (complicationColor != v13)
      {
        objc_msgSend(v16, "color");
        v14 = (UIColor *)objc_claimAutoreleasedReturnValue();
        v15 = self->_complicationColor;
        self->_complicationColor = v14;

        -[NTKColorCircularUtilitarianFaceViewComplicationFactory applyComplicationContentSpecificAttributesAnimated:faceView:](self->_faceViewComplicationFactory, "applyComplicationContentSpecificAttributesAnimated:faceView:", v5, self);
        v8 = v16;
      }
    }
  }

}

- (void)_transformVideoPlayerView:(unint64_t)a3
{
  void *v4;
  void *v5;
  __int128 v6;
  CGAffineTransform *v7;
  void *v8;
  CGFloat v9;
  void *v10;
  CGAffineTransform v11;
  CGAffineTransform v12;
  _OWORD v13[3];

  if (a3 == 2)
  {
    objc_msgSend(&unk_1E6CA9A18, "objectAtIndexedSubscript:", arc4random_uniform(objc_msgSend(&unk_1E6CA9A18, "count")));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");

    -[NTKAnalogVideoFaceView videoPlayerView](self, "videoPlayerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CLKDegreesToRadians();
    CGAffineTransformMakeRotation(&v11, v9);
    v7 = &v11;
LABEL_9:
    v4 = v5;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    if (_transformVideoPlayerView__onceToken != -1)
      dispatch_once(&_transformVideoPlayerView__onceToken, &__block_literal_global_42);
    *(_QWORD *)&v13[0] = 0;
    +[NTKDate faceDate](NTKDate, "faceDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NTKHourMinuteSecondAnglesForTime(0, 0, v13, v10, _transformVideoPlayerView___calendar);

    -[NTKAnalogVideoFaceView videoPlayerView](self, "videoPlayerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeRotation(&v12, *(CGFloat *)v13);
    v7 = &v12;
    goto LABEL_9;
  }
  if (a3)
    return;
  -[NTKAnalogVideoFaceView videoPlayerView](self, "videoPlayerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v13[1] = v6;
  v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v7 = (CGAffineTransform *)v13;
LABEL_10:
  objc_msgSend(v4, "setVideoPlayerTransform:", v7);

}

void __52__NTKAnalogVideoFaceView__transformVideoPlayerView___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_transformVideoPlayerView___calendar;
  _transformVideoPlayerView___calendar = v0;

}

- (void)setVideoDialSize:(CGSize)a3
{
  CGSize *p_videoDialSize;
  id v5;

  p_videoDialSize = &self->_videoDialSize;
  self->_videoDialSize = a3;
  -[NTKAnalogVideoFaceView videoPlayerView](self, "videoPlayerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NTKAnalogVideoFaceView _insetsForDialSize:](self, "_insetsForDialSize:", p_videoDialSize->width, p_videoDialSize->height);
  objc_msgSend(v5, "setVideoPlayerInset:");

}

- (UIEdgeInsets)_insetsForDialSize:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double width;
  void *v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  if (a3.width == 0.0)
  {
    v3 = *MEMORY[0x1E0DC49E8];
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v6 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  else
  {
    width = a3.width;
    -[NTKFaceView device](self, "device", a3.width, a3.height);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "screenBounds");
    v10 = v9;

    v3 = (v10 - width) * 0.5;
    v4 = v3;
    v5 = v3;
    v6 = v3;
  }
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (int64_t)_utilitySlotForSlot:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-left")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("top-right")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-left")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-right")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bottom-center")) & 1) != 0)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("date")))
  {
    v4 = 12;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_slotForUtilitySlot:(int64_t)a3
{
  int64_t v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((unint64_t)(a3 - 1) <= 0xB && ((0xA0Fu >> v3) & 1) != 0)
    v4 = *off_1E6BD0EE0[v3];
  else
    v4 = 0;
  return v4;
}

- (double)_handAlphaForEditMode:(int64_t)a3
{
  double result;

  result = 0.2;
  if (!a3)
    return 1.0;
  return result;
}

- (double)_contentAlphaForEditMode:(int64_t)a3
{
  double result;

  result = 0.2;
  if (a3 != 1)
    return 1.0;
  return result;
}

- (double)_complicationAlphaForEditMode:(int64_t)a3
{
  double result;

  result = 0.2;
  if ((unint64_t)a3 < 2)
    return 1.0;
  return result;
}

- (NTKVideoPlayerView)videoPlayerView
{
  return self->_videoPlayerView;
}

- (void)setVideoPlayerView:(id)a3
{
  objc_storeStrong((id *)&self->_videoPlayerView, a3);
}

- (NTKColorCircularUtilitarianFaceViewComplicationFactory)faceViewComplicationFactory
{
  return self->_faceViewComplicationFactory;
}

- (void)setFaceViewComplicationFactory:(id)a3
{
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, a3);
}

- (NTKFaceViewTapControl)faceTapControl
{
  return self->_faceTapControl;
}

- (void)setFaceTapControl:(id)a3
{
  objc_storeStrong((id *)&self->_faceTapControl, a3);
}

- (CGSize)videoDialSize
{
  double width;
  double height;
  CGSize result;

  width = self->_videoDialSize.width;
  height = self->_videoDialSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceTapControl, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
  objc_storeStrong((id *)&self->_videoPlayerView, 0);
  objc_storeStrong((id *)&self->_burnInStudyPosterImageView, 0);
  objc_storeStrong((id *)&self->_transitioningView, 0);
  objc_storeStrong((id *)&self->_backgroundContainerView, 0);
  objc_storeStrong((id *)&self->_complicationColor, 0);
}

+ (BOOL)isRichComplicationsEnabled
{
  return 0;
}

@end
