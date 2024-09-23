@implementation BWDeferredTransactionBroker

+ (id)sharedInstance
{
  if (sharedInstance_sOnceEngineToken != -1)
    dispatch_once(&sharedInstance_sOnceEngineToken, &__block_literal_global_60);
  return (id)sharedInstance_sBroker;
}

BWDeferredTransactionBroker *__45__BWDeferredTransactionBroker_sharedInstance__block_invoke()
{
  BWDeferredTransactionBroker *result;
  objc_super v1;

  result = [BWDeferredTransactionBroker alloc];
  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)BWDeferredTransactionBroker;
    result = (BWDeferredTransactionBroker *)objc_msgSendSuper2(&v1, sel_init);
    if (result)
      result->_lock._os_unfair_lock_opaque = 0;
  }
  sharedInstance_sBroker = (uint64_t)result;
  return result;
}

- (void)openTransaction:(int)a3
{
  -[BWDeferredTransactionBroker _openTransaction:pid:name:]((os_unfair_lock_s *)self, a3, 0xFFFFFFFFLL, 0);
}

- (void)_openTransaction:(uint64_t)a3 pid:(uint64_t)a4 name:
{
  os_unfair_lock_s *v7;
  os_unfair_lock_s *v8;
  uint32_t v9;
  os_unfair_lock_s *v10;
  uint32_t os_unfair_lock_opaque;
  uint64_t v12;
  id v13;
  char *v14;
  const __CFString *v15;
  void *v16;

  if (a1)
  {
    if (a2 >= 5)
      -[BWDeferredTransactionBroker _openTransaction:pid:name:].cold.1();
    v7 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v8 = &a1[4 * a2];
    os_unfair_lock_opaque = v8[6]._os_unfair_lock_opaque;
    v10 = v8 + 6;
    v9 = os_unfair_lock_opaque;
    if (!os_unfair_lock_opaque)
    {
      v12 = a2;
      v13 = objc_alloc(MEMORY[0x1E0CB3940]);
      v14 = _transactionNames[v12];
      if (a4)
        v15 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%@"), a4);
      else
        v15 = &stru_1E4928818;
      v16 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR("FigCaptureDeferred-%s%@"), v14, v15);
      objc_msgSend(v16, "cStringUsingEncoding:", 4);
      *(_QWORD *)&v10[-2]._os_unfair_lock_opaque = FigOSTransactionCreate();

      v9 = v10->_os_unfair_lock_opaque;
    }
    v10->_os_unfair_lock_opaque = v9 + 1;
    os_unfair_lock_unlock(v7);
  }
}

- (void)openTransaction:(int)a3 pid:(int)a4
{
  -[BWDeferredTransactionBroker _openTransaction:pid:name:]((os_unfair_lock_s *)self, a3, *(uint64_t *)&a4, 0);
}

- (void)openTransaction:(int)a3 name:(id)a4
{
  -[BWDeferredTransactionBroker _openTransaction:pid:name:]((os_unfair_lock_s *)self, a3, 0xFFFFFFFFLL, (uint64_t)a4);
}

- (void)closeTransaction:(int)a3
{
  os_unfair_lock_s *p_lock;
  char *v6;
  _DWORD *v7;
  int v8;
  int v9;
  int v10;
  _QWORD *v11;
  void *v12;

  if (a3 >= 5)
    -[BWDeferredTransactionBroker _openTransaction:pid:name:].cold.1();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (char *)self + 16 * a3;
  v9 = *((_DWORD *)v6 + 6);
  v7 = v6 + 24;
  v8 = v9;
  if (v9)
  {
    v10 = v8 - 1;
    *v7 = v10;
    if (!v10)
    {
      v11 = v7 - 2;
      v12 = (void *)*((_QWORD *)v7 - 1);
      if (v12)
      {

        *v11 = 0;
      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)exitImmediately
{
  os_unfair_lock_s *p_lock;
  uint64_t i;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  for (i = 16; i != 96; i += 16)
  {
    v5 = *(Class *)((char *)&self->super.isa + i);
    if (v5)
    {

      *(Class *)((char *)&self->super.isa + i) = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);
  if ((xpc_transaction_try_exit_clean() & 1) == 0)
    _exit(0);
}

- (void)_openTransaction:pid:name:.cold.1()
{
  _os_crash();
  __break(1u);
}

@end
