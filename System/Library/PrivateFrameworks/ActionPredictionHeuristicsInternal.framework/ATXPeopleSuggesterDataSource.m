@implementation ATXPeopleSuggesterDataSource

- (ATXPeopleSuggesterDataSource)initWithDevice:(id)a3
{
  id v5;
  ATXPeopleSuggesterDataSource *v6;
  ATXPeopleSuggesterDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXPeopleSuggesterDataSource;
  v6 = -[ATXPeopleSuggesterDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (void)peopleSuggestionsWithCallback:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  if ((ATXHeuristicCanLearnFromApp(&unk_1E82D5578) & 1) != 0)
  {
    v4 = (void *)MEMORY[0x1CAA46CBC]();
    objc_msgSend(MEMORY[0x1E0D15908], "peopleSuggester");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__ATXPeopleSuggesterDataSource_peopleSuggestionsWithCallback___block_invoke;
    v6[3] = &unk_1E82C5660;
    v7 = v3;
    objc_msgSend(v5, "suggestPeopleWithCompletionHandler:", v6);

    objc_autoreleasePoolPop(v4);
  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v3 + 2))(v3, MEMORY[0x1E0C9AA60], 0);
  }

}

void __62__ATXPeopleSuggesterDataSource_peopleSuggestionsWithCallback___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v28 = a1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v29 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v31;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v31 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v11), "contact");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "type"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "dictionaryWithObject:forKey:", v14, CFSTR("type"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "length");

          if (v17)
          {
            objc_msgSend(v12, "identifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("identifier"));

          }
          objc_msgSend(v12, "handle");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "length");

          if (v20)
          {
            objc_msgSend(v12, "handle");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v21, CFSTR("handle"));

          }
          objc_msgSend(v12, "personId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "length");

          if (v23)
          {
            objc_msgSend(v12, "personId");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("personID"));

          }
          objc_msgSend(v12, "displayName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "length");

          if (v26)
          {
            objc_msgSend(v12, "displayName");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setObject:forKeyedSubscript:", v27, CFSTR("displayName"));

          }
          objc_msgSend(v6, "addObject:", v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(v28 + 32) + 16))();
    v5 = v29;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_device, 0);
}

@end
