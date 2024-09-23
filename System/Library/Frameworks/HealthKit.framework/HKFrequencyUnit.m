@implementation HKFrequencyUnit

- (id)dimension
{
  return +[_HKBaseDimension frequency](_HKBaseDimension, "frequency");
}

@end
