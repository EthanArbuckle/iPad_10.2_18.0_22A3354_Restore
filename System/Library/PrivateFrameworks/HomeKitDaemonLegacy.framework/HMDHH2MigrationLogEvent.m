@implementation HMDHH2MigrationLogEvent

- (HMDHH2MigrationLogEvent)initWithAutoMigration:(BOOL)a3 isDryRun:(BOOL)a4 migrationSuccessful:(BOOL)a5 totalMigrationTime:(int64_t)a6 totalMigrationAttempt:(int64_t)a7 migrationError:(id)a8 failureReason:(id)a9 coreDataValidationEntityClassName:(id)a10 coreDataValidationAttributeName:(id)a11 localizedErrorDescription:(id)a12
{
  id v16;
  id v17;
  HMDHH2MigrationLogEvent *v18;
  HMDHH2MigrationLogEvent *v19;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v16 = a8;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v17 = a12;
  v26.receiver = self;
  v26.super_class = (Class)HMDHH2MigrationLogEvent;
  v18 = -[HMMLogEvent init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_autoMigration = a3;
    v18->_dryRun = a4;
    v18->_migrationSuccessful = a5;
    v18->_totalTimeTakenForMigration = (double)a6;
    v18->_migrationAttempt = a7;
    objc_storeStrong((id *)&v18->_failureReason, a9);
    objc_storeStrong((id *)&v19->_coreDataValidationAttributeName, a11);
    objc_storeStrong((id *)&v19->_coreDataValidationEntityClassName, a10);
    objc_storeStrong((id *)&v19->_localizedErrorDescription, a12);
    -[HMMLogEvent setError:](v19, "setError:", v16);
  }

  return v19;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)CFSTR("com.apple.HomeKit.daemon.hh2MigrationEvent");
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
  HMDHH2MigrationStateLogger *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHH2MigrationLogEvent isAutoMigration](self, "isAutoMigration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isAutoMigration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHH2MigrationLogEvent isDryRun](self, "isDryRun"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isDryRun"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDHH2MigrationLogEvent totalTimeTakenForMigration](self, "totalTimeTakenForMigration");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("migrationTotalTime"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[HMDHH2MigrationLogEvent isMigrationSuccessful](self, "isMigrationSuccessful"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("migrationSuccess"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMDHH2MigrationLogEvent migrationAttempt](self, "migrationAttempt"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("migrationAttemptCount"));

  -[HMDHH2MigrationLogEvent failureReason](self, "failureReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("migrationFailureReason"));

  -[HMDHH2MigrationLogEvent coreDataValidationEntityClassName](self, "coreDataValidationEntityClassName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("validationEntityClassName"));

  -[HMDHH2MigrationLogEvent coreDataValidationAttributeName](self, "coreDataValidationAttributeName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("validationAttributeName"));

  -[HMDHH2MigrationLogEvent localizedErrorDescription](self, "localizedErrorDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("localizedDescription"));

  v14 = (void *)MEMORY[0x1D17BA0A0]();
  v15 = objc_alloc_init(HMDHH2MigrationStateLogger);
  -[HMDHH2MigrationStateLogger resetStoredMigrationState](v15, "resetStoredMigrationState");

  objc_autoreleasePoolPop(v14);
  v16 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v16;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 1;
}

- (BOOL)isAutoMigration
{
  return self->_autoMigration;
}

- (BOOL)isDryRun
{
  return self->_dryRun;
}

- (double)totalTimeTakenForMigration
{
  return self->_totalTimeTakenForMigration;
}

- (BOOL)isMigrationSuccessful
{
  return self->_migrationSuccessful;
}

- (int64_t)migrationAttempt
{
  return self->_migrationAttempt;
}

- (NSString)failureReason
{
  return self->_failureReason;
}

- (NSString)coreDataValidationEntityClassName
{
  return self->_coreDataValidationEntityClassName;
}

- (NSString)coreDataValidationAttributeName
{
  return self->_coreDataValidationAttributeName;
}

- (NSString)localizedErrorDescription
{
  return self->_localizedErrorDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedErrorDescription, 0);
  objc_storeStrong((id *)&self->_coreDataValidationAttributeName, 0);
  objc_storeStrong((id *)&self->_coreDataValidationEntityClassName, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
}

@end
