@implementation HUQuickControlRingSliderViewProfile

- (NSArray)gradationMarkingValues
{
  NSArray *gradationMarkingValues;
  NSArray *v4;
  NSArray *v5;

  gradationMarkingValues = self->_gradationMarkingValues;
  if (!gradationMarkingValues)
  {
    v4 = (NSArray *)objc_opt_new();
    v5 = self->_gradationMarkingValues;
    self->_gradationMarkingValues = v4;

    gradationMarkingValues = self->_gradationMarkingValues;
  }
  return gradationMarkingValues;
}

- (HUQuickControlRingSliderViewProfile)init
{
  HUQuickControlRingSliderViewProfile *v2;
  HUQuickControlRingSliderViewProfile *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlRingSliderViewProfile;
  v2 = -[HUQuickControlRingSliderViewProfile init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HUQuickControlRingSliderViewProfile setHasOffState:](v2, "setHasOffState:", 0);
    -[HUQuickControlRingSliderViewProfile setHasSecondaryValue:](v3, "setHasSecondaryValue:", 0);
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
  v8.super_class = (Class)HUQuickControlRingSliderViewProfile;
  v4 = -[HUQuickControlViewProfile copyWithZone:](&v8, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setHasOffState:", -[HUQuickControlRingSliderViewProfile hasOffState](self, "hasOffState"));
  -[HUQuickControlRingSliderViewProfile primaryValueConstraints](self, "primaryValueConstraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrimaryValueConstraints:", v5);

  -[HUQuickControlRingSliderViewProfile secondaryValueConstraints](self, "secondaryValueConstraints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryValueConstraints:", v6);

  objc_msgSend(v4, "setHasSecondaryValue:", -[HUQuickControlRingSliderViewProfile hasSecondaryValue](self, "hasSecondaryValue"));
  objc_msgSend(v4, "setStyle:", -[HUQuickControlRingSliderViewProfile style](self, "style"));
  objc_msgSend(v4, "setShouldShowSupplementaryValue:", -[HUQuickControlRingSliderViewProfile shouldShowSupplementaryValue](self, "shouldShowSupplementaryValue"));
  return v4;
}

- (BOOL)hasSecondaryValue
{
  return self->_hasSecondaryValue;
}

- (void)setHasSecondaryValue:(BOOL)a3
{
  self->_hasSecondaryValue = a3;
}

- (BOOL)isHandleViewVisible
{
  return self->_isHandleViewVisible;
}

- (void)setIsHandleViewVisible:(BOOL)a3
{
  self->_isHandleViewVisible = a3;
}

- (unint64_t)handleViewStyle
{
  return self->_handleViewStyle;
}

- (void)setHandleViewStyle:(unint64_t)a3
{
  self->_handleViewStyle = a3;
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

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (BOOL)shouldShowSupplementaryValue
{
  return self->_shouldShowSupplementaryValue;
}

- (void)setShouldShowSupplementaryValue:(BOOL)a3
{
  self->_shouldShowSupplementaryValue = a3;
}

- (void)setGradationMarkingValues:(id)a3
{
  objc_storeStrong((id *)&self->_gradationMarkingValues, a3);
}

- (unint64_t)gradationMarkingViewStyle
{
  return self->_gradationMarkingViewStyle;
}

- (void)setGradationMarkingViewStyle:(unint64_t)a3
{
  self->_gradationMarkingViewStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradationMarkingValues, 0);
  objc_storeStrong((id *)&self->_secondaryValueConstraints, 0);
  objc_storeStrong((id *)&self->_primaryValueConstraints, 0);
}

@end
