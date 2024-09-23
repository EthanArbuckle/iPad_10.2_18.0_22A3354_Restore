@implementation CLKGaugeSegment

- (CLKGaugeSegment)initWithColor:(id)a3 state:(int64_t)a4
{
  id v7;
  CLKGaugeSegment *v8;
  CLKGaugeSegment *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CLKGaugeSegment;
  v8 = -[CLKGaugeSegment init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_color, a3);
    v9->_state = a4;
  }

  return v9;
}

- (UIColor)color
{
  return self->_color;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
}

@end
