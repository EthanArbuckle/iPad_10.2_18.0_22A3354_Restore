@implementation HMUserCloudShareInvitation

- (HMUserCloudShareInvitation)initWithUser:(id)a3 URL:(id)a4 shareToken:(id)a5 containerID:(id)a6 forHome:(id)a7 fromUser:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HMUserCloudShareInvitation *v20;
  HMUserCloudShareInvitation *v21;
  uint64_t v22;
  NSURL *shareURL;
  uint64_t v24;
  NSString *containerID;
  id v27;
  objc_super v28;

  v27 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)HMUserCloudShareInvitation;
  v20 = -[HMUserCloudShareInvitation init](&v28, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_user, a3);
    v22 = objc_msgSend(v15, "copy");
    shareURL = v21->_shareURL;
    v21->_shareURL = (NSURL *)v22;

    objc_storeStrong((id *)&v21->_shareToken, a5);
    objc_storeStrong((id *)&v21->_fromUser, a8);
    objc_storeStrong((id *)&v21->_home, a7);
    v24 = objc_msgSend(v17, "copy");
    containerID = v21->_containerID;
    v21->_containerID = (NSString *)v24;

  }
  return v21;
}

- (NSURL)shareURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (CKDeviceToDeviceShareInvitationToken)shareToken
{
  return (CKDeviceToDeviceShareInvitationToken *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)containerID
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (HMHome)home
{
  return (HMHome *)objc_getProperty(self, a2, 32, 1);
}

- (HMUser)user
{
  return (HMUser *)objc_getProperty(self, a2, 40, 1);
}

- (HMUser)fromUser
{
  return (HMUser *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromUser, 0);
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_containerID, 0);
  objc_storeStrong((id *)&self->_shareToken, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
}

@end
