@implementation HMDCoreDataCloudShareInvitation

- (HMDCoreDataCloudShareInvitation)initWithURL:(id)a3 token:(id)a4
{
  id v7;
  id v8;
  HMDCoreDataCloudShareInvitation *v9;
  HMDCoreDataCloudShareInvitation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCoreDataCloudShareInvitation;
  v9 = -[HMDCoreDataCloudShareInvitation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_token, a4);
  }

  return v10;
}

- (NSDictionary)content
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  -[HMDCoreDataCloudShareInvitation url](self, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  -[HMDCoreDataCloudShareInvitation token](self, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSURL)url
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (CKDeviceToDeviceShareInvitationToken)token
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
