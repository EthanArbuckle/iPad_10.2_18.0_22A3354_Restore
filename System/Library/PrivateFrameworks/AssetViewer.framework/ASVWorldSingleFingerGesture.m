@implementation ASVWorldSingleFingerGesture

- (ASVWorldSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 worldDelegate:(id)a5 enabledGestureTypes:(unint64_t)a6
{
  id v10;
  ASVWorldSingleFingerGesture *v11;
  ASVWorldSingleFingerGesture *v12;
  ASVWorldGestureDragOffsetCorrector *dragOffsetCorrector;
  objc_super v15;

  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ASVWorldSingleFingerGesture;
  v11 = -[ASVSingleFingerGesture initWithTouch:dataSource:delegate:enabledGestureTypes:](&v15, sel_initWithTouch_dataSource_delegate_enabledGestureTypes_, a3, a4, v10, a6);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_worldDelegate, v10);
    dragOffsetCorrector = v12->_dragOffsetCorrector;
    v12->_dragOffsetCorrector = 0;

  }
  return v12;
}

- (void)updateGesture
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASVWorldSingleFingerGesture;
  -[ASVSingleFingerGesture updateGesture](&v3, sel_updateGesture);
  if (-[ASVSingleFingerGesture generatesTransforms](self, "generatesTransforms"))
    -[ASVWorldSingleFingerGesture updateTranslation](self, "updateTranslation");
}

- (float)potentialAssetDistanceFromInitialLocationOnScreen
{
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;

  -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
  v4 = v3;
  -[ASVSingleFingerGesture initialTouchLocation](self, "initialTouchLocation");
  v6 = vsub_f32(v4, v5);
  -[ASVGesture latestAssetLocationOnScreen](self, "latestAssetLocationOnScreen");
  v8 = v7;
  -[ASVGesture initialAssetLocationOnScreen](self, "initialAssetLocationOnScreen");
  v10 = vadd_f32(v6, vsub_f32(v8, v9));
  return sqrtf(vaddv_f32(vmul_f32(v10, v10)));
}

- (void)updateTranslation
{
  void *v3;
  float v4;
  float v5;
  float v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  double v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v13;
  ASVWorldGestureDragOffsetCorrector *v14;
  void *v15;
  void *v16;
  float32x2_t v17;
  float32x2_t v18;
  float32x2_t v19;
  double v20;
  id v21;

  if (-[ASVGesture firstTouchWasOnAsset](self, "firstTouchWasOnAsset"))
  {
    -[ASVGesture dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assetScreenPosition");
    -[ASVGesture setLatestAssetLocationOnScreen:](self, "setLatestAssetLocationOnScreen:");

    if (!-[ASVSingleFingerGesture panThresholdPassed](self, "panThresholdPassed"))
    {
      -[ASVWorldSingleFingerGesture potentialAssetDistanceFromInitialLocationOnScreen](self, "potentialAssetDistanceFromInitialLocationOnScreen");
      v5 = v4;
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingSingleFingerTranslationThreshold"));
      if (v5 >= v6)
      {
        -[ASVSingleFingerGesture setPanThresholdPassed:](self, "setPanThresholdPassed:", 1);
        -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
        v8 = v7;
        -[ASVGesture initialAssetLocationOnScreen](self, "initialAssetLocationOnScreen");
        v10 = COERCE_DOUBLE(vsub_f32(v8, v9));
        -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
        v12 = v11;
        -[ASVGesture latestAssetLocationOnScreen](self, "latestAssetLocationOnScreen");
        v14 = -[ASVWorldGestureDragOffsetCorrector initWithInitialDragOffset:thresholdDragOffset:]([ASVWorldGestureDragOffsetCorrector alloc], "initWithInitialDragOffset:thresholdDragOffset:", v10, COERCE_DOUBLE(vsub_f32(v12, v13)));
        -[ASVWorldSingleFingerGesture setDragOffsetCorrector:](self, "setDragOffsetCorrector:", v14);

        -[ASVWorldSingleFingerGesture worldDelegate](self, "worldDelegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "gestureBeganTranslation:", self);

      }
    }
    if (-[ASVSingleFingerGesture panThresholdPassed](self, "panThresholdPassed"))
    {
      -[ASVWorldSingleFingerGesture dragOffsetCorrector](self, "dragOffsetCorrector");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "currentDragOffset");
      v18 = v17;

      -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
      v20 = COERCE_DOUBLE(vsub_f32(v19, v18));
      -[ASVWorldSingleFingerGesture worldDelegate](self, "worldDelegate");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "gesture:translatedAssetToScreenPoint:", self, v20);

    }
  }
}

- (void)finishGesture
{
  id v3;
  objc_super v4;

  if (-[ASVSingleFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    -[ASVWorldSingleFingerGesture worldDelegate](self, "worldDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gestureEndedTranslation:", self);

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASVWorldSingleFingerGesture;
    -[ASVSingleFingerGesture finishGesture](&v4, sel_finishGesture);
  }
}

- (ASVWorldSingleFingerGestureDelegate)worldDelegate
{
  return (ASVWorldSingleFingerGestureDelegate *)objc_loadWeakRetained((id *)&self->_worldDelegate);
}

- (void)setWorldDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_worldDelegate, a3);
}

- (ASVWorldGestureDragOffsetCorrector)dragOffsetCorrector
{
  return self->_dragOffsetCorrector;
}

- (void)setDragOffsetCorrector:(id)a3
{
  objc_storeStrong((id *)&self->_dragOffsetCorrector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dragOffsetCorrector, 0);
  objc_destroyWeak((id *)&self->_worldDelegate);
}

@end
