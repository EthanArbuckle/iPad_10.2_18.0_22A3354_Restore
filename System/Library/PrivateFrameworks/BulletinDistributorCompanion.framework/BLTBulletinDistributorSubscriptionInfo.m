@implementation BLTBulletinDistributorSubscriptionInfo

- (BOOL)fullBulletins
{
  return self->_fullBulletins;
}

- (void)setFullBulletins:(BOOL)a3
{
  self->_fullBulletins = a3;
}

- (BOOL)ack
{
  return self->_ack;
}

- (void)setAck:(BOOL)a3
{
  self->_ack = a3;
}

- (BOOL)ackAllowedOnLocalConnection
{
  return self->_ackAllowedOnLocalConnection;
}

- (void)setAckAllowedOnLocalConnection:(BOOL)a3
{
  self->_ackAllowedOnLocalConnection = a3;
}

@end
