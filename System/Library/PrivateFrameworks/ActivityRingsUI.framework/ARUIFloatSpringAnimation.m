@implementation ARUIFloatSpringAnimation

+ (id)animationWithTension:(double)a3 friction:(double)a4 startValue:(float)a5 endValue:(float)a6 applier:(id)a7
{
  id v11;
  ARUIFloatSpringAnimation *v12;
  double v13;
  double v14;
  ARUIFloatSpringAnimation *v15;

  v11 = a7;
  v12 = [ARUIFloatSpringAnimation alloc];
  *(float *)&v13 = a5;
  *(float *)&v14 = a6;
  v15 = -[ARUIFloatSpringAnimation initWithTension:friction:startValue:endValue:applier:](v12, "initWithTension:friction:startValue:endValue:applier:", v11, a3, a4, v13, v14);

  return v15;
}

- (ARUIFloatSpringAnimation)initWithTension:(double)a3 friction:(double)a4 startValue:(float)a5 endValue:(float)a6 applier:(id)a7
{
  id v12;
  ARUIFloatSpringAnimation *v13;
  ARUIFloatSpringAnimation *v14;
  uint64_t v15;
  id applier;
  _TtC15ActivityRingsUI15SpringAnimation *v17;
  _TtC15ActivityRingsUI15SpringAnimation *springAnimation;
  objc_super v20;

  v12 = a7;
  v20.receiver = self;
  v20.super_class = (Class)ARUIFloatSpringAnimation;
  v13 = -[ARUIFloatSpringAnimation init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_completed = 0;
    v15 = MEMORY[0x2199A6364](v12);
    applier = v14->_applier;
    v14->_applier = (id)v15;

    v17 = -[SpringAnimation initWithInitialValue:delay:]([_TtC15ActivityRingsUI15SpringAnimation alloc], "initWithInitialValue:delay:", a5, 0.0);
    springAnimation = v14->_springAnimation;
    v14->_springAnimation = v17;

    -[SpringAnimation configureWithTension:friction:target:](v14->_springAnimation, "configureWithTension:friction:target:", a3, a4, a6);
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should call -[ARUIFloatSpringAnimation completeAnimation] before deallocating"));
  v3.receiver = self;
  v3.super_class = (Class)ARUIFloatSpringAnimation;
  -[ARUIFloatSpringAnimation dealloc](&v3, sel_dealloc);
}

- (void)update:(double)a3
{
  void (**applier)(id);

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call update on a ARUIFloatSpringAnimation that has already completed"));
  if (-[SpringAnimation advanceWithDeltaTime:](self->_springAnimation, "advanceWithDeltaTime:", a3))
  {
    applier = (void (**)(id))self->_applier;
    -[ARUIFloatSpringAnimation currentValue](self, "currentValue");
    applier[2](applier);
  }
}

- (float)currentValue
{
  double v2;

  -[SpringAnimation value](self->_springAnimation, "value");
  return v2;
}

- (float)endValue
{
  double v2;

  -[SpringAnimation target](self->_springAnimation, "target");
  return v2;
}

- (BOOL)isAnimating
{
  double v3;
  float v4;
  double v5;
  float v6;

  -[SpringAnimation value](self->_springAnimation, "value");
  v4 = v3;
  -[SpringAnimation target](self->_springAnimation, "target");
  v6 = v5;
  return !ARUIFloatEqual(v4, v6);
}

- (void)completeAnimation
{
  void (**applier)(id);
  id WeakRetained;

  if (self->_completed)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Should not call completeAnimation on a ARUIFloatSpringAnimation that has already completed"));
  -[SpringAnimation completeWithSnap](self->_springAnimation, "completeWithSnap");
  applier = (void (**)(id))self->_applier;
  -[ARUIFloatSpringAnimation endValue](self, "endValue");
  applier[2](applier);
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_springAnimation, 0);
  objc_storeStrong(&self->_applier, 0);
}

@end
