@implementation HMDNewPairedAccessoryServerInfo

- (HMDNewPairedAccessoryServerInfo)initWithServer:(id)a3 primaryAccessoryUUID:(id)a4 certificationStatus:(int64_t)a5 hostAccessory:(id)a6 networkCredential:(id)a7 pairingEvent:(id)a8
{
  id v15;
  id v16;
  id v17;
  HMDNewPairedAccessoryServerInfo *v18;
  HMDNewPairedAccessoryServerInfo *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a3;
  v21 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HMDNewPairedAccessoryServerInfo;
  v18 = -[HMDNewPairedAccessoryServerInfo init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_server, a3);
    objc_storeStrong((id *)&v19->_primaryAccessoryUUID, a4);
    v19->_certificationStatus = a5;
    objc_storeStrong((id *)&v19->_networkCredential, a7);
    objc_storeStrong((id *)&v19->_hostAccessory, a6);
    objc_storeStrong((id *)&v19->_pairingEvent, a8);
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v10.receiver = self;
  v10.super_class = (Class)HMDNewPairedAccessoryServerInfo;
  -[HMDNewPairedAccessoryServerInfo description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNewPairedAccessoryServerInfo primaryAccessoryUUID](self, "primaryAccessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDNewPairedAccessoryServerInfo server](self, "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@/%@]"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HAPAccessoryServer)server
{
  return (HAPAccessoryServer *)objc_getProperty(self, a2, 8, 1);
}

- (NSUUID)primaryAccessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (MKFAccessory)hostAccessory
{
  return (MKFAccessory *)objc_getProperty(self, a2, 24, 1);
}

- (int64_t)certificationStatus
{
  return self->_certificationStatus;
}

- (HMDAccessoryNetworkCredential)networkCredential
{
  return (HMDAccessoryNetworkCredential *)objc_getProperty(self, a2, 40, 1);
}

- (HMDAccessoryPairingEvent)pairingEvent
{
  return (HMDAccessoryPairingEvent *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pairingEvent, 0);
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong((id *)&self->_hostAccessory, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryUUID, 0);
  objc_storeStrong((id *)&self->_server, 0);
}

@end
