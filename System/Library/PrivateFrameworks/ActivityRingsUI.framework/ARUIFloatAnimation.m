@implementation ARUIFloatAnimation

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)animationWithDuration:(double)a3 startValue:(float)a4 endValue:(float)a5 timingFunction:(id)a6 applier:(id)a7
{
  id v11;
  id v12;
  ARUIFloatAnimation *v13;
  double v14;
  double v15;
  ARUIFloatAnimation *v16;

  v11 = a7;
  v12 = a6;
  v13 = [ARUIFloatAnimation alloc];
  *(float *)&v14 = a4;
  *(float *)&v15 = a5;
  v16 = -[ARUIFloatAnimation initWithDuration:startValue:endValue:timingFunction:applier:](v13, "initWithDuration:startValue:endValue:timingFunction:applier:", v12, v11, a3, v14, v15);

  return v16;
}

- (ARUIFloatAnimation)initWithDuration:(double)a3 startValue:(float)a4 endValue:(float)a5 timingFunction:(id)a6 applier:(id)a7
{
  id v13;
  id v14;
  ARUIFloatAnimation *v15;
  ARUIFloatAnimation *v16;
  uint64_t v17;
  id applier;
  objc_super v20;

  v13 = a6;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ARUIFloatAnimation;
  v15 = -[ARUIFloatAnimation init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_completed = 0;
    v15->_duration = a3;
    v15->_percent = 0.0;
    v15->_currentValue = a4;
    v15->_endValue = a5;
    v15->_startValue = a4;
    objc_storeStrong((id *)&v15->_timingFunction, a6);
    v17 = MEMORY[0x2199A6364](v14);
    applier = v16->_applier;
    v16->_applier = (id)v17;

  }
  return v16;
}

- (void)completeAnimation
{
  id WeakRetained;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call completeAnimation on a ARUIFloatAnimation that has already completed"));
  (*((void (**)(float, double))self->_applier + 2))(self->_endValue, 0.0);
  self->_completed = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "animationDidComplete:", self);

}

- (void)update:(double)a3
{
  float v5;
  float v6;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call update on a ARUIFloatAnimation that has already completed"));
  v5 = self->_percent + a3 / self->_duration;
  self->_percent = ARUISaturate(v5);
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:");
  self->_currentValue = ARUIMix(self->_startValue, self->_endValue, v6);
  (*((void (**)(void))self->_applier + 2))();
}

- (BOOL)isAnimating
{
  return !ARUIFloatEqual(self->_currentValue, self->_endValue);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_applier, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should call -[ARUIFloatAnimation completeAnimation] before deallocating"));
  v3.receiver = self;
  v3.super_class = (Class)ARUIFloatAnimation;
  -[ARUIFloatAnimation dealloc](&v3, sel_dealloc);
}

- (ARUIRingGroupAnimationDelegate)delegate
{
  return (ARUIRingGroupAnimationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)duration
{
  return self->_duration;
}

- (float)startValue
{
  return self->_startValue;
}

- (float)currentValue
{
  return self->_currentValue;
}

- (float)endValue
{
  return self->_endValue;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

@end
