@implementation CNDonatedMeCardPersistenceHelper

+ (id)mutableCopyOfContact:(id)a3 byCopyingValuesForKeysOnly:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __84__CNDonatedMeCardPersistenceHelper_mutableCopyOfContact_byCopyingValuesForKeysOnly___block_invoke;
  v23[3] = &unk_1E204E1D8;
  v6 = v5;
  v24 = v6;
  objc_msgSend(a4, "_cn_filter:", v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_map:", &__block_literal_global_4854);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_filter:", &__block_literal_global_3_4855);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0C97360]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v16, "CNValueForContact:", v6, (_QWORD)v19);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCNValue:onContact:", v17, v10);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v13);
  }

  return v10;
}

+ (id)mutableCopyOfContact:(id)a3 byCopyingModificationsAndValuesForKeysOnly:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;

  v6 = a3;
  v7 = (void *)objc_msgSend(a1, "mutableCopyOfContact:byCopyingValuesForKeysOnly:", v6, a4);
  objc_msgSend(v6, "diffToSnapshotAndReturnError:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v8, "updates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = (*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10);

  if ((v9 & 1) != 0)
  {
    v11 = v7;
  }
  else
  {
    objc_msgSend(v8, "contactByApplyingUpdatesToContact:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v12, "mutableCopy");

  }
  return v11;
}

+ (BOOL)createNewMeContact:(id)a3 inStore:(id)a4
{
  id v6;
  id v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  NSObject *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "saveContactInStore:group:container:", v7, 0, 0) & 1) != 0)
  {
    v12 = 0;
    v8 = objc_msgSend(v7, "setMeContact:error:", v6, &v12);
    v9 = v12;
    if (v9)
    {
      objc_msgSend(a1, "propertyGroupItemLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        v14 = v9;
        _os_log_impl(&dword_18AC56000, v10, OS_LOG_TYPE_DEFAULT, "could not set new me contact: %{private}@", buf, 0xCu);
      }

    }
  }
  else
  {
    objc_msgSend(a1, "propertyGroupItemLog");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18AC56000, v9, OS_LOG_TYPE_DEFAULT, "could not save new me contact", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

+ (id)defaultKeysForValuesToPersist
{
  if (defaultKeysForValuesToPersist_cn_once_token_3 != -1)
    dispatch_once(&defaultKeysForValuesToPersist_cn_once_token_3, &__block_literal_global_6_4850);
  return (id)defaultKeysForValuesToPersist_cn_once_object_3;
}

+ (id)propertyGroupItemLog
{
  if (propertyGroupItemLog_cn_once_token_4 != -1)
    dispatch_once(&propertyGroupItemLog_cn_once_token_4, &__block_literal_global_8);
  return (id)propertyGroupItemLog_cn_once_object_4;
}

void __56__CNDonatedMeCardPersistenceHelper_propertyGroupItemLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "contacts-ui");
  v1 = (void *)propertyGroupItemLog_cn_once_object_4;
  propertyGroupItemLog_cn_once_object_4 = (uint64_t)v0;

}

void __65__CNDonatedMeCardPersistenceHelper_defaultKeysForValuesToPersist__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[20];

  v11[19] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C96708];
  v11[0] = *MEMORY[0x1E0C96898];
  v11[1] = v0;
  v1 = *MEMORY[0x1E0C96890];
  v11[2] = *MEMORY[0x1E0C96688];
  v11[3] = v1;
  v2 = *MEMORY[0x1E0C96790];
  v11[4] = *MEMORY[0x1E0C96700];
  v11[5] = v2;
  v3 = *MEMORY[0x1E0C96780];
  v11[6] = *MEMORY[0x1E0C966D0];
  v11[7] = v3;
  v4 = *MEMORY[0x1E0C96798];
  v11[8] = *MEMORY[0x1E0C966C0];
  v11[9] = v4;
  v5 = *MEMORY[0x1E0C967A0];
  v11[10] = *MEMORY[0x1E0C96820];
  v11[11] = v5;
  v6 = *MEMORY[0x1E0C96698];
  v11[12] = *MEMORY[0x1E0C967B8];
  v11[13] = v6;
  v7 = *MEMORY[0x1E0C967D8];
  v11[14] = *MEMORY[0x1E0C96758];
  v11[15] = v7;
  v8 = *MEMORY[0x1E0C967D0];
  v11[16] = *MEMORY[0x1E0C967E0];
  v11[17] = v8;
  v11[18] = *MEMORY[0x1E0C967E8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 19);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)defaultKeysForValuesToPersist_cn_once_object_3;
  defaultKeysForValuesToPersist_cn_once_object_3 = v9;

}

uint64_t __84__CNDonatedMeCardPersistenceHelper_mutableCopyOfContact_byCopyingValuesForKeysOnly___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isKeyAvailable:", a2);
}

uint64_t __84__CNDonatedMeCardPersistenceHelper_mutableCopyOfContact_byCopyingValuesForKeysOnly___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isWritable");
}

id __84__CNDonatedMeCardPersistenceHelper_mutableCopyOfContact_byCopyingValuesForKeysOnly___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C971A0];
  v3 = a2;
  objc_msgSend(v2, "contactPropertiesByKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
