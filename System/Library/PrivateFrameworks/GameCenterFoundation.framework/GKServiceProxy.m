@implementation GKServiceProxy

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  id v15;
  objc_super v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)GKServiceProxy;
  -[GKServiceProxy methodSignatureForSelector:](&v16, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    NSStringFromSelector(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKServiceProxy baseProxy](self, "baseProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "interfaceLookup");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "protocol");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v13 = (void *)MEMORY[0x1E0C99DA0];
      v17 = CFSTR("selector");
      v18[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "exceptionWithName:reason:userInfo:", CFSTR("GKNoSuchServiceException"), CFSTR("Attempted to dispatch a selector which is not recognized by any service"), v14);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v15);
    }
    v11 = (void *)v10;
    -[GKServiceProxy methodSignatureForProtocol:selector:](self, "methodSignatureForProtocol:selector:", v10, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)methodSignatureForProtocol:(id)a3 selector:(SEL)a4
{
  Protocol *v5;
  char *types;
  objc_method_description MethodDescription;
  objc_method_description v8;
  void *v9;

  v5 = (Protocol *)a3;
  MethodDescription = protocol_getMethodDescription(v5, a4, 1, 1);
  types = MethodDescription.types;
  if (MethodDescription.name || (v8 = protocol_getMethodDescription(v5, a4, 0, 1), types = v8.types, v8.name))
  {
    objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", types);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unsigned)serviceGeneration
{
  return self->_serviceGeneration;
}

- (void)replyToDuplicatesForRequest:(id)a3 withInvocation:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKThreadsafeDictionary *pendingRequests;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    pendingRequests = self->_pendingRequests;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke;
    v12[3] = &unk_1E75B53C8;
    v13 = v8;
    v14 = v10;
    v15 = v9;
    -[GKThreadsafeDictionary writeToDictionary:](pendingRequests, "writeToDictionary:", v12);

  }
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_2(id *a1)
{
  const char *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  const char *v25;

  v2 = (const char *)objc_msgSend(a1[4], "selector");
  NSStringFromSelector(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "_gkReplyHandlerInvocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "serviceLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (v4)
    {
      objc_msgSend(a1[5], "requestIdentifierForInvocation:", a1[4]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)*((_QWORD *)a1[5] + 2);
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __36__GKServiceProxy_forwardInvocation___block_invoke_3;
      v17[3] = &unk_1E75B53A0;
      v18 = v7;
      v19 = v3;
      v20 = a1[4];
      v21 = v4;
      v22 = a1[6];
      v9 = v6;
      v10 = a1[5];
      v23 = v9;
      v24 = v10;
      v25 = v2;
      v11 = v7;
      objc_msgSend(v8, "writeToDictionary:", v17);

    }
    else
    {
      objc_msgSend(v6, "remoteObjectProxy");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!os_log_GKGeneral)
        v16 = GKOSLoggers();
      if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
        __36__GKServiceProxy_forwardInvocation___block_invoke_2_cold_2();
      objc_msgSend(a1[4], "_gkInvokeOnceWithTarget:", v15);
      objc_msgSend(a1[4], "_gkClearCopiedArguments");

    }
  }
  else
  {
    if (!os_log_GKGeneral)
      v12 = GKOSLoggers();
    v13 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __36__GKServiceProxy_forwardInvocation___block_invoke_2_cold_1(v13, v2);
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 3, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_gkCallbackWithError:queue:", v14, MEMORY[0x1E0C80D38]);

    objc_msgSend(a1[4], "_gkClearCopiedArguments");
  }

}

- (NSDictionary)serviceLookup
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (id)requestIdentifierForInvocation:(id)a3
{
  return +[GKRequestIdentifier requestIdentifierForInvocation:](GKRequestIdentifier, "requestIdentifierForInvocation:", a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  GKServiceProxy *v14;

  v4 = a3;
  -[GKServiceProxy buildServiceLookupIfNecessary](self, "buildServiceLookupIfNecessary");
  objc_msgSend(v4, "_gkCopyArguments");
  -[GKServiceProxy baseProxy](self, "baseProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("forwarding %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__GKServiceProxy_forwardInvocation___block_invoke;
  v11[3] = &unk_1E75B1A78;
  v12 = v5;
  v13 = v4;
  v14 = self;
  v9 = v4;
  v10 = v5;
  +[GKActivity named:execute:](GKActivity, "named:execute:", v8, v11);

}

- (GKDaemonProxy)baseProxy
{
  return (GKDaemonProxy *)objc_getProperty(self, a2, 24, 1);
}

- (GKPlayerInternal)localPlayer
{
  return (GKPlayerInternal *)objc_loadWeakRetained((id *)&self->_localPlayer);
}

- (void)setServiceLookup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setServiceGeneration:(unsigned int)a3
{
  self->_serviceGeneration = a3;
}

- (void)addService:(id)a3 forProtocol:(id)a4 toLookup:(id)a5
{
  id v7;
  Protocol *v8;
  id v9;
  objc_method_description *v10;
  objc_method_description *v11;
  unsigned int v12;
  SEL *p_name;
  void *v14;
  void *v15;
  objc_method_description *v16;
  objc_method_description *v17;
  unsigned int v18;
  SEL *v19;
  void *v20;
  void *v21;
  unsigned int outCount;

  v7 = a3;
  v8 = (Protocol *)a4;
  v9 = a5;
  if (v7)
  {
    outCount = 0;
    v10 = protocol_copyMethodDescriptionList(v8, 1, 1, &outCount);
    v11 = v10;
    if (outCount)
    {
      v12 = 0;
      p_name = &v10->name;
      do
      {
        NSStringFromSelector(*p_name);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
          objc_msgSend(v9, "setObject:forKey:", v7, v14);

        ++v12;
        p_name += 2;
      }
      while (v12 < outCount);
    }
    free(v11);
    v16 = protocol_copyMethodDescriptionList(v8, 0, 1, &outCount);
    v17 = v16;
    if (outCount)
    {
      v18 = 0;
      v19 = &v16->name;
      do
      {
        NSStringFromSelector(*v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v21)
          objc_msgSend(v9, "setObject:forKey:", v7, v20);

        ++v18;
        v19 += 2;
      }
      while (v18 < outCount);
    }
    free(v17);
  }

}

- (void)setLocalPlayer:(id)a3
{
  objc_storeWeak((id *)&self->_localPlayer, a3);
}

- (GKServiceProxy)initWithPlayer:(id)a3
{
  id v4;
  GKServiceProxy *v5;
  NSObject *v6;
  id v7;
  GKThreadsafeDictionary *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  GKThreadsafeDictionary *pendingRequests;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GKServiceProxy;
  v5 = -[GKServiceProxy init](&v14, sel_init);
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[GKServiceProxy initWithPlayer:].cold.1();
    if (!v5)
      goto LABEL_11;
  }
  else if (!v5)
  {
    goto LABEL_11;
  }
  v8 = [GKThreadsafeDictionary alloc];
  if (v4)
  {
    objc_msgSend(v4, "playerID");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("global");
  }
  objc_msgSend(CFSTR("com.apple.gamecenter.pendingRequests-"), "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[GKThreadsafeDictionary initWithName:](v8, "initWithName:", v10);
  pendingRequests = v5->_pendingRequests;
  v5->_pendingRequests = (GKThreadsafeDictionary *)v11;

  if (v4)
  objc_storeWeak((id *)&v5->_localPlayer, v4);
LABEL_11:

  return v5;
}

- (void)setBaseProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  _QWORD v28[3];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    if (!os_log_GKGeneral)
      v5 = GKOSLoggers();
    v6 = os_log_GKPerf;
    if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
      __36__GKServiceProxy_forwardInvocation___block_invoke_3_cold_2(a1, v6, v7);
    objc_msgSend(*(id *)(a1 + 56), "target");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");

    objc_msgSend(v4, "addObject:", v9);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "concurrentRequestSemaphore");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, *(_QWORD *)(a1 + 32));

    v12 = *(void **)(a1 + 72);
    v28[0] = CFSTR("timestamp");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CFAbsoluteTimeGetCurrent());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 32);
    v29[0] = v13;
    v29[1] = v14;
    v28[1] = CFSTR("requestID");
    v28[2] = CFSTR("subproxy");
    v29[2] = *(_QWORD *)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __36__GKServiceProxy_forwardInvocation___block_invoke_431;
    v22 = &unk_1E75B5378;
    v16 = *(_QWORD *)(a1 + 88);
    v23 = *(_QWORD *)(a1 + 80);
    v27 = v16;
    v24 = *(id *)(a1 + 56);
    v25 = *(id *)(a1 + 32);
    v9 = v10;
    v26 = v9;
    objc_msgSend(v12, "remoteObjectProxyWithUserInfo:errorHandler:", v15, &v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!os_log_GKGeneral)
      v18 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
      __36__GKServiceProxy_forwardInvocation___block_invoke_3_cold_1();
    objc_msgSend(*(id *)(a1 + 48), "_gkInvokeOnceWithTarget:", v17, v19, v20, v21, v22, v23);

  }
  objc_msgSend(*(id *)(a1 + 48), "_gkClearCopiedArguments");

}

void __36__GKServiceProxy_forwardInvocation___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "invocationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__GKServiceProxy_forwardInvocation___block_invoke_2;
  block[3] = &unk_1E75B1A78;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  dispatch_async(v2, block);

}

void __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v4 = a2;
  objc_msgSend(v4, "objectForKey:", a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_2;
    v5[3] = &unk_1E75B07F8;
    v6 = a1[4];
    v7 = a1[5];
    v8 = a1[6];
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  }
  objc_msgSend(v4, "removeObjectForKey:", a1[4]);

}

void __36__GKServiceProxy_forwardInvocation___block_invoke_431(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "baseProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replyQueueForRequestSelector:", *(_QWORD *)(a1 + 64));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_gkCallbackWithError:queue:", v4, v6);
  objc_msgSend(*(id *)(a1 + 32), "replyToDuplicatesForRequest:withInvocation:queue:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), v6);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));

}

void __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
    __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_2_cold_1();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_434;
  v7[3] = &unk_1E75B1A28;
  v5 = *(NSObject **)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_434(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_gkInvokeOnceWithTarget:", *(_QWORD *)(a1 + 40));
}

- (BOOL)needsBuildUpServiceLookup
{
  unsigned int v3;
  void *v4;
  void *v5;
  NSObject *v7;
  id v8;

  v3 = -[GKServiceProxy serviceGeneration](self, "serviceGeneration");
  -[GKServiceProxy baseProxy](self, "baseProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == objc_msgSend(v4, "serviceGeneration"))
  {
    -[GKServiceProxy serviceLookup](self, "serviceLookup");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      return 0;
  }
  else
  {

  }
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[GKServiceProxy needsBuildUpServiceLookup].cold.1(self, v7);
  return 1;
}

- (void)buildServiceLookupIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  CFAbsoluteTime Current;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  CFAbsoluteTime v15;

  if (-[GKServiceProxy needsBuildUpServiceLookup](self, "needsBuildUpServiceLookup"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]Building service lookup from stack: %@"), v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    Current = CFAbsoluteTimeGetCurrent();
    -[GKServiceProxy baseProxy](self, "baseProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invocationQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke;
    block[3] = &unk_1E75B39E0;
    block[4] = self;
    v13 = v3;
    v14 = v6;
    v15 = Current;
    v10 = v6;
    v11 = v3;
    dispatch_barrier_async(v9, block);

  }
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  CFAbsoluteTime Current;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  CFAbsoluteTime v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  int v29;
  dispatch_time_t v30;
  intptr_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  id v37;
  NSObject *v38;
  double v39;
  id v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  dispatch_queue_t v45;
  void *v46;
  id v47;
  _QWORD v48[4];
  id v49;
  NSObject *v50;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  CFAbsoluteTime v55;
  _QWORD v56[4];
  id v57;
  NSObject *v58;
  uint64_t v59;
  id v60;
  NSObject *v61;
  CFAbsoluteTime v62;
  _QWORD aBlock[5];
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  char v67;
  char v68[32];
  char v69[32];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "needsBuildUpServiceLookup"))
  {
    v3 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v4 = GKOSLoggers();
      v3 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_5(a1, (uint64_t)v2, v3);
    v5 = dispatch_group_create();
    v47 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v45 = dispatch_queue_create("com.apple.gamekit.service", v6);

    objc_msgSend(*v2, "baseProxy");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v2, "setServiceGeneration:", objc_msgSend(v7, "serviceGeneration"));

    v64 = 0;
    v65 = &v64;
    v66 = 0x2020000000;
    v8 = MEMORY[0x1E0C809B0];
    v67 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_440;
    aBlock[3] = &unk_1E75B4B80;
    aBlock[4] = &v64;
    v9 = _Block_copy(aBlock);
    objc_msgSend(*v2, "baseProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && !*((_BYTE *)v65 + 24))
    {
      dispatch_group_enter(v5);
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(*v2, "baseProxy");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "hostPID");
      objc_msgSend(*v2, "localPlayer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v8;
      v56[1] = 3221225472;
      v56[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_441;
      v56[3] = &unk_1E75B5418;
      v57 = *(id *)(a1 + 40);
      v62 = Current;
      v17 = v45;
      v18 = *(_QWORD *)(a1 + 32);
      v58 = v17;
      v59 = v18;
      v60 = v47;
      v61 = v5;
      objc_msgSend(v12, "getServicesForPID:localPlayer:reply:", v15, v16, v56);

    }
    objc_msgSend(*v2, "baseProxy", v45);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 && !*((_BYTE *)v65 + 24))
    {
      dispatch_group_enter(v5);
      v22 = CFAbsoluteTimeGetCurrent();
      objc_msgSend(*v2, "baseProxy");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hostPID");
      objc_msgSend(*v2, "localPlayer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = v8;
      v48[1] = 3221225472;
      v48[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_763;
      v48[3] = &unk_1E75B5440;
      v55 = v22;
      v49 = *(id *)(a1 + 40);
      v54 = v9;
      v50 = v5;
      v26 = v46;
      v27 = *(_QWORD *)(a1 + 32);
      v51 = v26;
      v52 = v27;
      v53 = v47;
      objc_msgSend(v21, "getPrivateServicesForPID:localPlayer:reply:", v24, v25, v48);

    }
    +[GKPreferences shared](GKPreferences, "shared");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "isInternalBuild");

    if (v29)
    {
      v30 = dispatch_time(0, 5000000000);
      v31 = dispatch_group_wait(v5, v30);
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "bundleIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = os_log_GKGeneral;
      if (v31)
      {
        if (!os_log_GKGeneral)
        {
          v35 = GKOSLoggers();
          v34 = os_log_GKGeneral;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_4();
        *((_BYTE *)v65 + 24) = 1;
      }
      else
      {
        if (!os_log_GKGeneral)
        {
          v36 = GKOSLoggers();
          v34 = os_log_GKGeneral;
        }
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_3();
      }

    }
    else
    {
      dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    }
    if (!os_log_GKGeneral)
      v37 = GKOSLoggers();
    v38 = (id)os_log_GKPerf;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v39 = CFAbsoluteTimeGetCurrent();
      __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_2(a1, (uint64_t)v69, v38, v39);
    }

    if (*((_BYTE *)v65 + 24))
    {
      v40 = 0;
    }
    else
    {
      v41 = (void *)os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v42 = GKOSLoggers();
        v41 = (void *)os_log_GKGeneral;
      }
      v43 = v41;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(a1 + 40), "UUIDString");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_1(v44, (uint64_t)v47, (uint64_t)v68, v43);
      }

      v40 = v47;
    }
    objc_msgSend(*v2, "setServiceLookup:", v40);

    _Block_object_dispose(&v64, 8);
  }
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_440(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_440_cold_1();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;

}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_441(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  CFAbsoluteTime Current;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  NSObject *queue;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  _QWORD block[5];
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  CFAbsoluteTime v62;

  v46 = a2;
  v45 = a3;
  v44 = a4;
  v43 = a5;
  v42 = a6;
  v41 = a7;
  v39 = a8;
  v37 = a9;
  v35 = a10;
  v34 = a11;
  v32 = a12;
  v19 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v20 = GKOSLoggers();
    v19 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_441_cold_2();
  if (!os_log_GKGeneral)
    v21 = GKOSLoggers();
  v22 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_441_cold_1(v22);
  Current = CFAbsoluteTimeGetCurrent();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_443;
  block[3] = &unk_1E75B53F0;
  v62 = Current;
  queue = *(NSObject **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 48);
  v48 = v46;
  v49 = *(id *)(a1 + 56);
  v50 = v45;
  v51 = v44;
  v52 = v43;
  v53 = v42;
  v54 = v41;
  v55 = v39;
  v56 = v37;
  v57 = v35;
  v58 = v34;
  v59 = v32;
  v60 = *(id *)(a1 + 32);
  v61 = *(id *)(a1 + 64);
  v33 = v32;
  v24 = v34;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v25 = v41;
  v26 = v42;
  v27 = v43;
  v28 = v44;
  v29 = v45;
  v30 = v46;
  dispatch_async(queue, block);

}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_443(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_443_cold_3(v3);
  CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 40), &unk_1EF4CE3A0, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 56), &unk_1EF4CB458, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 64), &unk_1EF4CC150, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 72), &unk_1EF4CE760, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 80), &unk_1EF4CEB68, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 88), &unk_1EF4CEEA0, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 96), &unk_1EF4CF3D0, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 104), &unk_1EF4CF450, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 112), &unk_1EF4CF4C0, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 120), &unk_1EF4CF9C0, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 128), &unk_1EF4CFAE8, *(_QWORD *)(a1 + 48));
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_443_cold_2(v5);
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_443_cold_1();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 144));
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_763(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, void *a12, void *a13)
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  double Current;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  id v37;
  NSObject *queue;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v46;
  id v47;
  _QWORD block[5];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  double v63;

  v44 = a2;
  v19 = a3;
  v20 = a4;
  v40 = a5;
  v43 = a6;
  v21 = a7;
  v46 = a8;
  v47 = a9;
  v22 = a10;
  v23 = a11;
  v42 = a12;
  v41 = a13;
  if (!os_log_GKGeneral)
    v24 = GKOSLoggers();
  v25 = v23;
  v26 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_763_cold_3(v26);
  Current = CFAbsoluteTimeGetCurrent();
  v28 = os_log_GKGeneral;
  v29 = v44;
  v30 = v21;
  v39 = v19;
  if (v44)
  {
    if (!os_log_GKGeneral)
      v31 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_763_cold_2();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    v33 = v41;
    v32 = v42;
    v29 = v44;
    v34 = v40;
    v35 = v43;
  }
  else
  {
    v36 = Current;
    if (!os_log_GKGeneral)
    {
      v37 = GKOSLoggers();
      v28 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_763_cold_1();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_765;
    block[3] = &unk_1E75B53F0;
    v63 = v36;
    queue = *(NSObject **)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 56);
    v49 = v19;
    v50 = *(id *)(a1 + 64);
    v51 = v20;
    v52 = v40;
    v35 = v43;
    v53 = v43;
    v54 = v21;
    v55 = v46;
    v56 = v47;
    v57 = v22;
    v58 = v25;
    v32 = v42;
    v59 = v42;
    v33 = v41;
    v60 = v41;
    v61 = *(id *)(a1 + 32);
    v34 = v40;
    v62 = *(id *)(a1 + 40);
    dispatch_async(queue, block);

  }
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_765(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  id v7;

  if (!os_log_GKGeneral)
    v2 = GKOSLoggers();
  v3 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_765_cold_3(v3);
  CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 40), &unk_1EF4D32B0, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 56), &unk_1EF4D3190, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 64), &unk_1EF4D3250, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 72), &unk_1EF4D3310, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 80), &unk_1EF4D3370, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 88), &unk_1EF4D33D0, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 96), &unk_1EF4D3430, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 104), &unk_1EF4D3490, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 112), &unk_1EF4D34F0, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 120), &unk_1EF4D3550, *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "addService:forProtocol:toLookup:", *(_QWORD *)(a1 + 128), &unk_1EF4D35B0, *(_QWORD *)(a1 + 48));
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  v5 = (void *)os_log_GKPerf;
  if (os_log_type_enabled((os_log_t)os_log_GKPerf, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_765_cold_2(v5);
  v6 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v7 = GKOSLoggers();
    v6 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_765_cold_1();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 144));
}

- (GKThreadsafeDictionary)pendingRequests
{
  return (GKThreadsafeDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPendingRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceLookup, 0);
  objc_destroyWeak((id *)&self->_localPlayer);
  objc_storeStrong((id *)&self->_baseProxy, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

- (void)initWithPlayer:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, (uint64_t)v1, "%@ init player:%@", v2);
  OUTLINED_FUNCTION_2();
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_2_cold_1(void *a1, const char *a2)
{
  NSObject *v3;
  uint8_t v4[24];

  v3 = OUTLINED_FUNCTION_16_0(a1);
  sel_getName(a2);
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_ERROR, "No gamed service found for selector %s", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "Sending one-way request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "Sending request %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __36__GKServiceProxy_forwardInvocation___block_invoke_3_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, a2, a3, "Preventing duplicate load for %@ %@", (uint8_t *)&v5);
  OUTLINED_FUNCTION_2();
}

void __67__GKServiceProxy_replyToDuplicatesForRequest_withInvocation_queue___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "Replying to duplicate request for %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)needsBuildUpServiceLookup
{
  void *v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a2;
  OUTLINED_FUNCTION_16_1();
  objc_msgSend(a1, "serviceLookup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10_0(&dword_1BCDE3000, v5, v6, "%@ needs to build up service lookup. serviceGeneration: %u, serviceLookup: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, a4, a3, "[%@]Setting service lookup to: %@", (uint8_t *)a3);

}

double __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3, double a4)
{
  double v4;
  double result;

  v4 = a4 - *(double *)(a1 + 56);
  *(_DWORD *)a2 = 136315394;
  *(_QWORD *)(a2 + 4) = "buildServiceLookupIfNecessary";
  *(_WORD *)(a2 + 12) = 2048;
  *(double *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, a3, (uint64_t)a3, "%s elapsed seconds:%g", (uint8_t *)a2);
  return result;
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "[%@]Done building service lookup.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_4()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[22];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_12();
  v4 = v0;
  v5 = v1;
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_cold_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_10_0(&dword_1BCDE3000, v5, v6, "[%@]Building service lookup for proxy: %@, generation: %u", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_440_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "Could not load services for GameKit. This likely means your game is missing the com.apple.developer.game-center entitlement. For more info see:\n https://developer.apple.com/documentation/bundleresources/entitlements/com_apple_developer_game-center\n\nERROR: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_441_cold_1(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_16_0(a1);
  OUTLINED_FUNCTION_13_1();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_2_0();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_441_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "[%@]Adding publicProxy services.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_443_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "[%@]Added publicProxy services.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_443_cold_2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_16_0(a1);
  OUTLINED_FUNCTION_14_0();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_6_0();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_443_cold_3(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_16_0(a1);
  OUTLINED_FUNCTION_13_1();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_2_0();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_763_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "[%@]Adding privateProxy services.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_763_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_15(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_12();
  _os_log_error_impl(&dword_1BCDE3000, v0, OS_LOG_TYPE_ERROR, "[%@]Failed to get privateProxy services. error: %@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_763_cold_3(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_16_0(a1);
  OUTLINED_FUNCTION_13_1();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_2_0();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_765_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0_5(&dword_1BCDE3000, v0, v1, "[%@]Added privateProxy services.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_765_cold_2(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_16_0(a1);
  OUTLINED_FUNCTION_14_0();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_6_0();
}

void __47__GKServiceProxy_buildServiceLookupIfNecessary__block_invoke_765_cold_3(void *a1)
{
  NSObject *v1;
  uint64_t v2;
  int v3[6];

  OUTLINED_FUNCTION_16_0(a1);
  OUTLINED_FUNCTION_13_1();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3(&dword_1BCDE3000, v1, v2, "%s elapsed seconds:%g", (uint8_t *)v3);

  OUTLINED_FUNCTION_2_0();
}

@end
