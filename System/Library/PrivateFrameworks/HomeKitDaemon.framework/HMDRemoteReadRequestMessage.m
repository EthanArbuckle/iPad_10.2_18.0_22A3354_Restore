@implementation HMDRemoteReadRequestMessage

- (HMDRemoteReadRequestMessage)initWithReadMessage:(id)a3 accessoryUUID:(id)a4 responseQueue:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDRemoteReadRequestMessage *v12;
  HMDRemoteReadRequestMessage *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDRemoteReadRequestMessage;
  v12 = -[HMDRemoteReadRequestMessage init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_readMessage, a3);
    objc_storeStrong((id *)&v13->_accessoryUUID, a4);
    objc_storeStrong((id *)&v13->_responseQueue, a5);
  }

  return v13;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDRemoteReadRequestMessage readMessage](self, "readMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteReadRequestMessage readMessage](self, "readMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messagePayload");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteReadRequestMessage accessoryUUID](self, "accessoryUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Read identifier: %@, payload: %@, accessory: %@]"), v6, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDRemoteReadRequestMessage readMessage](self, "readMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDRemoteReadRequestMessage accessoryUUID](self, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[Read identifier: %@, accessory: %@]"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMFMessage)readMessage
{
  return self->_readMessage;
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (OS_dispatch_queue)responseQueue
{
  return self->_responseQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseQueue, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_readMessage, 0);
}

@end
