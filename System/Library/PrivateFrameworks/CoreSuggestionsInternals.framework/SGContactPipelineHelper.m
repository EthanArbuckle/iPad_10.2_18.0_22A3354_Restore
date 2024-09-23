@implementation SGContactPipelineHelper

- (SGContactPipelineHelper)init
{
  SGContactPipelineHelper *v2;
  SGContactPipelineHelper *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGContactPipelineHelper;
  v2 = -[SGContactPipelineHelper init](&v5, sel_init);
  v3 = v2;
  if (v2)
    pthread_mutex_init(&v2->_helperLock, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_helperLock);
  v3.receiver = self;
  v3.super_class = (Class)SGContactPipelineHelper;
  -[SGContactPipelineHelper dealloc](&v3, sel_dealloc);
}

- (BOOL)numberMatchesContactsForm:(id)a3
{
  return -[SGContactPipelineHelper numberMatchesContactsForm:amongContactsWithIdentifiers:](self, "numberMatchesContactsForm:amongContactsWithIdentifiers:", a3, 0);
}

- (BOOL)numberMatchesContactsForm:(id)a3 amongContactsWithIdentifiers:(id)a4
{
  id v6;
  id v7;
  _opaque_pthread_mutex_t *p_helperLock;
  NSDictionary *v9;
  NSString *mostCommonCountryCode;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSDictionary *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  unint64_t v31;
  BOOL v32;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t *v40;
  _QWORD v41[4];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  NSString *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t phonesSeenInContacts;

  v6 = a3;
  v7 = a4;
  p_helperLock = &self->_helperLock;
  pthread_mutex_lock(&self->_helperLock);
  v9 = self->_lengthsCounts;
  v48 = 0;
  v49 = &v48;
  mostCommonCountryCode = self->_mostCommonCountryCode;
  phonesSeenInContacts = self->_phonesSeenInContacts;
  v42 = 0;
  v43 = &v42;
  v45 = __Block_byref_object_copy__27150;
  v46 = __Block_byref_object_dispose__27151;
  v50 = 0x2020000000;
  v44 = 0x3032000000;
  v47 = mostCommonCountryCode;
  if (v7 || !v9)
  {
    v34 = v6;
    v11 = MEMORY[0x1C3BD4F6C]();
    v49[3] = 0;
    v12 = (void *)v43[5];
    v43[5] = 0;

    v13 = (void *)objc_opt_new();
    v14 = (void *)objc_opt_new();
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __82__SGContactPipelineHelper_numberMatchesContactsForm_amongContactsWithIdentifiers___block_invoke;
    v35[3] = &unk_1E7DB1F70;
    v15 = v13;
    v36 = v15;
    v16 = v14;
    v37 = v16;
    v38 = v41;
    v39 = &v42;
    v40 = &v48;
    v17 = (void *)MEMORY[0x1C3BD5158](v35);
    if (v7)
    {
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v17);
      v18 = (NSDictionary *)v15;
    }
    else
    {
      +[SGLowMemoryContactEnumeration enumerateContactIdentifiersUsingBlock:](SGLowMemoryContactEnumeration, "enumerateContactIdentifiersUsingBlock:", v17);
      v18 = (NSDictionary *)objc_msgSend(v15, "copy");

      objc_storeStrong((id *)&self->_lengthsCounts, v18);
      self->_phonesSeenInContacts = v49[3];
      v19 = (NSString *)objc_msgSend((id)v43[5], "copy");
      v9 = (NSDictionary *)self->_mostCommonCountryCode;
      self->_mostCommonCountryCode = v19;
    }

    _Block_object_dispose(v41, 8);
    v20 = (void *)v11;
    v6 = v34;
    objc_autoreleasePoolPop(v20);
    v9 = v18;
  }
  objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGContactPipelineHelper normalizedDigits:](SGContactPipelineHelper, "normalizedDigits:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (!v43[5])
    goto LABEL_10;
  if (!objc_msgSend(v22, "hasPrefix:"))
    goto LABEL_10;
  v24 = (void *)MEMORY[0x1E0CB37E8];
  v25 = objc_msgSend(v23, "length");
  objc_msgSend(v24, "numberWithUnsignedInteger:", v25 - objc_msgSend((id)v43[5], "length"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "unsignedIntegerValue");

  if (v28 >= v49[3] / 3uLL)
  {
    v32 = 1;
  }
  else
  {
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v23, "length"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "unsignedIntegerValue");

    v32 = v31 >= v49[3] / 3uLL;
  }

  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v48, 8);

  pthread_mutex_unlock(p_helperLock);
  return v32;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostCommonCountryCode, 0);
  objc_storeStrong((id *)&self->_lengthsCounts, 0);
}

void __82__SGContactPipelineHelper_numberMatchesContactsForm_amongContactsWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0C97210];
  v7 = a2;
  v8 = [v6 alloc];
  v24[0] = *MEMORY[0x1E0C967C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithKeysToFetch:", v9);

  v11 = (void *)MEMORY[0x1E0C97200];
  v23 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForContactsWithIdentifiers:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v13);

  +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__SGContactPipelineHelper_numberMatchesContactsForm_amongContactsWithIdentifiers___block_invoke_2;
  v16[3] = &unk_1E7DB1F48;
  v17 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v19 = *(_OWORD *)(a1 + 48);
  v20 = *(_QWORD *)(a1 + 64);
  v21 = a4;
  +[SGContactsInterface enumerateContactsWithFetchRequest:usingContactStore:error:usingBlock:](SGContactsInterface, "enumerateContactsWithFetchRequest:usingContactStore:error:usingBlock:", v10, v14, &v22, v16);
  v15 = v22;

}

void __82__SGContactPipelineHelper_numberMatchesContactsForm_amongContactsWithIdentifiers___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  id v26;
  id obj;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v26 = a2;
  objc_msgSend(v26, "phoneNumbers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v4)
  {
    v5 = v4;
    v29 = *(_QWORD *)v31;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v31 != v29)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1C3BD4F6C]();
        objc_msgSend(v7, "value");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CB37E8];
        +[SGContactPipelineHelper normalizedDigits:](SGContactPipelineHelper, "normalizedDigits:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "length"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v16, v12);

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", &unk_1E7E0CA70, v12);
        }
        v17 = (void *)MEMORY[0x1E0C97398];
        objc_msgSend(v9, "countryCode");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "dialingCodeForISOCountryCode:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR("+"), &stru_1E7DB83A8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = *(void **)(a1 + 40);
          if (v21)
          {
            objc_msgSend(v22, "objectForKeyedSubscript:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "unsignedIntegerValue") + 1;

            if (v24 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
            {
              objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v20);
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v24;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v25, v20);

          }
          else
          {
            objc_msgSend(v22, "setObject:forKeyedSubscript:", &unk_1E7E0CA70, v20);
          }
        }
        if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= 0x15uLL)
        {
          *a3 = 1;
          **(_BYTE **)(a1 + 72) = 1;
        }

        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v5);
  }

}

+ (SGContactPipelineHelper)sharedInstance
{
  if (sharedInstance__pasOnceToken3_27198 != -1)
    dispatch_once(&sharedInstance__pasOnceToken3_27198, &__block_literal_global_27199);
  return (SGContactPipelineHelper *)(id)sharedInstance__pasExprOnceResult_27200;
}

+ (id)findContactsForPerson:(id)a3 fetchingKeys:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "handles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "handleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0C966A8]);

    if ((v9 & 1) != 0)
    {
      v10 = 2;
LABEL_5:
      objc_msgSend(v5, "handles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "findContactsForDetailType:andValue:", v10, v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }
    objc_msgSend(v5, "handleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0C967C0]);

    v10 = 0;
    v7 = 0;
    if (v12)
      goto LABEL_5;
  }
LABEL_6:

  return v7;
}

+ (id)findContactsForDetailType:(unint64_t)a3 andValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (a3 <= 6 && ((0x57u >> a3) & 1) != 0)
  {
    v6 = **((id **)&unk_1E7DB1F90 + a3);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc(MEMORY[0x1E0C99E60]);
      v10 = (void *)objc_msgSend(v9, "initWithObjects:", v7, v8, *MEMORY[0x1E0C967C0], *MEMORY[0x1E0C966A8], *MEMORY[0x1E0C96790], *MEMORY[0x1E0C966D0], *MEMORY[0x1E0C96780], *MEMORY[0x1E0C966C0], *MEMORY[0x1E0C96798], *MEMORY[0x1E0C96898], *MEMORY[0x1E0C967B8], *MEMORY[0x1E0C967A0], *MEMORY[0x1E0C96868], *MEMORY[0x1E0C96670], 0);
      if (a3 == 2)
      {
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingEmailAddress:", v5);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a3 != 1)
        {
          v11 = 0;
          if (a3)
          {
LABEL_19:

            goto LABEL_10;
          }
          objc_msgSend(MEMORY[0x1E0C97398], "phoneNumberWithStringValue:", v5);
          v12 = objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            sgLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v24 = v5;
              _os_log_fault_impl(&dword_1C3607000, v21, OS_LOG_TYPE_FAULT, "phoneNumberWithStringValue unexpectedly failed for string: %@", buf, 0xCu);
            }

            if (_PASEvaluateLogFaultAndProbCrashCriteria())
              abort();
            v11 = 0;
            goto LABEL_19;
          }
          v13 = (void *)v12;
          objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingPhoneNumber:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
          objc_msgSend(v10, "allObjects");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGContactStoreFactory contactStore](SGContactStoreFactory, "contactStore");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = 0;
          +[SGContactsInterface unifiedContactsMatchingPredicate:keysToFetch:usingContactStore:error:](SGContactsInterface, "unifiedContactsMatchingPredicate:keysToFetch:usingContactStore:error:", v14, v17, v18, &v22);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v22;

          if (!v11)
          {
            sgLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v24 = v14;
              v25 = 2112;
              v26 = v19;
              _os_log_debug_impl(&dword_1C3607000, v20, OS_LOG_TYPE_DEBUG, "unifiedContactsMatchingPredicate failed with predicate %@ and error %@", buf, 0x16u);
            }

            v11 = (void *)MEMORY[0x1E0C9AA60];
          }

          goto LABEL_19;
        }
        objc_msgSend(MEMORY[0x1E0C97200], "predicateForContactsMatchingFullTextSearch:containerIdentifiers:groupIdentifiers:", v5, 0, 0);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v16;
      goto LABEL_14;
    }
  }
  v11 = 0;
LABEL_10:

  return v11;
}

+ (BOOL)personExistsInContacts:(id)a3 name:(id)a4 handle:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  BOOL v34;
  void *v36;
  id v37;
  id v38;
  id v39;
  id obj;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _QWORD v52[4];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactPipelineHelper.m"), 213, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("contacts"));

  }
  if (objc_msgSend(v10, "length") || objc_msgSend(v11, "length"))
  {
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v10, "lowercaseString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      SGNamesOnlyNameChars(v12);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12;
    }
    else
    {
      v41 = 0;
    }
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    obj = v9;
    v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v49;
      v38 = v11;
      v39 = v10;
      v37 = v9;
      while (2)
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v49 != v43)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
          v15 = (void *)MEMORY[0x1C3BD4F6C]();
          if (v11
            && ((objc_msgSend(v14, "hasEmailAddress:", v11) & 1) != 0
             || (objc_msgSend(v14, "hasPhoneNumber:", v11) & 1) != 0))
          {
            goto LABEL_34;
          }
          if (objc_msgSend(v10, "length"))
          {
            objc_msgSend(v14, "givenName");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            SGNamesOnlyNameChars(v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "familyName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            SGNamesOnlyNameChars(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v17, "length"))
            {
              v20 = v17;
            }
            else
            {
              objc_msgSend(v14, "givenName");
              v20 = (id)objc_claimAutoreleasedReturnValue();
            }
            v21 = v20;
            v46 = v17;
            v47 = v15;
            v45 = v19;
            if (objc_msgSend(v19, "length"))
            {
              v22 = v19;
            }
            else
            {
              objc_msgSend(v14, "familyName");
              v22 = (id)objc_claimAutoreleasedReturnValue();
            }
            v23 = v22;
            objc_msgSend(v21, "lowercaseString");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v52[0] = v44;
            objc_msgSend(v23, "lowercaseString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v52[1] = v24;
            v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v23, v21);
            objc_msgSend(v25, "lowercaseString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v52[2] = v26;
            v27 = v21;
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@%@"), v21, v23);
            objc_msgSend(v28, "lowercaseString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v52[3] = v29;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 4);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v39;
            if (objc_msgSend(v41, "length"))
              v31 = v41;
            else
              v31 = v39;
            if ((objc_msgSend(v30, "containsObject:", v31) & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v14, 0),
                  v32 = (void *)objc_claimAutoreleasedReturnValue(),
                  v33 = +[SGNames namesApproximatelyMatch:and:](SGNames, "namesApproximatelyMatch:and:", v32, v39), v32, v33))
            {

              v11 = v38;
              v15 = v47;
LABEL_34:
              objc_autoreleasePoolPop(v15);
              v34 = 1;
              v9 = v37;
              goto LABEL_35;
            }

            v11 = v38;
            v15 = v47;
          }
          objc_autoreleasePoolPop(v15);
        }
        v34 = 0;
        v9 = v37;
        v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
        if (v42)
          continue;
        break;
      }
    }
    else
    {
      v34 = 0;
    }
LABEL_35:

  }
  else
  {
    v34 = 0;
  }

  return v34;
}

+ (id)normalizedDigits:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = (void *)MEMORY[0x1C3BD4F6C]();
  v5 = (void *)MEMORY[0x1E0C97398];
  objc_msgSend(v3, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dialingCodeForISOCountryCode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  v8 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v3, "digits");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(";"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  if (v7 && objc_msgSend(v11, "hasPrefix:", v7))
  {
    v12 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v11, "substringFromIndex:", objc_msgSend(v7, "length"));
    v13 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v12);
    v11 = (void *)v13;
  }

  return v11;
}

void __41__SGContactPipelineHelper_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_27200;
  sharedInstance__pasExprOnceResult_27200 = v1;

  objc_autoreleasePoolPop(v0);
}

@end
