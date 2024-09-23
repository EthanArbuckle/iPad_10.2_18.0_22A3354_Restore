@implementation CESRMegadomeContactPriorRetriever

- (CESRMegadomeContactPriorRetriever)init
{
  CESRMegadomeContactPriorRetriever *v2;
  GDPersonRankingServiceConfiguration *v3;
  GDPersonRankingServiceConfiguration *rankerConfig;
  uint64_t v5;
  GDPersonRankingService *ranker;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CESRMegadomeContactPriorRetriever;
  v2 = -[CESRMegadomeContactPriorRetriever init](&v8, sel_init);
  if (v2)
  {
    v3 = (GDPersonRankingServiceConfiguration *)objc_alloc_init(MEMORY[0x1E0D3DFE8]);
    rankerConfig = v2->_rankerConfig;
    v2->_rankerConfig = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D3DFE0]), "initWithConfig:", v2->_rankerConfig);
    ranker = v2->_ranker;
    v2->_ranker = (GDPersonRankingService *)v5;

  }
  return v2;
}

- (id)priorInfoForItemIds:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  CESRPriorInfo *v17;
  double v18;
  CESRPriorInfo *v19;
  void *v20;
  NSObject *v21;
  int v22;
  int v23;
  int v24;
  void *v25;
  id v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v36 = 0;
    -[CESRMegadomeContactPriorRetriever _fetchTopNContactPriors:error:](self, "_fetchTopNContactPriors:error:", 0x7FFFFFFFFFFFFFFFLL, &v36);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v36;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __57__CESRMegadomeContactPriorRetriever_priorInfoForItemIds___block_invoke;
    v33[3] = &unk_1E6734588;
    v8 = v5;
    v34 = v8;
    v9 = v6;
    v35 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v33);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            v17 = [CESRPriorInfo alloc];
            LODWORD(v18) = 0;
            v19 = -[CESRPriorInfo initWithOrdinality:score:](v17, "initWithOrdinality:score:", 0, v18);
            objc_msgSend(v9, "setValue:forKey:", v19, v15);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v45, 16);
      }
      while (v12);
    }

    v20 = (void *)*MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      v22 = objc_msgSend(v7, "count");
      v23 = objc_msgSend(v9, "count");
      v24 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 136315906;
      v38 = "-[CESRMegadomeContactPriorRetriever priorInfoForItemIds:]";
      v39 = 1024;
      v40 = v22;
      v41 = 1024;
      v42 = v23;
      v43 = 1024;
      v44 = v24;
      _os_log_impl(&dword_1B3E5F000, v21, OS_LOG_TYPE_INFO, "%s Fetched %u persons from Megadome Ranker, populated %u contact priors for %u requested contacts", buf, 0x1Eu);

    }
    v25 = v35;
    v26 = v9;

  }
  else
  {
    v26 = (id)MEMORY[0x1E0C9AA70];
  }

  return v26;
}

- (id)allPriorInfoWithThreshold:(unsigned int)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  int v11;
  int v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  unsigned int v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  unsigned int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", a3);
  v19 = 0;
  -[CESRMegadomeContactPriorRetriever _fetchTopNContactPriors:error:](self, "_fetchTopNContactPriors:error:", a3, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __63__CESRMegadomeContactPriorRetriever_allPriorInfoWithThreshold___block_invoke;
  v16[3] = &unk_1E67345B0;
  v8 = v5;
  v17 = v8;
  v18 = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);
  v9 = (void *)*MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v10 = v9;
    v11 = objc_msgSend(v6, "count");
    v12 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 136315906;
    v21 = "-[CESRMegadomeContactPriorRetriever allPriorInfoWithThreshold:]";
    v22 = 1024;
    v23 = v11;
    v24 = 1024;
    v25 = v12;
    v26 = 1024;
    v27 = a3;
    _os_log_impl(&dword_1B3E5F000, v10, OS_LOG_TYPE_INFO, "%s Fetched %u persons from Megadome Ranker, populated %u contact priors with threshold: %u", buf, 0x1Eu);

  }
  v13 = v17;
  v14 = v8;

  return v14;
}

- (id)_fetchTopNContactPriors:(int64_t)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  id v6;

  -[GDPersonRankingService rankedPersonsWithMaxCount:error:](self->_ranker, "rankedPersonsWithMaxCount:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = (id)MEMORY[0x1E0C9AA60];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ranker, 0);
  objc_storeStrong((id *)&self->_rankerConfig, 0);
}

void __63__CESRMegadomeContactPriorRetriever_allPriorInfoWithThreshold___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  CESRPriorInfo *v6;
  double v7;
  CESRPriorInfo *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = [CESRPriorInfo alloc];
  LODWORD(v7) = 0;
  v8 = -[CESRPriorInfo initWithOrdinality:score:](v6, "initWithOrdinality:score:", (a3 + 1), v7);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "contactIdentifiers", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if (objc_msgSend(*(id *)(a1 + 32), "count") < (unint64_t)*(unsigned int *)(a1 + 40))
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v14);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

void __57__CESRMegadomeContactPriorRetriever_priorInfoForItemIds___block_invoke(uint64_t a1, void *a2, int a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  CESRPriorInfo *v12;
  double v13;
  CESRPriorInfo *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a2, "contactIdentifiers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v9 = (a3 + 1);
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11))
        {
          v12 = [CESRPriorInfo alloc];
          LODWORD(v13) = 0;
          v14 = -[CESRPriorInfo initWithOrdinality:score:](v12, "initWithOrdinality:score:", v9, v13);
          objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v14, v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

}

@end
