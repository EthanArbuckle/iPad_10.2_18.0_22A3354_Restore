@implementation MUISearchResultsSuggester

+ (id)documentsSuggesterWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MUISearchResultsSuggesterDocumentsConfiguration *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(_MUISearchResultsSuggesterDocumentsConfiguration);
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleID:messageRepository:senderQueryManager:configuration:", v10, v9, v8, v11);

  return v12;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MUISearchResultsSuggester_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_10 != -1)
    dispatch_once(&log_onceToken_10, block);
  return (OS_os_log *)(id)log_log_10;
}

void __32__MUISearchResultsSuggester_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_10;
  log_log_10 = (uint64_t)v1;

}

- (MUISearchResultsSuggester)initWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5 configuration:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MUISearchResultsSuggester *v15;
  MUISearchResultsSuggester *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MUISearchResultsSuggester;
  v15 = -[MUISearchResultsSuggester init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleID, a3);
    objc_storeStrong((id *)&v16->_messageRepository, a4);
    objc_storeStrong((id *)&v16->_senderQueryManager, a5);
    objc_storeStrong((id *)&v16->_configuration, a6);
  }

  return v16;
}

- (id)generateSuggestionsUsingPhraseManager:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  id *v8;
  id *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "phraseKind"))
  {
    v8 = -[MUIResultSuggestionQuery initWithPhraseManager:handler:suggester:]((id *)[MUIResultSuggestionQuery alloc], v6, v7, self);
    v9 = v8;
    if (v8)
      objc_msgSend(v8[7], "start");
  }
  else
  {
    +[MUISearchResultsSuggester log](MUISearchResultsSuggester, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MUISearchResultsSuggester generateSuggestionsUsingPhraseManager:handler:].cold.1(v10);

    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldQueryForAsYouType
{
  return 0;
}

- (NSString)logIdentifier
{
  if (self)
    self = (MUISearchResultsSuggester *)self->_configuration;
  return -[MUISearchResultsSuggester logIdentifier](self, "logIdentifier");
}

- (NSArray)categories
{
  if (self)
    self = (MUISearchResultsSuggester *)self->_configuration;
  return -[MUISearchResultsSuggester categories](self, "categories");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_senderQueryManager, 0);
  objc_storeStrong((id *)&self->_messageRepository, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

+ (NSArray)dateAttributes
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CA69D0];
  v5[0] = *MEMORY[0x1E0CA6A08];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0CA60D0];
  v5[2] = *MEMORY[0x1E0CA69D8];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)dateQueryString
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateByAddingTimeInterval:", -1209600.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  +[MUISearchResultsSuggester dateAttributes](MUISearchResultsSuggester, "dateAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__MUISearchResultsSuggester_Date__dateQueryString__block_invoke;
  v10[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  v10[4] = v5;
  objc_msgSend(v6, "ef_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR(" || "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

uint64_t __50__MUISearchResultsSuggester_Date__dateQueryString__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ > %f"), a2, *(_QWORD *)(a1 + 32));
}

+ (id)dateForSuggestionResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  objc_msgSend(v3, "searchableItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  v17 = __Block_byref_object_dispose__2;
  v18 = 0;
  +[MUISearchResultsSuggester dateAttributes](MUISearchResultsSuggester, "dateAttributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__MUISearchResultsSuggester_Date__dateForSuggestionResult___block_invoke;
  v10[3] = &unk_1E99E32C8;
  v12 = &v13;
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __59__MUISearchResultsSuggester_Date__dateForSuggestionResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;

  v3 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v10 = v3;
    objc_msgSend(*(id *)(a1 + 32), "attributeForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA69D0]) & 1) != 0
      || objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA69D8]))
    {
      objc_msgSend(v4, "firstObject");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;
    }
    else
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = v4;
      v7 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v9;
    }

    v3 = v10;
  }

}

+ (id)suggestionResultsSortedByDate:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "ef_partition:", &__block_literal_global_30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "second");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    +[MUISearchResultsSuggester log](MUISearchResultsSuggester, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MUISearchResultsSuggester(Date) suggestionResultsSortedByDate:].cold.1(v3);

  }
  objc_msgSend(v3, "first");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_112);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __65__MUISearchResultsSuggester_Date__suggestionResultsSortedByDate___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  +[MUISearchResultsSuggester dateForSuggestionResult:](MUISearchResultsSuggester, "dateForSuggestionResult:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __65__MUISearchResultsSuggester_Date__suggestionResultsSortedByDate___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  +[MUISearchResultsSuggester dateForSuggestionResult:](MUISearchResultsSuggester, "dateForSuggestionResult:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MUISearchResultsSuggester dateForSuggestionResult:](MUISearchResultsSuggester, "dateForSuggestionResult:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "compare:", v6);
  if (!v8)
  {
    objc_msgSend(v5, "searchableItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "searchableItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "compare:", v12);

  }
  return v8;
}

+ (id)linksSuggesterWithBundleID:(id)a3 messageRepository:(id)a4 senderQueryManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  _MUISearchResultsSuggesterRichLinksConfiguration *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(_MUISearchResultsSuggesterRichLinksConfiguration);
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleID:messageRepository:senderQueryManager:configuration:", v10, v9, v8, v11);

  return v12;
}

- (void)generateSuggestionsUsingPhraseManager:(os_log_t)log handler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D5522000, log, OS_LOG_TYPE_DEBUG, "Rich results not generated for AYT search", v1, 2u);
}

@end
