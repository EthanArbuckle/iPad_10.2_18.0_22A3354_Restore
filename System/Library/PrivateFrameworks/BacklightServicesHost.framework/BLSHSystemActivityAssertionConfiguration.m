@implementation BLSHSystemActivityAssertionConfiguration

- (BLSHOSInterfaceProviding)osInterfaceProvider
{
  return (BLSHOSInterfaceProviding *)objc_loadWeakRetained((id *)&self->_osInterfaceProvider);
}

- (void)setOSInterfaceProvider:(id)a3
{
  objc_storeWeak((id *)&self->_osInterfaceProvider, a3);
}

- (BOOL)acquireWaitsToAbortSleepRequested
{
  return self->_acquireWaitsToAbortSleepRequested;
}

- (void)setAcquireWaitsToAbortSleepRequested:(BOOL)a3
{
  self->_acquireWaitsToAbortSleepRequested = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_osInterfaceProvider);
}

@end
