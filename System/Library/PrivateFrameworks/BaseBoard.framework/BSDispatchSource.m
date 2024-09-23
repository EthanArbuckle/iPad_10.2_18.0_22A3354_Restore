@implementation BSDispatchSource

- (void)invalidate
{
  int *p_invalidated;
  NSObject *source;
  OS_dispatch_source *v6;

  p_invalidated = &self->_invalidated;
  do
  {
    if (__ldxr((unsigned int *)p_invalidated))
    {
      __clrex();
      return;
    }
  }
  while (__stxr(1u, (unsigned int *)p_invalidated));
  source = self->_source;
  if (source)
  {
    dispatch_activate(source);
    dispatch_source_cancel((dispatch_source_t)self->_source);
    v6 = self->_source;
    self->_source = 0;

  }
}

- (void)resume
{
  uint64_t v2;
  BOOL v6;
  unsigned int *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 16))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_resume, a1, CFSTR("BSDispatchSource.m"), 46, CFSTR("Cannot resume invalidated source"));

    }
    if (!*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_resume, a1, CFSTR("BSDispatchSource.m"), 47, CFSTR("Resumed source has no event handler set"));

    }
    v2 = *(_QWORD *)(a1 + 8);
    v6 = v2 == MEMORY[0x1E0C80D98]
      || v2 == MEMORY[0x1E0C80DA0]
      || v2 == MEMORY[0x1E0C80DF0]
      || v2 == MEMORY[0x1E0C80DB8]
      || v2 == MEMORY[0x1E0C80DE8];
    if (v6 && !*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_resume, a1, CFSTR("BSDispatchSource.m"), 51, CFSTR("Source of file descriptor or mach port type has no cancel handler set"));

    }
    v7 = (unsigned int *)(a1 + 24);
    do
    {
      if (__ldxr(v7))
      {
        __clrex();
        return;
      }
    }
    while (__stxr(1u, v7));
    dispatch_source_set_event_handler(*(dispatch_source_t *)(a1 + 16), *(dispatch_block_t *)(a1 + 32));
    v9 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v10 = *(void **)(a1 + 40);
    if (v10)
    {
      dispatch_source_set_cancel_handler(*(dispatch_source_t *)(a1 + 16), v10);
      v11 = *(void **)(a1 + 40);
      *(_QWORD *)(a1 + 40) = 0;

    }
    dispatch_activate(*(dispatch_object_t *)(a1 + 16));
  }
}

- (uint64_t)initWithType:(uintptr_t)a3 handle:(uintptr_t)a4 mask:(void *)a5 queue:(void *)a6 configureSourceBlock:
{
  NSObject *v11;
  void (**v12)(id, _QWORD);
  uint64_t v13;
  uint64_t v14;
  dispatch_source_t v15;
  void *v16;
  void *v18;

  v11 = a5;
  v12 = a6;
  if (a1)
  {
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithType_handle_mask_queue_configureSourceBlock_, a1, CFSTR("BSDispatchSource.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

    }
    v13 = objc_msgSend(a1, "init");
    v14 = v13;
    if (v13)
    {
      *(_QWORD *)(v13 + 8) = a2;
      v15 = dispatch_source_create(a2, a3, a4, v11);
      v16 = *(void **)(v14 + 16);
      *(_QWORD *)(v14 + 16) = v15;

      *(_DWORD *)(v14 + 24) = 0;
      *(_DWORD *)(v14 + 28) = 0;
      if (v12)
        v12[2](v12, *(_QWORD *)(v14 + 16));
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

- (void)dealloc
{
  int *p_invalidated;
  unsigned int v5;
  void *v6;
  objc_super v7;

  p_invalidated = &self->_invalidated;
  while (1)
  {
    v5 = __ldxr((unsigned int *)p_invalidated);
    if (v5 != 1)
      break;
    if (!__stxr(1u, (unsigned int *)p_invalidated))
      goto LABEL_6;
  }
  __clrex();
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSDispatchSource.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BSAtomicGetFlag(&_invalidated)"));

LABEL_6:
  v7.receiver = self;
  v7.super_class = (Class)BSDispatchSource;
  -[BSDispatchSource dealloc](&v7, sel_dealloc);
}

@end
