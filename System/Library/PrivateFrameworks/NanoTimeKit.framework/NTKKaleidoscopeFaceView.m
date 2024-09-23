@implementation NTKKaleidoscopeFaceView

- (id)_newComplicationFactoryForDevice:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[NTKColorCircularUtilitarianFaceViewComplicationFactory initForDevice:]([NTKColorCircularUtilitarianFaceViewComplicationFactory alloc], "initForDevice:", v4);

  objc_msgSend(v5, "setFaceView:", self);
  return v5;
}

- (NTKKaleidoscopeFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  id v8;
  id v9;
  NTKKaleidoscopeFaceView *v10;
  uint64_t v11;
  NSMutableSet *loadedAssets;
  uint64_t v13;
  NSMapTable *quadPathfinderMapTable;
  uint64_t v15;
  CLKUIResourceProviderKey *resourceProviderKey;
  uint64_t v17;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *faceViewComplicationFactory;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *v19;
  uint64_t v20;
  NTKColorCircularUtilitarianFaceViewComplicationFactory *v21;
  uint64_t v22;
  UIColor *complicationColor;
  uint64_t v24;
  UIColor *complicationPlatterColor;
  uint64_t v26;
  UIImage *userImage;
  uint64_t v28;
  UIImage *userSwatch;
  uint64_t v30;
  CLKUITexture *userTextureLuma;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  id location;
  objc_super v38;

  v8 = a4;
  v9 = a5;
  v38.receiver = self;
  v38.super_class = (Class)NTKKaleidoscopeFaceView;
  v10 = -[NTKAnalogFaceView initWithFaceStyle:forDevice:clientIdentifier:](&v38, sel_initWithFaceStyle_forDevice_clientIdentifier_, a3, v8, v9);
  if (v10)
  {
    v11 = objc_opt_new();
    loadedAssets = v10->_loadedAssets;
    v10->_loadedAssets = (NSMutableSet *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 5, 0, 2);
    quadPathfinderMapTable = v10->_quadPathfinderMapTable;
    v10->_quadPathfinderMapTable = (NSMapTable *)v13;

    v10->_extendedSRGBcolorSpace = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
    v15 = objc_opt_new();
    resourceProviderKey = v10->_resourceProviderKey;
    v10->_resourceProviderKey = (CLKUIResourceProviderKey *)v15;

    v17 = -[NTKKaleidoscopeFaceView _newComplicationFactoryForDevice:](v10, "_newComplicationFactoryForDevice:", v8);
    faceViewComplicationFactory = v10->_faceViewComplicationFactory;
    v10->_faceViewComplicationFactory = (NTKColorCircularUtilitarianFaceViewComplicationFactory *)v17;

    -[NTKColorCircularUtilitarianFaceViewComplicationFactory setDelegate:](v10->_faceViewComplicationFactory, "setDelegate:", v10);
    objc_initWeak(&location, v10);
    v19 = v10->_faceViewComplicationFactory;
    v20 = MEMORY[0x1E0C809B0];
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __72__NTKKaleidoscopeFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke;
    v35[3] = &unk_1E6BD0EA0;
    objc_copyWeak(&v36, &location);
    -[NTKFaceViewComplicationFactory setForegroundColorProviderBlock:](v19, "setForegroundColorProviderBlock:", v35);
    v21 = v10->_faceViewComplicationFactory;
    v33[0] = v20;
    v33[1] = 3221225472;
    v33[2] = __72__NTKKaleidoscopeFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke_2;
    v33[3] = &unk_1E6BD0EA0;
    objc_copyWeak(&v34, &location);
    -[NTKFaceViewComplicationFactory setPlatterColorProviderBlock:](v21, "setPlatterColorProviderBlock:", v33);
    -[NTKFaceView setComplicationFactory:](v10, "setComplicationFactory:", v10->_faceViewComplicationFactory);
    v10->_currentAsset = 0x7FFFFFFFFFFFFFFFLL;
    v10->_currentStyle = 0x7FFFFFFFFFFFFFFFLL;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v22 = objc_claimAutoreleasedReturnValue();
    complicationColor = v10->_complicationColor;
    v10->_complicationColor = (UIColor *)v22;

    NTKColorByPremultiplyingAlpha(v10->_complicationColor, 0.15);
    v24 = objc_claimAutoreleasedReturnValue();
    complicationPlatterColor = v10->_complicationPlatterColor;
    v10->_complicationPlatterColor = (UIColor *)v24;

    NTKImageNamed(CFSTR("Kaleidoscope-NoContent"));
    v26 = objc_claimAutoreleasedReturnValue();
    userImage = v10->_userImage;
    v10->_userImage = (UIImage *)v26;

    NTKImageNamed(CFSTR("Swatch-Kaleidoscope-Custom"));
    v28 = objc_claimAutoreleasedReturnValue();
    userSwatch = v10->_userSwatch;
    v10->_userSwatch = (UIImage *)v28;

    objc_msgSend(off_1E6BCA720, "textureWithProviderDelegate:uuid:", v10, CFSTR("Kaleidoscope-NoContent"));
    v30 = objc_claimAutoreleasedReturnValue();
    userTextureLuma = v10->_userTextureLuma;
    v10->_userTextureLuma = (CLKUITexture *)v30;

    objc_storeStrong((id *)&v10->_userTextureChroma, v10->_userTextureLuma);
    v10->_interactiveModeAnimationInFlight = 0;
    -[NTKKaleidoscopeFaceView _updateDayDuration](v10, "_updateDayDuration");
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v10;
}

id __72__NTKKaleidoscopeFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[135];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

id __72__NTKKaleidoscopeFaceView_initWithFaceStyle_forDevice_clientIdentifier___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  id v3;
  void *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[116];
  }
  else
  {
    CLKUIDefaultComplicationBackgroundColor();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (void)dealloc
{
  CLKUITexture *userTextureLuma;
  CLKUITexture *userTextureChroma;
  void *v5;
  objc_super v6;

  userTextureLuma = self->_userTextureLuma;
  self->_userTextureLuma = 0;

  userTextureChroma = self->_userTextureChroma;
  self->_userTextureChroma = 0;

  -[CLKUIQuadView removeAllQuads](self->_quadView, "removeAllQuads");
  -[NSMapTable removeAllObjects](self->_quadPathfinderMapTable, "removeAllObjects");
  objc_msgSend(off_1E6BCA710, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purgeAllUnused");

  CGColorSpaceRelease(self->_extendedSRGBcolorSpace);
  v6.receiver = self;
  v6.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKAnalogFaceView dealloc](&v6, sel_dealloc);
}

- (void)setCurrentAsset:(unint64_t)a3
{
  if (self->_currentAsset != a3)
  {
    self->_currentAsset = a3;
    -[NTKKaleidoscopeFaceView _updateWithAsset:](self, "_updateWithAsset:");
  }
}

- (void)setCurrentStyle:(unint64_t)a3
{
  float v4;

  if (self->_currentStyle != a3)
  {
    self->_currentStyle = a3;
    -[NTKKaleidoscopeFaceView _crownTurnsForStyle:](self, "_crownTurnsForStyle:");
    self->_crownTurnsPerRotation = v4;
    -[NTKKaleidoscopeFaceView _loadCurrentQuad](self, "_loadCurrentQuad");
  }
}

- (void)_loadCurrentQuad
{
  id v3;

  if (self->_currentAsset != 0x7FFFFFFFFFFFFFFFLL && self->_currentStyle != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CLKUIQuadView removeAllQuads](self->_quadView, "removeAllQuads");
    -[NTKKaleidoscopeFaceView _quadWithStyle:asset:](self, "_quadWithStyle:asset:", self->_currentStyle, self->_currentAsset);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setOpaque:", 1);
    -[CLKUIQuadView addQuad:](self->_quadView, "addQuad:", v3);
    -[NTKKaleidoscopeFaceView _kaleidoscopeTime](self, "_kaleidoscopeTime");
    -[NTKKaleidoscopeFaceView _updatePathForTime:](self, "_updatePathForTime:");
    -[NTKKaleidoscopeFaceView _updateComplicationColors](self, "_updateComplicationColors");

  }
}

- (void)_updateWithAsset:(unint64_t)a3
{
  if (a3 == 1000 && (!self->_userTextureLuma || !self->_userTextureChroma))
    -[NTKKaleidoscopeFaceView _updateUserContent](self, "_updateUserContent");
  -[NTKKaleidoscopeFaceView _loadCurrentQuad](self, "_loadCurrentQuad");
}

- (void)_loadSnapshotContentViews
{
  CLKUIQuadView *v3;
  CLKUIQuadView *quadView;
  CLKUIQuadView *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NTKRoundedCornerOverlayView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  NTKRoundedCornerOverlayView *v20;
  NTKRoundedCornerOverlayView *cornerView;
  void *v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKAnalogFaceView _loadSnapshotContentViews](&v23, sel__loadSnapshotContentViews);
  -[NTKKaleidoscopeFaceView bounds](self, "bounds");
  objc_msgSend(off_1E6BCA708, "quadViewWithFrame:identifier:", CFSTR("Klei"));
  v3 = (CLKUIQuadView *)objc_claimAutoreleasedReturnValue();
  quadView = self->_quadView;
  self->_quadView = v3;

  -[CLKUIQuadView setOpaque:](self->_quadView, "setOpaque:", 1);
  v5 = self->_quadView;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLKUIQuadView setBackgroundColor:](v5, "setBackgroundColor:", v6);

  -[NTKFaceView contentView](self, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", self->_quadView);

  -[NTKKaleidoscopeFaceView _updateWithAsset:](self, "_updateWithAsset:", self->_currentAsset);
  -[NTKFaceView device](self, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "deviceCategory");

  if (v9 != 1)
  {
    v10 = [NTKRoundedCornerOverlayView alloc];
    -[NTKKaleidoscopeFaceView bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[NTKFaceView device](self, "device");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[NTKRoundedCornerOverlayView initWithFrame:forDeviceCornerRadius:](v10, "initWithFrame:forDeviceCornerRadius:", v19, v12, v14, v16, v18);
    cornerView = self->_cornerView;
    self->_cornerView = v20;

    -[NTKFaceView contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "insertSubview:aboveSubview:", self->_cornerView, self->_quadView);

  }
}

- (void)_unloadSnapshotContentViews
{
  CLKUIQuadView *quadView;
  NTKRoundedCornerOverlayView *cornerView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKAnalogFaceView _unloadSnapshotContentViews](&v5, sel__unloadSnapshotContentViews);
  -[CLKUIQuadView removeFromSuperview](self->_quadView, "removeFromSuperview");
  quadView = self->_quadView;
  self->_quadView = 0;

  -[NTKRoundedCornerOverlayView removeFromSuperview](self->_cornerView, "removeFromSuperview");
  cornerView = self->_cornerView;
  self->_cornerView = 0;

}

- (void)_renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  _BOOL8 v4;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)NTKKaleidoscopeFaceView;
  v6 = a4;
  -[NTKFaceView _renderSynchronouslyWithImageQueueDiscard:inGroup:](&v7, sel__renderSynchronouslyWithImageQueueDiscard_inGroup_, v4, v6);
  -[CLKUIQuadView renderSynchronouslyWithImageQueueDiscard:inGroup:](self->_quadView, "renderSynchronouslyWithImageQueueDiscard:inGroup:", v4, v6, v7.receiver, v7.super_class);

}

- (void)_applyFrozen
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKFaceView _applyFrozen](&v3, sel__applyFrozen);
  -[CLKUIQuadView setPaused:](self->_quadView, "setPaused:", -[NTKFaceView isFrozen](self, "isFrozen"));
}

- (void)_applyDataMode
{
  double v3;
  double v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKAnalogFaceView _applyDataMode](&v5, sel__applyDataMode);
  -[NTKKaleidoscopeFaceView _kaleidoscopeTime](self, "_kaleidoscopeTime");
  v4 = v3;
  -[NTKKaleidoscopeFaceView _updatePathForTime:](self, "_updatePathForTime:");
  -[NTKKaleidoscopeFaceView _updateRotationForQuadView:time:crownOffset:](self, "_updateRotationForQuadView:time:crownOffset:", self->_quadView, v4, self->_crownOffset);
  -[NTKKaleidoscopeFaceView _updateComplicationColors](self, "_updateComplicationColors");
  -[NTKFaceView dataMode](self, "dataMode");
}

- (void)_enableCrown
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKFaceView _enableCrown](&v2, sel__enableCrown);
}

- (void)_disableCrown
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKFaceView _disableCrown](&v2, sel__disableCrown);
}

- (void)quadViewWillDisplay:(id)a3 forTime:(double)a4
{
  double v5;
  double v6;

  ++self->_frameCounter;
  -[NTKKaleidoscopeFaceView _kaleidoscopeTime](self, "_kaleidoscopeTime", a3, a4);
  v6 = v5;
  -[NTKKaleidoscopeFaceView _updatePathForTime:](self, "_updatePathForTime:");
  -[NTKKaleidoscopeFaceView _updateRotationForQuadView:time:crownOffset:](self, "_updateRotationForQuadView:time:crownOffset:", self->_quadView, v6, self->_crownOffset);
  if (v6 - self->_lastComplicationUpdateTime > 300.0 && -858993459 * self->_frameCounter <= 0x33333333)
  {
    self->_lastComplicationUpdateTime = v6;
    -[NTKKaleidoscopeFaceView _updateComplicationColors](self, "_updateComplicationColors");
  }
}

- (double)_kaleidoscopeTime
{
  return 0.0;
}

- (void)_configureTimeView:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKKaleidoscopeFaceView;
  v3 = a3;
  -[NTKAnalogFaceView _configureTimeView:](&v5, sel__configureTimeView_, v3);
  objc_msgSend(v3, "secondHandView", v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NTKKaleidoscopeSecondHandColor_onceToken != -1)
    dispatch_once(&_NTKKaleidoscopeSecondHandColor_onceToken, &__block_literal_global_366_0);
  objc_msgSend(v4, "setColor:", _NTKKaleidoscopeSecondHandColor___color);

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
  id v14;

  v14 = a8;
  if (-[NTKKaleidoscopeFaceView _layoutStyleForSlot:](self, "_layoutStyleForSlot:") == 1)
    -[NTKColorCircularUtilitarianFaceViewComplicationFactory curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:](self->_faceViewComplicationFactory, "curvedCircleRadius:centerAngle:maxAngularWidth:circleCenter:interior:forSlot:", a3, a4, a5, a6, a7, v14);

}

- (double)_verticalPaddingForStatusBar
{
  void *v2;
  double v3;
  _BYTE v5[72];
  double v6;

  -[NTKFaceView device](self, "device");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _LayoutConstants_41(v2, (uint64_t)v5);
  v3 = v6;

  return v3;
}

- (BOOL)_wantsStatusBarIconShadow
{
  void *v2;
  BOOL v3;

  -[NTKFaceView optionForCustomEditMode:slot:](self, "optionForCustomEditMode:slot:", 15, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style") == 3;

  return v3;
}

- (void)_prepareForEditing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKAnalogFaceView _prepareForEditing](&v3, sel__prepareForEditing);
  -[NSMutableSet removeAllObjects](self->_loadedAssets, "removeAllObjects");
}

- (void)_cleanupAfterEditing
{
  void *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKAnalogFaceView _cleanupAfterEditing](&v3, sel__cleanupAfterEditing);
  objc_msgSend(off_1E6BCA710, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "purgeAllUnused");

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
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  if (a4 == 15)
  {
    -[NTKKaleidoscopeFaceView setCurrentStyle:](self, "setCurrentStyle:", objc_msgSend(v10, "style"));
    -[NTKFaceView delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "faceViewDidChangeWantsStatusBarIconShadow");

  }
  else if (a4 == 12)
  {
    -[NTKKaleidoscopeFaceView setCurrentAsset:](self, "setCurrentAsset:", objc_msgSend(v10, "asset"));
  }

}

- (BOOL)_isEditOptionFullscreen:(id)a3
{
  return objc_msgSend(a3, "style") == 3;
}

- (void)_applyTransitionFraction:(double)a3 fromOption:(id)a4 toOption:(id)a5 forCustomEditMode:(int64_t)a6 slot:(id)a7
{
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  CLKUIQuadView **p_quadView;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  _BOOL4 v21;
  double v22;
  void *v23;
  id v24;

  v24 = a4;
  v12 = a5;
  v13 = a7;
  if (a6 == 15)
  {
    p_quadView = &self->_quadView;
    -[CLKUIQuadView removeAllQuads](self->_quadView, "removeAllQuads");
    -[NSMapTable removeAllObjects](self->_quadPathfinderMapTable, "removeAllObjects");
    -[NTKKaleidoscopeFaceView _quadWithStyle:asset:](self, "_quadWithStyle:asset:", objc_msgSend(v24, "style"), self->_currentAsset);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKKaleidoscopeFaceView _quadWithStyle:asset:](self, "_quadWithStyle:asset:", objc_msgSend(v12, "style"), self->_currentAsset);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NTKKaleidoscopeFaceView _isEditOptionFullscreen:](self, "_isEditOptionFullscreen:", v24);
    v22 = 1.0 - a3;
    if (v21)
    {
      a3 = 1.0 - a3;
      v18 = v17;
    }
    else
    {
      v18 = v20;
    }
    if (v21)
      v23 = v20;
    else
      v23 = v17;
    *(float *)&v22 = a3;
    objc_msgSend(v18, "setAlpha:", v22);
    objc_msgSend(v18, "setOpaque:", a3 >= 1.0);
    objc_msgSend(v23, "setOpaque:", 1);
    -[CLKUIQuadView addQuad:](*p_quadView, "addQuad:", v23);
    goto LABEL_11;
  }
  if (a6 == 12)
  {
    v14 = objc_msgSend(v24, "asset");
    v15 = objc_msgSend(v12, "asset");
    p_quadView = &self->_quadView;
    -[CLKUIQuadView removeAllQuads](self->_quadView, "removeAllQuads");
    -[NSMapTable removeAllObjects](self->_quadPathfinderMapTable, "removeAllObjects");
    -[NTKKaleidoscopeFaceView _quadWithStyle:asset:](self, "_quadWithStyle:asset:", self->_currentStyle, v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOpaque:", 1);
    -[CLKUIQuadView addQuad:](self->_quadView, "addQuad:", v17);
    -[NTKKaleidoscopeFaceView _quadWithStyle:asset:](self, "_quadWithStyle:asset:", self->_currentStyle, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v19 = a3;
    objc_msgSend(v18, "setAlpha:", v19);
    v20 = v18;
LABEL_11:
    -[CLKUIQuadView addQuad:](*p_quadView, "addQuad:", v18);

  }
}

- (void)_configureForTransitionFraction:(double)a3 fromEditMode:(int64_t)a4 toEditMode:(int64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  _OWORD v13[3];

  -[NTKFaceView timeView](self, "timeView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKKaleidoscopeFaceView _handAlphaForEditMode:](self, "_handAlphaForEditMode:", a4);
  -[NTKKaleidoscopeFaceView _handAlphaForEditMode:](self, "_handAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v8, "setAlpha:");

  -[NTKFaceView contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKKaleidoscopeFaceView _contentAlphaForEditMode:](self, "_contentAlphaForEditMode:", a4);
  -[NTKKaleidoscopeFaceView _contentAlphaForEditMode:](self, "_contentAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v9, "setAlpha:");

  -[NTKFaceView contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v13[0] = *MEMORY[0x1E0C9BAA8];
  v13[1] = v11;
  v13[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v10, "setTransform:", v13);

  -[NTKFaceView foregroundContainerView](self, "foregroundContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKKaleidoscopeFaceView _complicationAlphaForEditMode:](self, "_complicationAlphaForEditMode:", a4);
  -[NTKKaleidoscopeFaceView _complicationAlphaForEditMode:](self, "_complicationAlphaForEditMode:", a5);
  CLKInterpolateBetweenFloatsClipped();
  objc_msgSend(v12, "setAlpha:");

}

- (void)_applyRubberBandingFraction:(double)a3 forCustomEditMode:(int64_t)a4 slot:(id)a5
{
  void *v8;
  double v9;
  CGAffineTransform v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKFaceView _applyRubberBandingFraction:forCustomEditMode:slot:](&v11, sel__applyRubberBandingFraction_forCustomEditMode_slot_, a4, a5);
  if (a4 == 15 || a4 == 12)
  {
    -[NTKFaceView contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", NTKAlphaForRubberBandingFraction(a3));
    v9 = NTKScaleForRubberBandingFraction(a3);
    CGAffineTransformMakeScale(&v10, v9, v9);
    objc_msgSend(v8, "setTransform:", &v10);

  }
}

- (int64_t)_complicationPickerStyleForSlot:(id)a3
{
  return 1;
}

- (id)_keylineViewForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  CGFloat v13[13];
  objc_super v14;

  v6 = a4;
  if (a3 == 15 || a3 == 12)
  {
    -[NTKFaceView device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "deviceCategory") == 1)
    {
      -[NTKFaceView _faceEditingScaleForEditMode:slot:](self, "_faceEditingScaleForEditMode:slot:", a3, v6);
      v9 = v8;
      _LayoutConstants_41(v7, (uint64_t)v13);
      NTKKeylineViewWithCircle(v13[0], v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14.receiver = self;
      v14.super_class = (Class)NTKKaleidoscopeFaceView;
      -[NTKFaceView _keylineViewForCustomEditMode:slot:](&v14, sel__keylineViewForCustomEditMode_slot_, a3, v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (CGRect)_relativeKeylineFrameForCustomEditMode:(int64_t)a3 slot:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
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
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  uint64_t v29[13];
  CGRect result;

  v6 = a4;
  -[NTKFaceView device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "deviceCategory");

  if (v8 == 1 && (a3 == 15 || a3 == 12))
  {
    -[NTKFaceView device](self, "device");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_41(v9, (uint64_t)v29);

    -[NTKFaceView timeView](self, "timeView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "center");
    -[NTKFaceView device](self, "device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    CLKRectCenteredAboutPointForDevice();
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)NTKKaleidoscopeFaceView;
    -[NTKFaceView _relativeKeylineFrameForCustomEditMode:slot:](&v28, sel__relativeKeylineFrameForCustomEditMode_slot_, a3, v6);
    v13 = v20;
    v15 = v21;
    v17 = v22;
    v19 = v23;
  }

  v24 = v13;
  v25 = v15;
  v26 = v17;
  v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (int64_t)_keylineStyleForComplicationSlot:(id)a3
{
  return -[NTKColorCircularUtilitarianFaceViewComplicationFactory keylineStyleForComplicationSlot:](self->_faceViewComplicationFactory, "keylineStyleForComplicationSlot:", a3);
}

- (BOOL)_supportsUnadornedSnapshot
{
  return 0;
}

- (void)_updateForResourceDirectoryChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKFaceView _updateForResourceDirectoryChange:](&v4, sel__updateForResourceDirectoryChange_, a3);
  -[NTKKaleidoscopeFaceView _updateUserContent](self, "_updateUserContent");
  -[NTKFaceView reloadSnapshotContentViews](self, "reloadSnapshotContentViews");
}

- (id)provideAtlasBacking:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  UIImage *userImage;
  NSString *userUuidLuma;
  NSString *userUuidChroma;
  NSString *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Kaleidoscope-RosetteMask")))
  {
    if (self->_userUuidLuma && self->_userUuidChroma)
    {
      if (objc_msgSend(v4, "isEqualToString:"))
      {
        +[NTKKaleidoscopeCoordinatorCache sharedCache](NTKKaleidoscopeCoordinatorCache, "sharedCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v17;
        userImage = self->_userImage;
        userUuidLuma = self->_userUuidLuma;
        userUuidChroma = self->_userUuidChroma;
        v21 = userUuidLuma;
LABEL_21:
        objc_msgSend(v17, "provideAtlasBacking:uuid:uuidLuma:uuidChroma:", userImage, userUuidLuma, v21, userUuidChroma);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_28;
      }
      if (objc_msgSend(v4, "isEqualToString:", self->_userUuidChroma))
      {
        +[NTKKaleidoscopeCoordinatorCache sharedCache](NTKKaleidoscopeCoordinatorCache, "sharedCache");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v17;
        userImage = self->_userImage;
        userUuidLuma = self->_userUuidChroma;
        v21 = self->_userUuidLuma;
        userUuidChroma = userUuidLuma;
        goto LABEL_21;
      }
    }
    NTKBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("art"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v32 = v4;
        v33 = 2112;
        v34 = v22;
        _os_log_impl(&dword_1B72A3000, v23, OS_LOG_TYPE_DEFAULT, "[kaleidoscope] using artwork for %@ at %@", buf, 0x16u);
      }

      objc_msgSend(off_1E6BCA6D0, "atlasBackingWithArt:uuid:", v22, v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NTKImageNamed(v4);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E6BCA6D0, "atlasBackingWithImage:uuid:", v24, v4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_28;
  }
  NTKBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[NTKFaceView device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIOrderedSuffixesForDevice();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v7;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v12 = v4;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@@2x"), v4, *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "pathForResource:ofType:", v13, CFSTR("art"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v4 = v12;
          objc_msgSend(off_1E6BCA6D0, "atlasBackingWithArt:uuid:", v14, v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_18;
        }
        _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
        v15 = objc_claimAutoreleasedReturnValue();
        v4 = v12;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v12;
          _os_log_error_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_ERROR, "[kaleidoscope] missing artwork: %@", buf, 0xCu);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v9)
        continue;
      break;
    }
  }
  v16 = 0;
LABEL_18:

LABEL_28:
  return v16;
}

- (id)resourceProviderKey
{
  return self->_resourceProviderKey;
}

- (void)_updateDayDuration
{
  void *v3;
  void *v4;
  double v5;
  id v6;

  NTKIdealizedDate();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "timeIntervalSinceDate:", v6);
  self->_dayDuration = v5;

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

- (float)_crownTurnsForStyle:(unint64_t)a3
{
  BOOL v3;
  float result;

  v3 = a3 == 3 || a3 == 0;
  result = 5.0;
  if (v3)
    return 1.0;
  return result;
}

- (id)_swatchFromUserImage
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;

  if (self->_userImage)
  {
    -[NTKFaceView device](self, "device");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKKaleidoscopeAssetOption optionWithAsset:forDevice:](NTKKaleidoscopeCustomAssetOption, "optionWithAsset:forDevice:", 1000, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", objc_msgSend(v4, "swatchStyle"));
    NTKPhotosAspectFilledImageFromImage(self->_userImage, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_updateUserContent
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "[kaleidoscope pathfinder cache] link failed %@", a5, a6, a7, a8, 2u);
}

- (void)_updateFramerate
{
  BOOL v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  _BYTE v7[88];
  uint64_t v8;

  v3 = -[NTKFaceView editing](self, "editing");
  if (v3)
  {
LABEL_6:
    v4 = 0;
    goto LABEL_7;
  }
  if (!-[NTKFaceView isFrozen](self, "isFrozen"))
  {
    if (-[NTKFaceView dataMode](self, "dataMode") != 1 && -[NTKFaceView dataMode](self, "dataMode") != 5)
    {
      v4 = -[NTKFaceView dataMode](self, "dataMode") != 3;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v4 = 1;
LABEL_7:
  -[CLKUIQuadView setPaused:](self->_quadView, "setPaused:", v4 | NTKIsScreenOn() ^ 1);
  if (v3 || self->_interactiveModeAnimationInFlight)
  {
    v5 = 0;
  }
  else
  {
    -[NTKFaceView device](self, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _LayoutConstants_41(v6, (uint64_t)v7);
    v5 = v8;

  }
  -[CLKUIQuadView setPreferredFramesPerSecond:](self->_quadView, "setPreferredFramesPerSecond:", v5);
}

- (void)_updateRotationForQuadView:(id)a3 time:(double)a4 crownOffset:(double)a5
{
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  float v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  float v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = fmod(a5 * 60.0 / self->_crownTurnsPerRotation + a4, 120.0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a3, "quads", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_quadPathfinderMapTable, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "startRotation");
        v11 = v7 / 120.0;
        *(float *)&v17 = fmodf(v16 + v11, 1.0);
        objc_msgSend(v14, "setRotation:", v17);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (id)_updatePathForQuadView:(id)a3 time:(double)a4 crownOffset:(double)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  float v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  CGColor *v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  _OWORD v24[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(v8, "quads");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v10)
  {

LABEL_13:
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[NTKKaleidoscopeFaceView _updatePathForQuadView:time:crownOffset:].cold.1(v21);

    goto LABEL_16;
  }
  v11 = v10;
  v23 = v8;
  v12 = 0;
  v13 = *(_QWORD *)v26;
  v14 = (a4 + a5 * 1800.0 + floor((a4 + a5 * 1800.0) / 43200.0) * -43200.0) / 43200.0;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v26 != v13)
        objc_enumerationMutation(v9);
      v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      -[NSMapTable objectForKey:](self->_quadPathfinderMapTable, "objectForKey:", v16, v23);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        memset(v24, 0, sizeof(v24));
        objc_msgSend(v17, "pointForTime:", COERCE_DOUBLE((unint64_t)LODWORD(v14)));
        v19 = CGColorCreate(self->_extendedSRGBcolorSpace, (const CGFloat *)v24);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithCGColor:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        CGColorRelease(v19);
        objc_msgSend(v16, "setSampleRadius:", 0.0);
        objc_msgSend(v16, "setSampleCenter:", 0.0);
        v12 = (void *)v20;
      }

    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v11);

  v8 = v23;
  if (!v12)
    goto LABEL_13;
LABEL_16:

  return v12;
}

- (void)_updatePathForTime:(double)a3
{
  UIColor *v4;
  UIColor *complicationColor;
  UIColor *v6;
  UIColor *complicationPlatterColor;

  -[NTKKaleidoscopeFaceView _updatePathForQuadView:time:crownOffset:](self, "_updatePathForQuadView:time:crownOffset:", self->_quadView, a3, self->_crownOffset);
  v4 = (UIColor *)objc_claimAutoreleasedReturnValue();
  complicationColor = self->_complicationColor;
  self->_complicationColor = v4;

  NTKColorByPremultiplyingAlpha(self->_complicationColor, 0.15);
  v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
  complicationPlatterColor = self->_complicationPlatterColor;
  self->_complicationPlatterColor = v6;

}

- (void)_updateComplicationColors
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__NTKKaleidoscopeFaceView__updateComplicationColors__block_invoke;
  v2[3] = &unk_1E6BD8C68;
  v2[4] = self;
  -[NTKFaceView enumerateComplicationDisplayWrappersWithBlock:](self, "enumerateComplicationDisplayWrappersWithBlock:", v2);
}

void __52__NTKKaleidoscopeFaceView__updateComplicationColors__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  objc_msgSend(a3, "display");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080);
    v5 = v6;
    objc_msgSend(v5, "setForegroundColor:", v4);
    objc_msgSend(v5, "setPlatterColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 928));

  }
  if (objc_msgSend(v6, "conformsToProtocol:", &unk_1F8E9F268))
    objc_msgSend(v6, "setForegroundColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1080));

}

- (id)_imageForAsset:(unint64_t)a3
{
  UIImage *v3;
  void *v4;

  if (a3 == 1000)
  {
    v3 = self->_userImage;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Kaleidoscope-Asset%02d"), (a3 + 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(v4);
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)_pathfinderForAsset:(unint64_t)a3
{
  NTKKaleidoscopePathfinder *v5;
  void *v6;
  void *v7;
  void *v8;
  NTKKaleidoscopePathfinder *v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  void *v20;

  if (a3 == 1000)
  {
    v5 = self->_userPathfinder;
    if (!v5)
    {
LABEL_26:
      -[NTKKaleidoscopeFaceView _imageForAsset:](self, "_imageForAsset:", a3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[NTKKaleidoscopePathfinder pathfinderWithImage:](NTKKaleidoscopePathfinder, "pathfinderWithImage:", v20);
      v5 = (NTKKaleidoscopePathfinder *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    NTKBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Kaleidoscope-Asset%02d"), (a3 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "pathForResource:ofType:", v7, CFSTR("pathfinder"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      +[NTKKaleidoscopePathfinder pathfinderFromFile:](NTKKaleidoscopePathfinder, "pathfinderFromFile:", v8);
      v9 = (NTKKaleidoscopePathfinder *)objc_claimAutoreleasedReturnValue();
      v5 = v9;
      LODWORD(v10) = 1048576045;
      LODWORD(v11) = 1062269566;
      switch(a3)
      {
        case 8uLL:
          goto LABEL_22;
        case 9uLL:
          LODWORD(v11) = 1050609104;
          goto LABEL_22;
        case 0xAuLL:
          LODWORD(v11) = 1060939122;
          goto LABEL_22;
        case 0xBuLL:
          LODWORD(v11) = 1057069931;
          goto LABEL_22;
        case 0xCuLL:
          goto LABEL_15;
        case 0xDuLL:
          LODWORD(v10) = 1050513605;
          goto LABEL_15;
        case 0xEuLL:
          LODWORD(v10) = 1072344365;
          goto LABEL_15;
        case 0xFuLL:
          LODWORD(v10) = 1071251596;
LABEL_15:
          LODWORD(v11) = LODWORD(v10);
          -[NTKKaleidoscopePathfinder adjustRotationStart:](v9, "adjustRotationStart:", v11);
          LODWORD(v19) = 0.5;
          goto LABEL_24;
        case 0x17uLL:
          LODWORD(v11) = -1101792568;
          goto LABEL_22;
        case 0x18uLL:
          LODWORD(v11) = 1013008293;
          goto LABEL_22;
        case 0x19uLL:
          LODWORD(v11) = 1034800000;
          goto LABEL_22;
        case 0x1AuLL:
          LODWORD(v11) = -1084462872;
LABEL_22:
          -[NTKKaleidoscopePathfinder adjustRotationStart:](v9, "adjustRotationStart:", v11, v10);
          goto LABEL_23;
        default:
          LODWORD(v11) = 0;
          -[NTKKaleidoscopePathfinder adjustRotationStart:](v9, "adjustRotationStart:", v11, v10);
          if (a3 - 27 >= 6)
LABEL_23:
            LODWORD(v19) = 1.0;
          else
            LODWORD(v19) = *(_DWORD *)"ff&?";
LABEL_24:
          -[NTKKaleidoscopePathfinder adjustSampleRadius:](v5, "adjustSampleRadius:", v19);
          break;
      }
    }
    else
    {
      _NTKLoggingObjectForDomain(0, (uint64_t)"NTKLoggingDomainDefault");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NTKKaleidoscopeFaceView _pathfinderForAsset:].cold.1((uint64_t)v7, v12, v13, v14, v15, v16, v17, v18);

      v5 = 0;
    }

    if (!v5)
      goto LABEL_26;
  }
  return v5;
}

- (id)_textureLumaForAsset:(unint64_t)a3
{
  CLKUITexture *v4;
  const __CFString *v6;
  void *v7;
  int64x2_t v8;
  int64x2_t v9;

  if (a3 == 1000)
  {
    v4 = self->_userTextureLuma;
  }
  else
  {
    v6 = CFSTR("~iphone");
    if (a3 - 8 < 0x14)
      v6 = &stru_1E6BDC918;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Kaleidoscope-Asset%02d-l%@"), (a3 + 1), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8.i64[0] = 8;
    v9.i64[0] = a3 & 0xFFFFFFFFFFFFFFFCLL;
    objc_msgSend(off_1E6BCA720, "textureWithProviderDelegate:uuid:rect:", self, v7, *(double *)vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v9, v8).i64[0], 0), (int8x16_t)xmmword_1B755FC70, (int8x16_t)xmmword_1B755FC60).i64);
    v4 = (CLKUITexture *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_textureChromaForAsset:(unint64_t)a3
{
  CLKUITexture *v4;
  const __CFString *v6;
  void *v7;
  int64x2_t v8;
  int64x2_t v9;

  if (a3 == 1000)
  {
    v4 = self->_userTextureChroma;
  }
  else
  {
    v6 = CFSTR("~iphone");
    if (a3 - 8 < 0x14)
      v6 = &stru_1E6BDC918;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Kaleidoscope-Asset%02d-c%@"), (a3 + 1), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8.i64[0] = 8;
    v9.i64[0] = a3 & 0xFFFFFFFFFFFFFFFCLL;
    objc_msgSend(off_1E6BCA720, "textureWithProviderDelegate:uuid:rect:", self, v7, *(double *)vbslq_s8((int8x16_t)vdupq_lane_s64(vceqq_s64(v9, v8).i64[0], 0), (int8x16_t)xmmword_1B755FC70, (int8x16_t)xmmword_1B755FC60).i64);
    v4 = (CLKUITexture *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_quadWithStyle:(unint64_t)a3 asset:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __n128 v13;
  void *v14;
  _BYTE v16[80];
  unsigned __int32 v17;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](self->_loadedAssets, "addObject:", v7);
  +[NTKKaleidoscopeQuad quadWithShaderType:](NTKKaleidoscopeQuad, "quadWithShaderType:", qword_1B755FC40[a3]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKKaleidoscopeFaceView _textureLumaForAsset:](self, "_textureLumaForAsset:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrimaryLumaTexture:", v9);

  -[NTKKaleidoscopeFaceView _textureChromaForAsset:](self, "_textureChromaForAsset:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPrimaryChromaTexture:", v10);

  if (a3 == 2)
  {
    objc_msgSend(off_1E6BCA720, "textureWithProviderDelegate:uuid:", self, CFSTR("Kaleidoscope-RosetteMask"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSecondaryTexture:", v11);

  }
  -[NTKFaceView device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = _LayoutConstants_41(v12, (uint64_t)v16);
  v13.n128_u32[0] = v17;
  objc_msgSend(v8, "setDialRadius:", v13.n128_f64[0]);

  -[NTKKaleidoscopeFaceView _pathfinderForAsset:](self, "_pathfinderForAsset:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_quadPathfinderMapTable, "setObject:forKey:", v14, v8);

  return v8;
}

- (void)_prepareToZoom
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKFaceView _prepareToZoom](&v3, sel__prepareToZoom);
  -[CLKUIQuadView setPaused:](self->_quadView, "setPaused:", 1);
}

- (void)_cleanupAfterZoom
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTKKaleidoscopeFaceView;
  -[NTKFaceView _cleanupAfterZoom](&v3, sel__cleanupAfterZoom);
  -[NTKKaleidoscopeFaceView _updateFramerate](self, "_updateFramerate");
}

- (id)_swatchForAsset:(unint64_t)a3
{
  UIImage *v3;
  void *v4;

  if (a3 == 1000)
  {
    v3 = self->_userSwatch;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Swatch-Kaleidoscope-Asset%02d"), (a3 + 1));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(v4);
    v3 = (UIImage *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)_swatchForEditModeDependsOnOptions:(int64_t)a3 forDevice:(id)a4
{
  if (a3 == 15)
    return &unk_1E6CAA4B0;
  else
    return 0;
}

- (id)_swatchImageForEditOption:(id)a3 mode:(int64_t)a4 withSelectedOptions:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  +[NTKKaleidoscopeSwatchMappedImageCache sharedCache](NTKKaleidoscopeSwatchMappedImageCache, "sharedCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 == 15)
  {
    v12 = v8;
    objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1E6CA1620);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFaceView resourceDirectory](self, "resourceDirectory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKKaleidoscopeSwatchMappedImageCache keyForAsset:style:resourceDirectory:](NTKKaleidoscopeSwatchMappedImageCache, "keyForAsset:style:resourceDirectory:", v13, v12, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageForKey:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v19 = objc_msgSend(v13, "asset");
      v17 = objc_msgSend(v12, "style");
      +[NTKEditOption sizeForSwatchStyle:](NTKEditOption, "sizeForSwatchStyle:", objc_msgSend(v12, "swatchStyle"));
      -[NTKKaleidoscopeFaceView _snapshotWithAsset:style:size:](self, "_snapshotWithAsset:style:size:", v19, v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setImage:forKey:", v16, v15);
    }

  }
  else
  {
    if (a4 == 12)
    {
      -[NTKKaleidoscopeFaceView _swatchForAsset:](self, "_swatchForAsset:", objc_msgSend(v8, "asset"));
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)NTKKaleidoscopeFaceView;
      -[NTKFaceView _swatchImageForEditOption:mode:withSelectedOptions:](&v20, sel__swatchImageForEditOption_mode_withSelectedOptions_, v8, a4, v9);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v16 = (void *)v11;
  }

  return v16;
}

- (id)_snapshotWithAsset:(unint64_t)a3 style:(unint64_t)a4 size:(CGSize)a5
{
  double height;
  double width;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  double v18;
  void *v19;

  height = a5.height;
  width = a5.width;
  v10 = *MEMORY[0x1E0C9D538];
  v11 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(off_1E6BCA708, "quadViewWithFrame:identifier:", CFSTR("Klei"), *MEMORY[0x1E0C9D538], v11, a5.width, a5.height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKKaleidoscopeFaceView _quadWithStyle:asset:](self, "_quadWithStyle:asset:", a4, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOpaque:", 1);
  objc_msgSend(v12, "addQuad:", v13);
  -[NTKKaleidoscopeFaceView _kaleidoscopeTime](self, "_kaleidoscopeTime");
  v15 = v14;
  -[NTKKaleidoscopeFaceView _updateWithAsset:](self, "_updateWithAsset:", a3);
  v16 = -[NTKKaleidoscopeFaceView _updatePathForQuadView:time:crownOffset:](self, "_updatePathForQuadView:time:crownOffset:", v12, v15, 0.0);
  -[NTKKaleidoscopeFaceView _updateRotationForQuadView:time:crownOffset:](self, "_updateRotationForQuadView:time:crownOffset:", v12, v15, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "nativeScale");
  objc_msgSend(v12, "snapshotInRect:scale:time:", v10, v11, width, height, v18, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (unint64_t)currentAsset
{
  return self->_currentAsset;
}

- (unint64_t)currentStyle
{
  return self->_currentStyle;
}

- (UIColor)complicationColor
{
  return self->_complicationColor;
}

- (void)setComplicationColor:(id)a3
{
  objc_storeStrong((id *)&self->_complicationColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complicationColor, 0);
  objc_storeStrong((id *)&self->_loadedAssets, 0);
  objc_storeStrong((id *)&self->_quadPathfinderMapTable, 0);
  objc_storeStrong((id *)&self->_resourceProviderKey, 0);
  objc_storeStrong((id *)&self->_userPathfinder, 0);
  objc_storeStrong((id *)&self->_userUuidChroma, 0);
  objc_storeStrong((id *)&self->_userUuidLuma, 0);
  objc_storeStrong((id *)&self->_userPhoto, 0);
  objc_storeStrong((id *)&self->_userImage, 0);
  objc_storeStrong((id *)&self->_userSwatch, 0);
  objc_storeStrong((id *)&self->_userTextureChroma, 0);
  objc_storeStrong((id *)&self->_userTextureLuma, 0);
  objc_storeStrong((id *)&self->_complicationPlatterColor, 0);
  objc_storeStrong((id *)&self->_faceViewComplicationFactory, 0);
  objc_storeStrong((id *)&self->_cornerView, 0);
  objc_storeStrong((id *)&self->_quadView, 0);
}

- (void)_updatePathForQuadView:(os_log_t)log time:crownOffset:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "[kaleidoscope] pathfinder is nil! Coloring complications white.", v1, 2u);
}

- (void)_pathfinderForAsset:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B72A3000, a2, a3, "[kaleidoscope pathfinder cache] missing pathfinder: %@", a5, a6, a7, a8, 2u);
}

@end
