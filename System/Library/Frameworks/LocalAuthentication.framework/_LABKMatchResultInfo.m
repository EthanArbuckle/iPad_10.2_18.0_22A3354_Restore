@implementation _LABKMatchResultInfo

- (BKIdentity)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_identity, a3);
}

- (int64_t)lockoutState
{
  return self->_lockoutState;
}

- (void)setLockoutState:(int64_t)a3
{
  self->_lockoutState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
