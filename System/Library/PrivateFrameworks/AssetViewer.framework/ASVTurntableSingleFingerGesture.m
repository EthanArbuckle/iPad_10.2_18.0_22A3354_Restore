@implementation ASVTurntableSingleFingerGesture

- (ASVTurntableSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 turntableDelegate:(id)a5 enabledGestureTypes:(unint64_t)a6
{
  id v10;
  ASVTurntableSingleFingerGesture *v11;
  ASVTurntableSingleFingerGesture *v12;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ASVTurntableSingleFingerGesture;
  v11 = -[ASVSingleFingerGesture initWithTouch:dataSource:delegate:enabledGestureTypes:](&v14, sel_initWithTouch_dataSource_delegate_enabledGestureTypes_, a3, a4, v10, a6);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_turntableDelegate, v10);

  return v12;
}

- (void)updateGesture
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASVTurntableSingleFingerGesture;
  -[ASVSingleFingerGesture updateGesture](&v3, sel_updateGesture);
  if (-[ASVSingleFingerGesture generatesTransforms](self, "generatesTransforms"))
    -[ASVTurntableSingleFingerGesture updatePan](self, "updatePan");
}

- (void)updatePan
{
  float32x2_t v3;
  float32x2_t v4;
  float32x2_t v5;
  float32x2_t v6;
  float32_t v7;
  void *v8;
  id v9;

  if (!-[ASVSingleFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
    v4 = v3;
    -[ASVSingleFingerGesture initialTouchLocation](self, "initialTouchLocation");
    v6 = vsub_f32(v4, v5);
    v4.f32[0] = sqrtf(vaddv_f32(vmul_f32(v6, v6)));
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntableSingleFingerPanThreshold"));
    if (v4.f32[0] >= v7)
    {
      -[ASVSingleFingerGesture setPanThresholdPassed:](self, "setPanThresholdPassed:", 1);
      -[ASVTurntableSingleFingerGesture turntableDelegate](self, "turntableDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
      objc_msgSend(v8, "gesture:beganPanningAtScreenPoint:", self);

    }
  }
  if (-[ASVSingleFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    -[ASVTurntableSingleFingerGesture turntableDelegate](self, "turntableDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
    objc_msgSend(v9, "gesture:pannedToScreenPoint:", self);

  }
}

- (void)finishGesture
{
  id v3;
  objc_super v4;

  if (-[ASVSingleFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    -[ASVTurntableSingleFingerGesture turntableDelegate](self, "turntableDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gestureEndedPanning:", self);

  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ASVTurntableSingleFingerGesture;
    -[ASVSingleFingerGesture finishGesture](&v4, sel_finishGesture);
  }
}

- (ASVTurntableSingleFingerGestureDelegate)turntableDelegate
{
  return (ASVTurntableSingleFingerGestureDelegate *)objc_loadWeakRetained((id *)&self->_turntableDelegate);
}

- (void)setTurntableDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_turntableDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_turntableDelegate);
}

@end
