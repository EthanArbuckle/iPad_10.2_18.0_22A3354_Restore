@implementation CPUIRoundedLabelButton

- (CPUIRoundedLabelButton)initWithFrame:(CGRect)a3
{
  CPUIRoundedLabelButton *v3;
  CPUIRoundedLabelButton *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPUIRoundedLabelButton;
  v3 = -[CPUIMediaButton initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[CPUIRoundedLabelButton _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:", 8.0);
  return v4;
}

- (id)colorForKnobFocusLayer
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
}

- (id)colorForTouchContentSelected
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
}

- (id)colorForKnobFocusLayerSelected
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
}

- (id)colorForKnobContentSelected
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
}

- (id)colorForTouchFocusLayerSelected
{
  return (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
}

@end
