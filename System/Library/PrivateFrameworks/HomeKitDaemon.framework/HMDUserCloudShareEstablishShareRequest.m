@implementation HMDUserCloudShareEstablishShareRequest

- (HMDUserCloudShareEstablishShareRequest)initWithHome:(id)a3 fromUser:(id)a4 toUser:(id)a5 encodedShareURL:(id)a6 shareToken:(id)a7 containerID:(id)a8 currentDate:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  HMDUserCloudShareEstablishShareRequest *v20;
  HMDUserCloudShareEstablishShareRequest *v21;
  uint64_t v22;
  id completion;
  id v25;
  objc_super v26;

  v16 = a4;
  v17 = a5;
  v25 = a6;
  v18 = a7;
  v19 = a10;
  v26.receiver = self;
  v26.super_class = (Class)HMDUserCloudShareEstablishShareRequest;
  v20 = -[HMDUserCloudShareRequest initWithStartDate:containerID:home:](&v26, sel_initWithStartDate_containerID_home_, a9, a8, a3);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_fromUser, v16);
    objc_storeWeak((id *)&v21->_toUser, v17);
    objc_storeStrong((id *)&v21->_encodedShareURL, a6);
    objc_storeStrong((id *)&v21->_shareToken, a7);
    v22 = objc_msgSend(v19, "copy");
    completion = v21->_completion;
    v21->_completion = (id)v22;

  }
  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDUserCloudShareRequest identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserCloudShareRequest containerID](self, "containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDUserCloudShareRequest startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMDUserCloudShareEstablishShareRequest id = %@, container = %@, startDate = %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDUser)fromUser
{
  return (HMDUser *)objc_loadWeakRetained((id *)&self->_fromUser);
}

- (HMDUser)toUser
{
  return (HMDUser *)objc_loadWeakRetained((id *)&self->_toUser);
}

- (NSData)encodedShareURL
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (NSData)shareToken
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (id)completion
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_shareToken, 0);
  objc_storeStrong((id *)&self->_encodedShareURL, 0);
  objc_destroyWeak((id *)&self->_toUser);
  objc_destroyWeak((id *)&self->_fromUser);
}

@end
