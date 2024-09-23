@implementation ASVUnifiedGestureRecognizer

- (ASVUnifiedGestureRecognizer)initWithDelegate:(id)a3 feedbackGenerator:(id)a4
{
  id v6;
  id v7;
  ASVUnifiedGestureRecognizer *v8;
  ASVUnifiedGestureRecognizer *v9;
  ASVGesture *currentGesture;
  NSTimer *singleTapTimer;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASVUnifiedGestureRecognizer;
  v8 = -[ASVUnifiedGestureRecognizer init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, 0);
    objc_storeWeak((id *)&v9->_delegate, v6);
    objc_storeStrong((id *)&v9->_feedbackGenerator, a4);
    currentGesture = v9->_currentGesture;
    v9->_currentGesture = 0;

    v9->_lastTapWasOnAsset = 0;
    v9->_lastTapTime = 0.0;
    *(_QWORD *)v9->_lastTapLocation = 0;
    singleTapTimer = v9->_singleTapTimer;
    v9->_lastFireFeedbackTime = 0.0;
    v9->_singleTapTimer = 0;

    v9->_enabledGestureTypes = 7;
  }

  return v9;
}

- (BOOL)isActive
{
  void *v2;
  BOOL v3;

  -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)update
{
  void *v3;
  id v4;

  -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateGesture");

  }
}

- (BOOL)isEnabled
{
  return -[ASVUnifiedGestureRecognizer enabledGestureTypes](self, "enabledGestureTypes") != 0;
}

- (void)setEnabledGestureTypes:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVUnifiedGestureRecognizer processTouches:phase:](self, "processTouches:phase:", v6, 3);

  }
  self->_enabledGestureTypes = a3;
}

- (BOOL)gestureTypeIsEnabled:(unint64_t)a3
{
  return (a3 & ~-[ASVUnifiedGestureRecognizer enabledGestureTypes](self, "enabledGestureTypes")) == 0;
}

- (BOOL)generatesTaps
{
  return -[ASVUnifiedGestureRecognizer gestureTypeIsEnabled:](self, "gestureTypeIsEnabled:", 1)
      || -[ASVUnifiedGestureRecognizer gestureTypeIsEnabled:](self, "gestureTypeIsEnabled:", 2);
}

- (BOOL)generatesTransforms
{
  return -[ASVUnifiedGestureRecognizer gestureTypeIsEnabled:](self, "gestureTypeIsEnabled:", 4);
}

- (BOOL)singleFingerGesturesEnabled
{
  return -[ASVUnifiedGestureRecognizer generatesTaps](self, "generatesTaps")
      || -[ASVUnifiedGestureRecognizer generatesTransforms](self, "generatesTransforms");
}

- (id)singleFingerGestureForTouch:(id)a3 dataSource:(id)a4 enabledGestureTypes:(unint64_t)a5
{
  return 0;
}

- (id)twoFingerGestureForFirstTouch:(id)a3 secondTouch:(id)a4 dataSource:(id)a5
{
  return 0;
}

- (void)startGestureFromTouches:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_msgSend(v17, "mutableCopy");
  -[ASVUnifiedGestureRecognizer setCurrentTouches:](self, "setCurrentTouches:", v4);

  if (objc_msgSend(v17, "count") == 1
    && -[ASVUnifiedGestureRecognizer singleFingerGesturesEnabled](self, "singleFingerGesturesEnabled"))
  {
    -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVUnifiedGestureRecognizer singleFingerGestureForTouch:dataSource:enabledGestureTypes:](self, "singleFingerGestureForTouch:dataSource:enabledGestureTypes:", v6, v7, -[ASVUnifiedGestureRecognizer enabledGestureTypes](self, "enabledGestureTypes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVUnifiedGestureRecognizer setCurrentGesture:](self, "setCurrentGesture:", v8);

  }
  else if (objc_msgSend(v17, "count") == 2
         && -[ASVUnifiedGestureRecognizer twoFingerGesturesEnabled](self, "twoFingerGesturesEnabled"))
  {
    -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVUnifiedGestureRecognizer twoFingerGestureForFirstTouch:secondTouch:dataSource:](self, "twoFingerGestureForFirstTouch:secondTouch:dataSource:", v11, v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVUnifiedGestureRecognizer setCurrentGesture:](self, "setCurrentGesture:", v14);

  }
  else
  {
    -[ASVUnifiedGestureRecognizer setCurrentGesture:](self, "setCurrentGesture:", 0);
  }
  -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[ASVUnifiedGestureRecognizer feedbackGenerator](self, "feedbackGenerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "prepare");

  }
}

- (void)updateGestureFromTouches:(id)a3 phase:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  if (objc_msgSend(v26, "count"))
  {
    -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

    if ((unint64_t)a4 > 1)
    {
      if (a4 == 3)
      {
        -[ASVUnifiedGestureRecognizer setCurrentGesture:](self, "setCurrentGesture:", 0);
        -[ASVUnifiedGestureRecognizer setCurrentTouches:](self, "setCurrentTouches:", 0);
        goto LABEL_25;
      }
      if (a4 != 2)
      {
LABEL_8:
        -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
LABEL_25:

          goto LABEL_26;
        }
        -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count") != 1)
          {

LABEL_19:
            -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (v22 < 2)
            {
              -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "finishGesture");

            }
            -[ASVUnifiedGestureRecognizer setCurrentGesture:](self, "setCurrentGesture:", 0);
            -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[ASVUnifiedGestureRecognizer startGestureFromTouches:](self, "startGestureFromTouches:", v24);

            goto LABEL_25;
          }
          -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToSet:", v7);

          if (!v14)
            goto LABEL_19;
          goto LABEL_16;
        }
        -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v16 = objc_opt_isKindOfClass();

        if ((v16 & 1) != 0)
        {
          -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v17, "count") == 2)
          {
            -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToSet:", v7);

            if (v19)
            {
LABEL_16:
              -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "updateGesture");

              goto LABEL_25;
            }
          }
          else
          {

          }
          -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "finishGesture");

        }
        -[ASVUnifiedGestureRecognizer setCurrentGesture:](self, "setCurrentGesture:", 0);
        goto LABEL_25;
      }
      -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "minusSet:", v26);
    }
    else
    {
      -[ASVUnifiedGestureRecognizer currentTouches](self, "currentTouches");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "unionSet:", v26);
    }

    goto LABEL_8;
  }
LABEL_26:

}

- (BOOL)isDecelerating
{
  return 0;
}

- (void)processTouches:(id)a3 phase:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  _BOOL4 v8;
  ASVUnifiedGestureRecognizer *v9;
  id v10;
  int64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  -[ASVUnifiedGestureRecognizer dataSource](self, "dataSource");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = -[ASVUnifiedGestureRecognizer isEnabled](self, "isEnabled");

    if (v8)
    {
      if ((unint64_t)(a4 - 1) >= 3)
      {
        if (a4)
          goto LABEL_10;
        -[ASVUnifiedGestureRecognizer currentGesture](self, "currentGesture");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = self;
        if (!v12)
        {
          -[ASVUnifiedGestureRecognizer startGestureFromTouches:](self, "startGestureFromTouches:", v13);
          goto LABEL_10;
        }
        v10 = v13;
        v11 = 0;
      }
      else
      {
        v9 = self;
        v10 = v13;
        v11 = a4;
      }
      -[ASVUnifiedGestureRecognizer updateGestureFromTouches:phase:](v9, "updateGestureFromTouches:phase:", v10, v11);
    }
  }
LABEL_10:

}

- (float)minimumObjectScale
{
  return 0.0;
}

- (float)maximumObjectScale
{
  return 10000.0;
}

- (void)gesture:(id)a3 singleTappedAtScreenPoint:(BOOL)a4 onAsset:
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  id v8;
  double v9;
  double v10;
  double v11;
  float v12;
  float v13;
  float32x2_t v14;
  float32x2_t v15;
  float v16;
  double v17;
  float32x2_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29[2];
  BOOL v30;
  id location;

  v5 = a4;
  v6 = v4;
  v8 = a3;
  if (-[ASVUnifiedGestureRecognizer gestureTypeIsEnabled:](self, "gestureTypeIsEnabled:", 2))
  {
    v9 = CACurrentMediaTime();
    -[ASVUnifiedGestureRecognizer lastTapTime](self, "lastTapTime");
    v11 = v9 - v10;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTapDoubleTimeThreshold"));
    v13 = v12;
    -[ASVUnifiedGestureRecognizer lastTapLocation](self, "lastTapLocation");
    v15 = v14;
    +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingTapDoubleMovementThreshold"));
    v17 = v13;
    if (v11 < v17
      && (v18 = vsub_f32((float32x2_t)v6, v15), sqrtf(vaddv_f32(vmul_f32(v18, v18))) < v16)
      && -[ASVUnifiedGestureRecognizer lastTapWasOnAsset](self, "lastTapWasOnAsset") == v5)
    {
      -[ASVUnifiedGestureRecognizer singleTapTimer](self, "singleTapTimer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[ASVUnifiedGestureRecognizer singleTapTimer](self, "singleTapTimer");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "invalidate");

      }
      -[ASVUnifiedGestureRecognizer delegate](self, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "unifiedGestureRecognizer:doubleTappedAtScreenPoint:onAsset:", self, v5, *(double *)&v6);

      -[ASVUnifiedGestureRecognizer setLastTapTime:](self, "setLastTapTime:", 0.0);
    }
    else
    {
      objc_initWeak(&location, self);
      v19 = (void *)MEMORY[0x1E0C99E88];
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __73__ASVUnifiedGestureRecognizer_gesture_singleTappedAtScreenPoint_onAsset___block_invoke;
      v28 = &unk_1E9F0C3B0;
      objc_copyWeak(v29, &location);
      v29[1] = v6;
      v30 = v5;
      objc_msgSend(v19, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v25, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVUnifiedGestureRecognizer setSingleTapTimer:](self, "setSingleTapTimer:", v20, v25, v26, v27, v28);

      -[ASVUnifiedGestureRecognizer setLastTapTime:](self, "setLastTapTime:", v9);
      objc_destroyWeak(v29);
      objc_destroyWeak(&location);
    }
    -[ASVUnifiedGestureRecognizer setLastTapLocation:](self, "setLastTapLocation:", *(double *)&v6);
    -[ASVUnifiedGestureRecognizer setLastTapWasOnAsset:](self, "setLastTapWasOnAsset:", v5);
  }
  else
  {
    -[ASVUnifiedGestureRecognizer delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unifiedGestureRecognizer:singleTappedAtScreenPoint:onAsset:", self, v5, *(double *)&v6);

  }
}

void __73__ASVUnifiedGestureRecognizer_gesture_singleTappedAtScreenPoint_onAsset___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained(v2);
    objc_msgSend(v6, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "unifiedGestureRecognizer:singleTappedAtScreenPoint:onAsset:", v5, *(unsigned __int8 *)(a1 + 48), *(double *)(a1 + 40));

  }
}

- (void)gestureBeganRotation:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ASVUnifiedGestureRecognizer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASVUnifiedGestureRecognizer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unifiedGestureRecognizerBeganRotation:", self);

  }
}

- (void)gesture:(id)a3 rotatedAssetByDeltaYaw:(float)a4
{
  double v6;
  id v7;

  -[ASVUnifiedGestureRecognizer delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a4;
  objc_msgSend(v7, "unifiedGestureRecognizer:rotatedAssetByDeltaYaw:", self, v6);

}

- (void)gestureEndedRotation:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[ASVUnifiedGestureRecognizer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[ASVUnifiedGestureRecognizer delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unifiedGestureRecognizerEndedRotation:", self);

  }
}

- (void)gestureBeganScaling:(id)a3
{
  id v4;

  -[ASVUnifiedGestureRecognizer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedGestureRecognizerBeganScaling:", self);

}

- (void)gesture:(id)a3 scaledAssetToScale:(float)a4
{
  double v6;
  id v7;

  -[ASVUnifiedGestureRecognizer delegate](self, "delegate", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a4;
  -[ASVUnifiedGestureRecognizer clampedScaleForScale:](self, "clampedScaleForScale:", v6);
  objc_msgSend(v7, "unifiedGestureRecognizer:scaledAssetToScale:", self);

}

- (void)gestureEndedScaling:(id)a3
{
  id v4;

  -[ASVUnifiedGestureRecognizer delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedGestureRecognizerEndedScaling:", self);

}

- (void)gestureDidSnapToScale:(id)a3
{
  double v4;
  double v5;
  double v6;
  float v7;
  void *v8;
  void *v9;

  v4 = CACurrentMediaTime();
  -[ASVUnifiedGestureRecognizer lastFireFeedbackTime](self, "lastFireFeedbackTime");
  v6 = v4 - v5;
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingScaleSnapFeedbackTimeThreshold"));
  if (v6 >= v7)
  {
    -[ASVUnifiedGestureRecognizer feedbackGenerator](self, "feedbackGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapToScaleFeedbackGenerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fire");

    -[ASVUnifiedGestureRecognizer setLastFireFeedbackTime:](self, "setLastFireFeedbackTime:", v4);
  }
}

- (void)gestureStartScaleAnimationFrom:(float)a3 to:(float)a4
{
  self->_isScaleAnimating = 1;
  self->_animateScaleStart = a3;
  self->_animateScaleEnd = a4;
  self->_startScaleAnimationTime = CACurrentMediaTime();
}

- (void)gestureStopScaleAnimation
{
  self->_isScaleAnimating = 0;
}

- (float)animatedScaleValue
{
  double v3;
  double v4;

  v3 = CACurrentMediaTime() - self->_startScaleAnimationTime;
  if (v3 >= 0.1)
  {
    self->_isScaleAnimating = 0;
    return self->_animateScaleEnd;
  }
  else
  {
    v4 = v3 / 0.1 * (v3 / 0.1) * (v3 / 0.1 * -2.0 + 3.0);
    return v4 * self->_animateScaleEnd + self->_animateScaleStart * (1.0 - v4);
  }
}

- (void)gestureDidSnapAwayFromScale:(id)a3
{
  double v4;
  double v5;
  double v6;
  float v7;
  void *v8;
  void *v9;

  v4 = CACurrentMediaTime();
  -[ASVUnifiedGestureRecognizer lastFireFeedbackTime](self, "lastFireFeedbackTime");
  v6 = v4 - v5;
  +[ASVSettings floatForKey:](ASVSettings, "floatForKey:", CFSTR("ASVSettingScaleSnapFeedbackTimeThreshold"));
  if (v6 >= v7)
  {
    -[ASVUnifiedGestureRecognizer feedbackGenerator](self, "feedbackGenerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "snapAwayFromScaleFeedbackGenerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fire");

    -[ASVUnifiedGestureRecognizer setLastFireFeedbackTime:](self, "setLastFireFeedbackTime:", v4);
  }
}

- (ASVGestureDataSource)dataSource
{
  return (ASVGestureDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (ASVUnifiedGestureRecognizerDelegate)delegate
{
  return (ASVUnifiedGestureRecognizerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ASVGestureFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (void)setFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackGenerator, a3);
}

- (unint64_t)enabledGestureTypes
{
  return self->_enabledGestureTypes;
}

- (BOOL)allowObjectScaling
{
  return self->_allowObjectScaling;
}

- (void)setAllowObjectScaling:(BOOL)a3
{
  self->_allowObjectScaling = a3;
}

- (float)currentObjectScale
{
  return self->_currentObjectScale;
}

- (void)setCurrentObjectScale:(float)a3
{
  self->_currentObjectScale = a3;
}

- (BOOL)isScaleAnimating
{
  return self->_isScaleAnimating;
}

- (void)setIsScaleAnimating:(BOOL)a3
{
  self->_isScaleAnimating = a3;
}

- (double)lastTapTime
{
  return self->_lastTapTime;
}

- (void)setLastTapTime:(double)a3
{
  self->_lastTapTime = a3;
}

- (double)lastTapLocation
{
  return *(double *)(a1 + 64);
}

- (void)setLastTapLocation:(ASVUnifiedGestureRecognizer *)self
{
  uint64_t v2;

  *(_QWORD *)self->_lastTapLocation = v2;
}

- (BOOL)lastTapWasOnAsset
{
  return self->_lastTapWasOnAsset;
}

- (void)setLastTapWasOnAsset:(BOOL)a3
{
  self->_lastTapWasOnAsset = a3;
}

- (double)lastFireFeedbackTime
{
  return self->_lastFireFeedbackTime;
}

- (void)setLastFireFeedbackTime:(double)a3
{
  self->_lastFireFeedbackTime = a3;
}

- (NSTimer)singleTapTimer
{
  return self->_singleTapTimer;
}

- (void)setSingleTapTimer:(id)a3
{
  objc_storeStrong((id *)&self->_singleTapTimer, a3);
}

- (double)startScaleAnimationTime
{
  return self->_startScaleAnimationTime;
}

- (void)setStartScaleAnimationTime:(double)a3
{
  self->_startScaleAnimationTime = a3;
}

- (float)animateScaleStart
{
  return self->_animateScaleStart;
}

- (void)setAnimateScaleStart:(float)a3
{
  self->_animateScaleStart = a3;
}

- (float)animateScaleEnd
{
  return self->_animateScaleEnd;
}

- (void)setAnimateScaleEnd:(float)a3
{
  self->_animateScaleEnd = a3;
}

- (ASVGesture)currentGesture
{
  return self->_currentGesture;
}

- (void)setCurrentGesture:(id)a3
{
  objc_storeStrong((id *)&self->_currentGesture, a3);
}

- (NSMutableSet)currentTouches
{
  return self->_currentTouches;
}

- (void)setCurrentTouches:(id)a3
{
  objc_storeStrong((id *)&self->_currentTouches, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTouches, 0);
  objc_storeStrong((id *)&self->_currentGesture, 0);
  objc_storeStrong((id *)&self->_singleTapTimer, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end
