@implementation BSXPCServiceConnectionMessageBatch

- (BSXPCServiceConnectionMessageBatch)initWithMessage:(id)a3
{
  id v4;
  BSXPCServiceConnectionMessageBatch *v5;
  BSXPCServiceConnectionMessageBatch *v6;
  OS_xpc_object *v7;
  OS_xpc_object *lock_messages;
  uint64_t v9;
  NSMutableArray *lock_completions;
  uint64_t v11;
  NSDate *date;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BSXPCServiceConnectionMessageBatch;
  v5 = -[BSXPCServiceConnectionMessage initWithMessage:](&v14, sel_initWithMessage_, v4);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (OS_xpc_object *)xpc_array_create(0, 0);
    lock_messages = v6->_lock_messages;
    v6->_lock_messages = v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    lock_completions = v6->_lock_completions;
    v6->_lock_completions = (NSMutableArray *)v9;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = objc_claimAutoreleasedReturnValue();
    date = v6->_date;
    v6->_date = (NSDate *)v11;

  }
  return v6;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  OS_xpc_object *lock_messages;
  NSMutableArray *lock_completions;
  id lock_batchHandler;
  objc_super v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_messages = self->_lock_messages;
  self->_lock_messages = 0;

  lock_completions = self->_lock_completions;
  self->_lock_completions = 0;

  lock_batchHandler = self->_lock_batchHandler;
  self->_lock_batchHandler = 0;

  os_unfair_lock_unlock(p_lock);
  v7.receiver = self;
  v7.super_class = (Class)BSXPCServiceConnectionMessageBatch;
  -[BSXPCServiceConnectionMessage invalidate](&v7, sel_invalidate);
}

- (BOOL)appendMessage:(id)a3
{
  id *v4;
  OS_xpc_object *lock_messages;
  OS_xpc_object *v6;
  void (**v7)(_QWORD, _QWORD);
  void *v8;
  size_t count;
  id v10;
  void *v11;
  NSMutableArray *lock_completions;
  void *v13;
  dispatch_time_t v14;
  NSObject *targetQueue;
  BOOL v16;
  _QWORD v18[6];

  v4 = (id *)a3;
  os_unfair_lock_lock(&self->_lock);
  lock_messages = self->_lock_messages;
  if (lock_messages && self->_lock_batchHandler)
  {
    v6 = lock_messages;
    v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AECAA00](self->_lock_batchHandler);
    objc_msgSend(v4, "createMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_array_append_value(v6, v8);

    count = xpc_array_get_count(v6);
    if (v4)
    {
      v10 = v4[10];
      v11 = v10;
      if (v10)
      {
        lock_completions = self->_lock_completions;
        v13 = (void *)MEMORY[0x19AECAA00](v10);
        -[NSMutableArray addObject:](lock_completions, "addObject:", v13);

      }
    }
    else
    {
      v11 = 0;
    }
    os_unfair_lock_unlock(&self->_lock);
    if (count == 1)
      ((void (**)(_QWORD, BSXPCServiceConnectionMessageBatch *))v7)[2](v7, self);
    objc_msgSend(v4, "invalidate");
    v14 = dispatch_time(0, 100000000);
    targetQueue = self->super._targetQueue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__BSXPCServiceConnectionMessageBatch_appendMessage___block_invoke;
    v18[3] = &unk_1E390DC08;
    v18[4] = self;
    v18[5] = count;
    dispatch_after(v14, targetQueue, v18);

    v16 = 1;
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    v16 = 0;
  }

  return v16;
}

uint64_t __52__BSXPCServiceConnectionMessageBatch_appendMessage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "messageCount");
  if (v2 == result)
    return objc_msgSend(*(id *)(a1 + 32), "commitWithReason:", CFSTR("internal timeout"));
  return result;
}

- (BOOL)sendSynchronously
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BOOL result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSXPCServiceConnectionMessageBatch *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("batched messages must be sent asynchronously"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BSXPCServiceConnectionMessage.m");
    v17 = 1024;
    v18 = 376;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A799000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = _bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BOOL)didCommit
{
  BSXPCServiceConnectionMessageBatch *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_lock_messages == 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)commit
{
  return -[BSXPCServiceConnectionMessageBatch commitWithReason:](self, "commitWithReason:", 0) != 0;
}

- (unint64_t)commitWithReason:(id)a3
{
  __CFString *v4;
  OS_xpc_object *v5;
  NSMutableArray *v6;
  id v7;
  OS_xpc_object *lock_messages;
  NSMutableArray *lock_completions;
  id lock_batchHandler;
  size_t count;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  SEL v16;
  NSObject *v17;
  const __CFString *v18;
  double v19;
  SEL v20;
  objc_super v22;
  _QWORD newValue[4];
  NSMutableArray *v24;
  id v25;
  uint8_t buf[4];
  double v27;
  __int16 v28;
  size_t v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = self->_lock_messages;
  v6 = self->_lock_completions;
  v7 = self->super._completion;
  lock_messages = self->_lock_messages;
  self->_lock_messages = 0;

  lock_completions = self->_lock_completions;
  self->_lock_completions = 0;

  lock_batchHandler = self->_lock_batchHandler;
  self->_lock_batchHandler = 0;

  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    count = xpc_array_get_count(v5);
    if (count == 1)
    {
      xpc_array_get_value(v5, 0);
      v12 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v13 = (int)*MEMORY[0x1E0D018B8];
      v14 = *(Class *)((char *)&self->super.super.super.isa + v13);
      *(Class *)((char *)&self->super.super.super.isa + v13) = v12;

      -[NSMutableArray firstObject](v6, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_setProperty_nonatomic_copy(self, v16, v15, 80);

    }
    else
    {
      BSServiceXPCBatchLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[NSDate timeIntervalSinceNow](self->_date, "timeIntervalSinceNow");
        v18 = CFSTR("(reason unspecified)");
        *(_DWORD *)buf = 134218498;
        v27 = -v19;
        if (v4)
          v18 = v4;
        v28 = 2048;
        v29 = count;
        v30 = 2112;
        v31 = v18;
        _os_log_impl(&dword_19A799000, v17, OS_LOG_TYPE_DEFAULT, "sending batch message after %.3f with %zu messages: \"%@\", buf, 0x20u);
      }

      -[BSXPCCoder encodeXPCObject:forKey:](self, "encodeXPCObject:forKey:", v5, CFSTR("bsxpc_BATCH"));
      newValue[0] = MEMORY[0x1E0C809B0];
      newValue[1] = 3221225472;
      newValue[2] = __55__BSXPCServiceConnectionMessageBatch_commitWithReason___block_invoke;
      newValue[3] = &unk_1E390D260;
      v24 = v6;
      v25 = v7;
      objc_setProperty_nonatomic_copy(self, v20, newValue, 80);

    }
    v22.receiver = self;
    v22.super_class = (Class)BSXPCServiceConnectionMessageBatch;
    -[BSXPCServiceConnectionMessage send](&v22, sel_send);
  }
  else
  {
    count = 0;
  }

  return count;
}

void __55__BSXPCServiceConnectionMessageBatch_commitWithReason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11 = *(_QWORD *)(a1 + 40);
  if (v11)
    (*(void (**)(uint64_t, id, id))(v11 + 16))(v11, v5, v6);

}

- (unint64_t)messageCount
{
  os_unfair_lock_s *p_lock;
  OS_xpc_object *lock_messages;
  size_t count;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_messages = self->_lock_messages;
  if (lock_messages)
    count = xpc_array_get_count(lock_messages);
  else
    count = 0;
  os_unfair_lock_unlock(p_lock);
  return count;
}

- (BOOL)containsMessage:(SEL)a3
{
  os_unfair_lock_s *p_lock;
  uint64_t v6;
  id v7;
  uint64_t v8;
  OS_xpc_object *lock_messages;
  char v10;
  _QWORD applier[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_messages)
  {
    v6 = objc_msgSend(CFSTR("bsxpc_SEL"), "UTF8String");
    NSStringFromSelector(a3);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");

    lock_messages = self->_lock_messages;
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 3221225472;
    applier[2] = __54__BSXPCServiceConnectionMessageBatch_containsMessage___block_invoke;
    applier[3] = &unk_1E390DEC0;
    applier[4] = &v13;
    applier[5] = v6;
    applier[6] = v8;
    xpc_array_apply(lock_messages, applier);
    os_unfair_lock_unlock(p_lock);
  }
  os_unfair_lock_unlock(p_lock);
  v10 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v10;
}

BOOL __54__BSXPCServiceConnectionMessageBatch_containsMessage___block_invoke(uint64_t a1, int a2, xpc_object_t xdict)
{
  const char *string;

  string = xpc_dictionary_get_string(xdict, *(const char **)(a1 + 40));
  if (string)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = strcmp(string, *(const char **)(a1 + 48)) == 0;
  return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0;
}

- (id)batchHandler
{
  return self->_lock_batchHandler;
}

- (void)setBatchHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_batchHandler, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_lock_completions, 0);
  objc_storeStrong((id *)&self->_lock_messages, 0);
}

@end
