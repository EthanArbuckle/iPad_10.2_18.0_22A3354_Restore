@implementation HUQuickControlSwitchViewProfile

- (HFNumberValueConstraints)primaryValueConstraints
{
  return (HFNumberValueConstraints *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D315F8]), "initWithMinValue:maxValue:stepValue:", &unk_1E7041E78, &unk_1E7041E90, &unk_1E7041E90);
}

- (HFNumberValueConstraints)secondaryValueConstraints
{
  return 0;
}

- (double)gestureDragCoefficient
{
  return dbl_1B94431F0[(-[HUQuickControlViewProfile controlSize](self, "controlSize") & 0xFFFFFFFFFFFFFFFELL) == 2];
}

- (BOOL)supportsTouchContinuation
{
  return 1;
}

- (BOOL)hasSecondaryValue
{
  return 0;
}

@end
