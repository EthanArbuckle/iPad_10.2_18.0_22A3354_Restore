@implementation UniqueAnimationKeyCounter

- (unint64_t)nextAnimationKey
{
  unint64_t nextAnimationKey;

  nextAnimationKey = self->_nextAnimationKey;
  self->_nextAnimationKey = nextAnimationKey + 1;
  return nextAnimationKey;
}

- (void)didFinishUsingAnimationKey
{
  ++self->_finishedUsingKeys;
}

- (BOOL)isFinishedUsingAllKeys
{
  return self->_finishedUsingKeys == self->_nextAnimationKey;
}

@end
