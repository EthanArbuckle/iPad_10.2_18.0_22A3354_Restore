@implementation MLArrayBatchProvider

- (MLArrayBatchProvider)initWithFeatureProviderArray:(NSArray *)array
{
  NSArray *v5;
  MLArrayBatchProvider *v6;
  MLArrayBatchProvider *v7;
  objc_super v9;

  v5 = array;
  v9.receiver = self;
  v9.super_class = (Class)MLArrayBatchProvider;
  v6 = -[MLArrayBatchProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_array, array);

  return v7;
}

- (MLArrayBatchProvider)initWithDictionary:(NSDictionary *)dictionary error:(NSError *)error
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int64_t v13;
  id v14;
  void *v15;
  void *v16;
  NSError *v17;
  void *v18;
  MLArrayBatchProvider *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSError *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  MLDictionaryFeatureProvider *v33;
  MLArrayBatchProvider *v34;
  void *v35;
  void *v37;
  void *v40;
  id v41;
  id obj;
  void *v43;
  uint64_t v44;
  NSDictionary *v45;
  NSError *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v45 = dictionary;
  -[NSDictionary allKeys](v45, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", v4);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v53;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v9)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v10);
      -[NSDictionary objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        if (objc_msgSend(v12, "count") != v8)
          break;
      }
      v8 = objc_msgSend(v12, "count");
      v51 = 0;
      v13 = +[MLFeatureTypeUtils featureTypeForValuesInArray:error:](MLFeatureTypeUtils, "featureTypeForValuesInArray:error:", v12, &v51);
      v14 = v51;
      if (v14)
      {
        v16 = v14;
        +[MLModelErrorUtils errorWithCode:underlyingError:format:](MLModelErrorUtils, "errorWithCode:underlyingError:format:", 0, v14, CFSTR("Failed to determine type of feature '%@'."), v11);
        v17 = (NSError *)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v11);

      if (v7 == ++v10)
      {
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_13;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("The must be the same value count for each feature. Feature '%@' has %@ values. Expected %@"), v11, v16, v18);
    v17 = (NSError *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    if (!v17)
      goto LABEL_19;
    if (error)
    {
      v17 = objc_retainAutorelease(v17);
      v19 = 0;
      *error = v17;
    }
    else
    {
      v19 = 0;
    }
    v34 = self;
  }
  else
  {
    v8 = 0;
LABEL_13:

LABEL_19:
    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
    v21 = (void *)v20;
    v17 = 0;
    if (v8)
    {
      v44 = 0;
      v37 = (void *)v20;
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", v40);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = 0u;
        v48 = 0u;
        v49 = 0u;
        v50 = 0u;
        v41 = obj;
        v22 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v48;
          while (2)
          {
            v25 = 0;
            v26 = v17;
            do
            {
              if (*(_QWORD *)v48 != v24)
                objc_enumerationMutation(v41);
              v27 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v25);
              -[NSDictionary objectForKeyedSubscript:](v45, "objectForKeyedSubscript:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "objectAtIndexedSubscript:", v44);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v5, "objectForKeyedSubscript:", v27);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v30, "integerValue");

              v46 = v26;
              +[MLFeatureValue featureValueOfType:fromObject:error:](MLFeatureValue, "featureValueOfType:fromObject:error:", v31, v29, &v46);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = v46;

              if (!v32)
              {
                if (error)
                {
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v44);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();

                }
                v19 = 0;
                v34 = self;
                v21 = v37;
                goto LABEL_34;
              }
              objc_msgSend(v43, "setObject:forKeyedSubscript:", v32, v27);

              ++v25;
              v26 = v17;
            }
            while (v23 != v25);
            v23 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
            if (v23)
              continue;
            break;
          }
        }

        v33 = -[MLDictionaryFeatureProvider initWithFeatureValueDictionary:]([MLDictionaryFeatureProvider alloc], "initWithFeatureValueDictionary:", v43);
        v21 = v37;
        objc_msgSend(v37, "addObject:", v33);

        ++v44;
      }
      while (v44 != v8);
    }
    v34 = -[MLArrayBatchProvider initWithFeatureProviderArray:](self, "initWithFeatureProviderArray:", v21);
    v19 = v34;
LABEL_34:

  }
  return v19;
}

- (int64_t)count
{
  return -[NSArray count](self->_array, "count");
}

- (id)featuresAtIndex:(int64_t)a3
{
  int64_t v3;

  v3 = a3;
  if (a3 < 0)
    v3 = -[NSArray count](self->_array, "count") + a3;
  return -[NSArray objectAtIndexedSubscript:](self->_array, "objectAtIndexedSubscript:", v3);
}

- (NSArray)array
{
  return self->_array;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
