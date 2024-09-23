@implementation MPUSpringAnimationFactory

+ (void)animateUsingSpringWithDamping:(double)a3 mass:(double)a4 stiffness:(double)a5 velocity:(double)a6 animations:(id)a7 options:(unint64_t)a8 completion:(id)a9
{
  id v15;
  id v16;
  double v17;
  MPUSpringAnimationFactory *v18;

  v15 = a9;
  v16 = a7;
  v18 = objc_alloc_init(MPUSpringAnimationFactory);
  -[MPUSpringAnimationFactory setMass:](v18, "setMass:", a4);
  -[MPUSpringAnimationFactory setStiffness:](v18, "setStiffness:", a5);
  -[MPUSpringAnimationFactory setDamping:](v18, "setDamping:", a3);
  -[MPUSpringAnimationFactory setVelocity:](v18, "setVelocity:", a6);
  -[MPUSpringAnimationFactory durationForEpsilon:](v18, "durationForEpsilon:", 0.001);
  objc_msgSend(MEMORY[0x24BDF6F90], "_animateWithDuration:delay:options:factory:animations:completion:", a8 | 0x30000, v18, v16, v15, fmin(v17, 1.0), 0.0);

}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  -[MPUAnimationFactory allowedKeyPaths](self, "allowedKeyPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && !objc_msgSend(v8, "containsObject:", v7))
  {
    v13.receiver = self;
    v13.super_class = (Class)MPUSpringAnimationFactory;
    -[MPUAnimationFactory _basicAnimationForView:withKeyPath:](&v13, sel__basicAnimationForView_withKeyPath_, v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = -[MPUSpringAnimationFactory _newSpringAnimationForKeyPath:](self, "_newSpringAnimationForKeyPath:", v7);
  }
  v11 = v10;

  return v11;
}

- (double)durationForEpsilon:(double)a3
{
  id v4;
  double v5;
  double v6;

  v4 = -[MPUSpringAnimationFactory _newSpringAnimationForKeyPath:](self, "_newSpringAnimationForKeyPath:", 0);
  objc_msgSend(v4, "durationForEpsilon:", a3);
  v6 = v5;

  return v6;
}

- (id)_newSpringAnimationForKeyPath:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDE5760], "animationWithKeyPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMass:", self->_mass);
  objc_msgSend(v4, "setStiffness:", self->_stiffness);
  objc_msgSend(v4, "setDamping:", self->_damping);
  objc_msgSend(v4, "setVelocity:", self->_velocity);
  -[MPUAnimationFactory fillMode](self, "fillMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFillMode:", v5);

  objc_msgSend(v4, "setRemovedOnCompletion:", -[MPUAnimationFactory isRemovedOnCompletion](self, "isRemovedOnCompletion"));
  -[MPUAnimationFactory timeOffset](self, "timeOffset");
  objc_msgSend(v4, "setTimeOffset:");
  return v4;
}

- (double)damping
{
  return self->_damping;
}

- (void)setDamping:(double)a3
{
  self->_damping = a3;
}

- (double)mass
{
  return self->_mass;
}

- (void)setMass:(double)a3
{
  self->_mass = a3;
}

- (double)stiffness
{
  return self->_stiffness;
}

- (void)setStiffness:(double)a3
{
  self->_stiffness = a3;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

@end
