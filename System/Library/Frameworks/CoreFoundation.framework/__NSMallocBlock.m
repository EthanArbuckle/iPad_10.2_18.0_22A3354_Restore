@implementation __NSMallocBlock

- (__NSMallocBlock)retain
{
  _Block_copy(self);
  return self;
}

- (unint64_t)retainCount
{
  return 1;
}

@end
