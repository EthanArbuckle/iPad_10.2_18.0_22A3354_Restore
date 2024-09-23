@implementation BRXPCSyncProxy

- (NSError)error
{
  return self->_error;
}

- (id)result
{
  return self->_result;
}

- (BRXPCSyncProxy)initWithXPCObject:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *target;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id location;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    brc_bread_crumbs((uint64_t)"-[BRXPCSyncProxy initWithXPCObject:]", 22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BRXPCSyncProxy initWithXPCObject:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

  }
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __36__BRXPCSyncProxy_initWithXPCObject___block_invoke;
  v16[3] = &unk_1E3DA48A8;
  objc_copyWeak(&v17, &location);
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v5 = objc_claimAutoreleasedReturnValue();
  target = self->_target;
  self->_target = v5;

  if (!self->_target)
  {

    self = 0;
  }
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return self;
}

- (void)setObjResult:(id)a3 error:(id)a4
{
  id v6;

  v6 = a4;
  -[BRXPCSyncProxy setResult:](self, "setResult:", a3);
  -[BRXPCSyncProxy setError:](self, "setError:", v6);

}

- (void)setResult:(id)a3
{
  objc_storeStrong(&self->_result, a3);
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  NSObject *target;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  target = self->_target;
  if (!target)
  {
    brc_bread_crumbs((uint64_t)"-[BRXPCSyncProxy forwardInvocation:]", 38);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[BRXPCSyncProxy forwardInvocation:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    target = self->_target;
  }
  -[NSObject forwardInvocation:](target, "forwardInvocation:", v4);

}

- (id)methodSignatureForSelector:(SEL)a3
{
  NSObject *target;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  target = self->_target;
  if (!target)
  {
    brc_bread_crumbs((uint64_t)"-[BRXPCSyncProxy methodSignatureForSelector:]", 44);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      -[BRXPCSyncProxy forwardInvocation:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    target = self->_target;
  }
  -[NSObject methodSignatureForSelector:](target, "methodSignatureForSelector:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_result, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

void __36__BRXPCSyncProxy_initWithXPCObject___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setObjResult:error:", 0, v3);

}

- (void)setBoolResult:(BOOL)a3 error:(id)a4
{
  uint64_t v5;
  id v6;

  if (a3)
    v5 = MEMORY[0x1E0C9AAB0];
  else
    v5 = 0;
  v6 = a4;
  -[BRXPCSyncProxy setResult:](self, "setResult:", v5);
  -[BRXPCSyncProxy setError:](self, "setError:", v6);

}

- (void)initWithXPCObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: [object respondsToSelector:@selector(synchronousRemoteObjectProxyWithErrorHandler:)]%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)forwardInvocation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_19CBF0000, a2, a3, "[CRIT] Assertion failed: _target%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
