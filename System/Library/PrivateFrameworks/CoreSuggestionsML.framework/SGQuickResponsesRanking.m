@implementation SGQuickResponsesRanking

- (SGQuickResponsesRanking)initWithSeed:(unint64_t)a3
{
  SGQuickResponsesRanking *v4;
  uint64_t v5;
  _PASRng *rng;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGQuickResponsesRanking;
  v4 = -[SGQuickResponsesRanking init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BE7A628]), "initWithSeed:", a3);
    rng = v4->_rng;
    v4->_rng = (_PASRng *)v5;

  }
  return v4;
}

- (id)resultsForModelScores:(id)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
  {
    +[SGQuickResponsesDistributingCount numResponsesForScores:responseCount:config:](SGQuickResponsesDistributingCount, "numResponsesForScores:responseCount:config:", v8, a4, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGQuickResponsesRanking classResultsForScores:numResponses:responseCount:config:](self, "classResultsForScores:numResponses:responseCount:config:", v8, v10, a4, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGQuickResponsesRanking semanticClassesForResults:scores:numResponses:config:](self, "semanticClassesForResults:scores:numResponses:config:", v11, v8, v10, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v12;
}

- (id)classResultsForScores:(id)a3 numResponses:(id)a4 responseCount:(unint64_t)a5 config:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, void *, unint64_t);
  void *v27;
  id v28;
  SGQuickResponsesRanking *v29;
  id v30;
  SEL v31;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  objc_msgSend(v13, "predictionParams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "responsesToShowAtTopForDiversity");

  if (v15 && v15 < a5)
  {
    +[SGQuickResponsesDistributingCount numResponsesForScores:responseCount:config:](SGQuickResponsesDistributingCount, "numResponsesForScores:responseCount:config:", v11, v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __83__SGQuickResponsesRanking_classResultsForScores_numResponses_responseCount_config___block_invoke;
    v27 = &unk_24DDC53C8;
    v28 = v16;
    v29 = self;
    v30 = v17;
    v31 = a2;
    v18 = v17;
    v19 = v16;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v24);
    -[SGQuickResponsesRanking indexesForScores:numResponses:](self, "indexesForScores:numResponses:", v11, v19, v24, v25, v26, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGQuickResponsesRanking indexesForScores:numResponses:](self, "indexesForScores:numResponses:", v11, v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SGQuickResponsesRanking indexesForScores:numResponses:](self, "indexesForScores:numResponses:", v11, v12);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

- (id)indexesForScores:(id)a3 numResponses:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__SGQuickResponsesRanking_indexesForScores_numResponses___block_invoke;
  v13[3] = &unk_24DDC53F0;
  v14 = v5;
  v8 = v7;
  v15 = v8;
  v9 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);

  v10 = v15;
  v11 = v8;

  return v11;
}

- (id)semanticClassesForResults:(id)a3 scores:(id)a4 numResponses:(id)a5 config:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  id v51;
  SGQuickResponsesRanking *v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v13, "predictionParams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isPerCategory");

  if ((v15 & 1) != 0
    && (objc_msgSend(v13, "replies"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v16,
        (isKindOfClass & 1) != 0))
  {
    v40 = v13;
    objc_msgSend(v13, "replies");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "categoryModels");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "count");

    v21 = (void *)objc_opt_new();
    v22 = (void *)objc_opt_new();
    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", 0);
    if (v20)
    {
      v24 = MEMORY[0x24BDBD1A8];
      do
      {
        objc_msgSend(v21, "addObject:", v24);
        objc_msgSend(v22, "addObject:", v23);
        --v20;
      }
      while (v20);
    }
    v39 = (void *)v23;
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __80__SGQuickResponsesRanking_semanticClassesForResults_scores_numResponses_config___block_invoke;
    v49[3] = &unk_24DDC5418;
    v42 = v11;
    v50 = v11;
    v25 = v21;
    v51 = v25;
    v52 = self;
    v38 = v18;
    v53 = v38;
    v41 = v12;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v49);
    v26 = (id)objc_opt_new();
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v43 = v10;
    obj = v10;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v46;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v46 != v29)
            objc_enumerationMutation(obj);
          v31 = objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v30), "unsignedIntegerValue");
          objc_msgSend(v22, "objectAtIndexedSubscript:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "unsignedIntegerValue");

          objc_msgSend(v25, "objectAtIndexedSubscript:", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectAtIndexedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v33 + 1);
          objc_msgSend(v22, "setObject:atIndexedSubscript:", v36, v31);

          objc_msgSend(v26, "addObject:", v35);
          ++v30;
        }
        while (v28 != v30);
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v28);
    }

    v11 = v42;
    v10 = v43;
    v13 = v40;
    v12 = v41;
  }
  else
  {
    v26 = v10;
  }

  return v26;
}

- (id)semanticClassesForCategory:(unint64_t)a3 responseCount:(unint64_t)a4 configReplies:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  SGQuickResponsesRanking *v25;
  unint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  objc_msgSend(v8, "categorySemanticClasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v10);
  +[SGRandomization shuffleMutableArray:withRng:](SGRandomization, "shuffleMutableArray:withRng:", v11, self->_rng);
  if (objc_msgSend(v11, "count") >= a4)
  {
    objc_msgSend(v11, "subarrayWithRange:", 0, a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = self;
    v26 = a4;
    v12 = (void *)objc_opt_new();
    v28 = v8;
    objc_msgSend(v8, "semanticClasses");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v27 = v10;
    v14 = v10;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v19, "unsignedIntegerValue", v25));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count") - 1;

          for (; v21; --v21)
            objc_msgSend(v12, "addObject:", v19);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v16);
    }

    +[SGRandomization shuffleMutableArray:withRng:](SGRandomization, "shuffleMutableArray:withRng:", v12, v25->_rng);
    objc_msgSend(v12, "subarrayWithRange:", 0, v26 - objc_msgSend(v11, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v27;
    v8 = v28;
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rng, 0);
}

void __80__SGQuickResponsesRanking_semanticClassesForResults_scores_numResponses_config___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "index");

  v9 = objc_msgSend(v6, "unsignedIntegerValue");
  objc_msgSend(*(id *)(a1 + 48), "semanticClassesForCategory:responseCount:configReplies:", v8, v9, *(_QWORD *)(a1 + 56));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v10, v8);

}

void __57__SGQuickResponsesRanking_indexesForScores_numResponses___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = objc_alloc(MEMORY[0x24BDD16E0]);
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v6, "initWithUnsignedInteger:", objc_msgSend(v7, "index"));

  for (; v5; --v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

void __83__SGQuickResponsesRanking_classResultsForScores_numResponses_responseCount_config___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count") <= a3)
  {
    objc_msgSend(v11, "unsignedIntegerValue");
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    if (objc_msgSend(v11, "unsignedIntegerValue") < v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("SGQuickResponsesRanking.m"), 57, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("num.unsignedIntegerValue >= headerCount"));

    }
  }
  v8 = objc_msgSend(v11, "unsignedIntegerValue") - v6;
  v9 = *(void **)(a1 + 48);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", v8);
  objc_msgSend(v9, "addObject:", v10);

}

@end
