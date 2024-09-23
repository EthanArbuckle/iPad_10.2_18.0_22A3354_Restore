@implementation MLProgramTrainer

- (MLProgramTrainer)initWithProgram:(id)a3 learningRate:(double)a4 error:(id *)a5
{
  id v9;
  MLProgramTrainer *v10;
  MLProgramEvaluator *v11;
  MLProgramEvaluator *evaluator;
  MLProgramEvaluator *v13;
  uint64_t v14;
  MLProgramContext *context;
  MLProgramContext *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t v26[8];
  objc_super v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MLProgramTrainer;
  v10 = -[MLProgramTrainer init](&v27, sel_init);
  if (!v10)
    goto LABEL_6;
  if ((objc_msgSend(v9, "conformsToProtocol:", &unk_1EE441718) & 1) == 0)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v26 = 0;
      _os_log_error_impl(&dword_19C486000, v20, OS_LOG_TYPE_ERROR, "The program argument to MLProgramTrainer is not conforming to some internal requirements. Do not implement MLProgram protocol by yourself. Use the one returned by MLModel's .program property.", v26, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The program argument to MLProgramTrainer is not conforming to some internal requirements. Do not implement MLProgram protocol by yourself. Use the one returned by MLModel's .program property."));
    goto LABEL_10;
  }
  objc_storeStrong((id *)&v10->_program, a3);
  v10->_learningRate = a4;
  v11 = -[MLProgramEvaluator initWithProgram:error:]([MLProgramEvaluator alloc], "initWithProgram:error:", v9, a5);
  evaluator = v10->_evaluator;
  v10->_evaluator = v11;

  v13 = v10->_evaluator;
  if (!v13
    || (v14 = -[MLProgramEvaluator newContextAndReturnError:](v13, "newContextAndReturnError:", a5),
        context = v10->_context,
        v10->_context = (MLProgramContext *)v14,
        context,
        (v16 = v10->_context) == 0))
  {
LABEL_10:
    a5 = 0;
    goto LABEL_11;
  }
  -[MLProgramContext functionNameToInputLayersNames](v16, "functionNameToInputLayersNames");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKey:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
LABEL_6:
    a5 = v10;
    goto LABEL_11;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v26 = 0;
    _os_log_error_impl(&dword_19C486000, v22, OS_LOG_TYPE_ERROR, "The program has no train function.", v26, 2u);
  }

  if (a5)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("The program has no train function."));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 60, v25);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
LABEL_11:

  return (MLProgramTrainer *)a5;
}

- (id)trainUsingTrainingData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLProgramTrainer trainUsingTrainingData:evaluationMetricNames:error:](self, "trainUsingTrainingData:evaluationMetricNames:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)trainUsingTrainingData:(id)a3 evaluationMetricNames:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLProgramEvaluationResult *v10;
  MLProgramEvaluationResult *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  MLDictionaryFeatureProvider *v39;
  MLProgramEvaluationResult *v40;
  id v41;
  id *v43;
  id v44;
  id v45;
  MLProgramEvaluationResult *v46;
  void *v47;
  void *contexta;
  MLProgramTrainer *context;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!objc_msgSend(v9, "count"))
  {
    v10 = objc_alloc_init(MLProgramEvaluationResult);
LABEL_5:
    v46 = v10;
    v45 = v9;
    if (objc_msgSend(v8, "count") < 1)
    {
      v14 = 0;
      v13 = 0;
LABEL_15:
      v50 = v13;
      v44 = v8;
      v25 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
      -[MLProgramTrainer orderedTrainableWeightsNames](self, "orderedTrainableWeightsNames");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      context = self;
      -[MLProgramTrainer context](self, "context");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "functionNameToStateMap");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = 0u;
      v54 = 0u;
      v51 = 0u;
      v52 = 0u;
      v31 = v26;
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v52;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v52 != v34)
              objc_enumerationMutation(v31);
            v36 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
            objc_msgSend(v30, "objectForKeyedSubscript:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (v37)
            {
              objc_msgSend(v14, "featureValueForName:", v37);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "setObject:forKeyedSubscript:", v38, v36);

            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
        }
        while (v33);
      }

      v39 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v25, 0);
      -[MLProgramTrainer setCurrentUpdatedWeights:](context, "setCurrentUpdatedWeights:", v39);

      v40 = v46;
      v11 = v46;

      v8 = v44;
      v9 = v45;
    }
    else
    {
      v43 = a5;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      while (1)
      {
        v47 = v14;
        contexta = (void *)MEMORY[0x1A1AD6ED8]();
        objc_msgSend(v8, "featuresAtIndex:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLProgramTrainer attachLearningRateToFeatures:](self, "attachLearningRateToFeatures:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLProgramTrainer evaluator](self, "evaluator");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLProgramTrainer context](self, "context");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v13;
        objc_msgSend(v17, "evaluateFunction:arguments:context:error:", v18, v16, v19, &v55);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = v55;

        objc_autoreleasePoolPop(contexta);
        if (!v14)
          break;
        if (v12 == objc_msgSend(v8, "count") - 1)
        {
          -[MLProgramTrainer context](self, "context");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "trainFunctionLossName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "featureValueForName:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "multiArrayValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
          {
            objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "doubleValue");
            -[MLProgramEvaluationResult setLoss:](v46, "setLoss:");

          }
        }
        ++v12;
        v13 = v50;
        if (objc_msgSend(v8, "count") <= v12)
          goto LABEL_15;
      }
      v9 = v45;
      if (v43)
      {
        v41 = objc_retainAutorelease(v50);
        v11 = 0;
        *v43 = v41;
        v40 = v46;
        goto LABEL_26;
      }
      v11 = 0;
      v40 = v46;
    }
    v41 = v50;
LABEL_26:

    goto LABEL_27;
  }
  -[MLProgramTrainer evaluateUsingTestData:evaluationMetricNames:evaluateOnTrainFunction:error:](self, "evaluateUsingTestData:evaluationMetricNames:evaluateOnTrainFunction:error:", v8, v9, 1, a5);
  v10 = (MLProgramEvaluationResult *)objc_claimAutoreleasedReturnValue();
  if (v10)
    goto LABEL_5;
  v11 = 0;
LABEL_27:

  return v11;
}

- (id)evaluateUsingTestData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = a3;
  objc_msgSend(v6, "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLProgramTrainer evaluateUsingTestData:evaluationMetricNames:error:](self, "evaluateUsingTestData:evaluationMetricNames:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)evaluateUsingTestData:(id)a3 evaluationMetricNames:(id)a4 error:(id *)a5
{
  return -[MLProgramTrainer evaluateUsingTestData:evaluationMetricNames:evaluateOnTrainFunction:error:](self, "evaluateUsingTestData:evaluationMetricNames:evaluateOnTrainFunction:error:", a3, a4, 0, a5);
}

- (id)evaluateUsingTestData:(id)a3 evaluationMetricNames:(id)a4 evaluateOnTrainFunction:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  MLProgramEvaluationResult *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  MLArrayBatchProvider *v31;
  MLProgramEvaluationResult *v32;
  id *v34;
  MLProgramEvaluationResult *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  void *v40;
  id v41;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = objc_alloc_init(MLProgramEvaluationResult);
  v36 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "forward");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "train");
    v14 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v14;
  }
  if (objc_msgSend(v10, "count") < 1)
  {
    v24 = 0;
LABEL_17:
    if (objc_msgSend(v11, "count"))
    {
      v31 = -[MLArrayBatchProvider initWithFeatureProviderArray:]([MLArrayBatchProvider alloc], "initWithFeatureProviderArray:", v36);
      -[MLProgramEvaluationResult setEvaluationMetrics:](v12, "setEvaluationMetrics:", v31);

    }
    v32 = v12;
  }
  else
  {
    v34 = a6;
    v35 = v12;
    v40 = v13;
    v37 = v10;
    v38 = v11;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    while (1)
    {
      v18 = (void *)MEMORY[0x1A1AD6ED8]();
      objc_msgSend(v10, "featuresAtIndex:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v39)
      {
        -[MLProgramTrainer attachLearningRateToFeatures:](self, "attachLearningRateToFeatures:", v19);
        v20 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v20;
      }
      -[MLProgramTrainer evaluator](self, "evaluator", v34);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLProgramTrainer context](self, "context");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v16;
      objc_msgSend(v21, "evaluateFunction:arguments:context:updateContext:error:", v40, v19, v22, 0, &v41);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v41;

      objc_autoreleasePoolPop(v18);
      if (!v23)
        break;
      v17 = v23;
      v10 = v37;
      if (objc_msgSend(v38, "count"))
      {
        +[MLFeatureProviderUtils providerWithSubsetOfFeaturesNamed:providedBy:](MLFeatureProviderUtils, "providerWithSubsetOfFeaturesNamed:providedBy:", v38, v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "addObject:", v25);

      }
      if (v15 == objc_msgSend(v37, "count") - 1)
      {
        -[MLProgramTrainer context](self, "context");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "forwardFunctionLossName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "featureValueForName:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "multiArrayValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          -[MLProgramEvaluationResult setLoss:](v35, "setLoss:");

        }
      }
      ++v15;
      v16 = v24;
      if (objc_msgSend(v37, "count") <= v15)
      {

        v11 = v38;
        v12 = v35;
        v13 = v40;
        goto LABEL_17;
      }
    }
    v10 = v37;
    v11 = v38;
    if (v34)
    {
      v24 = objc_retainAutorelease(v24);
      v32 = 0;
      *v34 = v24;
    }
    else
    {
      v32 = 0;
    }
    v12 = v35;
    v13 = v40;
  }

  return v32;
}

- (id)attachLearningRateToFeatures:(id)a3
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
  void *v16;
  void *v17;
  MLDictionaryFeatureProvider *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "featureNames", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v4, "featureValueForName:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[MLProgramTrainer learningRate](self, "learningRate");
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[MLMultiArray doubleMultiArrayWithShape:valueArray:error:](MLMultiArray, "doubleMultiArrayWithShape:valueArray:error:", &unk_1E3DA2918, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    +[MLFeatureValue featureValueWithMultiArray:](MLFeatureValue, "featureValueWithMultiArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("learning_rate_0"));

    v18 = -[MLDictionaryFeatureProvider initWithDictionary:error:]([MLDictionaryFeatureProvider alloc], "initWithDictionary:error:", v5, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Failed to add lr to training data."));
    v18 = 0;
  }

  return v18;
}

- (MLModeling)inferenceModel
{
  NSObject *v2;
  uint8_t v4[16];

  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_19C486000, v2, OS_LOG_TYPE_ERROR, ".inferenceModel property is not implemented yet. See rdar://81339842.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR(".inferenceModel property is not implemented yet. See rdar://81339842."));
  return 0;
}

- (id)flattenFeatures:(id)a3 orderedFeatures:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  MLMultiArray *v27;
  void *v28;
  void *v29;
  MLMultiArray *v30;
  uint64_t v31;
  id v33;
  id obj;
  id obja;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  void *v44;
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v41;
    v10 = *MEMORY[0x1E0C99768];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v41 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(v5, "featureValueForName:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "multiArrayValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "dataType") != 65568)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", objc_msgSend(v13, "dataType"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v47 = v18;
            _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "The trainable weights should be Float32, but it is %@.", buf, 0xCu);

          }
          v15 = (void *)MEMORY[0x1E0C99DA0];
          +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", objc_msgSend(v13, "dataType"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "raise:format:", v10, CFSTR("The trainable weights should be Float32, but it is %@."), v16);

        }
        v17 = objc_msgSend(v13, "count");
        v8 += objc_msgSend(v13, "numberOfBytesPerElement") * v17;

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithCapacity:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLength:", v8);
  v33 = objc_retainAutorelease(v19);
  v20 = objc_msgSend(v33, "mutableBytes");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obja = obj;
  v21 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v37 != v23)
          objc_enumerationMutation(obja);
        objc_msgSend(v5, "featureValueForName:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "multiArrayValue");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = [MLMultiArray alloc];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v26, "count"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v28;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[MLMultiArray initWithDataPointer:shape:dataType:strides:deallocator:error:](v27, "initWithDataPointer:shape:dataType:strides:deallocator:error:", v20, v29, objc_msgSend(v26, "dataType"), &unk_1E3DA2930, 0, 0);

        objc_msgSend(v26, "vectorizeIntoMultiArray:storageOrder:error:", v30, 0, 0);
        v31 = -[MLMultiArray count](v30, "count");
        v20 += -[MLMultiArray numberOfBytesPerElement](v30, "numberOfBytesPerElement") * v31;

      }
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v22);
  }

  return v33;
}

- (id)orderedTrainableWeightsNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  -[MLProgramTrainer context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "functionNameToInputLayersNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "forward");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[MLProgramTrainer context](self, "context", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "functionNameToOutputLayersNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "init");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v7, "containsObject:", v16))
          objc_msgSend(v3, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v3;
}

- (id)copyCurrentTrainingDelta
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  const float *v12;
  id v13;
  const float *v14;
  id v15;
  MLProgramTrainingDelta *v16;
  NSObject *v17;
  MLProgramTrainingDelta *v18;
  MLProgramTrainingDelta *v19;
  uint8_t v21[16];

  -[MLProgramTrainer evaluator](self, "evaluator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "newContextAndReturnError:", 0);

  if (v4)
  {
    -[MLProgramTrainer orderedTrainableWeightsNames](self, "orderedTrainableWeightsNames");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executionState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLProgramTrainer flattenFeatures:orderedFeatures:](self, "flattenFeatures:orderedFeatures:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[MLProgramTrainer currentUpdatedWeights](self, "currentUpdatedWeights");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[MLProgramTrainer currentUpdatedWeights](self, "currentUpdatedWeights");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLProgramTrainer flattenFeatures:orderedFeatures:](self, "flattenFeatures:orderedFeatures:", v9, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_retainAutorelease(v7);
      v12 = (const float *)objc_msgSend(v11, "bytes");
      v13 = objc_retainAutorelease(v10);
      v14 = (const float *)objc_msgSend(v13, "bytes");
      v15 = objc_retainAutorelease(v13);
      vDSP_vsub(v12, 1, v14, 1, (float *)objc_msgSend(v15, "mutableBytes"), 1, (unint64_t)objc_msgSend(v11, "length") >> 2);
      v16 = [MLProgramTrainingDelta alloc];
    }
    else
    {
      v19 = [MLProgramTrainingDelta alloc];
      objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", objc_msgSend(v7, "length"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v19;
    }
    v18 = -[MLProgramTrainingDelta initWithFlattenedModelUpdate:](v16, "initWithFlattenedModelUpdate:", v15);

  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_error_impl(&dword_19C486000, v17, OS_LOG_TYPE_ERROR, "The copyCurrentTrainingDelta failed to extract initial weights.", v21, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The copyCurrentTrainingDelta failed to extract initial weights."));
    v18 = 0;
  }

  return v18;
}

- (double)learningRate
{
  return self->_learningRate;
}

- (void)setLearningRate:(double)a3
{
  self->_learningRate = a3;
}

- (MLProgramInternal)program
{
  return self->_program;
}

- (void)setProgram:(id)a3
{
  objc_storeStrong((id *)&self->_program, a3);
}

- (MLProgramContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (MLProgramEvaluator)evaluator
{
  return self->_evaluator;
}

- (void)setEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_evaluator, a3);
}

- (MLFeatureProvider)currentUpdatedWeights
{
  return self->_currentUpdatedWeights;
}

- (void)setCurrentUpdatedWeights:(id)a3
{
  objc_storeStrong((id *)&self->_currentUpdatedWeights, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUpdatedWeights, 0);
  objc_storeStrong((id *)&self->_evaluator, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_program, 0);
}

@end
