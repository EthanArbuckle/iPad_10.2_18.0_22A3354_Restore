@implementation CKElasticFunction

+ (id)functionWithTension:(double)a3 friction:(double)a4 initialValue:(double)a5
{
  double *v8;

  v8 = (double *)objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v8, "setTension:", a3);
  objc_msgSend(v8, "setFriction:", a4);
  v8[2] = a5;
  v8[3] = a5;
  return v8;
}

- (CKElasticFunction)init
{
  CKElasticFunction *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKElasticFunction;
  result = -[CKElasticFunction init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_friction = xmmword_18E7CAA50;
  return result;
}

- (void)setInput:(double)a3
{
  self->_currentValue = a3;
}

- (double)output
{
  return self->_elastic;
}

- (double)velocity
{
  return self->_velocity;
}

- (void)step
{
  double v2;
  double v3;

  v2 = self->_elastic + (self->_elastic - self->_currentValue) * self->_tension * 0.001 * -0.001;
  v3 = fmax(self->_friction * -0.001 + 1.0, 0.0) * (v2 - self->_oldForce) / 0.001;
  self->_elastic = v2 + v3 * 0.001;
  self->_oldForce = v2;
  self->_velocity = v3;
}

- (double)input
{
  return self->_currentValue;
}

- (double)friction
{
  return self->_friction;
}

- (void)setFriction:(double)a3
{
  self->_friction = a3;
}

- (double)tension
{
  return self->_tension;
}

- (void)setTension:(double)a3
{
  self->_tension = a3;
}

@end
