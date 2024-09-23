@implementation HMDHH2MigratorRecord

+ (id)lastMigrationFailure
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__HMDHH2MigratorRecord_lastMigrationFailure__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lastMigrationFailure_onceToken != -1)
    dispatch_once(&lastMigrationFailure_onceToken, block);
  return (id)lastMigrationFailure_migrationError;
}

- (HMDHH2MigratorRecord)initWithLocalStorePath:(id)a3
{
  id v5;
  HMDHH2MigratorRecord *v6;
  HMDHH2MigratorRecord *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDHH2MigratorRecord;
  v6 = -[HMDHH2MigratorRecord init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_hh2MigratorRecordDataStorePath, a3);
    v7->_isMigrationInProgress = 0;
    -[HMDHH2MigratorRecord readMigratorRecord](v7, "readMigratorRecord");
  }

  return v7;
}

- (void)readMigratorRecord
{
  void *v3;
  HMDHH2MigratorRecord *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  HMDHH2MigratorRecord *v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D17BA0A0](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2MigratorRecord hh2MigratorRecordDataStorePath](v4, "hh2MigratorRecordDataStorePath");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Going to read migrator record from : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v3);
  -[HMDHH2MigratorRecord hh2MigratorRecordDataStorePath](v4, "hh2MigratorRecordDataStorePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v8, 2, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;
  if (v10 || !v9)
  {
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v4;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@Current device is not the migrator: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    -[HMDHH2MigratorRecord unarchiveRecordFromData:](v4, "unarchiveRecordFromData:", v9);
  }

}

- (void)unarchiveRecordFromData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDHH2MigratorRecord *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDHH2MigratorRecord *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "unarchiveMigratorDict:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0](-[HMDHH2MigratorRecord updateValuesFromDict:](self, "updateValuesFromDict:", v5));
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHH2MigratorRecord attributeDescriptions](v7, "attributeDescriptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Successfully got the HH2 Migrator record : %@", (uint8_t *)&v13, 0x16u);

    }
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unable to get the valid HH2 Migrator record from stored archive.", (uint8_t *)&v13, 0xCu);

    }
  }

  objc_autoreleasePoolPop(v6);
}

- (void)updateValuesFromDict:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HH2.MG.migrator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2MigratorRecord setIsMigrationInProgress:](self, "setIsMigrationInProgress:", objc_msgSend(v4, "BOOLValue"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HH2.MG.attempt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2MigratorRecord setCurrentMigrationAttempt:](self, "setCurrentMigrationAttempt:", objc_msgSend(v5, "unsignedIntValue"));

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HH2.MG.dry.run"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2MigratorRecord setDryRun:](self, "setDryRun:", objc_msgSend(v6, "BOOLValue"));

  if (isInternalBuild())
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HH2.MG.skip.key.roll"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2MigratorRecord setShouldSkipKeyRollOperations:](self, "setShouldSkipKeyRollOperations:", objc_msgSend(v7, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HH2.MG.simulate.migration.failure"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2MigratorRecord setForceMigrationFailureForTesting:](self, "setForceMigrationFailureForTesting:", objc_msgSend(v8, "BOOLValue"));

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HH2.MG.migrate.test.directory"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2MigratorRecord setMigrateFromTestDirectory:](self, "setMigrateFromTestDirectory:", objc_msgSend(v9, "BOOLValue"));

  }
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
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
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHH2MigratorRecord isMigrationInProgress](self, "isMigrationInProgress");
  HMFBooleanToString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("isMigrationInProgress"), v19);
  v20[0] = v4;
  v5 = objc_alloc(MEMORY[0x1E0D28548]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), -[HMDHH2MigratorRecord currentMigrationAttempt](self, "currentMigrationAttempt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithName:value:", CFSTR("migrationAttempt"), v6);
  v20[1] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHH2MigratorRecord shouldSkipKeyRollOperations](self, "shouldSkipKeyRollOperations");
  HMFBooleanToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("skipKeyRoll"), v9);
  v20[2] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHH2MigratorRecord forceMigrationFailureForTesting](self, "forceMigrationFailureForTesting");
  HMFBooleanToString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("forceMigrationFailure"), v12);
  v20[3] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDHH2MigratorRecord migrateFromTestDirectory](self, "migrateFromTestDirectory");
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("migrateFromTestDirectory"), v15);
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)writeNewMigrationRecord
{
  BOOL v3;
  void *v4;
  void *v5;
  HMDHH2MigratorRecord *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!-[HMDHH2MigratorRecord isMigrationInProgress](self, "isMigrationInProgress"))
  {
    objc_msgSend((id)objc_opt_class(), "prepareDictionary:attempt:skipKeyRoll:forceFailForTesting:migrateFromTestDirectory:dryRun:", 1, 0, -[HMDHH2MigratorRecord shouldSkipKeyRollOperations](self, "shouldSkipKeyRollOperations"), -[HMDHH2MigratorRecord forceMigrationFailureForTesting](self, "forceMigrationFailureForTesting"), -[HMDHH2MigratorRecord migrateFromTestDirectory](self, "migrateFromTestDirectory"), -[HMDHH2MigratorRecord dryRun](self, "dryRun"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (-[HMDHH2MigratorRecord writeMigratorRecord:](self, "writeMigratorRecord:", v4))
      {
        -[HMDHH2MigratorRecord updateValuesFromDict:](self, "updateValuesFromDict:", v4);
        v3 = 1;
LABEL_10:

        return v3;
      }
    }
    else
    {
      v5 = (void *)MEMORY[0x1D17BA0A0]();
      v6 = self;
      HMFGetOSLogHandle();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare HH2 migrator record", (uint8_t *)&v10, 0xCu);

      }
      objc_autoreleasePoolPop(v5);
    }
    v3 = 0;
    goto LABEL_10;
  }
  return 1;
}

- (BOOL)writeMigratorRecord:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMDHH2MigratorRecord *v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  void *v14;
  HMDHH2MigratorRecord *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "archiveMigratorDict:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v8 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to create an archive of the HH2 migrator record : %@", (uint8_t *)&v19, 0x16u);
LABEL_9:

    }
LABEL_10:
    v12 = 0;
    goto LABEL_11;
  }
  -[HMDHH2MigratorRecord hh2MigratorRecordDataStorePath](self, "hh2MigratorRecordDataStorePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "writeToFile:atomically:", v6, 1);

  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((v7 & 1) == 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHH2MigratorRecord hh2MigratorRecordDataStorePath](v9, "hh2MigratorRecordDataStorePath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Unable to write the HH2 migrator record to %@", (uint8_t *)&v19, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v12 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDHH2MigratorRecord hh2MigratorRecordDataStorePath](v9, "hh2MigratorRecordDataStorePath");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543874;
    v20 = v13;
    v21 = 2112;
    v22 = v4;
    v23 = 2112;
    v24 = v14;
    _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_INFO, "%{public}@Successfully written HH2 migrator record to disk: %@ : %@", (uint8_t *)&v19, 0x20u);

  }
LABEL_11:

  objc_autoreleasePoolPop(v8);
  return v12;
}

- (BOOL)writeToDisk
{
  void *v3;
  BOOL v4;
  void *v5;
  HMDHH2MigratorRecord *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "prepareDictionary:attempt:skipKeyRoll:forceFailForTesting:migrateFromTestDirectory:dryRun:", -[HMDHH2MigratorRecord isMigrationInProgress](self, "isMigrationInProgress"), -[HMDHH2MigratorRecord currentMigrationAttempt](self, "currentMigrationAttempt"), -[HMDHH2MigratorRecord shouldSkipKeyRollOperations](self, "shouldSkipKeyRollOperations"), -[HMDHH2MigratorRecord forceMigrationFailureForTesting](self, "forceMigrationFailureForTesting"), -[HMDHH2MigratorRecord migrateFromTestDirectory](self, "migrateFromTestDirectory"), -[HMDHH2MigratorRecord dryRun](self, "dryRun"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[HMDHH2MigratorRecord writeMigratorRecord:](self, "writeMigratorRecord:", v3);
  }
  else
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_ERROR, "%{public}@Cannot prepare HH2 migrator record dictionary", (uint8_t *)&v10, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    v4 = 0;
  }

  return v4;
}

- (BOOL)beginMigration
{
  void *v3;
  HMDHH2MigratorRecord *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  HMDHH2MigratorRecord *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  void *v13;
  HMDHH2MigratorRecord *v14;
  NSObject *v15;
  void *v16;
  unsigned int v17;
  int v18;
  void *v19;
  __int16 v20;
  unsigned int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[HMDHH2MigratorRecord isMigrationInProgress](self, "isMigrationInProgress"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v10;
      v11 = "%{public}@Cannot increment the migration attempt as this device is not the migrator";
LABEL_11:
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v18, 0xCu);

    }
LABEL_12:

    objc_autoreleasePoolPop(v7);
    return 0;
  }
  if (-[HMDHH2MigratorRecord migrateFromTestDirectory](self, "migrateFromTestDirectory"))
  {
    v3 = (void *)MEMORY[0x1D17BA0A0]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v6;
      _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@Not enforcing the migration attempt as we are doing migration from test directory", (uint8_t *)&v18, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
    goto LABEL_13;
  }
  if (-[HMDHH2MigratorRecord isMaximumMigrationAttemptReached](self, "isMaximumMigrationAttemptReached"))
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v10;
      v11 = "%{public}@Maximum migration attempt reached";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
LABEL_13:
  v13 = (void *)MEMORY[0x1D17BA0A0](-[HMDHH2MigratorRecord setCurrentMigrationAttempt:](self, "setCurrentMigrationAttempt:", -[HMDHH2MigratorRecord currentMigrationAttempt](self, "currentMigrationAttempt") + 1));
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HMDHH2MigratorRecord currentMigrationAttempt](v14, "currentMigrationAttempt");
    v18 = 138543618;
    v19 = v16;
    v20 = 1024;
    v21 = v17;
    _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Increased migration attempt to %u", (uint8_t *)&v18, 0x12u);

  }
  objc_autoreleasePoolPop(v13);
  return -[HMDHH2MigratorRecord writeToDisk](v14, "writeToDisk");
}

- (BOOL)isMaximumMigrationAttemptReached
{
  return -[HMDHH2MigratorRecord currentMigrationAttempt](self, "currentMigrationAttempt") != 0;
}

- (BOOL)finishMigration
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  HMDHH2MigratorRecord *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHH2MigratorRecord hh2MigratorRecordDataStorePath](self, "hh2MigratorRecordDataStorePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v13);
  v6 = v13;

  if ((v5 & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDHH2MigratorRecord hh2MigratorRecordDataStorePath](v8, "hh2MigratorRecordDataStorePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 2112;
      v19 = v6;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Unable to remove migration record from disk %@ (%@)", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
  }

  return v5;
}

- (BOOL)isMigrationInProgress
{
  return self->_isMigrationInProgress;
}

- (void)setIsMigrationInProgress:(BOOL)a3
{
  self->_isMigrationInProgress = a3;
}

- (unsigned)currentMigrationAttempt
{
  return self->_currentMigrationAttempt;
}

- (void)setCurrentMigrationAttempt:(unsigned int)a3
{
  self->_currentMigrationAttempt = a3;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (BOOL)shouldSkipKeyRollOperations
{
  return self->_shouldSkipKeyRollOperations;
}

- (void)setShouldSkipKeyRollOperations:(BOOL)a3
{
  self->_shouldSkipKeyRollOperations = a3;
}

- (BOOL)forceMigrationFailureForTesting
{
  return self->_forceMigrationFailureForTesting;
}

- (void)setForceMigrationFailureForTesting:(BOOL)a3
{
  self->_forceMigrationFailureForTesting = a3;
}

- (BOOL)migrateFromTestDirectory
{
  return self->_migrateFromTestDirectory;
}

- (void)setMigrateFromTestDirectory:(BOOL)a3
{
  self->_migrateFromTestDirectory = a3;
}

- (NSString)hh2MigratorRecordDataStorePath
{
  return self->_hh2MigratorRecordDataStorePath;
}

- (void)setHh2MigratorRecordDataStorePath:(id)a3
{
  objc_storeStrong((id *)&self->_hh2MigratorRecordDataStorePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hh2MigratorRecordDataStorePath, 0);
}

+ (id)singleRecord
{
  if (singleRecord_onceToken != -1)
    dispatch_once(&singleRecord_onceToken, &__block_literal_global_81071);
  return (id)singleRecord_singleMigratorRecord;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_81066 != -1)
    dispatch_once(&logCategory__hmf_once_t4_81066, &__block_literal_global_13_81067);
  return (id)logCategory__hmf_once_v5_81068;
}

+ (id)prepareDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v5 = objc_msgSend(v3, "isMigrationInProgress");
  v6 = objc_msgSend(v3, "currentMigrationAttempt");
  v7 = objc_msgSend(v3, "shouldSkipKeyRollOperations");
  v8 = objc_msgSend(v3, "forceMigrationFailureForTesting");
  v9 = objc_msgSend(v3, "migrateFromTestDirectory");
  v10 = objc_msgSend(v3, "dryRun");

  return (id)objc_msgSend(v4, "prepareDictionary:attempt:skipKeyRoll:forceFailForTesting:migrateFromTestDirectory:dryRun:", v5, v6, v7, v8, v9, v10);
}

+ (id)prepareDictionary:(BOOL)a3 attempt:(unsigned int)a4 skipKeyRoll:(BOOL)a5 forceFailForTesting:(BOOL)a6 migrateFromTestDirectory:(BOOL)a7 dryRun:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  uint64_t v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = *(_QWORD *)&a4;
  v13 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("HH2.MG.migrator"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("HH2.MG.attempt"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("HH2.MG.dry.run"));

  if (isInternalBuild())
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("HH2.MG.skip.key.roll"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, CFSTR("HH2.MG.simulate.migration.failure"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("HH2.MG.migrate.test.directory"));

  }
  return v14;
}

+ (id)archiveMigratorDict:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = a1;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to archive : %@", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  encodeRootObject();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)unarchiveMigratorDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  _QWORD v27[3];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = (void *)MEMORY[0x1E0C99E60];
  v28[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v27[0] = objc_opt_class();
  v27[1] = objc_opt_class();
  v27[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v8, v11, v4, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v22;

  if (!v12)
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive HMDHH2MigratorRecord from archive data: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
  }
  v18 = v12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  return v20;
}

+ (BOOL)recordMigrationFailureWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  int v27;
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0CB8FA8]);
  v7 = (id)hh2MigrationFailureRecordStorePath;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v11;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_INFO, "%{public}@Going to write migration failure record : [%@] -> [%@]", (uint8_t *)&v27, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  encodeRootObject();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v21 = v9;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543618;
      v28 = v22;
      v29 = 2112;
      v30 = v7;
      v23 = "%{public}@Unable to write migration failure record at location : %@";
      v24 = v18;
      v25 = 22;
LABEL_13:
      _os_log_impl(&dword_1CD062000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v27, v25);

    }
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
  v14 = objc_msgSend(v12, "writeToFile:atomically:", v7, 1);
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = v9;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138543874;
      v28 = v22;
      v29 = 2112;
      v30 = v13;
      v31 = 2112;
      v32 = v7;
      v23 = "%{public}@Unable to write migration failure record [%@] to location : %@";
      v24 = v18;
      v25 = 32;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138543874;
    v28 = v19;
    v29 = 2112;
    v30 = v6;
    v31 = 2112;
    v32 = v7;
    _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@Successfully written migration failure record on disk : %@, %@", (uint8_t *)&v27, 0x20u);

  }
  v20 = 1;
LABEL_15:

  objc_autoreleasePoolPop(v15);
  return v20;
}

+ (void)removeMigrationFailureRecord
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = (id)hh2MigrationFailureRecordStorePath;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  objc_msgSend(v3, "removeItemAtPath:error:", v2, &v4);

}

void __44__HMDHH2MigratorRecord_lastMigrationFailure__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
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
  id v19;
  id v20;
  int v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = (id)hh2MigrationFailureRecordStorePath;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v55 = v8;
      v56 = 2112;
      v57 = (uint64_t)v2;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Found migration failure record on disk at %@. Going to read it.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v51 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v2, 2, &v51);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v51;
    if (v9)
    {
      v11 = (void *)MEMORY[0x1E0CB3710];
      v12 = (void *)MEMORY[0x1E0C99E60];
      v53 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setWithArray:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0C99E60];
      v52 = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setWithArray:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = 0;
      objc_msgSend(v11, "unarchivedDictionaryWithKeysOfClasses:objectsOfClasses:fromData:error:", v14, v17, v9, &v50);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v50;

      if (v18)
      {
        v20 = v18;
        objc_opt_class();
        v21 = objc_opt_isKindOfClass() & 1;
        if (v21)
          v22 = v20;
        else
          v22 = 0;
        v23 = v22;

        if (v21)
        {
          objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0CB8FA8]);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v25 = v24;
          else
            v25 = 0;
          v26 = v25;

          v27 = (void *)lastMigrationFailure_migrationError;
          lastMigrationFailure_migrationError = (uint64_t)v26;

          v28 = (void *)MEMORY[0x1D17BA0A0]();
          v29 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v48 = v28;
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v31;
            v56 = 2112;
            v57 = lastMigrationFailure_migrationError;
            _os_log_impl(&dword_1CD062000, v30, OS_LOG_TYPE_INFO, "%{public}@Successfully read the migration failure record %@", buf, 0x16u);

            v28 = v48;
          }

          objc_autoreleasePoolPop(v28);
        }
        else
        {
          v42 = (void *)MEMORY[0x1D17BA0A0]();
          v43 = *(id *)(a1 + 32);
          HMFGetOSLogHandle();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          {
            HMFGetLogIdentifier();
            v49 = v42;
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v55 = v45;
            v56 = 2112;
            v57 = (uint64_t)v20;
            _os_log_impl(&dword_1CD062000, v44, OS_LOG_TYPE_ERROR, "%{public}@Unable to open the migration failure record from archive data: %@", buf, 0x16u);

            v42 = v49;
          }

          objc_autoreleasePoolPop(v42);
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", -1);
          v46 = objc_claimAutoreleasedReturnValue();
          v47 = (void *)lastMigrationFailure_migrationError;
          lastMigrationFailure_migrationError = v46;

        }
      }
      else
      {
        v37 = (void *)MEMORY[0x1D17BA0A0]();
        v38 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v55 = v40;
          v56 = 2112;
          v57 = (uint64_t)v19;
          _os_log_impl(&dword_1CD062000, v39, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive migration failure record from archive data: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v37);
        v41 = v19;
        v23 = (id)lastMigrationFailure_migrationError;
        lastMigrationFailure_migrationError = (uint64_t)v41;
      }

    }
    else
    {
      v32 = (void *)MEMORY[0x1D17BA0A0]();
      v33 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v55 = v35;
        v56 = 2112;
        v57 = (uint64_t)v10;
        _os_log_impl(&dword_1CD062000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to read the migration failure record due to an error: [%@]", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v32);
      v36 = v10;
      v19 = (id)lastMigrationFailure_migrationError;
      lastMigrationFailure_migrationError = (uint64_t)v36;
    }

  }
}

void __35__HMDHH2MigratorRecord_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_81068;
  logCategory__hmf_once_v5_81068 = v0;

}

void __36__HMDHH2MigratorRecord_singleRecord__block_invoke()
{
  HMDHH2MigratorRecord *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [HMDHH2MigratorRecord alloc];
  v3 = (id)hh2MigratorRecordStorePath;
  v1 = -[HMDHH2MigratorRecord initWithLocalStorePath:](v0, "initWithLocalStorePath:", v3);
  v2 = (void *)singleRecord_singleMigratorRecord;
  singleRecord_singleMigratorRecord = v1;

}

@end
