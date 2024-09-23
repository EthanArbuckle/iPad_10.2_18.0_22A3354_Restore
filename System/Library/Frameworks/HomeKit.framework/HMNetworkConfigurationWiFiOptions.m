@implementation HMNetworkConfigurationWiFiOptions

- (HMNetworkConfigurationWiFiOptions)initWithCredentialType:(int64_t)a3
{
  HMNetworkConfigurationWiFiOptions *v4;
  HMNetworkConfigurationWiFiOptions *v5;
  objc_super v7;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    v7.receiver = self;
    v7.super_class = (Class)HMNetworkConfigurationWiFiOptions;
    v4 = -[HMNetworkConfigurationWiFiOptions init](&v7, sel_init);
    if (v4)
      v4->_credentialType = a3;
    self = v4;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HMAccessoryWiFiCredentialTypeAsString(self->_credentialType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ CredentialType = %@, Rotate = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)credentialType
{
  return self->_credentialType;
}

- (BOOL)rotate
{
  return self->_rotate;
}

- (void)setRotate:(BOOL)a3
{
  self->_rotate = a3;
}

@end
