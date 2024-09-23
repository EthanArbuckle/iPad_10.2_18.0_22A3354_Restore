@implementation MAAutoAssetSetSummary

- (MAAutoAssetSetSummary)initWithDomainName:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetRepresentation:(int64_t)a5 withSetJobStatus:(id)a6 withScheduledIntervalSecs:(int64_t)a7 withScheduledRemainingSecs:(int64_t)a8 withPushDelaySecs:(int64_t)a9 withActiveClientCount:(int64_t)a10 withActiveMonitorCount:(int64_t)a11 withMaximumClientCount:(int64_t)a12 withTotalClientCount:(int64_t)a13
{
  id v20;
  id v21;
  id v22;
  MAAutoAssetSetSummary *v23;
  MAAutoAssetSetSummary *v24;
  objc_super v26;

  v20 = a3;
  v21 = a4;
  v22 = a6;
  v26.receiver = self;
  v26.super_class = (Class)MAAutoAssetSetSummary;
  v23 = -[MAAutoAssetSetSummary init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_clientDomainName, a3);
    objc_storeStrong((id *)&v24->_assetSetIdentifier, a4);
    v24->_assetSetRepresentation = a5;
    objc_storeStrong((id *)&v24->_setJobStatus, a6);
    v24->_scheduledIntervalSecs = a7;
    v24->_scheduledRemainingSecs = a8;
    v24->_pushDelaySecs = a9;
    v24->_activeClientCount = a10;
    v24->_activeMonitorCount = a11;
    v24->_maximumClientCount = a12;
    v24->_totalClientCount = a13;
  }

  return v24;
}

- (MAAutoAssetSetSummary)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetSummary *v5;
  uint64_t v6;
  NSString *clientDomainName;
  uint64_t v8;
  NSString *assetSetIdentifier;
  uint64_t v10;
  MAAutoAssetSetStatus *setJobStatus;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MAAutoAssetSetSummary;
  v5 = -[MAAutoAssetSetSummary init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDomainName"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSetIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v8;

    v5->_assetSetRepresentation = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("assetSetRepresentation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("setJobStatus"));
    v10 = objc_claimAutoreleasedReturnValue();
    setJobStatus = v5->_setJobStatus;
    v5->_setJobStatus = (MAAutoAssetSetStatus *)v10;

    v5->_scheduledIntervalSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduledIntervalSecs"));
    v5->_scheduledRemainingSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduledRemainingSecs"));
    v5->_pushDelaySecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pushDelaySecs"));
    v5->_activeClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeClientCount"));
    v5->_activeMonitorCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeMonitorCount"));
    v5->_maximumClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumClientCount"));
    v5->_totalClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalClientCount"));
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
  -[MAAutoAssetSetSummary clientDomainName](self, "clientDomainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("clientDomainName"));

  -[MAAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("assetSetIdentifier"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary assetSetRepresentation](self, "assetSetRepresentation"), CFSTR("assetSetRepresentation"));
  -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("setJobStatus"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"), CFSTR("scheduledIntervalSecs"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"), CFSTR("pushDelaySecs"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"), CFSTR("scheduledRemainingSecs"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount"), CFSTR("activeClientCount"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"), CFSTR("activeMonitorCount"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"), CFSTR("maximumClientCount"));
  objc_msgSend(v7, "encodeInteger:forKey:", -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount"), CFSTR("totalClientCount"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetSummary clientDomainName](self, "clientDomainName");
  v26 = objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier");
  v25 = objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary assetSetRepresentationName](self, "assetSetRepresentationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs");
  v5 = -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs");
  v6 = -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs");
  v7 = -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount");
  v8 = -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount");
  v9 = -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount");
  v10 = -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount");
  -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "description");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v3;
    v15 = (void *)v13;
    v22 = v10;
    v20 = v8;
    v16 = (void *)v25;
    v17 = (void *)v26;
    objc_msgSend(v14, "stringWithFormat:", CFSTR(">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          assetSetRepresentation: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n%@<<<]"), v26, v25, v4, v24, v5, v6, v7, v20, v9, v22, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v10;
    v21 = v8;
    v16 = (void *)v25;
    v17 = (void *)v26;
    objc_msgSend(v3, "stringWithFormat:", CFSTR(">>>\n                clientDomainName: %@\n              assetSetIdentifier: %@\n          assetSetRepresentation: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n%@<<<]"), v26, v25, v4, v24, v5, v6, v7, v21, v9, v23, CFSTR("                    setJobStatus: N\n"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
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
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;

  -[MAAutoAssetSetSummary clientDomainName](self, "clientDomainName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary assetSetRepresentationName](self, "assetSetRepresentationName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "summary");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = CFSTR("NONE");
  }

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientDomain:%@|asset(%@)[%@]|status:%@|interval:%@|remaining:%@|pushDelay:%@|clients:%@|monitors:%@|maxClients:%@|totalClients:%@"), v17, v16, v15, v14, v5, v6, v12, v7, v8, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
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
  unint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  unint64_t v46;
  void *v47;
  __CFString *v48;
  void *v49;
  void *v50;
  id v51;

  v51 = a3;
  -[MAAutoAssetSetSummary clientDomainName](self, "clientDomainName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary assetSetRepresentationName](self, "assetSetRepresentationName");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "summary");
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v48 = CFSTR("NONE");
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  v47 = v4;
  v14 = objc_msgSend(v4, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v14 > v16)
    objc_msgSend(v51, "setSafeObject:forKey:", v47, CFSTR("assetSetIdentifier"));
  v17 = objc_msgSend(v50, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v17 > v19)
    objc_msgSend(v51, "setSafeObject:forKey:", v50, CFSTR("assetSetIdentifier"));
  v20 = objc_msgSend(v49, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("assetSetRepresentation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v20 > v22)
    objc_msgSend(v51, "setSafeObject:forKey:", v49, CFSTR("assetSetRepresentation"));
  v23 = -[__CFString length](v48, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("setJobStatus"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (v23 > v25)
    objc_msgSend(v51, "setSafeObject:forKey:", v48, CFSTR("setJobStatus"));
  v26 = objc_msgSend(v7, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("scheduledIntervalSecs"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (v26 > v28)
    objc_msgSend(v51, "setSafeObject:forKey:", v7, CFSTR("scheduledIntervalSecs"));
  v29 = objc_msgSend(v8, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("scheduledRemainingSecs"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "length");

  if (v29 > v31)
    objc_msgSend(v51, "setSafeObject:forKey:", v8, CFSTR("scheduledRemainingSecs"));
  v32 = objc_msgSend(v9, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("pushDelaySecs"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v32 > v34)
    objc_msgSend(v51, "setSafeObject:forKey:", v9, CFSTR("pushDelaySecs"));
  v35 = objc_msgSend(v10, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("activeClientCount"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");

  if (v35 > v37)
    objc_msgSend(v51, "setSafeObject:forKey:", v10, CFSTR("activeClientCount"));
  v38 = objc_msgSend(v11, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "length");

  if (v38 > v40)
    objc_msgSend(v51, "setSafeObject:forKey:", v11, CFSTR("activeMonitorCount"));
  v41 = objc_msgSend(v12, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("maximumClientCount"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length");

  if (v41 > v43)
    objc_msgSend(v51, "setSafeObject:forKey:", v12, CFSTR("maximumClientCount"));
  v44 = objc_msgSend(v13, "length");
  objc_msgSend(v51, "safeStringForKey:", CFSTR("totalClientCount"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "length");

  if (v44 > v46)
    objc_msgSend(v51, "setSafeObject:forKey:", v13, CFSTR("totalClientCount"));

}

- (id)summaryPadded:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;

  v4 = a3;
  -[MAAutoAssetSetSummary clientDomainName](self, "clientDomainName");
  v5 = objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary assetSetIdentifier](self, "assetSetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary assetSetRepresentationName](self, "assetSetRepresentationName");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetSetSummary setJobStatus](self, "setJobStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "summary");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = CFSTR("NONE");
  }

  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary pushDelaySecs](self, "pushDelaySecs"));
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary activeClientCount](self, "activeClientCount"));
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary activeMonitorCount](self, "activeMonitorCount"));
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary maximumClientCount](self, "maximumClientCount"));
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetSummary totalClientCount](self, "totalClientCount"));
  v29 = (id)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "safeStringForKey:", CFSTR("clientDomainName"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v5;
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v5, v35, CFSTR(" "), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v6, v34, CFSTR(" "), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetSetRepresentation"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v43, v33, CFSTR(" "), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("setJobStatus"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v42, v31, CFSTR(" "), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("scheduledIntervalSecs"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v39, v28, CFSTR(" "), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("scheduledRemainingSecs"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v32, v24, CFSTR(" "), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("pushDelaySecs"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v41, v22, CFSTR(" "), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeClientCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v40, v19, CFSTR(" "), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v25, v18, CFSTR(" "), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("maximumClientCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v38, v11, CFSTR(" "), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("totalClientCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v37, v13, CFSTR(" "), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v36, v26, v23, v21, v20, v17, v16, v9, v10, v12, v14);
  v30 = (id)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)assetSetRepresentationName
{
  return +[MAAutoAssetSummary assetRepresentationName:](MAAutoAssetSummary, "assetRepresentationName:", -[MAAutoAssetSetSummary assetSetRepresentation](self, "assetSetRepresentation"));
}

+ (id)assetSetRepresentationName:(int64_t)a3
{
  return +[MAAutoAssetSummary assetRepresentationName:](MAAutoAssetSummary, "assetRepresentationName:", a3);
}

+ (id)summaryNewMaxColumnStrings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("clientDomainName"), CFSTR("clientDomainName"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetSetIdentifier"), CFSTR("assetSetIdentifier"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetSetRepresentation"), CFSTR("assetSetRepresentation"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("setJobStatus"), CFSTR("setJobStatus"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("scheduledIntervalSecs"), CFSTR("scheduledIntervalSecs"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("scheduledRemainingSecs"), CFSTR("scheduledRemainingSecs"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("activeClientCount"), CFSTR("activeClientCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("activeMonitorCount"), CFSTR("activeMonitorCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("maximumClientCount"), CFSTR("maximumClientCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("totalClientCount"), CFSTR("totalClientCount"));
  return v2;
}

+ (id)summaryPaddedString:(id)a3 paddingToLenghtOfString:(id)a4 paddingWith:(id)a5 paddingBefore:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v9;
  v13 = objc_msgSend(v12, "length");
  v14 = v12;
  if (v13 < objc_msgSend(v10, "length"))
  {
    v15 = objc_msgSend(v10, "length");
    v16 = v15 - objc_msgSend(v12, "length");
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByPaddingToLength:withString:startingAtIndex:", v16, v11, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc(MEMORY[0x1E0CB3940]);
    if (v6)
      v20 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@%@"), v18, v12);
    else
      v20 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@%@"), v12, v18);
    v14 = (void *)v20;

  }
  return v14;
}

+ (id)summaryPaddedHeader:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientDomainName"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("clientDomainName"), v24, CFSTR(" "), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetSetIdentifier"), v23, CFSTR(" "), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSetRepresentation"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetSetRepresentation"), v22, CFSTR(" "), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("setJobStatus"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("setJobStatus"), v19, CFSTR(" "), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("scheduledIntervalSecs"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("scheduledIntervalSecs"), v18, CFSTR(" "), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("scheduledRemainingSecs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("scheduledRemainingSecs"), v17, CFSTR(" "), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeClientCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("activeClientCount"), v14, CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("activeMonitorCount"), v12, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumClientCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("maximumClientCount"), v6, CFSTR(" "), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalClientCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("totalClientCount"), v8, CFSTR(" "), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v26, v25, v16, v15, v13, v11, v4, v5, v7, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)summaryPaddedBanner:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v21 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientDomainName"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v25, CFSTR("="), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSetIdentifier"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v24, CFSTR("="), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSetRepresentation"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v23, CFSTR("="), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("setJobStatus"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v20, CFSTR("="), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("scheduledIntervalSecs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v19, CFSTR("="), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("scheduledRemainingSecs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v17, CFSTR("="), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeClientCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v14, CFSTR("="), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v13, CFSTR("="), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumClientCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v6, CFSTR("="), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalClientCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v8, CFSTR("="), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v26, v18, v16, v15, v11, v12, v4, v5, v7, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
  objc_storeStrong((id *)&self->_clientDomainName, a3);
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void)setAssetSetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetIdentifier, a3);
}

- (int64_t)assetSetRepresentation
{
  return self->_assetSetRepresentation;
}

- (void)setAssetSetRepresentation:(int64_t)a3
{
  self->_assetSetRepresentation = a3;
}

- (MAAutoAssetSetStatus)setJobStatus
{
  return self->_setJobStatus;
}

- (void)setSetJobStatus:(id)a3
{
  objc_storeStrong((id *)&self->_setJobStatus, a3);
}

- (int64_t)scheduledIntervalSecs
{
  return self->_scheduledIntervalSecs;
}

- (void)setScheduledIntervalSecs:(int64_t)a3
{
  self->_scheduledIntervalSecs = a3;
}

- (int64_t)scheduledRemainingSecs
{
  return self->_scheduledRemainingSecs;
}

- (void)setScheduledRemainingSecs:(int64_t)a3
{
  self->_scheduledRemainingSecs = a3;
}

- (int64_t)pushDelaySecs
{
  return self->_pushDelaySecs;
}

- (void)setPushDelaySecs:(int64_t)a3
{
  self->_pushDelaySecs = a3;
}

- (int64_t)activeClientCount
{
  return self->_activeClientCount;
}

- (void)setActiveClientCount:(int64_t)a3
{
  self->_activeClientCount = a3;
}

- (int64_t)activeMonitorCount
{
  return self->_activeMonitorCount;
}

- (void)setActiveMonitorCount:(int64_t)a3
{
  self->_activeMonitorCount = a3;
}

- (int64_t)maximumClientCount
{
  return self->_maximumClientCount;
}

- (void)setMaximumClientCount:(int64_t)a3
{
  self->_maximumClientCount = a3;
}

- (int64_t)totalClientCount
{
  return self->_totalClientCount;
}

- (void)setTotalClientCount:(int64_t)a3
{
  self->_totalClientCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setJobStatus, 0);
  objc_storeStrong((id *)&self->_assetSetIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDomainName, 0);
}

@end
