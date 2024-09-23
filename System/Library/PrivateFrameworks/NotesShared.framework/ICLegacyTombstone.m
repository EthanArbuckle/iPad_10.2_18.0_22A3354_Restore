@implementation ICLegacyTombstone

+ (id)legacyTombstoneWithIdentifier:(id)a3 context:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("identifier == %@"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "legacyTombstonesMatchingPredicate:context:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)newLegacyTombstoneWithIdentifier:(id)a3 type:(signed __int16)a4 account:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    v15 = (void *)MEMORY[0x1E0D641A0];
    NSStringFromClass((Class)a1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "identifier", "+[ICLegacyTombstone newLegacyTombstoneWithIdentifier:type:account:]", 1, 0, CFSTR("Trying to create a %@ with no identifier"), v16);

    if (v10)
      goto LABEL_3;
LABEL_5:
    v17 = (void *)MEMORY[0x1E0D641A0];
    NSStringFromClass((Class)a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "account", "+[ICLegacyTombstone newLegacyTombstoneWithIdentifier:type:account:]", 1, 0, CFSTR("Trying to create a %@ with no account"), v18);

    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v10, "managedObjectContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v8, v11);

  objc_msgSend(v10, "persistentStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "assignToPersistentStore:", v13);

  objc_msgSend(v12, "setType:", v6);
  objc_msgSend(v12, "setAccount:", v10);

  return v12;
}

+ (id)allLegacyTombstonesInContext:(id)a3
{
  return (id)objc_msgSend(a1, "legacyTombstonesMatchingPredicate:context:", 0, a3);
}

+ (id)addLegacyTombstoneWithObjectIdentifier:(id)a3 type:(signed __int16)a4 account:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v8, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tombstoneIdentifierForObjectIdentifier:type:", v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "legacyTombstoneWithIdentifier:context:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, "markedForDeletion"))
      objc_msgSend(v13, "unmarkForDeletion");
  }
  else
  {
    v13 = +[ICLegacyTombstone newLegacyTombstoneWithIdentifier:type:account:](ICLegacyTombstone, "newLegacyTombstoneWithIdentifier:type:account:", v11, v5, v8);
    objc_msgSend(v13, "updateChangeCountWithReason:", CFSTR("Created tombstone"));
  }

  return v13;
}

+ (void)removeLegacyTombstoneWithObjectIdentifier:(id)a3 type:(signed __int16)a4 context:(id)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v8 = a5;
  objc_msgSend(a1, "tombstoneIdentifierForObjectIdentifier:type:", a3, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "legacyTombstoneWithIdentifier:context:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "markForDeletion");

}

+ (void)addLegacyTombstoneForNote:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addLegacyTombstoneWithObjectIdentifier:type:account:", v5, 1, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "legacyContentHashAtImport");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentHashAtImport:", v8);

  objc_msgSend(v4, "legacyModificationDateAtImport");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setModificationDateAtImport:", v9);
  objc_msgSend(v10, "updateChangeCountWithReason:", CFSTR("Created tombstone"));

}

+ (void)removeLegacyTombstoneForNote:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "removeLegacyTombstoneWithObjectIdentifier:type:context:", v6, 1, v5);
}

+ (void)addLegacyTombstoneForFolder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "importedFromLegacy") & 1) == 0)
  {
    v5 = os_log_create("com.apple.notes", "Migration");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v6;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_DEFAULT, "Trying to add a tombstone for a folder that wasn't from the legacy database: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(a1, "addLegacyTombstoneWithObjectIdentifier:type:account:", v7, 2, v8);

}

+ (void)removeLegacyTombstoneForFolder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "removeLegacyTombstoneWithObjectIdentifier:type:context:", v6, 2, v5);
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;

  v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = -[ICLegacyTombstone type](self, "type");
  if ((_DWORD)v4 == objc_msgSend(v5, "type"))
  {
    -[ICLegacyTombstone contentHashAtImport](self, "contentHashAtImport");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentHashAtImport");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);
    if ((v8 & 1) == 0)
    {
      -[ICLegacyTombstone contentHashAtImport](self, "contentHashAtImport");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentHashAtImport");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v10)
      {
        v11 = 0;
        goto LABEL_16;
      }
      v24 = v9;
    }
    -[ICLegacyTombstone modificationDateAtImport](self, "modificationDateAtImport");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modificationDateAtImport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqual:", v13);
    if ((v14 & 1) == 0)
    {
      -[ICLegacyTombstone modificationDateAtImport](self, "modificationDateAtImport");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modificationDateAtImport");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15 != v16)
      {
        v11 = 0;
LABEL_15:

        v9 = v24;
        v10 = v24;
        if ((v8 & 1) != 0)
        {
LABEL_17:

          goto LABEL_18;
        }
LABEL_16:

        goto LABEL_17;
      }
      v22 = v15;
    }
    v25 = v7;
    v26 = v6;
    -[ICLegacyTombstone account](self, "account", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v18, "isEqual:", v20);

    if ((v14 & 1) != 0)
    {

      v9 = v24;
      v7 = v25;
      v10 = v24;
      v6 = v26;
      if ((v8 & 1) != 0)
        goto LABEL_17;
      goto LABEL_16;
    }
    v15 = v23;
    v16 = v23;
    v7 = v25;
    v6 = v26;
    goto LABEL_15;
  }
  v11 = 0;
LABEL_18:

  return v11;
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
  ICLegacyTombstone *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICLegacyTombstone;
  -[ICCloudSyncingObject ic_loggingValues](&v12, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICLegacyTombstone managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__ICLegacyTombstone_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E76C73B0;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = v6;
  return v7;
}

void __37__ICLegacyTombstone_ic_loggingValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(*(id *)(a1 + 40), "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v2, CFSTR("type"));

  objc_msgSend(*(id *)(a1 + 40), "contentHashAtImport");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "contentHashAtImport");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("contentHashAtImport"));

  }
  objc_msgSend(*(id *)(a1 + 40), "modificationDateAtImport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "modificationDateAtImport");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("modificationDateAtImport"));

  }
}

+ (id)tombstoneIdentifierForObjectIdentifier:(id)a3 type:(signed __int16)a4
{
  int v4;
  id v5;
  __CFString *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;

  v4 = a4;
  v5 = a3;
  if (v4 == 2)
  {
    v6 = CFSTR("LegacyFolderTombstone_");
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v6 = CFSTR("LegacyNoteTombstone_");
LABEL_5:
    -[__CFString stringByAppendingString:](v6, "stringByAppendingString:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = os_log_create("com.apple.notes", "Migration");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    +[ICLegacyTombstone tombstoneIdentifierForObjectIdentifier:type:].cold.1((uint64_t)v5, v4, v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("LegacyTombstone_%@"), v5);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_9:
  v9 = (void *)v7;

  return v9;
}

+ (signed)tombstoneTypeFromRecordName:(id)a3
{
  id v3;
  signed __int16 v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("LegacyNoteTombstone_")) & 1) == 0)
  {
    if (objc_msgSend(v3, "hasPrefix:", CFSTR("LegacyFolderTombstone_")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

+ (BOOL)hasTombstonePrefix:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("LegacyNoteTombstone_")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasPrefix:", CFSTR("LegacyFolderTombstone_"));

  return v4;
}

- (id)recordType
{
  return CFSTR("LegacyTombstone");
}

- (id)recordZoneName
{
  return CFSTR("Metadata");
}

- (BOOL)isInICloudAccount
{
  return 1;
}

- (BOOL)hasAllMandatoryFields
{
  void *v3;
  BOOL v4;
  objc_super v6;
  objc_super v7;

  if (-[ICLegacyTombstone type](self, "type") == 1)
  {
    v7.receiver = self;
    v7.super_class = (Class)ICLegacyTombstone;
    if (-[ICCloudSyncingObject hasAllMandatoryFields](&v7, sel_hasAllMandatoryFields))
    {
      -[ICLegacyTombstone contentHashAtImport](self, "contentHashAtImport");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "length") != 0;

    }
    else
    {
      return 0;
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)ICLegacyTombstone;
    return -[ICCloudSyncingObject hasAllMandatoryFields](&v6, sel_hasAllMandatoryFields);
  }
  return v4;
}

+ (id)existingCloudObjectForRecordID:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "recordName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a1) = objc_msgSend(a1, "hasTombstonePrefix:", v9);

  if ((_DWORD)a1)
  {
    objc_msgSend(v7, "recordName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICLegacyTombstone legacyTombstoneWithIdentifier:context:](ICLegacyTombstone, "legacyTombstoneWithIdentifier:context:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)newCloudObjectForRecord:(id)a3 accountID:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "recordID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "recordName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(a1, "tombstoneTypeFromRecordName:", v14);

  +[ICAccount cloudKitAccountWithIdentifier:context:](ICAccount, "cloudKitAccountWithIdentifier:context:", v9, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(a1, "newLegacyTombstoneWithIdentifier:type:account:", v12, v15, v16);
  objc_msgSend(v17, "mergeCloudKitRecord:accountID:approach:", v10, v9, 0);

  objc_msgSend(v17, "setServerRecord:", v10);
  objc_msgSend(v17, "setInCloud:", 1);
  objc_msgSend(v17, "clearChangeCountWithReason:", CFSTR("Created tombstone"));

  return v17;
}

- (id)makeCloudKitRecordForApproach:(int64_t)a3 mergeableFieldState:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  if (a3)
  {
    v6 = (void *)MEMORY[0x1E0D641A0];
    -[ICLegacyTombstone className](self, "className", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICLegacyTombstone(CloudKit) makeCloudKitRecordForApproach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v7, v8);

    return 0;
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)ICLegacyTombstone;
    -[ICCloudSyncingObject makeCloudKitRecordForApproach:mergeableFieldState:](&v15, sel_makeCloudKitRecordForApproach_mergeableFieldState_, 0, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLegacyTombstone contentHashAtImport](self, "contentHashAtImport");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[ICLegacyTombstone contentHashAtImport](self, "contentHashAtImport");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("ContentHashAtImport"));

    }
    -[ICLegacyTombstone modificationDateAtImport](self, "modificationDateAtImport");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ICLegacyTombstone modificationDateAtImport](self, "modificationDateAtImport");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("ModificationDateAtImport"));

    }
    return v10;
  }
}

- (BOOL)mergeCloudKitRecord:(id)a3 accountID:(id)a4 approach:(int64_t)a5 mergeableFieldState:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  objc_super v22;

  v10 = a3;
  if (a5)
  {
    v11 = (void *)MEMORY[0x1E0D641A0];
    -[ICLegacyTombstone className](self, "className");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICStringFromSyncingApproach(a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICLegacyTombstone(CloudKit) mergeCloudKitRecord:accountID:approach:mergeableFieldState:]", 1, 0, CFSTR("Object %@ does not support sync approach: %@"), v12, v13);

LABEL_9:
    v20 = 0;
    goto LABEL_10;
  }
  v22.receiver = self;
  v22.super_class = (Class)ICLegacyTombstone;
  if (!-[ICCloudSyncingObject mergeCloudKitRecord:accountID:approach:mergeableFieldState:](&v22, sel_mergeCloudKitRecord_accountID_approach_mergeableFieldState_, v10, a4, 0, a6))goto LABEL_9;
  objc_msgSend(v10, "recordID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "recordName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICLegacyTombstone setIdentifier:](self, "setIdentifier:", v15);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ContentHashAtImport"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ContentHashAtImport"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLegacyTombstone setContentHashAtImport:](self, "setContentHashAtImport:", v17);

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ModificationDateAtImport"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ModificationDateAtImport"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICLegacyTombstone setModificationDateAtImport:](self, "setModificationDateAtImport:", v19);

  }
  v20 = 1;
LABEL_10:

  return v20;
}

- (void)objectWasDeletedFromCloud
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICLegacyTombstone;
  -[ICCloudSyncingObject objectWasDeletedFromCloud](&v4, sel_objectWasDeletedFromCloud);
  if (-[ICCloudSyncingObject hasSuccessfullyPushedLatestVersionToCloud](self, "hasSuccessfullyPushedLatestVersionToCloud"))
  {
    -[ICLegacyTombstone managedObjectContext](self, "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteObject:", self);

  }
}

- (void)objectWasDeletedFromCloudByAnotherDevice
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICLegacyTombstone;
  -[ICCloudSyncingObject objectWasDeletedFromCloudByAnotherDevice](&v4, sel_objectWasDeletedFromCloudByAnotherDevice);
  if (-[ICCloudSyncingObject hasSuccessfullyPushedLatestVersionToCloud](self, "hasSuccessfullyPushedLatestVersionToCloud"))
  {
    -[ICLegacyTombstone managedObjectContext](self, "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteObject:", self);

  }
}

- (void)deleteFromLocalDatabase
{
  id v3;

  -[ICLegacyTombstone managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

+ (void)tombstoneIdentifierForObjectIdentifier:(os_log_t)log type:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Creating tombstone identifier for unknown type %d: %@", (uint8_t *)v3, 0x12u);
}

@end
