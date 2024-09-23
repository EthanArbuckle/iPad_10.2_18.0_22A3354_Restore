@implementation SGExtractionModelCoreMLFeatureWrapper

- (SGExtractionModelCoreMLFeatureWrapper)initWithFeatureDict:(id)a3
{
  id v5;
  SGExtractionModelCoreMLFeatureWrapper *v6;
  SGExtractionModelCoreMLFeatureWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGExtractionModelCoreMLFeatureWrapper;
  v6 = -[SGExtractionModelCoreMLFeatureWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_featureDict, a3);

  return v7;
}

- (SGExtractionModelCoreMLFeatureWrapper)initWithFeatureProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SGExtractionModelCoreMLFeatureWrapper *v16;
  NSObject *v17;
  uint8_t v19[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "featureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v4, "featureValueForName:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (!v12
          || (objc_msgSend(v12, "multiArrayValue"),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              !v14))
        {
          sgLogHandle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v19 = 0;
            _os_log_error_impl(&dword_1C3607000, v17, OS_LOG_TYPE_ERROR, "SGExtractionModelCoreMLWrapper: Inconsistent MLFeatureProvider passed", v19, 2u);
          }

          v16 = 0;
          goto LABEL_14;
        }
        objc_msgSend(v13, "multiArrayValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v8)
        continue;
      break;
    }
  }

  self = -[SGExtractionModelCoreMLFeatureWrapper initWithFeatureDict:](self, "initWithFeatureDict:", v5);
  v16 = self;
LABEL_14:

  return v16;
}

- (id)featureValueForName:(id)a3
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_featureDict, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithMultiArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (NSSet)featureNames
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  -[NSDictionary allKeys](self->_featureDict, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  return (NSSet *)v5;
}

- (id)valueForKey:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_featureDict, "objectForKeyedSubscript:", a3);
}

- (NSDictionary)featureDict
{
  return self->_featureDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDict, 0);
}

@end
