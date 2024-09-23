@implementation FCCacheCoordinatorFlushPolicy

- (unint64_t)highWaterMark
{
  return self->_highWaterMark;
}

- (BOOL)alwaysFlushKeysWithZeroInterest
{
  return self->_alwaysFlushKeysWithZeroInterest;
}

- (unint64_t)lowWaterMark
{
  return self->_lowWaterMark;
}

- (FCCacheCoordinatorFlushPolicy)initWithLowWaterMark:(unint64_t)a3 highWaterMark:(unint64_t)a4 alwaysFlushKeysWithZeroInterest:(BOOL)a5
{
  FCCacheCoordinatorFlushPolicy *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FCCacheCoordinatorFlushPolicy;
  result = -[FCCacheCoordinatorFlushPolicy init](&v9, sel_init);
  if (result)
  {
    result->_highWaterMark = a4;
    result->_lowWaterMark = a3;
    result->_alwaysFlushKeysWithZeroInterest = a5;
  }
  return result;
}

@end
