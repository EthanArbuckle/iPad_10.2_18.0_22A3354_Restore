@implementation HMMMClientResponseHandlerOptions

- (HMMMClientResponseHandlerOptions)initWithPeerDestination:(id)a3 messageName:(id)a4
{
  id v7;
  id v8;
  HMMMClientResponseHandlerOptions *v9;
  HMMMClientResponseHandlerOptions *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMMClientResponseHandlerOptions;
  v9 = -[HMMMClientResponseHandlerOptions init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_peerDestination, a3);
    objc_storeStrong((id *)&v10->_messageName, a4);
  }

  return v10;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMMClientResponseHandlerOptions peerDestination](self, "peerDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("PeerDestination"), v4);
  v11[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMMMClientResponseHandlerOptions messageName](self, "messageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("MessageName"), v7);
  v11[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMMMMessageDestination)peerDestination
{
  return self->_peerDestination;
}

- (NSString)messageName
{
  return self->_messageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageName, 0);
  objc_storeStrong((id *)&self->_peerDestination, 0);
}

@end
