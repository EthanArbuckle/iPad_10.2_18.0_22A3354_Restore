@implementation GSDaemonProxySync

- (GSDaemonProxySync)initWithXPCObject:(id)a3
{
  id v4;
  GSProtocol *v5;
  GSProtocol *target;
  id v7;
  NSError *v8;
  NSError *error;
  _QWORD v11[4];
  id v12;
  id location;

  v4 = a3;
  if (v4)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      -[GSDaemonProxySync initWithXPCObject:].cold.1();
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __39__GSDaemonProxySync_initWithXPCObject___block_invoke;
    v11[3] = &unk_1E9771A78;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
    v5 = (GSProtocol *)objc_claimAutoreleasedReturnValue();
    target = self->_target;
    self->_target = v5;

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v8 = (NSError *)objc_msgSend(v7, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4097, 0);
    error = self->_error;
    self->_error = v8;

  }
  return self;
}

void __39__GSDaemonProxySync_initWithXPCObject___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleObjResult:error:", 0, v3);

}

+ (id)proxy
{
  GSDaemonProxySync *v2;
  id v3;
  GSDaemonProxySync *v4;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v2 = [GSDaemonProxySync alloc];
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  if (_GSDaemonInitialize_once != -1)
    dispatch_once(&_GSDaemonInitialize_once, &__block_literal_global_121);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __GSDaemonConnection_block_invoke;
  block[3] = &unk_1E9771AC8;
  block[4] = &v7;
  dispatch_sync((dispatch_queue_t)sDaemonTrackerQueue, block);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  v4 = -[GSDaemonProxySync initWithXPCObject:](v2, "initWithXPCObject:", v3);
  return v4;
}

- (void)finalize
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)GSDaemonProxySync;
  -[GSDaemonProxySync finalize](&v2, sel_finalize);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  GSProtocol *target;
  id v6;

  v4 = a3;
  target = self->_target;
  if (!target)
    -[GSDaemonProxySync forwardInvocation:].cold.1();
  v6 = v4;
  -[GSProtocol forwardInvocation:](target, "forwardInvocation:", v4);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  GSProtocol *target;

  target = self->_target;
  if (!target)
    -[GSDaemonProxySync methodSignatureForSelector:].cold.1();
  return (id)-[GSProtocol methodSignatureForSelector:](target, "methodSignatureForSelector:", a3);
}

- (void)handleBoolResult:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v4 = a3;
  v6 = MEMORY[0x1E0C9AAB0];
  v7 = a4;
  v10 = v7;
  if (v4)
    v8 = v6;
  else
    v8 = 0;
  if (v4)
    v9 = 0;
  else
    v9 = v7;
  -[GSDaemonProxySync setResult:](self, "setResult:", v8);
  -[GSDaemonProxySync setError:](self, "setError:", v9);

}

- (void)handleObjResult:(id)a3 error:(id)a4
{
  id v6;

  v6 = a4;
  -[GSDaemonProxySync setResult:](self, "setResult:", a3);
  -[GSDaemonProxySync setError:](self, "setError:", v6);

}

- (__CFError)copyCFError
{
  -[GSDaemonProxySync error](self, "error");
  return (__CFError *)objc_claimAutoreleasedReturnValue();
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (id)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_storeStrong(&self->_result, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)initWithXPCObject:.cold.1()
{
  __assert_rtn("-[GSDaemonProxySync initWithXPCObject:]", "GSProtocol.m", 185, "[xpcObject respondsToSelector:@selector(synchronousRemoteObjectProxyWithErrorHandler:)]");
}

- (void)forwardInvocation:.cold.1()
{
  __assert_rtn("-[GSDaemonProxySync forwardInvocation:]", "GSProtocol.m", 211, "_target");
}

- (void)methodSignatureForSelector:.cold.1()
{
  __assert_rtn("-[GSDaemonProxySync methodSignatureForSelector:]", "GSProtocol.m", 217, "_target");
}

@end
