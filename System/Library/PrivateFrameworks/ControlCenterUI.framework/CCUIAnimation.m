@implementation CCUIAnimation

+ (id)animationWithParameters:(id)a3 animations:(id)a4
{
  return (id)objc_msgSend(a1, "animationWithParameters:delay:animations:", a3, a4, 0.0);
}

+ (id)animationWithParameters:(id)a3 delay:(double)a4 animations:(id)a5
{
  return (id)objc_msgSend(a1, "animationWithParameters:delay:speed:animations:", a3, a5, a4, 1.0);
}

+ (id)animationWithParameters:(id)a3 delay:(double)a4 speed:(double)a5 animations:(id)a6
{
  id v10;
  id v11;
  void *v12;

  v10 = a6;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithParameters:delay:speed:animations:", v11, v10, a4, a5);

  return v12;
}

- (id)_initWithParameters:(id)a3 delay:(double)a4 speed:(double)a5 animations:(id)a6
{
  id v10;
  id v11;
  CCUIAnimation *v12;
  uint64_t v13;
  CCUIAnimationParameters *parameters;
  uint64_t v15;
  id animations;
  objc_super v18;

  v10 = a3;
  v11 = a6;
  v18.receiver = self;
  v18.super_class = (Class)CCUIAnimation;
  v12 = -[CCUIAnimation init](&v18, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copyWithZone:", 0);
    parameters = v12->_parameters;
    v12->_parameters = (CCUIAnimationParameters *)v13;

    v12->_delay = a4;
    v12->_speed = a5;
    v15 = objc_msgSend(v11, "copy");
    animations = v12->_animations;
    v12->_animations = (id)v15;

  }
  return v12;
}

- (CCUIAnimationParameters)parameters
{
  return self->_parameters;
}

- (double)delay
{
  return self->_delay;
}

- (double)speed
{
  return self->_speed;
}

- (id)animations
{
  return self->_animations;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_animations, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
