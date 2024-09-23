@implementation BSSimpleAssertion

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BSSimpleAssertion descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_invalidated, 0);
}

- (void)invalidate
{
  OS_dispatch_queue *queue;
  id invalidationBlock;

  queue = self->_queue;
  if (queue)
    BSDispatchQueueAssert(queue);
  if (-[BSAtomicSignal signal](self->_invalidated, "signal"))
  {
    (*((void (**)(void))self->_invalidationBlock + 2))();
    invalidationBlock = self->_invalidationBlock;
    self->_invalidationBlock = 0;

  }
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[BSSimpleAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;
  id v6;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_reason, CFSTR("reason"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled") ^ 1, CFSTR("valid"));
  return v3;
}

- (BOOL)isValid
{
  return !-[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled");
}

- (void)dealloc
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSSimpleAssertion *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (!-[BSAtomicSignal hasBeenSignalled](self->_invalidated, "hasBeenSignalled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Client code must invalidate <%@:%p> (%@: %@) before dealloc"), objc_opt_class(), self, self->_identifier, self->_reason);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v10 = v5;
      v11 = 2114;
      v12 = v7;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = CFSTR("BSSimpleAssertion.m");
      v17 = 1024;
      v18 = 57;
      v19 = 2114;
      v20 = v4;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1A0E98);
  }
  v8.receiver = self;
  v8.super_class = (Class)BSSimpleAssertion;
  -[BSSimpleAssertion dealloc](&v8, sel_dealloc);
}

- (BSSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 queue:(id)a5 invalidationBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BSSimpleAssertion *v15;
  uint64_t v16;
  NSString *identifier;
  uint64_t v18;
  NSString *reason;
  uint64_t v20;
  BSAtomicSignal *invalidated;
  uint64_t v22;
  id invalidationBlock;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v11)
  {
    if (v12)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSimpleAssertion.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    if (v12)
    {
LABEL_3:
      if (v13)
        goto LABEL_4;
LABEL_10:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSimpleAssertion.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));

      if (v14)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSimpleAssertion.m"), 28, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

  if (!v13)
    goto LABEL_10;
LABEL_4:
  if (v14)
    goto LABEL_5;
LABEL_11:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSimpleAssertion.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationBlock"));

LABEL_5:
  v29.receiver = self;
  v29.super_class = (Class)BSSimpleAssertion;
  v15 = -[BSSimpleAssertion init](&v29, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v11, "copy");
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    v18 = objc_msgSend(v12, "copy");
    reason = v15->_reason;
    v15->_reason = (NSString *)v18;

    v20 = objc_opt_new();
    invalidated = v15->_invalidated;
    v15->_invalidated = (BSAtomicSignal *)v20;

    objc_storeStrong((id *)&v15->_queue, a5);
    v22 = objc_msgSend(v14, "copy");
    invalidationBlock = v15->_invalidationBlock;
    v15->_invalidationBlock = (id)v22;

  }
  return v15;
}

- (BSSimpleAssertion)initWithIdentifier:(id)a3 forReason:(id)a4 invalidationBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  BSSimpleAssertion *v12;
  uint64_t v13;
  NSString *identifier;
  uint64_t v15;
  NSString *reason;
  uint64_t v17;
  BSAtomicSignal *invalidated;
  uint64_t v19;
  id invalidationBlock;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSimpleAssertion.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reason"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSimpleAssertion.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BSSimpleAssertion.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("invalidationBlock"));

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)BSSimpleAssertion;
  v12 = -[BSSimpleAssertion init](&v25, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    identifier = v12->_identifier;
    v12->_identifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    reason = v12->_reason;
    v12->_reason = (NSString *)v15;

    v17 = objc_opt_new();
    invalidated = v12->_invalidated;
    v12->_invalidated = (BSAtomicSignal *)v17;

    v19 = objc_msgSend(v11, "copy");
    invalidationBlock = v12->_invalidationBlock;
    v12->_invalidationBlock = (id)v19;

  }
  return v12;
}

- (NSString)description
{
  return (NSString *)-[BSSimpleAssertion descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)reason
{
  return self->_reason;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BSSimpleAssertion succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

@end
