@implementation HUQuickControlViewProfile

- (double)gestureDragCoefficient
{
  return 1.0;
}

- (BOOL)supportsTouchContinuation
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setControlSize:", -[HUQuickControlViewProfile controlSize](self, "controlSize"));
  objc_msgSend(v4, "setSuspendedState:", -[HUQuickControlViewProfile suspendedState](self, "suspendedState"));
  objc_msgSend(v4, "setOrientation:", -[HUQuickControlViewProfile orientation](self, "orientation"));
  -[HUQuickControlViewProfile supplementaryFormattedValue](self, "supplementaryFormattedValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSupplementaryFormattedValue:", v5);

  -[HUQuickControlViewProfile decorationIconDescriptor](self, "decorationIconDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDecorationIconDescriptor:", v6);

  -[HUQuickControlViewProfile tintColor](self, "tintColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v7);

  return v4;
}

- (unint64_t)controlSize
{
  return self->_controlSize;
}

- (void)setControlSize:(unint64_t)a3
{
  self->_controlSize = a3;
}

- (unint64_t)suspendedState
{
  return self->_suspendedState;
}

- (void)setSuspendedState:(unint64_t)a3
{
  self->_suspendedState = a3;
}

- (HFDynamicFormattingValue)supplementaryFormattedValue
{
  return self->_supplementaryFormattedValue;
}

- (void)setSupplementaryFormattedValue:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryFormattedValue, a3);
}

- (HFIconDescriptor)decorationIconDescriptor
{
  return self->_decorationIconDescriptor;
}

- (void)setDecorationIconDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_decorationIconDescriptor, a3);
}

- (unint64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unint64_t)a3
{
  self->_orientation = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_decorationIconDescriptor, 0);
  objc_storeStrong((id *)&self->_supplementaryFormattedValue, 0);
}

@end
