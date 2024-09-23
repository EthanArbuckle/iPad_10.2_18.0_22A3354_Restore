@implementation _BSActionResponder

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_BSActionResponder descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  -[_BSActionResponder _descriptionBuilderOfType:withMultilinePrefix:]((os_unfair_lock_s *)self, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_descriptionBuilderOfType:(os_unfair_lock_s *)a1 withMultilinePrefix:(uint64_t)a2
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  os_unfair_lock_s *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  os_unfair_lock_s *v18;

  if (a1)
  {
    os_unfair_lock_lock(a1 + 24);
    +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (a2 == 2)
      objc_msgSend(v4, "setUseDebugDescription:", 1);
    v6 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __68___BSActionResponder__descriptionBuilderOfType_withMultilinePrefix___block_invoke;
    v16[3] = &unk_1E1EBE700;
    v7 = v5;
    v17 = v7;
    v18 = a1;
    v8 = (id)objc_msgSend(v7, "modifyProem:", v16);
    if (a2)
    {
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __68___BSActionResponder__descriptionBuilderOfType_withMultilinePrefix___block_invoke_2;
      v12[3] = &unk_1E1EBF550;
      v13 = v7;
      v14 = a1;
      v15 = a2;
      v9 = (id)objc_msgSend(v13, "modifyBody:", v12);

    }
    os_unfair_lock_unlock(a1 + 24);
    v10 = v7;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (_QWORD)originator_responderOnQueue:(void *)a3 forHandler:
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  void *v9;
  id v10;
  objc_class *v11;
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
  uint64_t v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("queue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_originator_responderOnQueue_forHandler_);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v18 = v10;
      v19 = 2114;
      v20 = v12;
      v21 = 2048;
      v22 = v6;
      v23 = 2114;
      v24 = CFSTR("BSActionResponder.m");
      v25 = 1024;
      v26 = 455;
      v27 = 2114;
      v28 = v9;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1B3BB4);
  }
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("handler"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_originator_responderOnQueue_forHandler_);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v18 = v14;
      v19 = 2114;
      v20 = v16;
      v21 = 2048;
      v22 = v6;
      v23 = 2114;
      v24 = CFSTR("BSActionResponder.m");
      v25 = 1024;
      v26 = 456;
      v27 = 2114;
      v28 = v13;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1B3CB8);
  }
  v7 = -[_BSActionResponder _initWithQueue:handler:]([_BSActionResponder alloc], v4, v5);

  return v7;
}

- (_QWORD)_initWithQueue:(void *)a3 handler:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_BSActionResponder;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      *((_DWORD *)v8 + 24) = 0;
      *((_BYTE *)v8 + 100) = 1;
      if (v7)
      {
        objc_storeStrong((id *)v8 + 1, a2);
        v9 = objc_msgSend(v7, "copy");
        v10 = (void *)a1[2];
        a1[2] = v9;

      }
      else
      {
        *((_BYTE *)v8 + 101) = 1;
      }
    }
  }

  return a1;
}

+ (_BYTE)action_decodeFromXPCObject:(uint64_t)a1
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  Class Class;
  objc_class *v7;
  NSObject *v8;
  _BYTE *v9;
  BSMachPortSendOnceRight *v10;
  const char *string;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = objc_opt_self();
  v4 = v2;
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v9 = -[_BSActionResponder _initWithReply:]([_BSActionResponder alloc], 0);
    goto LABEL_14;
  }
  Class = object_getClass(v4);
  v7 = (objc_class *)MEMORY[0x1E0C812F8];

  if (Class != v7)
  {
    BSLogBSAction();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v19 = 138543362;
      v20 = v5;
      _os_log_error_impl(&dword_18A184000, v8, OS_LOG_TYPE_ERROR, "Responder-decode: unexpected encoding -> %{public}@", (uint8_t *)&v19, 0xCu);
    }

    goto LABEL_6;
  }
  v10 = -[BSMachPortRight initWithXPCDictionary:]([BSMachPortSendOnceRight alloc], "initWithXPCDictionary:", v5);
  if (!v10)
  {
    v17 = v3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_action_decodeFromXPCObject_, v17, CFSTR("BSActionResponder.m"), 256, CFSTR("must decode to a reply even if it is invalid"));

  }
  v9 = -[_BSActionResponder _initWithReply:]([_BSActionResponder alloc], v10);
  v9[102] = xpc_dictionary_get_BOOL(v5, "bsar_isnp");
  string = xpc_dictionary_get_string(v5, "bsar_aid");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)*((_QWORD *)v9 + 7);
    *((_QWORD *)v9 + 7) = v12;

    BSLogBSAction();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (void *)*((_QWORD *)v9 + 7);
      v19 = 138543362;
      v20 = v15;
      _os_log_impl(&dword_18A184000, v14, OS_LOG_TYPE_INFO, "Decode %{public}@", (uint8_t *)&v19, 0xCu);
    }

  }
LABEL_14:

  return v9;
}

- (_BYTE)_initWithReply:(_BYTE *)a1
{
  id v4;
  void *v5;
  id v6;
  char *v7;
  os_unfair_lock_s **v8;
  BOOL v9;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BYTE *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (a1)
  {
    v6 = v4;
    if (v6)
    {
      NSClassFromString(CFSTR("BSMachPortSendOnceRight"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSMachPortSendOnceRightClass]"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__initWithReply_);
          v12 = (id)objc_claimAutoreleasedReturnValue();
          v13 = (objc_class *)objc_opt_class();
          NSStringFromClass(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v17 = v12;
          v18 = 2114;
          v19 = v14;
          v20 = 2048;
          v21 = a1;
          v22 = 2114;
          v23 = CFSTR("BSActionResponder.m");
          v24 = 1024;
          v25 = 77;
          v26 = 2114;
          v27 = v11;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1B42ACLL);
      }
    }

    v15.receiver = a1;
    v15.super_class = (Class)_BSActionResponder;
    v7 = (char *)objc_msgSendSuper2(&v15, sel_init);
    a1 = v7;
    if (v7)
    {
      *((_DWORD *)v7 + 24) = 0;
      if (v6)
      {
        v8 = (os_unfair_lock_s **)(v7 + 40);
        objc_storeStrong((id *)v7 + 5, a2);
        if (-[BSMachPortRight _port](*v8))
          v9 = -[BSMachPortRight _port](*v8) == -1;
        else
          v9 = 1;
        a1[106] = v9;
      }
      else
      {
        v7[101] = 1;
      }
    }
  }

  return a1;
}

- (void)originator_setTimeout:(uint64_t)a1
{
  os_unfair_lock_s *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_source_t v8;
  void *v9;
  dispatch_object_t *v10;
  NSObject *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  void *v19;
  void *v20;
  id v21;
  objc_class *v22;
  void *v23;
  _QWORD handler[4];
  id v25;
  _BYTE location[12];
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 100))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must be called on the originator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_originator_setTimeout_);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)location = 138544642;
        *(_QWORD *)&location[4] = v13;
        v27 = 2114;
        v28 = v15;
        v29 = 2048;
        v30 = a1;
        v31 = 2114;
        v32 = CFSTR("BSActionResponder.m");
        v33 = 1024;
        v34 = 471;
        v35 = 2114;
        v36 = v12;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B45B4);
    }
    v4 = (os_unfair_lock_s *)(a1 + 96);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    v5 = *(NSObject **)(a1 + 24);
    if (v5)
    {
      dispatch_source_cancel(v5);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0;

    }
    if (a2 != -1 && !*(_QWORD *)(a1 + 72))
    {
      v7 = *(NSObject **)(a1 + 8);
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing response queue"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_originator_setTimeout_);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          v18 = (objc_class *)objc_opt_class();
          NSStringFromClass(v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138544642;
          *(_QWORD *)&location[4] = v17;
          v27 = 2114;
          v28 = v19;
          v29 = 2048;
          v30 = a1;
          v31 = 2114;
          v32 = CFSTR("BSActionResponder.m");
          v33 = 1024;
          v34 = 478;
          v35 = 2114;
          v36 = v16;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1B46B0);
      }
      if (!*(_QWORD *)(a1 + 16))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing response handler"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_originator_setTimeout_);
          v21 = (id)objc_claimAutoreleasedReturnValue();
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)location = 138544642;
          *(_QWORD *)&location[4] = v21;
          v27 = 2114;
          v28 = v23;
          v29 = 2048;
          v30 = a1;
          v31 = 2114;
          v32 = CFSTR("BSActionResponder.m");
          v33 = 1024;
          v34 = 479;
          v35 = 2114;
          v36 = v20;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", location, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v20), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1B47ACLL);
      }
      v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);
      v10 = (dispatch_object_t *)(a1 + 24);
      v9 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v8;

      dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 24), a2, 0xFFFFFFFFFFFFFFFFLL, 0);
      objc_initWeak((id *)location, (id)a1);
      v11 = *(NSObject **)(a1 + 24);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __44___BSActionResponder_originator_setTimeout___block_invoke;
      handler[3] = &unk_1E1EBF4D8;
      objc_copyWeak(&v25, (id *)location);
      dispatch_source_set_event_handler(v11, handler);
      dispatch_resume(*v10);
      objc_destroyWeak(&v25);
      objc_destroyWeak((id *)location);
    }
    os_unfair_lock_unlock(v4);
  }
}

- (uint64_t)action:(void *)a3 sendResponse:
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;
  void *v13;
  id v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  id v26;
  objc_class *v27;
  void *v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    v8 = v6;
    NSClassFromString(CFSTR("BSActionResponse"));
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_sendResponse_);
        v22 = (id)objc_claimAutoreleasedReturnValue();
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v22;
        v31 = 2114;
        v32 = v24;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSActionResponder.m");
        v37 = 1024;
        v38 = 131;
        v39 = 2114;
        v40 = v21;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v21), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B8DCCLL);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSActionResponseClass]"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_sendResponse_);
        v26 = (id)objc_claimAutoreleasedReturnValue();
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v26;
        v31 = 2114;
        v32 = v28;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSActionResponder.m");
        v37 = 1024;
        v38 = 131;
        v39 = 2114;
        v40 = v25;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B8ED0);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
    if (*(_BYTE *)(a1 + 104) || *(_BYTE *)(a1 + 103) || *(_BYTE *)(a1 + 105))
    {
      v12 = *(id *)(a1 + 64);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -sendResponse: from an inactive instance : action=%@\nprevious inactivation was at %@"), v5, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_sendResponse_);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v14;
        v31 = 2114;
        v32 = v16;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSActionResponder.m");
        v37 = 1024;
        v38 = 136;
        v39 = 2114;
        v40 = v13;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B8BC4);
    }
    *(_BYTE *)(a1 + 104) = 1;
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v9;

    if (*(_BYTE *)(a1 + 101))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -sendResponse: if no response was expected : action=%@"), v5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_sendResponse_);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v30 = v18;
        v31 = 2114;
        v32 = v20;
        v33 = 2048;
        v34 = a1;
        v35 = 2114;
        v36 = CFSTR("BSActionResponder.m");
        v37 = 1024;
        v38 = 142;
        v39 = 2114;
        v40 = v17;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v17), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B8CC8);
    }
    a1 = -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](a1, v8, 1, 0, 0);
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_lock_nullificationHandler, 0);
  objc_storeStrong((id *)&self->_lock_nullificationQueue, 0);
  objc_storeStrong((id *)&self->_lock_response, 0);
  objc_storeStrong((id *)&self->_lock_inactivationCallStack, 0);
  objc_storeStrong((id *)&self->_lock_action_identifier, 0);
  objc_storeStrong((id *)&self->_lock_nullificationMach, 0);
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_lock_originator_replySource, 0);
  objc_storeStrong((id *)&self->_lock_originator_timeoutSource, 0);
  objc_storeStrong(&self->_lock_originator_responseHandler, 0);
  objc_storeStrong((id *)&self->_originator_responseQueue, 0);
}

- (id)action_encode:(uint64_t)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  BSMachPortSendOnceRight *v9;
  id v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  BSMachPortSendOnceRight *v15;
  uint64_t SendOnceRight;
  dispatch_source_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  xpc_object_t v23;
  void *v24;
  void *v26;
  id v27;
  objc_class *v28;
  void *v29;
  void *v30;
  id v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  objc_class *v36;
  void *v37;
  void *v38;
  id v39;
  objc_class *v40;
  void *v41;
  _QWORD v42[6];
  mach_port_name_t v43;
  _QWORD handler[5];
  mach_port_name_t v45;
  mach_port_name_t name;
  mach_port_options_t buf;
  uint64_t v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  int v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
    goto LABEL_47;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
  if (*(_BYTE *)(a1 + 104) || *(_BYTE *)(a1 + 103) || *(_BYTE *)(a1 + 105))
  {
    v10 = *(id *)(a1 + 64);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -encode from an inactive instance : action=%@\nprevious inactivation was at %@"), v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel_action_encode_);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      buf.flags = 138544642;
      *(_QWORD *)&buf.mpl.mpl_qlimit = v12;
      *((_WORD *)&buf.service_port_name + 2) = 2114;
      *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v14;
      *((_WORD *)&buf.service_port_name + 7) = 2048;
      v48 = a1;
      v49 = 2114;
      v50 = CFSTR("BSActionResponder.m");
      v51 = 1024;
      v52 = 155;
      v53 = 2114;
      v54 = v11;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1B97D8);
  }
  *(_BYTE *)(a1 + 103) = 1;
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v4;

  if (!*(_BYTE *)(a1 + 101))
  {
    BSLogBSAction();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 56);
      buf.flags = 138543362;
      *(_QWORD *)&buf.mpl.mpl_qlimit = v8;
      _os_log_impl(&dword_18A184000, v7, OS_LOG_TYPE_INFO, "Encode %{public}@", (uint8_t *)&buf, 0xCu);
    }

    if (!*(_BYTE *)(a1 + 100))
    {
      v9 = (BSMachPortSendOnceRight *)*(id *)(a1 + 40);
      goto LABEL_16;
    }
    if (*(_BYTE *)(a1 + 106))
    {
      v9 = -[BSMachPortSendOnceRight initWithPort:]([BSMachPortSendOnceRight alloc], "initWithPort:", 0);
LABEL_16:
      v15 = v9;
LABEL_24:
      if (!v15)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must have a reply even if it is invalid"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel_action_encode_);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          buf.flags = 138544642;
          *(_QWORD *)&buf.mpl.mpl_qlimit = v27;
          *((_WORD *)&buf.service_port_name + 2) = 2114;
          *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v29;
          *((_WORD *)&buf.service_port_name + 7) = 2048;
          v48 = a1;
          v49 = 2114;
          v50 = CFSTR("BSActionResponder.m");
          v51 = 1024;
          v52 = 236;
          v53 = 2114;
          v54 = v26;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1B9AE8);
      }
      v23 = xpc_dictionary_create(0, 0, 0);
      v6 = v23;
      if (*(_BYTE *)(a1 + 102))
        xpc_dictionary_set_BOOL(v23, "bsar_isnp", 1);
      v24 = *(void **)(a1 + 56);
      if (v24)
        xpc_dictionary_set_string(v6, "bsar_aid", (const char *)objc_msgSend(v24, "UTF8String"));
      -[BSMachPortRight encodeWithXPCDictionary:](v15, "encodeWithXPCDictionary:", v6);
      -[BSMachPortRight invalidate](v15, "invalidate");

      goto LABEL_30;
    }
    if (!*(_QWORD *)(a1 + 8))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing response queue"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_encode_);
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        buf.flags = 138544642;
        *(_QWORD *)&buf.mpl.mpl_qlimit = v31;
        *((_WORD *)&buf.service_port_name + 2) = 2114;
        *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v33;
        *((_WORD *)&buf.service_port_name + 7) = 2048;
        v48 = a1;
        v49 = 2114;
        v50 = CFSTR("BSActionResponder.m");
        v51 = 1024;
        v52 = 167;
        v53 = 2114;
        v54 = v30;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v30), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B9BE0);
    }
    if (!*(_QWORD *)(a1 + 16))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing response handler"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_encode_);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        buf.flags = 138544642;
        *(_QWORD *)&buf.mpl.mpl_qlimit = v35;
        *((_WORD *)&buf.service_port_name + 2) = 2114;
        *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v37;
        *((_WORD *)&buf.service_port_name + 7) = 2048;
        v48 = a1;
        v49 = 2114;
        v50 = CFSTR("BSActionResponder.m");
        v51 = 1024;
        v52 = 168;
        v53 = 2114;
        v54 = v34;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B9CD8);
    }
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("mach source already set up"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_encode_);
        v39 = (id)objc_claimAutoreleasedReturnValue();
        v40 = (objc_class *)objc_opt_class();
        NSStringFromClass(v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        buf.flags = 138544642;
        *(_QWORD *)&buf.mpl.mpl_qlimit = v39;
        *((_WORD *)&buf.service_port_name + 2) = 2114;
        *(uint64_t *)((char *)buf.reserved + 6) = (uint64_t)v41;
        *((_WORD *)&buf.service_port_name + 7) = 2048;
        v48 = a1;
        v49 = 2114;
        v50 = CFSTR("BSActionResponder.m");
        v51 = 1024;
        v52 = 169;
        v53 = 2114;
        v54 = v38;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v38), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1B9DD0);
    }
    name = 0;
    buf.8 = 0uLL;
    *(_QWORD *)&buf.flags = 163;
    if (mach_port_construct(*MEMORY[0x1E0C83DA0], &buf, a1 + 96, &name))
    {
      _os_assert_log();
      _os_crash();
      __break(1u);
    }
    else if (name + 1 > 1)
    {
      SendOnceRight = BSMachCreateSendOnceRight(name);
      if ((SendOnceRight + 1) >= 2)
      {
        v15 = -[BSMachPortSendOnceRight initWithPort:]([BSMachPortSendOnceRight alloc], "initWithPort:", SendOnceRight);
        v17 = dispatch_source_create(MEMORY[0x1E0C80D98], name, 0, *(dispatch_queue_t *)(a1 + 8));
        v18 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v17;

        v19 = *(NSObject **)(a1 + 32);
        v20 = MEMORY[0x1E0C809B0];
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __36___BSActionResponder_action_encode___block_invoke;
        handler[3] = &__block_descriptor_44_e5_v8__0l;
        v45 = name;
        handler[4] = a1 + 96;
        dispatch_source_set_cancel_handler(v19, handler);
        v21 = *(NSObject **)(a1 + 32);
        v42[0] = v20;
        v42[1] = 3221225472;
        v42[2] = __36___BSActionResponder_action_encode___block_invoke_2;
        v42[3] = &unk_1E1EBF7F8;
        v43 = name;
        v42[4] = a1;
        v42[5] = a1;
        v22 = (id)a1;
        dispatch_source_set_event_handler(v21, v42);
        dispatch_resume(*(dispatch_object_t *)(a1 + 32));

        goto LABEL_24;
      }
      goto LABEL_46;
    }
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_46:
    _os_assert_log();
    _os_crash();
    __break(1u);
LABEL_47:
    v6 = 0;
    goto LABEL_31;
  }
  v6 = 0;
LABEL_30:
  -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)a1, 1);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
LABEL_31:

  return v6;
}

- (void)action_invalidate
{
  os_unfair_lock_s *v2;
  _BOOL4 v3;
  NSObject *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  v2 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
  if (*(_BYTE *)(a1 + 105))
    goto LABEL_18;
  os_unfair_lock_assert_owner(v2);
  v3 = !*(_BYTE *)(a1 + 104) && !*(_BYTE *)(a1 + 103) && *(_BYTE *)(a1 + 105) == 0;
  *(_BYTE *)(a1 + 105) = 1;
  if (!*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = v8;

    if (v3)
      goto LABEL_8;
LABEL_18:
    -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)a1, 0);
    os_unfair_lock_unlock(v2);
    return;
  }
  if (!v3)
    goto LABEL_18;
LABEL_8:
  if (-[_BSActionResponder _lock_canSendResponse]((const os_unfair_lock *)a1))
  {
    BSLogBSAction();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 56);
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_18A184000, v4, OS_LOG_TYPE_INFO, "Invalidate %{public}@", (uint8_t *)&v10, 0xCu);
    }

  }
  if (*(_BYTE *)(a1 + 102))
    v6 = 1;
  else
    v6 = 5;
  +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](a1, v7, 1, 0, 1);

}

- (void)dealloc
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id lock_nullificationHandler;
  void *v7;
  id v8;
  objc_class *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  _BSActionResponder *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[_BSActionResponder _lock_isClientActive]((const os_unfair_lock *)self))
  {
    +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 1uLL);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:]((uint64_t)self, v5, 1, 0, 1);

  }
  else
  {
    if (self->_lock_originator_responseHandler)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("response handler must have been called by now"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        v9 = (objc_class *)objc_opt_class();
        NSStringFromClass(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v13 = v8;
        v14 = 2114;
        v15 = v10;
        v16 = 2048;
        v17 = self;
        v18 = 2114;
        v19 = CFSTR("BSActionResponder.m");
        v20 = 1024;
        v21 = 96;
        v22 = 2114;
        v23 = v7;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1BA7CCLL);
    }
    lock_nullificationHandler = self->_lock_nullificationHandler;
    if (lock_nullificationHandler && self->_lock_nullificationHandlerIsLegacy)
      dispatch_async((dispatch_queue_t)self->_lock_nullificationQueue, lock_nullificationHandler);
    -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)self, 0);
    os_unfair_lock_unlock(p_lock);
  }
  v11.receiver = self;
  v11.super_class = (Class)_BSActionResponder;
  -[_BSActionResponder dealloc](&v11, sel_dealloc);
}

- (const)_lock_isClientActive
{
  const os_unfair_lock *v1;

  if (result)
  {
    v1 = result;
    os_unfair_lock_assert_owner(result + 24);
    if (LOBYTE(v1[26]._os_unfair_lock_opaque) || HIBYTE(v1[25]._os_unfair_lock_opaque))
      return 0;
    else
      return (const os_unfair_lock *)(BYTE1(v1[26]._os_unfair_lock_opaque) == 0);
  }
  return result;
}

- (uint64_t)_consumeLock_trySendResponse:(int)a3 alreadyLocked:(int)a4 alreadyOnResponseQueue:(int)a5 fireLegacyInvalidationHandler:
{
  id v10;
  id v11;
  os_unfair_lock_s *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  mach_port_name_t v17;
  mach_port_name_t v18;
  void *reply_from_port;
  id v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  char v32;
  void (**v33)(_QWORD, _QWORD);
  void *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  objc_class *v44;
  void *v45;
  void *v46;
  id v47;
  objc_class *v48;
  void *v49;
  _QWORD block[4];
  id v51;
  void (**v52)(_QWORD, _QWORD);
  unsigned __int8 v53;
  uint8_t buf[4];
  id v55;
  __int16 v56;
  _BYTE v57[18];
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = v10;
  if (!a1)
  {
    v53 = 0;
    goto LABEL_57;
  }
  v11 = v10;
  NSClassFromString(CFSTR("BSActionResponse"));
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__consumeLock_trySendResponse_alreadyLocked_alreadyOnResponseQueue_fireLegacyInvalidationHandler_);
      v43 = (id)objc_claimAutoreleasedReturnValue();
      v44 = (objc_class *)objc_opt_class();
      NSStringFromClass(v44);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v43;
      v56 = 2114;
      *(_QWORD *)v57 = v45;
      *(_WORD *)&v57[8] = 2048;
      *(_QWORD *)&v57[10] = a1;
      v58 = 2114;
      v59 = CFSTR("BSActionResponder.m");
      v60 = 1024;
      v61 = 557;
      v62 = 2114;
      v63 = v42;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v42), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BAE1CLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSActionResponseClass]"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__consumeLock_trySendResponse_alreadyLocked_alreadyOnResponseQueue_fireLegacyInvalidationHandler_);
      v47 = (id)objc_claimAutoreleasedReturnValue();
      v48 = (objc_class *)objc_opt_class();
      NSStringFromClass(v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v55 = v47;
      v56 = 2114;
      *(_QWORD *)v57 = v49;
      *(_WORD *)&v57[8] = 2048;
      *(_QWORD *)&v57[10] = a1;
      v58 = 2114;
      v59 = CFSTR("BSActionResponder.m");
      v60 = 1024;
      v61 = 557;
      v62 = 2114;
      v63 = v46;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v46), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1BAF20);
  }

  v12 = (os_unfair_lock_s *)(a1 + 96);
  if (a3)
  {
    os_unfair_lock_assert_owner(v12);
    if (!a4)
      goto LABEL_10;
  }
  else
  {
    os_unfair_lock_lock(v12);
    if (!a4)
      goto LABEL_10;
  }
  v13 = *(NSObject **)(a1 + 8);
  if (v13)
    dispatch_assert_queue_V2(v13);
LABEL_10:
  v14 = *(void **)(a1 + 72);
  if (v14)
  {
    v15 = v14;

    v11 = v15;
  }
  else
  {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
  v16 = *(void **)(a1 + 40);
  if (v16)
  {
    v17 = objc_msgSend(v16, "extractPortAndIKnowWhatImDoingISwear");
    v18 = v17;
    if (v17 - 1 > 0xFFFFFFFD)
    {
      if (v17)
      {
        BSLogBSAction();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138543362;
          v55 = v31;
          _os_log_impl(&dword_18A184000, v30, OS_LOG_TYPE_DEFAULT, "Reply failed %{public}@: port is invalid (originating action likely timed out)", buf, 0xCu);
        }

        BSMachSendRightRelease(v18);
      }
      v32 = 0;
      goto LABEL_44;
    }
    -[_BSActionResponder _lock_logResponse:](a1, v11);
    reply_from_port = (void *)xpc_pipe_create_reply_from_port();
    if (reply_from_port)
    {
      v20 = BSSerializeBSXPCEncodableObjectToXPCDictionary(v11, reply_from_port);
      v21 = xpc_pipe_routine_reply();
      v22 = v21;
      if (!v21)
      {
        v32 = 1;
LABEL_43:

LABEL_44:
        objc_msgSend(*(id *)(a1 + 40), "invalidate");
        goto LABEL_45;
      }
      if (v21 == 32)
      {
        BSLogBSAction();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138543362;
          v55 = v24;
          _os_log_impl(&dword_18A184000, v23, OS_LOG_TYPE_DEFAULT, "Reply failed %{public}@: receiver is no longer valid (EPIPE)", buf, 0xCu);
        }
      }
      else
      {
        BSLogBSAction();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v41 = *(void **)(a1 + 56);
          *(_DWORD *)buf = 138543874;
          v55 = v41;
          v56 = 1024;
          *(_DWORD *)v57 = v22;
          *(_WORD *)&v57[4] = 2082;
          *(_QWORD *)&v57[6] = strerror(v22);
          _os_log_error_impl(&dword_18A184000, v23, OS_LOG_TYPE_ERROR, "Reply failed %{public}@: xpc_pipe_routine_reply() returned %i (%{public}s)", buf, 0x1Cu);
        }
      }

    }
    else
    {
      BSLogBSAction();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        v40 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v55 = v40;
        _os_log_error_impl(&dword_18A184000, v35, OS_LOG_TYPE_ERROR, "Reply failed %{public}@: xpc_pipe_create_reply_from_port() failed to create a reply", buf, 0xCu);
      }

      BSMachSendRightRelease(v18);
    }
    v32 = 0;
    goto LABEL_43;
  }
  v25 = *(NSObject **)(a1 + 24);
  if (v25)
  {
    dispatch_source_cancel(v25);
    v26 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

  }
  if (*(_QWORD *)(a1 + 32))
  {
    -[_BSActionResponder _lock_logResponse:](a1, v11);
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
    v27 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
  v28 = *(_QWORD *)(a1 + 16);
  if (!v28)
  {
    v32 = 0;
LABEL_45:
    v29 = 0;
    v33 = 0;
    goto LABEL_46;
  }
  if ((a4 & 1) != 0)
  {
    v29 = 0;
  }
  else
  {
    v29 = *(id *)(a1 + 8);
    v28 = *(_QWORD *)(a1 + 16);
  }
  v33 = (void (**)(_QWORD, _QWORD))MEMORY[0x18D769CFC](v28);
  v34 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0;

  v32 = 1;
LABEL_46:
  v36 = *(id *)(a1 + 80);
  if (a5 && *(_BYTE *)(a1 + 107))
    v37 = *(_QWORD *)(a1 + 88);
  else
    v37 = 0;
  v38 = (void *)MEMORY[0x18D769CFC](v37);
  -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)a1, 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  if (v33)
  {
    if (v29)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __118___BSActionResponder__consumeLock_trySendResponse_alreadyLocked_alreadyOnResponseQueue_fireLegacyInvalidationHandler___block_invoke;
      block[3] = &unk_1E1EBEE78;
      v52 = v33;
      v51 = v11;
      dispatch_async(v29, block);

    }
    else
    {
      ((void (**)(_QWORD, id))v33)[2](v33, v11);
    }
  }
  if (v38)
    dispatch_async(v36, v38);
  v53 = v32;

LABEL_57:
  return v53;
}

- (const)_lock_invalidateForEncode:(const os_unfair_lock *)result
{
  const os_unfair_lock *v3;
  void *v4;
  void *v5;
  void *v6;

  if (result)
  {
    v3 = result;
    os_unfair_lock_assert_owner(result + 24);
    if (!a2 || !HIBYTE(v3[26]._os_unfair_lock_opaque) || !LOBYTE(v3[25]._os_unfair_lock_opaque))
    {
      v4 = *(void **)&v3[20]._os_unfair_lock_opaque;
      *(_QWORD *)&v3[20]._os_unfair_lock_opaque = 0;

      v5 = *(void **)&v3[22]._os_unfair_lock_opaque;
      *(_QWORD *)&v3[22]._os_unfair_lock_opaque = 0;

    }
    if (*(_QWORD *)&v3[12]._os_unfair_lock_opaque)
    {
      dispatch_mach_cancel();
      v6 = *(void **)&v3[12]._os_unfair_lock_opaque;
      *(_QWORD *)&v3[12]._os_unfair_lock_opaque = 0;

    }
    return (const os_unfair_lock *)objc_msgSend(*(id *)&v3[10]._os_unfair_lock_opaque, "invalidate");
  }
  return result;
}

- (os_unfair_lock_s)action_canSendResponse
{
  const os_unfair_lock *v1;
  os_unfair_lock_s *v2;
  const os_unfair_lock *v3;

  if (result)
  {
    v1 = result;
    v2 = result + 24;
    os_unfair_lock_lock(result + 24);
    v3 = -[_BSActionResponder _lock_canSendResponse](v1);
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (const)_lock_canSendResponse
{
  const os_unfair_lock *v1;
  const os_unfair_lock *v2;

  if (result)
  {
    v1 = result;
    v2 = result + 24;
    os_unfair_lock_assert_owner(result + 24);
    result = 0;
    if (!BYTE1(v1[25]._os_unfair_lock_opaque) && !BYTE2(v1[26]._os_unfair_lock_opaque))
    {
      os_unfair_lock_assert_owner(v2);
      if (!LOBYTE(v1[26]._os_unfair_lock_opaque)
        && !HIBYTE(v1[25]._os_unfair_lock_opaque)
        && !BYTE1(v1[26]._os_unfair_lock_opaque))
      {
        return (const os_unfair_lock *)1;
      }
    }
  }
  return result;
}

- (void)action_didDealloc
{
  os_unfair_lock_s *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 96);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    os_unfair_lock_assert_owner(v2);
    if (*(_BYTE *)(a1 + 104) || *(_BYTE *)(a1 + 103) || *(_BYTE *)(a1 + 105))
    {
      os_unfair_lock_unlock(v2);
    }
    else
    {
      if (-[_BSActionResponder _lock_canSendResponse]((const os_unfair_lock *)a1))
      {
        BSLogBSAction();
        v3 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
        {
          v4 = *(_QWORD *)(a1 + 56);
          v6 = 138543362;
          v7 = v4;
          _os_log_impl(&dword_18A184000, v3, OS_LOG_TYPE_INFO, "Dealloc %{public}@", (uint8_t *)&v6, 0xCu);
        }

      }
      +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, 1uLL);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](a1, v5, 1, 0, 1);

    }
  }
}

- (_BSActionResponder)init
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  _BSActionResponder *result;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  _BSActionResponder *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-init is not allowed on BSActionResponseObserver"));
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
    v16 = CFSTR("BSActionResponder.m");
    v17 = 1024;
    v18 = 58;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  result = (_BSActionResponder *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  qword_1EDF5BAE8 = (uint64_t)result;
  __break(0);
  return result;
}

- (NSString)debugDescription
{
  return (NSString *)-[_BSActionResponder debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (os_unfair_lock_s)action_isValid
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t v3;

  if (result)
  {
    v1 = (uint64_t)result;
    v2 = result + 24;
    os_unfair_lock_lock(result + 24);
    v3 = -[_BSActionResponder _lock_isValid](v1);
    os_unfair_lock_unlock(v2);
    return (os_unfair_lock_s *)v3;
  }
  return result;
}

- (uint64_t)_lock_isValid
{
  uint64_t v1;
  const os_unfair_lock *v2;

  if (result)
  {
    v1 = result;
    v2 = (const os_unfair_lock *)(result + 96);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(result + 96));
    os_unfair_lock_assert_owner(v2);
    if (*(_BYTE *)(v1 + 104) || *(_BYTE *)(v1 + 103) || *(_BYTE *)(v1 + 105) || *(_BYTE *)(v1 + 106))
    {
      return 0;
    }
    else if (*(_BYTE *)(v1 + 100) || *(_BYTE *)(v1 + 101))
    {
      return 1;
    }
    else
    {
      return objc_msgSend(*(id *)(v1 + 40), "isUsable");
    }
  }
  return result;
}

- (id)action_shortIdentifier
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1
    && (-[_BSActionResponder action_fullIdentifier](a1), (v1 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "rangeOfString:", CFSTR("0x"));
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(v2, "substringWithRange:", v3, objc_msgSend(v2, "length") + ~v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)action_fullIdentifier
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 24;
    os_unfair_lock_lock(a1 + 24);
    v1 = (id *)v1[7];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

- (void)action:(void *)a3 setNullificationQueue:(int)a4 isLegacy:(void *)a5 handler:
{
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  objc_class *v25;
  void *v26;
  void *v27;
  id v28;
  objc_class *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  NSObject *v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v9 = a3;
  v10 = a5;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if (*(_QWORD *)(a1 + 48))
    {
      dispatch_mach_cancel();
      v11 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

      v12 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

    }
    if (!v10)
    {
      v13 = *(void **)(a1 + 80);
      *(_QWORD *)(a1 + 80) = 0;

      v14 = *(void **)(a1 + 88);
      *(_QWORD *)(a1 + 88) = 0;

LABEL_19:
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      goto LABEL_20;
    }
    if (v9)
    {
      if (a4)
      {
LABEL_7:
        if (*(_BYTE *)(a1 + 104) || *(_BYTE *)(a1 + 103))
          goto LABEL_18;
        if (*(_BYTE *)(a1 + 105))
        {
LABEL_17:
          dispatch_async(v9, v10);
LABEL_18:

          v10 = 0;
          goto LABEL_19;
        }
LABEL_16:
        if (!*(_BYTE *)(a1 + 106))
        {
          objc_storeStrong((id *)(a1 + 80), v9);
          v15 = objc_msgSend(v10, "copy");
          v16 = *(void **)(a1 + 88);
          *(_QWORD *)(a1 + 88) = v15;

          *(_BYTE *)(a1 + 107) = a4;
          v17 = *(void **)(a1 + 40);
          if (v17)
          {
            if (*(_QWORD *)(a1 + 48))
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dispatch mach already set up"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                NSStringFromSelector(sel_action_setNullificationQueue_isLegacy_handler_);
                v28 = (id)objc_claimAutoreleasedReturnValue();
                v29 = (objc_class *)objc_opt_class();
                NSStringFromClass(v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544642;
                v35 = v28;
                v36 = 2114;
                v37 = v30;
                v38 = 2048;
                v39 = a1;
                v40 = 2114;
                v41 = CFSTR("BSActionResponder.m");
                v42 = 1024;
                v43 = 341;
                v44 = 2114;
                v45 = v27;
                _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

              }
              qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v27), "UTF8String");
              __break(0);
              JUMPOUT(0x18A1F7A6CLL);
            }
            v32[0] = MEMORY[0x1E0C809B0];
            v32[1] = 3221225472;
            v32[2] = __68___BSActionResponder_action_setNullificationQueue_isLegacy_handler___block_invoke;
            v32[3] = &unk_1E1EBF848;
            v32[4] = a1;
            v18 = v9;
            v33 = v18;
            objc_msgSend(v17, "accessPort:", v32);
            if (!*(_QWORD *)(a1 + 48))
            {
              *(_BYTE *)(a1 + 106) = 1;
              v19 = *(void **)(a1 + 88);
              if (v19)
              {
                dispatch_async(*(dispatch_queue_t *)(a1 + 80), v19);
                v20 = *(void **)(a1 + 80);
                *(_QWORD *)(a1 + 80) = 0;

                v21 = *(void **)(a1 + 88);
                *(_QWORD *)(a1 + 88) = 0;

              }
            }

            v9 = v18;
          }
          goto LABEL_19;
        }
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_get_global_queue(21, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (a4)
        goto LABEL_7;
    }
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
    if (*(_BYTE *)(a1 + 104) || *(_BYTE *)(a1 + 103) || *(_BYTE *)(a1 + 105))
    {
      v22 = *(id *)(a1 + 64);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -setNullificationHandler: on an inactive instance : action=%@\nprevious inactivation was at %@"), v31, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_action_setNullificationQueue_isLegacy_handler_);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v35 = v24;
        v36 = 2114;
        v37 = v26;
        v38 = 2048;
        v39 = a1;
        v40 = 2114;
        v41 = CFSTR("BSActionResponder.m");
        v42 = 1024;
        v43 = 326;
        v44 = 2114;
        v45 = v23;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1F7974);
    }
    goto LABEL_16;
  }
LABEL_20:

}

- (void)originator_didInit:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  objc_class *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!*(_BYTE *)(a1 + 100))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must be called on the originator"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_originator_didInit_);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v20 = v12;
        v21 = 2114;
        v22 = v14;
        v23 = 2048;
        v24 = a1;
        v25 = 2114;
        v26 = CFSTR("BSActionResponder.m");
        v27 = 1024;
        v28 = 442;
        v29 = 2114;
        v30 = v11;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1F8254);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 96));
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_lock_action_identifier == nil"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_originator_didInit_);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v20 = v16;
        v21 = 2114;
        v22 = v18;
        v23 = 2048;
        v24 = a1;
        v25 = 2114;
        v26 = CFSTR("BSActionResponder.m");
        v27 = 1024;
        v28 = 444;
        v29 = 2114;
        v30 = v15;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1F8358);
    }
    if (!*(_BYTE *)(a1 + 101))
    {
      do
        v4 = __ldxr((unsigned int *)&originator_didInit____count);
      while (__stxr(v4 + 1, (unsigned int *)&originator_didInit____count));
      v5 = (void *)MEMORY[0x1E0CB3940];
      NSStringFromClass(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: 0x%04x%04x>"), v6, getpid(), v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 56);
      *(_QWORD *)(a1 + 56) = v7;

      BSLogBSAction();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        v10 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v20 = v10;
        _os_log_debug_impl(&dword_18A184000, v9, OS_LOG_TYPE_DEBUG, "Alloc %{public}@", buf, 0xCu);
      }

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 96));
  }
}

+ (_QWORD)originator_nullResponder
{
  objc_opt_self();
  return -[_BSActionResponder _initWithQueue:handler:]([_BSActionResponder alloc], 0, 0);
}

- (void)originator_annulWithErrorCode:(os_unfair_lock_s *)a1
{
  void *v4;
  id v5;
  objc_class *v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  os_unfair_lock_s *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("must send a valid error code to annul"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(sel_originator_annulWithErrorCode_);
        v5 = (id)objc_claimAutoreleasedReturnValue();
        v6 = (objc_class *)objc_opt_class();
        NSStringFromClass(v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138544642;
        v9 = v5;
        v10 = 2114;
        v11 = v7;
        v12 = 2048;
        v13 = a1;
        v14 = 2114;
        v15 = CFSTR("BSActionResponder.m");
        v16 = 1024;
        v17 = 492;
        v18 = 2114;
        v19 = v4;
        _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

      }
      qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
      __break(0);
      JUMPOUT(0x18A1F85B4);
    }
    os_unfair_lock_lock(a1 + 24);
    -[_BSActionResponder _consumeLock_originator_annulWithCode:alreadyOnResponseQueue:]((uint64_t)a1, a2, 0);
  }
}

- (void)_consumeLock_originator_annulWithCode:(int)a3 alreadyOnResponseQueue:
{
  os_unfair_lock_s *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = (os_unfair_lock_s *)(a1 + 96);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 96));
  if (a3)
  {
    v7 = *(NSObject **)(a1 + 8);
    if (v7)
      dispatch_assert_queue_V2(v7);
  }
  if (!*(_BYTE *)(a1 + 100))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("annul may only be called on the originator"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__consumeLock_originator_annulWithCode_alreadyOnResponseQueue_);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v24 = v16;
      v25 = 2114;
      v26 = v18;
      v27 = 2048;
      v28 = a1;
      v29 = 2114;
      v30 = CFSTR("BSActionResponder.m");
      v31 = 1024;
      v32 = 697;
      v33 = 2114;
      v34 = v15;
      _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
    __break(0);
    JUMPOUT(0x18A1F88DCLL);
  }
  if (*(_BYTE *)(a1 + 106))
  {
    -[_BSActionResponder _lock_invalidateForEncode:]((const os_unfair_lock *)a1, 0);
    os_unfair_lock_unlock(v6);
  }
  else
  {
    if (*(_QWORD *)(a1 + 56))
    {
      BSLogBSAction();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = *(void **)(a1 + 56);
        *(_DWORD *)buf = 138543362;
        v24 = v9;
        _os_log_impl(&dword_18A184000, v8, OS_LOG_TYPE_INFO, "Annul %{public}@", buf, 0xCu);
      }

    }
    *(_BYTE *)(a1 + 106) = 1;
    v10 = *(id *)(a1 + 80);
    v11 = (void *)MEMORY[0x18D769CFC](*(_QWORD *)(a1 + 88));
    v12 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v13 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

    +[BSActionResponse responseForErrorCode:]((uint64_t)BSActionResponse, a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BSActionResponder _consumeLock_trySendResponse:alreadyLocked:alreadyOnResponseQueue:fireLegacyInvalidationHandler:](a1, v14, 1, a3, 1);
    if (v11)
    {
      if (!v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("missing nullification queue"));
        v22 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__consumeLock_originator_annulWithCode_alreadyOnResponseQueue_);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v24 = v19;
          v25 = 2114;
          v26 = v21;
          v27 = 2048;
          v28 = a1;
          v29 = 2114;
          v30 = CFSTR("BSActionResponder.m");
          v31 = 1024;
          v32 = 715;
          v33 = 2114;
          v34 = v22;
          _os_log_error_impl(&dword_18A184000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        qword_1EDF5BAE8 = objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
        __break(0);
        JUMPOUT(0x18A1F89D8);
      }
      dispatch_async(v10, v11);
    }

  }
}

- (void)_lock_logResponse:(uint64_t)a1
{
  id v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  __CFString *v16;
  __int16 v17;
  NSObject *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_QWORD *)(a1 + 40))
    v4 = CFSTR("Reply");
  else
    v4 = CFSTR("Response");
  v5 = v4;
  objc_msgSend(v3, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "domain");
    v8 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isEqualToString:](v8, "isEqualToString:", CFSTR("BSActionErrorDomain")))
    {
      NSStringFromBSActionErrorCode(objc_msgSend(v7, "code"));
      v9 = objc_claimAutoreleasedReturnValue();
      BSLogBSAction();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 56);
        v15 = 138543874;
        v16 = v5;
        v17 = 2114;
        v18 = v9;
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_18A184000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ (error: %{public}@) %{public}@", (uint8_t *)&v15, 0x20u);
      }

    }
    else
    {
      BSLogBSAction();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_msgSend(v7, "code");
        v14 = *(_QWORD *)(a1 + 56);
        v15 = 138544130;
        v16 = v5;
        v17 = 2114;
        v18 = v8;
        v19 = 2048;
        v20 = v13;
        v21 = 2114;
        v22 = v14;
        _os_log_impl(&dword_18A184000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (error: %{public}@/%ld) %{public}@", (uint8_t *)&v15, 0x2Au);
      }
    }

  }
  else
  {
    BSLogBSAction();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v12 = *(NSObject **)(a1 + 56);
      v15 = 138543618;
      v16 = v5;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_18A184000, v8, OS_LOG_TYPE_INFO, "%{public}@ %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[_BSActionResponder succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return -[_BSActionResponder _descriptionBuilderOfType:withMultilinePrefix:]((os_unfair_lock_s *)self, 0);
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[_BSActionResponder _descriptionBuilderOfType:withMultilinePrefix:]((os_unfair_lock_s *)self, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
