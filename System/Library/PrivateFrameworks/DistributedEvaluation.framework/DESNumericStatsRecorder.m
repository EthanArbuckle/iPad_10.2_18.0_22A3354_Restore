@implementation DESNumericStatsRecorder

- (BOOL)record:(id)a3 data:(id)a4 dataTypeContent:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  char isKindOfClass;
  DESDecimalEncoder *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  DESNumericMetadataEncoder *v23;
  void *v24;
  DESDPFloatValueRecorder *v25;
  _BOOL4 v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  void *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v39;
  id v40;
  DESDecimalEncoder *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *obj;
  id *v45;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  NSObject *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v12, "count")
    && (objc_msgSend(v12, "objectAtIndexedSubscript:", 0),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v15,
        (isKindOfClass & 1) != 0))
  {
    v17 = objc_alloc_init(DESDecimalEncoder);
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    obj = v12;
    v43 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v43)
    {
      v39 = v12;
      v42 = *(_QWORD *)v48;
      v40 = v14;
      v41 = v17;
      v45 = a7;
LABEL_5:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v42)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v18);
        -[DESDecimalEncoder encodeDecimalData:forKey:withSchemas:errorOut:](v17, "encodeDecimalData:forKey:withSchemas:errorOut:", v19, v11, v13, a7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[DESLogging coreChannel](DESLogging, "coreChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (!v20)
          break;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v52 = v11;
          v53 = 2112;
          v54 = v30;
          _os_log_debug_impl(&dword_1B96E5000, v22, OS_LOG_TYPE_DEBUG, "key=%@, encoded data length %@ successfully", buf, 0x16u);

        }
        v23 = objc_alloc_init(DESNumericMetadataEncoder);
        -[DESNumericMetadataEncoder encodeNumberVector:toLength:](v23, "encodeNumberVector:toLength:", v20, objc_msgSend(v20, "count"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_alloc_init(DESDPFloatValueRecorder);
        v26 = -[DESNumericStatsRecorder donateData:toKey:withMetadata:recorder:](self, "donateData:toKey:withMetadata:recorder:", v24, v11, v14, v25);
        if (v26)
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v11;
            _os_log_debug_impl(&dword_1B96E5000, v27, OS_LOG_TYPE_DEBUG, "key=%@, successfully recorded data", buf, 0xCu);
          }
        }
        else
        {
          v28 = v13;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@, failed to record data"), v11);
          v27 = objc_claimAutoreleasedReturnValue();
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v27;
            _os_log_error_impl(&dword_1B96E5000, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
          }

          if (v45)
          {
            objc_msgSend((id)objc_opt_class(), "constructErrorWith:", v27);
            *v45 = (id)objc_claimAutoreleasedReturnValue();
          }
          v13 = v28;
          v14 = v40;
        }

        if (!v26)
        {
          v31 = 0;
          v12 = v39;
          v17 = v41;
          goto LABEL_28;
        }
        ++v18;
        v17 = v41;
        a7 = v45;
        if (v43 == v18)
        {
          v31 = 1;
          v43 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
          if (v43)
            goto LABEL_5;
          goto LABEL_33;
        }
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[DESNumericStatsRecorder record:data:dataTypeContent:metadata:errorOut:].cold.2(v19, (uint64_t)v11, v22);

      v31 = 0;
LABEL_33:
      v12 = v39;
      goto LABEL_28;
    }
    v31 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@, data to be encoded is malformed, should be a non-empty array of dictionaries"), v11);
    v17 = (DESDecimalEncoder *)objc_claimAutoreleasedReturnValue();
    if (a7)
    {
      objc_msgSend((id)objc_opt_class(), "constructErrorWith:", v17);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      +[DESAdaptiveClipping computeClippingIndicator:clippingBound:scale:clippingIndicator:].cold.2((uint64_t)v17, obj, v32, v33, v34, v35, v36, v37);
    v31 = 0;
  }
LABEL_28:

  return v31;
}

- (BOOL)record:(id)a3 data:(id)a4 encodingSchema:(id)a5 metadata:(id)a6 errorOut:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dataContentTypes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("dataTypeContent"));
    v17 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1E0C99DA0];
      v21 = *MEMORY[0x1E0C99778];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("key=%@, '%@' or '%@' has wrong type, value=%@"), v12, CFSTR("dataContentTypes"), CFSTR("dataTypeContent"), v17);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "exceptionWithName:reason:userInfo:", v21, v22, 0);
      v23 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v23);
    }
    v16 = (void *)v17;
  }
  v18 = -[DESNumericStatsRecorder record:data:dataTypeContent:metadata:errorOut:](self, "record:data:dataTypeContent:metadata:errorOut:", v12, v13, v16, v15, a7);

  return v18;
}

+ (id)constructErrorWith:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 2013, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)donateData:(id)a3 toKey:(id)a4 withMetadata:(id)a5 recorder:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  char v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  DESGaussianAlgorithmParameters *v25;
  DESGaussianAlgorithmParameters *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  char v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];
  uint8_t buf[4];
  id v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((unint64_t)objc_msgSend(v9, "length") > 0xE7EF0)
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v44 = v10;
      v45 = 2048;
      v46 = objc_msgSend(v9, "length");
      v47 = 1024;
      v48 = 950000;
      _os_log_error_impl(&dword_1B96E5000, v13, OS_LOG_TYPE_ERROR, "key=%@, data length %lu bytes is larger than limit %u", buf, 0x1Cu);
    }
LABEL_16:
    v32 = 0;
    goto LABEL_17;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("epsilon"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_14:
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[DESNumericStatsRecorder donateData:toKey:withMetadata:recorder:].cold.3((uint64_t)v10, v13);
    goto LABEL_16;
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("delta"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_14;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MomentsAccountantParameters"));
  v13 = objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MomentsAccountantParameters"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v18 = objc_opt_isKindOfClass();

    if ((v18 & 1) == 0)
    {
      +[DESLogging coreChannel](DESLogging, "coreChannel");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[DESNumericStatsRecorder donateData:toKey:withMetadata:recorder:].cold.2((uint64_t)v10, v13, v34);
      goto LABEL_16;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("MomentsAccountantParameters"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("epsilon"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("delta"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23;

  v25 = -[DESGaussianAlgorithmParameters initWith:epsilon:delta:clippingBound:momentsAccountantParameters:]([DESGaussianAlgorithmParameters alloc], "initWith:epsilon:delta:clippingBound:momentsAccountantParameters:", v10, v13, v21, v24, 1.0);
  v26 = v25;
  if (v25)
  {
    -[DESGaussianAlgorithmParameters addPerChunkParametersWith:numChunks:](v25, "addPerChunkParametersWith:numChunks:", 1, 1.0);
    v27 = (void *)MEMORY[0x1E0C99E08];
    -[DESGaussianAlgorithmParameters parameters](v26, "parameters", *MEMORY[0x1E0D1D358], CFSTR("AlgorithmParameters"), &stru_1E706F800);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dictionaryWithDictionary:", v29);
    v30 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DediscoTaskConfig"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
      -[NSObject setObject:forKeyedSubscript:](v30, "setObject:forKeyedSubscript:", v31, CFSTR("DediscoTaskConfig"));
    v32 = objc_msgSend(v12, "record:data:metadata:", v10, v9, v30);

  }
  else
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[DESNumericStatsRecorder donateData:toKey:withMetadata:recorder:].cold.1((uint64_t)v10, v30, v35, v36, v37, v38, v39, v40);
    v32 = 0;
  }

LABEL_17:
  return v32;
}

- (void)record:(NSObject *)a3 data:dataTypeContent:metadata:errorOut:.cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a2;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_1_2(&dword_1B96E5000, a3, v6, "key=%@, failed to encode decimals: '%@'", (uint8_t *)&v7);

}

- (void)donateData:(uint64_t)a3 toKey:(uint64_t)a4 withMetadata:(uint64_t)a5 recorder:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B96E5000, a2, a3, "key=%@, failed to initialize privacy parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)donateData:(uint64_t)a3 toKey:withMetadata:recorder:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = CFSTR("MomentsAccountantParameters");
  OUTLINED_FUNCTION_1_2(&dword_1B96E5000, a2, a3, "key=%@, metadata '%@' is malformed, if present, must be a dictionary", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)donateData:(uint64_t)a1 toKey:(NSObject *)a2 withMetadata:recorder:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const __CFString *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 138412802;
  v3 = a1;
  v4 = 2112;
  v5 = CFSTR("epsilon");
  v6 = 2112;
  v7 = CFSTR("delta");
  _os_log_error_impl(&dword_1B96E5000, a2, OS_LOG_TYPE_ERROR, "key=%@, metadata '%@' or '%@' is malformed, must be valid real numbers", (uint8_t *)&v2, 0x20u);
}

@end
