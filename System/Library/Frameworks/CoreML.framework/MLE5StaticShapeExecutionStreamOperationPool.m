@implementation MLE5StaticShapeExecutionStreamOperationPool

- (MLE5StaticShapeExecutionStreamOperationPool)initWithProgramLibrary:(id)a3 functionName:(id)a4 modelDescription:(id)a5 configuration:(id)a6 modelSignpostId:(unint64_t)a7 compilerVersionInfo:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  MLE5StaticShapeExecutionStreamOperationPool *v19;
  MLE5StaticShapeExecutionStreamOperationPool *v20;
  uint64_t v21;
  NSString *functionName;
  uint64_t v23;
  NSMutableSet *pool;
  MLPixelBufferPool *v25;
  MLPixelBufferPool *pixelBufferPool;
  dispatch_queue_t v27;
  OS_dispatch_queue *serialQueue;
  id v30;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v30 = a5;
  v17 = a6;
  v18 = a8;
  if (!v15)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("programLibrary parameter must not be nil."));
  if (!v16)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("functionName parameter must not be nil."));
  v31.receiver = self;
  v31.super_class = (Class)MLE5StaticShapeExecutionStreamOperationPool;
  v19 = -[MLE5StaticShapeExecutionStreamOperationPool init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_programLibrary, a3);
    v20->_modelSignpostId = a7;
    v21 = objc_msgSend(v16, "copy");
    functionName = v20->_functionName;
    v20->_functionName = (NSString *)v21;

    objc_storeStrong((id *)&v20->_modelDescription, a5);
    objc_storeStrong((id *)&v20->_modelConfiguration, a6);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v23 = objc_claimAutoreleasedReturnValue();
    pool = v20->_pool;
    v20->_pool = (NSMutableSet *)v23;

    v25 = objc_alloc_init(MLPixelBufferPool);
    pixelBufferPool = v20->_pixelBufferPool;
    v20->_pixelBufferPool = v25;

    v20->_numberOfOperationsInUse = 0;
    v27 = dispatch_queue_create("com.apple.coreml.MLE5Engine.staticOperationPoolQueue", 0);
    serialQueue = v20->_serialQueue;
    v20->_serialQueue = (OS_dispatch_queue *)v27;

  }
  return v20;
}

- (void)_putBack:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MLE5StaticShapeExecutionStreamOperationPool setNumberOfOperationsInUse:](self, "setNumberOfOperationsInUse:", -[MLE5StaticShapeExecutionStreamOperationPool numberOfOperationsInUse](self, "numberOfOperationsInUse") - 1);
  -[MLE5StaticShapeExecutionStreamOperationPool pool](self, "pool");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

}

- (id)_takeOut
{
  void *v3;
  MLE5ExecutionStreamOperation *v4;
  void *v5;
  MLE5ExecutionStreamOperation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[MLE5StaticShapeExecutionStreamOperationPool pool](self, "pool");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyObject");
  v4 = (MLE5ExecutionStreamOperation *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MLE5StaticShapeExecutionStreamOperationPool pool](self, "pool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);
  }
  else
  {
    v6 = [MLE5ExecutionStreamOperation alloc];
    -[MLE5StaticShapeExecutionStreamOperationPool programLibrary](self, "programLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5StaticShapeExecutionStreamOperationPool functionName](self, "functionName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5StaticShapeExecutionStreamOperationPool modelDescription](self, "modelDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5StaticShapeExecutionStreamOperationPool modelConfiguration](self, "modelConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[MLE5ExecutionStreamOperation initWithProgramLibrary:functionName:modelDescription:configuration:debugLabel:modelSignpostId:](v6, "initWithProgramLibrary:functionName:modelDescription:configuration:debugLabel:modelSignpostId:", v7, v8, v9, v10, 0, -[MLE5StaticShapeExecutionStreamOperationPool modelSignpostId](self, "modelSignpostId"));

    -[MLE5StaticShapeExecutionStreamOperationPool pixelBufferPool](self, "pixelBufferPool");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MLE5ExecutionStreamOperation setPixelBufferPool:](v4, "setPixelBufferPool:", v5);
  }

  -[MLE5StaticShapeExecutionStreamOperationPool setNumberOfOperationsInUse:](self, "setNumberOfOperationsInUse:", -[MLE5StaticShapeExecutionStreamOperationPool numberOfOperationsInUse](self, "numberOfOperationsInUse") + 1);
  return v4;
}

- (void)setNumberOfOperationsInUse:(int64_t)a3
{
  self->_numberOfOperationsInUse = a3;
}

- (NSMutableSet)pool
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

void __80__MLE5StaticShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char v9;
  BOOL v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id obj;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 <= objc_msgSend(*(id *)(a1 + 32), "numberOfOperationsInUse"))
  {
    v4 = 0;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    v4 = v3 - objc_msgSend(*(id *)(a1 + 32), "numberOfOperationsInUse");
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v4);
  if (v4)
  {
    v6 = v4 - 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_takeOut");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      obj = *(id *)(v8 + 40);
      v9 = objc_msgSend(v7, "preloadAndReturnError:", &obj);
      objc_storeStrong((id *)(v8 + 40), obj);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
      objc_msgSend(v5, "addObject:", v7);
      v10 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;

      if (v6)
        v11 = v10;
      else
        v11 = 1;
      --v6;
    }
    while ((v11 & 1) == 0);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(a1 + 32), "_putBack:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v13);
  }

}

- (int64_t)numberOfOperationsInUse
{
  return self->_numberOfOperationsInUse;
}

- (MLE5ProgramLibrary)programLibrary
{
  return (MLE5ProgramLibrary *)objc_getProperty(self, a2, 8, 1);
}

- (MLPixelBufferPool)pixelBufferPool
{
  return self->_pixelBufferPool;
}

- (unint64_t)modelSignpostId
{
  return self->_modelSignpostId;
}

- (MLModelDescription)modelDescription
{
  return (MLModelDescription *)objc_getProperty(self, a2, 24, 1);
}

- (MLModelConfiguration)modelConfiguration
{
  return (MLModelConfiguration *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)functionName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
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
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  -[MLE5StaticShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__MLE5StaticShapeExecutionStreamOperationPool_prepareWithInitialPoolSize_error___block_invoke;
  v11[3] = &unk_1E3D66370;
  v11[4] = self;
  v11[5] = &v18;
  v11[6] = &v12;
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

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (id)takeOutOperationForFeatures:(id)a3 error:(id *)a4
{
  NSObject *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[MLE5StaticShapeExecutionStreamOperationPool serialQueue](self, "serialQueue", a3, a4);
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__MLE5StaticShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke;
  v8[3] = &unk_1E3D66E20;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(v5, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)putBack:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[MLE5StaticShapeExecutionStreamOperationPool serialQueue](self, "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__MLE5StaticShapeExecutionStreamOperationPool_putBack___block_invoke;
  block[3] = &unk_1E3D66FB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pixelBufferPool, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
  objc_storeStrong((id *)&self->_modelDescription, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_programLibrary, 0);
}

uint64_t __55__MLE5StaticShapeExecutionStreamOperationPool_putBack___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_putBack:", *(_QWORD *)(a1 + 40));
}

void __81__MLE5StaticShapeExecutionStreamOperationPool_takeOutOperationForFeatures_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_takeOut");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
