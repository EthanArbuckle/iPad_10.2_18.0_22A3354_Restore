@implementation BLTClientReplyTimeout

- (NSDate)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_timeout, a3);
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
}

@end
