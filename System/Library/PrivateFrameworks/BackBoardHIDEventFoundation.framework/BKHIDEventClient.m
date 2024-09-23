@implementation BKHIDEventClient

- (BSMachPortSendRight)sendRight
{
  return self->_queue_sendRight;
}

void __32__BKHIDEventClient_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v5 = *(void **)(v2 + 16);
  v4 = (id *)(v2 + 16);
  if (v5 != v3)
    objc_storeStrong(v4, v3);
}

- (BOOL)isTerminating
{
  return self->_terminating;
}

- (void)setDelegate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __32__BKHIDEventClient_setDelegate___block_invoke;
  v7[3] = &unk_1E81F7CF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  BKHIDEventClient *v11;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v9 = a4;
  BSProcessDescriptionForPID();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[BKHIDEventClient initWithPid:sendRight:queue:processName:](self, "initWithPid:sendRight:queue:processName:", v6, v9, v8, v10);

  return v11;
}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4 queue:(id)a5 processName:(id)a6
{
  id v11;
  id v12;
  id v13;
  BKHIDEventClient *v14;
  BKHIDEventClient *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v22;
  NSString *queue_procName;
  id v24;
  uint64_t queue_pid;
  OS_dispatch_queue *v26;
  id *v27;
  BKHIDEventClient *v28;
  uint64_t v29;
  BSProcessDeathWatcher *queue_pidWatcher;
  uint64_t v31;
  BSPortDeathSentinel *queue_portSentinel;
  BSPortDeathSentinel *v33;
  _QWORD v35[4];
  BKHIDEventClient *v36;
  _QWORD v37[4];
  BKHIDEventClient *v38;
  objc_super v39;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v39.receiver = self;
  v39.super_class = (Class)BKHIDEventClient;
  v14 = -[BKHIDEventClient init](&v39, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_queue, a5);
    if (!v15->_queue)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("<%@: (pid: %d) %p>"), v18, v15->_queue_pid, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      Serial = BSDispatchQueueCreateSerial();
      queue = v15->_queue;
      v15->_queue = (OS_dispatch_queue *)Serial;

    }
    v15->_queue_pid = a3;
    objc_storeStrong((id *)&v15->_queue_sendRight, a4);
    if (a3 >= 1)
    {
      v22 = objc_msgSend(v13, "copy");
      queue_procName = v15->_queue_procName;
      v15->_queue_procName = (NSString *)v22;

    }
    if (-[BKHIDEventClient _deathByPid](v15, "_deathByPid"))
    {
      v24 = objc_alloc(MEMORY[0x1E0D01820]);
      queue_pid = v15->_queue_pid;
      v26 = v15->_queue;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __60__BKHIDEventClient_initWithPid_sendRight_queue_processName___block_invoke;
      v37[3] = &unk_1E81F7460;
      v27 = (id *)&v38;
      v28 = v15;
      v38 = v28;
      v29 = objc_msgSend(v24, "initWithPID:queue:deathHandler:", queue_pid, v26, v37);
      queue_pidWatcher = v28->_queue_pidWatcher;
      v28->_queue_pidWatcher = (BSProcessDeathWatcher *)v29;

LABEL_10:
      goto LABEL_11;
    }
    if (-[BKHIDEventClient _deathBySendRight](v15, "_deathBySendRight"))
    {
      v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0D01810]), "initWithSendRight:", v15->_queue_sendRight);
      queue_portSentinel = v15->_queue_portSentinel;
      v15->_queue_portSentinel = (BSPortDeathSentinel *)v31;

      -[BSPortDeathSentinel setQueue:](v15->_queue_portSentinel, "setQueue:", v15->_queue);
      v33 = v15->_queue_portSentinel;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __60__BKHIDEventClient_initWithPid_sendRight_queue_processName___block_invoke_2;
      v35[3] = &unk_1E81F7460;
      v27 = (id *)&v36;
      v36 = v15;
      -[BSPortDeathSentinel activateWithHandler:](v33, "activateWithHandler:", v35);
      goto LABEL_10;
    }
  }
LABEL_11:

  return v15;
}

- (BKHIDEventClient)initWithPid:(int)a3 sendRight:(id)a4
{
  return -[BKHIDEventClient initWithPid:sendRight:queue:](self, "initWithPid:sendRight:queue:", *(_QWORD *)&a3, a4, 0);
}

- (BOOL)_deathByPid
{
  return 1;
}

- (BKHIDEventClient)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKHIDEventClient *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKHIDEventClient *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("use initWithPid:..."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
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
    v16 = CFSTR("BKHIDEventClient.m");
    v17 = 1024;
    v18 = 29;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKHIDEventClient *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *queue;
  BKHIDEventClientDelegate *queue_delegate;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_super v11;
  _QWORD block[7];
  _QWORD v13[5];
  NSString *v14;
  _QWORD v15[5];
  BSMachPortSendRight *v16;
  _BYTE buf[24];
  BKHIDEventClient *v18;
  __int128 v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!self->_queue_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_queue_invalidated"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      *(_QWORD *)&buf[4] = v8;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2048;
      v18 = self;
      LOWORD(v19) = 2114;
      *(_QWORD *)((char *)&v19 + 2) = CFSTR("BKHIDEventClient.m");
      WORD5(v19) = 1024;
      HIDWORD(v19) = 79;
      v20 = 2114;
      v21 = v7;
      _os_log_error_impl(&dword_1C8914000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1C892ABB8);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v18 = (BKHIDEventClient *)__Block_byref_object_copy__1215;
  *(_QWORD *)&v19 = __Block_byref_object_dispose__1216;
  v3 = self->_queue;
  *((_QWORD *)&v19 + 1) = v3;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__1215;
  v15[4] = __Block_byref_object_dispose__1216;
  v16 = self->_queue_sendRight;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy__1215;
  v13[4] = __Block_byref_object_dispose__1216;
  v14 = self->_queue_procName;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__BKHIDEventClient_dealloc__block_invoke;
  block[3] = &unk_1E81F73C0;
  block[4] = buf;
  block[5] = v15;
  block[6] = v13;
  dispatch_async((dispatch_queue_t)v3, block);
  queue = self->_queue;
  self->_queue = 0;

  queue_delegate = self->_queue_delegate;
  self->_queue_delegate = 0;

  self->_queue_pid = -1;
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(buf, 8);

  v11.receiver = self;
  v11.super_class = (Class)BKHIDEventClient;
  -[BKHIDEventClient dealloc](&v11, sel_dealloc);
}

- (BKHIDEventClientDelegate)delegate
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__1215;
  v10 = __Block_byref_object_dispose__1216;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__BKHIDEventClient_delegate__block_invoke;
  v5[3] = &unk_1E81F73E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (BKHIDEventClientDelegate *)v3;
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__BKHIDEventClient_invalidate__block_invoke;
  block[3] = &unk_1E81F7460;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (NSString)description
{
  return (NSString *)-[BKHIDEventClient descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[BKHIDEventClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[BKHIDEventClient descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  NSString *queue_procName;
  id v7;
  id v8;
  BSMachPortSendRight *queue_sendRight;
  id v10;
  _QWORD v12[4];
  id v13;

  -[BKHIDEventClient succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  queue_procName = self->_queue_procName;
  if (queue_procName)
    v7 = (id)objc_msgSend(v4, "appendObject:withName:", queue_procName, CFSTR("name"));
  else
    v8 = (id)objc_msgSend(v4, "appendInt:withName:", self->_queue_pid, CFSTR("pid"));
  queue_sendRight = self->_queue_sendRight;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__BKHIDEventClient_descriptionBuilderWithMultilinePrefix___block_invoke;
  v12[3] = &unk_1E81F7410;
  v10 = v5;
  v13 = v10;
  -[BSMachPortSendRight accessPort:](queue_sendRight, "accessPort:", v12);

  return v10;
}

- (BOOL)_deathBySendRight
{
  return 0;
}

- (void)_queue_invalidate
{
  BKHIDEventClientDelegate *queue_delegate;
  BSProcessDeathWatcher *queue_pidWatcher;
  BSPortDeathSentinel *queue_portSentinel;

  if (!self->_queue_invalidated)
  {
    self->_queue_invalidated = 1;
    queue_delegate = self->_queue_delegate;
    self->_queue_delegate = 0;

    -[BSProcessDeathWatcher invalidate](self->_queue_pidWatcher, "invalidate");
    queue_pidWatcher = self->_queue_pidWatcher;
    self->_queue_pidWatcher = 0;

    -[BSPortDeathSentinel invalidate](self->_queue_portSentinel, "invalidate");
    queue_portSentinel = self->_queue_portSentinel;
    self->_queue_portSentinel = 0;

  }
}

- (void)_queue_performDelegateCallout:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__BKHIDEventClient__queue_performDelegateCallout___block_invoke;
  v7[3] = &unk_1E81F7438;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (int)pid
{
  return self->_queue_pid;
}

- (void)setTerminating:(BOOL)a3
{
  self->_terminating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_procName, 0);
  objc_storeStrong((id *)&self->_queue_portSentinel, 0);
  objc_storeStrong((id *)&self->_queue_pidWatcher, 0);
  objc_storeStrong((id *)&self->_queue_sendRight, 0);
  objc_storeStrong((id *)&self->_queue_delegate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__BKHIDEventClient__queue_performDelegateCallout___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __58__BKHIDEventClient_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%x"), a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendObject:withName:", v4, CFSTR("port"));

}

uint64_t __30__BKHIDEventClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_invalidate");
}

void __28__BKHIDEventClient_delegate__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

void __27__BKHIDEventClient_dealloc__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1[4] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = 0;

}

void __60__BKHIDEventClient_initWithPid_sendRight_queue_processName___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  BKLogDetailed();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_debug_impl(&dword_1C8914000, v2, OS_LOG_TYPE_DEBUG, "BKHIDEventClient died (pid): %{public}@", buf, 0xCu);
  }

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__BKHIDEventClient_initWithPid_sendRight_queue_processName___block_invoke_6;
  v5[3] = &unk_1E81F7398;
  v6 = v3;
  objc_msgSend(v6, "_queue_performDelegateCallout:", v5);

}

void __60__BKHIDEventClient_initWithPid_sendRight_queue_processName___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  BKLogDetailed();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v8 = v4;
    _os_log_debug_impl(&dword_1C8914000, v2, OS_LOG_TYPE_DEBUG, "BKHIDEventClient died (port): %{public}@", buf, 0xCu);
  }

  v3 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__BKHIDEventClient_initWithPid_sendRight_queue_processName___block_invoke_10;
  v5[3] = &unk_1E81F7398;
  v6 = v3;
  objc_msgSend(v6, "_queue_performDelegateCallout:", v5);

}

uint64_t __60__BKHIDEventClient_initWithPid_sendRight_queue_processName___block_invoke_10(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientDied:", *(_QWORD *)(a1 + 32));
}

uint64_t __60__BKHIDEventClient_initWithPid_sendRight_queue_processName___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clientDied:", *(_QWORD *)(a1 + 32));
}

@end
