@implementation EMSearchableIndexUserQuery

- (EMSearchableIndexUserQuery)initWithExpression:(id)a3 builder:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  EMSearchableIndexUserQuery *v17;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __57__EMSearchableIndexUserQuery_initWithExpression_builder___block_invoke;
  v20[3] = &unk_1E70F5B00;
  v8 = v6;
  v21 = v8;
  v9 = (void *)MEMORY[0x1BCCC8C10](v20);
  objc_msgSend(v8, "updatedSuggestion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA6B70], "emptySuggestion");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0CA6B98], "userQueryContextWithCurrentSuggestion:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSearchableIndexQuery log](EMSearchableIndexQuery, "log");
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ef_publicDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v23 = v16;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_1B99BB000, v15, OS_LOG_TYPE_DEFAULT, "Setting user query with expression: %@ context: %@", buf, 0x16u);

  }
  v19.receiver = self;
  v19.super_class = (Class)EMSearchableIndexUserQuery;
  v17 = -[EMSearchableIndexQuery initWithExpression:builder:queryContext:querySetup:](&v19, sel_initWithExpression_builder_queryContext_querySetup_, v8, v7, v14, v9);

  return v17;
}

id __57__EMSearchableIndexUserQuery_initWithExpression_builder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "searchString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = &stru_1E70F6E90;
  objc_msgSend(v3, "setUserQuery:", v6);

  objc_msgSend(v3, "setLowPriority:", 0);
  objc_msgSend(*(id *)(a1 + 32), "queryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilterQueries:", v8);

  v9 = objc_alloc(MEMORY[0x1E0CA6B90]);
  objc_msgSend(*(id *)(a1 + 32), "searchString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithUserQueryString:queryContext:", v10, v3);

  return v11;
}

@end
