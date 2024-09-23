@implementation HMDModernTransportMessageContextOptionsBuilder

- (NSSet)transports
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTransports:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (double)timeoutOverride
{
  return self->_timeoutOverride;
}

- (void)setTimeoutOverride:(double)a3
{
  self->_timeoutOverride = a3;
}

- (double)timeToLive
{
  return self->_timeToLive;
}

- (void)setTimeToLive:(double)a3
{
  self->_timeToLive = a3;
}

- (BOOL)expectsMultipleResponses
{
  return self->_expectsMultipleResponses;
}

- (void)setExpectsMultipleResponses:(BOOL)a3
{
  self->_expectsMultipleResponses = a3;
}

- (BOOL)trackingDeviceReachability
{
  return self->_trackingDeviceReachability;
}

- (void)setTrackingDeviceReachability:(BOOL)a3
{
  self->_trackingDeviceReachability = a3;
}

- (BOOL)expectRapportSuccess
{
  return self->_expectRapportSuccess;
}

- (void)setExpectRapportSuccess:(BOOL)a3
{
  self->_expectRapportSuccess = a3;
}

- (NSString)requestStartTimeHeaderKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRequestStartTimeHeaderKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)timeToLiveHeaderKey
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTimeToLiveHeaderKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToLiveHeaderKey, 0);
  objc_storeStrong((id *)&self->_requestStartTimeHeaderKey, 0);
  objc_storeStrong((id *)&self->_transports, 0);
}

@end
