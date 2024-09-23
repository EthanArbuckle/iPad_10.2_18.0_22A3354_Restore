@implementation ASVSingleFingerGesture

- (ASVSingleFingerGesture)initWithTouch:(id)a3 dataSource:(id)a4 delegate:(id)a5 enabledGestureTypes:(unint64_t)a6
{
  id v11;
  id v12;
  ASVSingleFingerGesture *v13;
  ASVSingleFingerGesture *v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v11 = a3;
  v12 = a5;
  v18.receiver = self;
  v18.super_class = (Class)ASVSingleFingerGesture;
  v13 = -[ASVGesture initWithDataSource:](&v18, sel_initWithDataSource_, a4);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_delegate, v12);
    v14->_enabledGestureTypes = a6;
    v14->_panThresholdPassed = 0;
    v14->_touchStartTime = CACurrentMediaTime();
    objc_storeStrong((id *)&v14->_touch, a3);
    -[ASVTouch location](v14->_touch, "location");
    *(_QWORD *)&v14->_initialTouchLocation[7] = v15;
    *(_QWORD *)&v14->_latestTouchLocation[7] = v15;
    -[ASVGesture dataSource](v14, "dataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVGesture setFirstTouchWasOnAsset:](v14, "setFirstTouchWasOnAsset:", objc_msgSend(v16, "screenPointIsOnAsset:", *(double *)&v14->_initialTouchLocation[7]));

  }
  return v14;
}

- (void)updateGesture
{
  id v3;

  -[ASVSingleFingerGesture touch](self, "touch");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  -[ASVSingleFingerGesture setLatestTouchLocation:](self, "setLatestTouchLocation:");

}

- (BOOL)gestureTypeIsEnabled:(unint64_t)a3
{
  return (a3 & ~-[ASVSingleFingerGesture enabledGestureTypes](self, "enabledGestureTypes")) == 0;
}

- (BOOL)generatesTaps
{
  return -[ASVSingleFingerGesture gestureTypeIsEnabled:](self, "gestureTypeIsEnabled:", 1)
      || -[ASVSingleFingerGesture gestureTypeIsEnabled:](self, "gestureTypeIsEnabled:", 2);
}

- (BOOL)generatesTransforms
{
  return -[ASVSingleFingerGesture gestureTypeIsEnabled:](self, "gestureTypeIsEnabled:", 4);
}

- (void)finishGesture
{
  float v3;
  double v4;
  double v5;
  double v6;
  float32x2_t v7;
  float32x2_t v8;
  float32x2_t v9;
  float32x2_t v10;
  float32_t v11;
  void *v12;
  int v13;
  void *v14;
  ASVSingleFingerGesture *v15;
  uint64_t v16;
  id v17;

  if (-[ASVSingleFingerGesture generatesTaps](self, "generatesTaps"))
  {
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTapTimeThreshold"));
    v4 = v3;
    v5 = CACurrentMediaTime();
    -[ASVSingleFingerGesture touchStartTime](self, "touchStartTime");
    if (v5 - v6 < v4)
    {
      -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
      v8 = v7;
      -[ASVSingleFingerGesture initialTouchLocation](self, "initialTouchLocation");
      v10 = vsub_f32(v8, v9);
      v8.f32[0] = sqrtf(vaddv_f32(vmul_f32(v10, v10)));
      +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTapMovementThreshold"));
      if (v8.f32[0] < v11)
      {
        -[ASVGesture dataSource](self, "dataSource");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
        v13 = objc_msgSend(v12, "screenPointIsOnAsset:");

        if (-[ASVGesture firstTouchWasOnAsset](self, "firstTouchWasOnAsset") && v13)
        {
          -[ASVSingleFingerGesture delegate](self, "delegate");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
          v14 = v17;
          v15 = self;
          v16 = 1;
LABEL_10:
          objc_msgSend(v14, "gesture:singleTappedAtScreenPoint:onAsset:", v15, v16);

          return;
        }
        if (((-[ASVGesture firstTouchWasOnAsset](self, "firstTouchWasOnAsset") | v13) & 1) == 0)
        {
          -[ASVSingleFingerGesture delegate](self, "delegate");
          v17 = (id)objc_claimAutoreleasedReturnValue();
          -[ASVSingleFingerGesture latestTouchLocation](self, "latestTouchLocation");
          v14 = v17;
          v15 = self;
          v16 = 0;
          goto LABEL_10;
        }
      }
    }
  }
}

- (BOOL)panThresholdPassed
{
  return self->_panThresholdPassed;
}

- (void)setPanThresholdPassed:(BOOL)a3
{
  self->_panThresholdPassed = a3;
}

- (double)initialTouchLocation
{
  return *(double *)(a1 + 48);
}

- (void)setInitialTouchLocation:(ASVSingleFingerGesture *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_initialTouchLocation[7] = v2;
}

- (double)latestTouchLocation
{
  return *(double *)(a1 + 56);
}

- (void)setLatestTouchLocation:(ASVSingleFingerGesture *)self
{
  uint64_t v2;

  *(_QWORD *)&self->_latestTouchLocation[7] = v2;
}

- (ASVSingleFingerGestureDelegate)delegate
{
  return (ASVSingleFingerGestureDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)enabledGestureTypes
{
  return self->_enabledGestureTypes;
}

- (ASVTouch)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
  objc_storeStrong((id *)&self->_touch, a3);
}

- (double)touchStartTime
{
  return self->_touchStartTime;
}

- (void)setTouchStartTime:(double)a3
{
  self->_touchStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touch, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
