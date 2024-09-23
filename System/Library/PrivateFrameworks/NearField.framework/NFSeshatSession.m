@implementation NFSeshatSession

- ($85CD2974BE96D4886BB301820D1C36C2)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession allocateSlot:authorizingUser:authorizingUserToken:outToken:outWriteCount:trackingError:](self, "allocateSlot:authorizingUser:authorizingUserToken:outToken:outWriteCount:trackingError:", a3, a4, a5, a6, a7, 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)allocateSlot:(unsigned __int8)a3 authorizingUser:(unsigned __int8)a4 authorizingUserToken:(id)a5 outToken:(id *)a6 outWriteCount:(unsigned int *)a7 trackingError:(id *)a8
{
  uint64_t v10;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  $85CD2974BE96D4886BB301820D1C36C2 v17;
  unsigned int v19;
  _QWORD v21[9];
  _QWORD v22[8];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  os_activity_scope_state_s state;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;

  v19 = a4;
  v10 = a3;
  v13 = a5;
  v14 = _os_activity_create(&dword_19B5EB000, "allocateSlot:authorizingUser:authorizingUserToken:outToken:outWriteCount:trackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  v34 = 0;
  v35 = &v34;
  v36 = 0x2810000000;
  v37 = &unk_19B697FFF;
  v38 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__13;
  v32 = __Block_byref_object_dispose__13;
  v33 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__13;
  v27 = __Block_byref_object_dispose__13;
  v28 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __106__NFSeshatSession_allocateSlot_authorizingUser_authorizingUserToken_outToken_outWriteCount_trackingError___block_invoke;
  v22[3] = &unk_1E3B53240;
  v22[4] = self;
  v22[5] = &v34;
  v22[6] = &v23;
  v22[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __106__NFSeshatSession_allocateSlot_authorizingUser_authorizingUserToken_outToken_outWriteCount_trackingError___block_invoke_21;
  v21[3] = &unk_1E3B53268;
  v21[4] = &state;
  v21[5] = &v34;
  v21[6] = &v23;
  v21[7] = a7;
  v21[8] = a2;
  objc_msgSend(v16, "allocateSlot:authorizingUser:authorizingUserToken:completion:", v10, v19, v13, v21);

  if (a8)
    *a8 = objc_retainAutorelease((id)v24[5]);
  *a6 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v17 = ($85CD2974BE96D4886BB301820D1C36C2)v35[4];
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v34, 8);
  return v17;
}

void __106__NFSeshatSession_allocateSlot_authorizingUser_authorizingUserToken_outToken_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 46, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 46;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B69108;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 48);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __106__NFSeshatSession_allocateSlot_authorizingUser_authorizingUserToken_outToken_outWriteCount_trackingError___block_invoke_21(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  **(_DWORD **)(a1 + 56) = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "code");
    v25[0] = *MEMORY[0x1E0CB2D50];
    v15 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v11, "code") > 70)
      v16 = 71;
    else
      v16 = objc_msgSend(v11, "code");
    objc_msgSend(v15, "stringWithUTF8String:", NFResultCodeString_2[v16]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CB3388];
    v26[0] = v17;
    v26[1] = v11;
    v25[1] = v18;
    v25[2] = CFSTR("Line");
    v26[2] = &unk_1E3B69120;
    v25[3] = CFSTR("Method");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 64)));
    v26[3] = v19;
    v25[4] = *MEMORY[0x1E0CB2938];
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 64)), 57);
    v26[4] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, v14, v21);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession derive:userHash:outData:outWriteCount:trackingError:](self, "derive:userHash:outData:outWriteCount:trackingError:", a3, a4, a5, a6, 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)derive:(unsigned __int8)a3 userHash:(id)a4 outData:(id *)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7
{
  uint64_t v9;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  $85CD2974BE96D4886BB301820D1C36C2 v16;
  _QWORD v19[9];
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  os_activity_scope_state_s state;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;

  v9 = a3;
  v12 = a4;
  v13 = _os_activity_create(&dword_19B5EB000, "derive:userHash:outData:outWriteCount:trackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v32 = 0;
  v33 = &v32;
  v34 = 0x2810000000;
  v35 = &unk_19B697FFF;
  v36 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__13;
  v30 = __Block_byref_object_dispose__13;
  v31 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  v26 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __71__NFSeshatSession_derive_userHash_outData_outWriteCount_trackingError___block_invoke;
  v20[3] = &unk_1E3B53240;
  v20[4] = self;
  v20[5] = &v32;
  v20[6] = &v21;
  v20[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __71__NFSeshatSession_derive_userHash_outData_outWriteCount_trackingError___block_invoke_26;
  v19[3] = &unk_1E3B53268;
  v19[4] = &state;
  v19[5] = &v32;
  v19[6] = &v21;
  v19[7] = a6;
  v19[8] = a2;
  objc_msgSend(v15, "derive:userHash:completion:", v9, v12, v19);

  if (a7)
    *a7 = objc_retainAutorelease((id)v22[5]);
  *a5 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v16 = ($85CD2974BE96D4886BB301820D1C36C2)v33[4];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v32, 8);
  return v16;
}

void __71__NFSeshatSession_derive_userHash_outData_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 95, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 95;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B69138;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 97);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __71__NFSeshatSession_derive_userHash_outData_outWriteCount_trackingError___block_invoke_26(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  _QWORD v26[6];

  v26[5] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  **(_DWORD **)(a1 + 56) = a4;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "code");
    v25[0] = *MEMORY[0x1E0CB2D50];
    v15 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v11, "code") > 70)
      v16 = 71;
    else
      v16 = objc_msgSend(v11, "code");
    objc_msgSend(v15, "stringWithUTF8String:", NFResultCodeString_2[v16]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x1E0CB3388];
    v26[0] = v17;
    v26[1] = v11;
    v25[1] = v18;
    v25[2] = CFSTR("Line");
    v26[2] = &unk_1E3B69150;
    v25[3] = CFSTR("Method");
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 64)));
    v26[3] = v19;
    v25[4] = *MEMORY[0x1E0CB2938];
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 64)), 106);
    v26[4] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, v14, v21);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession resetCounter:userToken:outWriteCount:trackingError:](self, "resetCounter:userToken:outWriteCount:trackingError:", a3, a4, a5, 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)resetCounter:(unsigned __int8)a3 userToken:(id)a4 outWriteCount:(unsigned int *)a5 trackingError:(id *)a6
{
  uint64_t v8;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  $85CD2974BE96D4886BB301820D1C36C2 v15;
  _QWORD v17[8];
  _QWORD v18[8];
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  v8 = a3;
  v11 = a4;
  v12 = _os_activity_create(&dword_19B5EB000, "resetCounter:userToken:outWriteCount:trackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  v24 = 0;
  v25 = &v24;
  v26 = 0x2810000000;
  v27 = &unk_19B697FFF;
  v28 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__13;
  v22 = __Block_byref_object_dispose__13;
  v23 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __70__NFSeshatSession_resetCounter_userToken_outWriteCount_trackingError___block_invoke;
  v18[3] = &unk_1E3B53240;
  v18[4] = self;
  v18[5] = &v24;
  v18[6] = &state;
  v18[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __70__NFSeshatSession_resetCounter_userToken_outWriteCount_trackingError___block_invoke_30;
  v17[3] = &unk_1E3B53290;
  v17[4] = &v24;
  v17[5] = &state;
  v17[6] = a5;
  v17[7] = a2;
  objc_msgSend(v14, "resetCounter:userToken:completion:", v8, v11, v17);

  if (a6)
    *a6 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v15 = ($85CD2974BE96D4886BB301820D1C36C2)v25[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __70__NFSeshatSession_resetCounter_userToken_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 141, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 141;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B69168;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 143);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __70__NFSeshatSession_resetCounter_userToken_outWriteCount_trackingError___block_invoke_30(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  **(_DWORD **)(a1 + 48) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = a2;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "code");
    v21[0] = *MEMORY[0x1E0CB2D50];
    v11 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v7, "code") > 70)
      v12 = 71;
    else
      v12 = objc_msgSend(v7, "code");
    objc_msgSend(v11, "stringWithUTF8String:", NFResultCodeString_2[v12]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB3388];
    v22[0] = v13;
    v22[1] = v7;
    v21[1] = v14;
    v21[2] = CFSTR("Line");
    v22[2] = &unk_1E3B69180;
    v21[3] = CFSTR("Method");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v22[3] = v15;
    v21[4] = *MEMORY[0x1E0CB2938];
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 151);
    v22[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, v10, v17);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession authorizeUpdate:slotIndex:userToken:outWriteCount:trackingError:](self, "authorizeUpdate:slotIndex:userToken:outWriteCount:trackingError:", a3, a4, a5, a6, 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)authorizeUpdate:(BOOL)a3 slotIndex:(unsigned __int8)a4 userToken:(id)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7
{
  uint64_t v9;
  _BOOL8 v10;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  $85CD2974BE96D4886BB301820D1C36C2 v17;
  _QWORD v19[8];
  _QWORD v20[8];
  os_activity_scope_state_s state;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v9 = a4;
  v10 = a3;
  v13 = a5;
  v14 = _os_activity_create(&dword_19B5EB000, "authorizeUpdate:slotIndex:userToken:outWriteCount:trackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v14, &state);
  os_activity_scope_leave(&state);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2810000000;
  v29 = &unk_19B697FFF;
  v30 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__13;
  v24 = __Block_byref_object_dispose__13;
  v25 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__NFSeshatSession_authorizeUpdate_slotIndex_userToken_outWriteCount_trackingError___block_invoke;
  v20[3] = &unk_1E3B53240;
  v20[4] = self;
  v20[5] = &v26;
  v20[6] = &state;
  v20[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __83__NFSeshatSession_authorizeUpdate_slotIndex_userToken_outWriteCount_trackingError___block_invoke_35;
  v19[3] = &unk_1E3B53290;
  v19[4] = &v26;
  v19[5] = &state;
  v19[6] = a6;
  v19[7] = a2;
  objc_msgSend(v16, "authorizeUpdate:slotIndex:userToken:completion:", v10, v9, v13, v19);

  if (a7)
    *a7 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v17 = ($85CD2974BE96D4886BB301820D1C36C2)v27[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __83__NFSeshatSession_authorizeUpdate_slotIndex_userToken_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 187, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 187;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B69198;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 189);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __83__NFSeshatSession_authorizeUpdate_slotIndex_userToken_outWriteCount_trackingError___block_invoke_35(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  **(_DWORD **)(a1 + 48) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = a2;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "code");
    v21[0] = *MEMORY[0x1E0CB2D50];
    v11 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v7, "code") > 70)
      v12 = 71;
    else
      v12 = objc_msgSend(v7, "code");
    objc_msgSend(v11, "stringWithUTF8String:", NFResultCodeString_2[v12]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB3388];
    v22[0] = v13;
    v22[1] = v7;
    v21[1] = v14;
    v21[2] = CFSTR("Line");
    v22[2] = &unk_1E3B691B0;
    v21[3] = CFSTR("Method");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v22[3] = v15;
    v21[4] = *MEMORY[0x1E0CB2938];
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 197);
    v22[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, v10, v17);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession deleteSlot:outWriteCount:trackingError:](self, "deleteSlot:outWriteCount:trackingError:", a3, a4, 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)deleteSlot:(unsigned __int8)a3 outWriteCount:(unsigned int *)a4 trackingError:(id *)a5
{
  uint64_t v7;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  $85CD2974BE96D4886BB301820D1C36C2 v13;
  _QWORD v15[8];
  _QWORD v16[8];
  os_activity_scope_state_s state;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;

  v7 = a3;
  v10 = _os_activity_create(&dword_19B5EB000, "deleteSlot:outWriteCount:trackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  v22 = 0;
  v23 = &v22;
  v24 = 0x2810000000;
  v25 = &unk_19B697FFF;
  v26 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__13;
  v20 = __Block_byref_object_dispose__13;
  v21 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__NFSeshatSession_deleteSlot_outWriteCount_trackingError___block_invoke;
  v16[3] = &unk_1E3B53240;
  v16[4] = self;
  v16[5] = &v22;
  v16[6] = &state;
  v16[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __58__NFSeshatSession_deleteSlot_outWriteCount_trackingError___block_invoke_39;
  v15[3] = &unk_1E3B53290;
  v15[4] = &v22;
  v15[5] = &state;
  v15[6] = a4;
  v15[7] = a2;
  objc_msgSend(v12, "deleteSlot:completion:", v7, v15);

  if (a5)
    *a5 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v13 = ($85CD2974BE96D4886BB301820D1C36C2)v23[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v22, 8);
  return v13;
}

void __58__NFSeshatSession_deleteSlot_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 229, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 229;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B691C8;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 231);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __58__NFSeshatSession_deleteSlot_outWriteCount_trackingError___block_invoke_39(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  **(_DWORD **)(a1 + 48) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = a2;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "code");
    v21[0] = *MEMORY[0x1E0CB2D50];
    v11 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v7, "code") > 70)
      v12 = 71;
    else
      v12 = objc_msgSend(v7, "code");
    objc_msgSend(v11, "stringWithUTF8String:", NFResultCodeString_2[v12]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB3388];
    v22[0] = v13;
    v22[1] = v7;
    v21[1] = v14;
    v21[2] = CFSTR("Line");
    v22[2] = &unk_1E3B691E0;
    v21[3] = CFSTR("Method");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v22[3] = v15;
    v21[4] = *MEMORY[0x1E0CB2938];
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 239);
    v22[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, v10, v17);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession getData:updateKUD:outWriteLimit:outWriteCount:trackingError:](self, "getData:updateKUD:outWriteLimit:outWriteCount:trackingError:", a3, a4, a5, a6, 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)getData:(id *)a3 updateKUD:(char *)a4 outWriteLimit:(unsigned int *)a5 outWriteCount:(unsigned int *)a6 trackingError:(id *)a7
{
  NSObject *v13;
  uint64_t v14;
  void *v15;
  $85CD2974BE96D4886BB301820D1C36C2 v16;
  _QWORD v19[11];
  _QWORD v20[8];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  os_activity_scope_state_s state;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;

  v13 = _os_activity_create(&dword_19B5EB000, "getData:updateKUD:outWriteLimit:outWriteCount:trackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  v32 = 0;
  v33 = &v32;
  v34 = 0x2810000000;
  v35 = &unk_19B697FFF;
  v36 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__13;
  v30 = __Block_byref_object_dispose__13;
  v31 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__13;
  v25 = __Block_byref_object_dispose__13;
  v26 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __79__NFSeshatSession_getData_updateKUD_outWriteLimit_outWriteCount_trackingError___block_invoke;
  v20[3] = &unk_1E3B53240;
  v20[4] = self;
  v20[5] = &v32;
  v20[6] = &v21;
  v20[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __79__NFSeshatSession_getData_updateKUD_outWriteLimit_outWriteCount_trackingError___block_invoke_43;
  v19[3] = &unk_1E3B532B8;
  v19[8] = a5;
  v19[9] = a6;
  v19[4] = &state;
  v19[5] = &v32;
  v19[6] = &v21;
  v19[7] = a4;
  v19[10] = a2;
  objc_msgSend(v15, "getDataWithCompletion:", v19);

  if (a7)
    *a7 = objc_retainAutorelease((id)v22[5]);
  *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v16 = ($85CD2974BE96D4886BB301820D1C36C2)v33[4];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v32, 8);
  return v16;
}

void __79__NFSeshatSession_getData_updateKUD_outWriteLimit_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 276, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 276;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B691F8;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 278);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __79__NFSeshatSession_getData_updateKUD_outWriteLimit_outWriteCount_trackingError___block_invoke_43(uint64_t a1, uint64_t a2, void *a3, char a4, int a5, int a6, void *a7)
{
  id v14;
  id v15;
  _DWORD *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  **(_BYTE **)(a1 + 56) = a4;
  v16 = *(_DWORD **)(a1 + 72);
  **(_DWORD **)(a1 + 64) = a5;
  *v16 = a6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  if (v15)
  {
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v15, "code");
    v30[0] = *MEMORY[0x1E0CB2D50];
    v20 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v15, "code") > 70)
      v21 = 71;
    else
      v21 = objc_msgSend(v15, "code");
    objc_msgSend(v20, "stringWithUTF8String:", NFResultCodeString_2[v21]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0CB3388];
    v31[0] = v22;
    v31[1] = v15;
    v30[1] = v23;
    v30[2] = CFSTR("Line");
    v31[2] = &unk_1E3B69210;
    v30[3] = CFSTR("Method");
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 80)));
    v31[3] = v24;
    v30[4] = *MEMORY[0x1E0CB2938];
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 80)), 289);
    v31[4] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, v19, v26);
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)getHash:(id *)a3
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession getHash:trackingError:](self, "getHash:trackingError:", a3, 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)getHash:(id *)a3 trackingError:(id *)a4
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  $85CD2974BE96D4886BB301820D1C36C2 v11;
  _QWORD v13[8];
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  os_activity_scope_state_s state;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;

  v8 = _os_activity_create(&dword_19B5EB000, "getHash:trackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2810000000;
  v29 = &unk_19B697FFF;
  v30 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__13;
  v24 = __Block_byref_object_dispose__13;
  v25 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __41__NFSeshatSession_getHash_trackingError___block_invoke;
  v14[3] = &unk_1E3B53240;
  v14[4] = self;
  v14[5] = &v26;
  v14[6] = &v15;
  v14[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __41__NFSeshatSession_getHash_trackingError___block_invoke_48;
  v13[3] = &unk_1E3B532E0;
  v13[4] = &state;
  v13[5] = &v26;
  v13[6] = &v15;
  v13[7] = a2;
  objc_msgSend(v10, "getHashWithCompletion:", v13);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v11 = ($85CD2974BE96D4886BB301820D1C36C2)v27[4];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&state, 8);
  _Block_object_dispose(&v26, 8);
  return v11;
}

void __41__NFSeshatSession_getHash_trackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 320, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 320;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B69228;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 322);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __41__NFSeshatSession_getHash_trackingError___block_invoke_48(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  _QWORD v24[6];

  v24[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = a2;
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "code");
    v23[0] = *MEMORY[0x1E0CB2D50];
    v13 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v9, "code") > 70)
      v14 = 71;
    else
      v14 = objc_msgSend(v9, "code");
    objc_msgSend(v13, "stringWithUTF8String:", NFResultCodeString_2[v14]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CB3388];
    v24[0] = v15;
    v24[1] = v9;
    v23[1] = v16;
    v23[2] = CFSTR("Line");
    v24[2] = &unk_1E3B69240;
    v23[3] = CFSTR("Method");
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v24[3] = v17;
    v23[4] = *MEMORY[0x1E0CB2938];
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 330);
    v24[4] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, v12, v19);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession upgradeKey:inputData:outWriteCount:trackingError:](self, "upgradeKey:inputData:outWriteCount:trackingError:", a3, a4, a5, 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)upgradeKey:(unsigned __int8)a3 inputData:(id)a4 outWriteCount:(unsigned int *)a5 trackingError:(id *)a6
{
  uint64_t v8;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  $85CD2974BE96D4886BB301820D1C36C2 v15;
  _QWORD v17[8];
  _QWORD v18[8];
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;

  v8 = a3;
  v11 = a4;
  v12 = _os_activity_create(&dword_19B5EB000, "upgradeKey:inputData:outWriteCount:trackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  v24 = 0;
  v25 = &v24;
  v26 = 0x2810000000;
  v27 = &unk_19B697FFF;
  v28 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__13;
  v22 = __Block_byref_object_dispose__13;
  v23 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __68__NFSeshatSession_upgradeKey_inputData_outWriteCount_trackingError___block_invoke;
  v18[3] = &unk_1E3B53240;
  v18[4] = self;
  v18[5] = &v24;
  v18[6] = &state;
  v18[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __68__NFSeshatSession_upgradeKey_inputData_outWriteCount_trackingError___block_invoke_53;
  v17[3] = &unk_1E3B53290;
  v17[4] = &v24;
  v17[5] = &state;
  v17[6] = a5;
  v17[7] = a2;
  objc_msgSend(v14, "upgradeKey:inputData:completion:", v8, v11, v17);

  if (a6)
    *a6 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v15 = ($85CD2974BE96D4886BB301820D1C36C2)v25[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __68__NFSeshatSession_upgradeKey_inputData_outWriteCount_trackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 364, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 364;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B69258;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 366);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __68__NFSeshatSession_upgradeKey_inputData_outWriteCount_trackingError___block_invoke_53(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  **(_DWORD **)(a1 + 48) = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = a2;
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "code");
    v21[0] = *MEMORY[0x1E0CB2D50];
    v11 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v7, "code") > 70)
      v12 = 71;
    else
      v12 = objc_msgSend(v7, "code");
    objc_msgSend(v11, "stringWithUTF8String:", NFResultCodeString_2[v12]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0CB3388];
    v22[0] = v13;
    v22[1] = v7;
    v21[1] = v14;
    v21[2] = CFSTR("Line");
    v22[2] = &unk_1E3B69270;
    v21[3] = CFSTR("Method");
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v22[3] = v15;
    v21[4] = *MEMORY[0x1E0CB2938];
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 374);
    v22[4] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v8, "initWithDomain:code:userInfo:", v9, v10, v17);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

- ($85CD2974BE96D4886BB301820D1C36C2)obliterate
{
  return ($85CD2974BE96D4886BB301820D1C36C2)-[NFSeshatSession obliterateWithTrackingError:](self, "obliterateWithTrackingError:", 0);
}

- ($85CD2974BE96D4886BB301820D1C36C2)obliterateWithTrackingError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  $85CD2974BE96D4886BB301820D1C36C2 v9;
  _QWORD v11[7];
  _QWORD v12[8];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v6 = _os_activity_create(&dword_19B5EB000, "obliterateWithTrackingError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2810000000;
  v21 = &unk_19B697FFF;
  v22 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__13;
  v16 = __Block_byref_object_dispose__13;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__NFSeshatSession_obliterateWithTrackingError___block_invoke;
  v12[3] = &unk_1E3B53240;
  v12[4] = self;
  v12[5] = &v18;
  v12[6] = &state;
  v12[7] = a2;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __47__NFSeshatSession_obliterateWithTrackingError___block_invoke_57;
  v11[3] = &unk_1E3B53308;
  v11[4] = &v18;
  v11[5] = &state;
  v11[6] = a2;
  objc_msgSend(v8, "obliterateWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = ($85CD2974BE96D4886BB301820D1C36C2)v19[4];
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __47__NFSeshatSession_obliterateWithTrackingError___block_invoke(uint64_t a1, void *a2)
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
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *ClassName;
  const char *Name;
  _QWORD v27[5];
  _QWORD v28[5];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
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
    Name = sel_getName(*(SEL *)(a1 + 56));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 402, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 402;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 7;
  v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0CB3388];
  v28[0] = v17;
  v28[1] = v3;
  v27[1] = v18;
  v27[2] = CFSTR("Line");
  v28[2] = &unk_1E3B69288;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 404);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __47__NFSeshatSession_obliterateWithTrackingError___block_invoke_57(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = a2;
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "code");
    v19[0] = *MEMORY[0x1E0CB2D50];
    v9 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v5, "code") > 70)
      v10 = 71;
    else
      v10 = objc_msgSend(v5, "code");
    objc_msgSend(v9, "stringWithUTF8String:", NFResultCodeString_2[v10]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x1E0CB3388];
    v20[0] = v11;
    v20[1] = v5;
    v19[1] = v12;
    v19[2] = CFSTR("Line");
    v20[2] = &unk_1E3B692A0;
    v19[3] = CFSTR("Method");
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v20[3] = v13;
    v19[4] = *MEMORY[0x1E0CB2938];
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 411);
    v20[4] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, v8, v15);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
}

+ (BOOL)isTransientError:(id)a3
{
  char v3;
  _BOOL4 v4;
  int v5;

  v3 = LOBYTE(a3.var0) - 7;
  if (a3.var0 - 7 < 0x12 && ((0x20249u >> v3) & 1) != 0)
    return (0x1FDB7u >> v3) & 1;
  LOBYTE(v4) = 0;
  if ((int)a3.var1 <= 27263)
  {
    if (a3.var1 == 26368)
      return v4;
    v5 = 27010;
  }
  else
  {
    if (a3.var1 - 27264 <= 4 && ((1 << (LOBYTE(a3.var1) + 0x80)) & 0x19) != 0)
      return v4;
    v5 = 27392;
  }
  if (a3.var1 != v5)
    LOBYTE(v4) = 1;
  return v4;
}

+ (unsigned)smallCrumbsFromError:(id)a3
{
  id v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v3 = a3;
  v4 = objc_msgSend(v3, "code") << 26;
  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0CB3388];
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0CB3388]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    do
    {
      objc_msgSend(v7, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
      {
        v4 = v4 & 0xFFFFFC0F | (16 * (objc_msgSend(v7, "code") & 0x3F));
        objc_msgSend(v7, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Line"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          v4 = v4 & 0xFC0003FF | ((unsigned __int16)objc_msgSend(v11, "shortValue") << 10);

      }
      objc_msgSend(v7, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", v6);
      v13 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v13;
    }
    while (v13);
  }

  return v4;
}

+ (unint64_t)largeCrumbsFromError:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const void **v13;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  void *v22;
  uint64_t v23;
  void (*v24)(uint64_t, const char *, ...);
  objc_class *v25;
  _BOOL4 v26;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void (*v38)(uint64_t, const char *, ...);
  objc_class *v39;
  _BOOL4 v40;
  uint64_t v41;
  NSObject *v42;
  objc_class *v43;
  int v44;
  const char *v45;
  const char *v46;
  void *v47;
  void *v48;
  unint64_t v49;
  void *v50;
  void *v51;
  const char *ClassName;
  const char *v54;
  const char *v55;
  const char *Name;
  const char *v57;
  const char *v58;
  uint8_t buf[4];
  int v60;
  __int16 v61;
  const char *v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v7 = v5;
  v8 = v7;
  if (v7)
  {
    v9 = *MEMORY[0x1E0CB3388];
    v10 = v7;
    do
    {
      objc_msgSend(v6, "insertObject:atIndex:", v10, 0);
      objc_msgSend(v10, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v9);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }
    while (v12);
  }
  v13 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v15 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(a1);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(a1);
    Name = sel_getName(a2);
    v18 = 45;
    if (isMetaClass)
      v18 = 43;
    v15(3, "%c[%{public}s %{public}s]:%i ALL Errors = %{public}@", v18, ClassName, Name, 565, v6);
  }
  dispatch_get_specific(*v13);
  NFSharedLogGetLogger();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = object_getClass(a1);
    if (class_isMetaClass(v20))
      v21 = 43;
    else
      v21 = 45;
    *(_DWORD *)buf = 67110146;
    v60 = v21;
    v61 = 2082;
    v62 = object_getClassName(a1);
    v63 = 2082;
    v64 = sel_getName(a2);
    v65 = 1024;
    v66 = 565;
    v67 = 2114;
    v68 = v6;
    _os_log_impl(&dword_19B5EB000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i ALL Errors = %{public}@", buf, 0x2Cu);
  }

  if ((unint64_t)objc_msgSend(v6, "count") < 2)
  {
    v22 = 0;
    v33 = 0;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_get_specific(*v13);
    v23 = NFLogGetLogger();
    if (v23)
    {
      v24 = (void (*)(uint64_t, const char *, ...))v23;
      v25 = object_getClass(a1);
      v26 = class_isMetaClass(v25);
      v54 = object_getClassName(a1);
      v57 = sel_getName(a2);
      v27 = 45;
      if (v26)
        v27 = 43;
      v24(3, "%c[%{public}s %{public}s]:%i Error 0 = %{public}@", v27, v54, v57, 569, v22);
    }
    dispatch_get_specific(*v13);
    NFSharedLogGetLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(a1);
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(a1);
      v32 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v60 = v30;
      v61 = 2082;
      v62 = v31;
      v63 = 2082;
      v64 = v32;
      v65 = 1024;
      v66 = 569;
      v67 = 2114;
      v68 = v22;
      _os_log_impl(&dword_19B5EB000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error 0 = %{public}@", buf, 0x2Cu);
    }

    v33 = 16 * (objc_msgSend(v22, "code") & 0x3F);
    objc_msgSend(v22, "userInfo");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("Line"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
      v33 = v33 & 0xFFFFFFFFFF8003FFLL | ((objc_msgSend(v35, "shortValue") & 0x1FFF) << 10);

  }
  if ((unint64_t)objc_msgSend(v6, "count") < 3)
  {
    v36 = v22;
  }
  else
  {
    objc_msgSend(v6, "objectAtIndex:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    dispatch_get_specific(*v13);
    v37 = NFLogGetLogger();
    if (v37)
    {
      v38 = (void (*)(uint64_t, const char *, ...))v37;
      v39 = object_getClass(a1);
      v40 = class_isMetaClass(v39);
      v55 = object_getClassName(a1);
      v58 = sel_getName(a2);
      v41 = 45;
      if (v40)
        v41 = 43;
      v38(3, "%c[%{public}s %{public}s]:%i Error 1 = %{public}@", v41, v55, v58, 581, v36);
    }
    dispatch_get_specific(*v13);
    NFSharedLogGetLogger();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = object_getClass(a1);
      if (class_isMetaClass(v43))
        v44 = 43;
      else
        v44 = 45;
      v45 = object_getClassName(a1);
      v46 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      v60 = v44;
      v61 = 2082;
      v62 = v45;
      v63 = 2082;
      v64 = v46;
      v65 = 1024;
      v66 = 581;
      v67 = 2114;
      v68 = v36;
      _os_log_impl(&dword_19B5EB000, v42, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error 1 = %{public}@", buf, 0x2Cu);
    }

    v33 = v33 & 0xFFFFFFFFC0FFFFFFLL | ((objc_msgSend(v36, "code") & 0x3F) << 24);
    objc_msgSend(v36, "userInfo");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("Line"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
      v33 = v33 & 0xFFFFF8003FFFFFFFLL | ((objc_msgSend(v48, "shortValue") & 0x1FFF) << 30);

  }
  v49 = v33 & 0xFFFC0FFFFFFFFFFFLL | ((objc_msgSend(v8, "code") & 0x3F) << 44);
  objc_msgSend(v8, "userInfo");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "objectForKeyedSubscript:", CFSTR("Line"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
    v49 |= (objc_msgSend(v51, "shortValue") & 0x1FFF) << 50;

  return v49;
}

@end
