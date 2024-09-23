@implementation SUUISimpleAnimationFactory

+ (id)backOutTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v4) = 1047233823;
  LODWORD(v5) = 1068457001;
  LODWORD(v2) = 0;
  LODWORD(v3) = 0;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

+ (id)easeQuadInTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1054615798;
  LODWORD(v4) = 1062333317;
  LODWORD(v5) = 1058642330;
  LODWORD(v3) = 0;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

+ (id)easeQuadInOutTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1054615798;
  LODWORD(v4) = 1058139013;
  LODWORD(v3) = 0;
  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

+ (id)easeQuadOutTimingFunction
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v2) = 1043878380;
  LODWORD(v3) = 1053609165;
  LODWORD(v4) = 1058139013;
  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

+ (id)factoryWithTimingFunction:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  v6 = (void *)v5[1];
  v5[1] = v4;

  return v5;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return 0;
}

- (id)_timingFunctionForAnimation
{
  return self->_timingFunction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
