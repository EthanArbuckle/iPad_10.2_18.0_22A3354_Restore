@implementation _CLKUIColorManager

- (void)setColor:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[UIColor isEqual:](self->_color, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_color, a3);
    -[_CLKUIColorManager _updateFilterColor](self, "_updateFilterColor");
  }

}

- (void)_updateFilterColor
{
  -[CALayer setContentsMultiplyColor:](self->_layer, "setContentsMultiplyColor:", -[UIColor CGColor](self->_color, "CGColor"));
}

- (BOOL)shouldAnimatePropertyWithKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("contentsMultiplyColor"));
}

- (UIColor)contentColor
{
  return (UIColor *)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setLayer:(id)a3
{
  objc_storeStrong((id *)&self->_layer, a3);
}

- (UIColor)color
{
  return self->_color;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
