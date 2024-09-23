@implementation _ATXScoreInterpreterCoreMLModel

- (_ATXScoreInterpreterCoreMLModel)initWithModelName:(id)a3 features:(id)a4 outputSpecification:(id)a5
{
  id v6;
  _ATXScoreInterpreterCoreMLModel *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _PASLock *lock;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_ATXScoreInterpreterCoreMLModel;
  v7 = -[_ATXScoreInterpreterCoreMLModel init](&v14, sel_init);
  if (v7)
  {
    v8 = (_QWORD *)objc_opt_new();
    +[_ATXScoreInterpreterCoreMLModel coreMLModelForCoreMLModelName:](_ATXScoreInterpreterCoreMLModel, "coreMLModelForCoreMLModelName:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v8[1];
    v8[1] = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v8);
    lock = v7->_lock;
    v7->_lock = (_PASLock *)v11;

  }
  return v7;
}

+ (id)coreMLModelForCoreMLModelName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF8CF0], "pathForResource:ofType:isDirectory:", v3, CFSTR("mlmodelc"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C9E940];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v5, "modelWithContentsOfURL:error:", v6, &v18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v18;

    if (v8)
    {
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[_ATXScoreInterpreterCoreMLModel coreMLModelForCoreMLModelName:].cold.2((uint64_t)v3, (uint64_t)v8, v9);

    }
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_ATXScoreInterpreterCoreMLModel coreMLModelForCoreMLModelName:].cold.1(v8, v10, v11, v12, v13, v14, v15, v16);
    v7 = 0;
  }

  return v7;
}

- (id)getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures:(id)a3 outputSpecification:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSArray *v12;
  NSArray *coreMLInputFeatures;
  NSString *v14;
  NSString *coreMLModelOutputName;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, void *);
  void *v25;
  id v26;
  id v27;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __121___ATXScoreInterpreterCoreMLModel_getArgumentsToEvaluateByInitializingInstanceVariablesFromFeatures_outputSpecification___block_invoke;
  v25 = &unk_1E82E1D10;
  v10 = v9;
  v26 = v10;
  v11 = v8;
  v27 = v11;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v22);

  v12 = (NSArray *)objc_msgSend(v11, "copy", v22, v23, v24, v25);
  coreMLInputFeatures = self->_coreMLInputFeatures;
  self->_coreMLInputFeatures = v12;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputName"));
  v14 = (NSString *)objc_claimAutoreleasedReturnValue();
  coreMLModelOutputName = self->_coreMLModelOutputName;
  self->_coreMLModelOutputName = v14;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("outputIndexedSubscript"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v10, "mutableCopy");
  v18 = v17;
  if (v16)
  {
    objc_msgSend(v17, "addObject:", v16);
    v19 = 1;
  }
  else
  {
    v19 = 0;
  }
  self->_hasOutputIndexedSubscript = v19;
  v20 = (void *)objc_msgSend(v18, "copy");

  return v20;
}

- (unint64_t)numberOfFeatures
{
  return -[NSArray count](self->_coreMLInputFeatures, "count");
}

- (id)featureAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_coreMLInputFeatures, "objectAtIndexedSubscript:", a3);
}

- (double)predictionForEvaluatedFeatures:(id)a3 withOutputIndexedSubscript:(int64_t)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  _PASLock *lock;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(_QWORD *, uint64_t);
  void *v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  id obj;
  uint64_t v43;
  _QWORD v44[4];
  id v45;

  v6 = a3;
  v43 = 0;
  v44[0] = &v43;
  v44[1] = 0x3032000000;
  v44[2] = __Block_byref_object_copy__42;
  v44[3] = __Block_byref_object_dispose__42;
  v45 = 0;
  v7 = objc_alloc(MEMORY[0x1E0C9E8F8]);
  v8 = (id *)(v44[0] + 40);
  obj = *(id *)(v44[0] + 40);
  v9 = (void *)objc_msgSend(v7, "initWithDictionary:error:", v6, &obj);
  objc_storeStrong(v8, obj);
  if (*(_QWORD *)(v44[0] + 40))
  {
    __atxlog_handle_default();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[_ATXScoreInterpreterCoreMLModel predictionForEvaluatedFeatures:withOutputIndexedSubscript:].cold.2((uint64_t)v44, v10, v11, v12, v13, v14, v15, v16);

    v17 = -31337.0;
  }
  else
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__42;
    v40 = __Block_byref_object_dispose__42;
    v41 = 0;
    lock = self->_lock;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __93___ATXScoreInterpreterCoreMLModel_predictionForEvaluatedFeatures_withOutputIndexedSubscript___block_invoke;
    v32 = &unk_1E82E1D38;
    v34 = &v36;
    v33 = v9;
    v35 = &v43;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", &v29);
    if (*(_QWORD *)(v44[0] + 40))
    {
      __atxlog_handle_default();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_ATXScoreInterpreterCoreMLModel predictionForEvaluatedFeatures:withOutputIndexedSubscript:].cold.1((uint64_t)v44, v19, v20, v21, v22, v23, v24, v25);

      v17 = -31337.0;
    }
    else
    {
      objc_msgSend((id)v37[5], "featureValueForName:", self->_coreMLModelOutputName, v29, v30, v31, v32);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ATXScoreInterpreterCoreMLModel scoreForOutputValue:outputIndexedSubscript:](_ATXScoreInterpreterCoreMLModel, "scoreForOutputValue:outputIndexedSubscript:", v26, a4);
      v17 = v27;

    }
    _Block_object_dispose(&v36, 8);

  }
  _Block_object_dispose(&v43, 8);

  return v17;
}

+ (double)scoreForOutputValue:(id)a3 outputIndexedSubscript:(int64_t)a4
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;

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
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v7 = v18;
      goto LABEL_9;
    case 6:
      objc_msgSend(v5, "dictionaryValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v7 = v20;

LABEL_9:
      break;
    default:
      __atxlog_handle_default();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[_ATXScoreInterpreterCoreMLModel scoreForOutputValue:outputIndexedSubscript:].cold.1(v6, v9, v10, v11, v12, v13, v14, v15);

      v7 = -31337.0;
      break;
  }

  return v7;
}

- (BOOL)hasOutputIndexedSubscript
{
  return self->_hasOutputIndexedSubscript;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_coreMLInputFeatures, 0);
  objc_storeStrong((id *)&self->_coreMLModelOutputName, 0);
}

+ (void)coreMLModelForCoreMLModelName:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "error finding %@ model in assets", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)coreMLModelForCoreMLModelName:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "error initializing %@ model: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)predictionForEvaluatedFeatures:(uint64_t)a3 withOutputIndexedSubscript:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ScoreInterpreter - CoreMLModel - Error in predictionFromFeatures: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)predictionForEvaluatedFeatures:(uint64_t)a3 withOutputIndexedSubscript:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ScoreInterpreter - CoreMLModel - Error in initializing MLDictionaryFeatureProvider: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)scoreForOutputValue:(uint64_t)a3 outputIndexedSubscript:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ScoreInterpreter - CoreMLModel - No valid outputType found for %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
