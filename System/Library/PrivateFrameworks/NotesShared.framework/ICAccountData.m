@implementation ICAccountData

- (BOOL)isDeletable
{
  return 0;
}

- (void)updateChangeCountWithReason:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[ICAccountData markedForDeletion](self, "markedForDeletion"))
    -[ICCloudSyncingObject setMarkedForDeletion:](self, "setMarkedForDeletion:", 0);
  v5.receiver = self;
  v5.super_class = (Class)ICAccountData;
  -[ICCloudSyncingObject updateChangeCountWithReason:](&v5, sel_updateChangeCountWithReason_, v4);

}

- (void)updateSupportsV1Neo:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  id v12;
  id location;

  v4 = (void (**)(_QWORD))a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICAccountData updateSupportsV1Neo:].cold.1(v5);

  -[ICAccountData account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accountType");

  if (v7 == 1)
  {
    objc_initWeak(&location, self);
    +[ICCompatibilityController sharedController](ICCompatibilityController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccountData account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __37__ICAccountData_updateSupportsV1Neo___block_invoke;
    v10[3] = &unk_1E76CB200;
    objc_copyWeak(&v12, &location);
    v11 = v4;
    objc_msgSend(v8, "devicesForAccount:completionHandler:", v9, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    -[ICAccountData updateSupportsV1NeoWithAccountDevices:](self, "updateSupportsV1NeoWithAccountDevices:", MEMORY[0x1E0C9AA60]);
    if (v4)
      v4[2](v4);
  }

}

void __37__ICAccountData_updateSupportsV1Neo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ICAccountData_updateSupportsV1Neo___block_invoke_2;
  v7[3] = &unk_1E76CB1D8;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  v6 = v3;
  v8 = v6;
  v9 = *(id *)(a1 + 32);
  objc_msgSend(v5, "performBlockAndWait:", v7);

  objc_destroyWeak(&v10);
}

uint64_t __37__ICAccountData_updateSupportsV1Neo___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "updateSupportsV1NeoWithAccountDevices:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateSupportsV1NeoWithAccountDevices:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  const char *v17;
  int v18;
  _BOOL4 v19;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  NSStringFromSelector(sel_supportsV1Neo);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccountData primitiveValueForKey:](self, "primitiveValueForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if ((ICInternalSettingsIsLockedNotesV1NeoEnabled() & 1) != 0)
    {
      -[ICAccountData account](self, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "accountType");

      if (v14 == 3)
      {
        v7 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          -[ICAccountData account](self, "account");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "shortLoggingDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138412290;
          v21 = v16;
          v17 = "Enabling v1 Neo support for local account {account: %@}";
LABEL_18:
          _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, v17, (uint8_t *)&v20, 0xCu);

          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (v4)
      {
        v18 = objc_msgSend(v4, "ic_allSatisfy:", &__block_literal_global_32);
        v7 = os_log_create("com.apple.notes", "Crypto");
        v19 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
        if (v18)
        {
          if (v19)
          {
            -[ICAccountData account](self, "account");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "shortLoggingDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = 138412290;
            v21 = v16;
            v17 = "Enabling v1 Neo support for cloud account {account: %@}";
            goto LABEL_18;
          }
LABEL_19:

          -[ICAccountData setSupportsV1Neo:](self, "setSupportsV1Neo:", 1);
          goto LABEL_13;
        }
        if (!v19)
          goto LABEL_12;
        -[ICAccountData account](self, "account");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortLoggingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v9;
        v10 = "Not updating v1 Neo support state for cloud account because there are unsupported devices {account: %@}";
      }
      else
      {
        v7 = os_log_create("com.apple.notes", "Crypto");
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          goto LABEL_12;
        -[ICAccountData account](self, "account");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortLoggingDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v9;
        v10 = "Not updating v1 Neo support state because compatible devices couldn't be fetched {account: %@}";
      }
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        goto LABEL_12;
      -[ICAccountData account](self, "account");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "shortLoggingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138412290;
      v21 = v9;
      v10 = "Not updating v1 Neo support state since feature flag is disabled {account: %@}";
    }
    v11 = v7;
    v12 = 12;
    goto LABEL_11;
  }
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[ICAccountData account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shortLoggingDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138412546;
    v21 = v9;
    v22 = 2112;
    v23 = v6;
    v10 = "Not updating v1 Neo support state since explicit value was set {account: %@, supportsV1Neo: %@}";
    v11 = v7;
    v12 = 22;
LABEL_11:
    _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v20, v12);

  }
LABEL_12:

LABEL_13:
}

BOOL __55__ICAccountData_updateSupportsV1NeoWithAccountDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notesVersion") > 12;
}

- (ICTTMergeableWallClockValue)mergeableCryptoPassphraseVerifier
{
  void *v3;
  void *v4;
  ICTTMergeableWallClockValue *v5;
  NSObject *v6;
  ICTTMergeableWallClockValue *v7;
  void *v8;

  NSStringFromSelector(sel_cryptoPassphraseVerifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccountData primitiveValueForKey:](self, "primitiveValueForKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[ICTTMergeableWallClockValue canParseData:](ICTTMergeableWallClockValue, "canParseData:", v4))
  {
    v5 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v4);
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICAccountData mergeableCryptoPassphraseVerifier].cold.1(v6);

    v7 = [ICTTMergeableWallClockValue alloc];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ICTTMergeableWallClockValue initWithValue:timestamp:](v7, "initWithValue:timestamp:", v4, v8);

  }
  return v5;
}

- (NSData)cryptoPassphraseVerifier
{
  void *v2;
  void *v3;

  -[ICAccountData mergeableCryptoPassphraseVerifier](self, "mergeableCryptoPassphraseVerifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (void)setCryptoPassphraseVerifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICTTMergeableWallClockValue *v9;

  v4 = a3;
  v9 = -[ICTTMergeableWallClockValue initWithValue:timestamp:]([ICTTMergeableWallClockValue alloc], "initWithValue:timestamp:", v4, 0);

  NSStringFromSelector(sel_cryptoPassphraseVerifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccountData willChangeValueForKey:](self, "willChangeValueForKey:", v5);

  -[ICTTMergeableWallClockValue serialize](v9, "serialize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_cryptoPassphraseVerifier);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccountData setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v7);

  NSStringFromSelector(sel_cryptoPassphraseVerifier);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAccountData didChangeValueForKey:](self, "didChangeValueForKey:", v8);

}

- (void)saveMergeableDataIfNeeded
{
  id v2;

  -[ICAccountData account](self, "account");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "saveSubFolderMergeableDataIfNeeded");

}

- (BOOL)mergeWithMergeableData:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ICAccountData account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mergeWithSubFolderMergeableData:", v4);

  return v6;
}

+ (ICAccountData)accountDataWithIdentifier:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("identifier = %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_objectsMatchingPredicate:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAccountData *)v10;
}

+ (id)newAccountDataForAccount:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(a1, "newAccountDataWithIdentifier:account:", v7, v5);

  return v8;
}

+ (id)newAccountDataWithIdentifier:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v7, v8);

  objc_msgSend(v9, "setAccount:", v6);
  objc_msgSend(v6, "persistentStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "assignToPersistentStore:", v10);
  objc_msgSend(v9, "updateSupportsV1Neo:", 0);
  return v9;
}

- (BOOL)isInICloudAccount
{
  ICAccountData *v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[ICAccountData managedObjectContext](self, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__ICAccountData_CloudKit__isInICloudAccount__block_invoke;
  v5[3] = &unk_1E76C7730;
  v5[4] = v2;
  v5[5] = &v6;
  objc_msgSend(v3, "performBlockAndWait:", v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __44__ICAccountData_CloudKit__isInICloudAccount__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "account");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isInICloudAccount");

}

- (id)recordZoneName
{
  return CFSTR("Notes");
}

- (id)recordName
{
  return CFSTR("AccountData");
}

- (NSString)recordType
{
  return (NSString *)CFSTR("AccountData");
}

- (BOOL)needsToBeDeletedFromCloud
{
  return 0;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;

  v7 = a3;
  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountDataCreateIfNecessary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v7
    && (objc_msgSend(v9, "recordID"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqual:", v7),
        v11,
        v12))
  {
    v13 = v10;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "0", "+[ICAccountData(CloudKit) newCloudObjectForRecord:accountID:context:]", 1, 0, CFSTR("Not reached. ExistingCloudObjectForRecordID should not have returned nil for a CloudKit account"));
  return 0;
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ICTTMergeableWallClockValue *v20;
  ICTTMergeableWallClockValue *v21;
  void *v22;
  void *v23;
  ICTTMergeableWallClockValue *v24;
  BOOL v25;
  ICAccountData *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v10 = a3;
  v11 = a6;
  if (!a5)
  {
    v31.receiver = self;
    v31.super_class = (Class)ICAccountData;
    if (!-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v31, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v10, a4, 0, v11))goto LABEL_13;
    objc_msgSend(v10, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("MergeableData"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[ICAccountData mergeWithMergeableData:](self, "mergeWithMergeableData:", v15);
      -[ICAccountData saveMergeableDataIfNeeded](self, "saveMergeableDataIfNeeded");
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LockedNotesMode"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_opt_class();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("LockedNotesMode"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ICCheckedDynamicCast();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICAccountData setLockedNotesMode:](self, "setLockedNotesMode:", (__int16)objc_msgSend(v18, "integerValue"));

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CryptoPassphraseVerifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[ICTTMergeableWallClockValue canParseData:](ICTTMergeableWallClockValue, "canParseData:", v19))
    {
      if (v19)
      {
        -[ICAccountData mergeableCryptoPassphraseVerifier](self, "mergeableCryptoPassphraseVerifier");
        v20 = (ICTTMergeableWallClockValue *)objc_claimAutoreleasedReturnValue();
        v21 = -[ICTTMergeableWallClockValue initWithData:]([ICTTMergeableWallClockValue alloc], "initWithData:", v19);
        if (v20)
        {
          if (-[ICTTMergeableWallClockValue merge:](v20, "merge:", v21) != 2)
          {
LABEL_20:

            goto LABEL_21;
          }
          -[ICTTMergeableWallClockValue serialize](v20, "serialize");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_cryptoPassphraseVerifier);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAccountData setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v22, v23);

          v24 = v20;
        }
        else
        {
          NSStringFromSelector(sel_cryptoPassphraseVerifier);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICAccountData setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v19, v29);

          v24 = v21;
        }
        -[ICTTMergeableWallClockValue timestamp](v24, "timestamp");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, CFSTR("CryptoPassphraseVerifier"));

        goto LABEL_20;
      }
      v27 = self;
      v28 = 0;
    }
    else
    {
      v27 = self;
      v28 = v19;
    }
    -[ICAccountData setCryptoPassphraseVerifier:](v27, "setCryptoPassphraseVerifier:", v28);
LABEL_21:

    v25 = 1;
    goto LABEL_14;
  }
  v12 = (void *)MEMORY[0x1E0D641A0];
  -[ICAccountData className](self, "className");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ICStringFromSyncingApproach(a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountData(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v13, v14);

LABEL_13:
  v25 = 0;
LABEL_14:

  return v25;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  id v6;
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
  objc_super v19;

  v6 = a4;
  if (a3)
  {
    v7 = (void *)MEMORY[0x1E0D641A0];
    -[ICAccountData className](self, "className");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICAccountData(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v8, v9);

    v10 = 0;
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)ICAccountData;
    -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v19, sel_makeCloudKitRecordForApproach_mergeableFieldState_, 0, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAccountData mergeableData](self, "mergeableData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ICAccountData mergeableData](self, "mergeableData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v12, CFSTR("MergeableData"), 0);

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", -[ICAccountData lockedNotesMode](self, "lockedNotesMode"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("LockedNotesMode"));

    -[ICAccountData mergeableCryptoPassphraseVerifier](self, "mergeableCryptoPassphraseVerifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "serialize");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("CryptoPassphraseVerifier"));

      objc_msgSend(v15, "timestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("CryptoPassphraseVerifier"));

    }
  }

  return v10;
}

- (void)updateSupportsV1Neo:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "-[ICAccountData updateSupportsV1Neo:]";
  v3 = 1024;
  v4 = 55;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Updating v1 Neo support state…%s:%d", (uint8_t *)&v1, 0x12u);
}

- (void)mergeableCryptoPassphraseVerifier
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Derived mergeable crypto verifier from unboxed verifier", v1, 2u);
}

@end
