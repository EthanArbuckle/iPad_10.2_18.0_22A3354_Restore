@implementation CRKFeatureDataStoreHeuristics_MCX

- (CRKFeatureDataStoreHeuristics_MCX)initWithDataStore:(id)a3
{
  id v4;
  CRKFeatureDataStoreHeuristics_MCX *v5;
  CRKFeatureDataStoreHeuristics_MCX *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CRKFeatureDataStoreHeuristics_MCX;
  v5 = -[CRKFeatureDataStoreHeuristics_MCX init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataStore, v4);

  return v6;
}

- (BOOL)applyIsForcedHeuristicsToFeature:(id)a3 isForced:(BOOL)a4
{
  id v6;
  BOOL v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
  {
    v7 = 1;
  }
  else
  {
    -[CRKFeatureDataStoreHeuristics_MCX dataStore](self, "dataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0
      && (objc_msgSend((id)objc_opt_class(), "overrideIsForcedByFeature"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "allKeys"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          v12 = objc_msgSend(v11, "containsObject:", v6),
          v11,
          v10,
          v12))
    {
      objc_msgSend((id)objc_opt_class(), "overrideIsForcedByFeature");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", v6);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v24 != v18)
              objc_enumerationMutation(v15);
            v20 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            -[CRKFeatureDataStoreHeuristics_MCX dataStore](self, "dataStore", (_QWORD)v23);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v20) = objc_msgSend(v21, "isFeatureForced:", v20);

            if ((v20 & 1) != 0)
            {
              v7 = 1;
              goto LABEL_16;
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v17)
            continue;
          break;
        }
      }
      v7 = 0;
LABEL_16:

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)applyHeuristicsToFeature:(id)a3 BOOLType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "overrideFeaturesByFeature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v6);

  if (v9)
  {
    objc_msgSend((id)objc_opt_class(), "overrideFeaturesByFeature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          -[CRKFeatureDataStoreHeuristics_MCX dataStore](self, "dataStore", (_QWORD)v21);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "BOOLRestrictionForFeature:", v17);

          if (v19 == 2)
          {
            a4 = 2;
            goto LABEL_12;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return a4;
}

+ (id)overrideIsForcedByFeature
{
  if (overrideIsForcedByFeature_onceToken != -1)
    dispatch_once(&overrideIsForcedByFeature_onceToken, &__block_literal_global_24);
  return (id)overrideIsForcedByFeature_overrideIsForcedByFeature;
}

+ (id)overrideFeaturesByFeature
{
  if (overrideFeaturesByFeature_onceToken != -1)
    dispatch_once(&overrideFeaturesByFeature_onceToken, &__block_literal_global_5_0);
  return (id)overrideFeaturesByFeature_overrideFeaturesByFeature;
}

- (CRKFeatureDataStoreProtocol)dataStore
{
  return (CRKFeatureDataStoreProtocol *)objc_loadWeakRetained((id *)&self->_dataStore);
}

- (void)setDataStore:(id)a3
{
  objc_storeWeak((id *)&self->_dataStore, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataStore);
}

@end
