@implementation _CNAutocompleteCoreDuetPredictionSearchStrategyTask

- (_CNAutocompleteCoreDuetPredictionSearchStrategyTask)initWithRequest:(id)a3 contactStore:(id)a4
{
  id v7;
  id v8;
  _CNAutocompleteCoreDuetPredictionSearchStrategyTask *v9;
  _CNAutocompleteCoreDuetPredictionSearchStrategyTask *v10;
  _CNAutocompleteCoreDuetPredictionSearchStrategyTask *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_CNAutocompleteCoreDuetPredictionSearchStrategyTask;
  v9 = -[CNTask initWithName:](&v13, sel_initWithName_, CFSTR("com.apple.contacts.autocomplete.prediction-search.cd"));
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
  -[_CNAutocompleteCoreDuetPredictionSearchStrategyTask prepareQuery](self, "prepareQuery", a3);
  -[_CNAutocompleteCoreDuetPredictionSearchStrategyTask runQuery](self, "runQuery");
  -[_CNAutocompleteCoreDuetPredictionSearchStrategyTask convertResults](self, "convertResults");
  return self->_results;
}

- (void)prepareQuery
{
  _CDPeopleSuggesterContext *v3;
  _CDPeopleSuggesterContext *context;
  _CDPeopleSuggesterSettings *v5;
  _CDPeopleSuggesterSettings *settings;

  -[_CNAutocompleteCoreDuetPredictionSearchStrategyTask suggesterContextForFetchRequest:](self, "suggesterContextForFetchRequest:", self->_request);
  v3 = (_CDPeopleSuggesterContext *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  self->_context = v3;

  -[_CNAutocompleteCoreDuetPredictionSearchStrategyTask suggesterSettingsForFetchRequest:](self, "suggesterSettingsForFetchRequest:", self->_request);
  v5 = (_CDPeopleSuggesterSettings *)objc_claimAutoreleasedReturnValue();
  settings = self->_settings;
  self->_settings = v5;

}

- (id)suggesterContextForFetchRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D15910];
  v4 = a3;
  objc_msgSend(v3, "currentContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "configureContext:withFetchRequest:", v5, v4);

  return v5;
}

+ (void)configureContext:(id)a3 withFetchRequest:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "fetchContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "otherAddressesAlreadyChosen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSeedContactIdentifiers:", v10);

  objc_msgSend(v6, "fetchContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v12);

  objc_msgSend(v6, "fetchContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "locationUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLocationUUID:", v14);

  objc_msgSend(v6, "fetchContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDate:", v16);

  objc_msgSend(v6, "searchString");
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setContactPrefix:", v17);
}

- (id)suggesterSettingsForFetchRequest:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D15918];
  v4 = a3;
  objc_msgSend(v3, "defaultSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "configureSettings:withFetchRequest:", v5, v4);

  return v5;
}

+ (void)configureSettings:(id)a3 withFetchRequest:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;

  v33 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0D13848];
  objc_msgSend(v6, "fetchContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendingAddressAccountIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v9);

  if ((v10 & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "fetchContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendingAddressAccountIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setConstrainAccounts:", v14);

  }
  objc_msgSend(v6, "fetchContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "domainIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v16);

  if ((v17 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "fetchContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "domainIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithObject:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setConstrainDomainIdentifiers:", v21);

  }
  objc_msgSend(a1, "constrainMechanismsForSearchType:", objc_msgSend(v6, "searchType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setConstrainMechanisms:", v22);

  objc_msgSend(v6, "fetchContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setRequireOutgoingInteraction:", objc_msgSend(v23, "predictsBasedOnOutgoingInteraction"));

  objc_msgSend(v6, "searchString");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (*(uint64_t (**)(uint64_t, void *))(v7 + 16))(v7, v24);

  if (v25)
  {
    v26 = +[CNAutocompletePredictionSearch predictedResultLimit](CNAutocompletePredictionSearch, "predictedResultLimit");
    if (v26)
      objc_msgSend(v33, "setMaxNumberOfPeopleSuggested:", v26);
  }
  objc_msgSend(v6, "fetchContext");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bundleIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v6, "fetchContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bundleIdentifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setWithArray:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setConstrainBundleIds:", v32);

  }
  if (objc_msgSend(v6, "searchType") == 3)
    objc_msgSend(v33, "setUseFuture:", 1);

}

+ (id)constrainMechanismsForSearchType:(unint64_t)a3
{
  uint64_t v4;
  uint64_t v5;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E70EFEF8, 0, v4, v5);
      goto LABEL_7;
    case 1uLL:
    case 4uLL:
    case 5uLL:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E70EFF10, &unk_1E70EFF28, &unk_1E70EFF40, 0);
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E70EFF58, &unk_1E70EFF70, &unk_1E70EFF88, 0);
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E70EFEE0, 0, v4, v5);
LABEL_7:
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

- (void)runQuery
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _CDPeopleSuggesterContext *context;
  _CDPeopleSuggesterSettings *settings;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSArray *v15;
  NSArray *suggestions;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  CNALoggingContextTriage();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  CNALoggingContextPerformance();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Searching CoreDuet", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cdPeopleSuggester");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  context = self->_context;
  settings = self->_settings;
  v19 = 0;
  objc_msgSend(v8, "suggestPeopleWithContext:settings:error:", context, settings, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;

  CNALoggingContextPerformance();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B9950000, v14, OS_SIGNPOST_INTERVAL_END, v4, "Searching CoreDuet", ", buf, 2u);
  }

  if (v11)
  {
    v15 = v11;
    suggestions = self->_suggestions;
    self->_suggestions = v15;
  }
  else
  {
    CNALoggingContextTriage();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[CNAutocompleteFetchRequest triageIdentifier](self->_request, "triageIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v18;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_1B9950000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error searching CoreDuet: %{public}@", buf, 0x16u);

    }
    suggestions = self->_suggestions;
    self->_suggestions = (NSArray *)MEMORY[0x1E0C9AA60];
  }

}

- (void)convertResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSArray *suggestions;
  id v14;
  NSArray *v15;
  NSArray *results;
  id v17;
  _QWORD v18[4];
  id v19;
  _CNAutocompleteCoreDuetPredictionSearchStrategyTask *v20;
  id v21;

  -[CNAutocompleteFetchRequest priorityDomainForSorting](self->_request, "priorityDomainForSorting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendingAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAutocompleteResultFactory factoryWithPriorityDomain:sendingAddress:](CNAutocompleteResultFactory, "factoryWithPriorityDomain:sendingAddress:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[CNAutocompleteFetchRequest fetchContext](self->_request, "fetchContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "otherAddressesAlreadyChosen");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = MEMORY[0x1E0C9AA60];
  v12 = (void *)objc_msgSend(v7, "initWithArray:", v11);

  suggestions = self->_suggestions;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69___CNAutocompleteCoreDuetPredictionSearchStrategyTask_convertResults__block_invoke;
  v18[3] = &unk_1E70DFDA8;
  v19 = v12;
  v20 = self;
  v21 = v6;
  v14 = v6;
  v17 = v12;
  -[NSArray _cn_compactMap:](suggestions, "_cn_compactMap:", v18);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  results = self->_results;
  self->_results = v15;

}

- (id)resultValueForCDContact:(id)a3
{
  id v4;
  CNAutocompleteResultValue *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  v5 = objc_alloc_init(CNAutocompleteResultValue);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAutocompleteResultValue setAddress:](v5, "setAddress:", v6);

  v7 = -[_CNAutocompleteCoreDuetPredictionSearchStrategyTask addressTypeForCDContact:](self, "addressTypeForCDContact:", v4);
  -[CNAutocompleteResultValue setAddressType:](v5, "setAddressType:", v7);
  return v5;
}

- (int64_t)addressTypeForCDContact:(id)a3
{
  id v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "type");
  if ((unint64_t)(v4 - 1) >= 3)
  {
    v6 = v4;
    CNALoggingContextDebug();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v8;
      _os_log_impl(&dword_1B9950000, v7, OS_LOG_TYPE_DEFAULT, "Unrecognized identifier type from duet: %@", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0D13BE8], "standardPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userHasOptedInToPreference:", CFSTR("CNGuessDuetIdentifierEnabledInAutocomplete"));

    if (v10)
    {
      objc_msgSend(v3, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CNALoggingContextDebug();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138412290;
        v16 = v11;
        _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "No luck with the type, let's infer it from the handle (%@)", (uint8_t *)&v15, 0xCu);
      }

      v5 = objc_msgSend((id)objc_opt_class(), "_addressTypeFromHandle:", v11);
    }
    else
    {
      CNALoggingContextDebug();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1B9950000, v13, OS_LOG_TYPE_DEFAULT, "Returning none address type", (uint8_t *)&v15, 2u);
      }

      v5 = 0;
    }
  }
  else
  {
    v5 = qword_1B999B918[v4 - 1];
  }

  return v5;
}

+ (int64_t)_addressTypeFromHandle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  int v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D13A70];
  v16[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "classificationOfHandleStrings:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "phoneNumbers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 2;
  }
  else
  {
    objc_msgSend(v6, "emailAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v9 = 1;
    }
    else
    {
      CNALoggingContextDebug();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v3;
        _os_log_impl(&dword_1B9950000, v12, OS_LOG_TYPE_DEFAULT, "Unrecognized handle from duet: %@", (uint8_t *)&v14, 0xCu);
      }

      v9 = 0;
    }
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
