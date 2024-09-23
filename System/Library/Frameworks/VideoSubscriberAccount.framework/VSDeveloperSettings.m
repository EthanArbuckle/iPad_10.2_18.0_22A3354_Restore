@implementation VSDeveloperSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setTopBoxIdentityProviderID, 0);
  objc_storeStrong((id *)&self->_setTopBoxUserToken, 0);
  objc_storeStrong((id *)&self->_setTopBoxBundleIdentifier, 0);
}

- (void)setSimulateExpiredToken:(BOOL)a3
{
  self->_simulateExpiredToken = a3;
}

- (void)setSetTopBoxUserToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setSetTopBoxUseDeviceProfile:(BOOL)a3
{
  self->_setTopBoxUseDeviceProfile = a3;
}

- (void)setSetTopBoxSupportsOptOut:(BOOL)a3
{
  self->_setTopBoxSupportsOptOut = a3;
}

- (void)setSetTopBoxIdentityProviderID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setSetTopBoxBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setRequestTimeoutsDisabled:(BOOL)a3
{
  self->_requestTimeoutsDisabled = a3;
}

- (void)setIsInSetTopBoxMode:(BOOL)a3
{
  self->_isInSetTopBoxMode = a3;
}

- (void)setCacheBusterEnabled:(BOOL)a3
{
  self->_cacheBusterEnabled = a3;
}

- (VSDeveloperSettings)init
{
  VSDeveloperSettings *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSDeveloperSettings;
  v2 = -[VSDeveloperSettings init](&v5, sel_init);
  if (v2)
  {
    VSDeveloperSettingsValueType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit(v3, v2);

  }
  return v2;
}

- (void)setDefaults
{
  -[VSDeveloperSettings setIsInSetTopBoxMode:](self, "setIsInSetTopBoxMode:", 0);
  -[VSDeveloperSettings setCacheBusterEnabled:](self, "setCacheBusterEnabled:", 0);
  -[VSDeveloperSettings setRequestTimeoutsDisabled:](self, "setRequestTimeoutsDisabled:", 0);
  -[VSDeveloperSettings setSimulateExpiredToken:](self, "setSimulateExpiredToken:", 0);
  -[VSDeveloperSettings setSetTopBoxBundleIdentifier:](self, "setSetTopBoxBundleIdentifier:", 0);
  -[VSDeveloperSettings setSetTopBoxUserToken:](self, "setSetTopBoxUserToken:", 0);
  -[VSDeveloperSettings setSetTopBoxIdentityProviderID:](self, "setSetTopBoxIdentityProviderID:", 0);
  -[VSDeveloperSettings setSetTopBoxUseDeviceProfile:](self, "setSetTopBoxUseDeviceProfile:", 0);
  -[VSDeveloperSettings setSetTopBoxSupportsOptOut:](self, "setSetTopBoxSupportsOptOut:", 0);
}

- (VSDeveloperSettings)initWithCoder:(id)a3
{
  id v4;
  VSDeveloperSettings *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSDeveloperSettings;
  v5 = -[VSDeveloperSettings init](&v8, sel_init);
  if (v5)
  {
    VSDeveloperSettingsValueType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInitWithCoder(v6, v5, v4);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  VSDeveloperSettingsValueType();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  VSDeveloperSettingsValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  VSDeveloperSettingsValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  VSDeveloperSettingsValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;

  VSDeveloperSettingsValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isInSetTopBoxMode
{
  return self->_isInSetTopBoxMode;
}

- (BOOL)cacheBusterEnabled
{
  return self->_cacheBusterEnabled;
}

- (BOOL)requestTimeoutsDisabled
{
  return self->_requestTimeoutsDisabled;
}

- (BOOL)simulateExpiredToken
{
  return self->_simulateExpiredToken;
}

- (NSString)setTopBoxBundleIdentifier
{
  return self->_setTopBoxBundleIdentifier;
}

- (NSString)setTopBoxUserToken
{
  return self->_setTopBoxUserToken;
}

- (NSString)setTopBoxIdentityProviderID
{
  return self->_setTopBoxIdentityProviderID;
}

- (BOOL)setTopBoxUseDeviceProfile
{
  return self->_setTopBoxUseDeviceProfile;
}

- (BOOL)setTopBoxSupportsOptOut
{
  return self->_setTopBoxSupportsOptOut;
}

@end
