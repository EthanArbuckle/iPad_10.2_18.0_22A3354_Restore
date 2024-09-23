@implementation MTRCommissioningParameters

- (NSData)csrNonce
{
  return self->_csrNonce;
}

- (void)setCsrNonce:(NSData *)csrNonce
{
  objc_setProperty_nonatomic_copy(self, a2, csrNonce, 16);
}

- (NSData)attestationNonce
{
  return self->_attestationNonce;
}

- (void)setAttestationNonce:(NSData *)attestationNonce
{
  objc_setProperty_nonatomic_copy(self, a2, attestationNonce, 24);
}

- (NSData)wifiSSID
{
  return self->_wifiSSID;
}

- (void)setWifiSSID:(NSData *)wifiSSID
{
  objc_setProperty_nonatomic_copy(self, a2, wifiSSID, 32);
}

- (NSData)wifiCredentials
{
  return self->_wifiCredentials;
}

- (void)setWifiCredentials:(NSData *)wifiCredentials
{
  objc_setProperty_nonatomic_copy(self, a2, wifiCredentials, 40);
}

- (NSData)threadOperationalDataset
{
  return self->_threadOperationalDataset;
}

- (void)setThreadOperationalDataset:(NSData *)threadOperationalDataset
{
  objc_setProperty_nonatomic_copy(self, a2, threadOperationalDataset, 48);
}

- (id)deviceAttestationDelegate
{
  return self->_deviceAttestationDelegate;
}

- (void)setDeviceAttestationDelegate:(id)deviceAttestationDelegate
{
  objc_storeStrong((id *)&self->_deviceAttestationDelegate, deviceAttestationDelegate);
}

- (NSNumber)failSafeTimeout
{
  return self->_failSafeTimeout;
}

- (void)setFailSafeTimeout:(NSNumber *)failSafeTimeout
{
  objc_setProperty_nonatomic_copy(self, a2, failSafeTimeout, 64);
}

- (BOOL)skipCommissioningComplete
{
  return self->_skipCommissioningComplete;
}

- (void)setSkipCommissioningComplete:(BOOL)skipCommissioningComplete
{
  self->_skipCommissioningComplete = skipCommissioningComplete;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(NSString *)countryCode
{
  objc_setProperty_nonatomic_copy(self, a2, countryCode, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_failSafeTimeout, 0);
  objc_storeStrong((id *)&self->_deviceAttestationDelegate, 0);
  objc_storeStrong((id *)&self->_threadOperationalDataset, 0);
  objc_storeStrong((id *)&self->_wifiCredentials, 0);
  objc_storeStrong((id *)&self->_wifiSSID, 0);
  objc_storeStrong((id *)&self->_attestationNonce, 0);
  objc_storeStrong((id *)&self->_csrNonce, 0);
}

- (void)setFailSafeExpiryTimeoutSecs:(NSNumber *)failSafeExpiryTimeoutSecs
{
  MEMORY[0x24BEDD108](self, sel_setFailSafeTimeout_, failSafeExpiryTimeoutSecs);
}

@end
