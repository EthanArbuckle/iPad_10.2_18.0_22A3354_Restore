@implementation ATXCoreMLUtilities

+ (id)loadCoreMLModelWithName:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v3 = a3;
  if (!v3)
  {
    __atxlog_handle_default();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[ATXCoreMLUtilities loadCoreMLModelWithName:].cold.1(v4);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", v3, CFSTR("mlmodelc"), 1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
LABEL_10:
    v8 = 0;
    v9 = 0;
    goto LABEL_11;
  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setComputeUnits:", 0);
  v6 = (void *)MEMORY[0x1E0C9E940];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v6, "modelWithContentsOfURL:configuration:error:", v7, v5, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;

  if (v9)
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[ATXCoreMLUtilities loadCoreMLModelWithName:].cold.2((uint64_t)v3, (uint64_t)v9, v10);

  }
LABEL_11:

  return v8;
}

+ (double)scoreForModelOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;

  v5 = a3;
  v6 = objc_msgSend(v5, "type");
  switch(v6)
  {
    case 1:
      v7 = (double)objc_msgSend(v5, "int64Value");
      break;
    case 2:
      objc_msgSend(v5, "doubleValue");
      v7 = v8;
      break;
    case 5:
      objc_msgSend(v5, "multiArrayValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v7 = v12;
      goto LABEL_9;
    case 6:
      objc_msgSend(v5, "dictionaryValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v7 = v14;

LABEL_9:
      break;
    default:
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[ATXCoreMLUtilities scoreForModelOutputValue:outputIndexedSubscript:].cold.1(v6, v9);

      v7 = -31337.0;
      break;
  }

  return v7;
}

+ (void)loadCoreMLModelWithName:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXCoreMLUtilities: Missing model name", v1, 2u);
}

+ (void)loadCoreMLModelWithName:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXCoreMLUtilities: Error initializing %@ model: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)scoreForModelOutputValue:(uint64_t)a1 outputIndexedSubscript:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXCoreMLUtilities - CoreMLModel: No valid outputType found for %ld", (uint8_t *)&v2, 0xCu);
}

@end
