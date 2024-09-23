@implementation NFLPEMConfigSession

- (BOOL)configureHardwareForLPEMWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  BOOL v7;
  _QWORD v9[6];
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
  v14 = __Block_byref_object_copy__16;
  v15 = __Block_byref_object_dispose__16;
  v16 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__NFLPEMConfigSession_configureHardwareForLPEMWithError___block_invoke;
  v10[3] = &unk_1E3B51998;
  v10[5] = &v11;
  v10[6] = a2;
  v10[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __57__NFLPEMConfigSession_configureHardwareForLPEMWithError___block_invoke_21;
  v9[3] = &unk_1E3B53790;
  v9[4] = &v11;
  v9[5] = a2;
  objc_msgSend(v6, "configureHardwareForLPEMWithCompletion:", v9);

  if (a3)
    *a3 = objc_retainAutorelease((id)v12[5]);
  v7 = v12[5] == 0;
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __57__NFLPEMConfigSession_configureHardwareForLPEMWithError___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 25, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 25;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

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
  v28[2] = &unk_1E3B692B8;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 26);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __57__NFLPEMConfigSession_configureHardwareForLPEMWithError___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "code");
    v17[0] = *MEMORY[0x1E0CB2D50];
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v3, "code") > 70)
      v8 = 71;
    else
      v8 = objc_msgSend(v3, "code");
    objc_msgSend(v7, "stringWithUTF8String:", NFResultCodeString_3[v8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CB3388];
    v18[0] = v9;
    v18[1] = v3;
    v17[1] = v10;
    v17[2] = CFSTR("Line");
    v18[2] = &unk_1E3B692D0;
    v17[3] = CFSTR("Method");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
    v18[3] = v11;
    v17[4] = *MEMORY[0x1E0CB2938];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 31);
    v18[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, v6, v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

- (BOOL)disableLPEMFeature:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7;
  void *v8;
  BOOL v9;
  _QWORD v11[6];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__16;
  v17 = __Block_byref_object_dispose__16;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__NFLPEMConfigSession_disableLPEMFeature_error___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __48__NFLPEMConfigSession_disableLPEMFeature_error___block_invoke_24;
  v11[3] = &unk_1E3B53790;
  v11[4] = &v13;
  v11[5] = a2;
  objc_msgSend(v8, "disableLPEMFeature:completion:", a3, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);
  v9 = v14[5] == 0;
  _Block_object_dispose(&v13, 8);

  return v9;
}

void __48__NFLPEMConfigSession_disableLPEMFeature_error___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 52, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 52;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

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
  v28[2] = &unk_1E3B692E8;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 53);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __48__NFLPEMConfigSession_disableLPEMFeature_error___block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "code");
    v17[0] = *MEMORY[0x1E0CB2D50];
    v7 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v3, "code") > 70)
      v8 = 71;
    else
      v8 = objc_msgSend(v3, "code");
    objc_msgSend(v7, "stringWithUTF8String:", NFResultCodeString_3[v8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CB3388];
    v18[0] = v9;
    v18[1] = v3;
    v17[1] = v10;
    v17[2] = CFSTR("Line");
    v18[2] = &unk_1E3B69300;
    v17[3] = CFSTR("Method");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 40)));
    v18[3] = v11;
    v17[4] = *MEMORY[0x1E0CB2938];
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 40)), 58);
    v18[4] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, v6, v13);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

- (BOOL)enableLPEMFeature:(unint64_t)a3 error:(id *)a4
{
  uint64_t v8;
  void *v9;
  BOOL v10;
  _QWORD v12[7];
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__NFLPEMConfigSession_enableLPEMFeature_error___block_invoke;
  v13[3] = &unk_1E3B51998;
  v13[5] = &v14;
  v13[6] = a2;
  v13[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __47__NFLPEMConfigSession_enableLPEMFeature_error___block_invoke_27;
  v12[3] = &unk_1E3B51998;
  v12[5] = &v14;
  v12[6] = a2;
  v12[4] = self;
  objc_msgSend(v9, "enableLPEMFeature:completion:", a3, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v10 = v15[5] == 0;
  _Block_object_dispose(&v14, 8);

  return v10;
}

void __47__NFLPEMConfigSession_enableLPEMFeature_error___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 79, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 79;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

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
  v28[2] = &unk_1E3B69318;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 80);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __47__NFLPEMConfigSession_enableLPEMFeature_error___block_invoke_27(uint64_t a1, void *a2)
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
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *ClassName;
  const char *Name;
  _QWORD v30[5];
  _QWORD v31[5];
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i %@", v9, ClassName, Name, 85, v3);
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
      v14 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v33 = v12;
      v34 = 2082;
      v35 = v13;
      v36 = 2082;
      v37 = v14;
      v38 = 1024;
      v39 = 85;
      v40 = 2112;
      v41 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

    v15 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v3, "code");
    v30[0] = *MEMORY[0x1E0CB2D50];
    v18 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v3, "code") > 70)
      v19 = 71;
    else
      v19 = objc_msgSend(v3, "code");
    objc_msgSend(v18, "stringWithUTF8String:", NFResultCodeString_3[v19]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0CB3388];
    v31[0] = v20;
    v31[1] = v3;
    v30[1] = v21;
    v30[2] = CFSTR("Line");
    v31[2] = &unk_1E3B69330;
    v30[3] = CFSTR("Method");
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
    v31[3] = v22;
    v30[4] = *MEMORY[0x1E0CB2938];
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 86);
    v31[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, v17, v24);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
}

- (unint64_t)getLPEMFeaturesWithError:(id *)a3
{
  uint64_t v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[8];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__16;
  v20 = __Block_byref_object_dispose__16;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __48__NFLPEMConfigSession_getLPEMFeaturesWithError___block_invoke;
  v11[3] = &unk_1E3B51998;
  v11[5] = &v16;
  v11[6] = a2;
  v11[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __48__NFLPEMConfigSession_getLPEMFeaturesWithError___block_invoke_31;
  v10[3] = &unk_1E3B537B8;
  v10[4] = self;
  v10[5] = &v16;
  v10[6] = &v12;
  v10[7] = a2;
  objc_msgSend(v7, "getLPEMFeaturesWithCompletion:", v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v17[5]);
  v8 = v13[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v8;
}

void __48__NFLPEMConfigSession_getLPEMFeaturesWithError___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 108, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 108;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

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
  v28[2] = &unk_1E3B69348;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 109);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __48__NFLPEMConfigSession_getLPEMFeaturesWithError___block_invoke_31(uint64_t a1, void *a2, uint64_t a3)
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
  const char *v15;
  const char *v16;
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
  const char *ClassName;
  const char *Name;
  _QWORD v32[5];
  _QWORD v33[5];
  uint8_t buf[4];
  int v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (v5)
  {
    v6 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v8 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v8(3, "%c[%{public}s %{public}s]:%i %@", v11, ClassName, Name, 114, v5);
    }
    dispatch_get_specific(*v6);
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
      v16 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v35 = v14;
      v36 = 2082;
      v37 = v15;
      v38 = 2082;
      v39 = v16;
      v40 = 1024;
      v41 = 114;
      v42 = 2112;
      v43 = v5;
      _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v5, "code");
    v32[0] = *MEMORY[0x1E0CB2D50];
    v20 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v5, "code") > 70)
      v21 = 71;
    else
      v21 = objc_msgSend(v5, "code");
    objc_msgSend(v20, "stringWithUTF8String:", NFResultCodeString_3[v21]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x1E0CB3388];
    v33[0] = v22;
    v33[1] = v5;
    v32[1] = v23;
    v32[2] = CFSTR("Line");
    v33[2] = &unk_1E3B69360;
    v32[3] = CFSTR("Method");
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v33[3] = v24;
    v32[4] = *MEMORY[0x1E0CB2938];
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 115);
    v33[4] = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v17, "initWithDomain:code:userInfo:", v18, v19, v26);
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
  }

}

- (id)getLPEMBluetoothLogWithError:(id *)a3
{
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[8];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__NFLPEMConfigSession_getLPEMBluetoothLogWithError___block_invoke;
  v11[3] = &unk_1E3B51998;
  v11[5] = &v18;
  v11[6] = a2;
  v11[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __52__NFLPEMConfigSession_getLPEMBluetoothLogWithError___block_invoke_35;
  v10[3] = &unk_1E3B52A20;
  v10[4] = self;
  v10[5] = &v18;
  v10[6] = &v12;
  v10[7] = a2;
  objc_msgSend(v7, "getLPEMBluetoothLog:withCompletion:", 0, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __52__NFLPEMConfigSession_getLPEMBluetoothLogWithError___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
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
  v28[2] = &unk_1E3B69378;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 142);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __52__NFLPEMConfigSession_getLPEMBluetoothLogWithError___block_invoke_35(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const void **v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *ClassName;
  const char *Name;
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i %@", v12, ClassName, Name, 146, v5);
    }
    dispatch_get_specific(*v7);
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
      v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v36 = v15;
      v37 = 2082;
      v38 = v16;
      v39 = 2082;
      v40 = v17;
      v41 = 1024;
      v42 = 146;
      v43 = 2112;
      v44 = v5;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "code");
    v33[0] = *MEMORY[0x1E0CB2D50];
    v21 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v5, "code") > 70)
      v22 = 71;
    else
      v22 = objc_msgSend(v5, "code");
    objc_msgSend(v21, "stringWithUTF8String:", NFResultCodeString_3[v22]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CB3388];
    v34[0] = v23;
    v34[1] = v5;
    v33[1] = v24;
    v33[2] = CFSTR("Line");
    v34[2] = &unk_1E3B69390;
    v33[3] = CFSTR("Method");
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v34[3] = v25;
    v33[4] = *MEMORY[0x1E0CB2938];
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 147);
    v34[4] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, v20, v27);
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }

}

- (id)getAndClearLPEMBluetoothLogWithError:(id *)a3
{
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[8];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__NFLPEMConfigSession_getAndClearLPEMBluetoothLogWithError___block_invoke;
  v11[3] = &unk_1E3B51998;
  v11[5] = &v18;
  v11[6] = a2;
  v11[4] = self;
  -[NFSession synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __60__NFLPEMConfigSession_getAndClearLPEMBluetoothLogWithError___block_invoke_39;
  v10[3] = &unk_1E3B52A20;
  v10[4] = self;
  v10[5] = &v18;
  v10[6] = &v12;
  v10[7] = a2;
  objc_msgSend(v7, "getLPEMBluetoothLog:withCompletion:", 1, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v19[5]);
  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(&v18, 8);
  return v8;
}

void __60__NFLPEMConfigSession_getAndClearLPEMBluetoothLogWithError___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 173, v3);
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
    v14 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67110146;
    v30 = v12;
    v31 = 2082;
    v32 = v13;
    v33 = 2082;
    v34 = v14;
    v35 = 1024;
    v36 = 173;
    v37 = 2114;
    v38 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

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
  v28[2] = &unk_1E3B693A8;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 174);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

}

void __60__NFLPEMConfigSession_getAndClearLPEMBluetoothLogWithError___block_invoke_39(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const void **v7;
  uint64_t Logger;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  int v15;
  const char *v16;
  const char *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *ClassName;
  const char *Name;
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[4];
  int v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v9 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v12 = 45;
      if (isMetaClass)
        v12 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i %@", v12, ClassName, Name, 178, v5);
    }
    dispatch_get_specific(*v7);
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
      v17 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110146;
      v36 = v15;
      v37 = 2082;
      v38 = v16;
      v39 = 2082;
      v40 = v17;
      v41 = 1024;
      v42 = 178;
      v43 = 2112;
      v44 = v5;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %@", buf, 0x2Cu);
    }

    v18 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v5, "code");
    v33[0] = *MEMORY[0x1E0CB2D50];
    v21 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v5, "code") > 70)
      v22 = 71;
    else
      v22 = objc_msgSend(v5, "code");
    objc_msgSend(v21, "stringWithUTF8String:", NFResultCodeString_3[v22]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *MEMORY[0x1E0CB3388];
    v34[0] = v23;
    v34[1] = v5;
    v33[1] = v24;
    v33[2] = CFSTR("Line");
    v34[2] = &unk_1E3B693C0;
    v33[3] = CFSTR("Method");
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v34[3] = v25;
    v33[4] = *MEMORY[0x1E0CB2938];
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 179);
    v34[4] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 5);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v18, "initWithDomain:code:userInfo:", v19, v20, v27);
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  }

}

@end
