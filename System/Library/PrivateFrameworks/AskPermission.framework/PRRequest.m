@implementation PRRequest

- (PRRequest)initWithAsk:(id)a3 requestInfo:(id)a4
{

  return 0;
}

- (PRRequest)initWithCacheRepresentation:(id)a3
{

  return 0;
}

- (id)cacheRepresentation
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PRRequest)initWithCoder:(id)a3
{

  return 0;
}

- (NSString)requestID
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequestID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)ask
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAsk:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSDictionary)requestInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRequestInfo:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (unint64_t)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(unint64_t)a3
{
  self->_requestStatus = a3;
}

- (NSNumber)requesterDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRequesterDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSNumber)responderDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResponderDSID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)clientIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (BOOL)requestedOnThisDevice
{
  return self->_requestedOnThisDevice;
}

- (void)setRequestedOnThisDevice:(BOOL)a3
{
  self->_requestedOnThisDevice = a3;
}

- (NSDate)dateAddedToLocalCache
{
  return (NSDate *)objc_getProperty(self, a2, 72, 1);
}

- (void)setDateAddedToLocalCache:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 72);
}

- (NSString)statusDescription
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusDescription, 0);
  objc_storeStrong((id *)&self->_dateAddedToLocalCache, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_responderDSID, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_ask, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
