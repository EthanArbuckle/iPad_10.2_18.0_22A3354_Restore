@implementation PKRulerGestureRecognizer

- (PKRulerGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  PKRulerGestureRecognizer *v4;
  PKRulerGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKRulerGestureRecognizer;
  v4 = -[PKFreeTransformGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PKFreeTransformGestureRecognizer setStartThreshold:](v4, "setStartThreshold:", 1.79769313e308);
    -[PKRulerGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &unk_1E77ECEB0);
  }
  return v5;
}

- (CGAffineTransform)freeTransform
{
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  if (LOBYTE(self[9].a))
  {
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v4;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKRulerGestureRecognizer;
    return (CGAffineTransform *)-[CGAffineTransform freeTransform](&v5, sel_freeTransform);
  }
  return self;
}

- (CGAffineTransform)unscaledFreeTransform
{
  uint64_t v3;
  __int128 v4;
  objc_super v5;

  if (LOBYTE(self[9].a))
  {
    v3 = MEMORY[0x1E0C9BAA8];
    v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v4;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKRulerGestureRecognizer;
    return (CGAffineTransform *)-[CGAffineTransform unscaledFreeTransform](&v5, sel_unscaledFreeTransform);
  }
  return self;
}

- (CGAffineTransform)rulerTransform
{
  void *v5;
  uint64_t v6;
  CGAffineTransform *result;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  uint64_t v25;
  __int128 v26;
  CGAffineTransform v27;
  CGAffineTransform t1;

  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 2)
  {
    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerGestureRecognizer view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "locationInView:", v11);
    v13 = v12;
    v15 = v14;

    -[PKFreeTransformGestureRecognizer touches](self, "touches");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKRulerGestureRecognizer view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "superview");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "locationInView:", v19);
    v21 = v20;
    v23 = v22;

    v24 = atan2(v15 - v23, v13 - v21);
    *(_OWORD *)&retstr->a = 0u;
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tx = 0u;
    CGAffineTransformMakeRotation(&t1, v24);
    CGAffineTransformMakeTranslation(&v27, (v13 + v21) * 0.5, (v15 + v23) * 0.5);
    return CGAffineTransformConcat(retstr, &t1, &v27);
  }
  else
  {
    v25 = MEMORY[0x1E0C9BAA8];
    v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v26;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v25 + 32);
  }
  return result;
}

- (void)resetAndAccumulateTransform
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = objc_opt_class();
  -[PKRulerGestureRecognizer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PKDynamicCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PKRulerController resetRulerTransform]((uint64_t)v5);
    -[PKFreeTransformGestureRecognizer resetStartingTouches](self, "resetStartingTouches");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PKRulerGestureRecognizer;
    -[PKFreeTransformGestureRecognizer resetAndAccumulateTransform](&v6, sel_resetAndAccumulateTransform);
  }

}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKRulerGestureRecognizer;
  -[PKFreeTransformGestureRecognizer reset](&v3, sel_reset);
  -[PKRulerGestureRecognizer stopTimer](self, "stopTimer");
  self->_initialSnap = 1;
}

- (void)start
{
  -[PKRulerGestureRecognizer stopTimer](self, "stopTimer");
  if (-[PKRulerGestureRecognizer state](self, "state") != 1)
    -[PKRulerGestureRecognizer setState:](self, "setState:", 1);
}

- (void)stopTimer
{
  NSTimer *startTimer;

  -[NSTimer invalidate](self->_startTimer, "invalidate");
  startTimer = self->_startTimer;
  self->_startTimer = 0;

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  double v7;
  void *v8;
  NSTimer *v9;
  NSTimer *startTimer;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKRulerGestureRecognizer;
  -[PKFreeTransformGestureRecognizer touchesBegan:withEvent:rejectExcessTouches:](&v11, sel_touchesBegan_withEvent_rejectExcessTouches_, a3, a4, 0);
  -[PKFreeTransformGestureRecognizer touches](self, "touches");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 == 2)
  {
    -[PKRulerGestureRecognizer startDelay](self, "startDelay");
    if (v7 <= 0.0)
    {
      -[PKRulerGestureRecognizer start](self, "start");
    }
    else if (!self->_startTimer)
    {
      v8 = (void *)MEMORY[0x1E0C99E88];
      -[PKRulerGestureRecognizer startDelay](self, "startDelay");
      objc_msgSend(v8, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_start, 0, 0);
      v9 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      startTimer = self->_startTimer;
      self->_startTimer = v9;

    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKRulerGestureRecognizer;
  -[PKFreeTransformGestureRecognizer touchesMoved:withEvent:](&v5, sel_touchesMoved_withEvent_, a3, a4);
  if (self->_initialSnap)
  {
    -[PKRulerGestureRecognizer startSnapThreshold](self, "startSnapThreshold");
    if (-[PKFreeTransformGestureRecognizer touchesMovedPastThreshold:](self, "touchesMovedPastThreshold:"))
    {
      self->_initialSnap = 0;
      -[PKFreeTransformGestureRecognizer resetStartingTouches](self, "resetStartingTouches");
    }
  }
  if (-[PKRulerGestureRecognizer state](self, "state"))
    -[PKRulerGestureRecognizer stopTimer](self, "stopTimer");
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKRulerGestureRecognizer;
  -[PKFreeTransformGestureRecognizer touchesEnded:withEvent:](&v5, sel_touchesEnded_withEvent_, a3, a4);
  -[PKRulerGestureRecognizer stopTimer](self, "stopTimer");
}

- (double)startDelay
{
  return self->_startDelay;
}

- (void)setStartDelay:(double)a3
{
  self->_startDelay = a3;
}

- (double)startSnapThreshold
{
  return self->_startSnapThreshold;
}

- (void)setStartSnapThreshold:(double)a3
{
  self->_startSnapThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startTimer, 0);
}

@end
