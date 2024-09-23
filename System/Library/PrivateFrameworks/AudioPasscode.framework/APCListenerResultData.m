@implementation APCListenerResultData

- (APCListenerResultData)initWithPasscodeDurationNSec:(unint64_t)a3
{
  APCListenerResultData *result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APCListenerResultData;
  result = -[APCListenerResultData init](&v4, sel_init, a3);
  if (result)
    result->_completionTime = 0;
  return result;
}

- (BOOL)isValid
{
  return self->_completionTime != 0;
}

- (void)reset
{
  self->_completionTime = 0;
}

- (unint64_t)completionTime
{
  return self->_completionTime;
}

- (void)setCompletionTime:(unint64_t)a3
{
  self->_completionTime = a3;
}

@end
