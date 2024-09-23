@implementation NFECommercePaymentSession

- (id)allApplets
{
  return -[NSDictionary allValues](self->_appletsById, "allValues");
}

- (id)appletWithIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_appletsById, "objectForKey:", a3);
}

- (void)didStartSession:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFECommercePaymentSession;
  -[NFSession callbackQueue](&v11, sel_callbackQueue);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__NFECommercePaymentSession_didStartSession___block_invoke;
  block[3] = &unk_1E3B51A10;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __45__NFECommercePaymentSession_didStartSession___block_invoke(uint64_t a1)
{
  const void **v2;
  uint64_t Logger;
  void (*v4)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  objc_super v20;
  _QWORD v21[6];
  objc_super v22;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "didEnd"))
  {
    v2 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v4 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v4(5, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", v9, ClassName, Name, 38, *(_QWORD *)(a1 + 40));
    }
    dispatch_get_specific(*v2);
    NFSharedLogGetLogger();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v11))
        v12 = 43;
      else
        v12 = 45;
      v13 = object_getClassName(*(id *)(a1 + 32));
      v14 = sel_getName(*(SEL *)(a1 + 48));
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67110146;
      v24 = v12;
      v25 = 2082;
      v26 = v13;
      v27 = 2082;
      v28 = v14;
      v29 = 1024;
      v30 = 38;
      v31 = 2114;
      v32 = v15;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Session already ended: %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    v16 = *(void **)(a1 + 32);
    if (*(_QWORD *)(a1 + 40))
    {
      v22.receiver = *(id *)(a1 + 32);
      v22.super_class = (Class)NFECommercePaymentSession;
      objc_msgSendSuper2(&v22, sel_didStartSession_);
      return;
    }
    v17 = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __45__NFECommercePaymentSession_didStartSession___block_invoke_10;
    v21[3] = &unk_1E3B51410;
    v18 = *(_QWORD *)(a1 + 48);
    v21[4] = v16;
    v21[5] = v18;
    v20.receiver = v16;
    v20.super_class = (Class)NFECommercePaymentSession;
    v21[0] = MEMORY[0x1E0C809B0];
    objc_msgSendSuper2(&v20, sel_remoteObjectProxyWithErrorHandler_, v21);
    v10 = objc_claimAutoreleasedReturnValue();
    v19[0] = v17;
    v19[1] = 3221225472;
    v19[2] = __45__NFECommercePaymentSession_didStartSession___block_invoke_15;
    v19[3] = &unk_1E3B51CD0;
    v19[4] = *(_QWORD *)(a1 + 32);
    -[NSObject getAppletsWithCompletion:](v10, "getAppletsWithCompletion:", v19);
  }

}

void __45__NFECommercePaymentSession_didStartSession___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  objc_super v17;
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
  v3 = a2;
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v11, ClassName, Name, 45, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v19 = v14;
    v20 = 2082;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 1024;
    v25 = 45;
    v26 = 2114;
    v27 = v3;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v17.receiver = *(id *)(a1 + 32);
  v17.super_class = (Class)NFECommercePaymentSession;
  objc_msgSendSuper2(&v17, sel_didStartSession_, v3);

}

void __45__NFECommercePaymentSession_didStartSession___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  objc_super v14;
  _QWORD v15[4];
  id v16;

  v6 = *(id *)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_sync_enter(v6);
  v9 = (void *)objc_opt_new();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__NFECommercePaymentSession_didStartSession___block_invoke_2;
  v15[3] = &unk_1E3B51BF0;
  v16 = v9;
  v10 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v15);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v8, v10);

  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 72);
  *(_QWORD *)(v12 + 72) = v11;

  objc_sync_exit(v6);
  v14.receiver = *(id *)(a1 + 32);
  v14.super_class = (Class)NFECommercePaymentSession;
  objc_msgSendSuper2(&v14, sel_didStartSession_, v7);

}

void __45__NFECommercePaymentSession_didStartSession___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)performECommercePayment:(id)a3 request:(id)a4
{
  return -[NFECommercePaymentSession performECommercePayment:request:error:](self, "performECommercePayment:request:error:", a3, a4, 0);
}

- (id)performECommercePayment:(id)a3 request:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[8];
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  os_activity_scope_state_s state;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v9 = a4;
  v10 = a3;
  v11 = _os_activity_create(&dword_19B5EB000, "performECommercePayment:request:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__2;
  v22 = __Block_byref_object_dispose__2;
  v23 = 0;
  v12 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __67__NFECommercePaymentSession_performECommercePayment_request_error___block_invoke;
  v17[3] = &unk_1E3B51488;
  v17[4] = self;
  v17[5] = &v18;
  v17[6] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __67__NFECommercePaymentSession_performECommercePayment_request_error___block_invoke_20;
  v16[3] = &unk_1E3B51CF8;
  v16[4] = self;
  v16[5] = &v18;
  v16[6] = &state;
  v16[7] = a2;
  objc_msgSend(v13, "performECommercePayment:request:completion:", v10, v9, v16);

  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v14 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&state, 8);
  return v14;
}

void __67__NFECommercePaymentSession_performECommercePayment_request_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 79, v4);
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
    v25 = 79;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __67__NFECommercePaymentSession_performECommercePayment_request_error___block_invoke_20(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v13;
  NSObject *v14;
  objc_class *v15;
  int v16;
  const char *v17;
  const char *v18;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  else
  {
    v8 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v10 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 87, v7);
    }
    dispatch_get_specific(*v8);
    NFSharedLogGetLogger();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v15))
        v16 = 43;
      else
        v16 = 45;
      v17 = object_getClassName(*(id *)(a1 + 32));
      v18 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 87;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
}

- (id)validateEcommercePaymentRequest:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v4 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__NFECommercePaymentSession_validateEcommercePaymentRequest___block_invoke;
  v10[3] = &unk_1E3B51488;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a2;
  v5 = a3;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __61__NFECommercePaymentSession_validateEcommercePaymentRequest___block_invoke_22;
  v9[3] = &unk_1E3B51D20;
  v9[4] = &v11;
  objc_msgSend(v6, "validateEcommercePaymentRequest:completion:", v5, v9);

  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __61__NFECommercePaymentSession_validateEcommercePaymentRequest___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 107, v4);
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
    v25 = 107;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __61__NFECommercePaymentSession_validateEcommercePaymentRequest___block_invoke_22(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletsById, 0);
}

@end
