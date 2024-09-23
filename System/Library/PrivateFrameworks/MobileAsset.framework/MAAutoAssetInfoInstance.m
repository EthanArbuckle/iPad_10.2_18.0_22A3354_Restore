@implementation MAAutoAssetInfoInstance

- (id)initForClientName:(id)a3 withProcessName:(id)a4 withProcessID:(int64_t)a5 usingAssetSelector:(id)a6 associatingFrameworkUUID:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  MAAutoAssetInfoInstance *v17;
  MAAutoAssetInfoInstance *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetInfoInstance;
  v17 = -[MAAutoAssetInfoInstance init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_autoAssetClientName, a3);
    objc_storeStrong((id *)&v18->_clientProcessName, a4);
    v18->_clientProcessID = a5;
    objc_storeStrong((id *)&v18->_clientAssetSelector, a6);
    objc_storeStrong((id *)&v18->_frameworkInstanceUUID, a7);
  }

  return v18;
}

- (MAAutoAssetInfoInstance)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetInfoInstance *v5;
  uint64_t v6;
  NSString *autoAssetClientName;
  uint64_t v8;
  NSString *clientProcessName;
  uint64_t v10;
  MAAutoAssetSelector *clientAssetSelector;
  uint64_t v12;
  NSUUID *frameworkInstanceUUID;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetInfoInstance;
  v5 = -[MAAutoAssetInfoInstance init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoAssetClientName"));
    v6 = objc_claimAutoreleasedReturnValue();
    autoAssetClientName = v5->_autoAssetClientName;
    v5->_autoAssetClientName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientProcessName"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v8;

    v5->_clientProcessID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientProcessID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientAssetSelector"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientAssetSelector = v5->_clientAssetSelector;
    v5->_clientAssetSelector = (MAAutoAssetSelector *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameworkInstanceUUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    frameworkInstanceUUID = v5->_frameworkInstanceUUID;
    v5->_frameworkInstanceUUID = (NSUUID *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[MAAutoAssetInfoInstance autoAssetClientName](self, "autoAssetClientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("autoAssetClientName"));

  -[MAAutoAssetInfoInstance clientProcessName](self, "clientProcessName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("clientProcessName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetInfoInstance clientProcessID](self, "clientProcessID"), CFSTR("clientProcessID"));
  -[MAAutoAssetInfoInstance clientAssetSelector](self, "clientAssetSelector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("clientAssetSelector"));

  -[MAAutoAssetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("frameworkInstanceUUID"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetInfoInstance summary](self, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@|%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetInfoInstance autoAssetClientName](self, "autoAssetClientName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetInfoInstance clientAssetSelector](self, "clientAssetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetInfoInstance clientProcessName](self, "clientProcessName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@(%@)%@:%ld"), v4, v6, v7, -[MAAutoAssetInfoInstance clientProcessID](self, "clientProcessID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (MAAutoAssetSelector)clientAssetSelector
{
  return self->_clientAssetSelector;
}

- (NSUUID)frameworkInstanceUUID
{
  return self->_frameworkInstanceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkInstanceUUID, 0);
  objc_storeStrong((id *)&self->_clientAssetSelector, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_autoAssetClientName, 0);
}

@end
