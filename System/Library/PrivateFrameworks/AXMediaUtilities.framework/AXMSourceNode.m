@implementation AXMSourceNode

- (void)nodeInitialize
{
  NSMutableArray *v3;
  NSMutableArray *nodeQueue_resultHandlers;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXMSourceNode;
  -[AXMVisionEngineNode nodeInitialize](&v5, sel_nodeInitialize);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  nodeQueue_resultHandlers = self->_nodeQueue_resultHandlers;
  self->_nodeQueue_resultHandlers = v3;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)resultHandlers
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
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = 0;
  -[AXMVisionEngineNode nodeQueue](self, "nodeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__AXMSourceNode_resultHandlers__block_invoke;
  v6[3] = &unk_1E625CA50;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __31__AXMSourceNode_resultHandlers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addResultHandler:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[AXMVisionEngineNode nodeQueue](self, "nodeQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __34__AXMSourceNode_addResultHandler___block_invoke;
    block[3] = &unk_1E625C480;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

uint64_t __34__AXMSourceNode_addResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nodeQueue_addResultHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_nodeQueue_addResultHandler:(id)a3
{
  NSMutableArray *nodeQueue_resultHandlers;
  id v4;

  nodeQueue_resultHandlers = self->_nodeQueue_resultHandlers;
  v4 = (id)MEMORY[0x1B5E12AE8](a3, a2);
  -[NSMutableArray addObject:](nodeQueue_resultHandlers, "addObject:", v4);

}

- (void)removeResultHandler:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[AXMVisionEngineNode nodeQueue](self, "nodeQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __37__AXMSourceNode_removeResultHandler___block_invoke;
    block[3] = &unk_1E625C480;
    block[4] = self;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

uint64_t __37__AXMSourceNode_removeResultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nodeQueue_removeResultHandler:", *(_QWORD *)(a1 + 40));
}

- (void)_nodeQueue_removeResultHandler:(id)a3
{
  NSMutableArray *nodeQueue_resultHandlers;
  id v4;

  nodeQueue_resultHandlers = self->_nodeQueue_resultHandlers;
  v4 = (id)MEMORY[0x1B5E12AE8](a3, a2);
  -[NSMutableArray removeObject:](nodeQueue_resultHandlers, "removeObject:", v4);

}

- (void)removeAllResultHandlers
{
  NSObject *v3;
  _QWORD block[5];

  -[AXMVisionEngineNode nodeQueue](self, "nodeQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AXMSourceNode_removeAllResultHandlers__block_invoke;
  block[3] = &unk_1E625CCC0;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __40__AXMSourceNode_removeAllResultHandlers__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nodeQueue_removeAllResultHandlers");
}

- (void)_nodeQueue_removeAllResultHandlers
{
  -[NSMutableArray removeAllObjects](self->_nodeQueue_resultHandlers, "removeAllObjects");
}

- (void)triggerWithContext:(id)a3 cacheKey:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (!-[AXMVisionEngineNode isConnected](self, "isConnected"))
  {
    AXMediaLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[AXMSourceNode triggerWithContext:cacheKey:resultHandler:].cold.1(v11);

  }
  objc_msgSend(v10, "setShouldProcessRemotely:", -[AXMSourceNode shouldProcessRemotely](self, "shouldProcessRemotely"));
  objc_msgSend(v10, "setCacheKey:", v9);

  objc_msgSend(v10, "addResultHandler:", v8);
  -[AXMSourceNode resultHandlers](self, "resultHandlers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addResultHandlers:", v12);

  -[AXMVisionEngineNode delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "triggerWithSource:context:", self, v10);

}

- (BOOL)shouldProcessRemotely
{
  return self->_shouldProcessRemotely;
}

- (void)setShouldProcessRemotely:(BOOL)a3
{
  self->_shouldProcessRemotely = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodeQueue_resultHandlers, 0);
}

- (void)triggerWithContext:(os_log_t)log cacheKey:resultHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_FAULT, "Source node not connected to any engine", v1, 2u);
}

@end
