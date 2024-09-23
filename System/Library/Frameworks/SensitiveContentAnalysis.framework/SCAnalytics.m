@implementation SCAnalytics

- (SCAnalytics)init
{
  SCAnalytics *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BMStream *biomeMASStream;
  uint64_t v7;
  BMSource *biomeMASSource;
  void *v9;
  uint64_t v10;
  NSString *clientBundleID;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SCAnalytics;
  v2 = -[SCAnalytics init](&v13, sel_init);
  if (v2)
  {
    BiomeLibrary();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "SensitiveContentAnalysis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MediaAnalysis");
    v5 = objc_claimAutoreleasedReturnValue();
    biomeMASStream = v2->_biomeMASStream;
    v2->_biomeMASStream = (BMStream *)v5;

    -[BMStream source](v2->_biomeMASStream, "source");
    v7 = objc_claimAutoreleasedReturnValue();
    biomeMASSource = v2->_biomeMASSource;
    v2->_biomeMASSource = (BMSource *)v7;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    clientBundleID = v2->_clientBundleID;
    v2->_clientBundleID = (NSString *)v10;

    v2->_ageGroup = -[SCAnalytics biomeAgeGroup](v2, "biomeAgeGroup");
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_creation != -1)
    dispatch_once(&sharedInstance_creation, &__block_literal_global);
  return (id)sharedInstance_sInstance;
}

void __29__SCAnalytics_sharedInstance__block_invoke()
{
  SCAnalytics *v0;
  void *v1;

  v0 = objc_alloc_init(SCAnalytics);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

- (BOOL)collectMediaAnalysisServiceEvent:(int)a3 :(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  char v7;
  id v8;
  uint64_t ageGroup;
  NSString *clientBundleID;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  v7 = SCIsAnalyticsEnabled();
  if ((v7 & 1) != 0)
  {
    if (v4)
    {
      v8 = objc_alloc(MEMORY[0x24BE0C610]);
      ageGroup = self->_ageGroup;
      clientBundleID = self->_clientBundleID;
      v11 = v5;
      v12 = 1;
LABEL_9:
      v14 = (void *)objc_msgSend(v8, "initWithContentType:ageGroup:isSensitive:clientBundleID:trackingVersion:", v11, ageGroup, v12, clientBundleID, CFSTR("1"));
      -[SCAnalytics biomeMASSource](self, "biomeMASSource");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sendEvent:", v14);

      return v7;
    }
    if ((double)arc4random() / 4294967300.0 < 0.05)
    {
      v8 = objc_alloc(MEMORY[0x24BE0C610]);
      ageGroup = self->_ageGroup;
      clientBundleID = self->_clientBundleID;
      v11 = v5;
      v12 = 2;
      goto LABEL_9;
    }
  }
  else
  {
    +[SCLog client](SCLog, "client");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[SCAnalytics collectMediaAnalysisServiceEvent::].cold.1(v13);

  }
  return v7;
}

- (int)biomeAgeGroup
{
  void *v2;
  unint64_t v3;
  int v4;
  void *v5;

  +[SCManagedSettingsReader currentScanningPolicy](SCManagedSettingsReader, "currentScanningPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "policy");

  if (v3 < 2)
    return 3;
  +[SCManagedSettingsReader currentInterventionType](SCManagedSettingsReader, "currentInterventionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE63EE0]))
    v4 = 2;
  else
    v4 = 1;

  return v4;
}

- (BMStream)biomeMASStream
{
  return self->_biomeMASStream;
}

- (void)setBiomeMASStream:(id)a3
{
  objc_storeStrong((id *)&self->_biomeMASStream, a3);
}

- (BMSource)biomeMASSource
{
  return self->_biomeMASSource;
}

- (void)setBiomeMASSource:(id)a3
{
  objc_storeStrong((id *)&self->_biomeMASSource, a3);
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_clientBundleID, a3);
}

- (int)ageGroup
{
  return self->_ageGroup;
}

- (void)setAgeGroup:(int)a3
{
  self->_ageGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_biomeMASSource, 0);
  objc_storeStrong((id *)&self->_biomeMASStream, 0);
}

- (void)collectMediaAnalysisServiceEvent:(os_log_t)log :.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_234593000, log, OS_LOG_TYPE_DEBUG, "SCAnalytics: No consent for analytics: MAS", v1, 2u);
}

@end
