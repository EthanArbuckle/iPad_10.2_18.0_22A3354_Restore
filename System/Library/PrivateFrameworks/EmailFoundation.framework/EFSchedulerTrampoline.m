@implementation EFSchedulerTrampoline

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)EFSchedulerTrampoline;
  -[EFSchedulerTrampoline methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(self->_object, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  EFScheduler *scheduler;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  objc_msgSend(v4, "setTarget:", self->_object);
  objc_msgSend(v4, "retainArguments");
  scheduler = self->_scheduler;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__EFSchedulerTrampoline_forwardInvocation___block_invoke;
  v7[3] = &unk_1E62A5860;
  v6 = v4;
  v8 = v6;
  -[EFScheduler performBlock:](scheduler, "performBlock:", v7);

}

uint64_t __43__EFSchedulerTrampoline_forwardInvocation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invoke");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

+ (id)trampolineWithScheduler:(id)a3 object:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (trampolineWithScheduler_object__onceToken != -1)
    dispatch_once(&trampolineWithScheduler_object__onceToken, &__block_literal_global_28);
  os_unfair_lock_lock((os_unfair_lock_t)&trampolineWithScheduler_object__sTrampolineLock);
  objc_msgSend((id)trampolineWithScheduler_object__schedulerTrampolines, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)trampolineWithScheduler_object__schedulerTrampolines, "setObject:forKey:");
  }
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithScheduler:object:", v6, v7);
    objc_msgSend(v8, "setObject:forKey:", v9, v7);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&trampolineWithScheduler_object__sTrampolineLock);
  return v9;
}

- (id)_initWithScheduler:(id)a3 object:(id)a4
{
  id v8;
  id v9;
  EFSchedulerTrampoline *v10;
  id *p_isa;
  void *v13;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFSchedulerTrampoline.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v14.receiver = self;
  v14.super_class = (Class)EFSchedulerTrampoline;
  v10 = -[EFSchedulerTrampoline init](&v14, sel_init);
  p_isa = (id *)&v10->super.isa;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_scheduler, a3);
    objc_storeStrong(p_isa + 2, a4);
  }

  return p_isa;
}

void __56__EFSchedulerTrampoline_trampolineWithScheduler_object___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)trampolineWithScheduler_object__schedulerTrampolines;
  trampolineWithScheduler_object__schedulerTrampolines = v0;

}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  EFScheduler *scheduler;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  scheduler = self->_scheduler;
  objc_msgSend(self->_object, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> scheduler=%@ object=%@"), v4, self, scheduler, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(self->_object, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> object=%@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)EFSchedulerTrampoline;
  if (-[EFSchedulerTrampoline conformsToProtocol:](&v7, sel_conformsToProtocol_, v4))
    v5 = 1;
  else
    v5 = objc_msgSend(self->_object, "conformsToProtocol:", v4);

  return v5;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EFSchedulerTrampoline;
  if (-[EFSchedulerTrampoline respondsToSelector:](&v5, sel_respondsToSelector_))
    v3 = 1;
  else
    v3 = objc_opt_respondsToSelector();
  return v3 & 1;
}

@end
