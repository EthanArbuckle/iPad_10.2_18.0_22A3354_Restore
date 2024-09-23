@implementation FBSProcessExecutionProvision

- (NSString)description
{
  return (NSString *)-[FBSProcessExecutionProvision descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)prepareForReuse
{
  NSError *error;
  FBSProcessExecutionProvision *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_activated)
  {
    -[FBSProcessExecutionProvision _prepareForReuse](obj, "_prepareForReuse");
    error = obj->_error;
    obj->_error = 0;

    obj->_activated = 0;
    *(_WORD *)&obj->_monitoring = 0;
    objc_storeWeak((id *)&obj->_process, 0);
    objc_storeWeak((id *)&obj->_delegate, 0);
  }
  objc_sync_exit(obj);

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)stopMonitoring
{
  FBSProcessExecutionProvision *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_monitoring)
  {
    -[FBSProcessExecutionProvision _stopMonitoring](obj, "_stopMonitoring");
    obj->_monitoring = 0;
  }
  objc_sync_exit(obj);

}

- (void)monitorProcess:(id)a3
{
  FBSProcessExecutionProvision *v4;
  id obj;

  obj = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_monitoring)
  {
    objc_storeWeak((id *)&v4->_process, obj);
    v4->_monitoring = 1;
    v4->_activated = 1;
    -[FBSProcessExecutionProvision _beginMonitoring](v4, "_beginMonitoring");
  }
  objc_sync_exit(v4);

}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;

  -[FBSProcessExecutionProvision succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[FBSProcessExecutionProvision isMonitoring](self, "isMonitoring"), CFSTR("monitoring"), 1);
  v6 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[FBSProcessExecutionProvision isViolated](self, "isViolated"), CFSTR("violated"), 1);
  return v4;
}

- (BOOL)isViolated
{
  return self->_violated;
}

- (BOOL)isMonitoring
{
  return self->_monitoring;
}

- (FBSProcessInternal)process
{
  return (FBSProcessInternal *)objc_loadWeakRetained((id *)&self->_process);
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSProcessExecutionProvision descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_delegateCalloutQueue, 0);
  objc_destroyWeak((id *)&self->_process);
}

- (FBSProcessExecutionProvision)init
{
  FBSProcessExecutionProvision *v2;
  uint64_t v3;
  OS_dispatch_queue *delegateCalloutQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBSProcessExecutionProvision;
  v2 = -[FBSProcessExecutionProvision init](&v6, sel_init);
  if (v2)
  {
    v3 = BSDispatchQueueCreateWithQualityOfService();
    delegateCalloutQueue = v2->_delegateCalloutQueue;
    v2->_delegateCalloutQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)updateProgress
{
  FBSProcessExecutionProvision *obj;

  obj = self;
  objc_sync_enter(obj);
  if (obj->_monitoring && !obj->_violated)
    -[FBSProcessExecutionProvision _updateProgress](obj, "_updateProgress");
  objc_sync_exit(obj);

}

- (void)_noteViolatedWithError:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__FBSProcessExecutionProvision__noteViolatedWithError___block_invoke;
  v6[3] = &unk_1E38EAE08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[FBSProcessExecutionProvision _performDelegateCallout:](self, "_performDelegateCallout:", v6);

}

void __55__FBSProcessExecutionProvision__noteViolatedWithError___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v3 + 32) && !*(_BYTE *)(v3 + 33))
  {
    *(_BYTE *)(v3 + 33) = 1;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 48));
  }
  else
  {
    WeakRetained = 0;
  }
  objc_sync_exit(v2);

  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "provision:wasViolatedWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v4 = WeakRetained;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id WeakRetained;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSError copy](self->_error, "copy");
  v6 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_process);
  objc_storeWeak((id *)(v4 + 8), WeakRetained);

  *(_BYTE *)(v4 + 33) = self->_violated;
  *(_BYTE *)(v4 + 16) = self->_activated;
  *(_BYTE *)(v4 + 32) = self->_monitoring;
  return (id)v4;
}

- (void)_performDelegateCallout:(id)a3
{
  id v5;
  NSObject *delegateCalloutQueue;
  id v7;
  void *v8;
  _QWORD block[4];
  id v10;

  v5 = a3;
  if (v5)
  {
    delegateCalloutQueue = self->_delegateCalloutQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__FBSProcessExecutionProvision__performDelegateCallout___block_invoke;
    block[3] = &unk_1E38EB3B8;
    v10 = v5;
    v7 = v5;
    dispatch_async(delegateCalloutQueue, block);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("block"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSProcessExecutionProvision _performDelegateCallout:].cold.1(a2, (uint64_t)self, (uint64_t)v8);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __56__FBSProcessExecutionProvision__performDelegateCallout___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSProcessExecutionProvision succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (FBSProcessExecutionProvisionDelegate)delegate
{
  return (FBSProcessExecutionProvisionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isResourceProvision
{
  return 0;
}

- (void)_performDelegateCallout:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("FBSProcessExecutionProvision.m");
  v16 = 1024;
  v17 = 140;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
