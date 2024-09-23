@implementation CNSuggestedContactStore

- (CNSuggestedContactStore)initWithSuggestionsService:(id)a3 siriIntelligenceSettings:(id)a4
{
  id v7;
  id v8;
  CNSuggestedContactStore *v9;
  CNSuggestedContactStore *v10;
  CNSiriIntelligenceSettingsProtocol *v11;
  CNSiriIntelligenceSettingsProtocol *siriIntelligenceSettings;
  uint64_t v13;
  SGSuggestionsServiceContactsProtocol *suggestionService;
  uint64_t v15;
  CNSuggestedContactStore *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CNSuggestedContactStore;
  v9 = -[CNContactStore init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    if (v7)
    {
      objc_storeStrong((id *)&v9->_suggestionService, a3);
      if (v8)
      {
LABEL_4:
        v11 = (CNSiriIntelligenceSettingsProtocol *)v8;
        siriIntelligenceSettings = v10->_siriIntelligenceSettings;
        v10->_siriIntelligenceSettings = v11;
LABEL_7:

        v16 = v10;
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D19970], "serviceForContacts");
      v13 = objc_claimAutoreleasedReturnValue();
      suggestionService = v10->_suggestionService;
      v10->_suggestionService = (SGSuggestionsServiceContactsProtocol *)v13;

      -[SGSuggestionsServiceContactsProtocol setSyncTimeout:](v10->_suggestionService, "setSyncTimeout:", 0.2);
      if (v8)
        goto LABEL_4;
    }
    v15 = objc_opt_new();
    siriIntelligenceSettings = v10->_siriIntelligenceSettings;
    v10->_siriIntelligenceSettings = (CNSiriIntelligenceSettingsProtocol *)v15;
    goto LABEL_7;
  }
LABEL_8:

  return v10;
}

+ (id)storeIdentifier
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__CNSuggestedContactStore_storeIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (storeIdentifier_cn_once_token_1 != -1)
    dispatch_once(&storeIdentifier_cn_once_token_1, block);
  return (id)storeIdentifier_cn_once_object_1;
}

- (BOOL)enumerateContactsAndMatchInfoWithFetchRequest:(id)a3 error:(id *)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  SGSuggestionsServiceContactsProtocol *suggestionService;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  v8 = a3;
  v9 = a5;
  if (-[CNSiriIntelligenceSettingsProtocol shouldShowSiriSuggestions](self->_siriIntelligenceSettings, "shouldShowSiriSuggestions"))
  {
    objc_msgSend(v8, "predicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE18ABB8))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v13 = objc_msgSend(v8, "sortOrder");
      objc_msgSend(v8, "keysToFetch");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v8, "mutableObjects");
      suggestionService = self->_suggestionService;
      v37 = 0;
      -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:](v12, v13, v14, v15, suggestionService, &v37);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v37;

      if (!v17)
      {
        objc_msgSend((id)objc_opt_class(), "os_log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[CNSuggestedContactStore enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:].cold.2((uint64_t)v18, v19);

        v18 = 0;
        v17 = (void *)MEMORY[0x1E0C9AA60];
      }
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      v27 = MEMORY[0x1E0C809B0];
      v28 = 3221225472;
      v29 = __90__CNSuggestedContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke;
      v30 = &unk_1E29FCD80;
      v32 = &v33;
      v31 = v9;
      objc_msgSend(v17, "enumerateObjectsUsingBlock:", &v27);
      if (v34[3])
      {
        v20 = os_log_create("com.apple.contacts", "data-access-error");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          -[CNSuggestedContactStore enumerateContactsAndMatchInfoWithFetchRequest:error:usingBlock:].cold.1(v20);

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CNErrorDomain"), 2, 0);
        v21 = objc_claimAutoreleasedReturnValue();

        v22 = (void *)MEMORY[0x1E0D13B78];
        v23 = v34[3];
        v24 = objc_msgSend(v17, "count");
        objc_msgSend(v22, "simulateCrashWithMessage:", CFSTR("enumerateContactsAndMatchInfoWithFetchRequest encountered NSNull %lu times where %lu CNContact objects where expcted"), v23, v24, 0, v27, v28, v29, v30);
        v18 = (id)v21;
      }
      v25 = v18 == 0;
      if (a4 && v18)
        *a4 = objc_retainAutorelease(v18);

      _Block_object_dispose(&v33, 8);
    }
    else
    {
      v25 = 1;
    }

  }
  else
  {
    v25 = 1;
  }

  return v25;
}

void __42__CNSuggestedContactStore_storeIdentifier__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)storeIdentifier_cn_once_object_1;
  storeIdentifier_cn_once_object_1 = v1;

}

+ (id)storeInfoClasses
{
  if (storeInfoClasses_cn_once_token_0 != -1)
    dispatch_once(&storeInfoClasses_cn_once_token_0, &__block_literal_global_106);
  return (id)storeInfoClasses_cn_once_object_0;
}

void __43__CNSuggestedContactStore_storeInfoClasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)storeInfoClasses_cn_once_object_0;
  storeInfoClasses_cn_once_object_0 = v0;

}

+ (id)os_log
{
  if (os_log_cn_once_token_2_3 != -1)
    dispatch_once(&os_log_cn_once_token_2_3, &__block_literal_global_2_4);
  return (id)os_log_cn_once_object_2_3;
}

void __33__CNSuggestedContactStore_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contact", "suggestions");
  v1 = (void *)os_log_cn_once_object_2_3;
  os_log_cn_once_object_2_3 = (uint64_t)v0;

}

+ (BOOL)isSuggestionsSupported
{
  return objc_msgSend(MEMORY[0x1E0D19970], "isHarvestingSupported");
}

- (CNSuggestedContactStore)init
{
  return -[CNSuggestedContactStore initWithSuggestionsService:siriIntelligenceSettings:](self, "initWithSuggestionsService:siriIntelligenceSettings:", 0, 0);
}

- (id)requestAccessForEntityType:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", MEMORY[0x1E0C9AAB0]);
}

- (BOOL)shouldLogContactsAccess
{
  return 0;
}

- (id)originForSuggestion:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (-[CNSiriIntelligenceSettingsProtocol shouldShowSiriSuggestions](self->_siriIntelligenceSettings, "shouldShowSiriSuggestions"))
  {
    objc_msgSend(v6, "suggestionRecordId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SGSuggestionsServiceContactsProtocol originFromRecordId:error:](self->_suggestionService, "originFromRecordId:error:", v7, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 205, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (a4)
        *a4 = objc_retainAutorelease(v9);

      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __90__CNSuggestedContactStore_enumerateContactsAndMatchInfoWithFetchRequest_error_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13830] + 16))() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

- (id)unifiedContactsMatchingPredicate:(id)a3 keysToFetch:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v8 = a3;
  v9 = a4;
  if (-[CNSiriIntelligenceSettingsProtocol shouldShowSiriSuggestions](self->_siriIntelligenceSettings, "shouldShowSiriSuggestions"))
  {
    v10 = v8;
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE18ABB8))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      -[CNPredicate suggestedContactsWithSortOrder:keysToFetch:mutableObjects:service:error:](v12, 0, v9, 0, self->_suggestionService, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 400, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (a5)
        *a5 = objc_retainAutorelease(v14);

      v13 = 0;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (BOOL)_processSuggestions:(id)a3 error:(id *)a4 withBlock:(id)a5
{
  id v7;
  uint64_t (**v8)(id, void *, uint64_t, id *);
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (uint64_t (**)(id, void *, uint64_t, id *))a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v14, "isSuggested", (_QWORD)v21))
        {
          objc_msgSend(v14, "suggestionRecordId");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            objc_msgSend(v14, "suggestionRecordId");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_opt_class();
            v18 = v8[2](v8, v16, v17, a4);

            if (!v18)
            {
              v19 = 0;
              goto LABEL_13;
            }
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v11)
        continue;
      break;
    }
  }
  v19 = 1;
LABEL_13:

  return v19;
}

- (BOOL)executeSaveRequest:(id)a3 error:(id *)a4
{
  return -[CNSuggestedContactStore executeSaveRequest:response:authorizationContext:error:](self, "executeSaveRequest:response:authorizationContext:error:", a3, 0, 0, a4);
}

- (BOOL)executeSaveRequest:(id)a3 response:(id *)a4 authorizationContext:(id)a5 error:(id *)a6
{
  id v8;
  char v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _BOOL4 v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  _QWORD v26[5];

  v8 = a3;
  if ((-[CNSiriIntelligenceSettingsProtocol shouldShowSiriSuggestions](self->_siriIntelligenceSettings, "shouldShowSiriSuggestions") & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = objc_msgSend(v8, "suppressChangeNotifications");
      if ((v9 & 1) == 0)
      {
        +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "willSaveChanges");

      }
      v11 = v8;
      objc_msgSend(v11, "confirmedSuggestions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __82__CNSuggestedContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke;
      v26[3] = &unk_1E29FCDA8;
      v26[4] = self;
      v14 = -[CNSuggestedContactStore _processSuggestions:error:withBlock:](self, "_processSuggestions:error:withBlock:", v12, a6, v26);

      if (v14)
      {
        objc_msgSend(v11, "rejectedSuggestions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v13;
        v25[1] = 3221225472;
        v25[2] = __82__CNSuggestedContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke_2;
        v25[3] = &unk_1E29FCDA8;
        v25[4] = self;
        v16 = -[CNSuggestedContactStore _processSuggestions:error:withBlock:](self, "_processSuggestions:error:withBlock:", v15, a6, v25);

        if ((v9 & 1) != 0)
          goto LABEL_15;
      }
      else
      {
        v16 = 0;
        if ((v9 & 1) != 0)
        {
LABEL_15:

          goto LABEL_16;
        }
      }
      +[CNChangesNotifier sharedNotifier](CNChangesNotifier, "sharedNotifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "saveRequestIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "didSaveChangesSuccessfully:fromContactStore:requestIdentifier:", v16, self, v23);

      goto LABEL_15;
    }
    v19 = (void *)MEMORY[0x1E0C99DA0];
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "raise:format:", CFSTR("CNSuggestedContactStoreInvalidSaveRequest"), CFSTR("Unexpected save request of class %@"), v21);

  }
  else
  {
    +[CNErrorFactory errorWithCode:userInfo:](CNErrorFactory, "errorWithCode:userInfo:", 103, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (a6)
      *a6 = objc_retainAutorelease(v17);

  }
  LOBYTE(v16) = 0;
LABEL_16:

  return v16;
}

uint64_t __82__CNSuggestedContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a2;
  v8 = objc_msgSend(a3, "isSubclassOfClass:", objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "suggestionService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = objc_msgSend(v9, "confirmContactDetailRecord:error:", v7, a4);
  else
    v11 = objc_msgSend(v9, "confirmRecord:error:", v7, a4);
  v12 = v11;

  return v12;
}

uint64_t __82__CNSuggestedContactStore_executeSaveRequest_response_authorizationContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a2;
  v8 = objc_msgSend(a3, "isSubclassOfClass:", objc_opt_class());
  objc_msgSend(*(id *)(a1 + 32), "suggestionService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = objc_msgSend(v9, "rejectContactDetailRecord:rejectionUI:error:", v7, 1, a4);
  else
    v11 = objc_msgSend(v9, "rejectRecord:rejectionUI:error:", v7, 1, a4);
  v12 = v11;

  return v12;
}

- (SGSuggestionsServiceContactsProtocol)suggestionService
{
  return self->_suggestionService;
}

- (void)setSuggestionService:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionService, a3);
}

- (CNSiriIntelligenceSettingsProtocol)siriIntelligenceSettings
{
  return self->_siriIntelligenceSettings;
}

- (void)setSiriIntelligenceSettings:(id)a3
{
  objc_storeStrong((id *)&self->_siriIntelligenceSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriIntelligenceSettings, 0);
  objc_storeStrong((id *)&self->_suggestionService, 0);
}

- (void)enumerateContactsAndMatchInfoWithFetchRequest:(os_log_t)log error:usingBlock:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18F8BD000, log, OS_LOG_TYPE_ERROR, "Encountered null object(s) (suggested)", v1, 2u);
}

- (void)enumerateContactsAndMatchInfoWithFetchRequest:(uint64_t)a1 error:(NSObject *)a2 usingBlock:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Error fetching from CoreSuggestions: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
