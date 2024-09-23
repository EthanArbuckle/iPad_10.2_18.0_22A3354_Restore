@implementation CDMServiceGraphNode

- (void)cancel
{
  void (**cancellationBlock)(void);
  objc_super v4;

  if ((-[CDMServiceGraphNode isCancelled](self, "isCancelled") & 1) == 0)
  {
    cancellationBlock = (void (**)(void))self->_cancellationBlock;
    if (cancellationBlock)
      cancellationBlock[2]();
    v4.receiver = self;
    v4.super_class = (Class)CDMServiceGraphNode;
    -[CDMServiceGraphNode cancel](&v4, sel_cancel);
  }
}

- (id)getNodeName
{
  return self->_nodeName;
}

- (id)getHandlerId
{
  return self->_handlerId;
}

- (void)addDependency:(id)a3
{
  id v4;
  NSHashTable *v5;
  objc_super v6;

  v4 = a3;
  v5 = self->_successors;
  objc_sync_enter(v5);
  v6.receiver = self;
  v6.super_class = (Class)CDMServiceGraphNode;
  -[CDMServiceGraphNode addDependency:](&v6, sel_addDependency_, v4);
  objc_msgSend(v4, "addSuccessor:", self);
  objc_sync_exit(v5);

}

- (void)removeDependency:(id)a3
{
  id v4;
  NSHashTable *v5;
  objc_super v6;

  v4 = a3;
  v5 = self->_successors;
  objc_sync_enter(v5);
  v6.receiver = self;
  v6.super_class = (Class)CDMServiceGraphNode;
  -[CDMServiceGraphNode removeDependency:](&v6, sel_removeDependency_, v4);
  objc_msgSend(v4, "removeSuccessor:", self);
  objc_sync_exit(v5);

}

- (void)addSuccessor:(id)a3
{
  -[NSHashTable addObject:](self->_successors, "addObject:", a3);
}

- (void)removeSuccessor:(id)a3
{
  -[NSHashTable removeObject:](self->_successors, "removeObject:", a3);
}

- (id)getSuccessors
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSHashTable allObjects](self->_successors, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isFinished
{
  CDMServiceGraphNode *v2;
  unsigned __int8 v3;
  BOOL v4;
  objc_super v6;

  v2 = self;
  objc_sync_enter(v2);
  if (-[CDMServiceGraphNode nodeIsUsingAsync](v2, "nodeIsUsingAsync"))
  {
    v3 = -[CDMServiceGraphNode asyncIsFinished](v2, "asyncIsFinished");
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)CDMServiceGraphNode;
    v3 = -[CDMServiceGraphNode isFinished](&v6, sel_isFinished);
  }
  v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)isExecuting
{
  CDMServiceGraphNode *v2;
  unsigned __int8 v3;
  BOOL v4;
  objc_super v6;

  v2 = self;
  objc_sync_enter(v2);
  if (-[CDMServiceGraphNode nodeIsUsingAsync](v2, "nodeIsUsingAsync"))
  {
    v3 = -[CDMServiceGraphNode nodeIsExecutingAsync](v2, "nodeIsExecutingAsync");
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)CDMServiceGraphNode;
    v3 = -[CDMServiceGraphNode isExecuting](&v6, sel_isExecuting);
  }
  v4 = v3;
  objc_sync_exit(v2);

  return v4;
}

- (BOOL)isAsynchronous
{
  CDMServiceGraphNode *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CDMServiceGraphNode nodeIsUsingAsync](v2, "nodeIsUsingAsync");
  objc_sync_exit(v2);

  return v3;
}

- (void)willUseAsyncMarkNodeAsFinished
{
  CDMServiceGraphNode *obj;

  obj = self;
  objc_sync_enter(obj);
  -[CDMServiceGraphNode setNodeIsUsingAsync:](obj, "setNodeIsUsingAsync:", 1);
  -[CDMServiceGraphNode setNodeIsExecutingAsync:](obj, "setNodeIsExecutingAsync:", 1);
  objc_sync_exit(obj);

}

- (void)asyncMarkNodeAsFinished
{
  CDMServiceGraphNode *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[CDMServiceGraphNode nodeIsUsingAsync](obj, "nodeIsUsingAsync"))
  {
    -[CDMServiceGraphNode willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("isExecuting"));
    -[CDMServiceGraphNode setNodeIsExecutingAsync:](obj, "setNodeIsExecutingAsync:", 0);
    -[CDMServiceGraphNode didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("isExecuting"));
    -[CDMServiceGraphNode willChangeValueForKey:](obj, "willChangeValueForKey:", CFSTR("isFinished"));
    -[CDMServiceGraphNode setAsyncIsFinished:](obj, "setAsyncIsFinished:", 1);
    -[CDMServiceGraphNode didChangeValueForKey:](obj, "didChangeValueForKey:", CFSTR("isFinished"));
  }
  objc_sync_exit(obj);

}

- (BOOL)nodeIsUsingAsync
{
  return self->_nodeIsUsingAsync;
}

- (void)setNodeIsUsingAsync:(BOOL)a3
{
  self->_nodeIsUsingAsync = a3;
}

- (BOOL)nodeIsExecutingAsync
{
  return self->_nodeIsExecutingAsync;
}

- (void)setNodeIsExecutingAsync:(BOOL)a3
{
  self->_nodeIsExecutingAsync = a3;
}

- (BOOL)asyncIsFinished
{
  return self->_asyncIsFinished;
}

- (void)setAsyncIsFinished:(BOOL)a3
{
  self->_asyncIsFinished = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successors, 0);
  objc_storeStrong((id *)&self->_handlerId, 0);
  objc_storeStrong((id *)&self->_nodeName, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
}

+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 withError:(id)a5 usingFunction:(id)a6 dataDispatcherContext:(id)a7
{
  return +[CDMServiceGraphNode initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:](CDMServiceGraphNode, "initWithName:forHandler:withError:usingFunction:requestId:dataDispatcherContext:serviceMetricsArray:", a3, a4, a5, a6, 0, a7, 0);
}

+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 withError:(id)a5 usingFunction:(id)a6 requestId:(id)a7 dataDispatcherContext:(id)a8 serviceMetricsArray:(id)a9
{
  return +[CDMServiceGraphNode initWithName:forHandler:usingFunction:withError:cancellationBlock:requestId:dataDispatcherContext:serviceMetricsArray:](CDMServiceGraphNode, "initWithName:forHandler:usingFunction:withError:cancellationBlock:requestId:dataDispatcherContext:serviceMetricsArray:", a3, a4, a6, a5, 0, a7, a8, a9);
}

+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 usingFunction:(id)a5 withError:(id)a6 cancellationBlock:(id)a7 dataDispatcherContext:(id)a8
{
  return +[CDMServiceGraphNode initWithName:forHandler:usingFunction:withError:cancellationBlock:requestId:dataDispatcherContext:serviceMetricsArray:](CDMServiceGraphNode, "initWithName:forHandler:usingFunction:withError:cancellationBlock:requestId:dataDispatcherContext:serviceMetricsArray:", a3, a4, a5, a6, 0, 0, a8, 0);
}

+ (CDMServiceGraphNode)initWithName:(id)a3 forHandler:(id)a4 usingFunction:(id)a5 withError:(id)a6 cancellationBlock:(id)a7 requestId:(id)a8 dataDispatcherContext:(id)a9 serviceMetricsArray:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD aBlock[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46[2];
  id location;
  objc_super v48;

  v16 = a3;
  v35 = a4;
  v38 = a4;
  v17 = a5;
  v18 = a6;
  v39 = a7;
  v37 = a8;
  v36 = a9;
  v19 = a10;
  CDMOSLoggerForCategory(4);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = (void *)os_signpost_id_generate(v20);

  v48.receiver = a1;
  v48.super_class = (Class)&OBJC_METACLASS___CDMServiceGraphNode;
  v22 = objc_msgSend(objc_msgSendSuper2(&v48, sel_alloc), "init");
  objc_initWeak(&location, (id)v22);
  objc_msgSend((id)v22, "setNodeIsUsingAsync:", 0);
  objc_msgSend((id)v22, "setNodeIsExecutingAsync:", 0);
  objc_msgSend((id)v22, "setAsyncIsFinished:", 0);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke;
  aBlock[3] = &unk_24DCAC140;
  v23 = v16;
  v41 = v23;
  v46[1] = v21;
  v24 = v17;
  v44 = v24;
  objc_copyWeak(v46, &location);
  v25 = v38;
  v42 = v25;
  v26 = v18;
  v45 = v26;
  v27 = v19;
  v43 = v27;
  v28 = _Block_copy(aBlock);
  objc_msgSend((id)v22, "addExecutionBlock:", v28);
  if (v22)
  {
    v29 = _Block_copy(v39);
    v30 = *(void **)(v22 + 264);
    *(_QWORD *)(v22 + 264) = v29;

    objc_storeStrong((id *)(v22 + 272), a3);
    objc_storeStrong((id *)(v22 + 280), v35);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = *(void **)(v22 + 288);
    *(_QWORD *)(v22 + 288) = v31;

  }
  objc_destroyWeak(v46);

  objc_destroyWeak(&location);
  return (CDMServiceGraphNode *)(id)v22;
}

void __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  dispatch_block_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[6];
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  _BYTE *v23;
  uint64_t *v24;
  id v25[2];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  void *v37;
  _BYTE buf[24];
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v2 = dispatch_time(0, 3000000000);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3566;
  v30 = __Block_byref_object_dispose__3567;
  v31 = 0;
  v3 = +[CDMSELFLogUtil stringNodeNameToEnum:](CDMSELFLogUtil, "stringNodeNameToEnum:", *(_QWORD *)(a1 + 32));
  if (!(_DWORD)v3 && (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("metricsNode")) & 1) == 0)
  {
    CDMOSLoggerForCategory(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "+[CDMServiceGraphNode initWithName:forHandler:usingFunction:withError:cancellationBlock:reque"
                           "stId:dataDispatcherContext:serviceMetricsArray:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v5;
      _os_log_impl(&dword_21A2A0000, v4, OS_LOG_TYPE_INFO, "%s [WARN]: Unmapped CDM service node name for handle: %@", buf, 0x16u);
    }

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v39 = __Block_byref_object_copy__3566;
  v40 = __Block_byref_object_dispose__3567;
  v41 = objc_alloc_init(MEMORY[0x24BE95418]);
  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setServiceName:", v3);
  v6 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_231;
  block[3] = &unk_24DCAC0F0;
  v25[1] = *(id *)(a1 + 80);
  v20 = *(id *)(a1 + 32);
  v23 = buf;
  v22 = *(id *)(a1 + 56);
  objc_copyWeak(v25, (id *)(a1 + 72));
  v21 = *(id *)(a1 + 40);
  v24 = &v26;
  v7 = dispatch_block_create((dispatch_block_flags_t)0, block);
  dispatch_block_perform((dispatch_block_flags_t)0, v7);
  if (dispatch_block_wait(v7, v2))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Node [%@] for handler [%@] timed out."), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CDMOSLoggerForCategory(2);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v32 = 136315394;
      *(_QWORD *)&v32[4] = "+[CDMServiceGraphNode initWithName:forHandler:usingFunction:withError:cancellationBlock:reque"
                           "stId:dataDispatcherContext:serviceMetricsArray:]_block_invoke";
      *(_WORD *)&v32[12] = 2112;
      *(_QWORD *)&v32[14] = v8;
      _os_log_error_impl(&dword_21A2A0000, v9, OS_LOG_TYPE_ERROR, "%s [ERR]: %@", v32, 0x16u);
    }

    v10 = (void *)MEMORY[0x24BDD1540];
    v11 = *(_QWORD *)(a1 + 32);
    v36 = *MEMORY[0x24BDD0FC8];
    v37 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 0, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v27[5];
    v27[5] = v13;

    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setFailureReason:", 4);
  }
  if (v27[5] && (v15 = *(_QWORD *)(a1 + 64)) != 0)
  {
    (*(void (**)(void))(v15 + 16))();
  }
  else
  {
    v16 = *(void **)(a1 + 48);
    if (v16)
    {
      *(_QWORD *)v32 = 0;
      *(_QWORD *)&v32[8] = v32;
      *(_QWORD *)&v32[16] = 0x3032000000;
      v33 = __Block_byref_object_copy__3566;
      v34 = __Block_byref_object_dispose__3567;
      v35 = v16;
      +[CDMDataDispatcherCompletionQueue getDataDispatcherCompletionQueue](CDMDataDispatcherCompletionQueue, "getDataDispatcherCompletionQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = v6;
      v18[1] = 3221225472;
      v18[2] = __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_243;
      v18[3] = &unk_24DCAC118;
      v18[4] = v32;
      v18[5] = buf;
      dispatch_async(v17, v18);

      _Block_object_dispose(v32, 8);
    }
  }

  objc_destroyWeak(v25);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v26, 8);
}

uint64_t __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_231(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CDMOSLoggerForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 80);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ServiceGraphNodeExecution", "%@ handle", buf, 0xCu);
  }

  mach_absolute_time();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setStartLogicalTimestampInNs:", SiriAnalyticsMachAbsoluteTimeGetNanoseconds());
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_233;
  v10[3] = &unk_24DCAC0C8;
  v11 = *(id *)(a1 + 48);
  objc_copyWeak(&v12, (id *)(a1 + 72));
  +[CDMExceptionUtils runWrappingCppExceptions:](CDMExceptionUtils, "runWrappingCppExceptions:", v10);
  objc_destroyWeak(&v12);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFailureReason:", 3);
  CDMOSLoggerForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 80);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21A2A0000, v7, OS_SIGNPOST_INTERVAL_END, v8, "ServiceGraphNodeExecution", ", buf, 2u);
  }

  mach_absolute_time();
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setEndLogicalTimestampInNs:", SiriAnalyticsMachAbsoluteTimeGetNanoseconds());
}

uint64_t __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_243(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __141__CDMServiceGraphNode_initWithName_forHandler_usingFunction_withError_cancellationBlock_requestId_dataDispatcherContext_serviceMetricsArray___block_invoke_233(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

@end
