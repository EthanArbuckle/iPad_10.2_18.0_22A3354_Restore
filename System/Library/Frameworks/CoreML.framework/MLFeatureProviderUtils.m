@implementation MLFeatureProviderUtils

+ (id)lazyProviderWithFeaturesProvidedBy:(id)a3 addedToFeaturesProvidedBy:(id)a4
{
  id v5;
  id v6;
  MLLazyUnionFeatureProvider *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[MLLazyUnionFeatureProvider initWithFeaturesFrom:addedToFeaturesFrom:]([MLLazyUnionFeatureProvider alloc], "initWithFeaturesFrom:addedToFeaturesFrom:", v5, v6);

  return v7;
}

+ (id)_featureValuesForNames:(id)a3 providedBy:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t i;
  void *v11;
  void *v12;
  id v13;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    if (i >= objc_msgSend(v7, "count"))
    {
      v13 = v9;
      goto LABEL_9;
    }
    objc_msgSend(v7, "objectAtIndexedSubscript:", i);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "featureValueForName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      break;
    objc_msgSend(v9, "addObject:", v12);

  }
  if (a5)
  {
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Feature '%@' not provided."), v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }

  v13 = 0;
LABEL_9:

  return v13;
}

+ (id)providerWithSubsetOfFeaturesNamed:(id)a3 providedBy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  MLDictionaryFeatureProvider *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v6, "featureValueForName:", v12, (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v14 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:]([MLDictionaryFeatureProvider alloc], "initWithFeatureValueDictionary:", v7);
  return v14;
}

+ (int64_t)_vectorizedSizeOfFeatureValues:(id)a3 error:(id *)a4
{
  id v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = a3;
  v6 = 0;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "type");
        if (v11 <= 8)
        {
          if (((1 << v11) & 6) != 0)
          {
            ++v6;
          }
          else
          {
            if (v11 != 5)
            {
              if (a4)
              {
                +[MLFeatureTypeUtils descriptionForType:](MLFeatureTypeUtils, "descriptionForType:", objc_msgSend(v10, "type"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Feature type %@ cannot be vectorized"), v14);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

              }
              v6 = -1;
              goto LABEL_17;
            }
            objc_msgSend(v10, "multiArrayValue");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "count");

            v6 += v13;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

  return v6;
}

+ (id)vectorizeFeaturesProvidedBy:(id)a3 featureNames:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  MLMultiArray *v12;
  void *v13;
  void *v14;
  MLMultiArray *v15;
  MLMultiArray *v16;
  MLMultiArray *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_featureValuesForNames:providedBy:error:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || (v11 = objc_msgSend(a1, "_vectorizedSizeOfFeatureValues:error:", v10, a5), v11 < 0))
  {
    v17 = 0;
  }
  else
  {
    v12 = [MLMultiArray alloc];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[MLMultiArray initWithShape:dataType:error:](v12, "initWithShape:dataType:error:", v14, 65600, a5);

    v16 = objc_retainAutorelease(v15);
    if ((objc_msgSend(a1, "_vectorizeWithoutSizeCheckFeatureValues:intoDoubleVector:stride:error:", v10, -[MLMultiArray mutableBytes](v16, "mutableBytes"), 1, a5) & 1) != 0)v17 = v16;
    else
      v17 = 0;

  }
  return v17;
}

+ (BOOL)_vectorizeWithoutSizeCheckFeatureValues:(id)a3 intoDoubleVector:(double *)a4 stride:(unint64_t)a5 error:(id *)a6
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double *v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  id v28;
  void *v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[112];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v8 = a3;
  v28 = v8;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (!v9)
  {
    v25 = 1;
    goto LABEL_23;
  }
  v10 = 0;
  v11 = *(_QWORD *)v34;
  while (2)
  {
    v12 = 0;
LABEL_4:
    if (*(_QWORD *)v34 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
    v14 = &a4[v10 * a5];
    switch(objc_msgSend(v13, "type"))
    {
      case 0:
      case 3:
      case 4:
      case 6:
      case 7:
      case 8:
        if (!a6)
          goto LABEL_22;
        +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Internal programming error."));
        v25 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_23;
      case 1:
        v15 = (double)objc_msgSend(v13, "int64Value");
        goto LABEL_9;
      case 2:
        objc_msgSend(v13, "doubleValue");
LABEL_9:
        *v14 = v15;
        ++v10;
        goto LABEL_13;
      case 5:
        objc_msgSend(v13, "multiArrayValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v29, "multiArrayBuffer");
        v17 = v16;
        if (v16)
        {
          v18 = v11;
          v19 = a4;
          v20 = *(_QWORD *)(v16 + 80);
          v21 = operator new(8uLL);
          *v21 = v20;
          v31[1] = v21 + 1;
          v31[2] = v21 + 1;
          v31[0] = v21;
          v22 = operator new(8uLL);
          *v22 = a5;
          v30[1] = v22 + 1;
          v30[2] = v22 + 1;
          v30[0] = v22;
          CoreML::MultiArrayBuffer::MultiArrayBuffer((uint64_t)v32, (uint64_t)v14, (uint64_t)v31, (uint64_t)v30, 65600);
          operator delete(v22);
          operator delete(v21);
          v23 = CoreML::MultiArrayBuffer::vectorizeInto(v17, (uint64_t)v32, 0);
          CoreML::MultiArrayBuffer::~MultiArrayBuffer((CoreML::MultiArrayBuffer *)v32);
          v8 = v28;
          if ((v23 & 1) != 0)
          {
            a4 = v19;
            v24 = objc_msgSend(v29, "count");

            v11 = v18;
            v10 += v24;
LABEL_13:
            if (v9 == ++v12)
            {
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
              v25 = 1;
              if (!v9)
                goto LABEL_23;
              continue;
            }
            goto LABEL_4;
          }
        }
        if (a6)
        {
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Failed to vectorize %@ (%p)"), v29, v17);
          *a6 = (id)objc_claimAutoreleasedReturnValue();
        }

LABEL_22:
        v25 = 0;
LABEL_23:

        return v25;
      default:
        goto LABEL_13;
    }
  }
}

+ (BOOL)vectorizeFeaturesProvidedBy:(id)a3 featureNames:(id)a4 intoDoubleVector:(double *)a5 length:(unint64_t)a6 stride:(unint64_t)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;

  v14 = a3;
  v15 = a4;
  objc_msgSend(a1, "_featureValuesForNames:providedBy:error:", v15, v14, a8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
    goto LABEL_7;
  v17 = objc_msgSend(a1, "_vectorizedSizeOfFeatureValues:error:", v16, a8);
  v18 = v17;
  if (v17 < 0)
    goto LABEL_7;
  if (v17 != a6)
  {
    if (!a8)
      goto LABEL_8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Incorrect 'doubleVector' length of %@ (expected %@)"), v19, v20);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
    LOBYTE(a8) = 0;
    goto LABEL_8;
  }
  LOBYTE(a8) = objc_msgSend(a1, "_vectorizeWithoutSizeCheckFeatureValues:intoDoubleVector:stride:error:", v16, a5, a7, a8);
LABEL_8:

  return (char)a8;
}

+ (BOOL)canVectorizeFeatureWithDescription:(id)a3
{
  unint64_t v3;

  v3 = objc_msgSend(a3, "type");
  return (v3 > 8) | (0x26u >> v3) & 1;
}

+ (BOOL)canVectorizeAllFeaturesWithDescriptions:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _BOOL4 v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = +[MLFeatureProviderUtils canVectorizeFeatureWithDescription:](MLFeatureProviderUtils, "canVectorizeFeatureWithDescription:", v8);

        if (!v9)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

@end
