@implementation _MTLumaDodgePillLowQualityEffectView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((__supportedAnimationPropertyKey(v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MTLumaDodgePillLowQualityEffectView;
    v5 = -[_MTLumaDodgePillLowQualityEffectView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (BOOL)_shouldAnimatePropertyAdditivelyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((__supportedAnimationPropertyKey(v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_MTLumaDodgePillLowQualityEffectView;
    v5 = -[_MTLumaDodgePillLowQualityEffectView _shouldAnimatePropertyAdditivelyWithKey:](&v7, sel__shouldAnimatePropertyAdditivelyWithKey_, v4);
  }

  return v5;
}

@end
