@implementation HUSpringAnimationSettings

- (HUSpringAnimationSettings)init
{
  return (HUSpringAnimationSettings *)-[HUSpringAnimationSettings _initWithSpringAnimation:completionEpsilon:](self, "_initWithSpringAnimation:completionEpsilon:", 0, 0.001);
}

- (id)_initWithSpringAnimation:(id)a3 completionEpsilon:(double)a4
{
  id v6;
  HUSpringAnimationSettings *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HUSpringAnimationSettings;
  v7 = -[HUAnimationSettings init](&v11, sel_init);
  if (v7)
  {
    if (v6)
    {
      v8 = (void *)objc_msgSend(v6, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD2848], "animation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;
    objc_storeStrong((id *)&v7->_springAnimation, v8);

    -[HUSpringAnimationSettings setCompletionEpsilon:](v7, "setCompletionEpsilon:", a4);
  }

  return v7;
}

+ (id)criticallyDampedSpringSettings
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setMass:", 3.0);
  objc_msgSend(v2, "setStiffness:", 1000.0);
  objc_msgSend(v2, "setDamping:", 500.0);
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HUSpringAnimationSettings *v4;
  void *v5;
  id v6;

  v4 = +[HUSpringAnimationSettings allocWithZone:](HUSpringAnimationSettings, "allocWithZone:", a3);
  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUSpringAnimationSettings completionEpsilon](self, "completionEpsilon");
  v6 = -[HUSpringAnimationSettings _initWithSpringAnimation:completionEpsilon:](v4, "_initWithSpringAnimation:completionEpsilon:", v5);

  return v6;
}

- (id)timingFunction
{
  void *v2;
  void *v3;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timingFunction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTimingFunction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimingFunction:", v4);

}

- (double)mass
{
  void *v2;
  double v3;
  double v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mass");
  v4 = v3;

  return v4;
}

- (void)setMass:(double)a3
{
  void *v5;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMass:", a3);

  -[HUSpringAnimationSettings _updateDuration](self, "_updateDuration");
}

- (double)stiffness
{
  void *v2;
  double v3;
  double v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stiffness");
  v4 = v3;

  return v4;
}

- (void)setStiffness:(double)a3
{
  void *v5;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStiffness:", a3);

  -[HUSpringAnimationSettings _updateDuration](self, "_updateDuration");
}

- (double)damping
{
  void *v2;
  double v3;
  double v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "damping");
  v4 = v3;

  return v4;
}

- (void)setDamping:(double)a3
{
  void *v5;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDamping:", a3);

  -[HUSpringAnimationSettings _updateDuration](self, "_updateDuration");
}

- (double)initialVelocity
{
  void *v2;
  double v3;
  double v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "velocity");
  v4 = v3;

  return v4;
}

- (void)setInitialVelocity:(double)a3
{
  void *v5;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVelocity:", a3);

  -[HUSpringAnimationSettings _updateDuration](self, "_updateDuration");
}

- (double)duration
{
  void *v2;
  double v3;
  double v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "duration");
  v4 = v3;

  return v4;
}

- (void)setDuration:(double)a3
{
    a3);
}

- (void)setCompletionEpsilon:(double)a3
{
  self->_completionEpsilon = a3;
  -[HUSpringAnimationSettings _updateDuration](self, "_updateDuration");
}

- (double)delay
{
  void *v2;
  double v3;
  double v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginTime");
  v4 = v3;

  return v4;
}

- (void)setDelay:(double)a3
{
  id v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBeginTime:", a3);

}

- (double)speed
{
  void *v2;
  float v3;
  double v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "speed");
  v4 = v3;

  return v4;
}

- (void)setSpeed:(double)a3
{
  float v5;
  void *v6;
  double v7;
  void *v9;

  if (a3 <= 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUAnimationSettings.m"), 230, CFSTR("Speed must be non-zero"));

  }
  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a3;
  *(float *)&v7 = v5;
  objc_msgSend(v6, "setSpeed:", v7);

  -[HUSpringAnimationSettings _updateDuration](self, "_updateDuration");
}

- (float)repeatCount
{
  void *v2;
  float v3;
  float v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repeatCount");
  v4 = v3;

  return v4;
}

- (void)setRepeatCount:(float)a3
{
  double v4;
  id v5;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setRepeatCount:", v4);

}

- (double)interpolatedProgressForProgress:(double)a3
{
  void *v4;
  double v5;
  float v6;
  double v7;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "_solveForInput:", v5);
  v7 = v6;

  return v7;
}

- (void)_updateDuration
{
  void *v3;
  double v4;
  double v5;
  id v6;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "durationForEpsilon:", self->_completionEpsilon);
  v5 = v4;

  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDuration:", v5);

}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[HUSpringAnimationSettings springAnimation](self, "springAnimation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v7, "setKeyPath:", v5);
  return v7;
}

- (double)completionEpsilon
{
  return self->_completionEpsilon;
}

- (CASpringAnimation)springAnimation
{
  return self->_springAnimation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springAnimation, 0);
}

@end
