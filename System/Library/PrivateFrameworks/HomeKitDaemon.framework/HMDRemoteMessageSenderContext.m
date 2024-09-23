@implementation HMDRemoteMessageSenderContext

- (HMDRemoteMessageSenderContext)initWithDeviceHandle:(id)a3 accountHandle:(id)a4 accountIdentifier:(id)a5 deviceVersion:(id)a6 pairingIdentityIdentifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HMDRemoteMessageSenderContext *v17;
  uint64_t v18;
  HMDDeviceHandle *deviceHandle;
  uint64_t v20;
  HMDAccountHandle *accountHandle;
  uint64_t v22;
  HMDAccountIdentifier *accountIdentifier;
  uint64_t v24;
  HMDHomeKitVersion *deviceVersion;
  uint64_t v26;
  NSString *pairingIdentityIdentifier;
  HMDRemoteMessageSenderContext *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
  {
    v30.receiver = self;
    v30.super_class = (Class)HMDRemoteMessageSenderContext;
    v17 = -[HMDRemoteMessageSenderContext init](&v30, sel_init);
    if (v17)
    {
      v18 = objc_msgSend(v12, "copy");
      deviceHandle = v17->_deviceHandle;
      v17->_deviceHandle = (HMDDeviceHandle *)v18;

      v20 = objc_msgSend(v13, "copy");
      accountHandle = v17->_accountHandle;
      v17->_accountHandle = (HMDAccountHandle *)v20;

      v22 = objc_msgSend(v14, "copy");
      accountIdentifier = v17->_accountIdentifier;
      v17->_accountIdentifier = (HMDAccountIdentifier *)v22;

      v24 = objc_msgSend(v15, "copy");
      deviceVersion = v17->_deviceVersion;
      v17->_deviceVersion = (HMDHomeKitVersion *)v24;

      v26 = objc_msgSend(v16, "copy");
      pairingIdentityIdentifier = v17->_pairingIdentityIdentifier;
      v17->_pairingIdentityIdentifier = (NSString *)v26;

    }
    self = v17;
    v28 = self;
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (NSString)mergeID
{
  void *v2;
  void *v3;

  -[HMDRemoteMessageSenderContext accountIdentifier](self, "accountIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "senderCorrelationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDRemoteMessageSenderContext deviceHandle](self, "deviceHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessageSenderContext accountHandle](self, "accountHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessageSenderContext accountIdentifier](self, "accountIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessageSenderContext deviceVersion](self, "deviceVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteMessageSenderContext pairingIdentityIdentifier](self, "pairingIdentityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Device Handle = %@, Account Handle = %@, Account Identifier = %@, Device Version = %@, Pairing Identity Identifier = %@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (HMDDeviceHandle)deviceHandle
{
  return (HMDDeviceHandle *)objc_getProperty(self, a2, 8, 1);
}

- (HMDDeviceHandle)localDeviceHandle
{
  return (HMDDeviceHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLocalDeviceHandle:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (HMDAccountIdentifier)accountIdentifier
{
  return (HMDAccountIdentifier *)objc_getProperty(self, a2, 24, 1);
}

- (HMDAccountHandle)accountHandle
{
  return (HMDAccountHandle *)objc_getProperty(self, a2, 32, 1);
}

- (HMDHomeKitVersion)deviceVersion
{
  return (HMDHomeKitVersion *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)pairingIdentityIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingIdentityIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceVersion, 0);
  objc_storeStrong((id *)&self->_accountHandle, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_localDeviceHandle, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
}

@end
