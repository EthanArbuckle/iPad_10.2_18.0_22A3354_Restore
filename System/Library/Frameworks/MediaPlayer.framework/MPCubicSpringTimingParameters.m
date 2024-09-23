@implementation MPCubicSpringTimingParameters

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPCubicSpringTimingParameters;
  v4 = -[MPCubicSpringTimingParameters copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[MPCubicSpringTimingParameters springCubicTimingParameters](self, "springCubicTimingParameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSpringCubicTimingParameters:", v5);

  return v4;
}

- (id)cubicTimingParameters
{
  return self->_springCubicTimingParameters;
}

- (UICubicTimingParameters)springCubicTimingParameters
{
  return self->_springCubicTimingParameters;
}

- (void)setSpringCubicTimingParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springCubicTimingParameters, 0);
}

+ (id)standardTimingParameters
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC36D8]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMass:stiffness:damping:initialVelocity:", 3.0, 500.0, 1000.0, 0.0, 0.0);
  objc_msgSend(v4, "setSpringCubicTimingParameters:", v3);

  return v4;
}

@end
