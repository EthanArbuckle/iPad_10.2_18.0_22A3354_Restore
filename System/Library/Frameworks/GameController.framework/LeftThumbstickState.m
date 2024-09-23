@implementation LeftThumbstickState

- (LeftThumbstickState)init
{
  LeftThumbstickState *v2;
  double v3;
  LeftThumbstickState *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LeftThumbstickState;
  v2 = -[LeftThumbstickState init](&v9, sel_init);
  v4 = v2;
  if (v2)
  {
    LODWORD(v3) = 0;
    -[LeftThumbstickState setRight:](v2, "setRight:", v3);
    LODWORD(v5) = 0;
    -[LeftThumbstickState setLeft:](v4, "setLeft:", v5);
    LODWORD(v6) = 0;
    -[LeftThumbstickState setDown:](v4, "setDown:", v6);
    LODWORD(v7) = 0;
    -[LeftThumbstickState setUp:](v4, "setUp:", v7);
  }
  return v4;
}

- (float)up
{
  return self->_up;
}

- (void)setUp:(float)a3
{
  self->_up = a3;
}

- (float)down
{
  return self->_down;
}

- (void)setDown:(float)a3
{
  self->_down = a3;
}

- (float)left
{
  return self->_left;
}

- (void)setLeft:(float)a3
{
  self->_left = a3;
}

- (float)right
{
  return self->_right;
}

- (void)setRight:(float)a3
{
  self->_right = a3;
}

@end
