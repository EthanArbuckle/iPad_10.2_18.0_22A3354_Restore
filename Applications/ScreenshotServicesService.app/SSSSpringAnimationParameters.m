@implementation SSSSpringAnimationParameters

+ (id)springAnimationParametersWithDuration:(double)a3 mass:(double)a4 stiffness:(double)a5 damping:(double)a6 speed:(double)a7 controlPointOne:(CGPoint)a8 controlPointTwo:(CGPoint)a9
{
  CGFloat x;
  char *v15;
  CGFloat y;

  y = a8.y;
  x = a8.x;
  v15 = (char *)objc_alloc_init((Class)objc_opt_class(a1, a2));
  objc_msgSend(v15, "setDuration:", a3);
  *((double *)v15 + 5) = a4;
  *((double *)v15 + 6) = a5;
  *((double *)v15 + 7) = a6;
  *((double *)v15 + 8) = a7;
  *((CGFloat *)v15 + 9) = x;
  *((CGFloat *)v15 + 10) = y;
  *(CGPoint *)(v15 + 88) = a9;
  return v15;
}

- (id)animationUsingParametersForKeyPath:(id)a3
{
  void *v4;
  double speed;
  double x;
  double y;
  double v8;
  double v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  CAFrameRateRange v17;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", a3));
  objc_msgSend(v4, "setMass:", self->_mass);
  objc_msgSend(v4, "setStiffness:", self->_stiffness);
  objc_msgSend(v4, "setDamping:", self->_damping);
  speed = self->_speed;
  *(float *)&speed = speed;
  objc_msgSend(v4, "setSpeed:", speed);
  x = self->_controlPoint1.x;
  y = self->_controlPoint1.y;
  v8 = self->_controlPoint2.x;
  v9 = self->_controlPoint2.y;
  v10 = objc_alloc((Class)CAMediaTimingFunction);
  *(float *)&v11 = x;
  *(float *)&v12 = y;
  *(float *)&v13 = v8;
  *(float *)&v14 = v9;
  v15 = objc_msgSend(v10, "initWithControlPoints::::", v11, v12, v13, v14);
  objc_msgSend(v4, "setTimingFunction:", v15);
  if (-[SSSAnimationParameters animationReason](self, "animationReason"))
  {
    v17 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v4, "setPreferredFrameRateRange:", *(double *)&v17.minimum, *(double *)&v17.maximum, *(double *)&v17.preferred);
    objc_msgSend(v4, "setHighFrameRateReason:", (unsigned __int16)-[SSSAnimationParameters animationReason](self, "animationReason") | 0x160000u);
  }

  return v4;
}

- (id)timingParameters
{
  return objc_msgSend(objc_alloc((Class)UISpringTimingParameters), "initWithMass:stiffness:damping:initialVelocity:", self->_mass, self->_stiffness, self->_damping, 0.0, 0.0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SSSSpringAnimationParameters;
  result = -[SSSAnimationParameters copyWithZone:](&v5, "copyWithZone:", a3);
  *((_QWORD *)result + 5) = *(_QWORD *)&self->_mass;
  *((_QWORD *)result + 6) = *(_QWORD *)&self->_stiffness;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_damping;
  *((_QWORD *)result + 8) = *(_QWORD *)&self->_speed;
  *(CGPoint *)((char *)result + 72) = self->_controlPoint1;
  *(CGPoint *)((char *)result + 88) = self->_controlPoint2;
  return result;
}

+ (id)scaleAnimationParameters
{
  id v2;

  objc_opt_class(a1, a2);
  return objc_msgSend(v2, "springAnimationParametersWithDuration:mass:stiffness:damping:speed:controlPointOne:controlPointTwo:", 0.91, 2.0, 300.0, 400.0, 1.3, 0.0833330005, 0.0, 0x3FE2AAA3A0000000, 0x3FEF5C28FFFFFFFDLL);
}

@end
