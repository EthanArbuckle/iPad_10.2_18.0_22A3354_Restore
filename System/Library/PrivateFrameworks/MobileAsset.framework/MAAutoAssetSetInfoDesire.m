@implementation MAAutoAssetSetInfoDesire

- (id)initForClientAssetSetPolicy:(id)a3 reasonDesired:(id)a4 awaitingDownloadOfDiscovered:(BOOL)a5 withCheckWaitTimeout:(int64_t)a6 withLockWaitTimeout:(int64_t)a7 desiringProgress:(BOOL)a8
{
  id v15;
  id v16;
  MAAutoAssetSetInfoDesire *v17;
  MAAutoAssetSetInfoDesire *v18;
  objc_super v20;

  v15 = a3;
  v16 = a4;
  v20.receiver = self;
  v20.super_class = (Class)MAAutoAssetSetInfoDesire;
  v17 = -[MAAutoAssetSetInfoDesire init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_clientAssetSetPolicy, a3);
    objc_storeStrong((id *)&v18->_desireReason, a4);
    v18->_awaitDownloadingOfDiscovered = a5;
    v18->_checkWaitTimeoutSecs = a6;
    v18->_lockWaitTimeoutSecs = a7;
    v18->_downloadProgressDesired = a8;
  }

  return v18;
}

- (MAAutoAssetSetInfoDesire)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetInfoDesire *v5;
  uint64_t v6;
  MAAutoAssetSetPolicy *clientAssetSetPolicy;
  uint64_t v8;
  NSString *desireReason;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MAAutoAssetSetInfoDesire;
  v5 = -[MAAutoAssetSetInfoDesire init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientAssetSetPolicy"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientAssetSetPolicy = v5->_clientAssetSetPolicy;
    v5->_clientAssetSetPolicy = (MAAutoAssetSetPolicy *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desireReason"));
    v8 = objc_claimAutoreleasedReturnValue();
    desireReason = v5->_desireReason;
    v5->_desireReason = (NSString *)v8;

    v5->_awaitDownloadingOfDiscovered = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("awaitDownloadingOfDiscovered"));
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
  id v6;

  v6 = a3;
  -[MAAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("clientAssetSetPolicy"));

  -[MAAutoAssetSetInfoDesire desireReason](self, "desireReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("desireReason"));

  objc_msgSend(v6, "encodeBool:forKey:", -[MAAutoAssetSetInfoDesire awaitDownloadingOfDiscovered](self, "awaitDownloadingOfDiscovered"), CFSTR("awaitDownloadingOfDiscovered"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"), CFSTR("checkWaitTimeoutSecs"));
  objc_msgSend(v6, "encodeInteger:forKey:", -[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"), CFSTR("lockWaitTimeoutSecs"));
  objc_msgSend(v6, "encodeBool:forKey:", -[MAAutoAssetSetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"), CFSTR("downloadProgressDesired"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)summary
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  const __CFString *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  int64_t v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;

  -[MAAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    -[MAAutoAssetSetInfoDesire desireReason](self, "desireReason");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v11 = CFSTR("byPolicy");
      goto LABEL_13;
    }
  }
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetSetInfoDesire clientAssetSetPolicy](self, "clientAssetSetPolicy");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "summary");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = CFSTR("N");
  }
  -[MAAutoAssetSetInfoDesire desireReason](self, "desireReason");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MAAutoAssetSetInfoDesire desireReason](self, "desireReason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR("clientAssetSetPolicy:%@|desireReason:%@"), v8, v10);

  }
  else
  {
    v11 = (__CFString *)objc_msgSend(v6, "initWithFormat:", CFSTR("clientAssetSetPolicy:%@|desireReason:%@"), v8, CFSTR("N"));
  }

  if (v7)
  {

  }
LABEL_13:
  v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), -[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"));
  v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), -[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"));
  if (-[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs"))
  {
    if (-[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs") != -2)
      goto LABEL_18;
    v14 = CFSTR("DEFAULT");
  }
  else
  {
    v14 = CFSTR("NO_WAIT");
  }

  v12 = (__CFString *)v14;
LABEL_18:
  if (!-[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs"))
  {
    v15 = CFSTR("NO_WAIT");
    goto LABEL_24;
  }
  if (-[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs") == -2)
  {
    v15 = CFSTR("DEFAULT");
LABEL_24:

    v13 = (__CFString *)v15;
    goto LABEL_25;
  }
  if (-[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs") == -3)
  {
    v15 = CFSTR("NO_WAIT_NOT_PERSISTED");
    goto LABEL_24;
  }
LABEL_25:
  if (-[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs") == -101
    && -[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs") == -101)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    if (-[MAAutoAssetSetInfoDesire awaitDownloadingOfDiscovered](self, "awaitDownloadingOfDiscovered"))
      v17 = CFSTR("Y");
    else
      v17 = CFSTR("N");
    if (-[MAAutoAssetSetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"))
      v18 = CFSTR("Y");
    else
      v18 = CFSTR("N");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@|awaitDowload:%@|progressDesired:%@"), v11, v17, v18, v28, v29);
  }
  else if (-[MAAutoAssetSetInfoDesire checkWaitTimeoutSecs](self, "checkWaitTimeoutSecs") == -101)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    if (-[MAAutoAssetSetInfoDesire awaitDownloadingOfDiscovered](self, "awaitDownloadingOfDiscovered"))
      v20 = CFSTR("Y");
    else
      v20 = CFSTR("N");
    if (-[MAAutoAssetSetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"))
      v21 = CFSTR("Y");
    else
      v21 = CFSTR("N");
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@|awaitDowload:%@|lockSecs:%@,progressDesired:%@"), v11, v20, v13, v21, v29);
  }
  else
  {
    v22 = -[MAAutoAssetSetInfoDesire lockWaitTimeoutSecs](self, "lockWaitTimeoutSecs");
    v23 = (void *)MEMORY[0x1E0CB3940];
    if (-[MAAutoAssetSetInfoDesire awaitDownloadingOfDiscovered](self, "awaitDownloadingOfDiscovered"))
      v24 = CFSTR("Y");
    else
      v24 = CFSTR("N");
    if (-[MAAutoAssetSetInfoDesire downloadProgressDesired](self, "downloadProgressDesired"))
      v25 = CFSTR("Y");
    else
      v25 = CFSTR("N");
    if (v22 == -101)
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@|awaitDowload:%@|checkSecs:%@,progressDesired:%@"), v11, v24, v12, v25, v29);
    else
      objc_msgSend(v23, "stringWithFormat:", CFSTR("%@|awaitDowload:%@|checkSecs:%@,lockSecs:%@,progressDesired:%@"), v11, v24, v12, v13, v25);
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (MAAutoAssetSetPolicy)clientAssetSetPolicy
{
  return self->_clientAssetSetPolicy;
}

- (NSString)desireReason
{
  return self->_desireReason;
}

- (BOOL)awaitDownloadingOfDiscovered
{
  return self->_awaitDownloadingOfDiscovered;
}

- (int64_t)checkWaitTimeoutSecs
{
  return self->_checkWaitTimeoutSecs;
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
  objc_storeStrong((id *)&self->_clientAssetSetPolicy, 0);
}

@end
