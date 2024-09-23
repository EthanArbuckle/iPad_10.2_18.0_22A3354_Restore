@implementation HMDHomeReprovisioningPendingInformation

- (HMDHomeReprovisioningPendingInformation)initWithMessageUUID:(id)a3 networkCredential:(id)a4
{
  id v7;
  id v8;
  HMDHomeReprovisioningPendingInformation *v9;
  HMDHomeReprovisioningPendingInformation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDHomeReprovisioningPendingInformation;
  v9 = -[HMDHomeReprovisioningPendingInformation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageIdentifier, a3);
    objc_storeStrong((id *)&v10->_networkCredential, a4);
  }

  return v10;
}

- (NSUUID)messageIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAccessoryNetworkCredential)networkCredential
{
  return (HMDAccessoryNetworkCredential *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
}

@end
