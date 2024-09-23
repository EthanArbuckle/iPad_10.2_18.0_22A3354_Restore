@implementation CLSSimilarStacker

- (CLSSimilarStacker)initWithSimilarityModelClass:(Class)a3
{
  CLSSimilarStacker *v4;
  CLSSimilarStacker *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *similarityModelByVersion;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CLSSimilarStacker;
  v4 = -[CLSSimilarStacker init](&v14, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_similarityModelClass = a3;
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    similarityModelByVersion = v5->_similarityModelByVersion;
    v5->_similarityModelByVersion = v6;

    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&v5->_distanceThresholdForIdenticalSimilarity = _Q0;
    *(_OWORD *)&v5->_distanceThresholdForSemanticalSimilarity = _Q0;
    v5->_distanceThresholdForSemanticalSimilarityWithPersons = -1.0;
  }
  return v5;
}

- (id)similarGroupComparator
{
  return &__block_literal_global_2057;
}

- (id)stackSimilarItems:(id)a3 withSimilarity:(int64_t)a4 timestampSupport:(BOOL)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int64_t v27;
  CLSSimilarStacker *v28;
  void *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  int64_t v34;
  uint8_t buf[16];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[3];

  v41[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = objc_msgSend(v9, "count");
  if (v11)
  {
    if (v11 == 1)
    {
      v41[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = a4;
      v28 = self;
      v29 = v10;
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v30 = v9;
      v14 = v9;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v37 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v19, "clsSimilarityModelVersion", v27, v28, v29));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v20);
            v21 = (id)objc_claimAutoreleasedReturnValue();
            if (!v21)
            {
              v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v20);
            }
            objc_msgSend(v21, "addObject:", v19);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v16);
      }

      if ((unint64_t)objc_msgSend(v13, "count") >= 2
        && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[CLSSimilarStacker] Items with mixed sceneprint versions, deduping may not be optimal", buf, 2u);
      }
      v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __85__CLSSimilarStacker_stackSimilarItems_withSimilarity_timestampSupport_progressBlock___block_invoke;
      v31[3] = &unk_1E84F8038;
      v31[4] = v28;
      v34 = v27;
      v10 = v29;
      v33 = v29;
      v23 = v22;
      v32 = v23;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v31);
      -[CLSSimilarStacker similarGroupComparator](v28, "similarGroupComparator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "sortWithOptions:usingComparator:", 16, v24);

      v25 = v32;
      v12 = v23;

      v9 = v30;
    }
  }
  else
  {
    v12 = (id)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

- (id)adaptiveStackSimilarItems:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  objc_msgSend(v6, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "clsSimilarityModelVersion");

  -[CLSSimilarStacker _similarityModelForVersion:](self, "_similarityModelForVersion:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "distanceBlockWithMetric:sceneprintGetterBlock:", objc_msgSend(v11, "metric"), self->_sceneprintGetterBlock);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", v33);
  objc_msgSend(v12, "setMinimumNumberOfObjects:", 1);
  -[CLSSimilarStacker distanceThresholdForSimilarity:similarityModel:](self, "distanceThresholdForSimilarity:similarityModel:", 2, v11);
  v14 = v13;
  v34 = v11;
  -[CLSSimilarStacker distanceThresholdForSimilarity:similarityModel:](self, "distanceThresholdForSimilarity:similarityModel:", 0, v11);
  v16 = v15;
  v17 = 0;
  v18 = (double)v8;
  v19 = v14 - v15;
  v20 = 1.0;
  v21 = 0.0;
  do
  {
    v22 = v17;
    v23 = (v20 + v21) * 0.5;
    objc_msgSend(v12, "setMaximumDistance:", v16 + v23 * v19);
    objc_msgSend(v12, "performWithDataset:progressBlock:", v6, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count") <= (unint64_t)(v23 * v18) / 3)
    {
      v20 = (v20 + v21) * 0.5;
      v23 = v21;
    }
    else if (objc_msgSend(v17, "count") <= (unint64_t)(v23 * v18) / 3 + 1)
    {
      break;
    }
    v21 = v23;
  }
  while (v20 - v23 > 0.0000001);
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = v17;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v36 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "objects");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v27);
  }

  -[CLSSimilarStacker similarGroupComparator](self, "similarGroupComparator");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sortWithOptions:usingComparator:", 16, v31);

  return v24;
}

- (double)distanceBetweenItem:(id)a3 andItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double (**v9)(_QWORD, _QWORD, _QWORD);
  double v10;

  v6 = a4;
  v7 = a3;
  -[CLSSimilarStacker _similarityModelForVersion:](self, "_similarityModelForVersion:", objc_msgSend(v7, "clsSimilarityModelVersion"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "distanceBlockWithMetric:sceneprintGetterBlock:", objc_msgSend(v8, "metric"), self->_sceneprintGetterBlock);
  v9 = (double (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10 = ((double (**)(_QWORD, id, id))v9)[2](v9, v7, v6);

  return v10;
}

- (double)distanceThresholdForSimilarity:(int64_t)a3 similarityModel:(id)a4
{
  id v6;
  void *v7;
  double distanceThresholdForIdenticalSimilarity;
  double v9;

  v6 = a4;
  v7 = v6;
  switch(a3)
  {
    case 0:
      distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForIdenticalSimilarity;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        objc_msgSend(v6, "identicalSimilarityDistanceThreshold");
        goto LABEL_12;
      }
      break;
    case 1:
      distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForIdenticalSimilarityWithPeople;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        objc_msgSend(v6, "identicalSimilarityWithPeopleDistanceThreshold");
        goto LABEL_12;
      }
      break;
    case 2:
      distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForSemanticalSimilarity;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        objc_msgSend(v6, "semanticalSimilarityDistanceThreshold");
        goto LABEL_12;
      }
      break;
    case 3:
      distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForSemanticalSimilarityWithPeople;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        objc_msgSend(v6, "semanticalSimilarityWithPeopleDistanceThreshold");
        goto LABEL_12;
      }
      break;
    case 4:
      distanceThresholdForIdenticalSimilarity = self->_distanceThresholdForSemanticalSimilarityWithPersons;
      if (distanceThresholdForIdenticalSimilarity < 0.0)
      {
        objc_msgSend(v6, "semanticalSimilarityWithPersonDistanceThreshold");
LABEL_12:
        distanceThresholdForIdenticalSimilarity = v9;
      }
      break;
    default:
      distanceThresholdForIdenticalSimilarity = 0.0;
      break;
  }

  return distanceThresholdForIdenticalSimilarity;
}

- (double)distanceThresholdForSimilarity:(int64_t)a3 withSimilarityModelVersion:(unint64_t)a4
{
  void *v6;
  double v7;
  double v8;

  -[CLSSimilarStacker _similarityModelForVersion:](self, "_similarityModelForVersion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSSimilarStacker distanceThresholdForSimilarity:similarityModel:](self, "distanceThresholdForSimilarity:similarityModel:", a3, v6);
  v8 = v7;

  return v8;
}

- (void)overrideDistanceThreshold:(double)a3 forSimilarity:(int64_t)a4
{
  if ((unint64_t)a4 <= 4)
    *(&self->_distanceThresholdForIdenticalSimilarity + a4) = a3;
}

- (id)_similarityModelForVersion:(unint64_t)a3
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_similarityModelByVersion, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSceneAnalysisVersion:", a3);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_similarityModelByVersion, "setObject:forKeyedSubscript:", v6, v5);
  }

  return v6;
}

- (id)sceneprintGetterBlock
{
  return self->_sceneprintGetterBlock;
}

- (void)setSceneprintGetterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sceneprintGetterBlock, 0);
  objc_storeStrong((id *)&self->_similarityModelByVersion, 0);
}

void __85__CLSSimilarStacker_stackSimilarItems_withSimilarity_timestampSupport_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_similarityModelForVersion:", objc_msgSend(a2, "unsignedIntegerValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "distanceBlockWithMetric:sceneprintGetterBlock:", objc_msgSend(v6, "metric"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", v7);
  objc_msgSend(v8, "setMinimumNumberOfObjects:", 1);
  objc_msgSend(*(id *)(a1 + 32), "distanceThresholdForSimilarity:similarityModel:", *(_QWORD *)(a1 + 56), v6);
  objc_msgSend(v8, "setMaximumDistance:");
  v16 = v5;
  objc_msgSend(v8, "performWithDataset:progressBlock:", v5, *(_QWORD *)(a1 + 48));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
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
        v14 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "objects");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v15);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

uint64_t __43__CLSSimilarStacker_similarGroupComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "cls_universalDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cls_universalDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "compare:", v8);

  if (!v9)
  {
    objc_msgSend(v5, "clsIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clsIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v10, "compare:", v11);

  }
  return v9;
}

+ (id)distanceBlockWithMetric:(unint64_t)a3 sceneprintGetterBlock:(id)a4
{
  id v5;
  void *v6;
  double (*v7)(uint64_t, void *, void *);
  uint64_t *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  v6 = v5;
  if (a3 == 1)
  {
    v11 = MEMORY[0x1E0C809B0];
    v7 = __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke_2;
    v8 = &v11;
  }
  else
  {
    if (a3)
    {
      v9 = &__block_literal_global_25;
      goto LABEL_7;
    }
    v12 = MEMORY[0x1E0C809B0];
    v7 = __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke;
    v8 = &v12;
  }
  v8[1] = 3221225472;
  v8[2] = (uint64_t)v7;
  v8[3] = (uint64_t)&unk_1E84F8060;
  v8[4] = (uint64_t)v5;
  v9 = (void *)MEMORY[0x1D1796244](v8);

LABEL_7:
  return v9;
}

double __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  double v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  else
    objc_msgSend(v5, "clsSceneprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  else
    objc_msgSend(v6, "clsSceneprint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12)
    v13 = 1.79769313e308;
  else
    v13 = CLSEuclidianDistanceBetweenSceneprints(v8, v10);

  return v13;
}

double __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  double v14;
  double v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v5);
  else
    objc_msgSend(v5, "clsSceneprint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);
  else
    objc_msgSend(v6, "clsSceneprint");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v8)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (v12
    || (v13 = objc_msgSend(v8, "requestRevision"), v13 != objc_msgSend(v11, "requestRevision"))
    || (v14 = (CLSCosineSimilarityBetweenSceneprints(v8, v11) + 1.0) * 0.5, v14 <= 0.0))
  {
    v15 = 1.79769313e308;
  }
  else
  {
    v15 = (1.0 - v14) / v14;
  }

  return v15;
}

double __67__CLSSimilarStacker_distanceBlockWithMetric_sceneprintGetterBlock___block_invoke_3()
{
  return 1.79769313e308;
}

@end
