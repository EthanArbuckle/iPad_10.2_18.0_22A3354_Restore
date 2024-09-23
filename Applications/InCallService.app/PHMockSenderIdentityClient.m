@implementation PHMockSenderIdentityClient

- (BOOL)isTTYSoftwareAvailableForSenderIdentityUUID:(id)a3
{
  return -[PHMockSenderIdentityClient mockTTYAvailable](self, "mockTTYAvailable", a3);
}

- (BOOL)mockTTYAvailable
{
  return self->_mockTTYAvailable;
}

- (void)setMockTTYAvailable:(BOOL)a3
{
  self->_mockTTYAvailable = a3;
}

@end
