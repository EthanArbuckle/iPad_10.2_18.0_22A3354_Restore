@implementation NFTrustSession

- (id)createKey:(id)a3 request:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  const void **v16;
  uint64_t Logger;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  id v28;
  __CFString *v29;
  const char *Name;
  _QWORD v32[6];
  _QWORD v33[7];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  os_activity_scope_state_s state;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = _os_activity_create(&dword_19B5EB000, "createKey:request:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__3;
  v43 = __Block_byref_object_dispose__3;
  v44 = 0;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__3;
  v38 = __Block_byref_object_dispose__3;
  v39 = 0;
  if (a5)
  {
    if (v9)
    {
      if (v10)
      {
        v12 = MEMORY[0x1E0C809B0];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __42__NFTrustSession_createKey_request_error___block_invoke;
        v33[3] = &unk_1E3B51488;
        v33[4] = self;
        v33[5] = &v34;
        v33[6] = a2;
        -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v33);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = v12;
        v32[1] = 3221225472;
        v32[2] = __42__NFTrustSession_createKey_request_error___block_invoke_14;
        v32[3] = &unk_1E3B51DD0;
        v32[4] = &v34;
        v32[5] = &state;
        objc_msgSend(v13, "createKey:cresteKeyRequest:completion:", v9, v10, v32);

        v14 = (void *)v35[5];
        if (!v14)
        {
          v28 = *(id *)(state.opaque[1] + 40);
          goto LABEL_20;
        }
        v15 = objc_retainAutorelease(v14);
        goto LABEL_19;
      }
      v29 = CFSTR("Request is nil");
    }
    else
    {
      v29 = CFSTR("keyIdentifier is nil");
    }
    PTErrorInvalidParameters(v29);
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v28 = 0;
    *a5 = v15;
    goto LABEL_20;
  }
  v16 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v18 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v22 = 45;
    if (isMetaClass)
      v22 = 43;
    v18(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v22, ClassName, Name, 27);
  }
  dispatch_get_specific(*v16);
  NFSharedLogGetLogger();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v24 = object_getClass(self);
    if (class_isMetaClass(v24))
      v25 = 43;
    else
      v25 = 45;
    v26 = object_getClassName(self);
    v27 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v46 = v25;
    v47 = 2082;
    v48 = v26;
    v49 = 2082;
    v50 = v27;
    v51 = 1024;
    v52 = 27;
    _os_log_impl(&dword_19B5EB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
  }

  v28 = 0;
LABEL_20:
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&state, 8);
  return v28;
}

void __42__NFTrustSession_createKey_request_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 44, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 44;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __42__NFTrustSession_createKey_request_error___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (BOOL)deleteKey:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  const void **v14;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v20;
  NSObject *v21;
  objc_class *v22;
  int v23;
  const char *v24;
  const char *v25;
  const char *Name;
  _QWORD v28[5];
  _QWORD v29[7];
  os_activity_scope_state_s state;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "deleteKey:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__3;
  v33 = __Block_byref_object_dispose__3;
  v34 = 0;
  if (a4)
  {
    if (!v7)
    {
      PTErrorInvalidParameters(CFSTR("keyIdentifier is nil"));
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_16;
    }
    v9 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __34__NFTrustSession_deleteKey_error___block_invoke;
    v29[3] = &unk_1E3B51488;
    v29[4] = self;
    v29[5] = &state;
    v29[6] = a2;
    -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v29);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v9;
    v28[1] = 3221225472;
    v28[2] = __34__NFTrustSession_deleteKey_error___block_invoke_16;
    v28[3] = &unk_1E3B51D20;
    v28[4] = &state;
    objc_msgSend(v10, "deleteKey:completion:", v7, v28);

    v11 = *(void **)(state.opaque[1] + 40);
    v12 = v11 == 0;
    if (v11)
    {
      v13 = objc_retainAutorelease(v11);
LABEL_16:
      *a4 = v13;
    }
  }
  else
  {
    v14 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v16 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v20 = 45;
      if (isMetaClass)
        v20 = 43;
      v16(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v20, ClassName, Name, 68);
    }
    dispatch_get_specific(*v14);
    NFSharedLogGetLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = object_getClass(self);
      if (class_isMetaClass(v22))
        v23 = 43;
      else
        v23 = 45;
      v24 = object_getClassName(self);
      v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v36 = v23;
      v37 = 2082;
      v38 = v24;
      v39 = 2082;
      v40 = v25;
      v41 = 1024;
      v42 = 68;
      _os_log_impl(&dword_19B5EB000, v21, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    v12 = 0;
  }
  _Block_object_dispose(&state, 8);

  return v12;
}

void __34__NFTrustSession_deleteKey_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 80, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 80;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __34__NFTrustSession_deleteKey_error___block_invoke_16(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)signWithKey:(id)a3 request:(id)a4 authorization:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  const void **v19;
  uint64_t Logger;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *v29;
  const char *v30;
  id v31;
  __CFString *v32;
  const char *Name;
  _QWORD v35[6];
  _QWORD v36[7];
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  os_activity_scope_state_s state;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  int v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = _os_activity_create(&dword_19B5EB000, "signWithKey:request:authorization:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__3;
  v46 = __Block_byref_object_dispose__3;
  v47 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__3;
  v41 = __Block_byref_object_dispose__3;
  v42 = 0;
  if (a6)
  {
    if (v11)
    {
      if (v12)
      {
        v15 = MEMORY[0x1E0C809B0];
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __58__NFTrustSession_signWithKey_request_authorization_error___block_invoke;
        v36[3] = &unk_1E3B51488;
        v36[4] = self;
        v36[5] = &v37;
        v36[6] = a2;
        -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v36);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v15;
        v35[1] = 3221225472;
        v35[2] = __58__NFTrustSession_signWithKey_request_authorization_error___block_invoke_19;
        v35[3] = &unk_1E3B51DF8;
        v35[4] = &v37;
        v35[5] = &state;
        objc_msgSend(v16, "signWithKey:signRequest:paymentRequest:authorization:completion:", v11, v12, 0, v13, v35);

        v17 = (void *)v38[5];
        if (!v17)
        {
          v31 = *(id *)(state.opaque[1] + 40);
          goto LABEL_20;
        }
        v18 = objc_retainAutorelease(v17);
        goto LABEL_19;
      }
      v32 = CFSTR("signRequest is nil");
    }
    else
    {
      v32 = CFSTR("keyIdentifier is nil");
    }
    PTErrorInvalidParameters(v32);
    v18 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
    v31 = 0;
    *a6 = v18;
    goto LABEL_20;
  }
  v19 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v21 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v25 = 45;
    if (isMetaClass)
      v25 = 43;
    v21(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v25, ClassName, Name, 107);
  }
  dispatch_get_specific(*v19);
  NFSharedLogGetLogger();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    v27 = object_getClass(self);
    if (class_isMetaClass(v27))
      v28 = 43;
    else
      v28 = 45;
    v29 = object_getClassName(self);
    v30 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v49 = v28;
    v50 = 2082;
    v51 = v29;
    v52 = 2082;
    v53 = v30;
    v54 = 1024;
    v55 = 107;
    _os_log_impl(&dword_19B5EB000, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
  }

  v31 = 0;
LABEL_20:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&state, 8);
  return v31;
}

void __58__NFTrustSession_signWithKey_request_authorization_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 124, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 124;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __58__NFTrustSession_signWithKey_request_authorization_error___block_invoke_19(uint64_t a1, void *a2, id obj)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v10 = obj;
  v6 = a2;
  objc_msgSend(v6, "signResponse");
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

- (id)signWithKey:(id)a3 request:(id)a4 paymentRequest:(id)a5 authorization:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  const void **v22;
  uint64_t Logger;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v28;
  NSObject *v29;
  objc_class *v30;
  int v31;
  const char *v32;
  const char *v33;
  id v34;
  __CFString *v35;
  const char *Name;
  _QWORD v38[6];
  _QWORD v39[7];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  os_activity_scope_state_s state;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  int v52;
  __int16 v53;
  const char *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = _os_activity_create(&dword_19B5EB000, "signWithKey:request:paymentRequest:authorization:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v17, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__3;
  v49 = __Block_byref_object_dispose__3;
  v50 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__3;
  v44 = __Block_byref_object_dispose__3;
  v45 = 0;
  if (a7)
  {
    if (v13)
    {
      if (v14)
      {
        if (v15)
        {
          if (v16)
          {
            v18 = MEMORY[0x1E0C809B0];
            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __73__NFTrustSession_signWithKey_request_paymentRequest_authorization_error___block_invoke;
            v39[3] = &unk_1E3B51488;
            v39[4] = self;
            v39[5] = &v40;
            v39[6] = a2;
            -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v39);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v38[0] = v18;
            v38[1] = 3221225472;
            v38[2] = __73__NFTrustSession_signWithKey_request_paymentRequest_authorization_error___block_invoke_25;
            v38[3] = &unk_1E3B51DF8;
            v38[4] = &v40;
            v38[5] = &state;
            objc_msgSend(v19, "signWithKey:signRequest:paymentRequest:authorization:completion:", v13, v14, v15, v16, v38);

            v20 = (void *)v41[5];
            if (!v20)
            {
              v34 = *(id *)(state.opaque[1] + 40);
              goto LABEL_24;
            }
            v21 = objc_retainAutorelease(v20);
            goto LABEL_23;
          }
          v35 = CFSTR("authorization is nil");
        }
        else
        {
          v35 = CFSTR("paymentRequest is nil");
        }
      }
      else
      {
        v35 = CFSTR("signRequest is nil");
      }
    }
    else
    {
      v35 = CFSTR("keyIdentifier is nil");
    }
    PTErrorInvalidParameters(v35);
    v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:
    v34 = 0;
    *a7 = v21;
    goto LABEL_24;
  }
  v22 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v24 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v28 = 45;
    if (isMetaClass)
      v28 = 43;
    v24(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v28, ClassName, Name, 153);
  }
  dispatch_get_specific(*v22);
  NFSharedLogGetLogger();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    v30 = object_getClass(self);
    if (class_isMetaClass(v30))
      v31 = 43;
    else
      v31 = 45;
    v32 = object_getClassName(self);
    v33 = sel_getName(a2);
    *(_DWORD *)buf = 67109890;
    v52 = v31;
    v53 = 2082;
    v54 = v32;
    v55 = 2082;
    v56 = v33;
    v57 = 1024;
    v58 = 153;
    _os_log_impl(&dword_19B5EB000, v29, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
  }

  v34 = 0;
LABEL_24:
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&state, 8);
  return v34;
}

void __73__NFTrustSession_signWithKey_request_paymentRequest_authorization_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 180, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 180;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __73__NFTrustSession_signWithKey_request_paymentRequest_authorization_error___block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)getKey:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  char v17;
  id v18;
  const void **v19;
  uint64_t Logger;
  void (*v21)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v25;
  NSObject *v26;
  objc_class *v27;
  int v28;
  const char *Name;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t v35[128];
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[NFTrustSession listKeys:](self, "listKeys:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a4)
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v7);

          if ((v17 & 1) != 0)
          {
            v18 = v15;

            goto LABEL_22;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v12)
          continue;
        break;
      }
    }

    PTErrorKeyNotFound(v7);
    v18 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v21 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v25 = 45;
      if (isMetaClass)
        v25 = 43;
      v21(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v25, ClassName, Name, 200);
    }
    dispatch_get_specific(*v19);
    NFSharedLogGetLogger();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = object_getClass(self);
      if (class_isMetaClass(v27))
        v28 = 43;
      else
        v28 = 45;
      *(_DWORD *)buf = 67109890;
      v37 = v28;
      v38 = 2082;
      v39 = object_getClassName(self);
      v40 = 2082;
      v41 = sel_getName(a2);
      v42 = 1024;
      v43 = 200;
      _os_log_impl(&dword_19B5EB000, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    v18 = 0;
  }
LABEL_22:

  return v18;
}

- (id)listKeys:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  const void **v10;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  const char *Name;
  _QWORD v24[6];
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  os_activity_scope_state_s state;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_19B5EB000, "listKeys:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__3;
  v35 = __Block_byref_object_dispose__3;
  v36 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__3;
  v30 = __Block_byref_object_dispose__3;
  v31 = 0;
  if (a3)
  {
    v7 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __27__NFTrustSession_listKeys___block_invoke;
    v25[3] = &unk_1E3B51488;
    v25[4] = self;
    v25[5] = &v26;
    v25[6] = a2;
    -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    v24[1] = 3221225472;
    v24[2] = __27__NFTrustSession_listKeys___block_invoke_26;
    v24[3] = &unk_1E3B51E20;
    v24[4] = &v26;
    v24[5] = &state;
    objc_msgSend(v8, "listKeysWithCompletion:", v24);

    *a3 = objc_retainAutorelease((id)v27[5]);
    v9 = *(id *)(state.opaque[1] + 40);
  }
  else
  {
    v10 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v12 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v12(3, "%c[%{public}s %{public}s]:%i error cannot be nil", v16, ClassName, Name, 222);
    }
    dispatch_get_specific(*v10);
    NFSharedLogGetLogger();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(self);
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(self);
      v21 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v38 = v19;
      v39 = 2082;
      v40 = v20;
      v41 = 2082;
      v42 = v21;
      v43 = 1024;
      v44 = 222;
      _os_log_impl(&dword_19B5EB000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error cannot be nil", buf, 0x22u);
    }

    v9 = 0;
  }
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __27__NFTrustSession_listKeys___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 229, v4);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v19 = v13;
    v20 = 2082;
    v21 = v14;
    v22 = 2082;
    v23 = v15;
    v24 = 1024;
    v25 = 229;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __27__NFTrustSession_listKeys___block_invoke_26(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
