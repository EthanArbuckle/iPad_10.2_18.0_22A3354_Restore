@implementation ARUIFloat2Animation

+ (id)animationWithDuration:(id)a1 startValue:(SEL)a2 endValue:(double)a3 timingFunction:(id)a4 applier:(id)a5
{
  double v5;
  double v6;
  double v8;
  double v9;
  id v11;
  id v12;
  ARUIFloat2Animation *v13;

  v8 = v6;
  v9 = v5;
  v11 = a5;
  v12 = a4;
  v13 = -[ARUIFloat2Animation initWithDuration:startValue:endValue:timingFunction:applier:]([ARUIFloat2Animation alloc], "initWithDuration:startValue:endValue:timingFunction:applier:", v12, v11, a3, v9, v8);

  return v13;
}

- (ARUIFloat2Animation)initWithDuration:(ARUIFloat2Animation *)self startValue:(SEL)a2 endValue:(double)a3 timingFunction:(id)a4 applier:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  id v13;
  id v14;
  ARUIFloat2Animation *v15;
  ARUIFloat2Animation *v16;
  uint64_t v17;
  id applier;
  objc_super v20;

  v9 = v6;
  v10 = v5;
  v13 = a4;
  v14 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ARUIFloat2Animation;
  v15 = -[ARUIFloat2Animation init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_completed = 0;
    v15->_percent = 0.0;
    v15->_duration = a3;
    *(_QWORD *)v15->_startValue = v10;
    *(_QWORD *)v15->_currentValue = v10;
    *(_QWORD *)v15->_endValue = v9;
    objc_storeStrong((id *)&v15->_timingFunction, a4);
    v17 = MEMORY[0x2199A6364](v14);
    applier = v16->_applier;
    v16->_applier = (id)v17;

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should call -[ARUIFloat2Animation completeAnimation] before deallocating"));
  v3.receiver = self;
  v3.super_class = (Class)ARUIFloat2Animation;
  -[ARUIFloat2Animation dealloc](&v3, sel_dealloc);
}

- (void)update:(double)a3
{
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  float v9;
  __n128 v10;
  __n128 v11;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call update on a ARUIFloat2Animation that has already completed"));
  v5 = self->_percent + a3 / self->_duration;
  self->_percent = ARUISaturate(v5);
  -[CAMediaTimingFunction _solveForInput:](self->_timingFunction, "_solveForInput:");
  v7 = v6;
  *(float *)&v8 = ARUIMix(COERCE_FLOAT(*(_QWORD *)self->_startValue), COERCE_FLOAT(*(_QWORD *)self->_endValue), v6);
  v11.n128_u64[0] = v8;
  v9 = ARUIMix(*(float *)&self->_startValue[4], *(float *)&self->_endValue[4], v7);
  v10 = v11;
  v10.n128_f32[1] = v9;
  *(_QWORD *)self->_currentValue = v10.n128_u64[0];
  (*((void (**)(__n128, double))self->_applier + 2))(v10, a3);
}

- (BOOL)isAnimating
{
  return !ARUIFloat2Equal(*(float32x2_t *)self->_currentValue, *(float32x2_t *)self->_endValue);
}

- (void)completeAnimation
{
  id WeakRetained;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call completeAnimation on a ARUIFloat2Animation that has already completed"));
  (*((void (**)(double, double))self->_applier + 2))(*(double *)self->_endValue, 0.0);
  self->_completed = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "animationDidComplete:", self);

}

- (ARUIRingGroupAnimationDelegate)delegate
{
  return (ARUIRingGroupAnimationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (double)startValue
{
  return *(double *)(a1 + 48);
}

- (double)currentValue
{
  return *(double *)(a1 + 56);
}

- (double)endValue
{
  return *(double *)(a1 + 64);
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
