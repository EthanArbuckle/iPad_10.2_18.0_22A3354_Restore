@implementation ICDeviceMigrationState

+ (id)deviceMigrationStateWithDeviceIdentifier:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("deviceIdentifier"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deviceMigrationStatesMatchingPredicate:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)deviceMigrationStateWithDeviceIdentifier:(id)a3 account:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("(%K == %@) AND (%K == %@)"), CFSTR("deviceIdentifier"), a3, CFSTR("account"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "deviceMigrationStatesMatchingPredicate:context:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)newDeviceMigrationStateWithDeviceIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  if (!a4)
    return 0;
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "identifierForDeviceIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v8, v9);

  objc_msgSend(v6, "persistentStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assignToPersistentStore:", v11);

  objc_msgSend(v10, "setAccount:", v6);
  objc_msgSend(v10, "setDeviceIdentifier:", v7);

  return v10;
}

+ (id)currentDeviceMigrationStateForAccount:(id)a3
{
  return (id)objc_msgSend(a1, "currentDeviceMigrationStateForAccount:createIfNecessary:", a3, 1);
}

+ (id)currentDeviceMigrationStateForAccount:(id)a3 createIfNecessary:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deviceMigrationStateWithDeviceIdentifier:context:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && v4)
  {
    v9 = (void *)objc_msgSend(a1, "newDeviceMigrationStateWithDeviceIdentifier:account:", v7, v6);
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStateModificationDate:", v10);

  }
  objc_msgSend(v9, "account");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 != v6)
  {
    v12 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[ICDeviceMigrationState currentDeviceMigrationStateForAccount:createIfNecessary:].cold.1(v9, v6, v12);

    objc_msgSend(v9, "setAccount:", v6);
  }

  return v9;
}

+ (id)allDeviceMigrationStatesInContext:(id)a3
{
  return (id)objc_msgSend(a1, "deviceMigrationStatesMatchingPredicate:context:", 0, a3);
}

+ (id)deviceMigrationStatesByAccountIDInContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__ICDeviceMigrationState_deviceMigrationStatesByAccountIDInContext___block_invoke;
  v8[3] = &unk_1E76C9E70;
  v11 = a1;
  v5 = v4;
  v9 = v5;
  v10 = &v12;
  objc_msgSend(v5, "performBlockAndWait:", v8);
  v6 = (void *)objc_msgSend((id)v13[5], "copy");

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __68__ICDeviceMigrationState_deviceMigrationStatesByAccountIDInContext___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  os_log_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[4];
  uint64_t v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 48), "allDeviceMigrationStatesInContext:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v7, "account");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v7, "state"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v7, "account");
          v12 = (os_log_t)objc_claimAutoreleasedReturnValue();
          -[NSObject identifier](v12, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v13);

        }
        else
        {
          v12 = os_log_create("com.apple.notes", "Migration");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            __68__ICDeviceMigrationState_deviceMigrationStatesByAccountIDInContext___block_invoke_cold_1(v18, v7, &v19, v12);
          v10 = v12;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v4);
  }

}

- (BOOL)isMigrating
{
  return (int)-[ICDeviceMigrationState state](self, "state") >= 2
      && (int)-[ICDeviceMigrationState state](self, "state") < 7;
}

+ (id)stringFromMigrationState:(signed __int16)a3
{
  if (a3 < 8)
    return off_1E76C9E90[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ICDeviceMigrationState *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICDeviceMigrationState;
  -[ICCloudSyncingObject ic_loggingValues](&v12, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICDeviceMigrationState managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__ICDeviceMigrationState_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E76C73B0;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = v6;
  return v7;
}

void __42__ICDeviceMigrationState_ic_loggingValues__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  const __CFString *v4;
  id v5;

  objc_msgSend((id)objc_opt_class(), "stringFromMigrationState:", objc_msgSend(*(id *)(a1 + 40), "state"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("state"));

  objc_msgSend(*(id *)(a1 + 40), "stateModificationDate");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("stateModificationDate"));

}

+ (id)identifierForDeviceIdentifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DeviceMigrationState_%@"), a3);
}

- (id)recordType
{
  return CFSTR("MigrationState");
}

- (id)recordZoneName
{
  return CFSTR("Metadata");
}

- (BOOL)isInICloudAccount
{
  return 1;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICDeviceMigrationState deviceMigrationStateWithDeviceIdentifier:account:](ICDeviceMigrationState, "deviceMigrationStateWithDeviceIdentifier:account:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(a1, "newDeviceMigrationStateWithDeviceIdentifier:account:", v12, v10);

  objc_msgSend(v13, "mergeCloudKitRecord:accountID:approach:", v9, v8, 0);
  objc_msgSend(v13, "setServerRecord:", v9);

  objc_msgSend(v13, "setInCloud:", 1);
  objc_msgSend(v13, "clearChangeCountWithReason:", CFSTR("Created migration state"));

  return v13;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0D641A0];
    -[ICDeviceMigrationState className](self, "className", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICDeviceMigrationState(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v7, v8);

    return 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)ICDeviceMigrationState;
    -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v13, sel_makeCloudKitRecordForApproach_mergeableFieldState_, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICDeviceMigrationState state](self, "state"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("State"));

    -[ICDeviceMigrationState stateModificationDate](self, "stateModificationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("StateModificationDate"));

    return v10;
  }
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned __int16 v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if (a5)
  {
    v12 = (void *)MEMORY[0x1E0D641A0];
    -[ICDeviceMigrationState className](self, "className");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICDeviceMigrationState(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v13, v14);

LABEL_15:
    v33 = 0;
    goto LABEL_16;
  }
  v38.receiver = self;
  v38.super_class = (Class)ICDeviceMigrationState;
  if (!-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v38, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v10, v11, 0, a6))goto LABEL_15;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("StateModificationDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    -[ICDeviceMigrationState stateModificationDate](self, "stateModificationDate");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16
      || (v17 = (void *)v16,
          -[ICDeviceMigrationState stateModificationDate](self, "stateModificationDate"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v15, "ic_isLaterThanDate:", v18),
          v18,
          v17,
          v19))
    {
      -[ICDeviceMigrationState setStateModificationDate:](self, "setStateModificationDate:", v15);
      v20 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v10, "ic_loggingIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v40 = v35;
        v41 = 2112;
        v42 = v11;
        v43 = 2112;
        v44 = v15;
        _os_log_debug_impl(&dword_1BD918000, v20, OS_LOG_TYPE_DEBUG, "Merged ICDeviceMigrationState data from record: %@ for accountID: %@. Setting stateModificationDate to %@.", buf, 0x20u);

      }
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("State"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("State"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "integerValue");

        if ((unsigned __int16)-[ICDeviceMigrationState state](self, "state") != v23)
        {
          v24 = (__int16)v23;
          -[ICDeviceMigrationState setState:](self, "setState:", v24);
          v25 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v10, "ic_loggingIdentifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            +[ICDeviceMigrationState stringFromMigrationState:](ICDeviceMigrationState, "stringFromMigrationState:", v24);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v40 = v36;
            v41 = 2112;
            v42 = v11;
            v43 = 2112;
            v44 = v37;
            _os_log_debug_impl(&dword_1BD918000, v25, OS_LOG_TYPE_DEBUG, "Merged ICDeviceMigrationState data from record: %@ for accountID: %@. Setting state to %@.", buf, 0x20u);

          }
        }
      }
    }
  }
  objc_msgSend(v10, "recordID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "recordName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceMigrationState setDeviceIdentifier:](self, "setDeviceIdentifier:", v27);

  v28 = (void *)objc_opt_class();
  -[ICDeviceMigrationState deviceIdentifier](self, "deviceIdentifier");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "identifierForDeviceIdentifier:", v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICDeviceMigrationState setIdentifier:](self, "setIdentifier:", v30);

  -[ICDeviceMigrationState managedObjectContext](self, "managedObjectContext");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount cloudKitAccountInContext:](ICAccount, "cloudKitAccountInContext:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 1;
  objc_msgSend(v32, "setNeedsToBeFetchedFromCloud:", 1);

LABEL_16:
  return v33;
}

- (void)objectWasDeletedFromCloud
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDeviceMigrationState;
  -[ICCloudSyncingObject objectWasDeletedFromCloud](&v4, sel_objectWasDeletedFromCloud);
  -[ICDeviceMigrationState managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICDeviceMigrationState;
  -[ICCloudSyncingObject objectWasDeletedFromCloudByAnotherDevice](&v4, sel_objectWasDeletedFromCloudByAnotherDevice);
  -[ICDeviceMigrationState managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (void)objectWasFetchedFromCloudWithRecord:(id)a3 accountID:(id)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[ICDeviceMigrationState managedObjectContext](self, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "userRecordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v13 = os_log_create("com.apple.notes", "Cloud");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ICDeviceMigrationState(CloudKit) objectWasFetchedFromCloudWithRecord:accountID:force:].cold.1(v11, v13);

    +[ICCloudContext sharedContext](ICCloudContext, "sharedContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "containerForAccountID:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[ICCloudContext userRecordNameForContainer:](ICCloudContext, "userRecordNameForContainer:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v11, "setUserRecordName:", v16);

  }
  v17.receiver = self;
  v17.super_class = (Class)ICDeviceMigrationState;
  -[ICCloudSyncingObject objectWasFetchedFromCloudWithRecord:accountID:force:](&v17, sel_objectWasFetchedFromCloudWithRecord_accountID_force_, v8, v9, v5);

}

- (void)deleteFromLocalDatabase
{
  id v3;

  -[ICDeviceMigrationState managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

+ (void)currentDeviceMigrationStateForAccount:(NSObject *)a3 createIfNecessary:.cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Repairing relationship from device migration state (%@) to account (%@)", (uint8_t *)&v7, 0x16u);

}

void __68__ICDeviceMigrationState_deviceMigrationStatesByAccountIDInContext___block_invoke_cold_1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_debug_impl(&dword_1BD918000, a4, OS_LOG_TYPE_DEBUG, "Device migration state (%@) does not have an account identifier", a1, 0xCu);

}

@end
