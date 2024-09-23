@implementation HMDUnpairedHAPAccessoryConfiguration

- (NSString)setupCode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSetupCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (id)setupCodeProvider
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setSetupCodeProvider:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (BOOL)requiresUserConsent
{
  return self->_requiresUserConsent;
}

- (void)setRequiresUserConsent:(BOOL)a3
{
  self->_requiresUserConsent = a3;
}

- (HMDAccessoryNetworkCredential)networkCredential
{
  return (HMDAccessoryNetworkCredential *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNetworkCredential:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)isoCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSNumber)chipFabricID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setChipFabricID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSUUID)homeUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_chipFabricID, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong(&self->_setupCodeProvider, 0);
  objc_storeStrong((id *)&self->_setupCode, 0);
}

@end
