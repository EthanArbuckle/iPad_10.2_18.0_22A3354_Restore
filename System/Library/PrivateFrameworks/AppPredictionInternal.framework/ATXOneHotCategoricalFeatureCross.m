@implementation ATXOneHotCategoricalFeatureCross

- (ATXOneHotCategoricalFeatureCross)initWithFeatures:(id)a3
{
  id v5;
  ATXOneHotCategoricalFeatureCross *v6;
  ATXOneHotCategoricalFeatureCross *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXOneHotCategoricalFeatureCross;
  v6 = -[ATXCandidateRelevanceModelMultiHotCategoricalFeaturizer init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_features, a3);

  return v7;
}

- (id)categoricalFeatureValueForContext:(id)a3 candidate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = self->_features;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "categoricalFeatureValueForContext:candidate:", v6, v7, (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  objc_msgSend(v8, "componentsJoinedByString:", CFSTR("_"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
}

@end
