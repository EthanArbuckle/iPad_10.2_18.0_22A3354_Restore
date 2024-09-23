@implementation SGColorCurveElement

- (SGColorCurveElement)initWithColor:(id)a3 fraction:(float)a4
{
  id v6;
  SGColorCurveElement *v7;
  SGColorCurveElement *v8;
  double v9;
  void *v10;
  SGColorCurveElement *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SGColorCurveElement;
  v7 = -[SGColorCurveElement init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    -[SGColorCurveElement setColor:](v7, "setColor:", v6);
    *(float *)&v9 = a4;
    -[SGColorCurveElement setFraction:](v8, "setFraction:", v9);
    objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D20]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGColorCurveElement setTimingFunction:](v8, "setTimingFunction:", v10);

    v11 = v8;
  }

  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p> fraction: %f color: %@"), objc_opt_class(), self, self->_fraction, self->_color);
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
