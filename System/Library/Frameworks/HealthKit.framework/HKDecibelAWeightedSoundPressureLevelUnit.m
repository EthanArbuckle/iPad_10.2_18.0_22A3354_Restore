@implementation HKDecibelAWeightedSoundPressureLevelUnit

- (id)dimension
{
  return +[_HKBaseDimension soundPressureLevel](_HKBaseDimension, "soundPressureLevel");
}

@end
