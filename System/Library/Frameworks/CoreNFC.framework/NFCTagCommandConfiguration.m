@implementation NFCTagCommandConfiguration

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setMaximumRetries:", self->_maximumRetries);
  objc_msgSend(v4, "setRetryInterval:", self->_retryInterval);
  return v4;
}

- (NSUInteger)maximumRetries
{
  return self->_maximumRetries;
}

- (void)setMaximumRetries:(NSUInteger)maximumRetries
{
  self->_maximumRetries = maximumRetries;
}

- (NSTimeInterval)retryInterval
{
  return self->_retryInterval;
}

- (void)setRetryInterval:(NSTimeInterval)retryInterval
{
  self->_retryInterval = retryInterval;
}

@end
