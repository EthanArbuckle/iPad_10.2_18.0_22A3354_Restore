@implementation CNDonatedContactSanitizer

+ (id)sanitizeDonatedContact:(id)a3 matchingPredicate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0_5 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_14_0);
  v8 = CNGuardOSLog_cn_once_object_0_5;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT))
  {
    +[CNDonatedContactSanitizer sanitizeDonatedContact:matchingPredicate:].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);
    if (v7)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v7)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0_5 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_14_0);
  v16 = CNGuardOSLog_cn_once_object_0_5;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT))
    +[CNDonatedContactSanitizer sanitizeDonatedContact:matchingPredicate:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_10:
  v24 = (void *)objc_msgSend(a1, "mutableCopyOfDonatedContact:withCustomIdentifier:", v6, CFSTR("2D0447ED-BB88-45F9-909B-EB36C6920675"));
  objc_msgSend(v6, "storeInfo");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = (void *)v25;
  v27 = MEMORY[0x1E0C9AA70];
  if (v25)
    v27 = v25;
  v37[0] = v27;
  objc_opt_class();
  v28 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;
  v30 = v29;

  objc_msgSend(a1, "storeInfoFromPredicate:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "storeInfoByMergingStoreInfos:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNDonationMapper mapperIdentifier](CNDonationMapper, "mapperIdentifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "markContactAndMultiValuesAsDonated:usingStoreInfo:andStoreIdentifier:", v24, v33, v34);
  objc_msgSend(v24, "setPreferredForName:", 0);
  objc_msgSend(v24, "setFrozenSelfAsSnapshot");
  v35 = (void *)objc_msgSend(v24, "copy");

  return v35;
}

+ (id)mutableCopyOfDonatedContact:(id)a3 withCustomIdentifier:(id)a4
{
  id v5;
  id v6;
  CNMutableContact *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = -[CNContact initWithIdentifier:]([CNMutableContact alloc], "initWithIdentifier:", v6);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  +[CN writableContactProperties](CN, "writableContactProperties", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "key");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v5, "isKeyAvailable:", v14);

        if (v15)
        {
          objc_msgSend(v13, "CNValueForContact:", v5);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCNValue:onContact:", v16, v7);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  return v7;
}

+ (void)markContactAndMultiValuesAsDonated:(id)a3 usingStoreInfo:(id)a4 andStoreIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "setStoreIdentifier:", v9);
  objc_msgSend(v7, "setStoreInfo:", v8);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  +[CN writableMultiValueContactProperties](CN, "writableMultiValueContactProperties");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v31;
    do
    {
      v13 = 0;
      v24 = v11;
      do
      {
        if (*(_QWORD *)v31 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v13);
        objc_msgSend(v14, "key", v24);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v7, "isKeyAvailable:", v15);

        if (v16)
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v17 = v7;
          objc_msgSend(v14, "CNValueForContact:", v7);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          if (v19)
          {
            v20 = v19;
            v21 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v20; ++i)
              {
                if (*(_QWORD *)v27 != v21)
                  objc_enumerationMutation(v18);
                v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
                objc_msgSend(v23, "setStoreIdentifier:", v9);
                objc_msgSend(v23, "addStoreInfo:", v8);
              }
              v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            }
            while (v20);
          }

          v7 = v17;
          v11 = v24;
        }
        ++v13;
      }
      while (v13 != v11);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v11);
  }

}

+ (id)storeInfoByMergingStoreInfos:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_reduce:initialValue:", &__block_literal_global_85, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __58__CNDonatedContactSanitizer_storeInfoByMergingStoreInfos___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;

  v4 = a2;
  objc_msgSend(v4, "addEntriesFromDictionary:", a3);
  return v4;
}

+ (id)storeInfoFromPredicate:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0D137F8];
  objc_msgSend(v3, "mainStoreContactIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if ((v4 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v10 = CFSTR("CNContactMainStoreLinkedIdentifier");
    objc_msgSend(v3, "mainStoreContactIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (void)sanitizeDonatedContact:(uint64_t)a3 matchingPredicate:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F8BD000, a1, a3, "parameter ‘predicate’ must be nonnull", a5, a6, a7, a8, 0);
}

+ (void)sanitizeDonatedContact:(uint64_t)a3 matchingPredicate:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18F8BD000, a1, a3, "parameter ‘donatedContact’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
