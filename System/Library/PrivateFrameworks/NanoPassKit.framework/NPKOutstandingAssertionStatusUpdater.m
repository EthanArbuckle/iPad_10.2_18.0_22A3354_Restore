@implementation NPKOutstandingAssertionStatusUpdater

- (NSUUID)assertionUUID
{
  return self->_assertionUUID;
}

- (void)setAssertionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_assertionUUID, a3);
}

- (int)assertType
{
  return self->_assertType;
}

- (void)setAssertType:(int)a3
{
  self->_assertType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertionUUID, 0);
}

@end
