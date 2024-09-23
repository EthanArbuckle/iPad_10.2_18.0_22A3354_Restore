@implementation HMDHH2MigrationStateLogger

- (HMDHH2MigrationStateLogger)init
{
  HMDHH2MigrationStateLogger *v2;
  uint64_t v3;
  NSDictionary *logEventRecord;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDHH2MigrationStateLogger;
  v2 = -[HMDHH2MigrationStateLogger init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "migrationLogEventRecord");
    v3 = objc_claimAutoreleasedReturnValue();
    logEventRecord = v2->_logEventRecord;
    v2->_logEventRecord = (NSDictionary *)v3;

    -[HMDHH2MigrationStateLogger populateTotalMigrationTime](v2, "populateTotalMigrationTime");
  }
  return v2;
}

- (void)resetStoredMigrationState
{
  void *v2;

  if (-[HMDHH2MigrationStateLogger isMigrationSuccessful](self, "isMigrationSuccessful"))
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeObjectForKey:", CFSTR("migrationAttemptCount"));

  }
  objc_msgSend((id)objc_opt_class(), "removeMigrationLogEventRecordFromDisk");
}

- (id)migrationEndLogEventFromDisk
{
  void *v3;
  HMDHH2MigrationDailyTotalsLogEvent *v4;
  _BOOL8 v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  if (-[HMDHH2MigrationStateLogger isAutoMigration](self, "isAutoMigration"))
  {
    objc_msgSend((id)objc_opt_class(), "autoMigrationAttempt");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = [HMDHH2MigrationDailyTotalsLogEvent alloc];
  v5 = -[HMDHH2MigrationStateLogger isAutoMigration](self, "isAutoMigration");
  v6 = -[HMDHH2MigrationStateLogger isDryRun](self, "isDryRun");
  -[HMDHH2MigrationStateLogger migrationError](self, "migrationError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDHH2MigrationDailyTotalsLogEvent initEndWithAutoMigration:dryRun:attemptCount:error:](v4, "initEndWithAutoMigration:dryRun:attemptCount:error:", v5, v6, v3, v7);

  return v8;
}

- (id)migrationDetailsLogEventFromDisk
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDHH2MigrationLogEvent *v13;
  int64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  _BOOL4 v18;
  HMDHH2MigrationLogEvent *v19;

  -[HMDHH2MigrationStateLogger populateTotalMigrationTime](self, "populateTotalMigrationTime");
  v19 = [HMDHH2MigrationLogEvent alloc];
  v18 = -[HMDHH2MigrationStateLogger isAutoMigration](self, "isAutoMigration");
  v17 = -[HMDHH2MigrationStateLogger isDryRun](self, "isDryRun");
  v16 = -[HMDHH2MigrationStateLogger isMigrationSuccessful](self, "isMigrationSuccessful");
  v15 = -[HMDHH2MigrationStateLogger totalTimeTakenForMigration](self, "totalTimeTakenForMigration");
  v3 = objc_msgSend((id)objc_opt_class(), "migrationAttempt");
  -[HMDHH2MigrationStateLogger migrationError](self, "migrationError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("migrationFailureReason"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("validationEntityClassName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("validationAttributeName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("localizedDescription"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMDHH2MigrationLogEvent initWithAutoMigration:isDryRun:migrationSuccessful:totalMigrationTime:totalMigrationAttempt:migrationError:failureReason:coreDataValidationEntityClassName:coreDataValidationAttributeName:localizedErrorDescription:](v19, "initWithAutoMigration:isDryRun:migrationSuccessful:totalMigrationTime:totalMigrationAttempt:migrationError:failureReason:coreDataValidationEntityClassName:coreDataValidationAttributeName:localizedErrorDescription:", v18, v17, v16, v15, v3, v4, v6, v8, v10, v12);

  return v13;
}

- (BOOL)shouldSubmitLogEvent
{
  return objc_msgSend((id)objc_opt_class(), "doesLogEventExistOnDisk");
}

- (void)populateTotalMigrationTime
{
  int64_t v3;

  v3 = -[HMDHH2MigrationStateLogger migrationEndTime](self, "migrationEndTime");
  self->_totalTimeTakenForMigration = v3 - -[HMDHH2MigrationStateLogger migrationStartTime](self, "migrationStartTime");
}

- (id)migrationError
{
  void *v2;
  void *v3;

  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_errorForKey:", CFSTR("migrationError"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAutoMigration
{
  void *v2;
  char v3;

  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmf_BOOLForKey:", CFSTR("isAutoMigration"));

  return v3;
}

- (BOOL)isDryRun
{
  void *v2;
  char v3;

  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hmf_BOOLForKey:", CFSTR("isDryRun"));

  return v3;
}

- (int64_t)migrationStartTime
{
  void *v2;
  void *v3;
  int64_t v4;

  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("migrationStartTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (int64_t)migrationEndTime
{
  void *v2;
  void *v3;
  int64_t v4;

  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("migrationEndTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  return v4;
}

- (BOOL)isMigrationSuccessful
{
  void *v2;
  void *v3;
  char v4;

  -[HMDHH2MigrationStateLogger logEventRecord](self, "logEventRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hmf_numberForKey:", CFSTR("migrationSuccess"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int64_t)totalTimeTakenForMigration
{
  return self->_totalTimeTakenForMigration;
}

- (NSDictionary)logEventRecord
{
  return self->_logEventRecord;
}

- (void)setLogEventRecord:(id)a3
{
  objc_storeStrong((id *)&self->_logEventRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventRecord, 0);
}

+ (void)recordMigrationStart:(BOOL)a3 isDryRun:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v6;

  v4 = a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "removeMigrationLogEventRecordFromDisk");
  objc_msgSend((id)objc_opt_class(), "setAutoMigration:", v5);
  objc_msgSend((id)objc_opt_class(), "incrementMigrationAttempt");
  v6 = (void *)objc_opt_class();
  mach_absolute_time();
  objc_msgSend(v6, "recordMigrationStartTimeWithValue:", UpTicksToSeconds());
  objc_msgSend((id)objc_opt_class(), "recordIsDryRun:", v4);
}

+ (void)recordMigrationEnd:(BOOL)a3
{
  void *v3;

  objc_msgSend((id)objc_opt_class(), "setMigrationSuccessful:", a3);
  v3 = (void *)objc_opt_class();
  mach_absolute_time();
  objc_msgSend(v3, "recordMigrationEndTimeWithValue:", UpTicksToSeconds());
}

+ (void)recordIsDryRun:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitMigrationLogEventToDiskWithKey:value:", CFSTR("isDryRun"), v5);

}

+ (void)recordMigrationFailedWithError:(id)a3 withReason:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "migrationLogEventRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__6152;
  v28 = __Block_byref_object_dispose__6153;
  v9 = v5;
  v29 = v9;
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend((id)v25[5], "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDBB408]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;

    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __72__HMDHH2MigrationStateLogger_recordMigrationFailedWithError_withReason___block_invoke;
    v23[3] = &unk_24E774938;
    v23[4] = &v24;
    objc_msgSend(v14, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v23);
    objc_msgSend((id)objc_opt_class(), "_addInfoFromCoreDataError:logEvent:", v25[5], v8);

  }
  objc_msgSend((id)v25[5], "domain");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = objc_alloc(MEMORY[0x24BDD1540]);
    objc_msgSend((id)v25[5], "domain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, objc_msgSend((id)v25[5], "code"), 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = objc_msgSend((id)v25[5], "code");
    v21 = *MEMORY[0x24BDD5BD8];
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD5BD8], v20, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BDD1398]);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", v21, 2717, v17);

  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("migrationError"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, CFSTR("migrationFailureReason"));
  objc_msgSend((id)objc_opt_class(), "commitMigrationLogEventToDisk:", v8);

  _Block_object_dispose(&v24, 8);
}

+ (void)_addInfoFromCoreDataError:(id)a3 logEvent:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v5 = a4;
  objc_msgSend(v18, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("localizedDescription"));

  objc_msgSend(v18, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v18, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDBB5A8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

    if (v11)
    {
      objc_msgSend(v11, "entity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "managedObjectClassName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("validationEntityClassName"));

    }
    objc_msgSend(v18, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDBB5A0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("validationAttributeName"));
  }

}

+ (void)setAutoMigration:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitMigrationLogEventToDiskWithKey:value:", CFSTR("isAutoMigration"), v5);

}

+ (void)recordMigrationStartTimeWithValue:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitMigrationLogEventToDiskWithKey:value:", CFSTR("migrationStartTime"), v5);

}

+ (void)recordMigrationEndTimeWithValue:(unint64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitMigrationLogEventToDiskWithKey:value:", CFSTR("migrationEndTime"), v5);

}

+ (void)setMigrationSuccessful:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commitMigrationLogEventToDiskWithKey:value:", CFSTR("migrationSuccess"), v5);

}

+ (void)incrementMigrationAttempt
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend((id)objc_opt_class(), "migrationAttempt");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInteger:forKey:", v2 + 1, CFSTR("migrationAttemptCount"));

}

+ (int64_t)migrationAttempt
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("migrationAttemptCount"));

  return v3;
}

+ (id)autoMigrationAttempt
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "softwareVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "buildVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("autoMigrationAttemptCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = v7;

    objc_msgSend(v8, "objectForKey:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
    v11 = v10;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)incrementAutoMigrationAttempt
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "softwareVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "autoMigrationAttempt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "integerValue") + 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v28 = v13;
        v29 = 2114;
        v30 = v9;
        v31 = 2114;
        v32 = v6;
        _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Incrementing auto migration attempt to %{public}@ for build %{public}@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      v25 = v6;
      v26 = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("autoMigrationAttemptCount"));

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        v29 = 2114;
        v30 = v6;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Initializing first auto migration attempt for build %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      v23 = v6;
      v24 = &unk_24E96A1A8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("autoMigrationAttemptCount"));
    }

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v18;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_FAULT, "%{public}@Should not get here, skipping incrementing auto migration attempt due to missing build version", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
  }

}

+ (void)commitMigrationLogEventToDiskWithKey:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "migrationLogEventRecord");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, v7);
  objc_msgSend(a1, "commitMigrationLogEventToDisk:", v9);

}

+ (void)commitMigrationLogEventToDisk:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  id v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (id)hh2MigrationLogEventPath;
  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v9;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Going to write migration log event : [%@]", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  encodeRootObject();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v19 = v7;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v15;
      v22 = 2112;
      v23 = v5;
      v16 = "%{public}@Unable to write migration log event at location : %@";
      v17 = v14;
      v18 = 22;
      goto LABEL_9;
    }
LABEL_10:

    objc_autoreleasePoolPop(v12);
    goto LABEL_11;
  }
  if ((objc_msgSend(v10, "writeToFile:atomically:", v5, 1) & 1) == 0)
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = v7;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v15;
      v22 = 2112;
      v23 = v11;
      v24 = 2112;
      v25 = v5;
      v16 = "%{public}@Unable to write migration log event [%@] to location : %@";
      v17 = v14;
      v18 = 32;
LABEL_9:
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v20, v18);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
LABEL_11:

}

+ (id)allowedValues
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3, v6, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)doesLogEventExistOnDisk
{
  id v2;
  void *v3;
  char v4;

  v2 = (id)hh2MigrationLogEventPath;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  return v4;
}

+ (id)migrationLogEventRecord
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  id v17;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend((id)objc_opt_class(), "doesLogEventExistOnDisk") & 1) != 0)
  {
    v3 = (id)hh2MigrationLogEventPath;
    v34 = 0;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v3, 2, &v34);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v34;
    if (v4)
    {
      v6 = (void *)MEMORY[0x24BDD1620];
      v7 = (void *)MEMORY[0x24BDBCF20];
      v35 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "allowedValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v6, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v9, v10, v4, &v33);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v33;

      if (v11)
      {
        v13 = v11;
        objc_opt_class();
        v14 = objc_opt_isKindOfClass() & 1;
        if (v14)
          v15 = v13;
        else
          v15 = 0;
        v16 = v15;

        if (v14)
        {
          v17 = v13;
        }
        else
        {
          v28 = (void *)MEMORY[0x227676638]();
          v29 = a1;
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v32 = v28;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v37 = v31;
            v38 = 2112;
            v39 = v13;
            _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_ERROR, "%{public}@Unable to open the migration log event record from archive data: %@", buf, 0x16u);

            v28 = v32;
          }

          objc_autoreleasePoolPop(v28);
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v23 = v17;

      }
      else
      {
        v24 = (void *)MEMORY[0x227676638]();
        v25 = a1;
        HMFGetOSLogHandle();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v27;
          v38 = 2112;
          v39 = v12;
          _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive migration log event record from archive data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v24);
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = a1;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v37 = v22;
        v38 = 2112;
        v39 = v5;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the migration log event record due to an error: [%@]", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }

    return v23;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

+ (void)removeMigrationLogEventRecordFromDisk
{
  id v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (id)hh2MigrationLogEventPath;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v16);
  v6 = v16;

  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v5 & 1) != 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v18 = v11;
      v12 = "%{public}@Successfully deleted the HH2 migration log event record from disk";
      v13 = v10;
      v14 = OS_LOG_TYPE_INFO;
      v15 = 12;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v13, v14, v12, buf, v15);

    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    v12 = "%{public}@Failed to delete the HH2 migration log event record from disk : %@";
    v13 = v10;
    v14 = OS_LOG_TYPE_ERROR;
    v15 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v7);
}

void __72__HMDHH2MigrationStateLogger_recordMigrationFailedWithError_withReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  char isKindOfClass;
  id v8;

  v8 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

@end
