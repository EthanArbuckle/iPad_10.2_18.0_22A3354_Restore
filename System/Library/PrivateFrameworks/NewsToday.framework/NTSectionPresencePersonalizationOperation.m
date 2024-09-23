@implementation NTSectionPresencePersonalizationOperation

- (NTSectionPresencePersonalizationOperation)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NTSectionPresencePersonalizationOperation;
  return -[FCOperation init](&v3, sel_init);
}

- (BOOL)validateOperation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  -[NTSectionPresencePersonalizationOperation personalizationTreatment](self, "personalizationTreatment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionPresencePersonalizationOperation validateOperation].cold.7();
  -[NTSectionPresencePersonalizationOperation absoluteRequests](self, "absoluteRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "fc_containsObjectPassingTest:", &__block_literal_global_15))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[NTSectionPresencePersonalizationOperation validateOperation].cold.6();
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  -[NTSectionPresencePersonalizationOperation relativeRequests](self, "relativeRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[NTSectionPresencePersonalizationOperation validateOperation].cold.5();
      v10 = 0;
      goto LABEL_20;
    }
LABEL_16:
    v10 = 1;
LABEL_20:
    v9 = 1;
    goto LABEL_21;
  }
  if (!objc_msgSend(v7, "fc_containsObjectPassingTest:", &__block_literal_global_84))
    goto LABEL_16;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionPresencePersonalizationOperation validateOperation].cold.4();
  v9 = 0;
  v10 = 1;
LABEL_21:
  -[NTSectionPresencePersonalizationOperation absolutePresenceHandler](self, "absolutePresenceHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !v11 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionPresencePersonalizationOperation validateOperation].cold.3();
  -[NTSectionPresencePersonalizationOperation relativePresenceHandler](self, "relativePresenceHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && !v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionPresencePersonalizationOperation validateOperation].cold.2();
  -[NTSectionPresencePersonalizationOperation personalizationCompletion](self, "personalizationCompletion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NTSectionPresencePersonalizationOperation validateOperation].cold.1();
  v14 = v10 & v6 & v9;
  if (!v3)
    v14 = 0;
  if (v13)
    v15 = v14;
  else
    v15 = 0;

  return v15;
}

BOOL __62__NTSectionPresencePersonalizationOperation_validateOperation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "absolutePresenceConfig");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

BOOL __62__NTSectionPresencePersonalizationOperation_validateOperation__block_invoke_82(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  objc_msgSend(v2, "targetSectionFeature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "competingSectionFeature");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 == 0;

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)performOperation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  -[NTSectionPresencePersonalizationOperation absoluteRequests](self, "absoluteRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTSectionPresencePersonalizationOperation relativeRequests](self, "relativeRequests");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCE30];
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke;
  v18[3] = &unk_24DB5E260;
  v7 = v3;
  v19 = v7;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v5, "fc_array:", v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  -[NTSectionPresencePersonalizationOperation aggregateStore](self, "aggregateStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAggregateStore:", v11);

  -[NTSectionPresencePersonalizationOperation personalizationTreatment](self, "personalizationTreatment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPersonalizationTreatment:", v12);

  objc_msgSend(v10, "setLookupRequests:", v9);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_4;
  v15[3] = &unk_24DB5FEC8;
  v15[4] = self;
  v16 = v7;
  v17 = v8;
  v13 = v8;
  v14 = v7;
  objc_msgSend(v10, "setLookupCompletion:", v15);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v10);
  objc_msgSend(v10, "start");

}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_2;
  v11[3] = &unk_24DB5FE08;
  v6 = v3;
  v12 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
  v7 = *(void **)(a1 + 40);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_3;
  v9[3] = &unk_24DB5FE30;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  v3 = a2;
  v7 = (id)objc_opt_new();
  objc_msgSend(v3, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPersonalizationFeature:", v4);

  objc_msgSend(v3, "featureImpressionPrior");
  objc_msgSend(v7, "setImpressionPrior:");
  objc_msgSend(v3, "featureClickPrior");
  v6 = v5;

  objc_msgSend(v7, "setClickPrior:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v3 = a2;
  v9 = (id)objc_opt_new();
  objc_msgSend(v3, "targetSectionFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPersonalizationFeature:", v4);

  objc_msgSend(v3, "targetSectionFeatureImpressionPrior");
  objc_msgSend(v9, "setImpressionPrior:");
  objc_msgSend(v3, "targetSectionFeatureClickPrior");
  objc_msgSend(v9, "setClickPrior:");
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "competingSectionFeature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonalizationFeature:", v6);

  objc_msgSend(v3, "competingSectionFeatureImpressionPrior");
  objc_msgSend(v5, "setImpressionPrior:");
  objc_msgSend(v3, "competingSectionFeatureClickPrior");
  v8 = v7;

  objc_msgSend(v5, "setClickPrior:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  _QWORD v29[5];

  v5 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", a3);
  }
  else
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "personalizationTreatment");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "defaultScoringConfig");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "decayFactor");
    v10 = v9;

    v11 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_5;
    v29[3] = &__block_descriptor_40_e24_d32__0__NSNumber_8d16d24l;
    v29[4] = v10;
    v12 = (void *)MEMORY[0x219A33CDC](v29);
    v13 = *(void **)(a1 + 40);
    v25[0] = v11;
    v25[1] = 3221225472;
    v25[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_6;
    v25[3] = &unk_24DB5FE78;
    v14 = v5;
    v26 = v14;
    v15 = v12;
    v27 = v6;
    v28 = v15;
    v16 = v6;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v25);
    objc_msgSend(*(id *)(a1 + 32), "setAbsolutePresenceResult:", v16);
    v17 = (void *)objc_opt_new();
    v18 = *(void **)(a1 + 48);
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_114;
    v21[3] = &unk_24DB5FEA0;
    v23 = v17;
    v24 = v15;
    v22 = v14;
    v19 = v17;
    v20 = v15;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v21);
    objc_msgSend(*(id *)(a1 + 32), "setRelativePresenceResult:", v19);
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);

  }
}

double __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_5(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  id v8;
  double v9;
  double v10;

  v7 = a2;
  v8 = objc_alloc_init(MEMORY[0x24BE6D270]);
  objc_msgSend(v8, "setClicks:", a3);
  objc_msgSend(v8, "setImpressions:", a4);
  if (v7)
    objc_msgSend(v7, "doubleValue");
  else
    objc_msgSend(v8, "personalizationValueWithBaseline:decayRate:", 0, *(double *)(a1 + 32));
  v10 = v9;

  return v10;
}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  const __CFString *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  _QWORD v40[2];
  uint8_t buf[4];
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "feature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "absolutePresenceConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sectionEdition");
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "personalizationIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("NTCache%@"), v8);
  v9 = objc_claimAutoreleasedReturnValue();

  NewsCoreUserDefaults();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)v9;
  objc_msgSend(v10, "arrayForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (objc_msgSend(v11, "objectAtIndexedSubscript:", 0),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "unsignedLongLongValue"),
        v12,
        v13 == v6))
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v16 = objc_claimAutoreleasedReturnValue();
    v38 = a1;
    v17 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v3, "featureClickPrior");
    v19 = v18;
    objc_msgSend(v3, "featureImpressionPrior");
    v36 = (void *)v16;
    (*(void (**)(uint64_t, uint64_t, double, double))(v17 + 16))(v17, v16, v19, v20);
    objc_msgSend(v5, "minProbabilityToShow");
    objc_msgSend(v5, "cTRToHide");
    objc_msgSend(v5, "cTRToShow");
    FCClamp();
    v22 = v21;
    v23 = (void *)MEMORY[0x24BDD16E0];
    FCRandom();
    objc_msgSend(v23, "numberWithInt:", v24 <= v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "personalizationIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v14, "BOOLValue");
    v30 = CFSTR("hiding");
    if (v29)
      v30 = CFSTR("showing");
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Section %@ has a probability of %@ to display in widget. The edition %@ is %@ the section."), v26, v27, v28, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = *MEMORY[0x24BE6CA00];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6CA00], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v31;
      _os_log_impl(&dword_2197E6000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    NewsCoreUserDefaults();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v37);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v34;
    v40[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v39;
    objc_msgSend(v33, "setObject:forKey:", v35, v39);

    a1 = v38;
  }
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v14, v4);

}

void __61__NTSectionPresencePersonalizationOperation_performOperation__block_invoke_114(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  const __CFString *v27;
  void *v28;
  NSObject *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "targetSectionFeature");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "competingSectionFeature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "targetSectionFeatureClickPrior");
  v10 = v9;
  objc_msgSend(v3, "targetSectionFeatureImpressionPrior");
  v12 = (*(double (**)(uint64_t, void *, double, double))(v8 + 16))(v8, v6, v10, v11);
  v13 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "competingSectionFeatureClickPrior");
  v15 = v14;
  objc_msgSend(v3, "competingSectionFeatureImpressionPrior");
  v17 = (*(double (**)(uint64_t, void *, double, double))(v13 + 16))(v13, v7, v15, v16);
  v18 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "scalar");
  v20 = v19;

  objc_msgSend(v18, "numberWithInt:", v12 >= v17 * v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v21, v4);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v21, "BOOLValue") ^ 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v22, v5);

  v23 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "personalizationIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personalizationIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v21, "BOOLValue");
  v27 = CFSTR(" not");
  if (v26)
    v27 = &stru_24DB606B8;
  objc_msgSend(v23, "stringWithFormat:", CFSTR("Target section %@ has a CTR of %f, while the competing section, %@, has a CTR of %f. Target will%@ be shown."), v24, *(_QWORD *)&v12, v25, *(_QWORD *)&v17, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = *MEMORY[0x24BE6CA00];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE6CA00], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v28;
    _os_log_impl(&dword_2197E6000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }

}

- (void)operationWillFinishWithError:(id)a3
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void (**v11)(id, id);

  v4 = a3;
  -[NTSectionPresencePersonalizationOperation absolutePresenceHandler](self, "absolutePresenceHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[NTSectionPresencePersonalizationOperation absolutePresenceHandler](self, "absolutePresenceHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NTSectionPresencePersonalizationOperation absolutePresenceResult](self, "absolutePresenceResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);

  }
  -[NTSectionPresencePersonalizationOperation relativePresenceHandler](self, "relativePresenceHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NTSectionPresencePersonalizationOperation relativePresenceHandler](self, "relativePresenceHandler");
    v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[NTSectionPresencePersonalizationOperation relativePresenceResult](self, "relativePresenceResult");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v9)[2](v9, v10);

  }
  -[NTSectionPresencePersonalizationOperation personalizationCompletion](self, "personalizationCompletion");
  v11 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v11[2](v11, v4);

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

- (NSArray)absoluteRequests
{
  return self->_absoluteRequests;
}

- (void)setAbsoluteRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSArray)relativeRequests
{
  return self->_relativeRequests;
}

- (void)setRelativeRequests:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (id)absolutePresenceHandler
{
  return self->_absolutePresenceHandler;
}

- (void)setAbsolutePresenceHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (id)relativePresenceHandler
{
  return self->_relativePresenceHandler;
}

- (void)setRelativePresenceHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (id)personalizationCompletion
{
  return self->_personalizationCompletion;
}

- (void)setPersonalizationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSDictionary)absolutePresenceResult
{
  return self->_absolutePresenceResult;
}

- (void)setAbsolutePresenceResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (NSDictionary)relativePresenceResult
{
  return self->_relativePresenceResult;
}

- (void)setRelativePresenceResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relativePresenceResult, 0);
  objc_storeStrong((id *)&self->_absolutePresenceResult, 0);
  objc_storeStrong(&self->_personalizationCompletion, 0);
  objc_storeStrong(&self->_relativePresenceHandler, 0);
  objc_storeStrong(&self->_absolutePresenceHandler, 0);
  objc_storeStrong((id *)&self->_relativeRequests, 0);
  objc_storeStrong((id *)&self->_absoluteRequests, 0);
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

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("section presence personalization operation requires personalization treatment"));
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2197E6000, MEMORY[0x24BDACB70], v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, 2u);

  OUTLINED_FUNCTION_3_0();
}

@end
