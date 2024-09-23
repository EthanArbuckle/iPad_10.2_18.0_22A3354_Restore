@implementation CPUILabelButton

- (id)tintColor
{
  if ((-[CPUILabelButton isEnabled](self, "isEnabled") & 1) != 0)
    objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
  else
    -[CPUILabelButton disabledTextColor](self, "disabledTextColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPUILabelButton;
  -[CPUILabelButton setEnabled:](&v4, sel_setEnabled_, a3);
  -[CPUILabelButton setNeedsLayout](self, "setNeedsLayout");
}

- (id)colorForKnobFocusLayer
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
}

- (UIColor)disabledTextColor
{
  return self->_disabledTextColor;
}

- (void)setDisabledTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_disabledTextColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledTextColor, 0);
}

@end
