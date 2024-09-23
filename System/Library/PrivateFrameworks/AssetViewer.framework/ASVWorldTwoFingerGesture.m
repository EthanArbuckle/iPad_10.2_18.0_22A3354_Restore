@implementation ASVWorldTwoFingerGesture

- (ASVWorldTwoFingerGesture)initWithFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5 worldDelegate:(id)a6
{
  id v10;
  ASVWorldTwoFingerGesture *v11;
  ASVWorldTwoFingerGesture *v12;
  ASVWorldGestureDragOffsetCorrector *dragOffsetCorrector;
  ASVWorldTwoFingerGesture *v14;
  objc_super v16;

  v10 = a6;
  v16.receiver = self;
  v16.super_class = (Class)ASVWorldTwoFingerGesture;
  v11 = -[ASVTwoFingerGesture initWithFirstTouch:secondTouch:dataSource:delegate:](&v16, sel_initWithFirstTouch_secondTouch_dataSource_delegate_, a3, a4, a5, v10);
  v12 = v11;
  if (v11)
  {
    if (!-[ASVGesture firstTouchWasOnAsset](v11, "firstTouchWasOnAsset"))
    {
      v14 = 0;
      goto LABEL_6;
    }
    objc_storeWeak((id *)&v12->_worldDelegate, v10);
    dragOffsetCorrector = v12->_dragOffsetCorrector;
    v12->_dragOffsetCorrector = 0;

  }
  v14 = v12;
LABEL_6:

  return v14;
}

- (void)updatePanWithFirstTouchLocation:(ASVWorldTwoFingerGesture *)self secondTouchLocation:(SEL)a2 midPoint:
{
  float32x2_t v2;
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32x2_t v7;
  uint64_t v9;
  int v10;
  uint64_t v11;
  float32x2_t v12;
  float32x2_t v13;
  float32x2_t v14;
  float32x2_t v15;
  float32x2_t v16;
  float32x2_t v17;
  float v18;
  float32x2_t v19;
  float32x2_t v20;
  float32x2_t v21;
  float32x2_t v22;
  int32x2_t v23;
  float32x2_t v24;
  int32x2_t v25;
  int8x8_t v26;
  float32x2_t v27;
  float32x2_t v28;
  float v29;
  float32x2_t v30;
  double v31;
  float32x2_t v32;
  ASVWorldGestureDragOffsetCorrector *v33;
  float32x2_t v35;
  double v36;
  float32x2_t v37;
  ASVWorldGestureDragOffsetCorrector *v38;
  void *v39;
  float32x2_t v40;
  float32x2_t v41;
  double v42;
  uint64_t v43;
  int32x2_t v44;
  id v45;

  v5 = v4;
  v6 = v3;
  v7 = v2;
  -[ASVWorldTwoFingerGesture worldDelegate](self, "worldDelegate");
  v45 = (id)objc_claimAutoreleasedReturnValue();
  if (!-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTwoFingerTranslationThreshold"));
    v43 = v9;
    if (-[ASVTwoFingerGesture rotationThresholdPassed](self, "rotationThresholdPassed")
      || -[ASVTwoFingerGesture scaleThresholdPassed](self, "scaleThresholdPassed"))
    {
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTwoFingerTranslationThresholdHarder"));
      v10 = 0;
      -[ASVGesture latestAssetLocationOnScreen](self, "latestAssetLocationOnScreen", v11);
    }
    else
    {
      v10 = 1;
      -[ASVGesture latestAssetLocationOnScreen](self, "latestAssetLocationOnScreen", v43);
    }
    v13 = v12;
    -[ASVGesture initialAssetLocationOnScreen](self, "initialAssetLocationOnScreen");
    v15 = vsub_f32(v13, v14);
    if (sqrtf(vaddv_f32(vmul_f32(v15, v15))) >= *(float *)v44.i32)
      -[ASVTwoFingerGesture setPanThresholdPassed:](self, "setPanThresholdPassed:", 1);
    if (!-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed"))
    {
      -[ASVTwoFingerGesture initialFirstTouchLocation](self, "initialFirstTouchLocation");
      v17 = vsub_f32(v7, v16);
      v18 = sqrtf(vaddv_f32(vmul_f32(v17, v17)));
      -[ASVTwoFingerGesture initialSecondTouchLocation](self, "initialSecondTouchLocation");
      v20 = v19;
      -[ASVTwoFingerGesture initialMidPoint](self, "initialMidPoint");
      if (v18 >= *(float *)v44.i32)
      {
        v22 = vsub_f32(v5, v21);
        v23 = (int32x2_t)vmul_f32(v22, v22);
        v24 = vsub_f32(v6, v20);
        v25 = (int32x2_t)vmul_f32(v24, v24);
        v26 = vmvn_s8((int8x8_t)vcge_f32(vsqrt_f32(vadd_f32((float32x2_t)vzip1_s32(v23, v25), (float32x2_t)vzip2_s32(v23, v25))), (float32x2_t)vdup_lane_s32(v44, 0)));
        if (((v26.i32[1] | v26.i32[0]) & 1) == 0)
          -[ASVTwoFingerGesture setPanThresholdPassed:](self, "setPanThresholdPassed:", 1);
      }
    }
    if (-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed"))
    {
      if (v10)
      {
        -[ASVTwoFingerGesture initialMidPoint](self, "initialMidPoint");
        v28 = vsub_f32(v5, v27);
        v29 = fabsf(atan2f(v28.f32[0], v28.f32[1]) * 57.296);
        -[ASVGesture initialAssetLocationOnScreen](self, "initialAssetLocationOnScreen");
        v31 = COERCE_DOUBLE(vsub_f32(v5, v30));
        -[ASVGesture latestAssetLocationOnScreen](self, "latestAssetLocationOnScreen");
        v33 = -[ASVWorldGestureDragOffsetCorrector initWithInitialDragOffset:thresholdDragOffset:]([ASVWorldGestureDragOffsetCorrector alloc], "initWithInitialDragOffset:thresholdDragOffset:", v31, COERCE_DOUBLE(vsub_f32(v5, v32)));
        -[ASVWorldTwoFingerGesture setDragOffsetCorrector:](self, "setDragOffsetCorrector:", v33);

        if (v29 < 30.0 || v29 > 150.0)
        {
          -[ASVTwoFingerGesture setLevitationThresholdPassed:](self, "setLevitationThresholdPassed:", 1);
          objc_msgSend(v45, "gestureBeganLevitation:", self);
          goto LABEL_21;
        }
      }
      else
      {
        -[ASVGesture initialAssetLocationOnScreen](self, "initialAssetLocationOnScreen");
        v36 = COERCE_DOUBLE(vsub_f32(v5, v35));
        -[ASVGesture latestAssetLocationOnScreen](self, "latestAssetLocationOnScreen");
        v38 = -[ASVWorldGestureDragOffsetCorrector initWithInitialDragOffset:thresholdDragOffset:]([ASVWorldGestureDragOffsetCorrector alloc], "initWithInitialDragOffset:thresholdDragOffset:", v36, COERCE_DOUBLE(vsub_f32(v5, v37)));
        -[ASVWorldTwoFingerGesture setDragOffsetCorrector:](self, "setDragOffsetCorrector:", v38);

      }
      objc_msgSend(v45, "gestureBeganTranslation:", self);
    }
  }
LABEL_21:
  if (-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed")
    || -[ASVTwoFingerGesture levitationThresholdPassed](self, "levitationThresholdPassed"))
  {
    -[ASVWorldTwoFingerGesture dragOffsetCorrector](self, "dragOffsetCorrector");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "currentDragOffset");
    v41 = v40;

    v42 = COERCE_DOUBLE(vsub_f32(v5, v41));
    if (-[ASVTwoFingerGesture levitationThresholdPassed](self, "levitationThresholdPassed"))
      objc_msgSend(v45, "gesture:levitatedAssetToScreenPoint:", self, v42);
    else
      objc_msgSend(v45, "gesture:translatedAssetToScreenPoint:", self, v42);
  }

}

- (void)finishGesture
{
  void *v3;
  objc_super v4;

  if (-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    -[ASVWorldTwoFingerGesture worldDelegate](self, "worldDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[ASVTwoFingerGesture levitationThresholdPassed](self, "levitationThresholdPassed"))
      objc_msgSend(v3, "gestureEndedLevitation:", self);
    else
      objc_msgSend(v3, "gestureEndedTranslation:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)ASVWorldTwoFingerGesture;
  -[ASVTwoFingerGesture finishGesture](&v4, sel_finishGesture);
}

- (ASVWorldTwoFingerGestureDelegate)worldDelegate
{
  return (ASVWorldTwoFingerGestureDelegate *)objc_loadWeakRetained((id *)&self->_worldDelegate);
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
