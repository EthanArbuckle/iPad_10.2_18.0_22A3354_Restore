@implementation MLE5EnumeratedShapeExecutionStreamOperationPool

- (MLE5EnumeratedShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  MLE5EnumeratedShapeExecutionStreamOperationPool *v18;
  MLE5EnumeratedShapeExecutionStreamOperationPool *v19;
  uint64_t v20;
  NSString *milEntryFunctionName;
  void *v22;
  void *v23;
  uint64_t v24;
  NSSet *milFunctionNames;
  uint64_t v26;
  NSMutableDictionary *functionNameToPoolMap;
  NSObject *v28;
  dispatch_queue_t v29;
  OS_dispatch_queue *serialQueue;
  id v32;
  void *v33;
  id v34;
  objc_super v35;

  v15 = a3;
  v16 = a4;
  v34 = a5;
  v32 = a6;
  v17 = a8;
  if (!v15)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("programLibrary parameter must not be nil."), v32, v34);
  if (!v16)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("functionName parameter must not be nil."));
  v35.receiver = self;
  v35.super_class = (Class)MLE5EnumeratedShapeExecutionStreamOperationPool;
  v18 = -[MLE5EnumeratedShapeExecutionStreamOperationPool init](&v35, sel_init, v32);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_programLibrary, a3);
    v19->_modelSignpostId = a7;
    v20 = objc_msgSend(v16, "copy");
    milEntryFunctionName = v19->_milEntryFunctionName;
    v19->_milEntryFunctionName = (NSString *)v20;

    v22 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v15, "functionNames");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setWithArray:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    milFunctionNames = v19->_milFunctionNames;
    v19->_milFunctionNames = (NSSet *)v24;

    objc_storeStrong((id *)&v19->_modelDescription, a5);
    objc_storeStrong((id *)&v19->_configuration, a6);
    objc_storeStrong((id *)&v19->_compilerVersionInfo, a8);
    v26 = objc_opt_new();
    functionNameToPoolMap = v19->_functionNameToPoolMap;
    v19->_functionNameToPoolMap = (NSMutableDictionary *)v26;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_queue_create("com.apple.coreml.MLE5Engine.enumeratedOperationPoolQueue", v28);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v29;

  }
  return v19;
}

- (BOOL)prepareWithInitialPoolSize:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  MLModelDescription *v9;
  void *v10;
  id v11;
  id v12;
  MLVersionInfo *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  int v18;
  BOOL v19;
  _QWORD block[5];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  std::string buf;

  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 1;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__4932;
  v30 = __Block_byref_object_dispose__4933;
  v31 = 0;
  -[MLE5EnumeratedShapeExecutionStreamOperationPool milEntryFunctionName](self, "milEntryFunctionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5EnumeratedShapeExecutionStreamOperationPool milFunctionNames](self, "milFunctionNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5EnumeratedShapeExecutionStreamOperationPool modelDescription](self, "modelDescription");
  v9 = (MLModelDescription *)objc_claimAutoreleasedReturnValue();
  -[MLE5EnumeratedShapeExecutionStreamOperationPool compilerVersionInfo](self, "compilerVersionInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12 = v8;
  v13 = v10;
  CoreML::MLNeuralNetworkUtilities::hashE5ModelDefaultShapesToConfigurationName(&buf, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);

  if (!v14)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.__r_.__value_.__l.__data_) = 0;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "There is no function in the program library for the default shapes.", (uint8_t *)&buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("There is no function in the program library for the default shapes."));
  }
  -[MLE5EnumeratedShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v16 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__MLE5EnumeratedShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke;
  block[3] = &unk_1E3D654A8;
  v25 = a3;
  block[4] = self;
  v17 = v14;
  v22 = v17;
  v23 = &v26;
  v24 = &v32;
  dispatch_sync(v16, block);

  v18 = *((unsigned __int8 *)v33 + 24);
  if (a4 && !*((_BYTE *)v33 + 24))
  {
    *a4 = objc_retainAutorelease((id)v27[5]);
    v18 = *((unsigned __int8 *)v33 + 24);
  }
  v19 = v18 != 0;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  return v19;
}

- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD block[5];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  std::string buf;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4932;
  v34 = __Block_byref_object_dispose__4933;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4932;
  v28 = __Block_byref_object_dispose__4933;
  v29 = 0;
  -[MLE5EnumeratedShapeExecutionStreamOperationPool milEntryFunctionName](self, "milEntryFunctionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5EnumeratedShapeExecutionStreamOperationPool milFunctionNames](self, "milFunctionNames");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5EnumeratedShapeExecutionStreamOperationPool compilerVersionInfo](self, "compilerVersionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  v11 = v8;
  v12 = v9;
  CoreML::MLNeuralNetworkUtilities::hashFeatureProviderToConfigurationName(&buf, v6, 1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    operator delete(buf.__r_.__value_.__l.__data_);

  if (!v13)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v6;
      _os_log_error_impl(&dword_19C486000, v14, OS_LOG_TYPE_ERROR, "There is no function in the program library for the provided input=%@.", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("There is no function in the program library for the provided input=%@."), v6);
  }
  -[MLE5EnumeratedShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__MLE5EnumeratedShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke;
  block[3] = &unk_1E3D66978;
  v22 = &v30;
  block[4] = self;
  v16 = v13;
  v21 = v16;
  v23 = &v24;
  dispatch_sync(v15, block);

  v17 = (void *)v31[5];
  if (a4 && !v17)
  {
    *a4 = objc_retainAutorelease((id)v25[5]);
    v17 = (void *)v31[5];
  }
  v18 = v17;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v18;
}

- (id)_takeOutOperationForFunctionName:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  MLE5ExecutionStreamOperation *v11;
  id v12;
  MLE5ExecutionStreamOperation *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  -[MLE5EnumeratedShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[MLE5EnumeratedShapeExecutionStreamOperationPool functionNameToPoolMap](self, "functionNameToPoolMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_opt_new();
    -[MLE5EnumeratedShapeExecutionStreamOperationPool functionNameToPoolMap](self, "functionNameToPoolMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v5);

    v8 = (void *)v9;
  }
  objc_msgSend(v8, "anyObject");
  v11 = (MLE5ExecutionStreamOperation *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v8, "removeObject:", v11);
  }
  else
  {
    v12 = -[MLE5EnumeratedShapeExecutionStreamOperationPool _takeOutOperationFromAnyProgramFunction](self, "_takeOutOperationFromAnyProgramFunction");
    v13 = [MLE5ExecutionStreamOperation alloc];
    -[MLE5EnumeratedShapeExecutionStreamOperationPool programLibrary](self, "programLibrary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5EnumeratedShapeExecutionStreamOperationPool modelDescription](self, "modelDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5EnumeratedShapeExecutionStreamOperationPool configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MLE5ExecutionStreamOperation initWithProgramLibrary:functionName:modelDescription:configuration:debugLabel:modelSignpostId:](v13, "initWithProgramLibrary:functionName:modelDescription:configuration:debugLabel:modelSignpostId:", v14, v5, v15, v16, 0, -[MLE5EnumeratedShapeExecutionStreamOperationPool modelSignpostId](self, "modelSignpostId"));

  }
  return v11;
}

- (void)putBack:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MLE5EnumeratedShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MLE5EnumeratedShapeExecutionStreamOperationPool_putBack___block_invoke;
  block[3] = &unk_1E3D66FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)_putBack:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLE5EnumeratedShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[MLE5EnumeratedShapeExecutionStreamOperationPool functionNameToPoolMap](self, "functionNameToPoolMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "functionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "functionName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v12;
      _os_log_error_impl(&dword_19C486000, v9, OS_LOG_TYPE_ERROR, "Tried to get pool for program function %@, but it does not exist.", buf, 0xCu);

    }
    v10 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v4, "functionName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Tried to get pool for program function %@, but it does not exist."), v11);

  }
  objc_msgSend(v8, "addObject:", v4);

}

- (id)_takeOutOperationFromAnyProgramFunction
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[MLE5EnumeratedShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MLE5EnumeratedShapeExecutionStreamOperationPool functionNameToPoolMap](self, "functionNameToPoolMap", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "anyObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "removeObject:", v10);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (MLE5ProgramLibrary)programLibrary
{
  return self->_programLibrary;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)milEntryFunctionName
{
  return self->_milEntryFunctionName;
}

- (NSSet)milFunctionNames
{
  return self->_milFunctionNames;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (NSMutableDictionary)functionNameToPoolMap
{
  return self->_functionNameToPoolMap;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (unint64_t)modelSignpostId
{
  return self->_modelSignpostId;
}

- (MLVersionInfo)compilerVersionInfo
{
  return self->_compilerVersionInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compilerVersionInfo, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_functionNameToPoolMap, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_milFunctionNames, 0);
  objc_storeStrong((id *)&self->_milEntryFunctionName, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_programLibrary, 0);
}

uint64_t __59__MLE5EnumeratedShapeExecutionStreamOperationPool_putBack___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_putBack:", *(_QWORD *)(a1 + 40));
}

void __85__MLE5EnumeratedShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_takeOutOperationForFunctionName:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void __84__MLE5EnumeratedShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;
  id obj;

  if (*(uint64_t *)(a1 + 64) >= 1)
  {
    v2 = 0;
    while (1)
    {
      v3 = *(void **)(a1 + 32);
      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v5 + 40);
      objc_msgSend(v3, "_takeOutOperationForFunctionName:error:", v4, &obj);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v5 + 40), obj);
      if (!v6)
        break;
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(id *)(v7 + 40);
      v8 = objc_msgSend(v6, "preloadAndReturnError:", &v9);
      objc_storeStrong((id *)(v7 + 40), v9);
      if ((v8 & 1) == 0)
        break;
      objc_msgSend(*(id *)(a1 + 32), "_putBack:", v6);

      if (++v2 >= *(_QWORD *)(a1 + 64))
        return;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;

  }
}

@end
