@implementation MLBatchProviderUtils

+ (id)featureNamesInBatch:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v3, "count") >= 1)
  {
    v5 = 0;
    do
    {
      objc_msgSend(v3, "featuresAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "featureNames");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "allObjects");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v8);

      ++v5;
    }
    while (v5 < objc_msgSend(v3, "count"));
  }

  return v4;
}

+ (id)featureProviderArrayFromBatch:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    if (objc_msgSend(v3, "count") >= 1)
    {
      v5 = 0;
      do
      {
        objc_msgSend(v3, "featuresAtIndex:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

        ++v5;
      }
      while (v5 < objc_msgSend(v3, "count"));
    }
  }

  return v4;
}

+ (id)dictionaryFromBatch:(id)a3 featureNames:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v5, "count") >= 1)
  {
    v15 = 0;
    v26 = v8;
    do
    {
      v27 = v15;
      objc_msgSend(v5, "featuresAtIndex:", v15, v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v17 = v8;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v29 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
            objc_msgSend(v16, "featureValueForName:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v23)
            {
              +[MLFeatureValue undefinedFeatureValueWithType:](MLFeatureValue, "undefinedFeatureValueWithType:", 0);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v7, "objectForKeyedSubscript:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v23);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        }
        while (v19);
      }

      v15 = v27 + 1;
      v8 = v26;
    }
    while (v27 + 1 < objc_msgSend(v5, "count"));
  }

  return v7;
}

+ (id)dictionaryFromBatch:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "featureNamesInBatch:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dictionaryFromBatch:featureNames:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)featureValueArrayForName:(id)a3 batch:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "featureNamesInBatch:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "containsObject:", v8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v8, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dictionaryFromBatch:featureNames:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Feature '%@' is not provided"), v8);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)featureDescriptionsByNameForBatch:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dictionaryFromBatch:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v5, "allKeys", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MLFeatureTypeUtils featureDescriptionWithName:consistentWithFeatureValues:error:](MLFeatureTypeUtils, "featureDescriptionWithName:consistentWithFeatureValues:error:", v12, v13, a4);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {

          v15 = 0;
          goto LABEL_11;
        }
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v15 = v6;
LABEL_11:

  return v15;
}

+ (id)lazyBatchWindowIntoBatch:(id)a3 startIndex:(unint64_t)a4 windowLength:(unint64_t)a5 error:(id *)a6
{
  id v9;
  MLWindowedBatchProvider *v10;

  v9 = a3;
  v10 = -[MLWindowedBatchProvider initWithBatch:startIndex:windowLength:error:]([MLWindowedBatchProvider alloc], "initWithBatch:startIndex:windowLength:error:", v9, a4, a5, a6);

  return v10;
}

+ (id)lazyBatchIndexIntoBatch:(id)a3 indices:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MLIndexedBatchProvider *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[MLIndexedBatchProvider initWithBatch:indices:error:]([MLIndexedBatchProvider alloc], "initWithBatch:indices:error:", v8, v7, a5);

  return v9;
}

+ (id)lazyBatchWithFeaturesInBatch:(id)a3 addedToBatch:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  MLLazyUnionBatchProvider *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[MLLazyUnionBatchProvider initWithFeaturesFrom:addedToFeaturesFrom:error:]([MLLazyUnionBatchProvider alloc], "initWithFeaturesFrom:addedToFeaturesFrom:error:", v8, v7, a5);

  return v9;
}

+ (id)batchFromConcatinatingBatches:(id)a3
{
  id v4;
  MLArrayBatchProvider *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (MLArrayBatchProvider *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(a1, "featureProviderArrayFromBatch:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObjectsFromArray:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }

    v5 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v6);
  }

  return v5;
}

+ (id)batchWithSubsetOfFeaturesNamed:(id)a3 fromBatch:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  MLArrayBatchProvider *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  if (objc_msgSend(v6, "count") >= 1)
  {
    v8 = 0;
    do
    {
      objc_msgSend(v6, "featuresAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:providedBy:](MLFeatureProviderUtils, "providerWithSubsetOfFeaturesNamed:providedBy:", v5, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:atIndexedSubscript:", v10, v8);

      ++v8;
    }
    while (v8 < objc_msgSend(v6, "count"));
  }
  v11 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v7);

  return v11;
}

+ (BOOL)vectorizeFeaturesNamed:(id)a3 fromBatch:(id)a4 intoRowsOfDoubleMatrix:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id *v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;

  v44 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 != 2)
  {
    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v10, "shape");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "numberWithUnsignedInteger:", objc_msgSend(v37, "count"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Expected to vectorize into matrix, but was passed a %@ multiarray"), v38);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v10, "shape");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "integerValue");
  v16 = objc_msgSend(v9, "count");

  if (v15 != v16)
  {
    objc_msgSend(v10, "shape");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "objectAtIndexedSubscript:", 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "count"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Row count of matrix (%@) does not match batch size (%@)"), v38, v39);
    v30 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    if (a6)
    {
      v30 = objc_retainAutorelease(v30);
LABEL_12:
      v23 = 0;
      *a6 = v30;
    }
    else
    {
      v23 = 0;
    }
    goto LABEL_19;
  }
  v17 = objc_retainAutorelease(v10);
  v18 = objc_msgSend(v17, "mutableBytes");
  objc_msgSend(v17, "strides");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectAtIndexedSubscript:", 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "unsignedIntegerValue");

  objc_msgSend(v17, "strides");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 1;
  objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v24, "unsignedIntegerValue");

  objc_msgSend(v17, "shape");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "unsignedIntegerValue");

  if (objc_msgSend(v9, "count") < 1)
  {
    v30 = 0;
  }
  else
  {
    v41 = a6;
    v42 = v10;
    v28 = 0;
    v29 = v21;
    v30 = 0;
    v31 = 8 * v29;
    while (1)
    {
      v32 = v30;
      objc_msgSend(v9, "featuresAtIndex:", v28);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1A1AD6ED8]();
      v45 = v30;
      v35 = +[MLFeatureProviderUtils vectorizeFeaturesProvidedBy:featureNames:intoDoubleVector:length:stride:error:](MLFeatureProviderUtils, "vectorizeFeaturesProvidedBy:featureNames:intoDoubleVector:length:stride:error:", v33, v44, v18, v27, v43, &v45);
      v30 = v45;

      objc_autoreleasePoolPop(v34);
      if (!v35)
        break;
      ++v28;
      v18 += v31;
      if (v28 >= objc_msgSend(v9, "count"))
      {
        v23 = 1;
        goto LABEL_18;
      }
    }
    a6 = v41;
    if (v41)
    {
      v30 = objc_retainAutorelease(v30);
      v10 = v42;
      goto LABEL_12;
    }
    v23 = 0;
LABEL_18:
    v10 = v42;
  }
LABEL_19:

  return v23;
}

@end
