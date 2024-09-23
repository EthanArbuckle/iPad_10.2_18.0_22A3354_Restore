@implementation MAAutoAssetSummary

- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14
{
  id v21;
  id v22;
  MAAutoAssetSummary *v23;
  MAAutoAssetSummary *v24;
  objc_super v26;

  v21 = a3;
  v22 = a7;
  v26.receiver = self;
  v26.super_class = (Class)MAAutoAssetSummary;
  v23 = -[MAAutoAssetSummary init](&v26, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_assetSelector, a3);
    v24->_assetRepresentation = a4;
    v24->_assetWasPatched = a5;
    v24->_assetIsStaged = a6;
    objc_storeStrong((id *)&v24->_jobStatus, a7);
    v24->_scheduledIntervalSecs = a8;
    v24->_scheduledRemainingSecs = a9;
    v24->_pushDelaySecs = a10;
    v24->_activeClientCount = a11;
    v24->_activeMonitorCount = a12;
    v24->_maximumClientCount = a13;
    v24->_totalClientCount = a14;
  }

  return v24;
}

- (MAAutoAssetSummary)initWithAssetSelector:(id)a3 withAssetRepresentation:(int64_t)a4 withAssetWasPatched:(BOOL)a5 withAssetIsStaged:(BOOL)a6 withJobStatus:(id)a7 withScheduledIntervalSecs:(int64_t)a8 withScheduledRemainingSecs:(int64_t)a9 withPushDelaySecs:(int64_t)a10 withActiveClientCount:(int64_t)a11 withActiveMonitorCount:(int64_t)a12 withMaximumClientCount:(int64_t)a13 withTotalClientCount:(int64_t)a14 withIsSecureMobileAsset:(BOOL)a15 withPersonalizationStatus:(BOOL)a16 withPrePersonalizationStatus:(BOOL)a17 withGraftStatus:(BOOL)a18 withGraftPoint:(id)a19 withStageGroupType:(unint64_t)a20 withTargetOS:(id)a21
{
  id v25;
  id v26;
  id v27;
  id v28;
  MAAutoAssetSummary *v29;
  MAAutoAssetSummary *v30;
  objc_super v35;

  v25 = a3;
  v26 = a7;
  v27 = a19;
  v28 = a21;
  v35.receiver = self;
  v35.super_class = (Class)MAAutoAssetSummary;
  v29 = -[MAAutoAssetSummary init](&v35, sel_init);
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_assetSelector, a3);
    v30->_assetRepresentation = a4;
    v30->_assetWasPatched = a5;
    v30->_assetIsStaged = a6;
    objc_storeStrong((id *)&v30->_jobStatus, a7);
    v30->_scheduledIntervalSecs = a8;
    v30->_scheduledRemainingSecs = a9;
    v30->_pushDelaySecs = a10;
    v30->_activeClientCount = a11;
    v30->_activeMonitorCount = a12;
    v30->_maximumClientCount = a13;
    v30->_totalClientCount = a14;
    v30->_assetIsSecureMobileAsset = a15;
    v30->_secureMobileAssetIsPersonalized = a16;
    v30->_secureMobileAssetIsPrePersonalized = a17;
    v30->_secureMobileAssetIsGrafted = a18;
    objc_storeStrong((id *)&v30->_secureMobileAssetGraftPoint, a19);
    v30->_stageGroup = a20;
    objc_storeStrong((id *)&v30->_targetOS, a21);
  }

  return v30;
}

- (MAAutoAssetSummary)initWithCoder:(id)a3
{
  id v4;
  MAAutoAssetSummary *v5;
  uint64_t v6;
  MAAutoAssetSelector *assetSelector;
  uint64_t v8;
  MAAutoAssetStatus *jobStatus;
  uint64_t v10;
  NSString *secureMobileAssetGraftPoint;
  uint64_t v12;
  NSString *targetOS;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MAAutoAssetSummary;
  v5 = -[MAAutoAssetSummary init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assetSelector"));
    v6 = objc_claimAutoreleasedReturnValue();
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v6;

    v5->_assetRepresentation = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("assetRepresentation"));
    v5->_assetWasPatched = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assetWasPatched"));
    v5->_assetIsStaged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assetIsStaged"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("jobStatus"));
    v8 = objc_claimAutoreleasedReturnValue();
    jobStatus = v5->_jobStatus;
    v5->_jobStatus = (MAAutoAssetStatus *)v8;

    v5->_scheduledIntervalSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduledIntervalSecs"));
    v5->_scheduledRemainingSecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("scheduledRemainingSecs"));
    v5->_pushDelaySecs = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pushDelaySecs"));
    v5->_activeClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeClientCount"));
    v5->_activeMonitorCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("activeMonitorCount"));
    v5->_maximumClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maximumClientCount"));
    v5->_totalClientCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalClientCount"));
    v5->_assetIsSecureMobileAsset = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("assetIsSecureMobileAsset"));
    v5->_secureMobileAssetIsPersonalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secureMobileAssetIsPersonalized"));
    v5->_secureMobileAssetIsPrePersonalized = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secureMobileAssetIsPrePersonalized"));
    v5->_secureMobileAssetIsGrafted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("secureMobileAssetIsGrafted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("secureMobileAssetGraftPoint"));
    v10 = objc_claimAutoreleasedReturnValue();
    secureMobileAssetGraftPoint = v5->_secureMobileAssetGraftPoint;
    v5->_secureMobileAssetGraftPoint = (NSString *)v10;

    v5->_stageGroup = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stageGroup"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetOSKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    targetOS = v5->_targetOS;
    v5->_targetOS = (NSString *)v12;

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
  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("assetSelector"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary assetRepresentation](self, "assetRepresentation"), CFSTR("assetRepresentation"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched"), CFSTR("assetWasPatched"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"), CFSTR("assetIsStaged"));
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("jobStatus"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"), CFSTR("scheduledIntervalSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"), CFSTR("pushDelaySecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"), CFSTR("scheduledRemainingSecs"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"), CFSTR("activeClientCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"), CFSTR("activeMonitorCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"), CFSTR("maximumClientCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"), CFSTR("totalClientCount"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary assetIsSecureMobileAsset](self, "assetIsSecureMobileAsset"), CFSTR("assetIsSecureMobileAsset"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary secureMobileAssetIsPersonalized](self, "secureMobileAssetIsPersonalized"), CFSTR("secureMobileAssetIsPersonalized"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary secureMobileAssetIsPrePersonalized](self, "secureMobileAssetIsPrePersonalized"), CFSTR("secureMobileAssetIsPrePersonalized"));
  objc_msgSend(v4, "encodeBool:forKey:", -[MAAutoAssetSummary secureMobileAssetIsGrafted](self, "secureMobileAssetIsGrafted"), CFSTR("secureMobileAssetIsGrafted"));
  -[MAAutoAssetSummary secureMobileAssetGraftPoint](self, "secureMobileAssetGraftPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("secureMobileAssetGraftPoint"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[MAAutoAssetSummary stageGroup](self, "stageGroup"), CFSTR("stageGroup"));
  -[MAAutoAssetSummary targetOS](self, "targetOS");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("targetOSKey"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)getStringsForSummaryProps:(id *)a3 isPersonalized:(id *)a4 isPrePersonalized:(id *)a5 isGrafted:(id *)a6 graftPoint:(id *)a7 stageGroup:(id *)a8 targetOS:(id *)a9
{
  BOOL v9;
  BOOL v14;
  BOOL v15;
  void *v23;
  void *v24;
  NSObject *v25;
  __CFString *v26;
  unint64_t v27;
  void *v28;
  id v29;

  if (a3)
    v9 = a4 == 0;
  else
    v9 = 1;
  v14 = v9 || a5 == 0 || a6 == 0 || a7 == 0 || a8 == 0 || a9 == 0;
  v15 = !v14;
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "oslog");
    v25 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:].cold.1(v25);

  }
  else
  {
    *a3 = CFSTR("N/A");
    *a4 = CFSTR("N/A");
    *a5 = CFSTR("N/A");
    *a6 = CFSTR("N/A");
    *a7 = CFSTR("N/A");
    *a8 = CFSTR("N/A");
    *a9 = CFSTR("N/A");
    if (-[MAAutoAssetSummary assetIsSecureMobileAsset](self, "assetIsSecureMobileAsset"))
    {
      *a3 = CFSTR("YES");
      if (-[MAAutoAssetSummary secureMobileAssetIsPersonalized](self, "secureMobileAssetIsPersonalized"))
      {
        *a4 = CFSTR("YES");
        if (-[MAAutoAssetSummary secureMobileAssetIsGrafted](self, "secureMobileAssetIsGrafted"))
        {
          *a6 = CFSTR("YES");
          -[MAAutoAssetSummary secureMobileAssetGraftPoint](self, "secureMobileAssetGraftPoint");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            -[MAAutoAssetSummary secureMobileAssetGraftPoint](self, "secureMobileAssetGraftPoint");
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            *a7 = CFSTR("Unknown(error)");
          }
        }
        else
        {
          *a6 = CFSTR("NO");
        }
      }
      else
      {
        *a4 = CFSTR("NO");
      }
      if (-[MAAutoAssetSummary secureMobileAssetIsPrePersonalized](self, "secureMobileAssetIsPrePersonalized"))
        *a5 = CFSTR("YES");
    }
    else
    {
      *a3 = CFSTR("NO");
    }
    if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"))
    {
      if (-[MAAutoAssetSummary stageGroup](self, "stageGroup") == 1)
      {
        v26 = CFSTR("REQUIRED");
      }
      else
      {
        v27 = -[MAAutoAssetSummary stageGroup](self, "stageGroup");
        v26 = CFSTR("UNKNOWN");
        if (v27 == 2)
          v26 = CFSTR("OPTIONAL");
      }
      *a8 = v26;
      -[MAAutoAssetSummary targetOS](self, "targetOS");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        -[MAAutoAssetSummary targetOS](self, "targetOS");
        v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a9 = v29;

      }
      else
      {
        *a9 = CFSTR("Unknown");
      }

    }
  }
  return v15;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  int64_t v25;
  int64_t v26;
  int64_t v27;
  int64_t v28;
  int64_t v29;
  int64_t v30;
  int64_t v31;
  int64_t v32;
  int64_t v33;
  int64_t v34;
  int64_t v35;
  int64_t v36;
  const __CFString *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  __CFString *v41;
  __CFString *v42;
  __CFString *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  __CFString *v47;
  __CFString *v48;
  __CFString *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  __CFString *v54;
  id v55[2];

  v3 = CFSTR("N");
  v54 = CFSTR("N/A");
  v55[0] = CFSTR("N");
  v52 = CFSTR("N/A");
  v53 = CFSTR("N/A");
  v50 = CFSTR("N/A");
  v51 = CFSTR("N/A");
  v49 = CFSTR("N/A");
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:](self, "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:", v55, &v54, &v53, &v52, &v51, &v50, &v49);
  v45 = (__CFString *)v55[0];
  v44 = v54;
  v43 = v53;
  v42 = v52;
  v41 = v51;
  v48 = v50;
  v47 = v49;
  v38 = (void *)MEMORY[0x1E0CB3940];
  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "summary");
  v39 = objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched"))
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  v37 = v4;
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"))
    v3 = CFSTR("Y");
  v5 = -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs");
  v6 = -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs");
  v7 = -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs");
  v8 = -[MAAutoAssetSummary activeClientCount](self, "activeClientCount");
  v9 = -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount");
  v10 = -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount");
  v11 = -[MAAutoAssetSummary totalClientCount](self, "totalClientCount");
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "description");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v3;
    v16 = (void *)v14;
    v35 = v11;
    v31 = v9;
    v33 = v10;
    v27 = v7;
    v29 = v8;
    v25 = v6;
    v18 = v41;
    v17 = v42;
    v19 = v43;
    v20 = v44;
    v21 = v45;
    v22 = (void *)v39;
    objc_msgSend(v38, "stringWithFormat:", CFSTR(">>>\n                   assetSelector: %@\n             assetRepresentation: %@\n                 assetWasPatched: %@\n                   assetIsStaged: %@\n              assetIsSecureAsset: %@\n       secureAssetIsPersonalized: %@\n    secureAssetIsPrePersonalized: %@\n      secureMobileAssetIsGrafted: %@\n     secureMobileAssetGraftPoint: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n                      stageGroup: %@\n                 targetOSVersion: %@\n%@<<<]"), v39, v46, v37, v15, v45, v44, v43, v42, v41, v5, v25, v27, v29, v31, v33, v35,
      v48,
      v47,
      v14);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = v11;
    v32 = v9;
    v34 = v10;
    v28 = v7;
    v30 = v8;
    v26 = v6;
    v18 = v41;
    v17 = v42;
    v19 = v43;
    v20 = v44;
    v21 = v45;
    v22 = (void *)v39;
    objc_msgSend(v38, "stringWithFormat:", CFSTR(">>>\n                   assetSelector: %@\n             assetRepresentation: %@\n                 assetWasPatched: %@\n                   assetIsStaged: %@\n              assetIsSecureAsset: %@\n       secureAssetIsPersonalized: %@\n    secureAssetIsPrePersonalized: %@\n      secureMobileAssetIsGrafted: %@\n     secureMobileAssetGraftPoint: %@\n           scheduledIntervalSecs: %ld\n          scheduledRemainingSecs: %ld\n                   pushDelaySecs: %ld\n               activeClientCount: %ld\n              activeMonitorCount: %ld\n              maximumClientCount: %ld\n                totalClientCount: %ld\n                      stageGroup: %@\n                 targetOSVersion: %@\n%@<<<]"), v39, v46, v37, v3, v45, v44, v43, v42, v41, v5, v26, v28, v30, v32, v34, v36,
      v48,
      v47,
      CFSTR("                       jobStatus: N\n"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (id)summary
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  __CFString *v34;
  id v35[2];

  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "summary");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched"))
    v4 = CFSTR("Y");
  else
    v4 = CFSTR("N");
  v26 = v4;
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"))
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  v21 = v5;
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "summary");
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = CFSTR("NONE");
  }

  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v34 = CFSTR("N/A");
  v35[0] = CFSTR("N");
  v32 = CFSTR("N/A");
  v33 = CFSTR("N/A");
  v30 = CFSTR("N/A");
  v31 = CFSTR("N/A");
  v29 = CFSTR("N/A");
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:](self, "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:", v35, &v34, &v33, &v32, &v31, &v30, &v29);
  v8 = (__CFString *)v35[0];
  v9 = v34;
  v10 = v33;
  v11 = v32;
  v12 = v31;
  v13 = v30;
  v14 = v29;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("asset(%@)[%@]|patched:%@|staged:%@|secureMobileAsset:%@|personalized:%@|prePersonalized:%@|grafted:%@|graftPoint:%@|status:%@|interval:%@|remaining:%@|pushDelay:%@|clients:%@|monitors:%@|maxClients:%@|totalClients:%@|stageGroup:%@|targetOSVersion:%@"), v28, v27, v26, v21, v8, v9, v10, v11, v12, v25, v24, v23, v22, v20, v19, v17,
    v16,
    v13,
    v14);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)newSummaryDictionary
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  __CFString *v28;
  __CFString *v29;
  __CFString *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = CFSTR("NO");
  v33 = CFSTR("NO");
  v30 = CFSTR("NO");
  v31 = CFSTR("NO");
  v28 = CFSTR("N/A");
  v29 = CFSTR("N/A");
  v27 = CFSTR("N/A");
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:](self, "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:", &v33, &v32, &v31, &v30, &v29, &v28, &v27);
  v4 = v33;
  v5 = v32;
  v6 = v31;
  v7 = v30;
  v8 = v29;
  v26 = v28;
  v25 = v27;
  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newSummaryDictionary");
  objc_msgSend(v3, "setSafeObject:forKey:", v10, CFSTR("assetSelector"));

  -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v11, CFSTR("assetRepresentation"));

  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v12, CFSTR("assetWasPatched"));
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v3, "setSafeObject:forKey:", v13, CFSTR("assetIsStaged"));
  objc_msgSend(v3, "setSafeObject:forKey:", v4, CFSTR("assetIsSecureMobileAsset"));
  objc_msgSend(v3, "setSafeObject:forKey:", v5, CFSTR("secureMobileAssetIsPersonalized"));
  objc_msgSend(v3, "setSafeObject:forKey:", v6, CFSTR("secureMobileAssetIsPrePersonalized"));
  objc_msgSend(v3, "setSafeObject:forKey:", v7, CFSTR("secureMobileAssetIsGrafted"));
  objc_msgSend(v3, "setSafeObject:forKey:", v8, CFSTR("secureMobileAssetGraftPoint"));
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "newSummaryDictionary");
    objc_msgSend(v3, "setSafeObject:forKey:", v16, CFSTR("jobStatus"));

  }
  else
  {
    v15 = objc_alloc_init(MEMORY[0x1E0C99D80]);
    objc_msgSend(v3, "setSafeObject:forKey:", v15, CFSTR("jobStatus"));
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v17, CFSTR("scheduledIntervalSecs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v18, CFSTR("scheduledRemainingSecs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v19, CFSTR("pushDelaySecs"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v20, CFSTR("activeClientCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v21, CFSTR("activeMonitorCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v22, CFSTR("maximumClientCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSafeObject:forKey:", v23, CFSTR("totalClientCount"));

  objc_msgSend(v3, "setSafeObject:forKey:", v26, CFSTR("stageGroup"));
  objc_msgSend(v3, "setSafeObject:forKey:", v25, CFSTR("targetOSKey"));

  return v3;
}

- (void)summaryBuildMaxColumnStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;
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
  unint64_t v47;
  void *v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  unint64_t v58;
  unint64_t v59;
  void *v60;
  unint64_t v61;
  unint64_t v62;
  void *v63;
  unint64_t v64;
  unint64_t v65;
  void *v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  unint64_t v70;
  unint64_t v71;
  void *v72;
  unint64_t v73;
  void *v74;
  __CFString *v75;
  __CFString *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  __CFString *v84;
  void *v85;
  __CFString *v86;
  __CFString *v87;
  __CFString *v88;
  __CFString *v89;
  __CFString *v90;
  __CFString *v91;
  __CFString *v92;
  id v93[2];

  v4 = a3;
  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  v86 = v7;
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  v75 = v8;
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "summary");
    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v84 = CFSTR("NONE");
  }

  v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v81 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v79 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v78 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v77 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v92 = CFSTR("NO");
  v93[0] = CFSTR("NO");
  v90 = CFSTR("NO");
  v91 = CFSTR("NO");
  v88 = CFSTR("N/A");
  v89 = CFSTR("N/A");
  v87 = CFSTR("N/A");
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:](self, "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:", v93, &v92, &v91, &v90, &v89, &v88, &v87);
  v76 = (__CFString *)v93[0];
  v11 = v92;
  v12 = v91;
  v13 = v90;
  v14 = v89;
  v15 = v88;
  v16 = v87;
  v74 = v6;
  v17 = objc_msgSend(v6, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetSelector"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "length");

  if (v17 > v19)
    objc_msgSend(v4, "setSafeObject:forKey:", v74, CFSTR("assetSelector"));
  v20 = objc_msgSend(v85, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetRepresentation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  if (v20 > v22)
    objc_msgSend(v4, "setSafeObject:forKey:", v85, CFSTR("assetRepresentation"));
  v23 = -[__CFString length](v86, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetWasPatched"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");

  if (v23 > v25)
    objc_msgSend(v4, "setSafeObject:forKey:", v86, CFSTR("assetWasPatched"));
  v26 = -[__CFString length](v75, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetIsStaged"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "length");

  if (v26 > v28)
    objc_msgSend(v4, "setSafeObject:forKey:", v86, CFSTR("assetIsStaged"));
  v29 = -[__CFString length](v76, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetIsSecureMobileAsset"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "length");

  if (v29 > v31)
    objc_msgSend(v4, "setSafeObject:forKey:", v76, CFSTR("assetIsSecureMobileAsset"));
  v32 = -[__CFString length](v11, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("secureMobileAssetIsPersonalized"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v32 > v34)
    objc_msgSend(v4, "setSafeObject:forKey:", v11, CFSTR("secureMobileAssetIsPersonalized"));
  v35 = -[__CFString length](v12, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("secureMobileAssetIsPrePersonalized"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "length");

  if (v35 > v37)
    objc_msgSend(v4, "setSafeObject:forKey:", v12, CFSTR("secureMobileAssetIsPrePersonalized"));
  v38 = -[__CFString length](v13, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("secureMobileAssetIsGrafted"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "length");

  if (v38 > v40)
    objc_msgSend(v4, "setSafeObject:forKey:", v13, CFSTR("secureMobileAssetIsGrafted"));
  v41 = -[__CFString length](v14, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("secureMobileAssetGraftPoint"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "length");

  if (v41 > v43)
    objc_msgSend(v4, "setSafeObject:forKey:", v14, CFSTR("secureMobileAssetGraftPoint"));
  v44 = -[__CFString length](v84, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("jobStatus"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "length");

  if (v44 > v46)
    objc_msgSend(v4, "setSafeObject:forKey:", v84, CFSTR("jobStatus"));
  v47 = objc_msgSend(v83, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("scheduledIntervalSecs"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length");

  if (v47 > v49)
    objc_msgSend(v4, "setSafeObject:forKey:", v83, CFSTR("scheduledIntervalSecs"));
  v50 = objc_msgSend(v82, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("scheduledRemainingSecs"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "length");

  if (v50 > v52)
    objc_msgSend(v4, "setSafeObject:forKey:", v82, CFSTR("scheduledRemainingSecs"));
  v53 = objc_msgSend(v81, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("pushDelaySecs"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v54, "length");

  if (v53 > v55)
    objc_msgSend(v4, "setSafeObject:forKey:", v81, CFSTR("pushDelaySecs"));
  v56 = objc_msgSend(v80, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeClientCount"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "length");

  if (v56 > v58)
    objc_msgSend(v4, "setSafeObject:forKey:", v80, CFSTR("activeClientCount"));
  v59 = objc_msgSend(v79, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = objc_msgSend(v60, "length");

  if (v59 > v61)
    objc_msgSend(v4, "setSafeObject:forKey:", v79, CFSTR("activeMonitorCount"));
  v62 = objc_msgSend(v78, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("maximumClientCount"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "length");

  if (v62 > v64)
    objc_msgSend(v4, "setSafeObject:forKey:", v78, CFSTR("maximumClientCount"));
  v65 = objc_msgSend(v77, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("totalClientCount"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = objc_msgSend(v66, "length");

  if (v65 > v67)
    objc_msgSend(v4, "setSafeObject:forKey:", v77, CFSTR("totalClientCount"));
  v68 = -[__CFString length](v15, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("stageGroup"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "length");

  if (v68 < v70)
    objc_msgSend(v4, "setSafeObject:forKey:", v15, CFSTR("stageGroup"));
  v71 = -[__CFString length](v16, "length");
  objc_msgSend(v4, "safeStringForKey:", CFSTR("targetOSKey"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = objc_msgSend(v72, "length");

  if (v71 < v73)
    objc_msgSend(v4, "setSafeObject:forKey:", v16, CFSTR("targetOSKey"));

}

- (id)summaryPadded:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  id v36;
  id v37;
  __CFString *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  __CFString *v44;
  void *v45;
  __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  __CFString *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  __CFString *v69;
  __CFString *v70;
  __CFString *v71;
  __CFString *v72;
  __CFString *v73;
  __CFString *v74;
  __CFString *v75;
  __CFString *v76;
  id v77[2];

  v4 = a3;
  -[MAAutoAssetSummary assetSelector](self, "assetSelector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "summary");
  v6 = objc_claimAutoreleasedReturnValue();

  -[MAAutoAssetSummary assetRepresentationName](self, "assetRepresentationName");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSummary assetWasPatched](self, "assetWasPatched"))
    v7 = CFSTR("Y");
  else
    v7 = CFSTR("N");
  v61 = v7;
  if (-[MAAutoAssetSummary assetIsStaged](self, "assetIsStaged"))
    v8 = CFSTR("Y");
  else
    v8 = CFSTR("N");
  v69 = v8;
  -[MAAutoAssetSummary jobStatus](self, "jobStatus");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[MAAutoAssetSummary jobStatus](self, "jobStatus");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "summary");
    v70 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v70 = CFSTR("NONE");
  }

  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary scheduledIntervalSecs](self, "scheduledIntervalSecs"));
  v68 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary scheduledRemainingSecs](self, "scheduledRemainingSecs"));
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary pushDelaySecs](self, "pushDelaySecs"));
  v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary activeClientCount](self, "activeClientCount"));
  v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary activeMonitorCount](self, "activeMonitorCount"));
  v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary maximumClientCount](self, "maximumClientCount"));
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), -[MAAutoAssetSummary totalClientCount](self, "totalClientCount"));
  v76 = CFSTR("NO");
  v77[0] = CFSTR("NO");
  v74 = CFSTR("NO");
  v75 = CFSTR("NO");
  v72 = CFSTR("N/A");
  v73 = CFSTR("N/A");
  v71 = CFSTR("N/A");
  -[MAAutoAssetSummary getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:](self, "getStringsForSummaryProps:isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:", v77, &v76, &v75, &v74, &v73, &v72, &v71);
  v46 = (__CFString *)v77[0];
  v44 = v76;
  v42 = v75;
  v40 = v74;
  v38 = v73;
  v59 = v72;
  v34 = v71;
  v36 = (id)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetSelector"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v6;
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v6, v48, CFSTR(" "), 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetRepresentation"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v60, v47, CFSTR(" "), 0);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetWasPatched"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v61, v45, CFSTR(" "), 0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetIsStaged"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v69, v43, CFSTR(" "), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetIsSecureMobileAsset"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v46, v41, CFSTR(" "), 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("secureMobileAssetIsPersonalized"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v44, v39, CFSTR(" "), 0);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("secureMobileAssetIsPrePersonalized"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v42, v35, CFSTR(" "), 0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("secureMobileAssetIsGrafted"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v40, v33, CFSTR(" "), 0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("secureMobileAssetGraftPoint"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v38, v31, CFSTR(" "), 0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("jobStatus"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v70, v30, CFSTR(" "), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("scheduledIntervalSecs"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v63, v29, CFSTR(" "), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("scheduledRemainingSecs"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v68, v28, CFSTR(" "), 1);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("pushDelaySecs"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v67, v27, CFSTR(" "), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeClientCount"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v66, v25, CFSTR(" "), 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v65, v23, CFSTR(" "), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("maximumClientCount"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v64, v22, CFSTR(" "), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("totalClientCount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v62, v20, CFSTR(" "), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("stageGroup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v59, v14, CFSTR(" "), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("targetOSKey"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", v34, v16, CFSTR(" "), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v36, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v58, v57, v56, v55, v54, v53, v52, v50, v51, v26, v24, v49, v19, v21, v11, v12,
    v13,
    v15,
    v17);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  return v37;
}

- (id)assetRepresentationName
{
  return +[MAAutoAssetSummary assetRepresentationName:](MAAutoAssetSummary, "assetRepresentationName:", -[MAAutoAssetSummary assetRepresentation](self, "assetRepresentation"));
}

+ (id)assetRepresentationName:(int64_t)a3
{
  __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  id result;

  v3 = CFSTR("UNKNOWN");
  if (a3 > 400)
  {
    switch(a3)
    {
      case 600:
        result = CFSTR("CandidateForStaging");
        break;
      case 601:
        result = CFSTR("AvailableForStaging");
        break;
      case 602:
        result = CFSTR("BeingStaged");
        break;
      case 603:
        result = CFSTR("Staged");
        break;
      default:
        if (a3 == 500)
          v3 = CFSTR("VersionDownloaded");
        if (a3 == 401)
          result = CFSTR("ScheduledPushed");
        else
          result = v3;
        break;
    }
  }
  else
  {
    v4 = CFSTR("AwaitingUnlock");
    v5 = CFSTR("Active");
    v6 = CFSTR("Scheduled");
    if (a3 != 400)
      v6 = CFSTR("UNKNOWN");
    if (a3 != 300)
      v5 = v6;
    if (a3 != 201)
      v4 = v5;
    if (a3 == 200)
      v3 = CFSTR("AwaitingSync");
    if (a3 == 100)
      v3 = CFSTR("Monitor");
    if (!a3)
      v3 = CFSTR("None");
    if (a3 <= 200)
      return v3;
    else
      return (id)v4;
  }
  return result;
}

+ (id)summaryNewMaxColumnStrings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetSelector"), CFSTR("assetSelector"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetRepresentation"), CFSTR("assetRepresentation"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetWasPatched"), CFSTR("assetWasPatched"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetIsStaged"), CFSTR("assetIsStaged"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("assetIsSecureMobileAsset"), CFSTR("assetIsSecureMobileAsset"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("secureMobileAssetIsPersonalized"), CFSTR("secureMobileAssetIsPersonalized"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("secureMobileAssetIsPrePersonalized"), CFSTR("secureMobileAssetIsPrePersonalized"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("secureMobileAssetIsGrafted"), CFSTR("secureMobileAssetIsGrafted"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("secureMobileAssetGraftPoint"), CFSTR("secureMobileAssetGraftPoint"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("jobStatus"), CFSTR("jobStatus"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("scheduledIntervalSecs"), CFSTR("scheduledIntervalSecs"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("scheduledRemainingSecs"), CFSTR("scheduledRemainingSecs"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("activeClientCount"), CFSTR("activeClientCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("activeMonitorCount"), CFSTR("activeMonitorCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("maximumClientCount"), CFSTR("maximumClientCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("totalClientCount"), CFSTR("totalClientCount"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("stageGroup"), CFSTR("stageGroup"));
  objc_msgSend(v2, "setSafeObject:forKey:", CFSTR("targetOSKey"), CFSTR("targetOSKey"));
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
  void *v10;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v42;

  v26 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSelector"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetSelector"), v33, CFSTR(" "), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetRepresentation"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetRepresentation"), v32, CFSTR(" "), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetWasPatched"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetWasPatched"), v31, CFSTR(" "), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetIsStaged"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetIsStaged"), v30, CFSTR(" "), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetIsSecureMobileAsset"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("assetIsSecureMobileAsset"), v29, CFSTR(" "), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("secureMobileAssetIsPersonalized"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("secureMobileAssetIsPersonalized"), v28, CFSTR(" "), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("secureMobileAssetIsPrePersonalized"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("secureMobileAssetIsPrePersonalized"), v25, CFSTR(" "), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("secureMobileAssetIsGrafted"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("secureMobileAssetIsGrafted"), v24, CFSTR(" "), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("secureMobileAssetGraftPoint"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("secureMobileAssetGraftPoint"), v23, CFSTR(" "), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("jobStatus"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("jobStatus"), v22, CFSTR(" "), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("scheduledIntervalSecs"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("scheduledIntervalSecs"), v21, CFSTR(" "), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("scheduledRemainingSecs"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("scheduledRemainingSecs"), v20, CFSTR(" "), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeClientCount"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("activeClientCount"), v19, CFSTR(" "), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("activeMonitorCount"), v17, CFSTR(" "), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumClientCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("maximumClientCount"), v15, CFSTR(" "), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalClientCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("totalClientCount"), v12, CFSTR(" "), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("stageGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("stageGroup"), v5, CFSTR(" "), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("targetOSKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", CFSTR("targetOSKey"), v7, CFSTR(" "), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v42, v41, v40, v39, v38, v37, v36, v35, v34, v18, v16, v14, v13, v11, v10, v4,
    v6,
    v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
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
  void *v10;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v42;

  v25 = (void *)MEMORY[0x1E0CB3940];
  v3 = a3;
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetSelector"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v32, CFSTR("="), 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetRepresentation"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v31, CFSTR("="), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetWasPatched"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v30, CFSTR("="), 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetIsStaged"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v29, CFSTR("="), 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("assetIsSecureMobileAsset"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v28, CFSTR("="), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("secureMobileAssetIsPersonalized"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v27, CFSTR("="), 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("secureMobileAssetIsPrePersonalized"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v24, CFSTR("="), 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("secureMobileAssetIsGrafted"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v23, CFSTR("="), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("secureMobileAssetGraftPoint"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v22, CFSTR("="), 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("jobStatus"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v21, CFSTR("="), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("scheduledIntervalSecs"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v20, CFSTR("="), 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("scheduledRemainingSecs"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v19, CFSTR("="), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeClientCount"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v18, CFSTR("="), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("activeMonitorCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v16, CFSTR("="), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("maximumClientCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v15, CFSTR("="), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("totalClientCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v12, CFSTR("="), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("stageGroup"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v7, CFSTR("="), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("targetOSKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MAAutoAssetSummary summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:](MAAutoAssetSummary, "summaryPaddedString:paddingToLenghtOfString:paddingWith:paddingBefore:", &stru_1E5D5F930, v9, CFSTR("="), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", CFSTR("%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@|%@"), v42, v41, v40, v39, v38, v37, v36, v35, v34, v17, v33, v14, v13, v4, v5, v6,
    v8,
    v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (void)setAssetSelector:(id)a3
{
  objc_storeStrong((id *)&self->_assetSelector, a3);
}

- (int64_t)assetRepresentation
{
  return self->_assetRepresentation;
}

- (void)setAssetRepresentation:(int64_t)a3
{
  self->_assetRepresentation = a3;
}

- (BOOL)assetWasPatched
{
  return self->_assetWasPatched;
}

- (void)setAssetWasPatched:(BOOL)a3
{
  self->_assetWasPatched = a3;
}

- (BOOL)assetIsStaged
{
  return self->_assetIsStaged;
}

- (void)setAssetIsStaged:(BOOL)a3
{
  self->_assetIsStaged = a3;
}

- (BOOL)assetIsSecureMobileAsset
{
  return self->_assetIsSecureMobileAsset;
}

- (void)setAssetIsSecureMobileAsset:(BOOL)a3
{
  self->_assetIsSecureMobileAsset = a3;
}

- (BOOL)secureMobileAssetIsPersonalized
{
  return self->_secureMobileAssetIsPersonalized;
}

- (void)setSecureMobileAssetIsPersonalized:(BOOL)a3
{
  self->_secureMobileAssetIsPersonalized = a3;
}

- (BOOL)secureMobileAssetIsPrePersonalized
{
  return self->_secureMobileAssetIsPrePersonalized;
}

- (void)setSecureMobileAssetIsPrePersonalized:(BOOL)a3
{
  self->_secureMobileAssetIsPrePersonalized = a3;
}

- (BOOL)secureMobileAssetIsGrafted
{
  return self->_secureMobileAssetIsGrafted;
}

- (void)setSecureMobileAssetIsGrafted:(BOOL)a3
{
  self->_secureMobileAssetIsGrafted = a3;
}

- (NSString)secureMobileAssetGraftPoint
{
  return self->_secureMobileAssetGraftPoint;
}

- (void)setSecureMobileAssetGraftPoint:(id)a3
{
  objc_storeStrong((id *)&self->_secureMobileAssetGraftPoint, a3);
}

- (MAAutoAssetStatus)jobStatus
{
  return self->_jobStatus;
}

- (void)setJobStatus:(id)a3
{
  objc_storeStrong((id *)&self->_jobStatus, a3);
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

- (unint64_t)stageGroup
{
  return self->_stageGroup;
}

- (void)setStageGroup:(unint64_t)a3
{
  self->_stageGroup = a3;
}

- (NSString)targetOS
{
  return self->_targetOS;
}

- (void)setTargetOS:(id)a3
{
  objc_storeStrong((id *)&self->_targetOS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetOS, 0);
  objc_storeStrong((id *)&self->_jobStatus, 0);
  objc_storeStrong((id *)&self->_secureMobileAssetGraftPoint, 0);
  objc_storeStrong((id *)&self->_assetSelector, 0);
}

- (void)getStringsForSummaryProps:(os_log_t)log isPersonalized:isPrePersonalized:isGrafted:graftPoint:stageGroup:targetOS:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE33B000, log, OS_LOG_TYPE_ERROR, "Invalid arguments passed to getStringsForSummaryProps", v1, 2u);
}

@end
