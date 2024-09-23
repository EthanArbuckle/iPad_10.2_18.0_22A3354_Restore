@implementation FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider

- (FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider)initWithReadonlyPersonalizationAggregateStore:(id)a3 personalizationTreatment:(id)a4
{
  id v7;
  id v8;
  FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider *v9;
  FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider;
  v9 = -[FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_aggregateStore, a3);
    objc_storeStrong((id *)&v10->_personalizationTreatment, a4);
  }

  return v10;
}

- (id)aggregateVectorForTags:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  FCTagIDFeature *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  double v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v10);
        v12 = -[FCTagIDFeature initWithTagID:]([FCTagIDFeature alloc], "initWithTagID:", v11);
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v8);
  }

  -[FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider aggregateStore](self, "aggregateStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider personalizationTreatment](self, "personalizationTreatment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "baselineAggregateWithConfigurableValues:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider aggregateStore](self, "aggregateStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "aggregatesForFeatures:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider personalizationTreatment](self, "personalizationTreatment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "defaultScoringConfig");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "decayFactor");
  v22 = v21;

  objc_msgSend(v15, "personalizationValueWithBaseline:decayRate:", 0, v22);
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __104__FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider_aggregateVectorForTags___block_invoke;
  v29[3] = &unk_1E4643C48;
  v30 = v18;
  v31 = v5;
  v32 = v15;
  v33 = v22;
  v34 = v23;
  v24 = v15;
  v25 = v5;
  v26 = v18;
  objc_msgSend(v6, "fc_arrayByTransformingWithBlock:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

id __104__FCReadonlyPersonalizationAggregateStoreBasedUserVectorAggregateVectorProvider_aggregateVectorForTags___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_safeObjectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "personalizationValueWithBaseline:decayRate:", *(_QWORD *)(a1 + 48), *(double *)(a1 + 56));
    objc_msgSend(v6, "numberWithDouble:", v7 - *(double *)(a1 + 64));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &unk_1E470D580;
  }

  return v8;
}

- (FCPersonalizationTreatment)personalizationTreatment
{
  return self->_personalizationTreatment;
}

- (void)setPersonalizationTreatment:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationTreatment, a3);
}

- (FCReadonlyPersonalizationAggregateStore)aggregateStore
{
  return self->_aggregateStore;
}

- (void)setAggregateStore:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateStore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateStore, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);
}

@end
