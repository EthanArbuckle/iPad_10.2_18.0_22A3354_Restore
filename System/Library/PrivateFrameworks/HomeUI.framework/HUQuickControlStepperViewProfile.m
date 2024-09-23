@implementation HUQuickControlStepperViewProfile

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HUQuickControlStepperViewProfile;
  v4 = -[HUQuickControlViewProfile copyWithZone:](&v7, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setNumberOfSegments:", -[HUQuickControlStepperViewProfile numberOfSegments](self, "numberOfSegments"));
  objc_msgSend(v4, "setStepperBehavior:", -[HUQuickControlStepperViewProfile stepperBehavior](self, "stepperBehavior"));
  objc_msgSend(v4, "setShowSegmentTitles:", -[HUQuickControlStepperViewProfile showSegmentTitles](self, "showSegmentTitles"));
  -[HUQuickControlStepperViewProfile segmentTitles](self, "segmentTitles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSegmentTitles:", v5);

  objc_msgSend(v4, "setStepperStyle:", -[HUQuickControlStepperViewProfile stepperStyle](self, "stepperStyle"));
  return v4;
}

- (BOOL)supportsTouchContinuation
{
  return 1;
}

- (unint64_t)numberOfSegments
{
  return self->_numberOfSegments;
}

- (void)setNumberOfSegments:(unint64_t)a3
{
  self->_numberOfSegments = a3;
}

- (unint64_t)stepperBehavior
{
  return self->_stepperBehavior;
}

- (void)setStepperBehavior:(unint64_t)a3
{
  self->_stepperBehavior = a3;
}

- (BOOL)showSegmentTitles
{
  return self->_showSegmentTitles;
}

- (void)setShowSegmentTitles:(BOOL)a3
{
  self->_showSegmentTitles = a3;
}

- (unint64_t)stepperStyle
{
  return self->_stepperStyle;
}

- (void)setStepperStyle:(unint64_t)a3
{
  self->_stepperStyle = a3;
}

- (NSArray)segmentTitles
{
  return self->_segmentTitles;
}

- (void)setSegmentTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentTitles, 0);
}

@end
