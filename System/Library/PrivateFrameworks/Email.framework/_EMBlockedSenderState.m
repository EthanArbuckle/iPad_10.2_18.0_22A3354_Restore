@implementation _EMBlockedSenderState

- (BOOL)valid
{
  return self->_valid;
}

- (NSSet)blockedSenders
{
  return self->_blockedSenders;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (void)setBlockedSenders:(id)a3
{
  objc_storeStrong((id *)&self->_blockedSenders, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockedSenders, 0);
}

@end
