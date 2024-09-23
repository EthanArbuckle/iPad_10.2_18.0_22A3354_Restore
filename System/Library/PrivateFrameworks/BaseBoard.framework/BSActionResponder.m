@implementation BSActionResponder

id __68___BSActionResponder__descriptionBuilderOfType_withMultilinePrefix___block_invoke_2(uint64_t a1)
{
  id v2;
  id result;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 105), CFSTR("clientInvalidated"));
  result = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 103), CFSTR("clientEncoded"));
  v4 = *(_QWORD *)(a1 + 40);
  if (!*(_BYTE *)(v4 + 101))
  {
    v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(v4 + 104), CFSTR("clientResponded"));
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 72;
    if (*(_BYTE *)(v6 + 104))
    {
      v8 = CFSTR("response");
    }
    else
    {
      v7 = 40;
      v8 = CFSTR("reply");
    }
    v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(v6 + v7), v8);
    result = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 106), CFSTR("annulled"));
  }
  if (*(_QWORD *)(a1 + 48) == 2)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v10 + 100))
    {
      if (!*(_BYTE *)(v10 + 101) && !*(_BYTE *)(v10 + 104))
      {
        v11 = *(_QWORD *)(v10 + 72);
        if (v11)
        {
          v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", v11, CFSTR("receivedResponse"));
          v10 = *(_QWORD *)(a1 + 40);
        }
      }
      v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(v10 + 8), CFSTR("responseQueue"), 1);
      v14 = *(void **)(a1 + 32);
      v15 = (void *)MEMORY[0x18D769CFC](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
      v16 = (id)objc_msgSend(v14, "appendObject:withName:skipIfNil:", v15, CFSTR("responseHandler"), 1);

      v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24), CFSTR("timeoutSource"), 1);
      v18 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("replySource"), 1);
      v10 = *(_QWORD *)(a1 + 40);
    }
    v19 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(v10 + 80), CFSTR("nullificationQueue"), 1);
    v20 = *(void **)(a1 + 32);
    v21 = (void *)MEMORY[0x18D769CFC](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88));
    v22 = (id)objc_msgSend(v20, "appendObject:withName:skipIfNil:", v21, CFSTR("nullificationHandler"), 1);

    v23 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 107), CFSTR("nullificationHandlerIsLegacy"), 1);
    v24 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), CFSTR("nullificationMach"), 1);
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:skipIfNil:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("inactivationStack"), 1);
  }
  return result;
}

uint64_t __118___BSActionResponder__consumeLock_trySendResponse_alreadyLocked_alreadyOnResponseQueue_fireLegacyInvalidationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_underlying, 0);
  objc_storeStrong(&self->_lock_handler, 0);
  objc_storeStrong((id *)&self->_lock_queue, 0);
}

void __36___BSActionResponder_action_encode___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t buf[16];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = xpc_pipe_receive();
  if (v2 == 5)
  {
    +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 1uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](*(_QWORD *)(a1 + 32), v3, 0, 1, 1);
  }
  else if (v2 == 35)
  {
    BSLogBSAction();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v4;
      _os_log_debug_impl(&dword_18A184000, v3, OS_LOG_TYPE_DEBUG, "Responder-receiveReply %@: xpc_pipe_receive unexpectedly returned EAGAIN", buf, 0xCu);
    }
  }
  else
  {
    if (v2)
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 3uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](*(_QWORD *)(a1 + 32), v3, 0, 1, 1);
  }

}

- (os_unfair_lock)_lock_underlying
{
  os_unfair_lock *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  void *v9;

  if (a1)
  {
    v1 = a1;
    os_unfair_lock_assert_owner(a1 + 10);
    v2 = *(void **)&v1[6]._os_unfair_lock_opaque;
    if (!v2)
    {
      v3 = *(void **)&v1[2]._os_unfair_lock_opaque;
      v4 = v3;
      if (!v3)
      {
        dispatch_get_global_queue(21, 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      +[_BSActionResponder originator_responderOnQueue:forHandler:]((uint64_t)_BSActionResponder, v4, *(void **)&v1[4]._os_unfair_lock_opaque);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(void **)&v1[6]._os_unfair_lock_opaque;
      *(_QWORD *)&v1[6]._os_unfair_lock_opaque = v5;

      if (!v3)
      v7 = *(_QWORD *)&v1[8]._os_unfair_lock_opaque;
      if (v7 != -1)
        -[_BSActionResponder originator_setTimeout:](*(_QWORD *)&v1[6]._os_unfair_lock_opaque, v7);
      v8 = *(void **)&v1[2]._os_unfair_lock_opaque;
      *(_QWORD *)&v1[2]._os_unfair_lock_opaque = 0;

      v9 = *(void **)&v1[4]._os_unfair_lock_opaque;
      *(_QWORD *)&v1[4]._os_unfair_lock_opaque = 0;

      v2 = *(void **)&v1[6]._os_unfair_lock_opaque;
    }
    a1 = v2;
  }
  return a1;
}

const os_unfair_lock *__68___BSActionResponder__descriptionBuilderOfType_withMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  const os_unfair_lock *result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", -[_BSActionResponder _lock_isClientActive](*(const os_unfair_lock **)(a1 + 40)), CFSTR("active"));
  result = *(const os_unfair_lock **)(a1 + 40);
  if (!BYTE1(result[25]._os_unfair_lock_opaque))
    return (const os_unfair_lock *)(id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", -[_BSActionResponder _lock_canSendResponse](result), CFSTR("waiting"));
  return result;
}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  os_unfair_lock_s *v4;
  objc_super v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_underlying)
  {
    -[BSActionResponder _lock_underlying]((os_unfair_lock *)self);
    v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[_BSActionResponder originator_annulWithErrorCode:](v4, 1uLL);

  }
  os_unfair_lock_unlock(p_lock);
  v5.receiver = self;
  v5.super_class = (Class)BSActionResponder;
  -[BSActionResponder dealloc](&v5, sel_dealloc);
}

+ (id)responderWithHandler:(id)a3
{
  id v5;
  _QWORD *v6;
  void *v8;
  id v9;
  objc_class *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v9;
      v14 = 2114;
      v15 = v11;
      v16 = 2048;
      v17 = a1;
      v18 = 2114;
      v19 = CFSTR("BSAction.m");
      v20 = 1024;
      v21 = 76;
      v22 = 2114;
      v23 = v8;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BFED0);
  }
  v6 = -[BSActionResponder _initWithHandler:]([BSActionResponder alloc], v5);

  return v6;
}

- (_QWORD)_initWithHandler:(_QWORD *)a1
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)BSActionResponder;
    v4 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 10) = 0;
      v5 = objc_msgSend(v3, "copy");
      v6 = (void *)a1[2];
      a1[2] = v5;

      a1[4] = -1;
    }
  }

  return a1;
}

uint64_t __36___BSActionResponder_action_encode___block_invoke(uint64_t a1)
{
  return mach_port_destruct(*MEMORY[0x1E0C83DA0], *(_DWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)setQueue:(id)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_queue *lock_queue;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  BSActionResponder *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (OS_dispatch_queue *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v16 = v8;
      v17 = 2114;
      v18 = v10;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("BSAction.m");
      v23 = 1024;
      v24 = 106;
      v25 = 2114;
      v26 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1C5498);
  }
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_underlying)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot mutate queue after associating with an action or annulling"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v16 = v12;
      v17 = 2114;
      v18 = v14;
      v19 = 2048;
      v20 = self;
      v21 = 2114;
      v22 = CFSTR("BSAction.m");
      v23 = 1024;
      v24 = 108;
      v25 = 2114;
      v26 = v11;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1C5590);
  }
  lock_queue = self->_lock_queue;
  self->_lock_queue = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setTimeout:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  BSActionResponder *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_underlying)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot mutate timeout after associating with an action or annulling"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138544642;
      v12 = v8;
      v13 = 2114;
      v14 = v10;
      v15 = 2048;
      v16 = self;
      v17 = 2114;
      v18 = CFSTR("BSAction.m");
      v19 = 1024;
      v20 = 115;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v11, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1C82A4);
  }
  self->_lock_timeout = a3;
  os_unfair_lock_unlock(p_lock);
}

void __68___BSActionResponder_action_setNullificationQueue_isLegacy_handler___block_invoke(uint64_t a1, mach_port_name_t a2)
{
  ipc_space_t *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  kern_return_t v8;
  uint64_t v9;
  void *v10;
  mach_port_t previous;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, void *);
  void *v15;
  uint64_t *v16;
  id v17[2];
  mach_port_name_t v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  id location;
  mach_port_options_t options;
  mach_port_name_t name;

  if (a2 - 1 > 0xFFFFFFFD)
    return;
  name = 0;
  options.8 = 0uLL;
  *(_QWORD *)&options.flags = 163;
  v4 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  if (mach_port_construct(*MEMORY[0x1E0C83DA0], &options, (mach_port_context_t)&name, &name))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
    goto LABEL_11;
  }
  if (name + 1 <= 1)
  {
LABEL_11:
    _os_assert_log();
    _os_crash();
    __break(1u);
    return;
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v19 = 0;
  v20 = (id *)&v19;
  v21 = 0x3042000000;
  v22 = __Block_byref_object_copy__6;
  v23 = __Block_byref_object_dispose__6;
  v24 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v14 = __68___BSActionResponder_action_setNullificationQueue_isLegacy_handler___block_invoke_61;
  v15 = &unk_1E1EBF820;
  v13 = 3221225472;
  objc_copyWeak(v17, &location);
  v18 = name;
  v16 = &v19;
  v17[1] = &name;
  v5 = (void *)dispatch_mach_create();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  objc_storeWeak(v20 + 5, v5);
  dispatch_mach_connect();
  previous = 0;
  v8 = mach_port_request_notification(*v4, a2, 72, 0, name, 0x15u, &previous);
  if (previous)
    mach_port_deallocate(*v4, previous);
  if (v8)
  {
    dispatch_mach_cancel();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 48);
    *(_QWORD *)(v9 + 48) = 0;

  }
  objc_destroyWeak(v17);
  _Block_object_dispose(&v19, 8);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

void __68___BSActionResponder_action_setNullificationQueue_isLegacy_handler___block_invoke_61(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  mach_msg_header_t *msg;
  os_unfair_lock_s *WeakRetained;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  os_unfair_lock_s *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 == 8)
  {
    mach_port_destruct(*MEMORY[0x1E0C83DA0], *(_DWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 48));
  }
  else if (a2 == 2)
  {
    msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
    mach_msg_destroy(msg);
    WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
    if (WeakRetained)
    {
      os_unfair_lock_lock(WeakRetained + 24);
      if (v8
        && *(id *)&WeakRetained[12]._os_unfair_lock_opaque == v8
        && (BYTE2(WeakRetained[26]._os_unfair_lock_opaque) = 1,
            dispatch_mach_cancel(),
            v10 = *(void **)&WeakRetained[12]._os_unfair_lock_opaque,
            *(_QWORD *)&WeakRetained[12]._os_unfair_lock_opaque = 0,
            v10,
            *(_QWORD *)&WeakRetained[22]._os_unfair_lock_opaque))
      {
        v9 = (void (**)(_QWORD))MEMORY[0x18D769CFC]();
        v11 = *(void **)&WeakRetained[20]._os_unfair_lock_opaque;
        if (!v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing nullification queue"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(sel__nullificationQueue_didNullifyWithMach_);
            v14 = (id)objc_claimAutoreleasedReturnValue();
            v15 = (objc_class *)objc_opt_class();
            NSStringFromClass(v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544642;
            v18 = v14;
            v19 = 2114;
            v20 = v16;
            v21 = 2048;
            v22 = WeakRetained;
            v23 = 2114;
            v24 = CFSTR("BSActionResponder.m");
            v25 = 1024;
            v26 = 680;
            v27 = 2114;
            v28 = v13;
            _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

          }
          qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
          __break(0);
          JUMPOUT(0x18A1F7FB0);
        }
        *(_QWORD *)&WeakRetained[20]._os_unfair_lock_opaque = 0;

        v12 = *(void **)&WeakRetained[22]._os_unfair_lock_opaque;
        *(_QWORD *)&WeakRetained[22]._os_unfair_lock_opaque = 0;

        os_unfair_lock_unlock(WeakRetained + 24);
        if (v9)
          v9[2](v9);
      }
      else
      {
        os_unfair_lock_unlock(WeakRetained + 24);
        v9 = 0;
      }

    }
  }

}

void __44___BSActionResponder_originator_setTimeout___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 24);
    -[_BSActionResponder _consumeLock_originator_annulWithCode:alreadyOnResponseQueue:]((uint64_t)WeakRetained, 2uLL, 1);
  }

}

- (BSActionResponder)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  BSActionResponder *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BSActionResponder *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSActionResponder"));
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
    v16 = CFSTR("BSAction.m");
    v17 = 1024;
    v18 = 52;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  result = (BSActionResponder *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

+ (id)responderByWrappingResponder:(id)a3 withHandler:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  BSAction *v11;
  BSActionResponder *v12;
  uint64_t v13;
  id v14;
  BSAction *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  void *v24;
  id v25;
  objc_class *v26;
  void *v27;
  void *v28;
  id v29;
  objc_class *v30;
  void *v31;
  void *v32;
  id v33;
  objc_class *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  BSAction *v39;
  id v40;
  SEL v41;
  id v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v7;
  NSClassFromString(CFSTR("BSActionResponder"));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v21;
      v45 = 2114;
      v46 = v23;
      v47 = 2048;
      v48 = a1;
      v49 = 2114;
      v50 = CFSTR("BSAction.m");
      v51 = 1024;
      v52 = 81;
      v53 = 2114;
      v54 = v20;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
    __break(0);
    JUMPOUT(0x18A206F9CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSActionResponderClass]"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v25;
      v45 = 2114;
      v46 = v27;
      v47 = 2048;
      v48 = a1;
      v49 = 2114;
      v50 = CFSTR("BSAction.m");
      v51 = 1024;
      v52 = 81;
      v53 = 2114;
      v54 = v24;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2070A0);
  }

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v29;
      v45 = 2114;
      v46 = v31;
      v47 = 2048;
      v48 = a1;
      v49 = 2114;
      v50 = CFSTR("BSAction.m");
      v51 = 1024;
      v52 = 82;
      v53 = 2114;
      v54 = v28;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v28), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2071A4);
  }
  os_unfair_lock_lock((os_unfair_lock_t)v9 + 10);
  if (*((_QWORD *)v9 + 3))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot query after associating with an action or annulling"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__queue);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v44 = v33;
      v45 = 2114;
      v46 = v35;
      v47 = 2048;
      v48 = v9;
      v49 = 2114;
      v50 = CFSTR("BSAction.m");
      v51 = 1024;
      v52 = 136;
      v53 = 2114;
      v54 = v32;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v32), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2072A0);
  }
  v10 = *((id *)v9 + 1);
  os_unfair_lock_unlock((os_unfair_lock_t)v9 + 10);
  v11 = -[BSAction initWithInfo:responder:]([BSAction alloc], "initWithInfo:responder:", 0, v9);
  v12 = [BSActionResponder alloc];
  v13 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke;
  v38[3] = &unk_1E1EBFF80;
  v14 = v8;
  v40 = v14;
  v41 = a2;
  v42 = a1;
  v15 = v11;
  v39 = v15;
  v16 = -[BSActionResponder _initWithHandler:](v12, v38);
  v17 = v16;
  if (v10)
    objc_msgSend(v16, "setQueue:", v10);
  v36[0] = v13;
  v36[1] = 3221225472;
  v36[2] = __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke_45;
  v36[3] = &unk_1E1EBE890;
  v18 = v17;
  v37 = v18;
  -[BSAction setNullificationHandler:](v15, "setNullificationHandler:", v36);

  return v18;
}

void __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint64_t *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  const __CFString *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v5 = *(_QWORD *)(a1 + 40);
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke_2;
  v17 = &unk_1E1EBFF58;
  v6 = v4;
  v21 = *(_OWORD *)(a1 + 48);
  v18 = v6;
  v20 = &v22;
  v19 = *(id *)(a1 + 32);
  (*(void (**)(uint64_t, id, uint64_t *))(v5 + 16))(v5, v3, &v14);
  if (!*((_BYTE *)v23 + 24))
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (void *)MEMORY[0x18D769CFC](*(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "stringWithFormat:", CFSTR("handler failed to call wrappedHandler in scope : handler = %@"), v8, v14, v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138544642;
      v27 = v10;
      v28 = 2114;
      v29 = v12;
      v30 = 2048;
      v31 = v13;
      v32 = 2114;
      v33 = CFSTR("BSAction.m");
      v34 = 1024;
      v35 = 94;
      v36 = 2114;
      v37 = v9;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    __break(0);
    JUMPOUT(0x18A2075FCLL);
  }

  _Block_object_dispose(&v22, 8);
}

void __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("handler failed to call wrappedHandler in scope"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      v17 = v6;
      v18 = 2114;
      v19 = v8;
      v20 = 2048;
      v21 = v9;
      v22 = 2114;
      v23 = CFSTR("BSAction.m");
      v24 = 1024;
      v25 = 89;
      v26 = 2114;
      v27 = v5;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    __break(0);
    JUMPOUT(0x18A20780CLL);
  }
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("handler failed to call wrappedHandler with a valid response"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544642;
      v17 = v11;
      v18 = 2114;
      v19 = v13;
      v20 = 2048;
      v21 = v14;
      v22 = 2114;
      v23 = CFSTR("BSAction.m");
      v24 = 1024;
      v25 = 90;
      v26 = 2114;
      v27 = v10;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    __break(0);
    JUMPOUT(0x18A207908);
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  objc_msgSend(*(id *)(a1 + 40), "sendResponse:");

}

uint64_t __62__BSActionResponder_responderByWrappingResponder_withHandler___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "annul");
}

- (void)annul
{
  os_unfair_lock_s *p_lock;
  os_unfair_lock_s *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSActionResponder _lock_underlying]((os_unfair_lock *)self);
  v4 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  -[_BSActionResponder originator_annulWithErrorCode:](v4, 6uLL);

  os_unfair_lock_unlock(p_lock);
}

@end
