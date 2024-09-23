@implementation ASVTurntableTwoFingerGesture

- (ASVTurntableTwoFingerGesture)initWithFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5 turntableDelegate:(id)a6
{
  id v10;
  ASVTurntableTwoFingerGesture *v11;
  ASVTurntableTwoFingerGesture *v12;
  objc_super v14;

  v10 = a6;
  v14.receiver = self;
  v14.super_class = (Class)ASVTurntableTwoFingerGesture;
  v11 = -[ASVTwoFingerGesture initWithFirstTouch:secondTouch:dataSource:delegate:](&v14, sel_initWithFirstTouch_secondTouch_dataSource_delegate_, a3, a4, a5, v10);
  v12 = v11;
  if (v11)
    objc_storeWeak((id *)&v11->_turntableDelegate, v10);

  return v12;
}

- (void)updatePanWithFirstTouchLocation:(ASVTurntableTwoFingerGesture *)self secondTouchLocation:(SEL)a2 midPoint:
{
  double v2;
  double v3;
  float v5;
  float v6;
  float32x2_t v7;
  float32x2_t v8;
  void *v9;
  id v10;

  v3 = v2;
  if (!-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTurntableTwoFingerPanThreshold"));
    v6 = v5;
    -[ASVTwoFingerGesture initialMidPoint](self, "initialMidPoint");
    v8 = vsub_f32(*(float32x2_t *)&v3, v7);
    if (sqrtf(vaddv_f32(vmul_f32(v8, v8))) >= v6)
    {
      -[ASVTwoFingerGesture setPanThresholdPassed:](self, "setPanThresholdPassed:", 1);
      -[ASVTurntableTwoFingerGesture turntableDelegate](self, "turntableDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "gesture:beganPanningAtScreenPoint:", self, v3);

    }
  }
  if (-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    -[ASVTurntableTwoFingerGesture turntableDelegate](self, "turntableDelegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gesture:pannedToScreenPoint:", self, v3);

  }
}

- (void)finishGesture
{
  void *v3;
  objc_super v4;

  if (-[ASVTwoFingerGesture panThresholdPassed](self, "panThresholdPassed"))
  {
    -[ASVTurntableTwoFingerGesture turntableDelegate](self, "turntableDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gestureEndedPanning:", self);

  }
  v4.receiver = self;
  v4.super_class = (Class)ASVTurntableTwoFingerGesture;
  -[ASVTwoFingerGesture finishGesture](&v4, sel_finishGesture);
}

- (ASVTurntableTwoFingerGestureDelegate)turntableDelegate
{
  return (ASVTurntableTwoFingerGestureDelegate *)objc_loadWeakRetained((id *)&self->_turntableDelegate);
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
