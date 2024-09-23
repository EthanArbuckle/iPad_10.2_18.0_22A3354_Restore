@implementation CKDPCSKeySyncCoreAnalytics

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
  objc_storeStrong((id *)&self->_serviceName, a3);
}

- (NSNumber)shouldThrottle
{
  return self->_shouldThrottle;
}

- (void)setShouldThrottle:(id)a3
{
  objc_storeStrong((id *)&self->_shouldThrottle, a3);
}

- (NSNumber)isManatee
{
  return self->_isManatee;
}

- (void)setIsManatee:(id)a3
{
  objc_storeStrong((id *)&self->_isManatee, a3);
}

- (NSString)keySyncResult
{
  return self->_keySyncResult;
}

- (void)setKeySyncResult:(id)a3
{
  objc_storeStrong((id *)&self->_keySyncResult, a3);
}

- (NSString)overallResult
{
  return self->_overallResult;
}

- (void)setOverallResult:(id)a3
{
  objc_storeStrong((id *)&self->_overallResult, a3);
}

- (NSNumber)keySyncDurationSec
{
  return self->_keySyncDurationSec;
}

- (void)setKeySyncDurationSec:(id)a3
{
  objc_storeStrong((id *)&self->_keySyncDurationSec, a3);
}

- (NSNumber)throttledDurationSec
{
  return self->_throttledDurationSec;
}

- (void)setThrottledDurationSec:(id)a3
{
  objc_storeStrong((id *)&self->_throttledDurationSec, a3);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSNumber)KRSReturnedExistingIdentity
{
  return self->_KRSReturnedExistingIdentity;
}

- (void)setKRSReturnedExistingIdentity:(id)a3
{
  self->_KRSReturnedExistingIdentity = (NSNumber *)a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_throttledDurationSec, 0);
  objc_storeStrong((id *)&self->_keySyncDurationSec, 0);
  objc_storeStrong((id *)&self->_overallResult, 0);
  objc_storeStrong((id *)&self->_keySyncResult, 0);
  objc_storeStrong((id *)&self->_isManatee, 0);
  objc_storeStrong((id *)&self->_shouldThrottle, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end
