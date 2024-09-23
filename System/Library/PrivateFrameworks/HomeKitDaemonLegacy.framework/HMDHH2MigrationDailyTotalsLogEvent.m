@implementation HMDHH2MigrationDailyTotalsLogEvent

- (id)initStartWithAutoMigration:(BOOL)a3 dryRun:(BOOL)a4 attemptCount:(id)a5
{
  uint64_t v5;
  uint64_t v6;

  v5 = 2;
  if (a4)
    v5 = 3;
  if (a3)
    v6 = 1;
  else
    v6 = v5;
  return -[HMDHH2MigrationDailyTotalsLogEvent initWithMigrationEventType:attemptCount:error:](self, "initWithMigrationEventType:attemptCount:error:", v6, a5, 0);
}

- (id)initEndWithAutoMigration:(BOOL)a3 dryRun:(BOOL)a4 attemptCount:(id)a5 error:(id)a6
{
  uint64_t v6;
  uint64_t v7;

  v6 = 5;
  if (a4)
    v6 = 6;
  if (a3)
    v7 = 4;
  else
    v7 = v6;
  return -[HMDHH2MigrationDailyTotalsLogEvent initWithMigrationEventType:attemptCount:error:](self, "initWithMigrationEventType:attemptCount:error:", v7, a5, a6);
}

- (HMDHH2MigrationDailyTotalsLogEvent)initWithMigrationEventType:(unint64_t)a3 attemptCount:(id)a4 error:(id)a5
{
  id v9;
  id v10;
  HMDHH2MigrationDailyTotalsLogEvent *v11;
  HMDHH2MigrationDailyTotalsLogEvent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HMDHH2MigrationDailyTotalsLogEvent;
  v11 = -[HMMLogEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_migrationEventType = a3;
    objc_storeStrong((id *)&v11->_attemptCount, a4);
    -[HMMLogEvent setError:](v12, "setError:", v10);
  }

  return v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.HH2MigrationDailyTotals");
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  id v3;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[HMDHH2MigrationDailyTotalsLogEvent migrationEventType](self, "migrationEventType") >= 4)
    v4 = &unk_1E8B33A20;
  else
    v4 = &unk_1E8B33A08;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("startCount"));
  if (-[HMDHH2MigrationDailyTotalsLogEvent migrationEventType](self, "migrationEventType") == 1)
    v5 = &unk_1E8B33A08;
  else
    v5 = &unk_1E8B33A20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("autoStartCount"));
  if (-[HMDHH2MigrationDailyTotalsLogEvent migrationEventType](self, "migrationEventType") == 2)
    v6 = &unk_1E8B33A08;
  else
    v6 = &unk_1E8B33A20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("manualStartCount"));
  if (-[HMDHH2MigrationDailyTotalsLogEvent migrationEventType](self, "migrationEventType") == 3)
    v7 = &unk_1E8B33A08;
  else
    v7 = &unk_1E8B33A20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("dryRunStartCount"));
  if (-[HMDHH2MigrationDailyTotalsLogEvent migrationEventType](self, "migrationEventType") <= 3)
    v8 = &unk_1E8B33A20;
  else
    v8 = &unk_1E8B33A08;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("endCount"));
  if (-[HMDHH2MigrationDailyTotalsLogEvent migrationEventType](self, "migrationEventType") == 4)
    v9 = &unk_1E8B33A08;
  else
    v9 = &unk_1E8B33A20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("autoEndCount"));
  if (-[HMDHH2MigrationDailyTotalsLogEvent migrationEventType](self, "migrationEventType") == 5)
    v10 = &unk_1E8B33A08;
  else
    v10 = &unk_1E8B33A20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("manualEndCount"));
  if (-[HMDHH2MigrationDailyTotalsLogEvent migrationEventType](self, "migrationEventType") == 6)
    v11 = &unk_1E8B33A08;
  else
    v11 = &unk_1E8B33A20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("dryRunEndCount"));
  -[HMDHH2MigrationDailyTotalsLogEvent attemptCount](self, "attemptCount");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[HMDHH2MigrationDailyTotalsLogEvent attemptCount](self, "attemptCount");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("attemptCount"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E8B33A20, CFSTR("attemptCount"));
  }

  -[HMMLogEvent error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = &unk_1E8B33A08;
  else
    v15 = &unk_1E8B33A20;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("errorCount"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E8B33A20, CFSTR("isHH2EnabledCount"));
  v16 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v16;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (unint64_t)migrationEventType
{
  return self->_migrationEventType;
}

- (NSNumber)attemptCount
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attemptCount, 0);
}

@end
