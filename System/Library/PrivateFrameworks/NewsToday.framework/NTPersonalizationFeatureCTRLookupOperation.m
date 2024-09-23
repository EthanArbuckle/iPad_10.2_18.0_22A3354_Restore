@implementation NTPersonalizationFeatureCTRLookupOperation

- (NTPersonalizationFeatureCTRLookupOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTPersonalizationFeatureCTRLookupOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  -[NTPersonalizationFeatureCTRLookupOperation personalizationTreatment](self, "personalizationTreatment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizationFeatureCTRLookupOperation validateOperation].cold.3();
  -[NTPersonalizationFeatureCTRLookupOperation lookupRequests](self, "lookupRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizationFeatureCTRLookupOperation validateOperation].cold.2();
  -[NTPersonalizationFeatureCTRLookupOperation lookupCompletion](self, "lookupCompletion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTPersonalizationFeatureCTRLookupOperation validateOperation].cold.1();
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  return !v6 && v5 != 0;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;

  -[NTPersonalizationFeatureCTRLookupOperation lookupRequests](self, "lookupRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fc_dictionaryWithKeyBlock:", &__block_literal_global_4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTPersonalizationFeatureCTRLookupOperation aggregateStore](self, "aggregateStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "aggregatesForFeatures:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTPersonalizationFeatureCTRLookupOperation personalizationTreatment](self, "personalizationTreatment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPersonalizationFeatureCTRLookupOperation aggregateStore](self, "aggregateStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "baselineAggregateWithConfigurableValues:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "defaultScoringConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "decayFactor");
  v13 = v12;

  objc_msgSend(v8, "defaultScoringConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "baselineRatePrior");
  v16 = v15;

  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __62__NTPersonalizationFeatureCTRLookupOperation_performOperation__block_invoke_2;
  v23 = &unk_24DB5E9E8;
  v24 = v7;
  v25 = v10;
  v26 = v16;
  v27 = v13;
  v17 = v10;
  v18 = v7;
  objc_msgSend(v4, "fc_dictionaryByTransformingValuesWithBlock:", &v20);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTPersonalizationFeatureCTRLookupOperation setResult:](self, "setResult:", v19, v20, v21, v22, v23);

  -[FCOperation finishedPerformingOperationWithError:](self, "finishedPerformingOperationWithError:", 0);
}

uint64_t __62__NTPersonalizationFeatureCTRLookupOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personalizationFeature");
}

id __62__NTPersonalizationFeatureCTRLookupOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "personalizationFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "impressionPrior");
    v7 = 1.0;
    if (v8 > 0.0)
    {
      objc_msgSend(v3, "clickPrior");
      v10 = v9;
      objc_msgSend(v3, "impressionPrior");
      v12 = v10 / v11;
      if (v12 > 0.0)
      {
        v13 = *(double *)(a1 + 48);
        if (v13 > 0.0)
          v7 = v12 / v13;
      }
    }
    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "personalizationValueWithBaseline:decayRate:baselineClicksMultiplier:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), v7);
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(id, void *, id);

  v4 = a3;
  -[NTPersonalizationFeatureCTRLookupOperation lookupCompletion](self, "lookupCompletion");
  v6 = (void (**)(id, void *, id))objc_claimAutoreleasedReturnValue();
  -[NTPersonalizationFeatureCTRLookupOperation result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, v4);

}

- (FCReadonlyPersonalizationAggregateStore)aggregateStore
{
  return self->_aggregateStore;
}

- (void)setAggregateStore:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateStore, a3);
}

- (FCPersonalizationTreatment)personalizationTreatment
{
  return self->_personalizationTreatment;
}

- (void)setPersonalizationTreatment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSArray)lookupRequests
{
  return self->_lookupRequests;
}

- (void)setLookupRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (id)lookupCompletion
{
  return self->_lookupCompletion;
}

- (void)setLookupCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong(&self->_lookupCompletion, 0);
  objc_storeStrong((id *)&self->_lookupRequests, 0);
  objc_storeStrong((id *)&self->_personalizationTreatment, 0);
  objc_storeStrong((id *)&self->_aggregateStore, 0);
}

- (void)validateOperation
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("feature CTR lookup operation requires personalization treatment"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

@end
