@implementation ARUIUIntAnimation

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)animationWithDuration:(double)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 timingFunction:(id)a6 applier:(id)a7
{
  id v11;
  id v12;
  ARUIUIntAnimation *v13;

  v11 = a7;
  v12 = a6;
  v13 = -[ARUIUIntAnimation initWithDuration:startValue:endValue:timingFunction:applier:]([ARUIUIntAnimation alloc], "initWithDuration:startValue:endValue:timingFunction:applier:", a4, a5, v12, v11, a3);

  return v13;
}

- (ARUIUIntAnimation)initWithDuration:(double)a3 startValue:(unint64_t)a4 endValue:(unint64_t)a5 timingFunction:(id)a6 applier:(id)a7
{
  id v13;
  id v14;
  ARUIUIntAnimation *v15;
  ARUIUIntAnimation *v16;
  uint64_t v17;
  id applier;
  objc_super v20;

  v13 = a6;
  v14 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ARUIUIntAnimation;
  v15 = -[ARUIUIntAnimation init](&v20, sel_init);
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

- (void)update:(double)a3
{
  float v5;
  float v6;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call update on a ARUIUIntAnimation that has already completed"));
  v5 = self->_percent + a3 / self->_duration;
  self->_percent = ARUISaturate(v5);
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:");
  self->_currentValue = (unint64_t)ARUIMix((float)self->_startValue, (float)self->_endValue, v6);
  (*((void (**)(double))self->_applier + 2))(a3);
}

- (BOOL)isAnimating
{
  return self->_currentValue != self->_endValue;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should call -[ARUIUIntAnimation completeAnimation] before deallocating"));
  v3.receiver = self;
  v3.super_class = (Class)ARUIUIntAnimation;
  -[ARUIUIntAnimation dealloc](&v3, sel_dealloc);
}

- (void)completeAnimation
{
  id WeakRetained;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call completeAnimation on a ARUIUIntAnimation that has already completed"));
  (*((void (**)(double))self->_applier + 2))(0.0);
  self->_completed = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "animationDidComplete:", self);

}

- (ARUIRingGroupAnimationDelegate)delegate
{
  return (ARUIRingGroupAnimationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)startValue
{
  return self->_startValue;
}

- (unint64_t)currentValue
{
  return self->_currentValue;
}

- (unint64_t)endValue
{
  return self->_endValue;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_applier, 0);
}

@end
