@implementation CNAutocompleteSuggestionsProbe

+ (id)suggestionIdentifierForAutocompleteResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "sourceType") & 4) != 0)
  {
    v8[0] = *MEMORY[0x1E0C966E8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contactWithKeysToFetch:error:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = 0;
    if (objc_msgSend(v6, "isSuggested"))
    {
      objc_msgSend(v6, "suggestionRecordId");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)contactIdentifierForAutocompleteResult:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "sourceType") & 2) != 0)
  {
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int)suggestionSourcesForAutocompleteResult:(id)a3
{
  id v3;
  void *v4;
  id v5;
  int v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  _QWORD v15[4];
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v15[0] = &unk_1E70EFDD8;
  v15[1] = &unk_1E70EFE08;
  v16[0] = &unk_1E70EFDF0;
  v16[1] = &unk_1E70EFE20;
  v15[2] = &unk_1E70EFE38;
  v15[3] = &unk_1E70EFE68;
  v16[2] = &unk_1E70EFE50;
  v16[3] = &unk_1E70EFE80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__CNAutocompleteSuggestionsProbe_suggestionSourcesForAutocompleteResult___block_invoke;
  v8[3] = &unk_1E70DEDD0;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __73__CNAutocompleteSuggestionsProbe_suggestionSourcesForAutocompleteResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  v7 = objc_msgSend(v5, "sourceType");
  v8 = objc_msgSend(v6, "unsignedIntegerValue");

  if ((v8 & v7) != 0)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v9, "intValue");

}

- (CNAutocompleteSuggestionsProbe)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CNAutocompleteSuggestionsProbe *v7;

  -[objc_class serviceForContacts](getSGSuggestionsServiceClass(), "serviceForContacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSyncTimeout:", 0.2);
  objc_msgSend(MEMORY[0x1E0D13B70], "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CNAutocompleteSuggestionsProbe initWithSuggestionsService:schedulerProvider:bundleIdentifier:](self, "initWithSuggestionsService:schedulerProvider:bundleIdentifier:", v3, v4, v6);

  return v7;
}

- (CNAutocompleteSuggestionsProbe)initWithSuggestionsService:(id)a3 schedulerProvider:(id)a4 bundleIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNAutocompleteSuggestionsProbe *v12;
  CNAutocompleteSuggestionsProbe *v13;
  uint64_t v14;
  CNScheduler *workScheduler;
  uint64_t v16;
  NSString *bundleID;
  uint64_t v18;
  NSMutableArray *pendingBlocks;
  CNAutocompleteSuggestionsProbe *v20;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CNAutocompleteSuggestionsProbe;
  v12 = -[CNAutocompleteSuggestionsProbe init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_sgService, a3);
    v14 = objc_msgSend(v10, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.ContactsAutocomplete.CNAutocompleteSuggestionsProbe"));
    workScheduler = v13->_workScheduler;
    v13->_workScheduler = (CNScheduler *)v14;

    v16 = objc_msgSend(v11, "copy");
    bundleID = v13->_bundleID;
    v13->_bundleID = (NSString *)v16;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    pendingBlocks = v13->_pendingBlocks;
    v13->_pendingBlocks = (NSMutableArray *)v18;

    v20 = v13;
  }

  return v13;
}

- (void)recordUserSelectedAutocompleteResult:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  int v13;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "suggestionSourcesForAutocompleteResult:", v4);
  objc_msgSend((id)objc_opt_class(), "suggestionIdentifierForAutocompleteResult:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "contactIdentifierForAutocompleteResult:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__CNAutocompleteSuggestionsProbe_recordUserSelectedAutocompleteResult___block_invoke;
  v10[3] = &unk_1E70DEDF8;
  v13 = v5;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[CNAutocompleteSuggestionsProbe recordSGServiceMessage:](self, "recordSGServiceMessage:", v10);

}

uint64_t __71__CNAutocompleteSuggestionsProbe_recordUserSelectedAutocompleteResult___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "logMetricAutocompleteResult:recordId:contactIdentifier:bundleId:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (void)recordUserSawResultsConsideredSuggestion
{
  -[CNAutocompleteSuggestionsProbe recordSGServiceMessage:](self, "recordSGServiceMessage:", &__block_literal_global_2);
}

uint64_t __74__CNAutocompleteSuggestionsProbe_recordUserSawResultsConsideredSuggestion__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logMetricSearchResultsIncludedPureSuggestionWithBundleId:");
}

- (void)recordSGServiceMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;

  v4 = a3;
  -[CNAutocompleteSuggestionsProbe pendingBlocks](self, "pendingBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsProbe sgService](self, "sgService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsProbe bundleID](self, "bundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsProbe workScheduler](self, "workScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__CNAutocompleteSuggestionsProbe_recordSGServiceMessage___block_invoke;
  v13[3] = &unk_1E70DEE68;
  v14 = v5;
  v15 = v6;
  v16 = v7;
  v17 = v4;
  v9 = v7;
  v10 = v6;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v8, "performBlock:", v13);

}

void __57__CNAutocompleteSuggestionsProbe_recordSGServiceMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__CNAutocompleteSuggestionsProbe_recordSGServiceMessage___block_invoke_2;
  v5[3] = &unk_1E70DEE40;
  v8 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v3 = (void *)objc_msgSend(v5, "copy");
  v4 = _Block_copy(v3);
  objc_msgSend(v2, "addObject:", v4);

}

uint64_t __57__CNAutocompleteSuggestionsProbe_recordSGServiceMessage___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)sendData
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  -[CNAutocompleteSuggestionsProbe pendingBlocks](self, "pendingBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteSuggestionsProbe workScheduler](self, "workScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__CNAutocompleteSuggestionsProbe_sendData__block_invoke;
  v6[3] = &unk_1E70DEE90;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

uint64_t __42__CNAutocompleteSuggestionsProbe_sendData__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6) + 16))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 32), "removeAllObjects", (_QWORD)v8);
}

- (SGSuggestionsServiceContactsProtocol)sgService
{
  return self->_sgService;
}

- (CNScheduler)workScheduler
{
  return self->_workScheduler;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_workScheduler, 0);
  objc_storeStrong((id *)&self->_sgService, 0);
}

@end
