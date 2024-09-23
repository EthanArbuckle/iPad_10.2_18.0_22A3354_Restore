@implementation MAAutoAssetSetLockTracker

- (id)initForClientLockReason:(id)a3 lockingWithUsagePolicy:(id)a4
{
  id v7;
  id v8;
  MAAutoAssetSetLockTracker *v9;
  MAAutoAssetSetLockTracker *v10;
  uint64_t v11;
  NSDate *firstLockTimestamp;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MAAutoAssetSetLockTracker;
  v9 = -[MAAutoAssetSetLockTracker init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_clientLockReason, a3);
    objc_storeStrong((id *)&v10->_lockUsagePolicy, a4);
    *(int64x2_t *)&v10->_activeLockCount = vdupq_n_s64(1uLL);
    *(_OWORD *)&v10->_totalLockCount = xmmword_1AE3BAEA0;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    firstLockTimestamp = v10->_firstLockTimestamp;
    v10->_firstLockTimestamp = (NSDate *)v11;

    objc_storeStrong((id *)&v10->_lastRefreshTimestamp, v10->_firstLockTimestamp);
  }

  return v10;
}

- (MAAutoAssetSetLockTracker)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSetLockTracker *v5;
  uint64_t v6;
  MAAutoAssetLockReason *clientLockReason;
  uint64_t v8;
  MAAutoAssetSetPolicy *lockUsagePolicy;
  uint64_t v10;
  NSDate *firstLockTimestamp;
  uint64_t v12;
  NSDate *lastRefreshTimestamp;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetSetLockTracker;
  v5 = -[MAAutoAssetSetLockTracker init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientLockReason"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientLockReason = v5->_clientLockReason;
    v5->_clientLockReason = (MAAutoAssetLockReason *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockUsagePolicy"));
    v8 = objc_claimAutoreleasedReturnValue();
    lockUsagePolicy = v5->_lockUsagePolicy;
    v5->_lockUsagePolicy = (MAAutoAssetSetPolicy *)v8;

    v5->_activeLockCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeLockCount"));
    v5->_maximumLockCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumLockCount"));
    v5->_totalLockCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalLockCount"));
    v5->_continueCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("continueLockCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("firstLockTimestamp"));
    v10 = objc_claimAutoreleasedReturnValue();
    firstLockTimestamp = v5->_firstLockTimestamp;
    v5->_firstLockTimestamp = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastRefreshTimestamp"));
    v12 = objc_claimAutoreleasedReturnValue();
    lastRefreshTimestamp = v5->_lastRefreshTimestamp;
    v5->_lastRefreshTimestamp = (NSDate *)v12;

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
  -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("clientLockReason"));

  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("lockUsagePolicy"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"), CFSTR("activeLockCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"), CFSTR("maximumLockCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"), CFSTR("totalLockCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"), CFSTR("continueLockCount"));
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("firstLockTimestamp"));

  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("lastRefreshTimestamp"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copy
{
  MAAutoAssetSetLockTracker *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = [MAAutoAssetSetLockTracker alloc];
  -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAAutoAssetSetLockTracker initForClientLockReason:lockingWithUsagePolicy:](v3, "initForClientLockReason:lockingWithUsagePolicy:", v4, v5);

  objc_msgSend(v6, "setActiveLockCount:", -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  objc_msgSend(v6, "setMaximumLockCount:", -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  objc_msgSend(v6, "setTotalLockCount:", -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  objc_msgSend(v6, "setContinueCount:", -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v6, "setFirstLockTimestamp:", v8);

  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v6, "setLastRefreshTimestamp:", v10);

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
  void *v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "summary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "summary");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("NONE");
  }
  v7 = -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount");
  v8 = -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount");
  v9 = -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount");
  v10 = -[MAAutoAssetSetLockTracker continueCount](self, "continueCount");
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(">>>\n        clientLockReason: %@\n         lockUsagePolicy: %@\n         activeLockCount: %lld\n        maximumLockCount: %lld\n          totalLockCount: %lld\n           continueCount: %lld\n      firstLockTimestamp: %@\n    lastRefreshTimestamp: %@\n<<<]"), v4, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {

  }
  return v13;
}

- (id)summary
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "summary");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = CFSTR("NONE");
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@"), v12);

  v14 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@"), v15);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("clientReason:%@|policy:%@|locks active:%@, max:%@, total:%@|continues:%@|first:%@|last:%@"), v19, v6, v7, v8, v9, v10, v13, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  unint64_t v36;
  void *v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  void *v42;
  id v43;

  v43 = a3;
  -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "summary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "summary");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("NONE");
  }

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  v12 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("%@"), v13);

  v15 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithFormat:", CFSTR("%@"), v16);

  v18 = objc_msgSend(v42, "length");
  objc_msgSend(v43, "safeStringForKey:", CFSTR("clientLockReason"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "length");

  if (v18 > v20)
    objc_msgSend(v43, "setSafeObject:forKey:", v42, CFSTR("clientLockReason"));
  v21 = -[__CFString length](v7, "length");
  objc_msgSend(v43, "safeStringForKey:", CFSTR("lockUsagePolicy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "length");

  if (v21 > v23)
    objc_msgSend(v43, "setSafeObject:forKey:", v7, CFSTR("lockUsagePolicy"));
  v24 = objc_msgSend(v8, "length");
  objc_msgSend(v43, "safeStringForKey:", CFSTR("activeLockCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "length");

  if (v24 > v26)
    objc_msgSend(v43, "setSafeObject:forKey:", v8, CFSTR("activeLockCount"));
  v27 = objc_msgSend(v9, "length");
  objc_msgSend(v43, "safeStringForKey:", CFSTR("maximumLockCount"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "length");

  if (v27 > v29)
    objc_msgSend(v43, "setSafeObject:forKey:", v9, CFSTR("maximumLockCount"));
  v30 = objc_msgSend(v10, "length");
  objc_msgSend(v43, "safeStringForKey:", CFSTR("totalLockCount"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "length");

  if (v30 > v32)
    objc_msgSend(v43, "setSafeObject:forKey:", v10, CFSTR("totalLockCount"));
  v33 = objc_msgSend(v11, "length");
  objc_msgSend(v43, "safeStringForKey:", CFSTR("continueLockCount"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "length");

  if (v33 > v35)
    objc_msgSend(v43, "setSafeObject:forKey:", v11, CFSTR("continueLockCount"));
  v36 = objc_msgSend(v14, "length");
  objc_msgSend(v43, "safeStringForKey:", CFSTR("firstLockTimestamp"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "length");

  if (v36 > v38)
    objc_msgSend(v43, "setSafeObject:forKey:", v14, CFSTR("firstLockTimestamp"));
  v39 = objc_msgSend(v17, "length");
  objc_msgSend(v43, "safeStringForKey:", CFSTR("lastRefreshTimestamp"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "length");

  if (v39 > v41)
    objc_msgSend(v43, "setSafeObject:forKey:", v17, CFSTR("lastRefreshTimestamp"));

}

- (id)summaryPadded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __CFString *v37;
  void *v38;

  v4 = a3;
  -[MAAutoAssetSetLockTracker clientLockReason](self, "clientLockReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetSetLockTracker lockUsagePolicy](self, "lockUsagePolicy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "summary");
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = CFSTR("NONE");
  }

  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker activeLockCount](self, "activeLockCount"));
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker maximumLockCount](self, "maximumLockCount"));
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker totalLockCount](self, "totalLockCount"));
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSetLockTracker continueCount](self, "continueCount"));
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetLockTracker firstLockTimestamp](self, "firstLockTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@"), v9);

  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[MAAutoAssetSetLockTracker lastRefreshTimestamp](self, "lastRefreshTimestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@"), v11);

  v27 = (id)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "safeStringForKey:", CFSTR("clientLockReason"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v38, v32, CFSTR(" "), 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("lockUsagePolicy"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v37, v31, CFSTR(" "), 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeLockCount"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v36, v29, CFSTR(" "), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("maximumLockCount"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v30, v24, CFSTR(" "), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("totalLockCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v26, v22, CFSTR(" "), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("continueLockCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v35, v20, CFSTR(" "), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("firstLockTimestamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v34, v15, CFSTR(" "), 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("lastRefreshTimestamp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v33, v17, CFSTR(" "), 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@"), v25, v23, v21, v12, v13, v14, v16, v18);
  v28 = (id)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("clientLockReason"), CFSTR("clientLockReason"));
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

  v19 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientLockReason"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("clientLockReason"), v22, CFSTR(" "), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("lockUsagePolicy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("lockUsagePolicy"), v21, CFSTR(" "), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeLockCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("activeLockCount"), v18, CFSTR(" "), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumLockCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("maximumLockCount"), v16, CFSTR(" "), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalLockCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("totalLockCount"), v14, CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("continueLockCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("continueLockCount"), v12, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("firstLockTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("firstLockTimestamp"), v6, CFSTR(" "), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("lastRefreshTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("lastRefreshTimestamp"), v8, CFSTR(" "), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@"), v17, v15, v13, v11, v4, v5, v7, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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

  v19 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("clientLockReason"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v22, CFSTR("="), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("lockUsagePolicy"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v21, CFSTR("="), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeLockCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v18, CFSTR("="), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumLockCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v16, CFSTR("="), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalLockCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v14, CFSTR("="), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("continueLockCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v12, CFSTR("="), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("firstLockTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v6, CFSTR("="), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("lastRefreshTimestamp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSetLockTracker summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSetLockTracker, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v8, CFSTR("="), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@"), v17, v15, v13, v11, v4, v5, v7, v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MAAutoAssetLockReason)clientLockReason
{
  return self->_clientLockReason;
}

- (MAAutoAssetSetPolicy)lockUsagePolicy
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
  objc_storeStrong((id *)&self->_clientLockReason, 0);
}

@end
