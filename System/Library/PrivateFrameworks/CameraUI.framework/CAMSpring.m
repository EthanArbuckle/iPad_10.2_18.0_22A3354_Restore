@implementation CAMSpring

- (CAMSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5
{
  return -[CAMSpring initWithTension:friction:epsilon:boundedBetween:and:](self, "initWithTension:friction:epsilon:boundedBetween:and:", a3, a4, a5, -1.79769313e308, 1.79769313e308);
}

- (CAMSpring)initWithTension:(double)a3 friction:(double)a4 epsilon:(double)a5 boundedBetween:(double)a6 and:(double)a7
{
  char *v12;
  CAMSpring *v13;
  char *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CAMSpring;
  v12 = -[CAMSpring init](&v16, sel_init);
  v13 = (CAMSpring *)v12;
  if (v12)
  {
    *((double *)v12 + 2) = a3;
    *((double *)v12 + 3) = a4;
    *((double *)v12 + 6) = a5;
    *((double *)v12 + 10) = fmin(a6, a7);
    *((double *)v12 + 11) = fmax(a6, a7);
    *(_OWORD *)(v12 + 56) = xmmword_1DB9A5970;
    v12[8] = 1;
    v14 = v12;
  }

  return v13;
}

- (void)setTarget:(double)a3
{
  self->_target = a3;
  -[CAMSpring _updateConverged](self, "_updateConverged");
}

- (void)_setCurrent:(double)a3
{
  self->__current = a3;
  -[CAMSpring _updateConverged](self, "_updateConverged");
}

- (double)value
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[CAMSpring _upperBound](self, "_upperBound");
  v4 = v3;
  -[CAMSpring _current](self, "_current");
  v6 = fmin(v4, v5);
  -[CAMSpring _lowerBound](self, "_lowerBound");
  return fmax(v6, v7);
}

- (void)resetToValue:(double)a3
{
  self->_target = a3;
  self->__current = a3;
  self->_velocity = 0.0;
  -[CAMSpring _setConverged:](self, "_setConverged:", 1);
  -[CAMSpring _setLastTimestamp:](self, "_setLastTimestamp:", CFAbsoluteTimeGetCurrent());
}

- (void)updateForTimestamp:(double)a3
{
  -[CAMSpring _currentForce](self, "_currentForce");
  -[CAMSpring _updateWithForce:timestamp:](self, "_updateWithForce:timestamp:");
}

- (void)converge
{
  -[CAMSpring target](self, "target");
  -[CAMSpring resetToValue:](self, "resetToValue:");
}

- (void)_updateConverged
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;

  -[CAMSpring target](self, "target");
  v4 = v3;
  -[CAMSpring _current](self, "_current");
  v6 = vabdd_f64(v4, v5);
  -[CAMSpring epsilon](self, "epsilon");
  v8 = v7;
  -[CAMSpring velocity](self, "velocity");
  v10 = fabs(v9) < v8 && v6 < v8;
  -[CAMSpring _setConverged:](self, "_setConverged:", v10);
}

- (double)_currentForce
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[CAMSpring tension](self, "tension");
  v4 = v3;
  -[CAMSpring target](self, "target");
  v6 = v5;
  -[CAMSpring _current](self, "_current");
  v8 = v6 - v7;
  -[CAMSpring friction](self, "friction");
  v10 = v9;
  -[CAMSpring velocity](self, "velocity");
  return v4 * v8 - v10 * v11;
}

- (void)_updateWithForce:(double)a3 timestamp:(double)a4
{
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  -[CAMSpring _lastTimestamp](self, "_lastTimestamp");
  v8 = v7;
  -[CAMSpring _setLastTimestamp:](self, "_setLastTimestamp:", a4);
  if (v8 != 0.0 && !-[CAMSpring isConverged](self, "isConverged"))
  {
    -[CAMSpring _updateConverged](self, "_updateConverged");
    if (-[CAMSpring isConverged](self, "isConverged"))
    {
      -[CAMSpring target](self, "target");
    }
    else
    {
      v10 = vabdd_f64(a4, v8);
      -[CAMSpring maximumTimeDelta](self, "maximumTimeDelta");
      if (v10 >= v11)
        v10 = v11;
      -[CAMSpring velocity](self, "velocity");
      -[CAMSpring setVelocity:](self, "setVelocity:", v12 + a3 * v10);
      -[CAMSpring velocity](self, "velocity");
      v14 = v13;
      -[CAMSpring _current](self, "_current");
      v9 = v15 + v14 * v10;
    }
    -[CAMSpring _setCurrent:](self, "_setCurrent:", v9);
  }
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)target
{
  return self->_target;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)setVelocity:(double)a3
{
  self->_velocity = a3;
}

- (double)epsilon
{
  return self->_epsilon;
}

- (double)maximumTimeDelta
{
  return self->_maximumTimeDelta;
}

- (void)setMaximumTimeDelta:(double)a3
{
  self->_maximumTimeDelta = a3;
}

- (BOOL)isConverged
{
  return self->_converged;
}

- (void)_setConverged:(BOOL)a3
{
  self->_converged = a3;
}

- (double)_lastTimestamp
{
  return self->__lastTimestamp;
}

- (void)_setLastTimestamp:(double)a3
{
  self->__lastTimestamp = a3;
}

- (double)_current
{
  return self->__current;
}

- (double)_lowerBound
{
  return self->__lowerBound;
}

- (double)_upperBound
{
  return self->__upperBound;
}

@end
