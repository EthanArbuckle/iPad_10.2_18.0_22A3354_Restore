@implementation NTKFloatCurveElement

- (NTKFloatCurveElement)initWithFloatValue:(double)a3 fraction:(double)a4
{
  NTKFloatCurveElement *v6;
  NTKFloatCurveElement *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NTKFloatCurveElement;
  v6 = -[NTKFloatCurveElement init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[NTKFloatCurveElement setFloatValue:](v6, "setFloatValue:", a3);
    -[NTKFloatCurveElement setFraction:](v7, "setFraction:", a4);
    -[NTKFloatCurveElement setCurve:](v7, "setCurve:", 0);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKFloatCurveElement setTimingFunction:](v7, "setTimingFunction:", v8);

  }
  return v7;
}

- (double)floatValue
{
  return self->_floatValue;
}

- (void)setFloatValue:(double)a3
{
  self->_floatValue = a3;
}

- (double)fraction
{
  return self->_fraction;
}

- (void)setFraction:(double)a3
{
  self->_fraction = a3;
}

- (int64_t)curve
{
  return self->_curve;
}

- (void)setCurve:(int64_t)a3
{
  self->_curve = a3;
}

- (CAMediaTimingFunction)timingFunction
{
  return self->_timingFunction;
}

- (void)setTimingFunction:(id)a3
{
  objc_storeStrong((id *)&self->_timingFunction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timingFunction, 0);
}

@end
