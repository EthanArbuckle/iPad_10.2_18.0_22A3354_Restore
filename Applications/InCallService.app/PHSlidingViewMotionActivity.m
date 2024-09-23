@implementation PHSlidingViewMotionActivity

- (PHSlidingViewMotionActivity)initWithIsMounted:(BOOL)a3 probability:(double)a4
{
  PHSlidingViewMotionActivity *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHSlidingViewMotionActivity;
  result = -[PHSlidingViewMotionActivity init](&v7, "init");
  if (result)
  {
    result->_isMounted = a3;
    result->_mountedProbability = a4;
  }
  return result;
}

- (BOOL)isMounted
{
  return self->_isMounted;
}

- (void)setIsMounted:(BOOL)a3
{
  self->_isMounted = a3;
}

- (double)mountedProbability
{
  return self->_mountedProbability;
}

- (void)setMountedProbability:(double)a3
{
  self->_mountedProbability = a3;
}

@end
