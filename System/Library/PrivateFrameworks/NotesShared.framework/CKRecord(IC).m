@implementation CKRecord(IC)

+ (CKRecordSystemFieldsTransformer)ic_systemFieldsValueTransformer
{
  uint64_t v0;

  v0 = objc_opt_class();
  if (v0 != objc_opt_class())
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[self class] == [CKRecord class]", "+[CKRecord(IC) ic_systemFieldsValueTransformer]", 1, 0, CFSTR("-ic_systemFieldsValueTransformer must be overridden, and must not call super: %@"), objc_opt_class());
  return objc_alloc_init(CKRecordSystemFieldsTransformer);
}

- (id)ic_loggingDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v2 = (void *)MEMORY[0x1E0CB37A0];
  objc_msgSend(a1, "recordType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ic_loggingDescriptionIncludingBrackets:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@ %@"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "recordChangeTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" changeTag=%@"), v7);

  objc_msgSend(a1, "parent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordName");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("nil");
  objc_msgSend(v6, "appendFormat:", CFSTR(" parent=%@"), v12);

  objc_msgSend(a1, "creationDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ic_iso8601Date");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = CFSTR("nil");
  objc_msgSend(v6, "appendFormat:", CFSTR(" created=%@"), v16);

  objc_msgSend(a1, "creatorUserRecordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recordName");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = CFSTR("nil");
  objc_msgSend(v6, "appendFormat:", CFSTR(" creator=%@"), v20);

  objc_msgSend(a1, "modificationDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ic_iso8601Date");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v22)
    v24 = (const __CFString *)v22;
  else
    v24 = CFSTR("nil");
  objc_msgSend(v6, "appendFormat:", CFSTR(" modified=%@"), v24);

  objc_msgSend(a1, "modifiedByDevice");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  if (v25)
    v27 = (const __CFString *)v25;
  else
    v27 = CFSTR("nil");
  objc_msgSend(v6, "appendFormat:", CFSTR(" modifiedByDevice=%@"), v27);

  objc_msgSend(a1, "share");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(a1, "share");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "recordID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "recordName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(" share=%@"), v31);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (uint64_t)databaseScope
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "recordID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "databaseScope");

  return v2;
}

- (BOOL)ic_hasMetadata
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(a1, "creationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "creatorUserRecordID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(a1, "modificationDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(a1, "lastModifiedUserRecordID");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5 != 0;

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)ic_isOwnedByCurrentUser
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "recordID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "ic_isOwnedByCurrentUser");

  return v2;
}

+ (uint64_t)ic_valueKeyForKeyPrefix:()IC
{
  return objc_msgSend(a3, "ic_trimmedString");
}

+ (id)ic_assetKeyForKeyPrefix:()IC
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "ic_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@Asset"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ic_encryptedKeyForKeyPrefix:()IC
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "ic_trimmedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@Encrypted"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)ic_encryptedDataKeyForAssetKey:()IC
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "ic_stringWithoutSuffix:", CFSTR("Asset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ic_encryptedKeyForKeyPrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)ic_shouldUseAssetForInlineableDataAsset:()IC approach:
{
  _BOOL8 v4;
  unint64_t v5;
  void *v6;

  if (a4 == 1)
    return 0;
  v5 = objc_msgSend(a3, "length");
  +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 > objc_msgSend(v6, "maxInlineAssetSizeBytes");

  return v4;
}

- (id)ic_inlineableDataAssetForKeyPrefix:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "valuesByKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(a1, "valuesByKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[ICCloudSyncingObject dataForAsset:](ICCloudSyncingObject, "dataForAsset:", v13);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)ic_setInlineableDataAsset:()IC forKeyPrefix:approach:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "ic_shouldUseAssetForInlineableDataAsset:approach:", v18, a5))
  {
    +[ICCloudSyncingObject assetForData:](ICCloudSyncingObject, "assetForData:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "valuesByKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v9);

    objc_msgSend(a1, "valuesByKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v10);

    objc_msgSend(a1, "encryptedValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v11);

  }
  else
  {
    objc_msgSend(a1, "valuesByKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, v9);

    objc_msgSend(a1, "valuesByKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v10);

    objc_msgSend(a1, "encryptedValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v11);
  }

}

- (id)ic_encryptedInlineableDataAssetForKeyPrefix:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  objc_msgSend(a1, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = v8;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(a1, "valuesByKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ICCheckedDynamicCast();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      +[ICCloudSyncingObject dataForAsset:](ICCloudSyncingObject, "dataForAsset:", v13);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)ic_setEncryptedInlineableDataAsset:()IC forKeyPrefix:approach:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = a4;
  objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(a1, "ic_shouldUseAssetForInlineableDataAsset:approach:", v18, a5))
  {
    +[ICCloudSyncingObject assetForData:](ICCloudSyncingObject, "assetForData:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "valuesByKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v9);

    objc_msgSend(a1, "valuesByKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v10);

    objc_msgSend(a1, "encryptedValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", 0, v11);

  }
  else
  {
    objc_msgSend(a1, "valuesByKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v9);

    objc_msgSend(a1, "valuesByKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v10);

    objc_msgSend(a1, "encryptedValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v11);
  }

}

- (void)ic_inlineDataAssetForKeyPrefix:()IC
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
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(a1, "valuesByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[ICCloudSyncingObject dataForAsset:](ICCloudSyncingObject, "dataForAsset:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "valuesByKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v14);

    objc_msgSend(a1, "valuesByKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v5);

    objc_msgSend(a1, "encryptedValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v6);

  }
}

- (void)ic_inlineEncryptedDataAssetForKeyPrefix:()IC
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
  void *v13;
  id v14;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "ic_valueKeyForKeyPrefix:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_assetKeyForKeyPrefix:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "ic_encryptedKeyForKeyPrefix:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(a1, "valuesByKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "valuesByKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v14);

    objc_msgSend(a1, "valuesByKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", 0, v5);

    +[ICCloudSyncingObject dataForAsset:](ICCloudSyncingObject, "dataForAsset:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encryptedValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v6);

  }
}

- (id)ic_copyWithUserFields:()IC
{
  return (id)objc_msgSend(a1, "copyWithZone:userFields:", 0, a3);
}

@end
