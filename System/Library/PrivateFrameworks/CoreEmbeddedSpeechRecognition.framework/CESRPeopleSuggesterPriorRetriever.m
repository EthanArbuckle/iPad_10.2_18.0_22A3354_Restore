@implementation CESRPeopleSuggesterPriorRetriever

- (CESRPeopleSuggesterPriorRetriever)init
{
  CESRPeopleSuggesterPriorRetriever *v2;
  _PSContactSuggester *v3;
  _PSContactSuggester *contactSuggester;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CESRPeopleSuggesterPriorRetriever;
  v2 = -[CESRPeopleSuggesterPriorRetriever init](&v6, sel_init);
  if (v2)
  {
    v3 = (_PSContactSuggester *)objc_alloc_init(MEMORY[0x1E0D70970]);
    contactSuggester = v2->_contactSuggester;
    v2->_contactSuggester = v3;

  }
  return v2;
}

- (id)priorInfoForItemIds:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v6 = v5;
      *(_DWORD *)buf = 136315394;
      v25 = "-[CESRPeopleSuggesterPriorRetriever priorInfoForItemIds:]";
      v26 = 2048;
      v27 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1B3E5F000, v6, OS_LOG_TYPE_INFO, "%s Fetching prior info for %lu contacts", buf, 0x16u);

    }
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CESRPeopleSuggesterPriorRetriever _fetchContactPriorsForContactIds:](self, "_fetchContactPriorsForContactIds:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v4;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[CESRPeopleSuggesterPriorRetriever _convertPeopleSuggesterPriorToPriorInfo:](self, "_convertPeopleSuggesterPriorToPriorInfo:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setValue:forKey:", v16, v14);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v4 = v18;
  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA70];
  }

  return v7;
}

- (id)allPriorInfoWithThreshold:(unsigned int)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
  -[CESRPeopleSuggesterPriorRetriever _fetchContactPriorsForContactIds:](self, "_fetchContactPriorsForContactIds:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    *(_DWORD *)buf = 136315650;
    v24 = "-[CESRPeopleSuggesterPriorRetriever allPriorInfoWithThreshold:]";
    v25 = 1024;
    v26 = objc_msgSend(v6, "count");
    v27 = 1024;
    v28 = a3;
    _os_log_impl(&dword_1B3E5F000, v8, OS_LOG_TYPE_INFO, "%s Filtering %u contact priors from PeopleSuggester with threshold: %u", buf, 0x18u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "allValues", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v14, "rank") <= a3)
        {
          -[CESRPeopleSuggesterPriorRetriever _convertPeopleSuggesterPriorToPriorInfo:](self, "_convertPeopleSuggesterPriorToPriorInfo:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v14, "contactIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v15, v16);

          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  return v5;
}

- (id)_convertPeopleSuggesterPriorToPriorInfo:(id)a3
{
  id v3;
  CESRPriorInfo *v4;
  double v5;
  CESRPriorInfo *v6;
  uint64_t v7;
  uint64_t v8;
  CESRPriorInfo *v9;

  v3 = a3;
  v4 = [CESRPriorInfo alloc];
  v6 = v4;
  if (v3)
  {
    v7 = objc_msgSend(v3, "rank");
    objc_msgSend(v3, "priorScore");
    v4 = v6;
    v8 = v7;
  }
  else
  {
    LODWORD(v5) = 0;
    v8 = 0;
  }
  v9 = -[CESRPriorInfo initWithOrdinality:score:](v4, "initWithOrdinality:score:", v8, v5);

  return v9;
}

- (id)_fetchContactPriorsForContactIds:(id)a3
{
  return (id)-[_PSContactSuggester contactPriorsForContactIdentifiers:](self->_contactSuggester, "contactPriorsForContactIdentifiers:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSuggester, 0);
}

@end
