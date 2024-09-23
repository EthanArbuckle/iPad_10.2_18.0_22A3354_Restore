@implementation CMOdometryManagerInternal

- (CMOdometryManagerInternal)init
{
  CMOdometryManagerInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMOdometryManagerInternal;
  result = -[CMOdometryManagerInternal init](&v3, sel_init);
  if (result)
  {
    result->_odometryHandler = 0;
    result->_odometryQueue = 0;
    result->_odometryDispatcher = 0;
    result->_odometryUpdateInterval = 0.1;
    result->_hasFirstSample = 0;
    result->_referenceFrame = 1;
  }
  return result;
}

@end
