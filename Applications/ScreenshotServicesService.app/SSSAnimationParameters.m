@implementation SSSAnimationParameters

- (SSSAnimationParameters)init
{
  SSSAnimationParameters *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSSAnimationParameters;
  v2 = -[SSSAnimationParameters init](&v4, "init");
  -[SSSAnimationParameters setAnimationOptions:](v2, "setAnimationOptions:", 6);
  return v2;
}

- (BOOL)_shouldAnimateAdditivelyForView:(id)a3 withKeyPath:(id)a4
{
  return 1;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return -[SSSAnimationParameters _animationForKeyPath:](self, "_animationForKeyPath:", a4);
}

- (id)_animationForKeyPath:(id)a3
{
  void *v4;
  id v5;
  float v6;
  double v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SSSAnimationParameters animationUsingParametersForKeyPath:](self, "animationUsingParametersForKeyPath:", a3));
  -[SSSAnimationParameters duration](self, "duration");
  objc_msgSend(v4, "setDuration:");
  v5 = objc_msgSend(v4, "speed");
  *(float *)&v7 = v6 / UIAnimationDragCoefficient(v5);
  objc_msgSend(v4, "setSpeed:", v7);
  return v4;
}

- (id)animationUsingParametersForKeyPath:(id)a3
{
  return +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", a3);
}

- (id)timingParameters
{
  return objc_alloc_init((Class)UICubicTimingParameters);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_alloc_init((Class)objc_opt_class(self, a2));
  -[SSSAnimationParameters duration](self, "duration");
  v4[3] = v5;
  -[SSSAnimationParameters delay](self, "delay");
  v4[1] = v6;
  v4[4] = -[SSSAnimationParameters animationReason](self, "animationReason");
  return v4;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)animationOptions
{
  return self->_animationOptions;
}

- (void)setAnimationOptions:(unint64_t)a3
{
  self->_animationOptions = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)animationReason
{
  return self->_animationReason;
}

- (void)setAnimationReason:(int64_t)a3
{
  self->_animationReason = a3;
}

@end
