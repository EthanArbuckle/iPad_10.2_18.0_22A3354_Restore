@implementation BBObserverGatewayAddBulletinRequest

- (NSString)bulletinID
{
  return self->_bulletinID;
}

- (void)setBulletinID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sectionID
{
  return self->_sectionID;
}

- (void)setSectionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_sectionID, 0);
  objc_storeStrong((id *)&self->_bulletinID, 0);
}

@end
