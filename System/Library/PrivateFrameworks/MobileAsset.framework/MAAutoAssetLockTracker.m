@implementation MAAutoAssetLockTracker

- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4
{
  return -[MAAutoAssetLockTracker _initForClientLockReason:forClientProcessName:withClientProcessID:lockingWithUsagePolicy:](self, "_initForClientLockReason:forClientProcessName:withClientProcessID:lockingWithUsagePolicy:", a3, 0, 0, a4);
}

- (id)_initForClientLockReason:(id)a3 forClientProcessName:(id)a4 withClientProcessID:(int64_t)a5 lockingWithUsagePolicy:(id)a6
{
  id v11;
  id v12;
  id v13;
  MAAutoAssetLockTracker *v14;
  MAAutoAssetLockTracker *v15;
  uint64_t v16;
  NSDate *firstLockTimestamp;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)MAAutoAssetLockTracker;
  v14 = -[MAAutoAssetLockTracker init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_clientLockReason, a3);
    objc_storeStrong((id *)&v15->_clientProcessName, a4);
    v15->_clientProcessID = a5;
    objc_storeStrong((id *)&v15->_lockUsagePolicy, a6);
    *(int64x2_t *)&v15->_activeLockCount = vdupq_n_s64(1uLL);
    *(_OWORD *)&v15->_totalLockCount = xmmword_1AE3BAEA0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    firstLockTimestamp = v15->_firstLockTimestamp;
    v15->_firstLockTimestamp = (NSDate *)v16;

    objc_storeStrong((id *)&v15->_lastRefreshTimestamp, v15->_firstLockTimestamp);
  }

  return v15;
}

- (MAAutoAssetLockTracker)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetLockTracker *v5;
  uint64_t v6;
  MAAutoAssetLockReason *clientLockReason;
  uint64_t v8;
  NSString *clientProcessName;
  uint64_t v10;
  MAAutoAssetPolicy *lockUsagePolicy;
  uint64_t v12;
  NSDate *firstLockTimestamp;
  uint64_t v14;
  NSDate *lastRefreshTimestamp;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MAAutoAssetLockTracker;
  v5 = -[MAAutoAssetLockTracker init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientLockReason"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientLockReason = v5->_clientLockReason;
    v5->_clientLockReason = (MAAutoAssetLockReason *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientProcessName"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientProcessName = v5->_clientProcessName;
    v5->_clientProcessName = (NSString *)v8;

    v5->_clientProcessID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("clientProcessID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockUsagePolicy"));
    v10 = objc_claimAutoreleasedReturnValue();
    lockUsagePolicy = v5->_lockUsagePolicy;
    v5->_lockUsagePolicy = (MAAutoAssetPolicy *)v10;

    v5->_activeLockCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeLockCount"));
    v5->_maximumLockCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumLockCount"));
    v5->_totalLockCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalLockCount"));
    v5->_continueCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("continueLockCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstLockTimestamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    firstLockTimestamp = v5->_firstLockTimestamp;
    v5->_firstLockTimestamp = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastRefreshTimestamp"));
    v14 = objc_claimAutoreleasedReturnValue();
    lastRefreshTimestamp = v5->_lastRefreshTimestamp;
    v5->_lastRefreshTimestamp = (NSDate *)v14;

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
  id v9;

  v4 = a3;
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientLockReason"));

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("clientProcessName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"), CFSTR("clientProcessID"));
  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("lockUsagePolicy"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"), CFSTR("activeLockCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"), CFSTR("maximumLockCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"), CFSTR("totalLockCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetLockTracker continueCount](self, "continueCount"), CFSTR("continueLockCount"));
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("firstLockTimestamp"));

  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("lastRefreshTimestamp"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetLockTracker *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = [MAAutoAssetLockTracker alloc];
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAAutoAssetLockTracker initForClientLockReason:lockingWithUsagePolicy:](v3, "initForClientLockReason:lockingWithUsagePolicy:", v4, v5);

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setClientProcessName:", v7);

  objc_msgSend(v6, "setClientProcessID:", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  objc_msgSend(v6, "setActiveLockCount:", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  objc_msgSend(v6, "setMaximumLockCount:", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  objc_msgSend(v6, "setTotalLockCount:", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  objc_msgSend(v6, "setContinueCount:", -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v6, "setFirstLockTimestamp:", v9);

  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v6, "setLastRefreshTimestamp:", v11);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  int64_t v16;
  void *v17;
  __CFString *v18;
  void *v19;

  v17 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = CFSTR("N");
  }
  v16 = -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID");
  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "summary");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("NONE");
  }
  v7 = -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount");
  v8 = -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount");
  v9 = -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount");
  v10 = -[MAAutoAssetLockTracker continueCount](self, "continueCount");
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR(">>>\n        clientLockReason: %@\n       clientProcessName: %@\n         clientProcessID: %ld\n         lockUsagePolicy: %@\n         activeLockCount: %lld\n        maximumLockCount: %lld\n          totalLockCount: %lld\n           continueCount: %lld\n      firstLockTimestamp: %@\n    lastRefreshTimestamp: %@\n<<<]"), v3, v18, v16, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {

  }
  if (v4)

  return v13;
}

- (id)summary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v22;
  void *v23;

  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (__CFString *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@(%ld)"), v6, -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));

  }
  else
  {
    v22 = CFSTR("N");
  }

  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "summary");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("NONE");
  }

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@"), v15);

  v17 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@"), v18);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientReason:%@|clientProcess:%@|policy:%@|locks active:%@, max:%@, total:%@|continues:%@|first:%@|last:%@"), v23, v22, v9, v10, v11, v12, v13, v16, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)newSummaryDictionary
{
  id v3;
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newSummaryDictionary");
  objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("clientLockReason"));

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("clientProcessName"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("clientProcessID"));

  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newSummaryDictionary");
  objc_msgSend(v3, "setSafeObject:forKey:", v10, CFSTR("lockUsagePolicy"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v11, CFSTR("activeLockCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("maximumLockCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("totalLockCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v14, CFSTR("continueLockCount"));

  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v16, CFSTR("firstLockTimestamp"));

  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v18, CFSTR("lastRefreshTimestamp"));

  return v3;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  unint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  unint64_t v42;
  unint64_t v43;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  void *v47;
  unint64_t v48;
  void *v49;
  __CFString *v50;
  void *v51;
  __CFString *v52;
  id v53;

  v53 = a3;
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v5 = objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v5;
  if (v6)
  {
    -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
    v52 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = CFSTR("NONE");
  }

  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "summary");
    v50 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v50 = CFSTR("NONE");
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  v13 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("%@"), v14);

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@"), v17);

  v19 = objc_msgSend(v49, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("clientLockReason"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "length");

  if (v19 > v21)
    objc_msgSend(v53, "setSafeObject:forKey:", v49, CFSTR("clientLockReason"));
  v22 = -[__CFString length](v52, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("clientProcessName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "length");

  if (v22 > v24)
    objc_msgSend(v53, "setSafeObject:forKey:", v52, CFSTR("clientProcessName"));
  v25 = objc_msgSend(v51, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("clientProcessID"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "length");

  if (v25 > v27)
    objc_msgSend(v53, "setSafeObject:forKey:", v51, CFSTR("clientProcessID"));
  v28 = -[__CFString length](v50, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("lockUsagePolicy"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");

  if (v28 > v30)
    objc_msgSend(v53, "setSafeObject:forKey:", v50, CFSTR("lockUsagePolicy"));
  v31 = objc_msgSend(v9, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("activeLockCount"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "length");

  if (v31 > v33)
    objc_msgSend(v53, "setSafeObject:forKey:", v9, CFSTR("activeLockCount"));
  v34 = objc_msgSend(v10, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("maximumLockCount"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "length");

  if (v34 > v36)
    objc_msgSend(v53, "setSafeObject:forKey:", v10, CFSTR("maximumLockCount"));
  v37 = objc_msgSend(v11, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("totalLockCount"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "length");

  if (v37 > v39)
    objc_msgSend(v53, "setSafeObject:forKey:", v11, CFSTR("totalLockCount"));
  v40 = objc_msgSend(v12, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("continueLockCount"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "length");

  if (v40 > v42)
    objc_msgSend(v53, "setSafeObject:forKey:", v12, CFSTR("continueLockCount"));
  v43 = objc_msgSend(v15, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("firstLockTimestamp"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "length");

  if (v43 > v45)
    objc_msgSend(v53, "setSafeObject:forKey:", v15, CFSTR("firstLockTimestamp"));
  v46 = objc_msgSend(v18, "length");
  objc_msgSend(v53, "safeStringForKey:", CFSTR("lastRefreshTimestamp"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "length");

  if (v46 > v48)
    objc_msgSend(v53, "setSafeObject:forKey:", v18, CFSTR("lastRefreshTimestamp"));

}

- (id)summaryPadded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
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
  __CFString *v44;
  void *v45;

  v4 = a3;
  -[MAAutoAssetLockTracker clientLockReason](self, "clientLockReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetLockTracker clientProcessName](self, "clientProcessName");
    v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = CFSTR("NONE");
  }

  v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%ld"), -[MAAutoAssetLockTracker clientProcessID](self, "clientProcessID"));
  -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[MAAutoAssetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "summary");
    v42 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = CFSTR("NONE");
  }

  v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker activeLockCount](self, "activeLockCount"));
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker maximumLockCount](self, "maximumLockCount"));
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker totalLockCount](self, "totalLockCount"));
  v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetLockTracker continueCount](self, "continueCount"));
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v10);

  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@"), v12);

  v31 = (id)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "safeStringForKey:", CFSTR("clientLockReason"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v45, v35, CFSTR(" "), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("clientProcessName"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v44, v34, CFSTR(" "), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("clientProcessID"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v43, v33, CFSTR(" "), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("lockUsagePolicy"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v42, v30, CFSTR(" "), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeLockCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v41, v28, CFSTR(" "), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("maximumLockCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v37, v25, CFSTR(" "), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("totalLockCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v29, v23, CFSTR(" "), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("continueLockCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v40, v22, CFSTR(" "), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("firstLockTimestamp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v39, v16, CFSTR(" "), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("lastRefreshTimestamp"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v38, v18, CFSTR(" "), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v36, v27, v26, v24, v13, v21, v14, v15, v17, v19);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("clientLockReason"), CFSTR("clientLockReason"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("clientProcessName"), CFSTR("clientProcessName"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("clientProcessID"), CFSTR("clientProcessID"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("lockUsagePolicy"), CFSTR("lockUsagePolicy"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("activeLockCount"), CFSTR("activeLockCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("maximumLockCount"), CFSTR("maximumLockCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("totalLockCount"), CFSTR("totalLockCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("continueLockCount"), CFSTR("continueLockCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("firstLockTimestamp"), CFSTR("firstLockTimestamp"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("lastRefreshTimestamp"), CFSTR("lastRefreshTimestamp"));
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
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientLockReason"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("clientLockReason"), v24, CFSTR(" "), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientProcessName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("clientProcessName"), v23, CFSTR(" "), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientProcessID"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("clientProcessID"), v22, CFSTR(" "), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("lockUsagePolicy"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("lockUsagePolicy"), v19, CFSTR(" "), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeLockCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("activeLockCount"), v18, CFSTR(" "), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumLockCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("maximumLockCount"), v17, CFSTR(" "), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalLockCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("totalLockCount"), v14, CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("continueLockCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("continueLockCount"), v12, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("firstLockTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("firstLockTimestamp"), v6, CFSTR(" "), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("lastRefreshTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("lastRefreshTimestamp"), v8, CFSTR(" "), 0);
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
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientLockReason"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v25, CFSTR("="), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientProcessName"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v24, CFSTR("="), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientProcessID"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v23, CFSTR("="), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("lockUsagePolicy"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v20, CFSTR("="), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeLockCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v19, CFSTR("="), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumLockCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v17, CFSTR("="), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalLockCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v14, CFSTR("="), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("continueLockCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v13, CFSTR("="), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("firstLockTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v6, CFSTR("="), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("lastRefreshTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v8, CFSTR("="), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v26, v18, v16, v15, v11, v12, v4, v5, v7, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (MAAutoAssetLockReason)clientLockReason
{
  return self->_clientLockReason;
}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_clientProcessName, a3);
}

- (int64_t)clientProcessID
{
  return self->_clientProcessID;
}

- (void)setClientProcessID:(int64_t)a3
{
  self->_clientProcessID = a3;
}

- (MAAutoAssetPolicy)lockUsagePolicy
{
  return self->_lockUsagePolicy;
}

- (void)setLockUsagePolicy:(id)a3
{
  objc_storeStrong((id *)&self->_lockUsagePolicy, a3);
}

- (int64_t)activeLockCount
{
  return self->_activeLockCount;
}

- (void)setActiveLockCount:(int64_t)a3
{
  self->_activeLockCount = a3;
}

- (int64_t)maximumLockCount
{
  return self->_maximumLockCount;
}

- (void)setMaximumLockCount:(int64_t)a3
{
  self->_maximumLockCount = a3;
}

- (int64_t)totalLockCount
{
  return self->_totalLockCount;
}

- (void)setTotalLockCount:(int64_t)a3
{
  self->_totalLockCount = a3;
}

- (int64_t)continueCount
{
  return self->_continueCount;
}

- (void)setContinueCount:(int64_t)a3
{
  self->_continueCount = a3;
}

- (NSDate)firstLockTimestamp
{
  return self->_firstLockTimestamp;
}

- (void)setFirstLockTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_firstLockTimestamp, a3);
}

- (NSDate)lastRefreshTimestamp
{
  return self->_lastRefreshTimestamp;
}

- (void)setLastRefreshTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_lastRefreshTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastRefreshTimestamp, 0);
  objc_storeStrong((id *)&self->_firstLockTimestamp, 0);
  objc_storeStrong((id *)&self->_lockUsagePolicy, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_clientLockReason, 0);
}

@end
