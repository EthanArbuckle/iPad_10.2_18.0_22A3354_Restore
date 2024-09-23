@implementation CKRecord(HealthDaemon)

- (uint64_t)hd_equivalentRecord:()HealthDaemon
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(a1, "recordID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if (!v7)
    goto LABEL_4;
  objc_msgSend(a1, "valueStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "values");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "values");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "isEqual:", v11);

  if (v12)
  {
    objc_msgSend(a1, "encryptedValueStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "values");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "encryptedValueStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "values");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "isEqual:", v16);

  }
  else
  {
LABEL_4:
    v17 = 0;
  }

  return v17;
}

- (uint64_t)hd_isCKShare
{
  return 0;
}

- (uint64_t)hd_setValue:()HealthDaemon ifChangedForKey:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {

  }
  else
  {
    v9 = v8;
    if (!v6)
    {

LABEL_8:
      objc_msgSend(a1, "setObject:forKeyedSubscript:", v6, v7);
      v12 = 1;
      goto LABEL_9;
    }
    objc_msgSend(a1, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v6);

    if ((v11 & 1) == 0)
      goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (uint64_t)hd_setValuesIfChanged:()HealthDaemon
{
  id v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CKRecord_HealthDaemon__hd_setValuesIfChanged___block_invoke;
  v7[3] = &unk_1E6D01310;
  v7[4] = a1;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (BOOL)hd_setEncryptedValue:()HealthDaemon ifChangedForKey:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "encryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v9 != v6;
  if (v9 == v6)
  {

LABEL_8:
    goto LABEL_9;
  }
  v11 = v9;
  if (!v6)
  {

    goto LABEL_7;
  }
  objc_msgSend(a1, "encryptedValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v6);

  if ((v14 & 1) == 0)
  {
LABEL_7:
    objc_msgSend(a1, "encryptedValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v6, v7);
    goto LABEL_8;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

- (uint64_t)hd_setEncryptedValuesIfChanged:()HealthDaemon
{
  id v4;
  uint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__CKRecord_HealthDaemon__hd_setEncryptedValuesIfChanged___block_invoke;
  v7[3] = &unk_1E6D01310;
  v7[4] = a1;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)hd_requiredValueForKey:()HealthDaemon type:error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    HKSafeObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(a1, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_assignError:code:format:", a5, 3, CFSTR("record %@ does not have value for key (%@)"), v12, v7);

    v9 = 0;
  }

  return v9;
}

- (id)hd_requiredEncryptedValueForKey:()HealthDaemon type:error:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  objc_msgSend(a1, "encryptedValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    HKSafeObject();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(a1, "recordID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recordName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_assignError:code:format:", a5, 3, CFSTR("record %@ does not have encrypted value for key (%@)"), v13, v7);

    v10 = 0;
  }

  return v10;
}

- (id)hd_optionalValueForKey:()HealthDaemon type:error:
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    HKSafeObject();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)hd_optionalEncryptedValueForKey:()HealthDaemon type:error:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    HKSafeObject();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)hd_recordWithSystemData:()HealthDaemon error:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  objc_class *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)_recordClasses;
  if (!_recordClasses)
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;
  objc_msgSend(v7, "arrayByAddingObject:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v30;
    v27 = a4;
    while (2)
    {
      v14 = 0;
      v15 = v12;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v9);
        v16 = *(objc_class **)(*((_QWORD *)&v29 + 1) + 8 * v14);
        v17 = objc_alloc(MEMORY[0x1E0CB3710]);
        v28 = v15;
        v18 = (void *)objc_msgSend(v17, "initForReadingFromData:error:", v5, &v28);
        v12 = v28;

        if (!v18)
        {
          v23 = (void *)MEMORY[0x1E0CB35C8];
          v24 = (void *)MEMORY[0x1E0CB3940];
          NSStringFromClass(v16);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "stringWithFormat:", CFSTR("Failed to initialize unarchiver for class %@"), v22);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "hk_assignError:code:description:underlyingError:", v27, 100, v25, v12);

          v20 = v9;
          goto LABEL_16;
        }
        v19 = (void *)objc_msgSend([v16 alloc], "initWithCoder:", v18);
        objc_msgSend(v18, "finishDecoding");

        if (v19)
        {
          v20 = v9;
          goto LABEL_18;
        }
        ++v14;
        v15 = v12;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      a4 = v27;
      if (v11)
        continue;
      break;
    }
  }
  else
  {
    v12 = 0;
  }

  objc_msgSend(v9, "hk_map:", &__block_literal_global_179);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to unarchive data for classes %@"), v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "hk_assignError:code:description:", a4, 100, v22);
LABEL_16:

  v19 = 0;
LABEL_18:

  return v19;
}

- (id)hd_systemData
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(a1, "encodeSystemFieldsWithCoder:", v2);
  objc_msgSend(v2, "finishEncoding");
  objc_msgSend(v2, "encodedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
