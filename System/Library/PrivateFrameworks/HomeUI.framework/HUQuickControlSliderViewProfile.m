@implementation HUQuickControlSliderViewProfile

- (HUQuickControlSliderViewProfile)init
{
  HUQuickControlSliderViewProfile *v2;
  HUQuickControlSliderViewProfile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlSliderViewProfile;
  v2 = -[HUQuickControlSliderViewProfile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HUQuickControlSliderViewProfile setHasOffState:](v2, "setHasOffState:", 1);
    -[HUQuickControlSliderViewProfile setPreferredFillSection:](v3, "setPreferredFillSection:", 0);
    -[HUQuickControlSliderViewProfile setHasSecondaryValue:](v3, "setHasSecondaryValue:", 0);
    -[HUQuickControlSliderViewProfile setInteractionFidelity:](v3, "setInteractionFidelity:", 0);
    -[HUQuickControlSliderViewProfile setShowGrabbers:](v3, "setShowGrabbers:", 0);
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HUQuickControlSliderViewProfile;
  v4 = -[HUQuickControlViewProfile copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[HUQuickControlSliderViewProfile primaryValueConstraints](self, "primaryValueConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrimaryValueConstraints:", v5);

  -[HUQuickControlSliderViewProfile secondaryValueConstraints](self, "secondaryValueConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryValueConstraints:", v6);

  objc_msgSend(v4, "setHasOffState:", -[HUQuickControlSliderViewProfile hasOffState](self, "hasOffState"));
  objc_msgSend(v4, "setHasSecondaryValue:", -[HUQuickControlSliderViewProfile hasSecondaryValue](self, "hasSecondaryValue"));
  objc_msgSend(v4, "setShowGrabbers:", -[HUQuickControlSliderViewProfile showGrabbers](self, "showGrabbers"));
  return v4;
}

- (BOOL)supportsTouchContinuation
{
  return 1;
}

- (double)gestureDragCoefficient
{
  unint64_t v2;
  double result;

  v2 = -[HUQuickControlSliderViewProfile interactionFidelity](self, "interactionFidelity");
  result = 1.75;
  if (!v2)
    return 1.0;
  return result;
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
}

- (BOOL)hasOffState
{
  return self->_hasOffState;
}

- (void)setHasOffState:(BOOL)a3
{
  self->_hasOffState = a3;
}

- (HFNumberValueConstraints)primaryValueConstraints
{
  return self->_primaryValueConstraints;
}

- (void)setPrimaryValueConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_primaryValueConstraints, a3);
}

- (HFNumberValueConstraints)secondaryValueConstraints
{
  return self->_secondaryValueConstraints;
}

- (void)setSecondaryValueConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryValueConstraints, a3);
}

- (BOOL)showGrabbers
{
  return self->_showGrabbers;
}

- (void)setShowGrabbers:(BOOL)a3
{
  self->_showGrabbers = a3;
}

- (unint64_t)preferredFillSection
{
  return self->_preferredFillSection;
}

- (void)setPreferredFillSection:(unint64_t)a3
{
  self->_preferredFillSection = a3;
}

- (unint64_t)interactionFidelity
{
  return self->_interactionFidelity;
}

- (void)setInteractionFidelity:(unint64_t)a3
{
  self->_interactionFidelity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryValueConstraints, 0);
  objc_storeStrong((id *)&self->_primaryValueConstraints, 0);
}

@end
