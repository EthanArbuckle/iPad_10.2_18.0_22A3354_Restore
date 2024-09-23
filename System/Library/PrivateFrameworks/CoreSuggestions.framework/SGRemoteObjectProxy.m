@implementation SGRemoteObjectProxy

- (SGRemoteObjectProxy)initWithConnection:(id)a3 queuesRequestsIfBusy:(BOOL)a4
{
  id v7;
  SGRemoteObjectProxy *v8;
  SGRemoteObjectProxy *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SGRemoteObjectProxy;
  v8 = -[SGRemoteObjectProxy init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_queuesRequestsIfBusy = a4;
  }

  return v9;
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_8(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  (*(void (**)(void))(a1[6] + 16))();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a1[8], a1[4], CFSTR("SGSuggestionsService.m"), 285, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[response isKindOfClass:[SGXPCResponse class]]"));

  }
  v3 = a1[7];
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  v4 = (id)objc_opt_self();

}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "lock");
  objc_msgSend(*(id *)(a1 + 48), "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 48), "removeObjectAtIndex:", 0);
  objc_msgSend(*(id *)(a1 + 40), "unlock");
  objc_msgSend(v3, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeWithTarget:", v2);

}

+ (id)_copyInvocationToHeapIfNeeded:(id)a3
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  size_t v11;
  unint64_t v12;
  NSUInteger v13;
  size_t v14;
  char *v15;
  unint64_t v16;
  void *v18;
  size_t v19;
  int v20;
  id v21;
  NSUInteger alignp[2];
  NSUInteger sizep[2];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (malloc_size(v5))
    return v5;
  v7 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v5, "methodSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "target");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTarget:", v10);

  if (objc_msgSend(v8, "numberOfArguments"))
  {
    v11 = 0;
    if (objc_msgSend(v8, "numberOfArguments"))
    {
      v12 = 0;
      v13 = 1;
      do
      {
        sizep[0] = 0;
        NSGetSizeAndAlignment((const char *)objc_msgSend(v8, "getArgumentTypeAtIndex:", v12, 0), sizep, alignp);
        if (v11 <= sizep[0])
          v11 = sizep[0];
        if (v13 <= alignp[0])
          v13 = alignp[0];
        ++v12;
      }
      while (v12 < objc_msgSend(v8, "numberOfArguments"));
    }
    else
    {
      v13 = 1;
    }
    v14 = v13 - 1 + v11;
    alignp[0] = 0;
    alignp[1] = 0;
    if (v14 >= 0x201)
    {
      if (v13 <= 8)
        v19 = 8;
      else
        v19 = v13;
      v20 = malloc_type_posix_memalign((void **)alignp, v19, v11, 0xB4DB37F3uLL);
      LOBYTE(alignp[1]) = 0;
      if (v20)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v21);
      }
    }
    else
    {
      v15 = (char *)alignp - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v15, v14);
      alignp[0] = (unint64_t)&v15[v13 - 1] / v13 * v13;
      LOBYTE(alignp[1]) = 1;
    }
    *(_OWORD *)sizep = *(_OWORD *)alignp;
    if (objc_msgSend(v8, "numberOfArguments", alignp[0]))
    {
      v16 = 0;
      do
      {
        objc_msgSend(v5, "getArgument:atIndex:", sizep, v16);
        objc_msgSend(v9, "setArgument:atIndex:", sizep, v16++);
      }
      while (v16 < objc_msgSend(v8, "numberOfArguments"));
    }
    if (!LOBYTE(sizep[1]))
      free((void *)sizep[0]);
  }
  v6 = v9;

  if (!malloc_size(v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSuggestionsService.m"), 175, CFSTR("expected invocation copy %p (%@) to be heap allocated"), v6, v6);

  }
  objc_autoreleasePoolPop(v7);
  return v6;
}

- (void)_forwardStackInvocation:(id)a3
{
  id v5;
  void *v6;
  SGRemoteObjectProxy *v7;
  NSObject *v8;
  SGDSuggestManagerAllProtocol *v9;
  SGDSuggestManagerAllProtocol *v10;
  void *v11;
  SGDaemonConnection *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  void (**v20)(_QWORD);
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, void *);
  void *v29;
  void *v30;
  void (**v31)(_QWORD);
  id v32;
  SGDaemonConnection *v33;
  void *v34;
  SGDaemonConnection *connection;
  void (**v36)(_QWORD);
  void *v37;
  id v38;
  void *v39;
  id v40;
  SGDaemonConnection *v41;
  _QWORD v42[4];
  SGDaemonConnection *v43;
  id v44;
  id v45;
  _QWORD v46[5];
  SGDaemonConnection *v47;
  id v48;
  id v49;
  SEL v50;
  id v51;
  id v52;
  _QWORD v53[4];
  SGDaemonConnection *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  SGDSuggestManagerAllProtocol *v61;
  objc_super v62;

  v5 = +[SGRemoteObjectProxy _copyInvocationToHeapIfNeeded:](SGRemoteObjectProxy, "_copyInvocationToHeapIfNeeded:", a3);
  v6 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(v5, "target");
  v7 = (SGRemoteObjectProxy *)objc_claimAutoreleasedReturnValue();

  if (v7 == self)
  {
    if (self->_inProcessSuggestManager)
    {
      if (_forwardStackInvocation___pasOnceToken6 != -1)
        dispatch_once(&_forwardStackInvocation___pasOnceToken6, &__block_literal_global_2011);
      v8 = (id)_forwardStackInvocation___pasExprOnceResult;
      objc_msgSend(v5, "retainArguments");
      v9 = self->_inProcessSuggestManager;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_2;
      v59[3] = &unk_1E47607F8;
      v60 = v5;
      v10 = v9;
      v61 = v10;
      v11 = (void *)MEMORY[0x1A8583BFC](v59);
      if (+[SGDaemonConnection usingSyncXPC](SGDaemonConnection, "usingSyncXPC"))
        dispatch_sync(v8, v11);
      else
        dispatch_async(v8, v11);

    }
    else
    {
      v12 = self->_connection;
      if (_forwardStackInvocation___pasOnceToken7 != -1)
        dispatch_once(&_forwardStackInvocation___pasOnceToken7, &__block_literal_global_15);
      v13 = (id)_forwardStackInvocation___pasExprOnceResult_14;
      if (_forwardStackInvocation___pasOnceToken8 != -1)
        dispatch_once(&_forwardStackInvocation___pasOnceToken8, &__block_literal_global_17);
      v14 = (id)_forwardStackInvocation___pasExprOnceResult_16;
      if (_forwardStackInvocation___pasOnceToken9 != -1)
        dispatch_once(&_forwardStackInvocation___pasOnceToken9, &__block_literal_global_20);
      v15 = (id)_forwardStackInvocation___pasExprOnceResult_19;
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_6;
      v55[3] = &unk_1E4760840;
      v16 = v13;
      v56 = v16;
      v17 = v15;
      v57 = v17;
      v18 = v14;
      v58 = v18;
      v19 = (void (**)(_QWORD))MEMORY[0x1A8583BFC](v55);
      if (self->_queuesRequestsIfBusy
        && objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v16, 0.0) == 1)
      {
        objc_msgSend(v5, "retainArguments");
        objc_msgSend(v17, "lock");
        objc_msgSend(v18, "addObject:", v5);
        objc_msgSend(v17, "unlock");
      }
      else
      {
        v40 = v18;
        v41 = v12;
        v20 = v19;
        objc_msgSend(v5, "methodSignature");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "numberOfArguments");

        objc_msgSend(v5, "methodSignature");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = v22 - 1;
        LODWORD(v22) = strcmp((const char *)objc_msgSend(v23, "getArgumentTypeAtIndex:", v22 - 1), "@?");

        if ((_DWORD)v22)
        {
          v19 = v20;
          v18 = v40;
          v12 = v41;
          if (self->_queuesRequestsIfBusy
            || !objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v16, 0.0))
          {
            v19[2](v19);
            -[SGDaemonConnection remoteObjectProxy](self->_connection, "remoteObjectProxy");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "invokeWithTarget:", v25);

            -[SGDaemonConnection xpcConnection](self->_connection, "xpcConnection");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v53[0] = MEMORY[0x1E0C809B0];
            v53[1] = 3221225472;
            v53[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_7;
            v53[3] = &unk_1E47627A0;
            v54 = v41;
            objc_msgSend(v26, "addBarrierBlock:", v53);

          }
        }
        else
        {
          v52 = 0;
          objc_msgSend(v5, "getArgument:atIndex:", &v52, v24);
          if (v52)
            v27 = (void *)objc_msgSend(v52, "copy");
          else
            v27 = 0;
          v19 = v20;
          if (self->_queuesRequestsIfBusy
            || objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v16, 0.0) != 1)
          {
            v46[0] = MEMORY[0x1E0C809B0];
            v46[1] = 3221225472;
            v46[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_8;
            v46[3] = &unk_1E4760868;
            v31 = v20;
            v50 = a2;
            v48 = v31;
            v46[4] = self;
            v32 = v27;
            v49 = v32;
            v39 = v27;
            v33 = v41;
            v47 = v33;
            v51 = (id)objc_msgSend(v46, "copy");
            objc_msgSend(v5, "methodSignature");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setArgument:atIndex:", &v51, objc_msgSend(v34, "numberOfArguments") - 1);

            objc_msgSend(v5, "retainArguments");
            connection = self->_connection;
            v42[0] = MEMORY[0x1E0C809B0];
            v42[1] = 3221225472;
            v42[2] = __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_9;
            v42[3] = &unk_1E4760890;
            v36 = v31;
            v19 = v20;
            v44 = v36;
            v45 = v32;
            v43 = v33;
            -[SGDaemonConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", v42);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "invokeWithTarget:", v37);

            v27 = v39;
            v38 = (id)objc_opt_self();

            v18 = v40;
          }
          else
          {
            v18 = v40;
            if (v27)
            {
              v28 = (void (**)(_QWORD, void *))v27;
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SGErrorDomain"), 7, 0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              +[SGXPCResponse3 responseWithError:](SGXPCResponse3, "responseWithError:", v29);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v28[2](v28, v30);

              v27 = v28;
            }
          }

          v12 = v41;
        }
      }

    }
  }
  else
  {
    v62.receiver = self;
    v62.super_class = (Class)SGRemoteObjectProxy;
    -[SGRemoteObjectProxy forwardInvocation:](&v62, sel_forwardInvocation_, v5);
  }
  objc_autoreleasePoolPop(v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inProcessSuggestManager, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_3()
{
  void *v0;
  dispatch_semaphore_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = dispatch_semaphore_create(10);
  v2 = (void *)_forwardStackInvocation___pasExprOnceResult_14;
  _forwardStackInvocation___pasExprOnceResult_14 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_5()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = objc_opt_new();
  v2 = (void *)_forwardStackInvocation___pasExprOnceResult_19;
  _forwardStackInvocation___pasExprOnceResult_19 = v1;

  objc_autoreleasePoolPop(v0);
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_4()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  v1 = objc_opt_new();
  v2 = (void *)_forwardStackInvocation___pasExprOnceResult_16;
  _forwardStackInvocation___pasExprOnceResult_16 = v1;

  objc_autoreleasePoolPop(v0);
}

- (SGRemoteObjectProxy)initWithInProcessSuggestManager:(id)a3
{
  id v5;
  SGRemoteObjectProxy *v6;
  SGRemoteObjectProxy *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SGRemoteObjectProxy;
  v6 = -[SGRemoteObjectProxy init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_inProcessSuggestManager, a3);

  return v7;
}

uint64_t __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invokeWithTarget:", *(_QWORD *)(a1 + 40));
}

id __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_7()
{
  return (id)objc_opt_self();
}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke_9(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    +[SGXPCResponse3 responseWithError:](SGXPCResponse3, "responseWithError:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  v5 = (id)objc_opt_self();

}

void __47__SGRemoteObjectProxy__forwardStackInvocation___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "SGRemoteObjectProxy-inProcessSuggestManager");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_forwardStackInvocation___pasExprOnceResult;
  _forwardStackInvocation___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
