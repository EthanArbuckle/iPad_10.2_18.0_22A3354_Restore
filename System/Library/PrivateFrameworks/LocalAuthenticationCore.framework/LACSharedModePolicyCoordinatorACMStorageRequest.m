@implementation LACSharedModePolicyCoordinatorACMStorageRequest

- (LACSharedModePolicyCoordinatorACMStorageRequest)initWithKey:(int64_t)a3 BOOLValue:(BOOL)a4
{
  LACSharedModePolicyCoordinatorACMStorageRequest *v5;
  LACSharedModePolicyCoordinatorACMStorageRequest *v6;
  uint64_t v7;
  NSData *value;
  NSData *acl;
  LACXPCClient *v10;
  void *v11;
  uint64_t v12;
  LACXPCClient *client;
  NSUUID *contextID;
  int v15;
  objc_super v17;
  BOOL v18;

  v18 = a4;
  v17.receiver = self;
  v17.super_class = (Class)LACSharedModePolicyCoordinatorACMStorageRequest;
  v5 = -[LACSharedModePolicyCoordinatorACMStorageRequest init](&v17, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_domain = 0;
    v5->_key = a3;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v18, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    value = v6->_value;
    v6->_value = (NSData *)v7;

    acl = v6->_acl;
    v6->_acl = 0;

    v10 = [LACXPCClient alloc];
    objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[LACXPCClient initWithConnection:](v10, "initWithConnection:", v11);
    client = v6->_client;
    v6->_client = (LACXPCClient *)v12;

    contextID = v6->_contextID;
    v6->_contextID = 0;

    v15 = identifierCounter++;
    v6->_identifier = v15;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[LACSharedModePolicyCoordinatorACMStorageRequest identifier](self, "identifier");
    if (v6 != objc_msgSend(v5, "identifier"))
      goto LABEL_12;
    v7 = -[LACSharedModePolicyCoordinatorACMStorageRequest key](self, "key");
    if (v7 != objc_msgSend(v5, "key"))
      goto LABEL_12;
    v8 = -[LACSharedModePolicyCoordinatorACMStorageRequest domain](self, "domain");
    if (v8 != objc_msgSend(v5, "domain"))
      goto LABEL_12;
    -[LACSharedModePolicyCoordinatorACMStorageRequest acl](self, "acl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acl");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v10)
    {

    }
    else
    {
      v11 = (void *)v10;
      -[LACSharedModePolicyCoordinatorACMStorageRequest acl](self, "acl");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "acl");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if (!v14)
        goto LABEL_12;
    }
    -[LACSharedModePolicyCoordinatorACMStorageRequest contextID](self, "contextID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contextID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v16 == (void *)v17)
    {

    }
    else
    {
      v18 = (void *)v17;
      -[LACSharedModePolicyCoordinatorACMStorageRequest contextID](self, "contextID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contextID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "isEqual:", v20);

      if (!v21)
      {
LABEL_12:
        v15 = 0;
LABEL_13:

        goto LABEL_14;
      }
    }
    -[LACSharedModePolicyCoordinatorACMStorageRequest value](self, "value");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "value");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v23 == (void *)v24)
    {
      v15 = 1;
      v25 = v23;
    }
    else
    {
      v25 = (void *)v24;
      -[LACSharedModePolicyCoordinatorACMStorageRequest value](self, "value");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v26, "isEqual:", v27);

    }
    goto LABEL_13;
  }
  v15 = 0;
LABEL_14:

  return v15;
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unsigned int)a3
{
  self->_identifier = a3;
}

- (int64_t)key
{
  return self->_key;
}

- (void)setKey:(int64_t)a3
{
  self->_key = a3;
}

- (NSData)acl
{
  return self->_acl;
}

- (void)setAcl:(id)a3
{
  objc_storeStrong((id *)&self->_acl, a3);
}

- (LACXPCClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (NSUUID)contextID
{
  return self->_contextID;
}

- (void)setContextID:(id)a3
{
  objc_storeStrong((id *)&self->_contextID, a3);
}

- (int64_t)domain
{
  return self->_domain;
}

- (void)setDomain:(int64_t)a3
{
  self->_domain = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextID, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_acl, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
