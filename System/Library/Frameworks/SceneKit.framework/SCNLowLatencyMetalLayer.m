@implementation SCNLowLatencyMetalLayer

- (unint64_t)maximumDrawableCount
{
  return 2;
}

- (BOOL)lowLatency
{
  return 1;
}

@end
