@implementation HMDWatchSync

- (HMDWatchSync)initWithIdentifier:(id)a3 syncOption:(unint64_t)a4 inProgress:(BOOL)a5 isRetry:(BOOL)a6
{
  id v11;
  HMDWatchSync *v12;
  HMDWatchSync *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HMDWatchSync;
  v12 = -[HMDWatchSync init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    v13->_syncOption = a4;
    v13->_inProgress = a5;
    v13->_isRetry = a6;
  }

  return v13;
}

- (HMDWatchSync)initWithSyncOption:(unint64_t)a3
{
  void *v5;
  HMDWatchSync *v6;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDWatchSync initWithIdentifier:syncOption:inProgress:isRetry:](self, "initWithIdentifier:syncOption:inProgress:isRetry:", v5, a3, 0, 0);

  return v6;
}

- (HMDWatchSync)initWithIdentifier:(id)a3 syncOption:(unint64_t)a4
{
  return -[HMDWatchSync initWithIdentifier:syncOption:inProgress:isRetry:](self, "initWithIdentifier:syncOption:inProgress:isRetry:", a3, a4, 0, 1);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  int v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWatchSync identifier](self, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9)
      && (v10 = objc_msgSend(v7, "syncOption"), v10 == -[HMDWatchSync syncOption](self, "syncOption"))
      && (v11 = objc_msgSend(v7, "inProgress"), v11 == -[HMDWatchSync inProgress](self, "inProgress")))
    {
      v14 = objc_msgSend(v7, "isRetry");
      v12 = v14 ^ -[HMDWatchSync isRetry](self, "isRetry") ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }

  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[HMDWatchSync identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[HMDWatchSync syncOption](self, "syncOption") ^ v4;
  v6 = v5 ^ -[HMDWatchSync inProgress](self, "inProgress");
  return v6 ^ -[HMDWatchSync isRetry](self, "isRetry");
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDWatchSync *v4;
  void *v5;
  HMDWatchSync *v6;

  v4 = [HMDWatchSync alloc];
  -[HMDWatchSync identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDWatchSync initWithIdentifier:syncOption:inProgress:isRetry:](v4, "initWithIdentifier:syncOption:inProgress:isRetry:", v5, -[HMDWatchSync syncOption](self, "syncOption"), -[HMDWatchSync inProgress](self, "inProgress"), -[HMDWatchSync isRetry](self, "isRetry"));

  return v6;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDWatchSync identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Identifier"), v4);
  v18[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  v7 = -[HMDWatchSync syncOption](self, "syncOption");
  if (v7 > 2)
    v8 = CFSTR("Unknown watch sync option");
  else
    v8 = off_24E7784B8[v7];
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Sync Option"), v8);
  v18[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDWatchSync inProgress](self, "inProgress");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("In Progress"), v11);
  v18[2] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDWatchSync isRetry](self, "isRetry");
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Is Retry"), v14);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (unint64_t)syncOption
{
  return self->_syncOption;
}

- (void)setSyncOption:(unint64_t)a3
{
  self->_syncOption = a3;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)inProgress
{
  return self->_inProgress;
}

- (void)setInProgress:(BOOL)a3
{
  self->_inProgress = a3;
}

- (BOOL)isRetry
{
  return self->_isRetry;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
