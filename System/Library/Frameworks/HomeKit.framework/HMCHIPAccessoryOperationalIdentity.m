@implementation HMCHIPAccessoryOperationalIdentity

- (HMCHIPAccessoryOperationalIdentity)initWithRootPublicKey:(id)a3 nodeID:(id)a4
{
  id v7;
  id v8;
  HMCHIPAccessoryOperationalIdentity *v9;
  HMCHIPAccessoryOperationalIdentity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMCHIPAccessoryOperationalIdentity;
  v9 = -[HMCHIPAccessoryOperationalIdentity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_rootPublicKey, a3);
    objc_storeStrong((id *)&v10->_nodeID, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMCHIPAccessoryOperationalIdentity rootPublicKey](self, "rootPublicKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootPublicKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToData:", v8))
    {
      -[HMCHIPAccessoryOperationalIdentity nodeID](self, "nodeID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "nodeID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMCHIPAccessoryOperationalIdentity rootPublicKey](self, "rootPublicKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMCHIPAccessoryOperationalIdentity nodeID](self, "nodeID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D28548]);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[HMCHIPAccessoryOperationalIdentity rootPublicKey](self, "rootPublicKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("rootPublicKey Hash"), v7);
  objc_msgSend(v3, "addObject:", v8);

  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCHIPAccessoryOperationalIdentity nodeID](self, "nodeID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("NodeID"), v10);
  objc_msgSend(v3, "addObject:", v11);

  v12 = (void *)objc_msgSend(v3, "copy");
  return (NSArray *)v12;
}

- (NSData)rootPublicKey
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)nodeID
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeID, 0);
  objc_storeStrong((id *)&self->_rootPublicKey, 0);
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
