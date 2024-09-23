@implementation BSPortDeathSentinel

+ (void)monitorSendRight:(id)a3 withHandler:(id)a4
{
  BSPortDeathSentinel *v6;
  BSPortDeathSentinel *v7;
  void *v10;
  _QWORD v11[4];
  BSPortDeathSentinel *v12;
  id v13;

  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSPortDeathSentinel.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  v6 = -[BSPortDeathSentinel initWithSendRight:]([BSPortDeathSentinel alloc], "initWithSendRight:", a3);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__BSPortDeathSentinel_monitorSendRight_withHandler___block_invoke;
  v11[3] = &unk_1E1EBEE78;
  v12 = v6;
  v13 = a4;
  v7 = v6;
  -[BSPortDeathSentinel activateWithHandler:](v7, "activateWithHandler:", v11);

}

- (void)setQueue:(id)a3
{
  _QWORD v3[7];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__BSPortDeathSentinel_setQueue___block_invoke;
  v3[3] = &unk_1E1EBF550;
  v3[5] = a3;
  v3[6] = a2;
  v3[4] = self;
  __lockAndExecute(&self->_lock, (uint64_t)v3);
}

- (void)activateWithHandler:(id)a3
{
  void *v6;
  _QWORD v7[7];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSPortDeathSentinel.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler != nil"));

  }
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__BSPortDeathSentinel_activateWithHandler___block_invoke;
  v7[3] = &unk_1E1EBF528;
  v7[5] = a3;
  v7[6] = a2;
  v7[4] = self;
  __lockAndExecute(&self->_lock, (uint64_t)v7);
}

void __43__BSPortDeathSentinel_activateWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  id v5;
  unsigned int v6;
  uint64_t v7;
  dispatch_source_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD handler[4];
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("BSPortDeathSentinel.m"), 72, CFSTR("port right sentinel cannot be activated multiple times"));

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("BSPortDeathSentinel.m"), 73, CFSTR("port right sentinel cannot be activated after invalidation"));

    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 32) = 1;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v3)
  {
    objc_opt_self();
    if (qword_1ECD39938 != -1)
      dispatch_once(&qword_1ECD39938, &__block_literal_global_18);
    v3 = (void *)_MergedGlobals_20;
  }
  v4 = v3;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = objc_msgSend(v5, "rawPort");
  if (v6 - 1 > 0xFFFFFFFD)
  {
    dispatch_async(v4, *(dispatch_block_t *)(a1 + 40));
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32) + 16;
    v8 = dispatch_source_create(MEMORY[0x1E0C80DA0], v6, 1uLL, v4);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = v8;

    v11 = v8;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __43__BSPortDeathSentinel_activateWithHandler___block_invoke_2;
    handler[3] = &unk_1E1EBF528;
    v12 = *(_QWORD *)(a1 + 40);
    v18 = v11;
    v19 = v12;
    v20 = v7;
    v13 = v11;
    dispatch_source_set_event_handler(v13, handler);
    v16 = v5;
    dispatch_source_set_mandatory_cancel_handler();
    dispatch_activate(v13);

  }
}

void __32__BSPortDeathSentinel_setQueue___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a1[4];
  if (*(_BYTE *)(v2 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("BSPortDeathSentinel.m"), 117, CFSTR("port right sentinel cannot be mutated after activation"));

    v2 = a1[4];
  }
  if (*(_BYTE *)(v2 + 33))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("BSPortDeathSentinel.m"), 118, CFSTR("port right sentinel cannot be mutated after invalidation"));

    v2 = a1[4];
  }
  v4 = *(void **)(v2 + 40);
  v3 = (id *)(v2 + 40);
  v5 = (void *)a1[5];
  if (v4 != v5)
    objc_storeStrong(v3, v5);
}

- (BSPortDeathSentinel)initWithSendRight:(id)a3
{
  id v5;
  BSPortDeathSentinel *v6;
  uint64_t v7;
  BSMachPortSendRight *sendRight;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  id v15;
  objc_class *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  BSPortDeathSentinel *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("BSMachPortSendRight"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v20 = v11;
      v21 = 2114;
      v22 = v13;
      v23 = 2048;
      v24 = self;
      v25 = 2114;
      v26 = CFSTR("BSPortDeathSentinel.m");
      v27 = 1024;
      v28 = 43;
      v29 = 2114;
      v30 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1B4EF8);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSMachPortSendRightClass]"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v20 = v15;
      v21 = 2114;
      v22 = v17;
      v23 = 2048;
      v24 = self;
      v25 = 2114;
      v26 = CFSTR("BSPortDeathSentinel.m");
      v27 = 1024;
      v28 = 43;
      v29 = 2114;
      v30 = v14;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1B4FFCLL);
  }

  v18.receiver = self;
  v18.super_class = (Class)BSPortDeathSentinel;
  v6 = -[BSPortDeathSentinel init](&v18, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v5, "copy");
    sendRight = v6->_sendRight;
    v6->_sendRight = (BSMachPortSendRight *)v7;

    v6->_lock._os_unfair_lock_opaque = 0;
  }
  return v6;
}

uint64_t __52__BSPortDeathSentinel_monitorSendRight_withHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __43__BSPortDeathSentinel_activateWithHandler___block_invoke_2(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v2 = *(os_unfair_lock_s **)(a1 + 48);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__BSPortDeathSentinel_activateWithHandler___block_invoke_3;
  v6[3] = &unk_1E1EBF500;
  v7 = *(id *)(a1 + 32);
  v8 = &v9;
  __lockAndExecute(v2, (uint64_t)v6);
  if (*((_BYTE *)v10 + 24))
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3, v4, v5);

  _Block_object_dispose(&v9, 8);
}

void __43__BSPortDeathSentinel_activateWithHandler___block_invoke_3(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(a1 + 32);
  if (!dispatch_source_testcancel(v2))
  {
    dispatch_source_cancel(v2);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t __43__BSPortDeathSentinel_activateWithHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)dealloc
{
  NSObject *source;
  objc_super v4;

  source = self->_source;
  if (source)
    dispatch_source_cancel(source);
  v4.receiver = self;
  v4.super_class = (Class)BSPortDeathSentinel;
  -[BSPortDeathSentinel dealloc](&v4, sel_dealloc);
}

- (BOOL)isValid
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__BSPortDeathSentinel_isValid__block_invoke;
  v4[3] = &unk_1E1EBF500;
  v4[4] = self;
  v4[5] = &v5;
  __lockAndExecute(&self->_lock, (uint64_t)v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __30__BSPortDeathSentinel_isValid__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 33))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 0;
  }
  else
  {
    v3 = *(NSObject **)(v2 + 24);
    if (v3 && dispatch_source_testcancel(v3))
      result = 0;
    else
      result = objc_msgSend(*(id *)(v2 + 8), "isUsable");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = result;
  }
  return result;
}

void __36__BSPortDeathSentinel__callOutQueue__block_invoke()
{
  dispatch_queue_t Serial;
  void *v1;

  Serial = BSDispatchQueueCreateSerial(CFSTR("BSPortDeathSentinelCallOut"));
  v1 = (void *)_MergedGlobals_20;
  _MergedGlobals_20 = (uint64_t)Serial;

}

- (void)invalidate
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __33__BSPortDeathSentinel_invalidate__block_invoke;
  v2[3] = &unk_1E1EBE890;
  v2[4] = self;
  __lockAndExecute(&self->_lock, (uint64_t)v2);
}

void __33__BSPortDeathSentinel_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 33))
  {
    *(_BYTE *)(v1 + 33) = 1;
    v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (v2)
      dispatch_source_cancel(v2);
  }
}

- (OS_dispatch_queue)queue
{
  return self->_callOutQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_sendRight, 0);
}

@end
