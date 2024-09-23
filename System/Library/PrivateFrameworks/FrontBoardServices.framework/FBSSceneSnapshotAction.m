@implementation FBSSceneSnapshotAction

- (FBSSceneSnapshotAction)initWithRequests:(id)a3 expirationInterval:(double)a4 responseHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  FBSSceneSnapshotAction *v15;
  uint64_t v16;
  NSMutableArray *requests;
  FBSSceneSnapshotAction *result;
  void *v19;
  objc_super v20;

  v9 = a3;
  v10 = a5;
  if (v10)
  {
    v11 = v10;
    v12 = objc_alloc_init((Class)off_1E38E9E40);
    objc_msgSend(off_1E38E9DB8, "responderWithHandler:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (BSFloatGreaterThanFloat())
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forSetting:", v14, 1);

      objc_msgSend(v13, "setTimeout:", dispatch_time(0, (uint64_t)(a4 * 1000000000.0)));
    }
    v20.receiver = self;
    v20.super_class = (Class)FBSSceneSnapshotAction;
    v15 = -[FBSSceneSnapshotAction initWithInfo:responder:](&v20, sel_initWithInfo_responder_, v12, v13);
    if (v15)
    {
      v16 = objc_msgSend(v9, "mutableCopy");
      requests = v15->_requests;
      v15->_requests = (NSMutableArray *)v16;

      objc_storeStrong((id *)&v15->_responder, v13);
    }

    return v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneSnapshotAction initWithRequests:expirationInterval:responseHandler:].cold.1(a2, (uint64_t)self, (uint64_t)v19);
    objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
    result = (FBSSceneSnapshotAction *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)isExpired
{
  return BSAtomicGetFlag();
}

- (void)setExpired:(BOOL)a3
{
  BSAtomicSetFlag();
}

- (void)executeRequestsWithHandler:(id)a3 completionHandler:(id)a4 expirationHandler:(id)a5
{
  id v8;
  FBSSerialQueue *callOutQueue;
  id v10;
  id v11;
  id v12;
  void *v13;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  FBSSceneSnapshotAction *v19;
  id v20;

  v8 = a5;
  callOutQueue = self->super._callOutQueue;
  v10 = a4;
  v11 = a3;
  -[FBSSerialQueue assertOnQueue](callOutQueue, "assertOnQueue");
  -[FBSSceneSnapshotAction setRequestHandler:](self, "setRequestHandler:", v11);

  -[FBSSceneSnapshotAction setCompletionHandler:](self, "setCompletionHandler:", v10);
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __89__FBSSceneSnapshotAction_executeRequestsWithHandler_completionHandler_expirationHandler___block_invoke;
  v18 = &unk_1E38EBB98;
  v19 = self;
  v20 = v8;
  v12 = v8;
  v13 = (void *)BSDispatchBlockCreateWithCurrentQualityOfService();
  v14.receiver = self;
  v14.super_class = (Class)FBSSceneSnapshotAction;
  -[FBSSceneSnapshotAction setNullificationHandler:](&v14, sel_setNullificationHandler_, v13);
  -[FBSSceneSnapshotAction _executeNextRequest](self, "_executeNextRequest");

}

uint64_t __89__FBSSceneSnapshotAction_executeRequestsWithHandler_completionHandler_expirationHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setExpired:", 1);
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "cancelRequest");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = 0;

  objc_sync_exit(v2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (double)expirationInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[FBSSceneSnapshotAction info](self, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (void)setInvalidationHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  FBSSceneSnapshotAction *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you can't use the invalidation handler on this class"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544642;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = CFSTR("FBSSceneSnapshotAction.m");
    v18 = 1024;
    v19 = 101;
    v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)setNullificationHandler:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  FBSSceneSnapshotAction *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("you can't use the nullification handler on this class"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138544642;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2048;
    v15 = self;
    v16 = 2114;
    v17 = CFSTR("FBSSceneSnapshotAction.m");
    v18 = 1024;
    v19 = 105;
    v20 = 2114;
    v21 = v6;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v10, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  _bs_set_crash_log_message();
  __break(0);
}

- (void)invalidate
{
  objc_super v2;

  if (self->_responder)
  {
    -[BSActionResponder annul](self->_responder, "annul");
  }
  else
  {
    v2.receiver = self;
    v2.super_class = (Class)FBSSceneSnapshotAction;
    -[FBSSceneSnapshotAction invalidate](&v2, sel_invalidate);
  }
}

- (BOOL)_remainsActionable
{
  if (-[FBSSceneSnapshotAction isExpired](self, "isExpired"))
    return 0;
  else
    return -[FBSSceneSnapshotAction isValid](self, "isValid");
}

- (void)_finishAllRequests
{
  id requestHandler;
  void (**completionHandler)(void);
  id v5;
  void *v6;
  objc_super v7;

  requestHandler = self->_requestHandler;
  self->_requestHandler = 0;

  completionHandler = (void (**)(void))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2]();
    v5 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  v7.receiver = self;
  v7.super_class = (Class)FBSSceneSnapshotAction;
  -[FBSSceneSnapshotAction setNullificationHandler:](&v7, sel_setNullificationHandler_, 0);
  FBSSceneSnapshotActionResponseForErrorCode(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneSnapshotAction sendResponse:](self, "sendResponse:", v6);

}

- (void)_executeNextRequest
{
  void *v3;
  void *v4;
  void (**requestHandler)(id, id);
  id v6;

  -[FBSSerialQueue assertOnQueue](self->super._callOutQueue, "assertOnQueue");
  if (-[FBSSceneSnapshotAction _remainsActionable](self, "_remainsActionable"))
  {
    -[NSMutableArray firstObject](self->_requests, "firstObject");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_requests, "removeObjectAtIndex:", 0);
      -[FBSScene identifier](self->super._scene, "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSceneID:", v3);

      v4 = (void *)MEMORY[0x19AECA15C](objc_msgSend(v6, "setDelegate:", self));
      requestHandler = (void (**)(id, id))self->_requestHandler;
      if (requestHandler)
        requestHandler[2](requestHandler, v6);
      objc_autoreleasePoolPop(v4);
      objc_msgSend(v6, "setDelegate:", 0);
      -[FBSSceneSnapshotAction _executeNextRequest](self, "_executeNextRequest");
    }
    else
    {
      -[FBSSceneSnapshotAction _finishAllRequests](self, "_finishAllRequests");
    }

  }
  else
  {
    -[FBSSceneSnapshotAction _finishAllRequests](self, "_finishAllRequests");
  }
}

- (BOOL)snapshotRequest:(id)a3 performWithContext:(id)a4
{
  id v7;
  id v8;
  _BOOL4 v9;
  FBSSceneSnapshotAction *v10;
  FBSSceneSnapshotRequestHandle *v11;
  FBSSceneSnapshotRequestHandle *outgoingRequestHandle;
  FBSSceneSnapshotAction *v13;
  FBSSceneSnapshotRequestHandle *v14;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  FBSSceneSnapshotAction *v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = -[FBSSceneSnapshotAction _remainsActionable](self, "_remainsActionable");
  if (v9)
  {
    -[FBSSerialQueue assertOnQueue](self->super._callOutQueue, "assertOnQueue");
    v10 = self;
    objc_sync_enter(v10);
    if (v10->_outgoingRequestHandle)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot have existing request handle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = MEMORY[0x1E0C81028];
      v18 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138544642;
        v24 = v19;
        v25 = 2114;
        v26 = v21;
        v27 = 2048;
        v28 = v10;
        v29 = 2114;
        v30 = CFSTR("FBSSceneSnapshotAction.m");
        v31 = 1024;
        v32 = 181;
        v33 = 2114;
        v34 = v16;
        _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v23, 0x3Au);

      }
      objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
      v22 = _bs_set_crash_log_message();
      _realizeSettingsExtension_cold_3(v22);
    }
    v11 = -[FBSSceneSnapshotRequestHandle initWithRequestType:context:]([FBSSceneSnapshotRequestHandle alloc], "initWithRequestType:context:", 1, v8);
    outgoingRequestHandle = v10->_outgoingRequestHandle;
    v10->_outgoingRequestHandle = v11;

    objc_sync_exit(v10);
    -[FBSSceneSnapshotRequestHandle performRequestForScene:](v10->_outgoingRequestHandle, "performRequestForScene:", v10->super._scene);
    v13 = v10;
    objc_sync_enter(v13);
    v14 = v10->_outgoingRequestHandle;
    v10->_outgoingRequestHandle = 0;

    objc_sync_exit(v13);
  }

  return v9;
}

- (FBSSceneSnapshotAction)initWithXPCDictionary:(id)a3
{
  id v4;
  FBSSceneSnapshotAction *v5;
  void *v6;
  uint64_t v7;
  NSMutableArray *requests;
  uint64_t v9;
  BSSettings *clientExtendedData;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)FBSSceneSnapshotAction;
  v5 = -[FBSSceneSnapshotAction initWithXPCDictionary:](&v12, sel_initWithXPCDictionary_, v4);
  if (v5)
  {
    BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    requests = v5->_requests;
    v5->_requests = (NSMutableArray *)v7;

    v9 = BSCreateDeserializedBSXPCEncodableObjectFromXPCDictionaryWithKey();
    clientExtendedData = v5->_clientExtendedData;
    v5->_clientExtendedData = (BSSettings *)v9;

  }
  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FBSSceneSnapshotAction;
  v3 = a3;
  -[FBSSceneSnapshotAction encodeWithXPCDictionary:](&v4, sel_encodeWithXPCDictionary_, v3);
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
  BSSerializeBSXPCEncodableObjectToXPCDictionaryWithKey();

}

- (Class)fallbackXPCEncodableClass
{
  return (Class)objc_opt_class();
}

- (id)requestHandler
{
  return self->_requestHandler;
}

- (void)setRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BSSettings)clientExtendedData
{
  return self->_clientExtendedData;
}

- (void)setClientExtendedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientExtendedData, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_outgoingRequestHandle, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_requestHandler, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)initWithRequests:(const char *)a1 expirationInterval:(uint64_t)a2 responseHandler:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSSceneSnapshotAction.m");
  v16 = 1024;
  v17 = 40;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
