@implementation HMDCoreDataCloudKitSetupActivityLogEvent

- (HMDCoreDataCloudKitSetupActivityLogEvent)initWithActivityIdentifier:(id)a3 setupSessionIdentifier:(id)a4
{
  id v7;
  id v8;
  HMDCoreDataCloudKitSetupActivityLogEvent *v9;
  HMDCoreDataCloudKitSetupActivityLogEvent *v10;
  NSString *phaseErrorDomain;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDCoreDataCloudKitSetupActivityLogEvent;
  v9 = -[HMMLogEvent init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_activityIdentifier, a3);
    objc_storeStrong((id *)&v10->_setupSessionIdentifier, a4);
    v10->_checkAccountDurationMS = 0;
    v10->_checkUserIdentityDurationMS = 0;
    v10->_initializeAssetStorageDurationMS = 0;
    v10->_initializeDatabaseSubscriptionDurationMS = 0;
    v10->_initializeMetadataDurationMS = 0;
    v10->_initializeZoneDurationMS = 0;
    v10->_scheduledDurationMS = 0;
    v10->_totalSetupDurationMS = 0;
    phaseErrorDomain = v10->_phaseErrorDomain;
    v10->_phaseErrorDomain = 0;

  }
  return v10;
}

- (void)setDurationForPhase:(id)a3 duration:(double)a4
{
  int *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "isEqual:", CFSTR("check-account")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__checkAccountDurationMS;
LABEL_15:
    v7 = v9;
    goto LABEL_16;
  }
  if ((objc_msgSend(v9, "isEqual:", CFSTR("check-user-identity")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__checkUserIdentityDurationMS;
    goto LABEL_15;
  }
  if ((objc_msgSend(v9, "isEqual:", CFSTR("initialize-asset-storage")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__initializeAssetStorageDurationMS;
    goto LABEL_15;
  }
  if ((objc_msgSend(v9, "isEqual:", CFSTR("initialize-database-subscription")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__initializeDatabaseSubscriptionDurationMS;
    goto LABEL_15;
  }
  if ((objc_msgSend(v9, "isEqual:", CFSTR("initialize-metadata")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__initializeMetadataDurationMS;
    goto LABEL_15;
  }
  if ((objc_msgSend(v9, "isEqual:", CFSTR("initialize-zone")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__initializeZoneDurationMS;
    goto LABEL_15;
  }
  if ((objc_msgSend(v9, "isEqual:", CFSTR("scheduled")) & 1) != 0)
  {
    v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__scheduledDurationMS;
    goto LABEL_15;
  }
  v8 = objc_msgSend(v9, "isEqual:", CFSTR("event"));
  v7 = v9;
  if (!v8)
    goto LABEL_17;
  v6 = &OBJC_IVAR___HMDCoreDataCloudKitSetupActivityLogEvent__totalSetupDurationMS;
LABEL_16:
  *(Class *)((char *)&self->super.super.isa + *v6) = (Class)vcvtpd_s64_f64(a4 * 1000.0);
LABEL_17:

}

- (void)setErrorForPhase:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HMDCoreDataCloudKitSetupActivityLogEvent setPhaseErrorCode:](self, "setPhaseErrorCode:", objc_msgSend(v6, "code"));
  objc_msgSend(v6, "domain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "copy");
  -[HMDCoreDataCloudKitSetupActivityLogEvent setPhaseErrorDomain:](self, "setPhaseErrorDomain:", v9);

  v10 = (id)objc_msgSend(v7, "copy");
  -[HMDCoreDataCloudKitSetupActivityLogEvent setErrorPhaseName:](self, "setErrorPhaseName:", v10);

}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.coredata.cloudkit.setup");
}

- (NSDictionary)coreAnalyticsEventDictionary
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent checkAccountDurationMS](self, "checkAccountDurationMS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("checkAccountDurationMS"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent checkUserIdentityDurationMS](self, "checkUserIdentityDurationMS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("checkUserIdentityDurationMS"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent initializeAssetStorageDurationMS](self, "initializeAssetStorageDurationMS"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("initializeAssetStorageDurationMS"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent initializeDatabaseSubscriptionDurationMS](self, "initializeDatabaseSubscriptionDurationMS"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("initializeDatabaseSubscriptionDurationMS"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent initializeMetadataDurationMS](self, "initializeMetadataDurationMS"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("initializeMetadataDurationMS"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent initializeZoneDurationMS](self, "initializeZoneDurationMS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("initializeZoneDurationMS"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent scheduledDurationMS](self, "scheduledDurationMS"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("scheduledDurationMS"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", -[HMDCoreDataCloudKitSetupActivityLogEvent totalSetupDurationMS](self, "totalSetupDurationMS"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("totalSetupDurationMS"));

  -[HMDCoreDataCloudKitSetupActivityLogEvent setupSessionIdentifier](self, "setupSessionIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[HMDCoreDataCloudKitSetupActivityLogEvent setupSessionIdentifier](self, "setupSessionIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("setupSessionIdentifier"));

  }
  -[HMDCoreDataCloudKitSetupActivityLogEvent phaseErrorDomain](self, "phaseErrorDomain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[HMDCoreDataCloudKitSetupActivityLogEvent phaseErrorCode](self, "phaseErrorCode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("phaseErrorCode"));

    -[HMDCoreDataCloudKitSetupActivityLogEvent phaseErrorDomain](self, "phaseErrorDomain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("phaseErrorDomain"));

    -[HMDCoreDataCloudKitSetupActivityLogEvent errorPhaseName](self, "errorPhaseName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("errorPhaseName"));

  }
  v18 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v18;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 0;
}

- (NSString)description
{
  void *v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[HMDCoreDataCloudKitSetupActivityLogEvent checkAccountDurationMS](self, "checkAccountDurationMS");
  v5 = -[HMDCoreDataCloudKitSetupActivityLogEvent checkUserIdentityDurationMS](self, "checkUserIdentityDurationMS");
  v6 = -[HMDCoreDataCloudKitSetupActivityLogEvent initializeAssetStorageDurationMS](self, "initializeAssetStorageDurationMS");
  v7 = -[HMDCoreDataCloudKitSetupActivityLogEvent initializeDatabaseSubscriptionDurationMS](self, "initializeDatabaseSubscriptionDurationMS");
  v8 = -[HMDCoreDataCloudKitSetupActivityLogEvent initializeMetadataDurationMS](self, "initializeMetadataDurationMS");
  v9 = -[HMDCoreDataCloudKitSetupActivityLogEvent initializeZoneDurationMS](self, "initializeZoneDurationMS");
  v10 = -[HMDCoreDataCloudKitSetupActivityLogEvent scheduledDurationMS](self, "scheduledDurationMS");
  v11 = -[HMDCoreDataCloudKitSetupActivityLogEvent totalSetupDurationMS](self, "totalSetupDurationMS");
  -[HMDCoreDataCloudKitSetupActivityLogEvent errorPhaseName](self, "errorPhaseName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("HMDCoreDataCloudKitSetupActivityLogEvent:\ncheck accout: %ld\ncheck account identity: %ld\ninitialize asset storage: %ld\ninitialize database subscription: %ld\ninitialize metadata: %ld\ninitialize zone: %ld\nscheduled: %ld\ntotal: %ld, error: %@"), v4, v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (NSUUID)activityIdentifier
{
  return self->_activityIdentifier;
}

- (NSString)setupSessionIdentifier
{
  return self->_setupSessionIdentifier;
}

- (int64_t)checkAccountDurationMS
{
  return self->_checkAccountDurationMS;
}

- (void)setCheckAccountDurationMS:(int64_t)a3
{
  self->_checkAccountDurationMS = a3;
}

- (int64_t)checkUserIdentityDurationMS
{
  return self->_checkUserIdentityDurationMS;
}

- (void)setCheckUserIdentityDurationMS:(int64_t)a3
{
  self->_checkUserIdentityDurationMS = a3;
}

- (int64_t)initializeAssetStorageDurationMS
{
  return self->_initializeAssetStorageDurationMS;
}

- (void)setInitializeAssetStorageDurationMS:(int64_t)a3
{
  self->_initializeAssetStorageDurationMS = a3;
}

- (int64_t)initializeDatabaseSubscriptionDurationMS
{
  return self->_initializeDatabaseSubscriptionDurationMS;
}

- (void)setInitializeDatabaseSubscriptionDurationMS:(int64_t)a3
{
  self->_initializeDatabaseSubscriptionDurationMS = a3;
}

- (int64_t)initializeMetadataDurationMS
{
  return self->_initializeMetadataDurationMS;
}

- (void)setInitializeMetadataDurationMS:(int64_t)a3
{
  self->_initializeMetadataDurationMS = a3;
}

- (int64_t)initializeZoneDurationMS
{
  return self->_initializeZoneDurationMS;
}

- (void)setInitializeZoneDurationMS:(int64_t)a3
{
  self->_initializeZoneDurationMS = a3;
}

- (int64_t)scheduledDurationMS
{
  return self->_scheduledDurationMS;
}

- (void)setScheduledDurationMS:(int64_t)a3
{
  self->_scheduledDurationMS = a3;
}

- (int64_t)totalSetupDurationMS
{
  return self->_totalSetupDurationMS;
}

- (void)setTotalSetupDurationMS:(int64_t)a3
{
  self->_totalSetupDurationMS = a3;
}

- (int64_t)phaseErrorCode
{
  return self->_phaseErrorCode;
}

- (void)setPhaseErrorCode:(int64_t)a3
{
  self->_phaseErrorCode = a3;
}

- (NSString)phaseErrorDomain
{
  return self->_phaseErrorDomain;
}

- (void)setPhaseErrorDomain:(id)a3
{
  objc_storeStrong((id *)&self->_phaseErrorDomain, a3);
}

- (NSString)errorPhaseName
{
  return self->_errorPhaseName;
}

- (void)setErrorPhaseName:(id)a3
{
  objc_storeStrong((id *)&self->_errorPhaseName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorPhaseName, 0);
  objc_storeStrong((id *)&self->_phaseErrorDomain, 0);
  objc_storeStrong((id *)&self->_setupSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_activityIdentifier, 0);
}

@end
