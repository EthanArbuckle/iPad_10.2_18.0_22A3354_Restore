@implementation __NSGlobalBlock

- (unint64_t)retainCount
{
  return 1;
}

- (BOOL)_tryRetain
{
  return 1;
}

- (BOOL)_isDeallocating
{
  return 0;
}

@end
