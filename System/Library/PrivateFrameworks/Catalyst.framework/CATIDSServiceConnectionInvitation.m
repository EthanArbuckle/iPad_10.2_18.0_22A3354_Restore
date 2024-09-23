@implementation CATIDSServiceConnectionInvitation

- (CATIDSServiceConnectionInvitation)initWithSenderAppleID:(id)a3 senderAddress:(id)a4 assertion:(id)a5 messagingVersion:(unint64_t)a6 userInfo:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  CATIDSServiceConnectionInvitation *v18;

  v12 = (void *)MEMORY[0x24BDD1880];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[CATIDSServiceConnectionInvitation initWithConnectionIdentifier:senderAppleID:senderAddress:assertion:messagingVersion:userInfo:](self, "initWithConnectionIdentifier:senderAppleID:senderAddress:assertion:messagingVersion:userInfo:", v17, v16, v15, v14, a6, v13);

  return v18;
}

- (CATIDSServiceConnectionInvitation)initWithConnectionIdentifier:(id)a3 senderAppleID:(id)a4 senderAddress:(id)a5 assertion:(id)a6 messagingVersion:(unint64_t)a7 userInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CATIDSServiceConnectionInvitation *v20;
  CATIDSServiceConnectionInvitation *v21;
  uint64_t v22;
  NSString *senderAppleID;
  uint64_t v24;
  NSString *senderAddress;
  uint64_t v26;
  NSDictionary *userInfo;
  objc_super v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v29.receiver = self;
  v29.super_class = (Class)CATIDSServiceConnectionInvitation;
  v20 = -[CATIDSServiceConnectionInvitation init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_connectionIdentifier, a3);
    v22 = objc_msgSend(v16, "copy");
    senderAppleID = v21->_senderAppleID;
    v21->_senderAppleID = (NSString *)v22;

    v24 = objc_msgSend(v17, "copy");
    senderAddress = v21->_senderAddress;
    v21->_senderAddress = (NSString *)v24;

    objc_storeStrong((id *)&v21->_assertion, a6);
    v21->_messagingVersion = a7;
    v26 = objc_msgSend(v19, "copy");
    userInfo = v21->_userInfo;
    v21->_userInfo = (NSDictionary *)v26;

  }
  return v21;
}

- (NSUUID)connectionIdentifier
{
  return self->_connectionIdentifier;
}

- (CATCancelable)assertion
{
  return self->_assertion;
}

- (NSString)senderAppleID
{
  return self->_senderAppleID;
}

- (NSString)senderAddress
{
  return self->_senderAddress;
}

- (unint64_t)messagingVersion
{
  return self->_messagingVersion;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_senderAddress, 0);
  objc_storeStrong((id *)&self->_senderAppleID, 0);
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_connectionIdentifier, 0);
}

@end
