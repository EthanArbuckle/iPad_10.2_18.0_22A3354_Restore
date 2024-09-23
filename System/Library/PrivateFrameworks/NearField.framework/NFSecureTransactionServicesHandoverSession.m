@implementation NFSecureTransactionServicesHandoverSession

- (void)startSTSNotificationListenerWithEndpoint:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[6];
  os_activity_scope_state_s state;

  v5 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "startSTSNotificationListenerWithEndpoint:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__NFSecureTransactionServicesHandoverSession_startSTSNotificationListenerWithEndpoint___block_invoke;
  v8[3] = &unk_1E3B51410;
  v8[4] = self;
  v8[5] = a2;
  -[NFSession remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startSTSNotificationListenerEndpoint:", v5);

}

void __87__NFSecureTransactionServicesHandoverSession_startSTSNotificationListenerWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 32, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 32;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }

}

- (id)startTNEPTagDeviceWithService:(id)a3 optionalRecords:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v26;
  _QWORD v27[5];
  _QWORD v28[6];
  os_activity_scope_state_s state;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v26 = a5;
  v11 = _os_activity_create(&dword_19B5EB000, "startTNEPTagDeviceWithService:optionalRecords:delegate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v12 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DE78D0]), "initWithNDEFRecord:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        objc_msgSend(v12, "addObject:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v15);
  }

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__20;
  v32 = __Block_byref_object_dispose__20;
  v33 = 0;
  v19 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __101__NFSecureTransactionServicesHandoverSession_startTNEPTagDeviceWithService_optionalRecords_delegate___block_invoke;
  v28[3] = &unk_1E3B51410;
  v28[4] = self;
  v28[5] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v12, "copy");
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __101__NFSecureTransactionServicesHandoverSession_startTNEPTagDeviceWithService_optionalRecords_delegate___block_invoke_11;
  v27[3] = &unk_1E3B51D20;
  v27[4] = &state;
  objc_msgSend(v20, "startTNEPDeviceWithServices:optionalRecords:callback:", v21, v22, v27);

  v23 = *(void **)(state.opaque[1] + 40);
  if (!v23)
  {
    -[NFSecureTransactionServicesHandoverSession setTagDeviceDelegate:](self, "setTagDeviceDelegate:", v26);
    v23 = *(void **)(state.opaque[1] + 40);
  }
  v24 = v23;
  _Block_object_dispose(&state, 8);

  return v24;
}

void __101__NFSecureTransactionServicesHandoverSession_startTNEPTagDeviceWithService_optionalRecords_delegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 81, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 81;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }

}

void __101__NFSecureTransactionServicesHandoverSession_startTNEPTagDeviceWithService_optionalRecords_delegate___block_invoke_11(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)singleResponseCommunicationTagSend:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[6];
  os_activity_scope_state_s state;

  v7 = a4;
  v8 = a3;
  v9 = _os_activity_create(&dword_19B5EB000, "singleResponseCommunicationTagSend:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DE78C8]), "initWithNDEFMessage:", v8);
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationTagSend_completionHandler___block_invoke;
  v16[3] = &unk_1E3B51410;
  v16[4] = self;
  v16[5] = a2;
  -[NFSession remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __99__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationTagSend_completionHandler___block_invoke_13;
  v14[3] = &unk_1E3B538D8;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v12, "tnepTagDeviceSendNDEFMessage:callback:", v10, v14);

}

void __99__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationTagSend_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 101, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 101;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }

}

uint64_t __99__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationTagSend_completionHandler___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)startTNEPReaderWithDelegate:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[6];
  os_activity_scope_state_s state;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "startTNEPReaderWithDelegate:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__20;
  v17 = __Block_byref_object_dispose__20;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__NFSecureTransactionServicesHandoverSession_startTNEPReaderWithDelegate___block_invoke;
  v13[3] = &unk_1E3B51410;
  v13[4] = self;
  v13[5] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __74__NFSecureTransactionServicesHandoverSession_startTNEPReaderWithDelegate___block_invoke_14;
  v12[3] = &unk_1E3B51D20;
  v12[4] = &state;
  objc_msgSend(v8, "startTNEPReaderWithCallback:", v12);

  v9 = *(void **)(state.opaque[1] + 40);
  if (!v9)
  {
    -[NFSecureTransactionServicesHandoverSession setTagReaderDelegate:](self, "setTagReaderDelegate:", v5);
    v9 = *(void **)(state.opaque[1] + 40);
  }
  v10 = v9;
  _Block_object_dispose(&state, 8);

  return v10;
}

void __74__NFSecureTransactionServicesHandoverSession_startTNEPReaderWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 116, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 116;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }

}

void __74__NFSecureTransactionServicesHandoverSession_startTNEPReaderWithDelegate___block_invoke_14(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)singleResponseCommunicationReaderSend:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[6];
  os_activity_scope_state_s state;

  v7 = a4;
  v8 = a3;
  v9 = _os_activity_create(&dword_19B5EB000, "singleResponseCommunicationReaderSend:completionHandler:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DE78C8]), "initWithNDEFMessage:", v8);
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __102__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationReaderSend_completionHandler___block_invoke;
  v16[3] = &unk_1E3B51410;
  v16[4] = self;
  v16[5] = a2;
  -[NFSession remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __102__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationReaderSend_completionHandler___block_invoke_15;
  v14[3] = &unk_1E3B53900;
  v15 = v7;
  v13 = v7;
  objc_msgSend(v12, "tnepReaderSend:callback:", v10, v14);

}

void __102__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationReaderSend_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 136, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 136;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }

}

void __102__NFSecureTransactionServicesHandoverSession_singleResponseCommunicationReaderSend_completionHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NFNdefMessage *v7;

  v5 = a3;
  v6 = a2;
  v7 = -[NFNdefMessage initWithNDEFMessage:]([NFNdefMessage alloc], "initWithNDEFMessage:", v6);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)selectService:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[6];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "selectService:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20;
  v16 = __Block_byref_object_dispose__20;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__NFSecureTransactionServicesHandoverSession_selectService___block_invoke;
  v12[3] = &unk_1E3B51410;
  v12[4] = self;
  v12[5] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __60__NFSecureTransactionServicesHandoverSession_selectService___block_invoke_18;
  v11[3] = &unk_1E3B51D20;
  v11[4] = &state;
  objc_msgSend(v8, "tnepReaderSelectService:callback:", v5, v11);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __60__NFSecureTransactionServicesHandoverSession_selectService___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 151, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 151;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }

}

void __60__NFSecureTransactionServicesHandoverSession_selectService___block_invoke_18(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)deselectService
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = _os_activity_create(&dword_19B5EB000, "deselectService", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__20;
  v14 = __Block_byref_object_dispose__20;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__NFSecureTransactionServicesHandoverSession_deselectService__block_invoke;
  v10[3] = &unk_1E3B51410;
  v10[4] = self;
  v10[5] = a2;
  -[NFSession remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __61__NFSecureTransactionServicesHandoverSession_deselectService__block_invoke_19;
  v9[3] = &unk_1E3B51D20;
  v9[4] = &state;
  objc_msgSend(v6, "tnepReaderDeselectWithCallback:", v9);

  v7 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v7;
}

void __61__NFSecureTransactionServicesHandoverSession_deselectService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 168, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 168;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }

}

void __61__NFSecureTransactionServicesHandoverSession_deselectService__block_invoke_19(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)restartPolling
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[6];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = _os_activity_create(&dword_19B5EB000, "restartPolling", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__20;
  v14 = __Block_byref_object_dispose__20;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__NFSecureTransactionServicesHandoverSession_restartPolling__block_invoke;
  v10[3] = &unk_1E3B51410;
  v10[4] = self;
  v10[5] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __60__NFSecureTransactionServicesHandoverSession_restartPolling__block_invoke_20;
  v9[3] = &unk_1E3B51D20;
  v9[4] = &state;
  objc_msgSend(v6, "tnepReaderRestartPollingWithCallback:", v9);

  v7 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v7;
}

void __60__NFSecureTransactionServicesHandoverSession_restartPolling__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v9;
  NSObject *v10;
  objc_class *v11;
  int v12;
  const char *v13;
  const char *v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i error: %{public}@", v9, ClassName, Name, 185, v3);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v11))
      v12 = 43;
    else
      v12 = 45;
    v13 = object_getClassName(*(id *)(a1 + 32));
    v14 = sel_getName(*(SEL *)(a1 + 40));
    *(_DWORD *)buf = 67110146;
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 185;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i error: %{public}@", buf, 0x2Cu);
  }

}

void __60__NFSecureTransactionServicesHandoverSession_restartPolling__block_invoke_20(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)stopTNEPOperation
{
  NSObject *v3;
  void *v4;
  _QWORD v5[5];
  os_activity_scope_state_s state;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v3 = _os_activity_create(&dword_19B5EB000, "stopTNEPOperation", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__20;
  v9 = __Block_byref_object_dispose__20;
  v10 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__NFSecureTransactionServicesHandoverSession_stopTNEPOperation__block_invoke;
  v5[3] = &unk_1E3B51D20;
  v5[4] = &state;
  -[NFSession remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tnepServiceInvalidate");

  _Block_object_dispose(&state, 8);
}

void __63__NFSecureTransactionServicesHandoverSession_stopTNEPOperation__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)fieldNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NFSession callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__NFSecureTransactionServicesHandoverSession_fieldNotification___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __64__NFSecureTransactionServicesHandoverSession_fieldNotification___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:fieldNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)fieldChange:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[NFSession callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__NFSecureTransactionServicesHandoverSession_fieldChange___block_invoke;
  v6[3] = &unk_1E3B51E98;
  v6[4] = self;
  v7 = a3;
  dispatch_async(v5, v6);

}

void __58__NFSecureTransactionServicesHandoverSession_fieldChange___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "session:fieldChange:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

  }
}

- (void)tnepReaderServicesDiscovered:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NFSession callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__NFSecureTransactionServicesHandoverSession_tnepReaderServicesDiscovered___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __75__NFSecureTransactionServicesHandoverSession_tnepReaderServicesDiscovered___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tagReaderDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDiscoverServices:", *(_QWORD *)(a1 + 40));

}

- (void)staticReaderEngagementDiscovered:(id)a3
{
  id v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v8(6, "%c[%{public}s %{public}s]:%i handover select %@", v11, ClassName, Name, 236, v5);
  }
  dispatch_get_specific(*v6);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    *(_DWORD *)buf = 67110146;
    v18 = v14;
    v19 = 2082;
    v20 = object_getClassName(self);
    v21 = 2082;
    v22 = sel_getName(a2);
    v23 = 1024;
    v24 = 236;
    v25 = 2112;
    v26 = v5;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i handover select %@", buf, 0x2Cu);
  }

}

- (void)tnepReaderServicesAborted:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[NFSession callbackQueue](self, "callbackQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__NFSecureTransactionServicesHandoverSession_tnepReaderServicesAborted___block_invoke;
  block[3] = &unk_1E3B51A10;
  block[4] = self;
  v9 = v5;
  v10 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

uint64_t __72__NFSecureTransactionServicesHandoverSession_tnepReaderServicesAborted___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  const void **v6;
  uint64_t Logger;
  void (*v8)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "tagReaderDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didAbort:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "session:didEndUnexpectedly:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  v6 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 48));
    v12 = 45;
    if (isMetaClass)
      v12 = 43;
    v8(4, "%c[%{public}s %{public}s]:%i Ending session due to reader service abort", v12, ClassName, Name, 246);
  }
  dispatch_get_specific(*v6);
  NFSharedLogGetLogger();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v14 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v14))
      v15 = 43;
    else
      v15 = 45;
    v16 = object_getClassName(*(id *)(a1 + 32));
    v17 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 2082;
    v25 = v17;
    v26 = 1024;
    v27 = 246;
    _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Ending session due to reader service abort", buf, 0x22u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "endSession");
}

- (void)tnepTagDeviceDeselected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NFSession callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__NFSecureTransactionServicesHandoverSession_tnepTagDeviceDeselected___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __70__NFSecureTransactionServicesHandoverSession_tnepTagDeviceDeselected___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tagDeviceDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didDeselect:", *(_QWORD *)(a1 + 40));

}

- (void)tnepTagDeviceNDEFMessageReceived:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  NFSecureTransactionServicesHandoverSession *v9;

  v4 = a3;
  -[NFSession callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__NFSecureTransactionServicesHandoverSession_tnepTagDeviceNDEFMessageReceived___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __79__NFSecureTransactionServicesHandoverSession_tnepTagDeviceNDEFMessageReceived___block_invoke(uint64_t a1)
{
  void *v2;
  NFNdefMessage *v3;

  v3 = -[NFNdefMessage initWithNDEFMessage:]([NFNdefMessage alloc], "initWithNDEFMessage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "tagDeviceDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didReceiveMessage:", v3);

}

- (void)tnepTagDeviceReaderDetected
{
  NSObject *v3;
  _QWORD block[5];

  -[NFSession callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__NFSecureTransactionServicesHandoverSession_tnepTagDeviceReaderDetected__block_invoke;
  block[3] = &unk_1E3B51A60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __73__NFSecureTransactionServicesHandoverSession_tnepTagDeviceReaderDetected__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tagDeviceDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didDetectReader");

}

- (void)tnepTagDeviceSelected:(id)a3 respondHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[NFSession callbackQueue](self, "callbackQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__NFSecureTransactionServicesHandoverSession_tnepTagDeviceSelected_respondHandler___block_invoke;
  block[3] = &unk_1E3B51EE8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __83__NFSecureTransactionServicesHandoverSession_tnepTagDeviceSelected_respondHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "tagDeviceDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __83__NFSecureTransactionServicesHandoverSession_tnepTagDeviceSelected_respondHandler___block_invoke_2;
  v4[3] = &unk_1E3B51EC0;
  v3 = *(_QWORD *)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "didSelect:respondHandler:", v3, v4);

}

void __83__NFSecureTransactionServicesHandoverSession_tnepTagDeviceSelected_respondHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        v12 = objc_alloc(MEMORY[0x1E0DE78D0]);
        v13 = (void *)objc_msgSend(v12, "initWithNDEFRecord:", v11, (_QWORD)v14);
        objc_msgSend(v5, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)connectionHandoverTNEPServiceSelected:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NFSession callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__NFSecureTransactionServicesHandoverSession_connectionHandoverTNEPServiceSelected___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __84__NFSecureTransactionServicesHandoverSession_connectionHandoverTNEPServiceSelected___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:tnepService:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionHandoverProcessFailure:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[NFSession callbackQueue](self, "callbackQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __79__NFSecureTransactionServicesHandoverSession_connectionHandoverProcessFailure___block_invoke;
  v7[3] = &unk_1E3B51E70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __79__NFSecureTransactionServicesHandoverSession_connectionHandoverProcessFailure___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "session:connectionHandoverProcessFailure:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)connectionHandoverProcessCompleted
{
  NSObject *v3;
  _QWORD block[5];

  -[NFSession callbackQueue](self, "callbackQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__NFSecureTransactionServicesHandoverSession_connectionHandoverProcessCompleted__block_invoke;
  block[3] = &unk_1E3B51A60;
  block[4] = self;
  dispatch_async(v3, block);

}

void __80__NFSecureTransactionServicesHandoverSession_connectionHandoverProcessCompleted__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectionHandoverCompleted:", *(_QWORD *)(a1 + 32));

}

- (NFSecureTransactionServicesHandoverSessionDelegate)delegate
{
  return (NFSecureTransactionServicesHandoverSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NFTNEPTagDeviceDelegate)tagDeviceDelegate
{
  return self->_tagDeviceDelegate;
}

- (void)setTagDeviceDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_tagDeviceDelegate, a3);
}

- (NFTNEPReaderDelegate)tagReaderDelegate
{
  return self->_tagReaderDelegate;
}

- (void)setTagReaderDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_tagReaderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagReaderDelegate, 0);
  objc_storeStrong((id *)&self->_tagDeviceDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
