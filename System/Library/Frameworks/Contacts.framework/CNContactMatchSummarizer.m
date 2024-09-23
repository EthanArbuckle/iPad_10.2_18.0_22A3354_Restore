@implementation CNContactMatchSummarizer

+ (id)log
{
  if (log_cn_once_token_0_4 != -1)
    dispatch_once(&log_cn_once_token_0_4, &__block_literal_global_56);
  return (id)log_cn_once_object_0_4;
}

void __31__CNContactMatchSummarizer_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNContactMatchSummarizer");
  v1 = (void *)log_cn_once_object_0_4;
  log_cn_once_object_0_4 = (uint64_t)v0;

}

+ (id)summaryProperties
{
  if (summaryProperties_cn_once_token_1 != -1)
    dispatch_once(&summaryProperties_cn_once_token_1, &__block_literal_global_3_5);
  return (id)summaryProperties_cn_once_object_1;
}

void __45__CNContactMatchSummarizer_summaryProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("nickname");
  v3[1] = CFSTR("organizationName");
  v3[2] = CFSTR("departmentName");
  v3[3] = CFSTR("jobTitle");
  v3[4] = CFSTR("note");
  v3[5] = CFSTR("phoneNumbers");
  v3[6] = CFSTR("emailAddresses");
  v3[7] = CFSTR("postalAddresses");
  v3[8] = CFSTR("urlAddresses");
  v3[9] = CFSTR("contactRelations");
  v3[10] = CFSTR("socialProfiles");
  v3[11] = CFSTR("instantMessageAddresses");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 12);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)summaryProperties_cn_once_object_1;
  summaryProperties_cn_once_object_1 = v1;

}

+ (id)summaryPropertyForMatchInfo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(a1, "summaryProperties", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "matchedProperties");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "count");
        if (v15 > v8)
        {
          v16 = v15;
          v17 = v12;

          v8 = v16;
          v9 = v17;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)summariesFutureForContactsIdentifiers:(id)a3 matchInfos:(id)a4 contactStore:(id)a5 scheduler:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  CNContactMatchSummarizer *v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (objc_class *)MEMORY[0x1E0D139B8];
  v14 = a6;
  v15 = objc_alloc_init(v13);
  v16 = (void *)MEMORY[0x1E0D13A68];
  v17 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke;
  v27[3] = &unk_1E29F9D48;
  v28 = v10;
  v29 = v11;
  v30 = self;
  v31 = v12;
  v18 = v15;
  v32 = v18;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  objc_msgSend(v16, "futureWithBlock:scheduler:", v27, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_4;
  v25[3] = &unk_1E29F89E0;
  v26 = v18;
  v23 = v18;
  objc_msgSend(v22, "addFailureBlock:", v25);

  return v22;
}

id __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CNContactFetchRequest *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int8x16_t v15;
  _QWORD v16[4];
  id v17;
  int8x16_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v2 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_2;
  v21[3] = &unk_1E29F9198;
  v3 = *(void **)(a1 + 32);
  v22 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_cn_filter:", v21);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "keyDescriptorForContactIdentifiers:matchInfos:", v4, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CNContactFetchRequest initWithKeysToFetch:]([CNContactFetchRequest alloc], "initWithKeysToFetch:", v7);
    -[CNContactFetchRequest setUnifyResults:](v8, "setUnifyResults:", 0);
    -[CNContactFetchRequest setDisallowsEncodedFetch:](v8, "setDisallowsEncodedFetch:", 1);
    +[CNContact predicateForContactsWithIdentifiers:](CNContact, "predicateForContactsWithIdentifiers:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactFetchRequest setPredicate:](v8, "setPredicate:", v9);

    v10 = (void *)objc_opt_new();
    v16[0] = v2;
    v16[1] = 3221225472;
    v16[2] = __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_3;
    v16[3] = &unk_1E29F9D20;
    v11 = *(void **)(a1 + 56);
    v17 = *(id *)(a1 + 64);
    v15 = *(int8x16_t *)(a1 + 40);
    v12 = (id)v15.i64[0];
    v18 = vextq_s8(v15, v15, 8uLL);
    v19 = v10;
    v20 = v5;
    v13 = v10;
    objc_msgSend(v11, "enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:", v8, 0, v16);

  }
  return v5;
}

uint64_t __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "excerpt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "future");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "isFinished") ^ 1;
  return v5;
}

void __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isCanceled"))
  {
    *a4 = 1;
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v13, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "summaryForContact:matchInfo:", v13, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
      v10 = *(id *)(a1 + 56);
    v11 = *(void **)(a1 + 64);
    objc_msgSend(v13, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v10, v12);

  }
}

uint64_t __100__CNContactMatchSummarizer_summariesFutureForContactsIdentifiers_matchInfos_contactStore_scheduler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D13A50], "isCanceledError:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
  return result;
}

+ (id)keyDescriptorForContactIdentifiers:(id)a3 matchInfos:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  CNPerContactPropertyKeyDescriptor *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = objc_alloc_init(CNPerContactPropertyKeyDescriptor);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "matchedProperties");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(a1, "summaryPropertyForMatchInfo:", v15);
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = (void *)v17;
            if (v17)
            {
              v26 = v17;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              -[CNPerContactPropertyKeyDescriptor setKeysToFetch:forContactIdentifier:](v21, "setKeysToFetch:forContactIdentifier:", v19, v13);

            }
          }
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  return v21;
}

- (CNContactMatchSummarizer)init
{
  CNContactMatchSummarizer *v2;
  const __CFAllocator *v3;
  const __CFLocale *v4;
  CNContactMatchSummarizer *v5;
  objc_super v7;
  CFRange v8;

  v7.receiver = self;
  v7.super_class = (Class)CNContactMatchSummarizer;
  v2 = -[CNContactMatchSummarizer init](&v7, sel_init);
  if (v2)
  {
    v2->_tokenList = (void *)ABTokenListCreate();
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = (const __CFLocale *)objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v8.location = 0;
    v8.length = 0;
    v2->_tokenizer = CFStringTokenizerCreate(v3, &stru_1E29FF900, v8, 0x810000uLL, v4);
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  objc_super v4;

  CFRelease(self->_tokenList);
  tokenizer = self->_tokenizer;
  if (tokenizer)
    CFRelease(tokenizer);
  v4.receiver = self;
  v4.super_class = (Class)CNContactMatchSummarizer;
  -[CNContactMatchSummarizer dealloc](&v4, sel_dealloc);
}

- (id)summaryForContact:(id)a3 matchInfo:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  CNContactMatchSummarizer *v36;
  id v37;
  _BYTE *v38;
  uint64_t *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  void *v50;
  void *v51;
  uint8_t v52[128];
  _BYTE buf[24];
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v6 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__15;
  v48 = __Block_byref_object_dispose__15;
  v49 = 0;
  +[CNContactMatchSummarizer summaryPropertyForMatchInfo:](CNContactMatchSummarizer, "summaryPropertyForMatchInfo:", v6);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v6;
  objc_msgSend(v6, "matchedProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
LABEL_26:
    v22 = (id)v45[5];
    goto LABEL_27;
  }
  if ((objc_msgSend(v30, "isKeyAvailable:", v32) & 1) != 0)
  {
    objc_msgSend(v30, "valueForKey:", v32);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      +[CN contactPropertiesByKey](CN, "contactPropertiesByKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v32);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v54 = 0;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        obj = v28;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v41;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v41 != v11)
                objc_enumerationMutation(obj);
              v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
              objc_msgSend(v9, "plistTransform");
              v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "value");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(_QWORD, void *))v14)[2](v14, v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v17 = v16;
              }
              else
              {
                v50 = v32;
                v51 = v16;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
                v17 = (id)objc_claimAutoreleasedReturnValue();
              }
              v18 = v17;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v9, "summarizationKeys");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v19 = 0;
              }
              v34[0] = MEMORY[0x1E0C809B0];
              v34[1] = 3221225472;
              v34[2] = __56__CNContactMatchSummarizer_summaryForContact_matchInfo___block_invoke;
              v34[3] = &unk_1E29F9D70;
              v20 = v19;
              v35 = v20;
              v36 = self;
              v37 = v33;
              v38 = buf;
              v39 = &v44;
              objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v34);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
          }
          while (v10);
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[CNContactMatchSummarizer attributedStringForPropertyValueString:queryTerms:outMatchCount:](self, "attributedStringForPropertyValueString:queryTerms:outMatchCount:", v28, v33, 0);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v45[5];
          v45[5] = v23;

        }
      }

    }
    goto LABEL_26;
  }
  objc_msgSend((id)objc_opt_class(), "log");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v30, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "availableKeyDescriptor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v32;
    *(_WORD *)&buf[22] = 2114;
    v54 = v27;
    _os_log_error_impl(&dword_18F8BD000, v21, OS_LOG_TYPE_ERROR, "contact %{public}@ does not have %{public}@ fetched, available keys %{public}@", buf, 0x20u);

  }
  v22 = 0;
LABEL_27:

  _Block_object_dispose(&v44, 8);
  return v22;
}

void __56__CNContactMatchSummarizer_summaryForContact_matchInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (!v7 || objc_msgSend(v7, "containsObject:", v5))
  {
    v10 = 0;
    objc_msgSend(*(id *)(a1 + 40), "attributedStringForPropertyValueString:queryTerms:outMatchCount:", v6, *(_QWORD *)(a1 + 48), &v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      if (v10 > *(_QWORD *)(v9 + 24))
      {
        *(_QWORD *)(v9 + 24) = v10;
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v8);
      }
    }

  }
}

- (id)attributedStringForPropertyValueString:(id)a3 queryTerms:(id)a4 outMatchCount:(unint64_t *)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t Count;
  uint64_t v18;
  uint64_t i;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t TokenRangeAtIndex;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v33;
  const __CFString *v34;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB3500];
  v9 = a3;
  objc_msgSend(v8, "newlineCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" "));
  v12 = objc_claimAutoreleasedReturnValue();

  v40 = (void *)v12;
  ABTokenListPopulateFromString();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v7;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  v13 = 0;
  v14 = 0;
  if (v38)
  {
    v37 = *(_QWORD *)v42;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v42 != v37)
          objc_enumerationMutation(obj);
        v39 = v15;
        v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * v15);
        Count = ABTokenListGetCount();
        if (Count >= 1)
        {
          v18 = Count;
          for (i = 0; i != v18; ++i)
          {
            if (objc_msgSend((id)ABTokenListGetTokenAtIndex(), "rangeOfString:options:", v16, 393) != 0x7FFFFFFFFFFFFFFFLL)
            {
              v21 = v20;
              if (!v13)
                v13 = i;
              if (!v14)
                v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v40);
              TokenRangeAtIndex = ABTokenListGetTokenRangeAtIndex();
              if (v21 >= v22)
                v21 = v22;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "addAttribute:value:range:", CFSTR("contactExcerptEmphasized"), v24, TokenRangeAtIndex, v21);

              if (a5)
                ++*a5;
            }
          }
        }
        v15 = v39 + 1;
      }
      while (v39 + 1 != v38);
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v38);
  }

  if (v13 + 10 < ABTokenListGetCount())
  {
    v25 = ABTokenListGetTokenRangeAtIndex();
    objc_msgSend(v14, "replaceCharactersInRange:withString:", v25 + v26, objc_msgSend(v14, "length") - (v25 + v26), CFSTR("…"));
  }
  if (v13)
  {
    v27 = ABTokenListGetTokenRangeAtIndex();
    if (v27 >= 16)
    {
      if (v13 < 2)
      {
        v33 = 0;
      }
      else
      {
        v28 = v27;
        v29 = 0;
        v30 = 1;
        do
        {
          v31 = v28 - ABTokenListGetTokenRangeAtIndex();
          if (v31 < 16)
            v29 = v30;
          v30 = v29 + 1;
        }
        while (v13 - (v29 + 1) >= 1 && v31 < 16);
        v33 = v29;
      }
      if (v13 == v33)
        v34 = &stru_1E29FF900;
      else
        v34 = CFSTR("…");
      objc_msgSend(v14, "replaceCharactersInRange:withString:", 0, ABTokenListGetTokenRangeAtIndex(), v34);
    }
  }

  return v14;
}

@end
