@implementation SGMISubmodelsAccumulator

- (SGMISubmodelsAccumulator)init
{
  SGMISubmodelsAccumulator *v2;
  SGMISubmodelsAccumulator *v3;
  NSDictionary *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *submodels;
  SGMISubmodelsAccumulator *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)SGMISubmodelsAccumulator;
  v2 = -[SGMISubmodelsAccumulator init](&v20, sel_init);
  v3 = v2;
  if (v2)
  {
    v15 = v2;
    v4 = (NSDictionary *)objc_opt_new();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    +[SGMIFeature submodeledFeatures](SGMIFeature, "submodeledFeatures");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v9);
          v11 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "submodeledFeature"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v7);
    }

    v3 = v15;
    submodels = v15->_submodels;
    v15->_submodels = v4;

  }
  return v3;
}

- (void)ingest:(id)a3 asSalient:(BOOL)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *submodels;
  void *v16;
  void *v17;
  id obj;
  _BOOL4 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v19 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  +[SGMIFeature submodeledFeatures](SGMIFeature, "submodeledFeatures");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v5, "feature:", objc_msgSend(v10, "unigramFeature"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringArrayRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v5, "feature:", objc_msgSend(v10, "bigramFeature"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringArrayRepresentation");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        submodels = self->_submodels;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "submodeledFeature"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](submodels, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "ingestUnigramTokens:bigramTokens:asSalient:", v12, v14, v19);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

}

- (void)commitToStore:(id)a3 updateDate:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSDictionary *submodels;
  void *v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[SGMIFeature submodeledFeatures](SGMIFeature, "submodeledFeatures");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        submodels = self->_submodels;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "submodeledFeature"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](submodels, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "commitNaiveBayesModel:probabilityFeatureName:updateDate:", v15, objc_msgSend(v12, "submodeledFeature"), v7);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

}

- (NSDictionary)submodels
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_submodels, 0);
}

@end
