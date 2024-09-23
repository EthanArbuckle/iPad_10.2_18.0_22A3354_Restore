@implementation HKVolumeUnit

- (id)dimension
{
  return +[_HKBaseDimension volume](_HKBaseDimension, "volume");
}

@end
