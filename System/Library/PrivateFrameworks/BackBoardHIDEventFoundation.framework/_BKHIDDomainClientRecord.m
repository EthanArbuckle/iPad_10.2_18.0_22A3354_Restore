@implementation _BKHIDDomainClientRecord

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong(&self->_userInfo, a3);
}

- (BOOL)responsePending
{
  return self->_responsePending;
}

- (void)setResponsePending:(BOOL)a3
{
  self->_responsePending = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfo, 0);
}

@end
