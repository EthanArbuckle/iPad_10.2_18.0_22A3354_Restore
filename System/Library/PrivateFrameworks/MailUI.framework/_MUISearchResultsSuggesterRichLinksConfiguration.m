@implementation _MUISearchResultsSuggesterRichLinksConfiguration

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55___MUISearchResultsSuggesterRichLinksConfiguration_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_11 != -1)
    dispatch_once(&log_onceToken_11, block);
  return (OS_os_log *)(id)log_log_11;
}

- (NSArray)categories
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  +[MUISearchSuggestionCategory linkCategory](MUISearchSuggestionCategory, "linkCategory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)logIdentifier
{
  return (NSString *)CFSTR("Links");
}

- (id)suggestionFilterQueryWithPhraseManager:(id)a3 senderFilterQuery:(id)a4
{
  id v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = a4;
  objc_msgSend(a3, "phrase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@*'cdw"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = CFSTR("'*'");
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0D1EC48], "idAttributeKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("(%@ = %@)"), v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  +[MUISearchResultsSuggester dateQueryString](MUISearchResultsSuggester, "dateQueryString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("(%@) && (%@)"), v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(" && (%@)"), v5);
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }

  return v13;
}

- (NSArray)fetchAttributes
{
  if (fetchAttributes_onceToken_0 != -1)
    dispatch_once(&fetchAttributes_onceToken_0, &__block_literal_global_31);
  return (NSArray *)(id)fetchAttributes_fetchAttributes_0;
}

- (id)processSuggestionsResults:(id)a3 phraseManager:(id)a4 messageList:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[5];
  id v25;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  +[MUISearchResultsSuggester suggestionResultsSortedByDate:](MUISearchResultsSuggester, "suggestionResultsSortedByDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__3;
  v24[4] = __Block_byref_object_dispose__3;
  v25 = (id)0xAAAAAAAAAAAAAAAALL;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__3;
  v22 = __Block_byref_object_dispose__3;
  v23 = (id)0xAAAAAAAAAAAAAAAALL;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104___MUISearchResultsSuggesterRichLinksConfiguration_processSuggestionsResults_phraseManager_messageList___block_invoke;
  v14[3] = &unk_1E99E3458;
  v16 = v24;
  v17 = &v18;
  v11 = v9;
  v15 = v11;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);
  v12 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(v24, 8);

  return v12;
}

- (unint64_t)maxItemCount
{
  return 4;
}

@end
