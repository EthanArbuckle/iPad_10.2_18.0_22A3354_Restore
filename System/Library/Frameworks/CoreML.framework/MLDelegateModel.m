@implementation MLDelegateModel

- (MLDelegateModel)initWithEngine:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  MLDelegateModel *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  MLOutputBackingsVerifier *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  MLOutputBackingsVerifier *outputBackingsVerifier;
  dispatch_queue_t v21;
  OS_dispatch_queue *asyncPredictionQueue;
  NSMutableArray *v23;
  NSMutableArray *pendingPredictionQueue;
  MLDelegateModel *v25;
  objc_super v27;
  uint8_t buf[16];

  v7 = a3;
  if (!v7)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "NULL engine", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("NULL engine"));
  }
  objc_msgSend(v7, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)MLDelegateModel;
  v11 = -[MLModel initWithDescription:configuration:](&v27, sel_initWithDescription_configuration_, v9, v10);

  if (v11)
  {
    if (objc_msgSend(v7, "supportsConcurrentSubmissions"))
      v12 = +[MLModel maxPredictionsInFlight](MLModel, "maxPredictionsInFlight");
    else
      v12 = 1;
    objc_msgSend(v7, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "preparesLazily");

    if ((v14 & 1) == 0)
    {
      if ((prepareEngine(v7, v12, (uint64_t)a4) & 1) == 0)
      {
        v25 = 0;
        goto LABEL_17;
      }
      atomic_store(1u, (unsigned __int8 *)&v11->_prepared);
    }
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EE445180))
      v15 = v7;
    else
      v15 = 0;
    objc_storeStrong((id *)&v11->_internalEngine, a3);
    objc_storeStrong((id *)&v11->_statefulModelEngine, v15);
    v16 = [MLOutputBackingsVerifier alloc];
    objc_msgSend(v7, "modelDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "outputDescriptionsByName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[MLOutputBackingsVerifier initWithOutputDescriptions:](v16, "initWithOutputDescriptions:", v18);
    outputBackingsVerifier = v11->_outputBackingsVerifier;
    v11->_outputBackingsVerifier = (MLOutputBackingsVerifier *)v19;

    v21 = dispatch_queue_create("com.apple.coreml.DefaultAsyncPredictionQueue", MEMORY[0x1E0C80D50]);
    asyncPredictionQueue = v11->_asyncPredictionQueue;
    v11->_asyncPredictionQueue = (OS_dispatch_queue *)v21;

    v11->_asyncPredictionSchedulingLock._os_unfair_lock_opaque = 0;
    v11->_currentAsyncPredictionsInFlight = 0;
    v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingPredictionQueue = v11->_pendingPredictionQueue;
    v11->_pendingPredictionQueue = v23;

    v11->_maxAsyncPredictionsInFlight = v12;
  }
  v25 = v11;
LABEL_17:

  return v25;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1AD6ED8]();
  +[MLState emptyState](MLState, "emptyState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  -[MLDelegateModel _predictionFromFeatures:usingState:options:error:](self, "_predictionFromFeatures:usingState:options:error:", v8, v11, v9, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;

  objc_autoreleasePoolPop(v10);
  if (a5 && !v12)
    *a5 = objc_retainAutorelease(v13);

  return v12;
}

- (unint64_t)predictionTypeForKTrace
{
  void *v2;
  unint64_t v3;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "predictionTypeForKTrace");

  return v3;
}

- (unint64_t)signpostID
{
  void *v2;
  unint64_t v3;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "signpostID");

  return v3;
}

- (id)internalEngine
{
  return self->_internalEngine;
}

- (int)engine
{
  void *v3;
  char isKindOfClass;
  void *v5;
  int v6;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0x7FFFFFFF;
  -[MLDelegateModel internalEngine](self, "internalEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "engine");

  return v6;
}

- (void)enableInstrumentsTracing
{
  id v2;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableInstrumentsTracing");

}

- (id)program
{
  void *v3;

  if (-[MLModeling conformsToProtocol:](self->_internalEngine, "conformsToProtocol:", &unk_1EE441670))
  {
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)neuralNetwork
{
  void *v3;
  int v4;
  void *v5;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE438E48);

  if (v4)
  {
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)writable
{
  void *v3;
  int v4;
  void *v5;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE43B688);

  if (v4)
  {
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)updatable
{
  void *v3;
  int v4;
  void *v5;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE43B770);

  if (v4)
  {
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)classifier
{
  void *v3;
  int v4;
  void *v5;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE433B68);

  if (v4)
  {
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)regressor
{
  void *v3;
  int v4;
  void *v5;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE438EC0);

  if (v4)
  {
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)pipeline
{
  void *v3;
  int v4;
  void *v5;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EE442268);

  if (v4)
  {
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)prepareWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *asyncPredictionQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  asyncPredictionQueue = self->_asyncPredictionQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__MLDelegateModel_prepareWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E3D66950;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(asyncPredictionQueue, v7);

}

- (void)_validateStateFeatureNamed:(id)a3 backingMultiArray:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MLState *v12;
  void *v13;
  MLState *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  const __CFString *v23;
  void *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MLModel modelDescription](self, "modelDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stateDescriptionsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_error_impl(&dword_19C486000, v22, OS_LOG_TYPE_ERROR, "The feature named %@ is not declared in the state feature description", buf, 0xCu);
    }
    v23 = CFSTR("The feature named %@ is not declared in the state feature description");
    goto LABEL_15;
  }
  if (objc_msgSend(v10, "type") != 8)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_error_impl(&dword_19C486000, v22, OS_LOG_TYPE_ERROR, "The feature named %@ is not MLFeatureTypeState", buf, 0xCu);
    }
    v23 = CFSTR("The feature named %@ is not MLFeatureTypeState");
LABEL_15:

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], v23, v6);
    goto LABEL_16;
  }
  if (v7)
  {
    v12 = [MLState alloc];
    v30 = v6;
    v31[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[MLState initWithBackings:](v12, "initWithBackings:", v13);

    +[MLFeatureValue internalFeatureValueWithState:](MLFeatureValue, "internalFeatureValueWithState:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stateConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v17 = objc_msgSend(v16, "isAllowedValue:error:", v15, &v25);
    v18 = v25;

    if ((v17 & 1) == 0)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "localizedDescription");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v6;
        v28 = 2112;
        v29 = v24;
        _os_log_error_impl(&dword_19C486000, v19, OS_LOG_TYPE_ERROR, "The user specified backing multi array for state feature named %@ is not compatible. (Error: %@)", buf, 0x16u);

      }
      v20 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(v18, "localizedDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The user specified backing multi array for state feature named %@ is not compatible. (Error: %@)"), v6, v21);

    }
  }
LABEL_16:

}

- (id)newStateWithClientBuffers:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  objc_class *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_statefulModelEngine)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v32;
      v46 = 2112;
      v47 = v33;
      _os_log_error_impl(&dword_19C486000, v6, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support stateful predictions to perform %@.", buf, 0x16u);

    }
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't support stateful predictions to perform %@."), v9, v10);

  }
  -[MLModel modelDescription](self, "modelDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stateDescriptionsByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v13 = v12;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[MLDelegateModel _validateStateFeatureNamed:backingMultiArray:](self, "_validateStateFeatureNamed:backingMultiArray:", v17, v18);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v14);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = v5;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v35;
    v22 = *MEMORY[0x1E0C99778];
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v35 != v21)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v13, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25 == 0;

        if (v26)
        {
          +[MLLogging coreChannel](MLLogging, "coreChannel");
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v45 = v24;
            _os_log_error_impl(&dword_19C486000, v27, OS_LOG_TYPE_ERROR, "The state feature named %@ in the client buffers is not declared in the state feature description", buf, 0xCu);
          }

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v22, CFSTR("The state feature named %@ in the client buffers is not declared in the state feature description"), v24);
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v13, "count"))
  {
    v28 = -[MLStatefulModelEngine newStateWithClientBuffers:](self->_statefulModelEngine, "newStateWithClientBuffers:", v19);
  }
  else
  {
    +[MLState emptyState](MLState, "emptyState");
    v28 = objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)v28;

  return v29;
}

- (id)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)MEMORY[0x1A1AD6ED8]();
  v17 = 0;
  -[MLDelegateModel _predictionFromFeatures:usingState:options:error:](self, "_predictionFromFeatures:usingState:options:error:", v10, v11, v12, &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v17;
  objc_autoreleasePoolPop(v13);
  if (a6 && !v14)
    *a6 = objc_retainAutorelease(v15);

  return v14;
}

- (id)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  MLOutputBackingsVerifier *outputBackingsVerifier;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  MLStatefulModelEngine *statefulModelEngine;
  NSObject *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v38 = a4;
  v11 = a5;
  v37 = v10;
  if (!v10)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The input feature provider cannot be nil."));
  if (!v11)
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  outputBackingsVerifier = self->_outputBackingsVerifier;
  objc_msgSend(v11, "outputBackings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(outputBackingsVerifier) = -[MLOutputBackingsVerifier verifyOutputBackings:predictionUsesBatch:error:](outputBackingsVerifier, "verifyOutputBackings:predictionUsesBatch:error:", v13, 0, a6);

  if ((outputBackingsVerifier & 1) != 0)
  {
    -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
    v42 = 0;
    v40 = 0u;
    v41 = 0u;
    v39 = 0u;
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "recordsPredictionEvent");

    if (v15)
    {
      -[MLModel predictionEvent](self, "predictionEvent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLDelegateModel internalEngine](self, "internalEngine");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "predictionTypeForKTrace");
      v19 = -[MLDelegateModel signpostID](self, "signpostID");
      v20 = objc_msgSend(v11, "parentSignpostID");
      v21 = -[MLModel nextPredictionRequestID](self, "nextPredictionRequestID");
      v22 = v16;
      *(_QWORD *)&v39 = mach_absolute_time();
      objc_storeStrong((id *)&v39 + 1, v16);
      *(_QWORD *)&v40 = v18;
      *((_QWORD *)&v40 + 1) = v19;
      *(_QWORD *)&v41 = v20;
      *((_QWORD *)&v41 + 1) = v21;
      v42 = 1;
      kdebug_trace();

    }
    +[MLState emptyState](MLState, "emptyState");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    if (v23 == v38)
    {
      -[MLDelegateModel internalEngine](self, "internalEngine");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "predictionFromFeatures:options:error:", v37, v11, a6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      statefulModelEngine = self->_statefulModelEngine;
      if (!statefulModelEngine)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v44 = v34;
          v45 = 2112;
          v46 = v35;
          _os_log_error_impl(&dword_19C486000, v25, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support stateful predictions to perform %@.", buf, 0x16u);

        }
        v26 = (void *)MEMORY[0x1E0C99DA0];
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't support stateful predictions to perform %@."), v28, v29);

        statefulModelEngine = self->_statefulModelEngine;
      }
      -[MLStatefulModelEngine predictionFromFeatures:usingState:options:error:](statefulModelEngine, "predictionFromFeatures:usingState:options:error:", v37, v38, v11, a6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    ElapsedTimeRecorder::~ElapsedTimeRecorder((id *)&v39);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x1A1AD6ED8]();
  v14 = 0;
  -[MLDelegateModel _predictionsFromBatch:options:error:](self, "_predictionsFromBatch:options:error:", v8, v9, &v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v14;
  objc_autoreleasePoolPop(v10);
  if (a5 && !v11)
    *a5 = objc_retainAutorelease(v12);

  return v11;
}

- (id)_predictionsFromBatch:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  MLOutputBackingsVerifier *outputBackingsVerifier;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  _QWORD aBlock[7];

  v8 = a3;
  v9 = a4;
  if (!v8)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The input batch feature provider cannot be nil."));
  if (!v9)
  {
    +[MLPredictionOptions defaultOptions](MLPredictionOptions, "defaultOptions");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  outputBackingsVerifier = self->_outputBackingsVerifier;
  objc_msgSend(v9, "outputBackings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(outputBackingsVerifier) = -[MLOutputBackingsVerifier verifyOutputBackings:predictionUsesBatch:error:](outputBackingsVerifier, "verifyOutputBackings:predictionUsesBatch:error:", v11, 1, a5);

  if ((outputBackingsVerifier & 1) != 0)
  {
    -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "predictionTypeForKTrace");

    v14 = -[MLDelegateModel signpostID](self, "signpostID");
    v15 = objc_msgSend(v9, "parentSignpostID");
    kdebug_trace();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__MLDelegateModel__predictionsFromBatch_options_error___block_invoke;
    aBlock[3] = &__block_descriptor_56_e5_v8__0l;
    aBlock[4] = v13;
    aBlock[5] = v14;
    aBlock[6] = v15;
    v16 = (void (**)(_QWORD))_Block_copy(aBlock);
    -[MLDelegateModel internalEngine](self, "internalEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predictionsFromBatch:options:error:", v8, v9, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v16[2](v16);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)newRequestWithInputFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  +[MLState emptyState](MLState, "emptyState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MLDelegateModel newRequestWithInputFeatures:usingState:options:error:](self, "newRequestWithInputFeatures:usingState:options:error:", v8, v10, v9, a5);

  return v11;
}

- (id)newRequestWithInputFeatures:(id)a3 usingState:(id)a4 options:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  MLOutputBackingsVerifier *outputBackingsVerifier;
  void *v17;
  id v18;
  BOOL v19;
  MLStatefulModelEngine *statefulModelEngine;
  NSObject *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "The input feature provider cannot be nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The input feature provider cannot be nil."));
  }
  if (!v13)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "The options cannot be nil.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The options cannot be nil."));
  }
  outputBackingsVerifier = self->_outputBackingsVerifier;
  objc_msgSend(v13, "outputBackings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(outputBackingsVerifier) = -[MLOutputBackingsVerifier verifyOutputBackings:predictionUsesBatch:error:](outputBackingsVerifier, "verifyOutputBackings:predictionUsesBatch:error:", v17, 0, a6);

  if ((outputBackingsVerifier & 1) != 0)
  {
    +[MLState emptyState](MLState, "emptyState");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = v18 == v12;

    if (v19)
    {
      -[MLDelegateModel internalEngine](self, "internalEngine");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v27, "newRequestForModel:inputFeatures:options:error:", self, v11, v13, a6);

    }
    else
    {
      statefulModelEngine = self->_statefulModelEngine;
      if (!statefulModelEngine)
      {
        +[MLLogging coreChannel](MLLogging, "coreChannel");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v33 = v30;
          v34 = 2112;
          v35 = v31;
          _os_log_error_impl(&dword_19C486000, v21, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support stateful predictions to perform %@.", buf, 0x16u);

        }
        v22 = (void *)MEMORY[0x1E0C99DA0];
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't support stateful predictions to perform %@."), v24, v25);

        statefulModelEngine = self->_statefulModelEngine;
      }
      v26 = (void *)-[MLStatefulModelEngine newRequestForModel:inputFeatures:usingState:options:error:](statefulModelEngine, "newRequestForModel:inputFeatures:usingState:options:error:", self, v11, v12, v13, a6);
    }
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  -[MLDelegateModel _schedulePredictionRequest:completionHandler:](self, "_schedulePredictionRequest:completionHandler:", v7, v6);

}

- (void)_submitPredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *asyncPredictionQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  MLDelegateModel *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  asyncPredictionQueue = self->_asyncPredictionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__MLDelegateModel__submitPredictionRequest_completionHandler___block_invoke;
  block[3] = &unk_1E3D669A0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(asyncPredictionQueue, block);

}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1A1AD6ED8]();
  +[MLState emptyState](MLState, "emptyState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLDelegateModel _predictionFromFeatures:usingState:options:completionHandler:](self, "_predictionFromFeatures:usingState:options:completionHandler:", v12, v11, v8, v9);

  objc_autoreleasePoolPop(v10);
}

- (void)predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1A1AD6ED8]();
  -[MLDelegateModel _predictionFromFeatures:usingState:options:completionHandler:](self, "_predictionFromFeatures:usingState:options:completionHandler:", v14, v10, v11, v12);
  objc_autoreleasePoolPop(v13);

}

- (void)_predictionFromFeatures:(id)a3 usingState:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *asyncPredictionQueue;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[MLModel enableInstrumentsTracingIfNeeded](self, "enableInstrumentsTracingIfNeeded");
  v21 = 0;
  v14 = -[MLDelegateModel newRequestWithInputFeatures:usingState:options:error:](self, "newRequestWithInputFeatures:usingState:options:error:", v10, v11, v12, &v21);
  v15 = v21;
  if (v14)
  {
    -[MLDelegateModel _schedulePredictionRequest:completionHandler:](self, "_schedulePredictionRequest:completionHandler:", v14, v13);
  }
  else
  {
    asyncPredictionQueue = self->_asyncPredictionQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__MLDelegateModel__predictionFromFeatures_usingState_options_completionHandler___block_invoke;
    v17[3] = &unk_1E3D669A0;
    v18 = v12;
    v20 = v13;
    v19 = v15;
    dispatch_async(asyncPredictionQueue, v17);

  }
}

- (id)parameterValueForKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[MLDelegateModel internalEngine](self, "internalEngine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "parameterValueForKey:error:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)executionSchedule
{
  void *v2;
  void *v3;

  -[MLDelegateModel internalEngine](self, "internalEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executionSchedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_schedulePredictionRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  os_unfair_lock_s *p_asyncPredictionSchedulingLock;
  void *v8;
  uint64_t v9;
  MLPendingPrediction *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  p_asyncPredictionSchedulingLock = &self->_asyncPredictionSchedulingLock;
  os_unfair_lock_lock(&self->_asyncPredictionSchedulingLock);
  if (self->_currentAsyncPredictionsInFlight >= self->_maxAsyncPredictionsInFlight
    || (-[MLDelegateModel pendingPredictionQueue](self, "pendingPredictionQueue"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v9))
  {
    v10 = -[MLPendingPrediction initWithPredictionRequest:completionHandler:]([MLPendingPrediction alloc], "initWithPredictionRequest:completionHandler:", v12, v6);
    -[MLDelegateModel pendingPredictionQueue](self, "pendingPredictionQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);

  }
  else
  {
    ++self->_currentAsyncPredictionsInFlight;
    -[MLDelegateModel _submitPredictionRequest:completionHandler:](self, "_submitPredictionRequest:completionHandler:", v12, v6);
  }
  os_unfair_lock_unlock(p_asyncPredictionSchedulingLock);

}

- (void)_finishPredictionAndDispatchPendingPredictions
{
  os_unfair_lock_s *p_asyncPredictionSchedulingLock;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  p_asyncPredictionSchedulingLock = &self->_asyncPredictionSchedulingLock;
  os_unfair_lock_lock(&self->_asyncPredictionSchedulingLock);
  --self->_currentAsyncPredictionsInFlight;
  -[MLDelegateModel pendingPredictionQueue](self, "pendingPredictionQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = -[MLDelegateModel maxAsyncPredictionsInFlight](self, "maxAsyncPredictionsInFlight");
  if (v6 - self->_currentAsyncPredictionsInFlight < v5)
    v5 = v6 - self->_currentAsyncPredictionsInFlight;

  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      -[MLDelegateModel pendingPredictionQueue](self, "pendingPredictionQueue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      ++self->_currentAsyncPredictionsInFlight;
      objc_msgSend(v9, "predictionRequest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "completionHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MLDelegateModel _submitPredictionRequest:completionHandler:](self, "_submitPredictionRequest:completionHandler:", v10, v11);

    }
  }
  -[MLDelegateModel pendingPredictionQueue](self, "pendingPredictionQueue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObjectsInRange:", 0, v5);

  os_unfair_lock_unlock(p_asyncPredictionSchedulingLock);
}

- (void)cancelPredictionRequest:(id)a3
{
  id v4;
  void *v5;
  unint64_t i;
  void *v7;
  id v8;
  NSObject *asyncPredictionQueue;
  id v10;
  _QWORD block[4];
  id v12;

  v4 = a3;
  os_unfair_lock_lock(&self->_asyncPredictionSchedulingLock);
  -[MLDelegateModel pendingPredictionQueue](self, "pendingPredictionQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    if (i >= objc_msgSend(v5, "count"))
    {
      os_unfair_lock_unlock(&self->_asyncPredictionSchedulingLock);
      goto LABEL_8;
    }
    objc_msgSend(v5, "objectAtIndexedSubscript:", i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predictionRequest");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
      break;

  }
  objc_msgSend(v5, "removeObjectAtIndex:", i);
  os_unfair_lock_unlock(&self->_asyncPredictionSchedulingLock);
  if (v7)
  {
    asyncPredictionQueue = self->_asyncPredictionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __43__MLDelegateModel_cancelPredictionRequest___block_invoke;
    block[3] = &unk_1E3D66E48;
    v12 = v7;
    v10 = v7;
    dispatch_async(asyncPredictionQueue, block);

  }
LABEL_8:

}

- (id)newStateForFeatureNamed:(id)a3 initializerBlock:(id)a4
{
  id v7;
  id v8;
  MLModeling *v9;
  NSObject *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[MLDelegateModel _validateStateFeatureNamed:backingMultiArray:](self, "_validateStateFeatureNamed:backingMultiArray:", v7, 0);
  if (-[MLModeling conformsToProtocol:](self->_internalEngine, "conformsToProtocol:", &unk_1EE4451E0))
  {
    v9 = self->_internalEngine;
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v18;
      v22 = 2112;
      v23 = v19;
      _os_log_error_impl(&dword_19C486000, v10, OS_LOG_TYPE_ERROR, "This model engine (%@) doesn't support the stateful predictions to perform the deprecated  %@.", buf, 0x16u);

    }
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("This model engine (%@) doesn't support the stateful predictions to perform the deprecated  %@."), v13, v14);

    v9 = 0;
  }
  v15 = (void *)-[MLModeling newStateForFeatureNamed:initializerBlock:](v9, "newStateForFeatureNamed:initializerBlock:", v7, v8);

  return v15;
}

- (unint64_t)maxAsyncPredictionsInFlight
{
  return self->_maxAsyncPredictionsInFlight;
}

- (NSMutableArray)pendingPredictionQueue
{
  return self->_pendingPredictionQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPredictionQueue, 0);
  objc_storeStrong((id *)&self->_outputBackingsVerifier, 0);
  objc_storeStrong((id *)&self->_statefulModelEngine, 0);
  objc_storeStrong((id *)&self->_internalEngine, 0);
  objc_storeStrong((id *)&self->_asyncPredictionQueue, 0);
}

void __43__MLDelegateModel_cancelPredictionRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  uint8_t v11[8];
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "predictionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predictionOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "completionSyncPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v4, "notify");
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_19C486000, v5, OS_LOG_TYPE_ERROR, "Prediction was cancelled prior to completion.", v11, 2u);
  }

  v6 = (void *)MEMORY[0x1E0CB35C8];
  v12 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Prediction was cancelled prior to completion."));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 11, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "completionHandler");
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, void *))v10)[2](v10, 0, v9);

}

void __80__MLDelegateModel__predictionFromFeatures_usingState_options_completionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "completionSyncPoint");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v2, "notify");
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __62__MLDelegateModel__submitPredictionRequest_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  MLPredictionEvent *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  ElapsedTimeRecorder *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  id *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[6];
  ElapsedTimeRecorder *v22;

  objc_msgSend(*(id *)(a1 + 32), "predictionOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3812000000;
  v21[3] = __Block_byref_object_copy__12656;
  v21[4] = __Block_byref_object_dispose__12657;
  v21[5] = 0;
  objc_msgSend(*(id *)(a1 + 40), "predictionEvent");
  v3 = (MLPredictionEvent *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "internalEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "predictionTypeForKTrace");
  v6 = objc_msgSend(*(id *)(a1 + 40), "signpostID");
  v7 = objc_msgSend(v2, "parentSignpostID");
  v8 = objc_msgSend(*(id *)(a1 + 40), "nextPredictionRequestID");
  v9 = (ElapsedTimeRecorder *)operator new();
  ElapsedTimeRecorder::ElapsedTimeRecorder(v9, v3, v5, v6, v7, v8);
  v22 = v9;

  objc_msgSend(*(id *)(a1 + 40), "internalEngine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(a1 + 32);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__MLDelegateModel__submitPredictionRequest_completionHandler___block_invoke_194;
  v16[3] = &unk_1E3D66048;
  v12 = v2;
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  v17 = v12;
  v18 = v13;
  v20 = v21;
  v19 = v14;
  objc_msgSend(v10, "submitPredictionRequest:completionHandler:", v11, v16);

  _Block_object_dispose(v21, 8);
  v15 = (id *)v22;
  v22 = 0;
  if (v15)
  {
    ElapsedTimeRecorder::~ElapsedTimeRecorder(v15);
    MEMORY[0x1A1AD6260]();
  }

}

void __62__MLDelegateModel__submitPredictionRequest_completionHandler___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "completionSyncPoint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "notify");
  objc_msgSend(*(id *)(a1 + 40), "_finishPredictionAndDispatchPendingPredictions");
  std::unique_ptr<ElapsedTimeRecorder>::reset[abi:ne180100]((id **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 48));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __55__MLDelegateModel__predictionsFromBatch_options_error___block_invoke()
{
  return kdebug_trace();
}

void __48__MLDelegateModel_prepareWithCompletionHandler___block_invoke(uint64_t a1)
{
  unsigned __int8 v2;
  void *v3;
  uint64_t v4;
  int v5;
  id v6;
  id v7;

  v2 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128));
  if ((v2 & 1) != 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "internalEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 32), "maxAsyncPredictionsInFlight");
    v7 = 0;
    v5 = prepareEngine(v3, v4, (uint64_t)&v7);
    v6 = v7;

    if (v5)
      atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

@end
