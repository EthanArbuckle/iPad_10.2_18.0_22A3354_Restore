@implementation HKDecibelHearingLevelUnit

- (id)dimension
{
  return +[_HKBaseDimension hearingSensitivity](_HKBaseDimension, "hearingSensitivity");
}

@end
