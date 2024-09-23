@implementation NTKColorCurveElement

- (NTKColorCurveElement)initWithColor:(id)a3 fraction:(float)a4
{
  id v6;
  NTKColorCurveElement *v7;
  NTKColorCurveElement *v8;
  double v9;
  void *v10;
  NTKColorCurveElement *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKColorCurveElement;
  v7 = -[NTKColorCurveElement init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    -[NTKColorCurveElement setColor:](v7, "setColor:", v6);
    *(float *)&v9 = a4;
    -[NTKColorCurveElement setFraction:](v8, "setFraction:", v9);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKColorCurveElement setTimingFunction:](v8, "setTimingFunction:", v10);

    v11 = v8;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p> fraction: %f color: %@"), objc_opt_class(), self, self->_fraction, self->_color);
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (float)fraction
{
  return self->_fraction;
}

- (void)setFraction:(float)a3
{
  self->_fraction = a3;
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
  objc_storeStrong((id *)&self->_color, 0);
}

@end
