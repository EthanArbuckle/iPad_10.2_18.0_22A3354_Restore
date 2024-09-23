@implementation MPMRAVEndpointWrapper

- (void)unwrappedValue
{
  return -[MPCFWrapper refValue](objc_retainAutorelease(self), "refValue");
}

@end
