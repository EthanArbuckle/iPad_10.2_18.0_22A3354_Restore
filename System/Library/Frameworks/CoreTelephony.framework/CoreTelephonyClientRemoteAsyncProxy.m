@implementation CoreTelephonyClientRemoteAsyncProxy

uint64_t __57__CoreTelephonyClientRemoteAsyncProxy_forwardInvocation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", *(_QWORD *)(a1 + 40));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[CTXPCServiceInterface methodSignatureForSelector:](self->_target, "methodSignatureForSelector:", a3);
}

- (void).cxx_destruct
{
  NSObject *fObj;

  fObj = self->_userQueue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
  objc_storeStrong((id *)&self->_target, 0);
}

void __57__CoreTelephonyClientRemoteAsyncProxy_forwardInvocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "retainArguments");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CoreTelephonyClientRemoteAsyncProxy_forwardInvocation___block_invoke_2;
  v6[3] = &unk_1E152FE98;
  v7 = v3;
  v8 = *(id *)(a1 + 32);
  v4 = *(NSObject **)(a1 + 40);
  v5 = v3;
  dispatch_async(v4, v6);

}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *fObj;
  id v14;
  uint64_t v15;
  id v16;
  void *aBlock;
  uint8_t buf[24];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "methodSignature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfArguments");
  if (v6 < 3)
    goto LABEL_7;
  v7 = 0;
  v8 = v6 - 2;
  while (strcmp((const char *)objc_msgSend(objc_retainAutorelease(v5), "getArgumentTypeAtIndex:", v7 + 2), "@?"))
  {
    if (v8 == ++v7)
      goto LABEL_7;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFDLL)
  {
LABEL_7:
    v9 = CTLogClient();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreTelephonyClientRemoteAsyncProxy forwardInvocation:].cold.1(v10, buf, v9);
    }
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v11 = v7 + 2;
  }
  aBlock = 0;
  objc_msgSend(v4, "getArgument:atIndex:", &aBlock, v11);
  _Block_signature(aBlock);
  v12 = (void *)objc_msgSend(aBlock, "copy");
  fObj = self->_userQueue.fObj.fObj;
  if (fObj)
    dispatch_retain((dispatch_object_t)self->_userQueue.fObj.fObj);
  v15 = MEMORY[0x1E0C809B0];
  if (fObj)
    dispatch_retain(fObj);
  v14 = v12;
  v16 = (id)__NSMakeSpecialForwardingCaptureBlock();
  objc_msgSend(v4, "setArgument:atIndex:", &v16, v11, v15, 3321888768, __57__CoreTelephonyClientRemoteAsyncProxy_forwardInvocation___block_invoke, &unk_1E152D268);
  objc_msgSend(v4, "invokeWithTarget:", self->_target);

  if (fObj)
  {
    dispatch_release(fObj);
    dispatch_release(fObj);
  }

}

- (CoreTelephonyClientRemoteAsyncProxy)initWithXPCObject:(id)a3 userQueue:(queue)a4 errorHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  CTXPCServiceInterface *v13;
  CTXPCServiceInterface *target;
  dispatch_object_s *v15;
  NSObject *fObj;
  _QWORD v18[4];
  id v19;
  dispatch_object_t object;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x186DBA8B0]();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3321888768;
  v18[2] = __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke;
  v18[3] = &unk_1E152D230;
  v11 = *(NSObject **)a4.fObj.fObj;
  object = v11;
  if (v11)
    dispatch_retain(v11);
  v12 = v9;
  v19 = v12;
  objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v18);
  v13 = (CTXPCServiceInterface *)objc_claimAutoreleasedReturnValue();
  target = self->_target;
  self->_target = v13;

  if (object)
    dispatch_release(object);
  objc_autoreleasePoolPop(v10);
  v15 = *(dispatch_object_s **)a4.fObj.fObj;
  *(_QWORD *)a4.fObj.fObj = 0;
  fObj = self->_userQueue.fObj.fObj;
  self->_userQueue.fObj.fObj = v15;
  if (fObj)
    dispatch_release(fObj);

  return self;
}

void __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  v4 = CTLogClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke_1;
  v8[3] = &unk_1E152F7F0;
  v5 = *(id *)(a1 + 32);
  v9 = v3;
  v10 = v5;
  v6 = *(NSObject **)(a1 + 40);
  v7 = v3;
  dispatch_async(v6, v8);

}

uint64_t __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __80__CoreTelephonyClientRemoteAsyncProxy_initWithXPCObject_userQueue_errorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18425C000, a2, OS_LOG_TYPE_ERROR, "Remote object proxy returned error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)forwardInvocation:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_18425C000, log, OS_LOG_TYPE_FAULT, "CoreTelephonyClientRemoteAsyncProxy: Unable to find REQUIRED reply block for selector %@.", buf, 0xCu);

}

@end
