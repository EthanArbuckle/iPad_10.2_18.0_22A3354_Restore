@implementation SGQuickResponsesScoring

+ (id)sortedWithUnweightedScores:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  id *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  _QWORD v42[3];
  _QWORD v43[4];
  id v44;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "replies");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v6, "replies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGQuickResponsesScoring modelScoresWithUnweightedScores:configReplies:](SGQuickResponsesScoring, "modelScoresWithUnweightedScores:configReplies:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGQuickResponsesScoring categoryScoresWithModelScores:configReplies:](SGQuickResponsesScoring, "categoryScoresWithModelScores:configReplies:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predictionParams");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "weightForCategoryAverage");
    v15 = v14;

    objc_msgSend(v6, "predictionParams");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "weightForCategoryMax");
    v18 = v17;

    objc_msgSend(v6, "predictionParams");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "weightForIndividualModel");
    v21 = v20;

    objc_msgSend(v6, "predictionParams");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isPerCategory");

    if (v23)
    {
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke_2;
      v41[3] = &unk_24DDC5468;
      v42[1] = v15;
      v42[2] = v18;
      v24 = (id *)v42;
      v42[0] = v7;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", v41);
    }
    else
    {
      objc_msgSend(v10, "models");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke_3;
      v34[3] = &unk_24DDC5490;
      v24 = &v35;
      v35 = v12;
      v38 = v15;
      v39 = v18;
      v36 = v11;
      v40 = v21;
      v37 = v7;
      objc_msgSend(v29, "enumerateObjectsUsingBlock:", v34);

    }
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", 0, 0);
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v30, 0);
    objc_msgSend(v7, "sortUsingDescriptors:", v31);

    v32 = v7;
  }
  else
  {
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke;
    v43[3] = &unk_24DDC5440;
    v25 = v7;
    v44 = v25;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v43);
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", 0, 0);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v26, 0);
    objc_msgSend(v25, "sortUsingDescriptors:", v27);

    v28 = v25;
    v10 = v44;
  }

  return v7;
}

+ (id)modelScoresWithUnweightedScores:(id)a3 configReplies:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  objc_msgSend(a4, "models");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__SGQuickResponsesScoring_modelScoresWithUnweightedScores_configReplies___block_invoke;
  v13[3] = &unk_24DDC53F0;
  v14 = v6;
  v8 = v7;
  v15 = v8;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

+ (id)categoryScoresWithModelScores:(id)a3 configReplies:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "categoryModels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  for (i = (void *)objc_opt_new(); v8; --v8)
  {
    v10 = (void *)objc_opt_new();
    objc_msgSend(i, "addObject:", v10);

  }
  objc_msgSend(v6, "models");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__SGQuickResponsesScoring_categoryScoresWithModelScores_configReplies___block_invoke;
  v17[3] = &unk_24DDC53F0;
  v18 = v11;
  v12 = i;
  v19 = v12;
  v13 = v11;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
  v14 = v19;
  v15 = v12;

  return v15;
}

void __71__SGQuickResponsesScoring_categoryScoresWithModelScores_configReplies___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "category");

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v10 = v9;

  objc_msgSend(v11, "addScore:", v10);
}

void __73__SGQuickResponsesScoring_modelScoresWithUnweightedScores_configReplies___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "doubleValue");
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scoreWeight");
  v9 = v6 * v8;

  v10 = *(void **)(a1 + 40);
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithDouble:", v9);
  objc_msgSend(v10, "addObject:", v11);

}

void __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  SGQuickResponsesClassScore *v6;
  double v7;
  double v8;
  SGQuickResponsesClassScore *v9;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  v6 = [SGQuickResponsesClassScore alloc];
  objc_msgSend(v5, "doubleValue");
  v8 = v7;

  v9 = -[SGQuickResponsesClassScore initWithValue:index:](v6, "initWithValue:index:", a3, v8);
  objc_msgSend(v4, "addObject:", v9);

}

void __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  SGQuickResponsesClassScore *v13;

  v5 = a2;
  objc_msgSend(v5, "average");
  v7 = v6;
  v8 = *(double *)(a1 + 40);
  objc_msgSend(v5, "maximum");
  v10 = v9;

  v11 = v10 * *(double *)(a1 + 48) + v7 * v8;
  v12 = *(void **)(a1 + 32);
  v13 = -[SGQuickResponsesClassScore initWithValue:index:]([SGQuickResponsesClassScore alloc], "initWithValue:index:", a3, v11);
  objc_msgSend(v12, "addObject:", v13);

}

void __61__SGQuickResponsesScoring_sortedWithUnweightedScores_config___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  double v19;
  void *v20;
  SGQuickResponsesClassScore *v21;
  id v22;

  v22 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v22, "category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "average");
  v7 = v6;
  v8 = *(double *)(a1 + 56);
  objc_msgSend(v5, "maximum");
  v10 = v9;
  v11 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;
  v15 = *(double *)(a1 + 72);

  v16 = objc_msgSend(v22, "semanticClassIndex");
  objc_msgSend(v22, "semanticClasses");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v16 < v18 + v16)
  {
    v19 = v10 * v11 + v7 * v8 + v14 * v15;
    do
    {
      v20 = *(void **)(a1 + 48);
      v21 = -[SGQuickResponsesClassScore initWithValue:index:]([SGQuickResponsesClassScore alloc], "initWithValue:index:", v16, v19);
      objc_msgSend(v20, "addObject:", v21);

      ++v16;
      --v18;
    }
    while (v18);
  }

}

@end
