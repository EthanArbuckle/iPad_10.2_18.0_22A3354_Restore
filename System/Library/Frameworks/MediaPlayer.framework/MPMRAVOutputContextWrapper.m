@implementation MPMRAVOutputContextWrapper

- (void)unwrappedValue
{
  return -[MPCFWrapper refValue](objc_retainAutorelease(self), "refValue");
}

@end
