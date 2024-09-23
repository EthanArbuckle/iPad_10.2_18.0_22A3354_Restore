@implementation CCUICABasicAnimationFactory

- (CCUICABasicAnimationFactory)initWithParameters:(id)a3 speed:(double)a4
{
  id v7;
  CCUICABasicAnimationFactory *v8;
  CCUICABasicAnimationFactory *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CCUICABasicAnimationFactory;
  v8 = -[CCUICABasicAnimationFactory init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_parameters, a3);
    v9->_speed = a4;
  }

  return v9;
}

- (double)animationDuration
{
  double result;

  -[CCUICABasicAnimationParameters duration](self->_parameters, "duration");
  return result;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  -[CCUICABasicAnimationFactory _animation](self, "_animation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyPath:", v5);

  return v6;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (id)_animation
{
  void *v3;
  double speed;

  objc_msgSend(MEMORY[0x1E0CD2710], "animation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUICABasicAnimationParameters duration](self->_parameters, "duration");
  objc_msgSend(v3, "setDuration:");
  speed = self->_speed;
  *(float *)&speed = speed;
  objc_msgSend(v3, "setSpeed:", speed);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
