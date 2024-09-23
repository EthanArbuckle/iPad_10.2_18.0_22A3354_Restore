@implementation MLE5RangeShapeExecutionStreamOperationPool

- (MLE5RangeShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8
{
  id v15;
  id v16;
  MLE5RangeShapeExecutionStreamOperationPool *v17;
  id *p_isa;
  MLE5RangeShapeExecutionStreamOperationPool *v19;
  uint64_t v20;
  NSString *milFunctionName;
  id v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSString *milDefaultShapeFunctionName;
  uint64_t v27;
  NSMutableDictionary *shapeHashToPoolMap;
  uint64_t v29;
  NSMutableSet *defaultShapePool;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *serialQueue;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  objc_super v40;

  v15 = a3;
  v16 = a4;
  v38 = a5;
  v37 = a6;
  v35 = a8;
  v39 = v15;
  if (!v15)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("programLibrary parameter must not be nil."), v35, v37, v38);
  if (!v16)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("functionName parameter must not be nil."));
  v40.receiver = self;
  v40.super_class = (Class)MLE5RangeShapeExecutionStreamOperationPool;
  v17 = -[MLE5RangeShapeExecutionStreamOperationPool init](&v40, sel_init, v35);
  p_isa = (id *)&v17->super.isa;
  v19 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_programLibrary, a3);
    v19->_modelSignpostId = a7;
    v20 = objc_msgSend(v16, "copy");
    milFunctionName = v19->_milFunctionName;
    v19->_milFunctionName = (NSString *)v20;

    v22 = v16;
    objc_msgSend(v15, "functionNames");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingString:", CFSTR("_default_function"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "containsObject:", v24))
      v25 = v24;
    else
      v25 = 0;

    milDefaultShapeFunctionName = v19->_milDefaultShapeFunctionName;
    v19->_milDefaultShapeFunctionName = v25;

    objc_storeStrong(p_isa + 4, a5);
    objc_storeStrong(p_isa + 5, a6);
    objc_storeStrong(p_isa + 10, a8);
    v27 = objc_opt_new();
    shapeHashToPoolMap = v19->_shapeHashToPoolMap;
    v19->_shapeHashToPoolMap = (NSMutableDictionary *)v27;

    v29 = objc_opt_new();
    defaultShapePool = v19->_defaultShapePool;
    v19->_defaultShapePool = (NSMutableSet *)v29;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = dispatch_queue_create("com.apple.coreml.MLE5Engine.rangeOperationPoolQueue", v31);
    serialQueue = v19->_serialQueue;
    v19->_serialQueue = (OS_dispatch_queue *)v32;

  }
  return v19;
}

- (BOOL)prepareWithInitialPoolSize:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  int v8;
  BOOL v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15106;
  v16 = __Block_byref_object_dispose__15107;
  v17 = 0;
  -[MLE5RangeShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__MLE5RangeShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke;
  v11[3] = &unk_1E3D66370;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = &v18;
  v11[7] = a3;
  dispatch_sync(v7, v11);

  v8 = *((unsigned __int8 *)v19 + 24);
  if (a4 && !*((_BYTE *)v19 + 24))
  {
    *a4 = objc_retainAutorelease((id)v13[5]);
    v8 = *((unsigned __int8 *)v19 + 24);
  }
  v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

- (id)_makeAndPreloadOperationForFunction:(id)a3 error:(id *)a4
{
  id v6;
  MLE5ExecutionStreamOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  MLE5ExecutionStreamOperation *v11;
  NSObject *v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [MLE5ExecutionStreamOperation alloc];
  -[MLE5RangeShapeExecutionStreamOperationPool programLibrary](self, "programLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5RangeShapeExecutionStreamOperationPool modelDescription](self, "modelDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5RangeShapeExecutionStreamOperationPool configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MLE5ExecutionStreamOperation initWithProgramLibrary:functionName:modelDescription:configuration:debugLabel:modelSignpostId:](v7, "initWithProgramLibrary:functionName:modelDescription:configuration:debugLabel:modelSignpostId:", v8, v6, v9, v10, 0, -[MLE5RangeShapeExecutionStreamOperationPool modelSignpostId](self, "modelSignpostId"));

  if (!v11 || !-[MLE5ExecutionStreamOperation preloadAndReturnError:](v11, "preloadAndReturnError:", a4))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_debug_impl(&dword_19C486000, v12, OS_LOG_TYPE_DEBUG, "Unable to create exection stream operation for function %@.", (uint8_t *)&v14, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  MLModelDescription *v9;
  MLVersionInfo *v10;
  MLVersionInfo *v11;
  void *v12;
  char v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v6 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__15106;
  v36 = __Block_byref_object_dispose__15107;
  v37 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__15106;
  v30 = __Block_byref_object_dispose__15107;
  v31 = 0;
  -[MLE5RangeShapeExecutionStreamOperationPool compilerVersionInfo](self, "compilerVersionInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLE5RangeShapeExecutionStreamOperationPool modelDescription](self, "modelDescription");
  v9 = (MLModelDescription *)objc_claimAutoreleasedReturnValue();
  -[MLE5RangeShapeExecutionStreamOperationPool compilerVersionInfo](self, "compilerVersionInfo");
  v10 = (MLVersionInfo *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "isEqualToString:", v12);

  -[MLE5RangeShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__MLE5RangeShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke;
  v20[3] = &unk_1E3D66398;
  v25 = v13;
  v20[4] = self;
  v23 = &v32;
  v24 = &v26;
  v15 = v8;
  v21 = v15;
  v16 = v6;
  v22 = v16;
  dispatch_sync(v14, v20);

  v17 = (void *)v33[5];
  if (a4 && !v17)
  {
    *a4 = objc_retainAutorelease((id)v27[5]);
    v17 = (void *)v33[5];
  }
  v18 = v17;

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  return v18;
}

- (void)putBack:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MLE5RangeShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__MLE5RangeShapeExecutionStreamOperationPool_putBack___block_invoke;
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
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MLE5RangeShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  objc_msgSend(v4, "functionName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLE5RangeShapeExecutionStreamOperationPool milDefaultShapeFunctionName](self, "milDefaultShapeFunctionName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v7)
  {
    -[MLE5RangeShapeExecutionStreamOperationPool defaultShapePool](self, "defaultShapePool");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v4);

  }
  else
  {
    -[MLE5RangeShapeExecutionStreamOperationPool shapeHashToPoolMap](self, "shapeHashToPoolMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shapeHash");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "shapeHash");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v17 = v15;
        _os_log_error_impl(&dword_19C486000, v11, OS_LOG_TYPE_ERROR, "Tried to get pool for shape hash %@, but it does not exist.", buf, 0xCu);

      }
      v12 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(v4, "shapeHash");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Tried to get pool for shape hash %@, but it does not exist."), v13);

    }
    objc_msgSend(v10, "addObject:", v4);

  }
}

- (id)_takeOutAnyOperation
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
  -[MLE5RangeShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MLE5RangeShapeExecutionStreamOperationPool shapeHashToPoolMap](self, "shapeHashToPoolMap", 0);
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

- (NSString)milFunctionName
{
  return self->_milFunctionName;
}

- (NSString)milDefaultShapeFunctionName
{
  return self->_milDefaultShapeFunctionName;
}

- (MLModelDescription)modelDescription
{
  return self->_modelDescription;
}

- (MLModelConfiguration)configuration
{
  return self->_configuration;
}

- (NSMutableDictionary)shapeHashToPoolMap
{
  return self->_shapeHashToPoolMap;
}

- (NSMutableSet)defaultShapePool
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
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
  objc_storeStrong((id *)&self->_defaultShapePool, 0);
  objc_storeStrong((id *)&self->_shapeHashToPoolMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_milDefaultShapeFunctionName, 0);
  objc_storeStrong((id *)&self->_milFunctionName, 0);
  objc_storeStrong((id *)&self->_programLibrary, 0);
}

uint64_t __54__MLE5RangeShapeExecutionStreamOperationPool_putBack___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_putBack:", *(_QWORD *)(a1 + 40));
}

void __80__MLE5RangeShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  id obj;
  id v38;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "milDefaultShapeFunctionName");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 32), "defaultShapePool");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "anyObject");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v7 = *(void **)(a1 + 32);
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(*(id *)(a1 + 32), "defaultShapePool");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

        return;
      }
      objc_msgSend(*(id *)(a1 + 32), "milDefaultShapeFunctionName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v38 = *(id *)(v32 + 40);
      objc_msgSend(v7, "_makeAndPreloadOperationForFunction:error:", v9, &v38);
      v33 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v32 + 40), v38);
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v31 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = v33;
LABEL_14:

      goto LABEL_15;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "shapeHashToPoolMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "shapeHashToPoolMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *(_QWORD *)(a1 + 40));

    v9 = (void *)v10;
  }
  objc_msgSend(v9, "anyObject");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_takeOutAnyOperation");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v18)
    {
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v19, "milFunctionName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      obj = *(id *)(v21 + 40);
      objc_msgSend(v19, "_makeAndPreloadOperationForFunction:error:", v20, &obj);
      v22 = objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(v21 + 40), obj);
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

      v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v18)
        goto LABEL_15;
    }
    v25 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "modelDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "compilerVersionInfo");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v36 = *(id *)(v28 + 40);
    objc_storeStrong((id *)(v28 + 40), v36);

    if (v29)
      goto LABEL_15;
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = 0;
    goto LABEL_14;
  }
  objc_msgSend(v9, "removeObject:");
LABEL_15:

}

void __79__MLE5RangeShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  MLModelDescription *v8;
  MLVersionInfo *v9;
  MLVersionInfo *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  id v23;
  id v24;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "milDefaultShapeFunctionName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (*(uint64_t *)(a1 + 56) >= 1)
    {
      v3 = 0;
      while (1)
      {
        v4 = *(void **)(a1 + 32);
        objc_msgSend(v4, "milDefaultShapeFunctionName");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        obj = *(id *)(v6 + 40);
        objc_msgSend(v4, "_makeAndPreloadOperationForFunction:error:", v5, &obj);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v6 + 40), obj);

        if (!v7)
          break;
        objc_msgSend(*(id *)(a1 + 32), "_putBack:", v7);

        if (++v3 >= *(_QWORD *)(a1 + 56))
          return;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "modelDescription");
    v8 = (MLModelDescription *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "compilerVersionInfo");
    v9 = (MLVersionInfo *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 32), "shapeHashToPoolMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v11);

    if (*(uint64_t *)(a1 + 56) >= 1)
    {
      v14 = 0;
      while (1)
      {
        v15 = *(void **)(a1 + 32);
        objc_msgSend(v15, "milFunctionName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v24 = *(id *)(v17 + 40);
        objc_msgSend(v15, "_makeAndPreloadOperationForFunction:error:", v16, &v24);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)(v17 + 40), v24);

        if (!v18)
          break;
        objc_msgSend(*(id *)(a1 + 32), "modelDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "compilerVersionInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v23 = *(id *)(v21 + 40);
        objc_storeStrong((id *)(v21 + 40), v23);

        if (!v22)
          break;
        objc_msgSend(*(id *)(a1 + 32), "_putBack:", v18);

        if (++v14 >= *(_QWORD *)(a1 + 56))
          goto LABEL_15;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;

    }
LABEL_15:

  }
}

@end
