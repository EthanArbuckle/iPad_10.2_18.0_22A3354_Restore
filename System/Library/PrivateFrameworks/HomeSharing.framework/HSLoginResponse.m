@implementation HSLoginResponse

- (unsigned)sessionID
{
  return self->sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->sessionID = a3;
}

@end
