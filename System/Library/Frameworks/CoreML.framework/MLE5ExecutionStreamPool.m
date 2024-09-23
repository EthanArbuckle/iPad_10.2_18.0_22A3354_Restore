@implementation MLE5ExecutionStreamPool

- (MLE5ExecutionStreamPool)initWithModelConfiguration:(id)a3 modelSignpostId:(unint64_t)a4
{
  id v7;
  MLE5ExecutionStreamPool *v8;
  MLE5ExecutionStreamPool *v9;
  uint64_t v10;
  NSMutableSet *pool;
  uint64_t v12;
  NSMutableSet *allStreams;
  dispatch_queue_t v14;
  OS_dispatch_queue *serialQueue;
  objc_super v17;

  v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MLE5ExecutionStreamPool;
  v8 = -[MLE5ExecutionStreamPool init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_modelConfiguration, a3);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    pool = v9->_pool;
    v9->_pool = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    allStreams = v9->_allStreams;
    v9->_allStreams = (NSMutableSet *)v12;

    v14 = dispatch_queue_create("com.apple.coreml.MLE5Engine.streamPoolQueue", 0);
    serialQueue = v9->_serialQueue;
    v9->_serialQueue = (OS_dispatch_queue *)v14;

    v9->_modelSignpostId = a4;
  }

  return v9;
}

- (id)takeOut
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3540;
  v11 = __Block_byref_object_dispose__3541;
  v12 = 0;
  -[MLE5ExecutionStreamPool serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__MLE5ExecutionStreamPool_takeOut__block_invoke;
  v6[3] = &unk_1E3D66E20;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  objc_msgSend((id)v8[5], "cancelPendingReset");
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)putBack:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;

  v4 = a3;
  -[MLE5ExecutionStreamPool modelConfiguration](self, "modelConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "optimizationHints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MLE5ExecutionStreamPool modelConfiguration](self, "modelConfiguration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "optimizationHints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "hotHandDuration");
    v10 = v9;

  }
  else
  {
    v10 = 1.0;
  }
  objc_msgSend(v4, "resetAfterLingering:", v10);
  -[MLE5ExecutionStreamPool serialQueue](self, "serialQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__MLE5ExecutionStreamPool_putBack___block_invoke;
  block[3] = &unk_1E3D66FB8;
  block[4] = self;
  v14 = v4;
  v12 = v4;
  dispatch_sync(v11, block);

}

- (void)_emitMappingTracepointForStream:(id)a3
{
  id v4;

  v4 = a3;
  -[MLE5ExecutionStreamPool modelSignpostId](self, "modelSignpostId");
  objc_msgSend(v4, "streamId");
  kdebug_trace();

}

- (void)enableInstrumentsTracing
{
  NSObject *v3;
  _QWORD block[5];

  -[MLE5ExecutionStreamPool serialQueue](self, "serialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__MLE5ExecutionStreamPool_enableInstrumentsTracing__block_invoke;
  block[3] = &unk_1E3D66E48;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (MLModelConfiguration)modelConfiguration
{
  return self->_modelConfiguration;
}

- (NSMutableSet)pool
{
  return self->_pool;
}

- (NSMutableSet)allStreams
{
  return self->_allStreams;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (unint64_t)modelSignpostId
{
  return self->_modelSignpostId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_allStreams, 0);
  objc_storeStrong((id *)&self->_pool, 0);
  objc_storeStrong((id *)&self->_modelConfiguration, 0);
}

void __51__MLE5ExecutionStreamPool_enableInstrumentsTracing__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allStreams", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "_emitMappingTracepointForStream:", *(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5++));
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

void __35__MLE5ExecutionStreamPool_putBack___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "pool");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __34__MLE5ExecutionStreamPool_takeOut__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  MLE5ExecutionStream *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "pool");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "anyObject");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "pool");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  }
  else
  {
    v5 = objc_alloc_init(MLE5ExecutionStream);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(a1 + 32), "allStreams");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

    objc_msgSend(*(id *)(a1 + 32), "_emitMappingTracepointForStream:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }
}

@end
