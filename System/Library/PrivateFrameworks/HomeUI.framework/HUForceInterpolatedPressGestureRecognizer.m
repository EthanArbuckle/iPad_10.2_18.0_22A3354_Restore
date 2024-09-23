@implementation HUForceInterpolatedPressGestureRecognizer

- (HUForceInterpolatedPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  HUForceInterpolatedPressGestureRecognizer *v4;
  uint64_t v5;
  NSMutableSet *hu_activeTouches;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  v4 = -[HUForceInterpolatedPressGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    v5 = objc_opt_new();
    hu_activeTouches = v4->_hu_activeTouches;
    v4->_hu_activeTouches = (NSMutableSet *)v5;

    -[HUForceInterpolatedPressGestureRecognizer _resetForceSamples](v4, "_resetForceSamples");
  }
  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    -[HUForceInterpolatedPressGestureRecognizer setTouchStartTime:](self, "setTouchStartTime:", CACurrentMediaTime());
  -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v7);

  -[HUForceInterpolatedPressGestureRecognizer _logForceMultiplierSample](self, "_logForceMultiplierSample");
  v11.receiver = self;
  v11.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  -[HUForceInterpolatedPressGestureRecognizer touchesBegan:withEvent:](&v11, sel_touchesBegan_withEvent_, v7, v6);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a4;
  v7 = a3;
  -[HUForceInterpolatedPressGestureRecognizer _logForceMultiplierSample](self, "_logForceMultiplierSample");
  v8.receiver = self;
  v8.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  -[HUForceInterpolatedPressGestureRecognizer touchesMoved:withEvent:](&v8, sel_touchesMoved_withEvent_, v7, v6);

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v7);

  -[HUForceInterpolatedPressGestureRecognizer _logForceMultiplierSample](self, "_logForceMultiplierSample");
  v9.receiver = self;
  v9.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  -[HUForceInterpolatedPressGestureRecognizer touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v7, v6);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minusSet:", v7);

  -[HUForceInterpolatedPressGestureRecognizer _logForceMultiplierSample](self, "_logForceMultiplierSample");
  v9.receiver = self;
  v9.super_class = (Class)HUForceInterpolatedPressGestureRecognizer;
  -[HUForceInterpolatedPressGestureRecognizer touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v7, v6);

}

- (double)_forceMultiplierIncludingCurrentSample
{
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

  -[HUForceInterpolatedPressGestureRecognizer touchStartTime](self, "touchStartTime");
  v3 = 1.0;
  if (v4 != 0.0)
  {
    -[HUForceInterpolatedPressGestureRecognizer currentSampleTimestamp](self, "currentSampleTimestamp");
    if (v5 != 0.0)
    {
      v6 = CACurrentMediaTime();
      -[HUForceInterpolatedPressGestureRecognizer currentSampleTimestamp](self, "currentSampleTimestamp");
      v8 = v6 - v7;
      -[HUForceInterpolatedPressGestureRecognizer touchStartTime](self, "touchStartTime");
      v10 = v6 - v9;
      -[HUForceInterpolatedPressGestureRecognizer currentSampleForceMultiplier](self, "currentSampleForceMultiplier");
      v12 = v8 * v11;
      -[HUForceInterpolatedPressGestureRecognizer overallForceMultiplierExcludingCurrentSample](self, "overallForceMultiplierExcludingCurrentSample");
      return (v12 + v13 * (v10 - v8)) / v10;
    }
  }
  return v3;
}

- (void)_resetForceSamples
{
  -[HUForceInterpolatedPressGestureRecognizer setOverallForceMultiplierExcludingCurrentSample:](self, "setOverallForceMultiplierExcludingCurrentSample:", 1.0);
  -[HUForceInterpolatedPressGestureRecognizer setCurrentSampleForceMultiplier:](self, "setCurrentSampleForceMultiplier:", 1.0);
  -[HUForceInterpolatedPressGestureRecognizer setTouchStartTime:](self, "setTouchStartTime:", 0.0);
  -[HUForceInterpolatedPressGestureRecognizer setCurrentSampleTimestamp:](self, "setCurrentSampleTimestamp:", 0.0);
}

- (void)_logForceMultiplierSample
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  double v14;
  void *v15;
  double v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[HUForceInterpolatedPressGestureRecognizer _forceMultiplierIncludingCurrentSample](self, "_forceMultiplierIncludingCurrentSample");
    -[HUForceInterpolatedPressGestureRecognizer setOverallForceMultiplierExcludingCurrentSample:](self, "setOverallForceMultiplierExcludingCurrentSample:");
    -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_filter:", &__block_literal_global_33);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSet:", v6);

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      v12 = 0.0;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "force");
          v12 = v12 + v14;
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }
    else
    {
      v12 = 0.0;
    }

    -[HUForceInterpolatedPressGestureRecognizer hu_activeTouches](self, "hu_activeTouches");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12 / (double)(unint64_t)objc_msgSend(v15, "count");

    -[HUForceInterpolatedPressGestureRecognizer setCurrentSampleForceMultiplier:](self, "setCurrentSampleForceMultiplier:", v16 / 6.667 * 3.0 + 1.0);
    -[HUForceInterpolatedPressGestureRecognizer setCurrentSampleTimestamp:](self, "setCurrentSampleTimestamp:", CACurrentMediaTime());
  }
  else
  {
    -[HUForceInterpolatedPressGestureRecognizer _resetForceSamples](self, "_resetForceSamples");
  }
}

BOOL __70__HUForceInterpolatedPressGestureRecognizer__logForceMultiplierSample__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "phase") != 3 && objc_msgSend(v2, "phase") != 4;

  return v3;
}

- (NSMutableSet)hu_activeTouches
{
  return self->_hu_activeTouches;
}

- (double)currentSampleForceMultiplier
{
  return self->_currentSampleForceMultiplier;
}

- (void)setCurrentSampleForceMultiplier:(double)a3
{
  self->_currentSampleForceMultiplier = a3;
}

- (double)currentSampleTimestamp
{
  return self->_currentSampleTimestamp;
}

- (void)setCurrentSampleTimestamp:(double)a3
{
  self->_currentSampleTimestamp = a3;
}

- (double)overallForceMultiplierExcludingCurrentSample
{
  return self->_overallForceMultiplierExcludingCurrentSample;
}

- (void)setOverallForceMultiplierExcludingCurrentSample:(double)a3
{
  self->_overallForceMultiplierExcludingCurrentSample = a3;
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
  objc_storeStrong((id *)&self->_hu_activeTouches, 0);
}

@end
