@implementation HMMMClientRequestHandlerOptions

- (HMMMClientRequestHandlerOptions)initWithPeerDestination:(id)a3 messageName:(id)a4 user:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMMClientRequestHandlerOptions *v12;
  HMMMClientRequestHandlerOptions *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMMMClientRequestHandlerOptions;
  v12 = -[HMMMClientRequestHandlerOptions init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_peerDestination, a3);
    objc_storeStrong((id *)&v13->_messageName, a4);
    objc_storeStrong((id *)&v13->_user, a5);
  }

  return v13;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMMClientRequestHandlerOptions peerDestination](self, "peerDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("PeerDestination"), v4);
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMMClientRequestHandlerOptions messageName](self, "messageName", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("MessageName"), v7);
  v15[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMMClientRequestHandlerOptions user](self, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("UserUUID"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HMMMMessageDestination)peerDestination
{
  return self->_peerDestination;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (HMUser)user
{
  return self->_user;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_peerDestination, 0);
}

@end
