@implementation FCReadonlyPersonalizationAggregateStore

- (unint64_t)scoringType
{
  return self->_scoringType;
}

- (void)prepareAggregatesForUseWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  _QWORD v6[5];

  v4 = (void (**)(_QWORD))a3;
  -[FCReadonlyPersonalizationAggregateStore prepareOnce](self, "prepareOnce");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88__FCReadonlyPersonalizationAggregateStore_prepareAggregatesForUseWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E463AB18;
  v6[4] = self;
  objc_msgSend(v5, "executeOnce:", v6);

  v4[2](v4);
}

- (FCOnce)prepareOnce
{
  return self->_prepareOnce;
}

void __88__FCReadonlyPersonalizationAggregateStore_prepareAggregatesForUseWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "generator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "generateDerivedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)FCReadonlyPersonalizationAggregateStoreLog;
  if (os_log_type_enabled((os_log_t)FCReadonlyPersonalizationAggregateStoreLog, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    NSStringFromFCScoringType(objc_msgSend(v3, "scoringType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_DEFAULT, "Generated personalization data with scoring type %{public}@", (uint8_t *)&v7, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "setDerivedPersonalizationData:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setScoringType:", objc_msgSend(v3, "scoringType"));
  objc_msgSend(v3, "decayRate");
  objc_msgSend(*(id *)(a1 + 32), "setDecayRate:");

}

- (FCReadonlyPersonalizationAggregateStore)initWithGenerator:(id)a3
{
  id v5;
  FCReadonlyPersonalizationAggregateStore *v6;
  FCReadonlyPersonalizationAggregateStore *v7;
  FCDerivedPersonalizationData *v8;
  uint64_t v9;
  FCDerivedPersonalizationData *derivedPersonalizationData;
  FCOnce *v11;
  FCOnce *prepareOnce;
  uint64_t v13;
  NSMutableDictionary *overrideAggregatesByFeatureKey;
  void *v16;
  objc_super v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "generator");
    *(_DWORD *)buf = 136315906;
    v19 = "-[FCReadonlyPersonalizationAggregateStore initWithGenerator:]";
    v20 = 2080;
    v21 = "FCPersonalizationAggregate.m";
    v22 = 1024;
    v23 = 121;
    v24 = 2114;
    v25 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v17.receiver = self;
  v17.super_class = (Class)FCReadonlyPersonalizationAggregateStore;
  v6 = -[FCReadonlyPersonalizationAggregateStore init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_generator, a3);
    v8 = [FCDerivedPersonalizationData alloc];
    v9 = -[FCDerivedPersonalizationData initWithAggregates:scoringType:decayRate:](v8, "initWithAggregates:scoringType:decayRate:", MEMORY[0x1E0C9AA70], 0, 0.0);
    derivedPersonalizationData = v7->_derivedPersonalizationData;
    v7->_derivedPersonalizationData = (FCDerivedPersonalizationData *)v9;

    v11 = -[FCOnce initWithOptions:]([FCOnce alloc], "initWithOptions:", 1);
    prepareOnce = v7->_prepareOnce;
    v7->_prepareOnce = v11;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    overrideAggregatesByFeatureKey = v7->_overrideAggregatesByFeatureKey;
    v7->_overrideAggregatesByFeatureKey = (NSMutableDictionary *)v13;

  }
  return v7;
}

- (void)setScoringType:(unint64_t)a3
{
  self->_scoringType = a3;
}

- (void)setDerivedPersonalizationData:(id)a3
{
  objc_storeStrong((id *)&self->_derivedPersonalizationData, a3);
}

- (void)setDecayRate:(double)a3
{
  self->_decayRate = a3;
}

- (FCPersonalizationDataGeneratorType)generator
{
  return self->_generator;
}

- (double)decayRate
{
  return self->_decayRate;
}

- (id)aggregateForFeatureKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v4 = a3;
  -[FCReadonlyPersonalizationAggregateStore overrideAggregatesByFeatureKey](self, "overrideAggregatesByFeatureKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[FCReadonlyPersonalizationAggregateStore derivedPersonalizationData](self, "derivedPersonalizationData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aggregateForFeatureKey:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSDictionary)allAggregates
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FCReadonlyPersonalizationAggregateStore overrideAggregatesByFeatureKey](self, "overrideAggregatesByFeatureKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[FCReadonlyPersonalizationAggregateStore derivedPersonalizationData](self, "derivedPersonalizationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allAggregates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");

    -[FCReadonlyPersonalizationAggregateStore overrideAggregatesByFeatureKey](self, "overrideAggregatesByFeatureKey");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v5);
    v7 = v8;
  }

  return (NSDictionary *)v7;
}

- (NSMutableDictionary)overrideAggregatesByFeatureKey
{
  return self->_overrideAggregatesByFeatureKey;
}

- (FCDerivedPersonalizationData)derivedPersonalizationData
{
  return self->_derivedPersonalizationData;
}

- (FCReadonlyPersonalizationAggregateStore)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCReadonlyPersonalizationAggregateStore init]";
    v9 = 2080;
    v10 = "FCPersonalizationAggregate.m";
    v11 = 1024;
    v12 = 116;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCReadonlyPersonalizationAggregateStore init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (void)modifyLocalAggregatesForFeatureKeys:(id)a3 withAction:(unint64_t)a4 actionCount:(unint64_t)a5 defaultClicks:(double)a6 defaultImpressions:(double)a7 impressionBias:(double)a8 configurableValues:(id)a9
{
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a9;
  v18 = objc_alloc_init(MEMORY[0x1E0D62768]);
  objc_msgSend(v18, "setDefaultClicks:", a6);
  objc_msgSend(v18, "setDefaultImpressions:", a7);
  objc_msgSend(v18, "setImpressionBias:", a8);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTimestamp:", objc_msgSend(v19, "fc_millisecondTimeIntervalSince1970"));

  objc_msgSend(v18, "addAction:count:", a4, a5);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v16;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(obj);
        v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v23);
        -[FCReadonlyPersonalizationAggregateStore overrideAggregatesByFeatureKey](self, "overrideAggregatesByFeatureKey");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v24);
        v26 = (id)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          v26 = objc_alloc_init(MEMORY[0x1E0D62760]);
          objc_msgSend(v26, "setFeatureKey:", v24);
          -[FCReadonlyPersonalizationAggregateStore derivedPersonalizationData](self, "derivedPersonalizationData");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "aggregateForFeatureKey:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
          {
            objc_msgSend(v28, "clicks");
            objc_msgSend(v26, "setClicks:");
            objc_msgSend(v28, "impressions");
            objc_msgSend(v26, "setImpressions:");
            objc_msgSend(v28, "lastModified");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setTimestamp:", objc_msgSend(v29, "fc_millisecondTimeIntervalSince1970"));

            objc_msgSend(v26, "setEventCount:", objc_msgSend(v28, "eventCount"));
          }
          -[FCReadonlyPersonalizationAggregateStore overrideAggregatesByFeatureKey](self, "overrideAggregatesByFeatureKey");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setObject:forKeyedSubscript:", v26, v24);

        }
        objc_msgSend(v18, "applyToAggregate:withTreatment:", v26, v17);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

}

- (void)updateFeatures:(id)a3 withAction:(unint64_t)a4 displayRank:(int64_t)a5 groupRank:(int64_t)a6 individually:(BOOL)a7 configurableValues:(id)a8
{
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  uint64_t v29;
  double v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  int64_t v36;
  int64_t v37;
  _BOOL4 v38;
  id v40;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  char *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v38 = a7;
  v36 = a5;
  v37 = a6;
  v56 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v40 = a8;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = MEMORY[0x1E0C81028];
    v16 = *(_QWORD *)v43;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v43 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v17);
        objc_msgSend(v18, "personalizationIdentifier", v36, v37);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          objc_msgSend(v10, "addObject:", v18);
          objc_msgSend(v18, "personalizationIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v20);
LABEL_8:

          goto LABEL_10;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Found a personalization feature without a personalization identifier"));
          *(_DWORD *)buf = 136315906;
          v48 = "-[FCReadonlyPersonalizationAggregateStore updateFeatures:withAction:displayRank:groupRank:individually:c"
                "onfigurableValues:]";
          v49 = 2080;
          v50 = "FCPersonalizationAggregate.m";
          v51 = 1024;
          v52 = 192;
          v53 = 2114;
          v54 = v20;
          _os_log_error_impl(&dword_1A1B90000, v15, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
          goto LABEL_8;
        }
LABEL_10:
        ++v17;
      }
      while (v14 != v17);
      v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      v14 = v21;
    }
    while (v21);
  }

  -[FCReadonlyPersonalizationAggregateStore baselineAggregateWithConfigurableValues:](self, "baselineAggregateWithConfigurableValues:", v40);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = FCPersonalizationAggregateImpressionBiasForAction(a4, v36, v37, v40);
  objc_msgSend(v40, "featureImpressionPrior");
  v25 = v24;
  objc_msgSend(v40, "defaultScoringConfig");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "decayFactor");
  objc_msgSend(v22, "personalizationValueWithBaseline:decayRate:", 0);
  v28 = v25 * v27;
  objc_msgSend(v40, "featureImpressionPrior");
  v29 = 1;
  -[FCReadonlyPersonalizationAggregateStore modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpressions:impressionBias:configurableValues:](self, "modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpressions:impressionBias:configurableValues:", v11, a4, 1, v40, v28, v30, v23);

  objc_msgSend(v22, "featureKey");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    v29 = objc_msgSend(v11, "count");
  objc_msgSend(v22, "clicks", v36, v37);
  v34 = v33;
  objc_msgSend(v22, "impressions");
  -[FCReadonlyPersonalizationAggregateStore modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpressions:impressionBias:configurableValues:](self, "modifyLocalAggregatesForFeatureKeys:withAction:actionCount:defaultClicks:defaultImpressions:impressionBias:configurableValues:", v32, a4, v29, v40, v34, v35, v23);

}

- (id)baselineAggregateWithConfigurableValues:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  FCPersonalizationAggregateBaselineAggregateWithConfigurableValues(self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCReadonlyPersonalizationAggregateStore overrideAggregatesByFeatureKey](self, "overrideAggregatesByFeatureKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "featureKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v4;
  v9 = v7;

  return v9;
}

- (id)aggregatesForFeatureKeys:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0C99E08];
  v5 = a3;
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCReadonlyPersonalizationAggregateStore overrideAggregatesByFeatureKey](self, "overrideAggregatesByFeatureKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fc_subdictionaryForKeys:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEntriesFromDictionary:", v8);

  -[FCReadonlyPersonalizationAggregateStore derivedPersonalizationData](self, "derivedPersonalizationData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "aggregatesForFeatureKeys:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addEntriesFromDictionary:", v10);
  return v6;
}

- (id)aggregatesForFeatures:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  FCReadonlyPersonalizationAggregateStore *v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99D80];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__FCReadonlyPersonalizationAggregateStore_aggregatesForFeatures___block_invoke;
  v9[3] = &unk_1E463B8D0;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "fc_dictionary:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __65__FCReadonlyPersonalizationAggregateStore_aggregatesForFeatures___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__FCReadonlyPersonalizationAggregateStore_aggregatesForFeatures___block_invoke_2;
  v6[3] = &unk_1E464AB00;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

void __65__FCReadonlyPersonalizationAggregateStore_aggregatesForFeatures___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "personalizationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "aggregateForFeatureKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v5);

}

- (void)enumerateAggregatesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[FCReadonlyPersonalizationAggregateStore derivedPersonalizationData](self, "derivedPersonalizationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allAggregates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v6, "mutableCopy");

  -[FCReadonlyPersonalizationAggregateStore overrideAggregatesByFeatureKey](self, "overrideAggregatesByFeatureKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEntriesFromDictionary:", v7);

  objc_msgSend(v10, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__FCReadonlyPersonalizationAggregateStore_enumerateAggregatesUsingBlock___block_invoke;
  v11[3] = &unk_1E464A420;
  v12 = v4;
  v9 = v4;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __73__FCReadonlyPersonalizationAggregateStore_enumerateAggregatesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)processTodayPersonalizationUpdates:(id)a3 withConfigurableValues:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  v8 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled((os_log_t)FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEBUG, "Processing past events for accurate News Today Widget personalization", buf, 2u);
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __101__FCReadonlyPersonalizationAggregateStore_processTodayPersonalizationUpdates_withConfigurableValues___block_invoke;
  v10[3] = &unk_1E464AB50;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

}

void __101__FCReadonlyPersonalizationAggregateStore_processTodayPersonalizationUpdates_withConfigurableValues___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(a2, "events");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__FCReadonlyPersonalizationAggregateStore_processTodayPersonalizationUpdates_withConfigurableValues___block_invoke_2;
  v5[3] = &unk_1E464AB28;
  v3 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __101__FCReadonlyPersonalizationAggregateStore_processTodayPersonalizationUpdates_withConfigurableValues___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  +[FCPersonalizationFeature featuresFromTodayPersonalizationEvent:](FCPersonalizationFeature, "featuresFromTodayPersonalizationEvent:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "action") - 2;
  if (v5 > 4)
    v6 = 22;
  else
    v6 = qword_1A1E83668[v5];
  v7 = objc_msgSend(v4, "overallOrder");
  v8 = objc_msgSend(v4, "sectionOrder");

  objc_msgSend(v3, "updateFeatures:withAction:displayRank:groupRank:individually:configurableValues:", v9, v6, v7, v8, 1, *(_QWORD *)(a1 + 40));
}

- (void)setPrepareOnce:(id)a3
{
  objc_storeStrong((id *)&self->_prepareOnce, a3);
}

- (void)setGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_generator, a3);
}

- (void)setOverrideAggregatesByFeatureKey:(id)a3
{
  objc_storeStrong((id *)&self->_overrideAggregatesByFeatureKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideAggregatesByFeatureKey, 0);
  objc_storeStrong((id *)&self->_derivedPersonalizationData, 0);
  objc_storeStrong((id *)&self->_generator, 0);
  objc_storeStrong((id *)&self->_prepareOnce, 0);
}

@end
