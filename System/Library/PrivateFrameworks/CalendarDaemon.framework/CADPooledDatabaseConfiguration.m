@implementation CADPooledDatabaseConfiguration

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (int)inMemoryChangeTrackingClientID
{
  return self->_inMemoryChangeTrackingClientID;
}

- (void)setInMemoryChangeTrackingClientID:(int)a3
{
  self->_inMemoryChangeTrackingClientID = a3;
}

- (BOOL)enablePropertyModificationLogging
{
  return self->_enablePropertyModificationLogging;
}

- (void)setEnablePropertyModificationLogging:(BOOL)a3
{
  self->_enablePropertyModificationLogging = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
}

@end
