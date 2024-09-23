@implementation SGContactSharingModel

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  SGTransformerInstance *v18;
  NSObject *v19;
  NSObject *v20;
  int v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D19EC8], "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filesystemPathForAssetDataRelativePath:", CFSTR("PQT_ContactSharing_TrainingTransformers.plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithContentsOfFile:", v5);
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "objectForKeyedSubscript:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        sgLogHandle();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v22 = 138412290;
          v23 = v3;
          _os_log_error_impl(&dword_1C3607000, v10, OS_LOG_TYPE_ERROR, "SGContactSharingModel - Could not find transformer instance for language: %@", (uint8_t *)&v22, 0xCu);
        }
        v18 = 0;
        goto LABEL_19;
      }
      v9 = objc_alloc(MEMORY[0x1E0D81058]);
      v10 = objc_msgSend(v9, "initWithClassNameKey:", *MEMORY[0x1E0D810A0]);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MODEL_FEATURIZER"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C9AA60];
      v13 = MEMORY[0x1E0C9AA70];
      -[NSObject readObjectWithPlist:chunks:context:](v10, "readObjectWithPlist:chunks:context:", v11, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc(MEMORY[0x1E0D81060]);
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MODEL_SOURCE_SESSION_DESCRIPTOR"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v15, "initWithPlist:chunks:context:", v16, v12, v13);

      if (v14 && v17)
      {
        v18 = -[SGTransformerInstance initWithTransformer:sessionDescriptor:modelClass:]([SGTransformerInstance alloc], "initWithTransformer:sessionDescriptor:modelClass:", v14, v17, objc_opt_class());
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      sgLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v22) = 0;
        _os_log_fault_impl(&dword_1C3607000, v20, OS_LOG_TYPE_FAULT, "SGContactSharing Model - Could not initialize featurizer and sessionDescriptor from config.", (uint8_t *)&v22, 2u);
      }

      if (!_PASEvaluateLogFaultAndProbCrashCriteria())
      {
        v18 = 0;
        goto LABEL_18;
      }
LABEL_21:
      abort();
    }
  }
  sgLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    v22 = 138412290;
    v23 = v5;
    _os_log_fault_impl(&dword_1C3607000, v19, OS_LOG_TYPE_FAULT, "SGContactSharingModel - Invalid model config for path: %@", (uint8_t *)&v22, 0xCu);
  }

  if (_PASEvaluateLogFaultAndProbCrashCriteria())
    goto LABEL_21;
  v18 = 0;
LABEL_20:

  return v18;
}

+ (int64_t)labelForProbabilities:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count") != 7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGContactSharingModel.m"), 71, CFSTR("SGContactSharingModel - Provided probabilities (count %ld) do not match valid SGContactSharingLabels (count %ld)."), objc_msgSend(v5, "count"), 7);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v14, "doubleValue");
        if (v15 > v12)
        {
          v10 = v9 + i;
          objc_msgSend(v14, "doubleValue");
          v12 = v16;
        }
      }
      v9 += v8;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
