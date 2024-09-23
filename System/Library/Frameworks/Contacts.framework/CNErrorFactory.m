@implementation CNErrorFactory

+ (id)errorWithCode:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  objc_msgSend(a1, "_localizedReasonForCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_localizedDescriptionForCode:", a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 || v8 || v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    if (v6)
      objc_msgSend(v11, "addEntriesFromDictionary:", v6);
    if (v9)
      objc_msgSend(v10, "setObject:forKey:", v9, *MEMORY[0x1E0CB2D50]);
    if (v7)
      objc_msgSend(v10, "setObject:forKey:", v7, *MEMORY[0x1E0CB2D68]);
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNErrorDomain"), a3, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_localizedDescriptionForCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_DESCRIPTION"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D13A98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForString:bundle:table:returningNilIfNotFound:", v6, v8, CFSTR("Errors"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_localizedReasonForCode:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("_REASON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D13A98];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForString:bundle:table:returningNilIfNotFound:", v6, v8, CFSTR("Errors"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)errorWithCode:(int64_t)a3
{
  return (id)objc_msgSend(a1, "errorWithCode:userInfo:", a3, 0);
}

+ (id)os_log
{
  if (os_log_cn_once_token_0_6 != -1)
    dispatch_once(&os_log_cn_once_token_0_6, &__block_literal_global_38);
  return (id)os_log_cn_once_object_0_6;
}

void __31__CNErrorFactory_iOSAB__os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNErrorFactory");
  v1 = (void *)os_log_cn_once_object_0_6;
  os_log_cn_once_object_0_6 = (uint64_t)v0;

}

+ (id)genericiOSABError
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "os_log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    +[CNErrorFactory(iOSAB) genericiOSABError].cold.1(v2);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_cn_balancedSlicesWithMaximumCount:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8);
        v10 = os_log_create("com.apple.contacts", "data-access-error");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v17 = v9;
          _os_log_error_impl(&dword_18F8BD000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNErrorDomain"), 2, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorForiOSABError:(__CFError *)a3
{
  __CFError *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  NSObject *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __CFError *v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;
  _QWORD v29[3];

  v29[1] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  if (!a3)
  {
    objc_msgSend(a1, "genericiOSABError");
    v5 = (__CFError *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(CFSTR("CNErrorDomain"), "isEqualToString:", CFErrorGetDomain(a3)))
  {
    v5 = a3;
LABEL_5:
    v6 = (uint64_t)v5;
    goto LABEL_7;
  }
  v7 = objc_msgSend(a1, "CNErrorCodeForABError:", a3);
  v28 = *MEMORY[0x1E0CB3388];
  v29[0] = a3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCode:userInfo:", v7, v8);
  v6 = objc_claimAutoreleasedReturnValue();

LABEL_7:
  objc_msgSend(a1, "os_log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[CNErrorFactory(iOSAB) errorForiOSABError:].cold.1((uint64_t)&v24, v6, v9);
  v19 = (id)v6;

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_cn_balancedSlicesWithMaximumCount:", 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        v17 = os_log_create("com.apple.contacts", "data-access-error");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v16;
          _os_log_error_impl(&dword_18F8BD000, v17, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v13);
  }

  return v19;
}

+ (int64_t)CNErrorCodeForABError:(__CFError *)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  CFDictionaryRef v9;
  void *v10;
  char v12;

  if (CNErrorCodeForABError__cn_once_token_5 != -1)
    dispatch_once(&CNErrorCodeForABError__cn_once_token_5, &__block_literal_global_6_0);
  v4 = (id)CNErrorCodeForABError__cn_once_object_5;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFErrorGetDomain(a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "integerValue");
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 2;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", CFErrorGetCode(a3));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v6 = objc_msgSend(v8, "integerValue");
    else
      v6 = 2;

  }
  if (v6 == 500)
  {
    v9 = CFErrorCopyUserInfo(a3);
    -[__CFDictionary objectForKey:](v9, "objectForKey:", *MEMORY[0x1E0CF5730]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CF5738]) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CF5740]))
    {

      v6 = 206;
    }
    else
    {
      v12 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CF5748]);

      if ((v12 & 1) != 0)
        v6 = 207;
      else
        v6 = 500;
    }
  }
LABEL_15:

  return v6;
}

void __47__CNErrorFactory_iOSAB__CNErrorCodeForABError___block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[2];
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CF5728];
  v8[0] = &unk_1E2A3FF90;
  v8[1] = &unk_1E2A3FFC0;
  v9[0] = &unk_1E2A3FFA8;
  v9[1] = &unk_1E2A3FFD8;
  v10[0] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v1;
  v10[1] = *MEMORY[0x1E0CF5E58];
  v6[0] = &unk_1E2A3FFC0;
  v6[1] = &unk_1E2A40008;
  v7[0] = &unk_1E2A3FFF0;
  v7[1] = &unk_1E2A3FFF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = *MEMORY[0x1E0CF62B8];
  v11[1] = v2;
  v11[2] = &unk_1E2A3FFF0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)CNErrorCodeForABError__cn_once_object_5;
  CNErrorCodeForABError__cn_once_object_5 = v4;

}

+ (id)errorByPrependingKeyPath:(id)a3 toKeyPathsInError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v6)
  {
    if (objc_msgSend(v5, "length"))
    {
      v26 = v6;
      objc_msgSend(v6, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v25 = v8;
      objc_msgSend(v8, "objectForKeyedSubscript:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v28 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
            v31[0] = v5;
            v31[1] = v15;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "componentsJoinedByString:", CFSTR("."));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v17);

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        }
        while (v12);
      }

      if (objc_msgSend(v9, "count"))
      {
        v18 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v25, "setObject:forKeyedSubscript:", v18, CFSTR("CNKeyPaths"));

      }
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v6 = v26;
      objc_msgSend(v26, "domain");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v26, "code");
      v22 = (void *)objc_msgSend(v25, "copy");
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v21, v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = v6;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)errorByAddingUserInfoEntries:(id)a3 toError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v8, "addEntriesFromDictionary:", v6);
  v9 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(v5, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "code");

  v12 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)errorObject:(id)a3 doesNotImplementSelector:(SEL)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = *MEMORY[0x1E0CB2D50];
  v11[0] = CFSTR("No implementation");
  v5 = *MEMORY[0x1E0CB2D68];
  v10[0] = v4;
  v10[1] = v5;
  CNFullMethodName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNErrorDomain"), 1002, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)validationErrorByAggregatingValidationErrors:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  const __CFString *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = (void *)objc_opt_new();
    v27 = (void *)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          v11 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v10, "domain");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%ld"), v12, objc_msgSend(v10, "code"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObject:", v13);

          objc_msgSend(v10, "userInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CNInvalidRecords"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v26, "addObjectsFromArray:", v15);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v7);
    }

    v34 = CFSTR("CNValidationErrors");
    v16 = (void *)objc_msgSend(v5, "copy");
    v35 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    if ((unint64_t)objc_msgSend(v27, "count") < 2)
    {
      objc_msgSend(v5, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "code");
      v32 = CFSTR("CNInvalidRecords");
      objc_msgSend(v26, "array");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v23;
      v19 = v26;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", v22, v24);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v19 = v26;
      if (objc_msgSend(v26, "count"))
      {
        objc_msgSend(v26, "array");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKey:", v20, CFSTR("CNInvalidRecords"));

      }
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 300, v18);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v4;
}

@end
