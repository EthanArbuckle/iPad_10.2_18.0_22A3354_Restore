@implementation SFCapsuleInputAccessorySpacerView

- (SFCapsuleInputAccessorySpacerView)initWithCapsuleView:(id)a3 initialWidth:(double)a4
{
  id v5;
  SFCapsuleInputAccessorySpacerView *v6;
  SFCapsuleInputAccessorySpacerView *v7;
  SFCapsuleInputAccessorySpacerView *v8;
  objc_super v10;
  CGRect v11;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFCapsuleInputAccessorySpacerView;
  v6 = -[SFCapsuleInputAccessorySpacerView init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[SFCapsuleInputAccessorySpacerView setUserInteractionEnabled:](v6, "setUserInteractionEnabled:", 0);
    objc_msgSend(v5, "frame");
    v7->_capsuleHeight = CGRectGetHeight(v11);
    -[SFCapsuleInputAccessorySpacerView sizeToFit](v7, "sizeToFit");
    v8 = v7;
  }

  return v7;
}

- (void)setCapsuleHeight:(double)a3
{
  if (self->_capsuleHeight != a3)
  {
    self->_capsuleHeight = a3;
    -[SFCapsuleInputAccessorySpacerView sizeToFit](self, "sizeToFit");
    -[SFCapsuleInputAccessorySpacerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = self->_capsuleHeight + 12.0 + 3.0;
  result.height = v3;
  return result;
}

- (double)capsuleHeight
{
  return self->_capsuleHeight;
}

@end
