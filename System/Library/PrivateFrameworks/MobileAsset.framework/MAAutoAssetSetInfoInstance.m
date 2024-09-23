@implementation MAAutoAssetSetInfoInstance

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 withProcessName:(id)a5 withProcessID:(int64_t)a6 forAssetSetIdentifier:(id)a7 forAtomicInstance:(id)a8 comprisedOfEntries:(id)a9 asEntriesWhenTargeting:(id)a10 associatingFrameworkUUID:(id)a11
{
  id v17;
  MAAutoAssetSetInfoInstance *v18;
  MAAutoAssetSetInfoInstance *v19;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v28 = a3;
  v27 = a4;
  v26 = a5;
  v25 = a7;
  v24 = a8;
  v23 = a9;
  v22 = a10;
  v17 = a11;
  v29.receiver = self;
  v29.super_class = (Class)MAAutoAssetSetInfoInstance;
  v18 = -[MAAutoAssetSetInfoInstance init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientDomainName, a3);
    objc_storeStrong((id *)&v19->_autoAssetSetClientName, a4);
    objc_storeStrong((id *)&v19->_clientProcessName, a5);
    v19->_clientProcessID = a6;
    objc_storeStrong((id *)&v19->_assetSetIdentifier, a7);
    objc_storeStrong((id *)&v19->_atomicInstance, a8);
    objc_storeStrong((id *)&v19->_autoAssetEntries, a9);
    objc_storeStrong((id *)&v19->_entriesWhenTargeting, a10);
    objc_storeStrong((id *)&v19->_frameworkInstanceUUID, a11);
  }

  return v19;
}

- (MAAutoAssetSetInfoInstance)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetInfoInstance *v5;
  uint64_t v6;
  NSString *clientDomainName;
  uint64_t v8;
  NSString *autoAssetSetClientName;
  uint64_t v10;
  NSString *clientProcessName;
  uint64_t v12;
  NSString *assetSetIdentifier;
  uint64_t v14;
  NSString *atomicInstance;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *autoAssetEntries;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *entriesWhenTargeting;
  uint64_t v26;
  NSUUID *frameworkInstanceUUID;
  objc_super v29;
  _QWORD v30[4];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)MAAutoAssetSetInfoInstance;
  v5 = -[MAAutoAssetSetInfoInstance init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDomainName"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("autoAssetSetClientName"));
    v8 = objc_claimAutoreleasedReturnValue();
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientProcessName"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v10;

    v5->_clientProcessID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientProcessID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSetIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("atomicInstance"));
    v14 = objc_claimAutoreleasedReturnValue();
    atomicInstance = v5->_atomicInstance;
    v5->_atomicInstance = (NSString *)v14;

    v16 = objc_alloc(MEMORY[0x1E0C99E60]);
    v31[0] = objc_opt_class();
    v31[1] = objc_opt_class();
    v31[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithArray:", v17);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("autoAssetEntries"));
    v19 = objc_claimAutoreleasedReturnValue();
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v19;

    v21 = objc_alloc(MEMORY[0x1E0C99E60]);
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithArray:", v22);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("entriesWhenTargeting"));
    v24 = objc_claimAutoreleasedReturnValue();
    entriesWhenTargeting = v5->_entriesWhenTargeting;
    v5->_entriesWhenTargeting = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frameworkInstanceUUID"));
    v26 = objc_claimAutoreleasedReturnValue();
    frameworkInstanceUUID = v5->_frameworkInstanceUUID;
    v5->_frameworkInstanceUUID = (NSUUID *)v26;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[MAAutoAssetSetInfoInstance clientDomainName](self, "clientDomainName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientDomainName"));

  -[MAAutoAssetSetInfoInstance autoAssetSetClientName](self, "autoAssetSetClientName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("autoAssetSetClientName"));

  -[MAAutoAssetSetInfoInstance clientProcessName](self, "clientProcessName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("clientProcessName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetInfoInstance clientProcessID](self, "clientProcessID"), CFSTR("clientProcessID"));
  -[MAAutoAssetSetInfoInstance assetSetIdentifier](self, "assetSetIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("assetSetIdentifier"));

  -[MAAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("atomicInstance"));

  -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("autoAssetEntries"));

  -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("entriesWhenTargeting"));

  -[MAAutoAssetSetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("frameworkInstanceUUID"));

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
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetInfoInstance summary](self, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInfoInstance frameworkInstanceUUID](self, "frameworkInstanceUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v3)
  {
    -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v4)
    {
      -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "description");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@|%@\nautoAssetEntries:\n%@\nentriesWhenTargeting:\n%@"), v6, v8, v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@|%@\nautoAssetEntries:\n%@"), v6, v8, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    if (!v4)
    {
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@|%@"), v6, v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@|%@\nentriesWhenTargeting:\n%@"), v6, v8, v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v14;
}

- (id)summary
{
  int64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;
  __CFString *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int64_t v17;
  int64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;

  v20 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetInfoInstance clientDomainName](self, "clientDomainName");
  v21 = objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInfoInstance autoAssetSetClientName](self, "autoAssetSetClientName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInfoInstance clientProcessName](self, "clientProcessName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MAAutoAssetSetInfoInstance clientProcessID](self, "clientProcessID");
  -[MAAutoAssetSetInfoInstance assetSetIdentifier](self, "assetSetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetSetInfoInstance atomicInstance](self, "atomicInstance");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("N");
  }
  -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetInfoInstance autoAssetEntries](self, "autoAssetEntries");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (__CFString *)objc_msgSend(v8, "initWithFormat:", CFSTR("%ld"), objc_msgSend(v19, "count"));
  }
  else
  {
    v9 = CFSTR("N");
  }
  -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetSetInfoInstance entriesWhenTargeting](self, "entriesWhenTargeting");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%ld"), objc_msgSend(v12, "count"));
    v17 = v3;
    v14 = (void *)v21;
    objc_msgSend(v20, "stringWithFormat:", CFSTR("domainName:%@|clientName:%@|processName:%@|pid:%ld|setIdentifier:%@|atomicInstance:%@|entries:%@(WhenTargeting:%@)"), v21, v23, v22, v17, v4, v6, v9, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v3;
    v14 = (void *)v21;
    objc_msgSend(v20, "stringWithFormat:", CFSTR("domainName:%@|clientName:%@|processName:%@|pid:%ld|setIdentifier:%@|atomicInstance:%@|entries:%@(WhenTargeting:%@)"), v21, v23, v22, v18, v4, v6, v9, CFSTR("N"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v7)
  {

  }
  if (v5)

  return v15;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (NSString)autoAssetSetClientName
{
  return self->_autoAssetSetClientName;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (NSString)atomicInstance
{
  return self->_atomicInstance;
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (NSArray)entriesWhenTargeting
{
  return self->_entriesWhenTargeting;
}

- (NSUUID)frameworkInstanceUUID
{
  return self->_frameworkInstanceUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frameworkInstanceUUID, 0);
  objc_storeStrong((id *)&self->_entriesWhenTargeting, 0);
  objc_storeStrong((id *)&self->_autoAssetEntries, 0);
  objc_storeStrong((id *)&self->_atomicInstance, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_autoAssetSetClientName, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end
