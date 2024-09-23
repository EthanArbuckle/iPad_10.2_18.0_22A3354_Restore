@implementation MAAutoAssetInfoDesire

- (MAAutoAssetInfoDesire)initWithDesiredCategory:(id)a3 forClientAssetPolicy:(id)a4 reasonDesired:(id)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  MAAutoAssetInfoDesire *v18;
  MAAutoAssetInfoDesire *v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)MAAutoAssetInfoDesire;
  v18 = -[MAAutoAssetInfoDesire init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_updateCategoryDesiredByClient, a3);
    objc_storeStrong((id *)&v19->_clientAssetPolicy, a4);
    objc_storeStrong((id *)&v19->_desireReason, a5);
    v19->_checkWaitTimeoutSecs = a6;
    v19->_lockWaitTimeoutSecs = a7;
    v19->_downloadProgressDesired = a8;
  }

  return v19;
}

- (MAAutoAssetInfoDesire)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetInfoDesire *v5;
  uint64_t v6;
  NSString *updateCategoryDesiredByClient;
  uint64_t v8;
  MAAutoAssetPolicy *clientAssetPolicy;
  uint64_t v10;
  NSString *desireReason;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAAutoAssetInfoDesire;
  v5 = -[MAAutoAssetInfoDesire init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("updateCategoryDesiredByClient"));
    v6 = objc_claimAutoreleasedReturnValue();
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientAssetPolicy"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientAssetPolicy = v5->_clientAssetPolicy;
    v5->_clientAssetPolicy = (MAAutoAssetPolicy *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desireReason"));
    v10 = objc_claimAutoreleasedReturnValue();
    desireReason = v5->_desireReason;
    v5->_desireReason = (NSString *)v10;

    v5->_checkWaitTimeoutSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("checkWaitTimeoutSecs"));
    v5->_lockWaitTimeoutSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("lockWaitTimeoutSecs"));
    v5->_downloadProgressDesired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadProgressDesired"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("updateCategoryDesiredByClient"));

  -[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("clientAssetPolicy"));

  -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("desireReason"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"), CFSTR("checkWaitTimeoutSecs"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"), CFSTR("lockWaitTimeoutSecs"));
  objc_msgSend(v7, "encodeBool:forKey:", -[MAAutoAssetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"), CFSTR("downloadProgressDesired"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
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
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  _BOOL4 v20;
  const __CFString *v21;
  void *v22;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", &stru_1E5D5F930);
  -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4
    || (-[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy"),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(v3, "appendString:", CFSTR("byPolicy"));
      goto LABEL_17;
    }
  }
  -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v13);
      goto LABEL_16;
    }
  }
  -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MAAutoAssetInfoDesire updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("categ:%@"), v8);

  }
  -[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[MAAutoAssetInfoDesire clientAssetPolicy](self, "clientAssetPolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "summary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("policy:%@"), v11);

  }
  -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[MAAutoAssetInfoDesire desireReason](self, "desireReason");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("|%@"), v13);
LABEL_16:

  }
LABEL_17:
  v15 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), -[MAAutoAssetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"));
  v16 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), -[MAAutoAssetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"));
  if (-[MAAutoAssetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"))
  {
    if (-[MAAutoAssetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs") != -2)
      goto LABEL_22;
    v17 = CFSTR("DEFAULT");
  }
  else
  {
    v17 = CFSTR("NO_WAIT");
  }

  v15 = (__CFString *)v17;
LABEL_22:
  if (-[MAAutoAssetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"))
  {
    if (-[MAAutoAssetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs") != -2)
      goto LABEL_27;
    v18 = CFSTR("DEFAULT");
  }
  else
  {
    v18 = CFSTR("NO_WAIT");
  }

  v16 = (__CFString *)v18;
LABEL_27:
  v19 = (void *)MEMORY[0x1E0CB3940];
  v20 = -[MAAutoAssetInfoDesire downloadProgressDesired](self, "downloadProgressDesired");
  v21 = CFSTR("N");
  if (v20)
    v21 = CFSTR("Y");
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@|checkSecs:%@,lockSecs:%@,prog:%@"), v3, v15, v16, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (MAAutoAssetPolicy)clientAssetPolicy
{
  return self->_clientAssetPolicy;
}

- (int64_t)checkWaitTimeoutSecs
{
  return self->_checkWaitTimeoutSecs;
}

- (NSString)desireReason
{
  return self->_desireReason;
}

- (int64_t)lockWaitTimeoutSecs
{
  return self->_lockWaitTimeoutSecs;
}

- (BOOL)downloadProgressDesired
{
  return self->_downloadProgressDesired;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desireReason, 0);
  objc_storeStrong((id *)&self->_clientAssetPolicy, 0);
  objc_storeStrong((id *)&self->_updateCategoryDesiredByClient, 0);
}

@end
