@implementation _CNAutocompletePeopleSuggesterPredictionSearchStrategyTask

- (_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask)initWithRequest:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  _CNAutocompletePeopleSuggesterPredictionSearchStrategyTask *v9;
  _CNAutocompletePeopleSuggesterPredictionSearchStrategyTask *v10;
  _CNAutocompletePeopleSuggesterPredictionSearchStrategyTask *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask;
  v9 = -[CNTask initWithName:](&v13, sel_initWithName_, CFSTR("com.apple.contacts.autocomplete.prediction-search.ps"));
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_contactStore, a4);
    v11 = v10;
  }

  return v10;
}

- (id)run:(id *)a3
{
  -[_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask prepareQuery](self, "prepareQuery", a3);
  -[_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask runQuery](self, "runQuery");
  -[_CNAutocompletePeopleSuggesterPredictionSearchStrategyTask convertResults](self, "convertResults");
  return self->_results;
}

- (void)prepareQuery
{
  _PSPredictionContext *v3;
  _PSPredictionContext *context;
  void *v5;
  void *v6;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = (_PSPredictionContext *)objc_alloc_init(get_PSPredictionContextClass_0());
  context = self->_context;
  self->_context = v3;

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mainBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setBundleID:](self->_context, "setBundleID:", v6);

  -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendingAddressAccountIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setAccountIdentifier:](self->_context, "setAccountIdentifier:", v8);

  -[CNAutocompleteFetchRequest searchString](self->_request, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setSearchPrefix:](self->_context, "setSearchPrefix:", v9);

  -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "otherAddressesAlreadyChosen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setSeedRecipients:](self->_context, "setSeedRecipients:", v11);

  -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "locationUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "locationUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PSPredictionContext setLocationUUIDs:](self->_context, "setLocationUUIDs:", v16);

  }
  -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSPredictionContext setSuggestionDate:](self->_context, "setSuggestionDate:", v18);

}

- (void)runQuery
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *psResults;
  NSObject *v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  CNALoggingContextTriage();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  CNALoggingContextPerformance();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Searching PeopleSuggester", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "peopleSuggester");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autocompleteSearchResultsWithPredictionContext:", self->_context);
  v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
  psResults = self->_psResults;
  self->_psResults = v9;

  CNALoggingContextPerformance();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v12, OS_SIGNPOST_INTERVAL_END, v4, "Searching PeopleSuggester", ", v13, 2u);
  }

}

- (void)convertResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  NSArray *psResults;
  id v13;
  id v14;
  NSArray *v15;
  NSArray *results;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  -[CNAutocompleteFetchRequest priorityDomainForSorting](self->_request, "priorityDomainForSorting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendingAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_opt_new();
  -[CNAutocompleteFetchRequest searchString](self->_request, "searchString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[CNAutocompleteFetchRequest searchString](self->_request, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length") == 0;

  }
  else
  {
    v10 = 1;
  }

  -[_PSPredictionContext bundleID](self->_context, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  psResults = self->_psResults;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76___CNAutocompletePeopleSuggesterPredictionSearchStrategyTask_convertResults__block_invoke;
  v18[3] = &unk_1E70DFF58;
  v18[4] = self;
  v19 = v7;
  v22 = v10;
  v20 = v6;
  v21 = v11;
  v13 = v11;
  v14 = v6;
  v17 = v7;
  -[NSArray _cn_compactMap:](psResults, "_cn_compactMap:", v18);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  results = self->_results;
  self->_results = v15;

}

+ (int64_t)_addressTypeFromHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3 || !objc_msgSend(v3, "length"))
  {
    CNALoggingContextDebug();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B9950000, v7, OS_LOG_TYPE_DEFAULT, "Skipping a PeopleSuggester prediction with a nil or empty handle.", (uint8_t *)&v15, 2u);
    }
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v5 = (void *)MEMORY[0x1E0D13A70];
  v17[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "classificationOfHandleStrings:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  -[NSObject phoneNumbers](v7, "phoneNumbers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    -[NSObject emailAddresses](v7, "emailAddresses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      v10 = 1;
      goto LABEL_8;
    }
    CNALoggingContextDebug();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      _os_log_impl(&dword_1B9950000, v14, OS_LOG_TYPE_DEFAULT, "Unrecognized handle from duet: %@", (uint8_t *)&v15, 0xCu);
    }

    goto LABEL_7;
  }
  v10 = 2;
LABEL_8:

  return v10;
}

+ (id)_identifierForGroupResultSuggestion:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(v4, "conversationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
  {

    objc_msgSend(a1, "_fallbackIdentifierByAssemblingDistinctValuesFromGroupResultSuggestion:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

+ (id)_fallbackIdentifierByAssemblingDistinctValuesFromGroupResultSuggestion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v3, "groupName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v3, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_cn_compactMap:", &__block_literal_global_26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", v9);
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsJoinedByString:", &stru_1E70E0E70);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_psResults, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
