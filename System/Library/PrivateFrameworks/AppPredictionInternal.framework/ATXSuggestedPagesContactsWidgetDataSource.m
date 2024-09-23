@implementation ATXSuggestedPagesContactsWidgetDataSource

- (ATXSuggestedPagesContactsWidgetDataSource)init
{
  ATXSuggestedPagesContactsWidgetDataSource *v2;
  uint64_t v3;
  ATXSuggestedPagesTunableConstants *suggestedPagesTunableConstants;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXSuggestedPagesContactsWidgetDataSource;
  v2 = -[ATXSuggestedPagesContactsWidgetDataSource init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    suggestedPagesTunableConstants = v2->_suggestedPagesTunableConstants;
    v2->_suggestedPagesTunableConstants = (ATXSuggestedPagesTunableConstants *)v3;

  }
  return v2;
}

- (id)provideWidgetsForPageType:(int64_t)a3 environment:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  int64_t v28;

  v6 = a4;
  if ((unint64_t)(a3 - 3) < 9 && ((0x143u >> (a3 - 3)) & 1) != 0
    || (v7 = +[ATXSuggestedPagesUtils modeForSuggestedPageType:](ATXSuggestedPagesUtils, "modeForSuggestedPageType:", a3), v7 == 16))
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    +[ATXSuggestedPagesUtils semanticTypeForSuggestedPageType:](ATXSuggestedPagesUtils, "semanticTypeForSuggestedPageType:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10 && objc_msgSend(v10, "integerValue") != 8)
    {
      objc_msgSend(MEMORY[0x1E0CF8D60], "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "iOSContactAllowListForMode:", objc_msgSend(v11, "integerValue"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
    +[ATXModeEntityScorerServer sharedInstance](ATXModeEntityScorerServer, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rankedContactsForMode:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_opt_new();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __83__ATXSuggestedPagesContactsWidgetDataSource_provideWidgetsForPageType_environment___block_invoke;
    v25[3] = &unk_1E82E62A8;
    v25[4] = self;
    v28 = a3;
    v17 = v12;
    v26 = v17;
    v18 = v16;
    v27 = v18;
    objc_msgSend(v15, "_pas_mappedArrayWithTransform:", v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v24 = v11;
      v8 = (void *)objc_opt_new();
      -[ATXSuggestedPagesContactsWidgetDataSource _createSmallContactsWidgetForPeople:](self, "_createSmallContactsWidgetForPeople:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
        objc_msgSend(v8, "addObject:", v20);
      v21 = objc_msgSend(v19, "count");
      if (v21 >= -[ATXSuggestedPagesTunableConstants numberOfContactsForMediumWidget](self->_suggestedPagesTunableConstants, "numberOfContactsForMediumWidget"))
      {
        -[ATXSuggestedPagesContactsWidgetDataSource _createMediumContactsWidgetForPeople:entities:](self, "_createMediumContactsWidgetForPeople:entities:", v19, v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
          objc_msgSend(v8, "addObject:", v22);

      }
      v11 = v24;
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

id __83__ATXSuggestedPagesContactsWidgetDataSource_provideWidgetsForPageType_environment___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    goto LABEL_4;
  objc_msgSend(v3, "cnContactId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (!v7)
    goto LABEL_4;
  objc_msgSend(v3, "scoreMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "score");
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "minScoreForModeAffinityContactsWidgetSuggestions");
  v12 = v11;

  if (v10 >= v12)
  {
    if (*(_QWORD *)(a1 + 56) == 8
      || (v15 = *(void **)(a1 + 40),
          objc_msgSend(v3, "cnContactId"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(v15) = objc_msgSend(v15, "containsObject:", v16),
          v16,
          (v15 & 1) != 0))
    {
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v3);
      objc_msgSend(v3, "displayName", CFSTR("displayName"));
      v17 = objc_claimAutoreleasedReturnValue();
      v20[1] = CFSTR("identifier");
      v21[0] = v17;
      objc_msgSend(v3, "cnContactId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      __atxlog_handle_modes();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "cnContactId");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v19;
        _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Skipping contact not on allow list: %@", buf, 0xCu);

      }
      v13 = 0;
    }

  }
  else
  {
LABEL_4:
    v13 = 0;
  }

  return v13;
}

- (id)_createMediumContactsWidgetForPeople:(id)a3 entities:(id)a4
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = objc_msgSend(v8, "count");
  if (v9 < -[ATXSuggestedPagesTunableConstants numberOfContactsForMediumWidget](self->_suggestedPagesTunableConstants, "numberOfContactsForMediumWidget"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesContactsWidgetDataSource.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("people.count >= _suggestedPagesTunableConstants.numberOfContactsForMediumWidget"));

  }
  v10 = objc_msgSend(v7, "count");
  if (v10 < -[ATXSuggestedPagesTunableConstants numberOfContactsForMediumWidget](self->_suggestedPagesTunableConstants, "numberOfContactsForMediumWidget"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesContactsWidgetDataSource.m"), 100, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entities.count >= _suggestedPagesTunableConstants.numberOfContactsForMediumWidget"));

  }
  objc_msgSend(v8, "subarrayWithRange:", 0, -[ATXSuggestedPagesTunableConstants numberOfContactsForMediumWidget](self->_suggestedPagesTunableConstants, "numberOfContactsForMediumWidget"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D81140]);
  v28 = CFSTR("people");
  v29[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithTypeName:parameters:", CFSTR("com.apple.PeopleViewService.SelectPerson-iOS.SelectPeopleIntent"), v13);

  objc_msgSend(v14, "createIntent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CF8EB0]);
    objc_msgSend(v16, "setIntent:", v15);
    objc_msgSend(v16, "setSize:", 1);
    objc_msgSend(v16, "setWidgetKind:", CFSTR("MultipleContactWidget_iOS"));
    objc_msgSend(v16, "setExtensionBundleId:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"));
    objc_msgSend(v16, "setAppBundleId:", CFSTR("com.apple.PeopleViewService"));
    objc_msgSend(v16, "setScore:", 0.5);
    objc_msgSend(v16, "setPredictionSource:", CFSTR("Contacts Heuristic"));
    objc_msgSend(v16, "setRequiresAppLaunch:", 0);
  }
  else
  {
    __atxlog_handle_modes();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      -[ATXSuggestedPagesContactsWidgetDataSource _createMediumContactsWidgetForPeople:entities:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    v16 = 0;
  }

  return v16;
}

- (id)_createSmallContactsWidgetForPeople:(id)a3
{
  id v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 < -[ATXSuggestedPagesTunableConstants numberOfContactsForSmallWidget](self->_suggestedPagesTunableConstants, "numberOfContactsForSmallWidget"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXSuggestedPagesContactsWidgetDataSource.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("people.count >= _suggestedPagesTunableConstants.numberOfContactsForSmallWidget"));

  }
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CBD738]);
  v22 = CFSTR("person");
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithAppBundleIdentifier:appIntentIdentifier:serializedParameters:", CFSTR("com.apple.PeopleViewService"), CFSTR("SelectPersonIntent"), v9);

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CF8EB0]);
    objc_msgSend(v11, "setIntent:", v10);
    objc_msgSend(v11, "setSize:", 0);
    objc_msgSend(v11, "setWidgetKind:", CFSTR("SingleContactWidget_iOS"));
    objc_msgSend(v11, "setExtensionBundleId:", CFSTR("com.apple.PeopleViewService.PeopleWidget-iOS"));
    objc_msgSend(v11, "setAppBundleId:", CFSTR("com.apple.PeopleViewService"));
    objc_msgSend(v11, "setScore:", 0.5);
    objc_msgSend(v11, "setPredictionSource:", CFSTR("Contacts Heuristic"));
  }
  else
  {
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[ATXSuggestedPagesContactsWidgetDataSource _createMediumContactsWidgetForPeople:entities:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedPagesTunableConstants, 0);
}

- (void)_createMediumContactsWidgetForPeople:(uint64_t)a3 entities:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, a1, a3, "ATXSuggestedPagesContactsWidgetDataSource: could not make intent", a5, a6, a7, a8, 0);
}

@end
