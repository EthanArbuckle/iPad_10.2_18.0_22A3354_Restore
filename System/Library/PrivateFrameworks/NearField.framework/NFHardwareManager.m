@implementation NFHardwareManager

- (id)secureElements
{
  return -[NFHardwareManager secureElementsWithError:](self, "secureElementsWithError:", 0);
}

void __55__NFHardwareManager_secureElementWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "info");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __56__NFHardwareManager__sharedHardwareManagerWaitOnHWInit___block_invoke()
{
  NFHardwareManager *v0;
  void *v1;

  v0 = -[NFHardwareManager initWithType:]([NFHardwareManager alloc], "initWithType:", 0);
  v1 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = (uint64_t)v0;

}

void __50__NFHardwareManager_sharedHardwareManagerWithNoUI__block_invoke()
{
  NFHardwareManager *v0;
  void *v1;

  v0 = -[NFHardwareManager initWithType:]([NFHardwareManager alloc], "initWithType:", 1);
  v1 = (void *)qword_1ECFF61B8;
  qword_1ECFF61B8 = (uint64_t)v0;

}

- (id)requestAssertion:(unint64_t)a3 error:(id *)a4
{
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  _QWORD v14[7];
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

  v8 = _os_activity_create(&dword_19B5EB000, "requestAssertion:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__NFHardwareManager_requestAssertion_error___block_invoke;
  v14[3] = &unk_1E3B51998;
  v14[5] = &state;
  v14[6] = a2;
  v14[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __44__NFHardwareManager_requestAssertion_error___block_invoke_89;
  v13[3] = &unk_1E3B52A48;
  v13[4] = self;
  v13[5] = &v15;
  v13[6] = &state;
  v13[7] = a2;
  objc_msgSend(v10, "requestAssertion:completion:", a3, v13);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&state, 8);
  return v11;
}

- (void)hwStateDidChange:(unsigned int)a3
{
  NSObject *callbackQueue;
  _QWORD block[6];
  unsigned int v5;

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__NFHardwareManager_hwStateDidChange___block_invoke;
  block[3] = &unk_1E3B52A70;
  block[4] = self;
  block[5] = a2;
  v5 = a3;
  dispatch_async(callbackQueue, block);
}

- (BOOL)areFeaturesSupported:(unint64_t)a3 outError:(id *)a4
{
  NSObject *v8;
  BOOL result;
  void *v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  id v21;
  void *v22;
  void *v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  os_activity_scope_state_s state;
  _QWORD v31[4];
  _QWORD v32[4];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v8 = _os_activity_create(&dword_19B5EB000, "areFeaturesSupported:outError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  if (!a3)
  {
    if (!a4)
      return 0;
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 10, v16);
LABEL_35:

    return 0;
  }
  result = 0;
  if (a3 <= 0xFFF && (a3 & 0xFFF) != 0)
  {
    -[NFHardwareManager controllerInfo](self, "controllerInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((a3 & 2) != 0)
    {
      v12 = objc_msgSend(v10, "hasAntenna");
      if ((a3 & 4) == 0)
        goto LABEL_13;
    }
    else
    {
      v12 = 1;
      if ((a3 & 4) == 0)
        goto LABEL_13;
    }
    v17 = objc_msgSend(v11, "hasAntenna");
    if (v12)
      v12 = v17;
    else
      v12 = 0;
LABEL_13:
    if ((a3 & 0x200) != 0)
    {
      v24 = objc_msgSend(v11, "hasAntenna");
      if (v24)
        v24 = -[NFHardwareManager supportsCathay](self, "supportsCathay");
      v12 &= v24;
      if ((a3 & 8) == 0)
      {
LABEL_15:
        if ((a3 & 0x20) == 0)
          goto LABEL_19;
        goto LABEL_16;
      }
    }
    else if ((a3 & 8) == 0)
    {
      goto LABEL_15;
    }
    v25 = objc_msgSend(v11, "hasAntenna");
    if (v12)
      v12 = v25;
    else
      v12 = 0;
    if ((a3 & 0x20) == 0)
    {
LABEL_19:
      if ((a3 & 0x410) != 0)
      {
        v19 = objc_msgSend(v11, "hasAntenna");
        if (v12)
          v12 = v19;
        else
          v12 = 0;
      }
      if ((a3 & 0x800) != 0)
      {
        v26 = objc_msgSend(v11, "hasAntenna");
        if (v12)
          v12 = v26;
        else
          v12 = 0;
        if ((a3 & 0x40) == 0)
        {
LABEL_25:
          if ((a3 & 0x80) == 0)
            goto LABEL_26;
          goto LABEL_54;
        }
      }
      else if ((a3 & 0x40) == 0)
      {
        goto LABEL_25;
      }
      v27 = objc_msgSend(v11, "hasAntenna");
      if (v12)
        v12 = v27;
      else
        v12 = 0;
      if ((a3 & 0x80) == 0)
      {
LABEL_26:
        if ((a3 & 0x100) == 0)
          goto LABEL_27;
        goto LABEL_58;
      }
LABEL_54:
      v28 = objc_msgSend(v11, "hasLPEMSupport");
      if (v12)
        v12 = v28;
      else
        v12 = 0;
      if ((a3 & 0x100) == 0)
      {
LABEL_27:
        if ((a3 & 1) == 0)
        {
LABEL_31:

          result = v12 != 0;
          goto LABEL_32;
        }
LABEL_28:
        v20 = objc_msgSend(v11, "hasReaderModeSupport");
        if (v12)
          v12 = v20;
        else
          v12 = 0;
        goto LABEL_31;
      }
LABEL_58:
      v29 = objc_msgSend(v11, "hasCarKeySupport");
      if (v12)
        v12 = v29;
      else
        v12 = 0;
      if ((a3 & 1) == 0)
        goto LABEL_31;
      goto LABEL_28;
    }
LABEL_16:
    v18 = objc_msgSend(v11, "hasAntenna");
    if (v12)
      v12 = v18;
    else
      v12 = 0;
    goto LABEL_19;
  }
LABEL_32:
  if (a4 && !result)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Feature Not Supported");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v15;
    v32[1] = &unk_1E3B69060;
    v31[1] = CFSTR("Line");
    v31[2] = CFSTR("Method");
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
    v32[2] = v16;
    v31[3] = *MEMORY[0x1E0CB2938];
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2550);
    v32[3] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *a4 = (id)objc_msgSend(v21, "initWithDomain:code:userInfo:", v14, 14, v23);

    goto LABEL_35;
  }
  return result;
}

+ (id)sharedHardwareManager
{
  return (id)objc_msgSend(a1, "_sharedHardwareManagerWaitOnHWInit:", 1);
}

+ (id)_sharedHardwareManagerWaitOnHWInit:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  if (qword_1ECFF61B0 != -1)
    dispatch_once(&qword_1ECFF61B0, &__block_literal_global_1);
  v4 = (id)objc_msgSend((id)_MergedGlobals_15, "connectToXPCManager:", v3);
  return (id)_MergedGlobals_15;
}

- (id)secureElementWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NFHardwareManager *v7;
  NSDictionary *secureElementsById;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSDictionary *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  secureElementsById = v7->_secureElementsById;
  if (!secureElementsById)
  {
    -[NFHardwareManager secureElementsWithError:](v7, "secureElementsWithError:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)objc_opt_new();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __55__NFHardwareManager_secureElementWithIdentifier_error___block_invoke;
      v16[3] = &unk_1E3B52B10;
      v17 = v10;
      v11 = v10;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:", v9, v11);
      v13 = v7->_secureElementsById;
      v7->_secureElementsById = (NSDictionary *)v12;

    }
    secureElementsById = v7->_secureElementsById;
  }
  -[NSDictionary objectForKey:](secureElementsById, "objectForKey:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v7);

  return v14;
}

- (id)secureElementsWithError:(id *)a3
{
  NFHardwareManager *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  char v14;
  NSArray *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  NSArray *secureElements;
  NSArray *v23;
  id *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[7];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__6;
  v42 = __Block_byref_object_dispose__6;
  v43 = 0;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_secureElements)
  {
    v25 = a3;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__6;
    v36 = __Block_byref_object_dispose__6;
    v37 = 0;
    v6 = *MEMORY[0x1E0CB28A8];
    v7 = MEMORY[0x1E0C809B0];
    v8 = 1;
    do
    {
      v9 = (void *)v39[5];
      v39[5] = 0;

      v31[0] = v7;
      v31[1] = 3221225472;
      v31[2] = __45__NFHardwareManager_secureElementsWithError___block_invoke;
      v31[3] = &unk_1E3B51998;
      v31[5] = &v38;
      v31[6] = a2;
      v31[4] = v5;
      -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](v5, "synchronousRemoteObjectProxyWithErrorHandler:", v31);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v7;
      v30[1] = 3221225472;
      v30[2] = __45__NFHardwareManager_secureElementsWithError___block_invoke_114;
      v30[3] = &unk_1E3B52AC0;
      v30[4] = &v32;
      objc_msgSend(v10, "secureElementsWithCompletion:", v30);

      v11 = (void *)v39[5];
      if (!v11)
        break;
      objc_msgSend(v11, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "isEqualToString:", v6) & 1) == 0)
      {

        break;
      }
      v13 = objc_msgSend((id)v39[5], "code") == 4097;

      v14 = v8 & v13;
      v8 = 0;
    }
    while ((v14 & 1) != 0);
    if (objc_msgSend((id)v33[5], "count"))
    {
      v15 = (NSArray *)objc_opt_new();
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v16 = (id)v33[5];
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v44, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v27 != v19)
              objc_enumerationMutation(v16);
            v21 = -[NFSecureElement _initWithInfo:]([NFSecureElement alloc], "_initWithInfo:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
            -[NSArray addObject:](v15, "addObject:", v21);

          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v44, 16);
        }
        while (v18);
      }

      secureElements = v5->_secureElements;
      v5->_secureElements = v15;

    }
    _Block_object_dispose(&v32, 8);

    a3 = v25;
  }
  if (a3)
    *a3 = objc_retainAutorelease((id)v39[5]);
  v23 = v5->_secureElements;
  objc_sync_exit(v5);

  _Block_object_dispose(&v38, 8);
  return v23;
}

void __38__NFHardwareManager_hwStateDidChange___block_invoke(uint64_t a1)
{
  id v2;
  const void **v3;
  uint64_t Logger;
  void (*v5)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  int v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v5 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(*(id *)(a1 + 32));
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(*(id *)(a1 + 32));
    Name = sel_getName(*(SEL *)(a1 + 40));
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v5(6, "%c[%{public}s %{public}s]:%i %d -> %d", v10, ClassName, Name, 1418, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 88), *(unsigned int *)(a1 + 48));
  }
  dispatch_get_specific(*v3);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    v14 = object_getClassName(*(id *)(a1 + 32));
    v15 = sel_getName(*(SEL *)(a1 + 40));
    v16 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88);
    v17 = *(_DWORD *)(a1 + 48);
    *(_DWORD *)buf = 67110402;
    v47 = v13;
    v48 = 2082;
    v49 = v14;
    v50 = 2082;
    v51 = v15;
    v52 = 1024;
    v53 = 1418;
    v54 = 1024;
    v55 = v16;
    v56 = 1024;
    v57 = v17;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %d -> %d", buf, 0x2Eu);
  }

  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(_DWORD *)(v18 + 92);
  v20 = *(_DWORD *)(a1 + 48);
  *(_DWORD *)(v18 + 88) = v20;
  if (*(_DWORD *)(a1 + 48) == 2)
  {
    v21 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
  }
  else
  {
    v21 = 0;
  }
  if (v19 == v20)
  {
    objc_sync_exit(v2);

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92) = *(_DWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 16);
    *(_QWORD *)(v22 + 16) = 0;

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v24 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v41 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v29, "hardwareStateDidChange");
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v26);
    }

    objc_sync_exit(v2);
    v30 = (id)objc_msgSend(*(id *)(a1 + 32), "controllerInfo");
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v31 = v21;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v37 != v34)
          objc_enumerationMutation(v31);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j) + 16))();
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v33);
  }

}

- (NFHardwareControllerInfo)controllerInfo
{
  return (NFHardwareControllerInfo *)-[NFHardwareManager controllerInfoWithError:](self, "controllerInfoWithError:", 0);
}

- (id)controllerInfoWithError:(id *)a3
{
  NSObject *v6;
  NFHardwareManager *v7;
  NFHardwareControllerInfo *controllerInfo;
  NFHardwareControllerInfo *v9;
  uint64_t v10;
  void *v11;
  NFHardwareManager *v12;
  _QWORD v14[8];
  _QWORD v15[7];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  os_activity_scope_state_s state;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = _os_activity_create(&dword_19B5EB000, "controllerInfoWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v7 = self;
  objc_sync_enter(v7);
  controllerInfo = v7->_controllerInfo;
  if (controllerInfo)
  {
    v9 = controllerInfo;
    objc_sync_exit(v7);

  }
  else
  {
    objc_sync_exit(v7);

    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__6;
    v25 = __Block_byref_object_dispose__6;
    v26 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__6;
    v20 = __Block_byref_object_dispose__6;
    v21 = 0;
    v10 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __45__NFHardwareManager_controllerInfoWithError___block_invoke;
    v15[3] = &unk_1E3B51998;
    v15[5] = &v16;
    v15[6] = a2;
    v15[4] = v7;
    -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](v7, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __45__NFHardwareManager_controllerInfoWithError___block_invoke_57;
    v14[3] = &unk_1E3B526A0;
    v14[4] = v7;
    v14[5] = &v16;
    v14[6] = &state;
    v14[7] = a2;
    objc_msgSend(v11, "controllerInfoWithCompletion:", v14);

    if (a3)
      *a3 = objc_retainAutorelease((id)v17[5]);
    v12 = v7;
    objc_sync_enter(v12);
    objc_storeStrong((id *)&v7->_controllerInfo, *(id *)(state.opaque[1] + 40));
    objc_sync_exit(v12);

    v9 = (NFHardwareControllerInfo *)*(id *)(state.opaque[1] + 40);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(&state, 8);
  }
  return v9;
}

- (id)updateHWSupportWithXPC:(id)a3 waitForInit:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NFHardwareManager *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  _QWORD v14[6];
  _QWORD v15[7];
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a4;
  v7 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  v22 = 0;
  v8 = self;
  objc_sync_enter(v8);
  if (v7)
  {
    objc_msgSend(v7, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke;
    v16[3] = &unk_1E3B51998;
    v16[5] = &v17;
    v16[6] = a2;
    v16[4] = v8;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_42;
    v15[3] = &unk_1E3B51998;
    v15[5] = &v17;
    v15[6] = a2;
    v15[4] = v8;
    -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v18[5])
  {
    -[NFHardwareManager listenForNfcdStartup](v8, "listenForNfcdStartup");
  }
  else if (v4)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_43;
    v14[3] = &unk_1E3B525D8;
    v14[4] = v8;
    v14[5] = a2;
    objc_msgSend(v10, "waitForHWSupportedWithCompletion:", v14);
  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_46;
    v13[3] = &unk_1E3B525D8;
    v13[4] = v8;
    v13[5] = a2;
    objc_msgSend(v10, "isHWSupportedWithCompletion:", v13);
  }

  objc_sync_exit(v8);
  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

+ (id)sharedHardwareManagerWithNoUI
{
  id v2;

  if (qword_1ECFF61C0 != -1)
    dispatch_once(&qword_1ECFF61C0, &__block_literal_global_8);
  v2 = (id)objc_msgSend((id)qword_1ECFF61B8, "connectToXPCManager:", 1);
  return (id)qword_1ECFF61B8;
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  void *v3;
  void (**v5)(id, void *);
  NFHardwareManager *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  v6 = self;
  objc_sync_enter(v6);
  -[NFHardwareManager connectToXPCManager:](v6, "connectToXPCManager:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v6);

  if (!v8)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nf.fwk");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("No connection to nfcd");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 0, v12);
    v5[2](v5, v13);

    v3 = 0;
  }

  return v3;
}

- (id)connectToXPCManager:(BOOL)a3
{
  _BOOL8 v3;
  NFHardwareManager *v4;
  unsigned int hwSupport;
  NFXPCServiceClient *v6;
  void *v7;
  uint64_t v8;
  NFXPCServiceClient *xpc;
  NFXPCServiceClient *v10;
  id v11;
  unsigned int v12;
  NFXPCServiceClient *v13;

  v3 = a3;
  v4 = self;
  objc_sync_enter(v4);
  hwSupport = v4->_hwSupport;
  if (v4->_xpc)
  {
    if (hwSupport != 1)
      goto LABEL_8;
    goto LABEL_6;
  }
  if (hwSupport != 4)
  {
    v6 = [NFXPCServiceClient alloc];
    +[NFHardwareManagerInterface interface]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NFXPCServiceClient initWithService:remoteObjectInterface:exportedInterface:exportedObject:xpcDispatchQueue:](v6, "initWithService:remoteObjectInterface:exportedInterface:exportedObject:xpcDispatchQueue:", CFSTR("com.apple.nfcd.hwmanager"), v7, 0, 0, v4->_xpcQueue);
    xpc = v4->_xpc;
    v4->_xpc = (NFXPCServiceClient *)v8;

    -[NFXPCServiceClient addDelegate:](v4->_xpc, "addDelegate:", v4);
    if (!v4->_xpc)
    {
      v10 = 0;
      goto LABEL_7;
    }
LABEL_6:
    -[NFHardwareManager registerForRemoteCallbacks](v4, "registerForRemoteCallbacks");
    v10 = v4->_xpc;
LABEL_7:
    v11 = -[NFHardwareManager updateHWSupportWithXPC:waitForInit:](v4, "updateHWSupportWithXPC:waitForInit:", v10, v3);
  }
LABEL_8:
  if (!-[NSMutableSet count](v4->_eventListeners, "count"))
  {
    v12 = v4->_hwSupport;
    if (v12 == 4 || v12 == 2)
      -[NFHardwareManager unregisterForRemoteCallbacks](v4, "unregisterForRemoteCallbacks");
  }
  v13 = v4->_xpc;
  objc_sync_exit(v4);

  return v13;
}

- (void)unregisterForRemoteCallbacks
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  void *v14;
  void *v15;
  const char *Name;
  _QWORD v17[6];
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (self->_hasEventListener)
  {
    v4 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i ", v10, ClassName, Name, 243);
    }
    dispatch_get_specific(*v4);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      *(_DWORD *)buf = 67109890;
      v19 = v13;
      v20 = 2082;
      v21 = object_getClassName(self);
      v22 = 2082;
      v23 = sel_getName(a2);
      v24 = 1024;
      v25 = 243;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", buf, 0x22u);
    }

    self->_hasEventListener = 0;
    -[NFXPCServiceClient connection](self->_xpc, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49__NFHardwareManager_unregisterForRemoteCallbacks__block_invoke;
    v17[3] = &unk_1E3B51410;
    v17[4] = self;
    v17[5] = a2;
    objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v17);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "unregisterForCallbacks:", self);

  }
}

- (void)registerForRemoteCallbacks
{
  NSObject *v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  const char *v15;
  const char *v16;
  void *v17;
  void *v18;
  const char *Name;
  _QWORD v20[6];
  _BYTE state[18];
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_19B5EB000, "registerForRemoteCallbacks", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if (!self->_hasEventListener)
  {
    v5 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v7 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v11 = 45;
      if (isMetaClass)
        v11 = 43;
      v7(6, "%c[%{public}s %{public}s]:%i ", v11, ClassName, Name, 229);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = object_getClass(self);
      if (class_isMetaClass(v13))
        v14 = 43;
      else
        v14 = 45;
      v15 = object_getClassName(self);
      v16 = sel_getName(a2);
      *(_DWORD *)state = 67109890;
      *(_DWORD *)&state[4] = v14;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v15;
      v22 = 2082;
      v23 = v16;
      v24 = 1024;
      v25 = 229;
      _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
    }

    self->_hasEventListener = 1;
    -[NFXPCServiceClient connection](self->_xpc, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __47__NFHardwareManager_registerForRemoteCallbacks__block_invoke;
    v20[3] = &unk_1E3B51410;
    v20[4] = self;
    v20[5] = a2;
    objc_msgSend(v17, "remoteObjectProxyWithErrorHandler:", v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "registerForCallbacks:", self);

  }
}

- (NFHardwareManager)initWithType:(int64_t)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_t v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)NFHardwareManager;
  v4 = -[NFHardwareManager init](&v19, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)*((_QWORD *)v4 + 3);
    *((_QWORD *)v4 + 3) = v5;

    v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v8 = (void *)*((_QWORD *)v4 + 4);
    *((_QWORD *)v4 + 4) = v7;

    *((_QWORD *)v4 + 11) = 0x100000001;
    *((_QWORD *)v4 + 12) = a3;
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = (void *)*((_QWORD *)v4 + 7);
    *((_QWORD *)v4 + 7) = v9;

    *((_DWORD *)v4 + 26) = -1;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.nearfield.callbacks", v11);
    v13 = (void *)*((_QWORD *)v4 + 8);
    *((_QWORD *)v4 + 8) = v12;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v4 + 8), (const void *)*MEMORY[0x1E0DE7900], 0, 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = dispatch_queue_create("com.apple.nearfield.nfcd.xpc", v15);
    v17 = (void *)*((_QWORD *)v4 + 10);
    *((_QWORD *)v4 + 10) = v16;

  }
  return (NFHardwareManager *)v4;
}

+ (void)sharedHardwareManager:(id)a3
{
  void *v4;
  void (**v5)(id, void *);

  v5 = (void (**)(id, void *))a3;
  objc_msgSend(a1, "_sharedHardwareManagerWaitOnHWInit:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_isHWReadyAndIfNotQueueClient:", v5))
    v5[2](v5, v4);

}

- (BOOL)_isHWReadyAndIfNotQueueClient:(id)a3
{
  id v4;
  NFHardwareManager *v5;
  unsigned int hwSupport;
  NSMutableArray *waitingClients;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  hwSupport = v5->_hwSupport;
  if (hwSupport != 2)
  {
    waitingClients = v5->_waitingClients;
    v8 = (void *)MEMORY[0x1A1AC40C8](v4);
    -[NSMutableArray addObject:](waitingClients, "addObject:", v8);

  }
  objc_sync_exit(v5);

  return hwSupport == 2;
}

- (void)listenForNfcdStartup
{
  int *p_listeningForNfcdStartedNtf;
  NSObject *listeningQueue;
  const void **v6;
  NSObject *v7;
  NSObject *v8;
  OS_dispatch_queue *v9;
  OS_dispatch_queue *v10;
  uint64_t v11;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  int listeningForNfcdStartedNtf;
  _QWORD handler[5];
  uint8_t buf[4];
  int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  p_listeningForNfcdStartedNtf = &self->_listeningForNfcdStartedNtf;
  if (self->_listeningForNfcdStartedNtf == -1)
  {
    listeningQueue = self->_listeningQueue;
    v6 = (const void **)MEMORY[0x1E0DE7900];
    if (!listeningQueue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INTERACTIVE, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.nearfield.nfcd.listener", v8);
      v10 = self->_listeningQueue;
      self->_listeningQueue = v9;

      dispatch_queue_set_specific((dispatch_queue_t)self->_listeningQueue, *v6, 0, 0);
      listeningQueue = self->_listeningQueue;
    }
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __41__NFHardwareManager_listenForNfcdStartup__block_invoke;
    handler[3] = &unk_1E3B52570;
    handler[4] = self;
    v11 = notify_register_dispatch("com.apple.nfcd.started", p_listeningForNfcdStartedNtf, listeningQueue, handler);
    dispatch_get_specific(*v6);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v13 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v13(6, "%c[%{public}s %{public}s]:%i Listening for startup NTF : %d (token %d)", v18, ClassName, Name, 171, v11, self->_listeningForNfcdStartedNtf);
    }
    dispatch_get_specific(*v6);
    NFSharedLogGetLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = object_getClass(self);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(self);
      v23 = sel_getName(a2);
      listeningForNfcdStartedNtf = self->_listeningForNfcdStartedNtf;
      *(_DWORD *)buf = 67110402;
      v27 = v21;
      v28 = 2082;
      v29 = v22;
      v30 = 2082;
      v31 = v23;
      v32 = 1024;
      v33 = 171;
      v34 = 1024;
      v35 = v11;
      v36 = 1024;
      v37 = listeningForNfcdStartedNtf;
      _os_log_impl(&dword_19B5EB000, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Listening for startup NTF : %d (token %d)", buf, 0x2Eu);
    }

  }
}

id __41__NFHardwareManager_listenForNfcdStartup__block_invoke(uint64_t a1)
{
  const void **v2;
  void (*Logger)(uint64_t, const char *, ...);
  NSObject *v4;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
  if (Logger)
    Logger(6, "%s:%i Received startup NTF", "-[NFHardwareManager listenForNfcdStartup]_block_invoke", 165);
  dispatch_get_specific(*v2);
  NFSharedLogGetLogger();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v7 = "-[NFHardwareManager listenForNfcdStartup]_block_invoke";
    v8 = 1024;
    v9 = 165;
    _os_log_impl(&dword_19B5EB000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s:%i Received startup NTF", buf, 0x12u);
  }

  objc_msgSend(*(id *)(a1 + 32), "stopListeningForNfcdRestart");
  return (id)objc_msgSend(*(id *)(a1 + 32), "connectToXPCManager:", 0);
}

- (void)stopListeningForNfcdRestart
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *Name;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (self->_listeningForNfcdStartedNtf != -1)
  {
    v4 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v6 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(6, "%c[%{public}s %{public}s]:%i Stop listening for startup NTF", v10, ClassName, Name, 178);
    }
    dispatch_get_specific(*v4);
    NFSharedLogGetLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = object_getClass(self);
      if (class_isMetaClass(v12))
        v13 = 43;
      else
        v13 = 45;
      *(_DWORD *)buf = 67109890;
      v16 = v13;
      v17 = 2082;
      v18 = object_getClassName(self);
      v19 = 2082;
      v20 = sel_getName(a2);
      v21 = 1024;
      v22 = 178;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Stop listening for startup NTF", buf, 0x22u);
    }

    notify_cancel(self->_listeningForNfcdStartedNtf);
    self->_listeningForNfcdStartedNtf = -1;
  }
}

void __47__NFHardwareManager_registerForRemoteCallbacks__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i Failed to re-register with nfcd: %{public}@", v9, ClassName, Name, 232, v3);
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
    v24 = 232;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to re-register with nfcd: %{public}@", buf, 0x2Cu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 108) = 0;
}

void __49__NFHardwareManager_unregisterForRemoteCallbacks__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i Failed to re-register with nfcd: %{public}@", v9, ClassName, Name, 246, v3);
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
    v24 = 246;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to re-register with nfcd: %{public}@", buf, 0x2Cu);
  }

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 108) = 1;
}

- (void)sessionDidEnd:(id)a3
{
  id v5;
  NSMutableSet *obj;

  obj = self->_sessions;
  v5 = a3;
  objc_sync_enter(obj);
  -[NSMutableSet removeObject:](self->_sessions, "removeObject:", v5);

  objc_sync_exit(obj);
}

- (void)didInvalidate
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  NFHardwareManager *v14;
  NSMutableSet *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NFXPCServiceClient *xpc;
  NFHardwareControllerInfo *controllerInfo;
  const char *Name;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v10 = 45;
    if (isMetaClass)
      v10 = 43;
    v6(5, "%c[%{public}s %{public}s]:%i Connection invalidated", v10, ClassName, Name, 285);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = object_getClass(self);
    if (class_isMetaClass(v12))
      v13 = 43;
    else
      v13 = 45;
    *(_DWORD *)buf = 67109890;
    v30 = v13;
    v31 = 2082;
    v32 = object_getClassName(self);
    v33 = 2082;
    v34 = sel_getName(a2);
    v35 = 1024;
    v36 = 285;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Connection invalidated", buf, 0x22u);
  }

  v14 = self;
  objc_sync_enter(v14);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v14->_eventListeners;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "didReceiveFatalCommunicationError");
      }
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  xpc = v14->_xpc;
  v14->_xpc = 0;

  v14->_hasEventListener = 0;
  controllerInfo = v14->_controllerInfo;
  v14->_controllerInfo = 0;

  v14->_hwSupport = 1;
  -[NFHardwareManager hwStateDidChange:](v14, "hwStateDidChange:", 1);
  -[NFHardwareManager listenForNfcdStartup](v14, "listenForNfcdStartup");
  objc_sync_exit(v14);

}

- (void)didInterrupt:(id)a3
{
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v11;
  NSObject *v12;
  objc_class *v13;
  int v14;
  NSMutableSet *v15;
  void *v16;
  NFHardwareManager *v17;
  NFHardwareControllerInfo *controllerInfo;
  uint64_t v19;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  const char *Name;
  const char *v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v11 = 45;
    if (isMetaClass)
      v11 = 43;
    v7(5, "%c[%{public}s %{public}s]:%i Connection interrupted", v11, ClassName, Name, 308);
  }
  dispatch_get_specific(*v5);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    *(_DWORD *)buf = 67109890;
    v33 = v14;
    v34 = 2082;
    v35 = object_getClassName(self);
    v36 = 2082;
    v37 = sel_getName(a2);
    v38 = 1024;
    v39 = 308;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Connection interrupted", buf, 0x22u);
  }

  v15 = self->_sessions;
  objc_sync_enter(v15);
  v16 = (void *)-[NSMutableSet copy](self->_sessions, "copy");
  objc_sync_exit(v15);

  objc_msgSend(v16, "enumerateObjectsUsingBlock:", &__block_literal_global_31);
  v17 = self;
  objc_sync_enter(v17);
  if (-[NSMutableSet count](v17->_eventListeners, "count") || -[NSMutableArray count](v17->_waitingClients, "count"))
  {
    v17->_hasEventListener = 0;
    -[NFHardwareManager registerForRemoteCallbacks](v17, "registerForRemoteCallbacks");
  }
  -[NSArray enumerateObjectsUsingBlock:](v17->_secureElements, "enumerateObjectsUsingBlock:", &__block_literal_global_33);
  controllerInfo = v17->_controllerInfo;
  v17->_controllerInfo = 0;

  v17->_hwSupport = 1;
  objc_sync_exit(v17);

  if (v17->_didPreWarm)
  {
    dispatch_get_specific(*v5);
    v19 = NFLogGetLogger();
    if (v19)
    {
      v20 = (void (*)(uint64_t, const char *, ...))v19;
      v21 = object_getClass(v17);
      v22 = class_isMetaClass(v21);
      v23 = object_getClassName(v17);
      v31 = sel_getName(a2);
      v24 = 45;
      if (v22)
        v24 = 43;
      v20(3, "%c[%{public}s %{public}s]:%i Re-starting preWarm after disconnect", v24, v23, v31, 337);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = object_getClass(v17);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(v17);
      v29 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v33 = v27;
      v34 = 2082;
      v35 = v28;
      v36 = 2082;
      v37 = v29;
      v38 = 1024;
      v39 = 337;
      _os_log_impl(&dword_19B5EB000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Re-starting preWarm after disconnect", buf, 0x22u);
    }

    -[NFHardwareManager preWarm](v17, "preWarm");
  }

}

uint64_t __34__NFHardwareManager_didInterrupt___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndUnexpectedly");
}

uint64_t __34__NFHardwareManager_didInterrupt___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_markDirty");
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  void *v3;
  void (**v5)(id, void *);
  NFHardwareManager *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, void *))a3;
  v6 = self;
  objc_sync_enter(v6);
  -[NFHardwareManager connectToXPCManager:](v6, "connectToXPCManager:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_sync_exit(v6);

  if (!v8)
  {
    v10 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nf.fwk");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x1E0CB2D50];
    v16[0] = CFSTR("No connection to nfcd");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 0, v12);
    v5[2](v5, v13);

    v3 = 0;
  }

  return v3;
}

void __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", v9, ClassName, Name, 379, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 379;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_42(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", v9, ClassName, Name, 384, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 384;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get HW support : %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_43(uint64_t a1, uint64_t a2)
{
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
  int v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
    v6(6, "%c[%{public}s %{public}s]:%i %d -> %d", v11, ClassName, Name, 394, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 88), a2);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 40));
    v17 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88);
    *(_DWORD *)buf = 67110402;
    v19 = v14;
    v20 = 2082;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 1024;
    v25 = 394;
    v26 = 1024;
    v27 = v17;
    v28 = 1024;
    v29 = a2;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %d -> %d", buf, 0x2Eu);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = a2;
}

void __56__NFHardwareManager_updateHWSupportWithXPC_waitForInit___block_invoke_46(uint64_t a1, uint64_t a2)
{
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
  int v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
    v6(6, "%c[%{public}s %{public}s]:%i %d -> %d", v11, ClassName, Name, 399, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 88), a2);
  }
  dispatch_get_specific(*v4);
  NFSharedLogGetLogger();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v13))
      v14 = 43;
    else
      v14 = 45;
    v15 = object_getClassName(*(id *)(a1 + 32));
    v16 = sel_getName(*(SEL *)(a1 + 40));
    v17 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88);
    *(_DWORD *)buf = 67110402;
    v19 = v14;
    v20 = 2082;
    v21 = v15;
    v22 = 2082;
    v23 = v16;
    v24 = 1024;
    v25 = 399;
    v26 = 1024;
    v27 = v17;
    v28 = 1024;
    v29 = a2;
    _os_log_impl(&dword_19B5EB000, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %d -> %d", buf, 0x2Eu);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 88) = a2;
}

- (unsigned)getHwSupport
{
  NFHardwareManager *v2;
  unsigned int hwSupport;

  v2 = self;
  objc_sync_enter(v2);
  hwSupport = v2->_hwSupport;
  objc_sync_exit(v2);

  return hwSupport;
}

- (unsigned)queryHardwareSupport:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  os_activity_scope_state_s v10;

  v5 = _os_activity_create(&dword_19B5EB000, "queryHardwareSupport:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v5, &v10);
  os_activity_scope_leave(&v10);

  -[NFHardwareManager updateHWSupportWithXPC:waitForInit:](self, "updateHWSupportWithXPC:waitForInit:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 && v6)
    *a3 = objc_retainAutorelease(v6);
  v8 = -[NFHardwareManager getHwSupport](self, "getHwSupport");

  return v8;
}

- (id)getRadioEnabledSetting:(BOOL *)a3
{
  void *v4;
  BOOL v5;
  uint64_t v8;

  v8 = 0;
  -[NFHardwareManager getRadioEnabledState:](self, "getRadioEnabledState:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    *a3 = 0;
  if ((unint64_t)(v8 + 1) >= 2)
  {
    if (v8 == 1 && a3 != 0)
    {
      v5 = 1;
      goto LABEL_11;
    }
  }
  else if (a3)
  {
    v5 = 0;
LABEL_11:
    *a3 = v5;
  }
  return v4;
}

- (id)getRadioEnabledState:(int64_t *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = _os_activity_create(&dword_19B5EB000, "getRadioEnabledState:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__NFHardwareManager_getRadioEnabledState___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __42__NFHardwareManager_getRadioEnabledState___block_invoke_48;
  v11[3] = &unk_1E3B52600;
  v11[4] = &state;
  v11[5] = a3;
  objc_msgSend(v8, "radioEnableStateWithCompletion:", v11);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __42__NFHardwareManager_getRadioEnabledState___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 456, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 456;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __42__NFHardwareManager_getRadioEnabledState___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = *(_QWORD **)(a1 + 40);
  if (v6)
    *v6 = a2;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

}

- (id)setRadioEnabledSetting:(BOOL)a3
{
  _BOOL8 v3;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[7];
  os_activity_scope_state_s state;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  if (a3)
    v6 = "setRadioEnabledSetting:Y";
  else
    v6 = "setRadioEnabledSetting:N";
  v7 = _os_activity_create(&dword_19B5EB000, v6, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__NFHardwareManager_setRadioEnabledSetting___block_invoke;
  v13[3] = &unk_1E3B51998;
  v13[5] = &state;
  v13[6] = a2;
  v13[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __44__NFHardwareManager_setRadioEnabledSetting___block_invoke_50;
  v12[3] = &unk_1E3B51D20;
  v12[4] = &state;
  objc_msgSend(v9, "enableRadio:completion:", v3, v12);

  v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v10;
}

void __44__NFHardwareManager_setRadioEnabledSetting___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 476, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 476;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __44__NFHardwareManager_setRadioEnabledSetting___block_invoke_50(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getTemperature:(double *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = _os_activity_create(&dword_19B5EB000, "getTemperature:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __36__NFHardwareManager_getTemperature___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __36__NFHardwareManager_getTemperature___block_invoke_51;
  v11[3] = &unk_1E3B52628;
  v11[4] = &state;
  v11[5] = a3;
  objc_msgSend(v8, "getTemperatureWithCompletion:", v11);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __36__NFHardwareManager_getTemperature___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 491, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 491;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __36__NFHardwareManager_getTemperature___block_invoke_51(uint64_t a1, void *a2, double a3)
{
  double *v6;
  id v7;

  v7 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = *(double **)(a1 + 40);
  if (v6)
    *v6 = a3;

}

- (id)getReaderProhibitTimerInfoSERmRunning:(BOOL *)a3 hostRmRunning:(BOOL *)a4 remainingInMs:(unsigned int *)a5
{
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v15[8];
  _QWORD v16[7];
  os_activity_scope_state_s state;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;

  v10 = _os_activity_create(&dword_19B5EB000, "getReaderProhibitTimerInfoSERmRunning:hRmRunning:remainingInMs", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__NFHardwareManager_getReaderProhibitTimerInfoSERmRunning_hostRmRunning_remainingInMs___block_invoke;
  v16[3] = &unk_1E3B51998;
  v16[5] = &state;
  v16[6] = a2;
  v16[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __87__NFHardwareManager_getReaderProhibitTimerInfoSERmRunning_hostRmRunning_remainingInMs___block_invoke_53;
  v15[3] = &unk_1E3B52650;
  v15[4] = &v30;
  v15[5] = &v26;
  v15[6] = &v22;
  v15[7] = &state;
  objc_msgSend(v12, "getReaderProhibitTimer:", v15);

  if (a3)
    *a3 = *((_BYTE *)v31 + 24);
  if (a4)
    *a4 = *((_BYTE *)v27 + 24);
  if (a5)
    *a5 = *((_DWORD *)v23 + 6);
  v13 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v30, 8);
  return v13;
}

void __87__NFHardwareManager_getReaderProhibitTimerInfoSERmRunning_hostRmRunning_remainingInMs___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 514, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 514;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __87__NFHardwareManager_getReaderProhibitTimerInfoSERmRunning_hostRmRunning_remainingInMs___block_invoke_53(_QWORD *a1, char a2, char a3, int a4, void *a5)
{
  id v9;
  uint64_t v10;
  void *v11;

  v9 = a5;
  if (!v9)
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = a2;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = a3;
    *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a4;
  }
  v10 = *(_QWORD *)(a1[7] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)stateInfo:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = _os_activity_create(&dword_19B5EB000, "stateInfo:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __31__NFHardwareManager_stateInfo___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __31__NFHardwareManager_stateInfo___block_invoke_55;
  v11[3] = &unk_1E3B52678;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  v11[7] = a2;
  objc_msgSend(v8, "stateInfoWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __31__NFHardwareManager_stateInfo___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 574, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 574;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __31__NFHardwareManager_stateInfo___block_invoke_55(uint64_t a1, void *a2, void *a3)
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
  id *v19;
  void *v20;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 578, v7);
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
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 578;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a3;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a2;
  }
  objc_storeStrong(v19, v20);

}

void __45__NFHardwareManager_controllerInfoWithError___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 605, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 605;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __45__NFHardwareManager_controllerInfoWithError___block_invoke_57(uint64_t a1, void *a2, void *a3)
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
  id *v19;
  void *v20;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 609, v7);
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
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 609;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a3;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a2;
  }
  objc_storeStrong(v19, v20);

}

- (id)rfSettings
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  _QWORD v10[6];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = _os_activity_create(&dword_19B5EB000, "rfSettings", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __31__NFHardwareManager_rfSettings__block_invoke;
  v10[3] = &unk_1E3B51410;
  v10[4] = self;
  v10[5] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __31__NFHardwareManager_rfSettings__block_invoke_59;
  v9[3] = &unk_1E3B526C8;
  v9[5] = &state;
  v9[6] = a2;
  v9[4] = self;
  objc_msgSend(v6, "rfSettingsWithCompletion:", v9);

  v7 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v7;
}

void __31__NFHardwareManager_rfSettings__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 638, v3);
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
    v24 = 638;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __31__NFHardwareManager_rfSettings__block_invoke_59(uint64_t a1, void *a2, void *a3)
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
      Name = sel_getName(*(SEL *)(a1 + 48));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 641, v7);
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
      v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 641;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)setAntiRelayRID:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[7];
  _QWORD v11[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __37__NFHardwareManager_setAntiRelayRID___block_invoke;
  v11[3] = &unk_1E3B51998;
  v11[5] = &v12;
  v11[6] = a2;
  v11[4] = self;
  v6 = a3;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __37__NFHardwareManager_setAntiRelayRID___block_invoke_60;
  v10[3] = &unk_1E3B51998;
  v10[5] = &v12;
  v10[6] = a2;
  v10[4] = self;
  objc_msgSend(v7, "setAntiRelayRID:completion:", v6, v10);

  v8 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v8;
}

void __37__NFHardwareManager_setAntiRelayRID___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 657, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 657;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __37__NFHardwareManager_setAntiRelayRID___block_invoke_60(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 661, v3);
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
      v20 = v12;
      v21 = 2082;
      v22 = v13;
      v23 = 2082;
      v24 = v14;
      v25 = 1024;
      v26 = 661;
      v27 = 2114;
      v28 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

- (id)getDieIDWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = _os_activity_create(&dword_19B5EB000, "getDieIDWithError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__NFHardwareManager_getDieIDWithError___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __39__NFHardwareManager_getDieIDWithError___block_invoke_61;
  v11[3] = &unk_1E3B526F0;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  v11[7] = a2;
  objc_msgSend(v8, "getDieIDWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __39__NFHardwareManager_getDieIDWithError___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 679, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 679;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __39__NFHardwareManager_getDieIDWithError___block_invoke_61(uint64_t a1, void *a2, void *a3)
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
  id *v19;
  void *v20;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 683, v7);
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
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 683;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a3;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a2;
  }
  objc_storeStrong(v19, v20);

}

- (id)getDieID
{
  return -[NFHardwareManager getDieIDWithError:](self, "getDieIDWithError:", 0);
}

- (id)getUniqueFDRKey:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = _os_activity_create(&dword_19B5EB000, "getUniqueFDRKey:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __37__NFHardwareManager_getUniqueFDRKey___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __37__NFHardwareManager_getUniqueFDRKey___block_invoke_63;
  v11[3] = &unk_1E3B52718;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  v11[7] = a2;
  objc_msgSend(v8, "getUniqueFDRKeyWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __37__NFHardwareManager_getUniqueFDRKey___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 709, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 709;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __37__NFHardwareManager_getUniqueFDRKey___block_invoke_63(uint64_t a1, void *a2, void *a3)
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
  id *v19;
  void *v20;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v7)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 713, v7);
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
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 713;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a3;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a2;
  }
  objc_storeStrong(v19, v20);

}

- (id)pushSignedRF:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "pushSignedRF:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__NFHardwareManager_pushSignedRF___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __34__NFHardwareManager_pushSignedRF___block_invoke_65;
  v11[3] = &unk_1E3B51998;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  objc_msgSend(v8, "pushSignedRF:completion:", v5, v11);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __34__NFHardwareManager_pushSignedRF___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 732, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 732;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __34__NFHardwareManager_pushSignedRF___block_invoke_65(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 736, v3);
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
      v20 = v12;
      v21 = 2082;
      v22 = v13;
      v23 = 2082;
      v24 = v14;
      v25 = 1024;
      v26 = 736;
      v27 = 2114;
      v28 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

- (BOOL)isExpressModeSupported
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_19B5EB000, "isExpressModeSupported", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  -[NFHardwareManager controllerInfo](self, "controllerInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "hasAntenna");

  return (char)v3;
}

- (BOOL)supportsCathay
{
  void *v3;
  unint64_t v4;
  NFHardwareManager *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  BOOL v20;
  const void **v21;
  uint64_t Logger;
  void (*v23)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v27;
  objc_class *v28;
  int v29;
  const char *v30;
  const char *v31;
  const char *Name;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  -[NFHardwareManager controllerInfo](self, "controllerInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "siliconName");

  v5 = self;
  objc_sync_enter(v5);
  -[NFHardwareManager secureElementsWithError:](v5, "secureElementsWithError:", 0);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
      objc_msgSend(v11, "info");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "seType") == 7)
      {

      }
      else
      {
        objc_msgSend(v11, "info");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "seType");

        if (v14 > 5)
        {
          v17 = 0;
          v20 = 1;
          v18 = v6;
          goto LABEL_27;
        }
      }
      objc_msgSend(v11, "info");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "seType");

      if (v16 == 2)
        break;
      if (v8 == ++v10)
      {
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    v17 = v11;

    if (!v17)
      goto LABEL_16;
    if (v4 >= 7)
    {
      objc_msgSend(v17, "info");
      v18 = objc_claimAutoreleasedReturnValue();
      -[NSObject sequenceCounter](v18, "sequenceCounter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "unsignedIntValue") > 0x65D;

      goto LABEL_27;
    }
    v20 = 1;
  }
  else
  {
LABEL_12:

LABEL_16:
    v21 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v23 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(v5);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(v5);
      Name = sel_getName(a2);
      v27 = 45;
      if (isMetaClass)
        v27 = 43;
      v23(3, "%c[%{public}s %{public}s]:%i couldn't find embedded SE! :-O", v27, ClassName, Name, 770);
    }
    dispatch_get_specific(*v21);
    NFSharedLogGetLogger();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v28 = object_getClass(v5);
      if (class_isMetaClass(v28))
        v29 = 43;
      else
        v29 = 45;
      v30 = object_getClassName(v5);
      v31 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      v40 = v29;
      v41 = 2082;
      v42 = v30;
      v43 = 2082;
      v44 = v31;
      v45 = 1024;
      v46 = 770;
      _os_log_impl(&dword_19B5EB000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i couldn't find embedded SE! :-O", buf, 0x22u);
    }
    v17 = 0;
    v20 = 0;
LABEL_27:

  }
  objc_sync_exit(v5);

  return v20;
}

- (BOOL)isExpressAppletTypeSupported:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v6;
  NSObject *v7;
  char v8;
  BOOL v9;
  const void **v10;
  uint64_t Logger;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *ClassName;
  const char *Name;
  _BYTE state[18];
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v3 = a3;
  v30 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_19B5EB000, "isExpressAppletTypeSupported:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v6, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  if ((v3 - 1) >= 4 && (_DWORD)v3 != 6)
  {
    if ((_DWORD)v3 == 5)
    {
      -[NFHardwareManager controllerInfo](self, "controllerInfo");
      v7 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject hasAntenna](v7, "hasAntenna"))
      {
        v8 = -[NFHardwareManager supportsCathay](self, "supportsCathay");
        goto LABEL_3;
      }
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
        v15 = 45;
        if (isMetaClass)
          v15 = 43;
        v12(3, "%c[%{public}s %{public}s]:%i unsupported express mode %d", v15, ClassName, Name, 799, v3);
      }
      dispatch_get_specific(*v10);
      NFSharedLogGetLogger();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)state = 67110146;
        *(_DWORD *)&state[4] = v17;
        *(_WORD *)&state[8] = 2082;
        *(_QWORD *)&state[10] = v18;
        v24 = 2082;
        v25 = v19;
        v26 = 1024;
        v27 = 799;
        v28 = 1024;
        v29 = v3;
        _os_log_impl(&dword_19B5EB000, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i unsupported express mode %d", state, 0x28u);
      }
    }
    v9 = 0;
    goto LABEL_18;
  }
  -[NFHardwareManager controllerInfo](self, "controllerInfo");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject hasAntenna](v7, "hasAntenna");
LABEL_3:
  v9 = v8;
LABEL_18:

  return v9;
}

- (BOOL)expressModesEnabled
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];
  _QWORD v9[6];
  os_activity_scope_state_s state;
  uint64_t v11;
  char v12;

  v4 = _os_activity_create(&dword_19B5EB000, "expressModeEnabled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v11 = 0x2020000000;
  v12 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__NFHardwareManager_expressModesEnabled__block_invoke;
  v9[3] = &unk_1E3B51410;
  v9[4] = self;
  v9[5] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __40__NFHardwareManager_expressModesEnabled__block_invoke_68;
  v8[3] = &unk_1E3B52740;
  v8[4] = &state;
  objc_msgSend(v6, "expressModesInfoWithCompletion:", v8);

  LOBYTE(v6) = *(_BYTE *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return (char)v6;
}

void __40__NFHardwareManager_expressModesEnabled__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 811, v3);
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
    v24 = 811;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

uint64_t __40__NFHardwareManager_expressModesEnabled__block_invoke_68(uint64_t result, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2 == 1;
  return result;
}

- (int64_t)expressModeControlState
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  _QWORD v9[5];
  _QWORD v10[6];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t v13;

  v4 = _os_activity_create(&dword_19B5EB000, "expressModeControlState", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__NFHardwareManager_expressModeControlState__block_invoke;
  v10[3] = &unk_1E3B51410;
  v10[4] = self;
  v10[5] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __44__NFHardwareManager_expressModeControlState__block_invoke_70;
  v9[3] = &unk_1E3B52740;
  v9[4] = &state;
  objc_msgSend(v6, "expressModesInfoWithCompletion:", v9);

  v7 = *(_QWORD *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v7;
}

void __44__NFHardwareManager_expressModeControlState__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 826, v3);
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
    v24 = 826;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

uint64_t __44__NFHardwareManager_expressModeControlState__block_invoke_70(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (id)checkExpressPassCompatibility:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  _QWORD v14[7];
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

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "checkExpressPassCompatibility:error:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__NFHardwareManager_checkExpressPassCompatibility_error___block_invoke;
  v14[3] = &unk_1E3B51488;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __57__NFHardwareManager_checkExpressPassCompatibility_error___block_invoke_71;
  v13[3] = &unk_1E3B52768;
  v13[4] = self;
  v13[5] = &v15;
  v13[6] = &state;
  v13[7] = a2;
  objc_msgSend(v10, "checkExpressPassCompatibilityDeprecated:callback:", v7, v13);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&state, 8);
  return v11;
}

void __57__NFHardwareManager_checkExpressPassCompatibility_error___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 843, v4);
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
    v25 = 843;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __57__NFHardwareManager_checkExpressPassCompatibility_error___block_invoke_71(uint64_t a1, void *a2, void *a3)
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
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 848, v7);
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
      v28 = 848;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
}

- (id)validateExpressPassCompatibilityWithConfig:(id)a3 outError:(id *)a4
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[8];
  _QWORD v14[7];
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

  v7 = a3;
  v8 = _os_activity_create(&dword_19B5EB000, "validateExpressPassCompatibilityWithConfig:outError:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v25 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__6;
  v19 = __Block_byref_object_dispose__6;
  v20 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__NFHardwareManager_validateExpressPassCompatibilityWithConfig_outError___block_invoke;
  v14[3] = &unk_1E3B51488;
  v14[4] = self;
  v14[5] = &state;
  v14[6] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __73__NFHardwareManager_validateExpressPassCompatibilityWithConfig_outError___block_invoke_73;
  v13[3] = &unk_1E3B52768;
  v13[4] = self;
  v13[5] = &v15;
  v13[6] = &state;
  v13[7] = a2;
  objc_msgSend(v10, "checkExpressPassCompatibility:callback:", v7, v13);

  if (a4)
    *a4 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v11 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&state, 8);
  return v11;
}

void __73__NFHardwareManager_validateExpressPassCompatibilityWithConfig_outError___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 868, v4);
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
    v25 = 868;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __73__NFHardwareManager_validateExpressPassCompatibilityWithConfig_outError___block_invoke_73(uint64_t a1, void *a2, void *a3)
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
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 873, v7);
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
      v28 = 873;
      v29 = 2114;
      v30 = v7;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
}

- (BOOL)currentInMetroStatus:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  os_activity_scope_state_s state;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = _os_activity_create(&dword_19B5EB000, "currentInMetroStatus:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__6;
  v20 = __Block_byref_object_dispose__6;
  v21 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__NFHardwareManager_currentInMetroStatus___block_invoke;
  v12[3] = &unk_1E3B51488;
  v12[4] = self;
  v12[5] = &state;
  v12[6] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __42__NFHardwareManager_currentInMetroStatus___block_invoke_74;
  v11[3] = &unk_1E3B52790;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  v11[7] = a2;
  objc_msgSend(v8, "currentInMetroStatus:", v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __42__NFHardwareManager_currentInMetroStatus___block_invoke(uint64_t a1, void *a2)
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
    v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 893, v4);
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
    v25 = 893;
    v26 = 2114;
    v27 = v4;
    _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __42__NFHardwareManager_currentInMetroStatus___block_invoke_74(uint64_t a1, char a2, void *a3)
{
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
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
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
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 898, v6);
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
      v21 = v15;
      v22 = 2082;
      v23 = v16;
      v24 = 2082;
      v25 = v17;
      v26 = 1024;
      v27 = 898;
      v28 = 2114;
      v29 = v6;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
}

- (id)configureHeadlessFactoryMode:(BOOL)a3
{
  _BOOL8 v3;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[7];
  os_activity_scope_state_s state;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  if (a3)
    v6 = "configureHeadlessFactoryMode:Y";
  else
    v6 = "configureHeadlessFactoryMode:N";
  v7 = _os_activity_create(&dword_19B5EB000, v6, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__NFHardwareManager_configureHeadlessFactoryMode___block_invoke;
  v13[3] = &unk_1E3B51998;
  v13[5] = &state;
  v13[6] = a2;
  v13[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __50__NFHardwareManager_configureHeadlessFactoryMode___block_invoke_76;
  v12[3] = &unk_1E3B51D20;
  v12[4] = &state;
  objc_msgSend(v9, "configureHeadlessFactoryMode:completion:", v3, v12);

  v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v10;
}

void __50__NFHardwareManager_configureHeadlessFactoryMode___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 922, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 922;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __50__NFHardwareManager_configureHeadlessFactoryMode___block_invoke_76(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)enableLPEMFeature:(unint64_t)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = _os_activity_create(&dword_19B5EB000, "enableLPEMFeature:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__NFHardwareManager_enableLPEMFeature___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __39__NFHardwareManager_enableLPEMFeature___block_invoke_77;
  v11[3] = &unk_1E3B51D20;
  v11[4] = &state;
  objc_msgSend(v8, "enableLPEMFeature:completion:", a3, v11);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __39__NFHardwareManager_enableLPEMFeature___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 939, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 939;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __39__NFHardwareManager_enableLPEMFeature___block_invoke_77(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)disableLPEMFeature:(unint64_t)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = _os_activity_create(&dword_19B5EB000, "enableLPEMFeature:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __40__NFHardwareManager_disableLPEMFeature___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __40__NFHardwareManager_disableLPEMFeature___block_invoke_78;
  v11[3] = &unk_1E3B51D20;
  v11[4] = &state;
  objc_msgSend(v8, "disableLPEMFeature:completion:", a3, v11);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __40__NFHardwareManager_disableLPEMFeature___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 955, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 955;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __40__NFHardwareManager_disableLPEMFeature___block_invoke_78(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getHeadlessModeFlags:(unsigned int *)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  _QWORD v11[5];
  os_activity_scope_state_s state;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = _os_activity_create(&dword_19B5EB000, "getHeadlessModeFlags:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__6;
  v15 = __Block_byref_object_dispose__6;
  v6 = MEMORY[0x1E0C809B0];
  v16 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __42__NFHardwareManager_getHeadlessModeFlags___block_invoke;
  v11[3] = &unk_1E3B51D20;
  v11[4] = &state;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __42__NFHardwareManager_getHeadlessModeFlags___block_invoke_2;
  v10[3] = &unk_1E3B529F8;
  v10[4] = &state;
  v10[5] = a3;
  objc_msgSend(v7, "headlessFactoryModeWithCompletion:", v10);

  v8 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v8;
}

void __42__NFHardwareManager_getHeadlessModeFlags___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "initWithDomain:code:userInfo:", v3, 7, v5);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __42__NFHardwareManager_getHeadlessModeFlags___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  _DWORD *v6;
  id v7;

  v7 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v6 = *(_DWORD **)(a1 + 40);
  if (v6)
  {
    if ((a3 & 1) != 0)
      *v6 |= 1u;
    if ((a3 & 2) != 0)
      **(_DWORD **)(a1 + 40) |= 2u;
  }

}

- (BOOL)getHeadlessFactoryMode:(id *)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  int v8;

  v8 = 0;
  -[NFHardwareManager getHeadlessModeFlags:](self, "getHeadlessModeFlags:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
    *a3 = objc_retainAutorelease(v4);
  v6 = v8 != 0;

  return v6;
}

- (id)disableHeadless
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  _QWORD v10[7];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = _os_activity_create(&dword_19B5EB000, "disableHeadless", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__NFHardwareManager_disableHeadless__block_invoke;
  v10[3] = &unk_1E3B51998;
  v10[5] = &state;
  v10[6] = a2;
  v10[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __36__NFHardwareManager_disableHeadless__block_invoke_81;
  v9[3] = &unk_1E3B51D20;
  v9[4] = &state;
  objc_msgSend(v6, "disableHeadlessMiniNVWithCompletion:", v9);

  v7 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v7;
}

void __36__NFHardwareManager_disableHeadless__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1001, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1001;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __36__NFHardwareManager_disableHeadless__block_invoke_81(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)getPowerCounters:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = _os_activity_create(&dword_19B5EB000, "getPowerCounters:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __38__NFHardwareManager_getPowerCounters___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __38__NFHardwareManager_getPowerCounters___block_invoke_82;
  v11[3] = &unk_1E3B52A20;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  v11[7] = a2;
  objc_msgSend(v8, "getPowerCountersWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __38__NFHardwareManager_getPowerCounters___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1018, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1018;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __38__NFHardwareManager_getPowerCounters___block_invoke_82(uint64_t a1, void *a2, void *a3)
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
  id *v19;
  void *v20;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1022, v6);
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
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 1022;
      v31 = 2114;
      v32 = v6;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a2;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a3;
  }
  objc_storeStrong(v19, v20);

}

- (id)getFlashWriteCounters:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = _os_activity_create(&dword_19B5EB000, "getFlashWriteCounters:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __43__NFHardwareManager_getFlashWriteCounters___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &v13;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __43__NFHardwareManager_getFlashWriteCounters___block_invoke_84;
  v11[3] = &unk_1E3B52A20;
  v11[4] = self;
  v11[5] = &v13;
  v11[6] = &state;
  v11[7] = a2;
  objc_msgSend(v8, "getFlashWriteCountersWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __43__NFHardwareManager_getFlashWriteCounters___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1042, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1042;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __43__NFHardwareManager_getFlashWriteCounters___block_invoke_84(uint64_t a1, void *a2, void *a3)
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
  id *v19;
  void *v20;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1046, v6);
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
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 1046;
      v31 = 2114;
      v32 = v6;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a2;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a3;
  }
  objc_storeStrong(v19, v20);

}

- (id)startSinglePollExpressModeAssertion:(double)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = _os_activity_create(&dword_19B5EB000, "startSinglePollExpressModeAssertion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__NFHardwareManager_startSinglePollExpressModeAssertion___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __57__NFHardwareManager_startSinglePollExpressModeAssertion___block_invoke_85;
  v11[3] = &unk_1E3B51998;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  objc_msgSend(v8, "openSinglePollExpressModeAssertion:completion:", v11, a3);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __57__NFHardwareManager_startSinglePollExpressModeAssertion___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1066, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1066;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __57__NFHardwareManager_startSinglePollExpressModeAssertion___block_invoke_85(uint64_t a1, void *a2)
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
  if (v4)
  {
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1070, v4);
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
      v25 = 1070;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)releaseSinglePollExpressModeAssertion
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[7];
  _QWORD v10[7];
  os_activity_scope_state_s state;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = _os_activity_create(&dword_19B5EB000, "releaseSinglePollExpressModeAssertion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__NFHardwareManager_releaseSinglePollExpressModeAssertion__block_invoke;
  v10[3] = &unk_1E3B51998;
  v10[5] = &state;
  v10[6] = a2;
  v10[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __58__NFHardwareManager_releaseSinglePollExpressModeAssertion__block_invoke_86;
  v9[3] = &unk_1E3B51998;
  v9[5] = &state;
  v9[6] = a2;
  v9[4] = self;
  objc_msgSend(v6, "cancelSinglePollExpressModeAssertionWithCompletion:", v9);

  v7 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v7;
}

void __58__NFHardwareManager_releaseSinglePollExpressModeAssertion__block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1086, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1086;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __58__NFHardwareManager_releaseSinglePollExpressModeAssertion__block_invoke_86(uint64_t a1, void *a2)
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
  if (v4)
  {
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1090, v4);
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
      v25 = 1090;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (void)dumpLPMDebugLog
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[6];
  os_activity_scope_state_s state;

  v4 = _os_activity_create(&dword_19B5EB000, "dumpLPMDebugLog", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  v5 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__NFHardwareManager_dumpLPMDebugLog__block_invoke;
  v8[3] = &unk_1E3B51410;
  v8[4] = self;
  v8[5] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __36__NFHardwareManager_dumpLPMDebugLog__block_invoke_87;
  v7[3] = &unk_1E3B51410;
  v7[4] = self;
  v7[5] = a2;
  objc_msgSend(v6, "dumpLPMDebugLogWithCompletion:", v7);

}

void __36__NFHardwareManager_dumpLPMDebugLog__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1105, v3);
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
    v24 = 1105;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __36__NFHardwareManager_dumpLPMDebugLog__block_invoke_87(uint64_t a1, void *a2)
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
      Name = sel_getName(*(SEL *)(a1 + 40));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1108, v3);
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
      v24 = 1108;
      v25 = 2114;
      v26 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
}

- (unsigned)checkUserBlessing:(id)a3
{
  return -[NFHardwareManager checkUserBlessing:hasCards:](self, "checkUserBlessing:hasCards:", a3, 0);
}

- (unsigned)checkUserBlessing:(id)a3 hasCards:(BOOL *)a4
{
  NSObject *v4;
  os_activity_scope_state_s v6;

  v4 = _os_activity_create(&dword_19B5EB000, "checkUserBlessing:hasCards:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v4, &v6);
  os_activity_scope_leave(&v6);

  return 14;
}

- (unsigned)setBlessedUser:(id)a3 withAuthorization:(id)a4
{
  return -[NFHardwareManager setBlessedUser:keybagUUID:withAuthorization:](self, "setBlessedUser:keybagUUID:withAuthorization:", a3, 0, a4);
}

- (unsigned)setBlessedUser:(id)a3 keybagUUID:(id)a4 withAuthorization:(id)a5
{
  NSObject *v5;
  os_activity_scope_state_s v7;

  v5 = _os_activity_create(&dword_19B5EB000, "setBlessedUser:keybagUUIID:withAuthorization:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  os_activity_scope_leave(&v7);

  return 14;
}

- (NSUUID)blessedUser
{
  NSObject *v2;
  os_activity_scope_state_s v4;

  v2 = _os_activity_create(&dword_19B5EB000, "blessedUser", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return 0;
}

- (void)setAuthorization:(id)a3
{
  NSObject *v3;
  os_activity_scope_state_s v4;

  v3 = _os_activity_create(&dword_19B5EB000, "setAuthorization:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v3, &v4);
  os_activity_scope_leave(&v4);

}

- (BOOL)hasCard
{
  NSObject *v2;
  os_activity_scope_state_s v4;

  v2 = _os_activity_create(&dword_19B5EB000, "hasCard", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v4.opaque[0] = 0;
  v4.opaque[1] = 0;
  os_activity_scope_enter(v2, &v4);
  os_activity_scope_leave(&v4);

  return 0;
}

- (void)registerEventListener:(id)a3
{
  id v4;
  NSObject *v5;
  NFHardwareManager *v6;
  os_activity_scope_state_s v7;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "registerEventListener:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v7.opaque[0] = 0;
  v7.opaque[1] = 0;
  os_activity_scope_enter(v5, &v7);
  os_activity_scope_leave(&v7);

  v6 = self;
  objc_sync_enter(v6);
  -[NFHardwareManager registerForRemoteCallbacks](v6, "registerForRemoteCallbacks");
  -[NSMutableSet addObject:](v6->_eventListeners, "addObject:", v4);

  objc_sync_exit(v6);
}

- (void)unregisterEventListener:(id)a3
{
  id v4;
  NSObject *v5;
  NFHardwareManager *v6;
  unsigned int hwSupport;
  os_activity_scope_state_s v8;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "unregisterEventListener:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v8.opaque[0] = 0;
  v8.opaque[1] = 0;
  os_activity_scope_enter(v5, &v8);
  os_activity_scope_leave(&v8);

  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableSet removeObject:](v6->_eventListeners, "removeObject:", v4);

  if (!-[NSMutableSet count](v6->_eventListeners, "count"))
  {
    hwSupport = v6->_hwSupport;
    if (hwSupport == 4 || hwSupport == 2)
      -[NFHardwareManager unregisterForRemoteCallbacks](v6, "unregisterForRemoteCallbacks");
  }
  objc_sync_exit(v6);

}

- (BOOL)setFieldDetectEnabled:(BOOL)a3
{
  _BOOL8 v3;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  char v10;
  _QWORD v12[7];
  _QWORD v13[6];
  os_activity_scope_state_s state;
  uint64_t v15;
  char v16;

  v3 = a3;
  if (a3)
    v6 = "setFieldDetectEnable:Y";
  else
    v6 = "setFieldDetectEnable:N";
  v7 = _os_activity_create(&dword_19B5EB000, v6, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v15 = 0x2020000000;
  v16 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __43__NFHardwareManager_setFieldDetectEnabled___block_invoke;
  v13[3] = &unk_1E3B51410;
  v13[4] = self;
  v13[5] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __43__NFHardwareManager_setFieldDetectEnabled___block_invoke_88;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  objc_msgSend(v9, "setFieldDetectEnabled:completion:", v3, v12);

  v10 = *(_BYTE *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v10;
}

void __43__NFHardwareManager_setFieldDetectEnabled___block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1253, v3);
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
    v24 = 1253;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __43__NFHardwareManager_setFieldDetectEnabled___block_invoke_88(uint64_t a1, void *a2)
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1256, v3);
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
      v18 = v12;
      v19 = 2082;
      v20 = v13;
      v21 = 2082;
      v22 = v14;
      v23 = 1024;
      v24 = 1256;
      v25 = 2114;
      v26 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

void __44__NFHardwareManager_requestAssertion_error___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1276, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1276;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __44__NFHardwareManager_requestAssertion_error___block_invoke_89(uint64_t a1, void *a2, void *a3)
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
  NFAssertion *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  const char *ClassName;
  const char *Name;
  _QWORD v29[3];
  _QWORD v30[3];
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  int v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
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
      v9(3, "%c[%{public}s %{public}s]:%i %{public}@", v12, ClassName, Name, 1280, v6);
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
      v32 = v15;
      v33 = 2082;
      v34 = v16;
      v35 = 2082;
      v36 = v17;
      v37 = 1024;
      v38 = 1280;
      v39 = 2114;
      v40 = v6;
      _os_log_impl(&dword_19B5EB000, v13, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }
  }
  else
  {
    v18 = [NFAssertion alloc];
    v29[0] = CFSTR("NFAssertionType");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "assertionType"));
    v13 = objc_claimAutoreleasedReturnValue();
    v30[0] = v13;
    v29[1] = CFSTR("NFAssertionPID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "pid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v19;
    v29[2] = CFSTR("NFAssertionTime");
    objc_msgSend(v5, "assertionTime");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[NFAssertion initWithDictionary:](v18, "initWithDictionary:", v21);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v24 = *(void **)(v23 + 40);
    *(_QWORD *)(v23 + 40) = v22;

  }
  v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v26 = *(void **)(v25 + 40);
  *(_QWORD *)(v25 + 40) = v6;

}

- (id)releaseAssertion:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v17[7];
  _QWORD v18[7];
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "releaseAssertion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v7 = objc_alloc(MEMORY[0x1E0DE78B0]);
  v24[0] = CFSTR("NFAssertionType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "assertionType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v8;
  v24[1] = CFSTR("NFAssertionPID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "pid"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  v24[2] = CFSTR("NFAssertionTime");
  objc_msgSend(v5, "assertionTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v7, "initWithDictionary:", v11);

  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __38__NFHardwareManager_releaseAssertion___block_invoke;
  v18[3] = &unk_1E3B51998;
  v18[5] = &state;
  v18[6] = a2;
  v18[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __38__NFHardwareManager_releaseAssertion___block_invoke_100;
  v17[3] = &unk_1E3B51998;
  v17[5] = &state;
  v17[6] = a2;
  v17[4] = self;
  objc_msgSend(v14, "releaseAssertion:completion:", v12, v17);

  v15 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v15;
}

void __38__NFHardwareManager_releaseAssertion___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1313, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1313;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __38__NFHardwareManager_releaseAssertion___block_invoke_100(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1317, v3);
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
      v20 = v12;
      v21 = 2082;
      v22 = v13;
      v23 = 2082;
      v24 = v14;
      v25 = 1024;
      v26 = 1317;
      v27 = 2114;
      v28 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

- (BOOL)triggerDelayedWake:(unsigned __int8)a3
{
  uint64_t v3;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[7];
  _QWORD v11[6];
  os_activity_scope_state_s state;
  uint64_t v13;
  char v14;

  v3 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "triggerDelayedWake:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__NFHardwareManager_triggerDelayedWake___block_invoke;
  v11[3] = &unk_1E3B51410;
  v11[4] = self;
  v11[5] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __40__NFHardwareManager_triggerDelayedWake___block_invoke_101;
  v10[3] = &unk_1E3B51998;
  v10[5] = &state;
  v10[6] = a2;
  v10[4] = self;
  objc_msgSend(v8, "triggerDelayedWake:completion:", v3, v10);

  LOBYTE(v3) = *(_BYTE *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v3;
}

void __40__NFHardwareManager_triggerDelayedWake___block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1336, v3);
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
    v24 = 1336;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __40__NFHardwareManager_triggerDelayedWake___block_invoke_101(uint64_t a1, void *a2)
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1339, v3);
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
      v18 = v12;
      v19 = 2082;
      v20 = v13;
      v21 = 2082;
      v22 = v14;
      v23 = 1024;
      v24 = 1339;
      v25 = 2114;
      v26 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (BOOL)triggerCrash:(unsigned __int16)a3
{
  uint64_t v3;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[7];
  _QWORD v11[6];
  os_activity_scope_state_s state;
  uint64_t v13;
  char v14;

  v3 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "triggerCrash:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __34__NFHardwareManager_triggerCrash___block_invoke;
  v11[3] = &unk_1E3B51410;
  v11[4] = self;
  v11[5] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __34__NFHardwareManager_triggerCrash___block_invoke_102;
  v10[3] = &unk_1E3B51998;
  v10[5] = &state;
  v10[6] = a2;
  v10[4] = self;
  objc_msgSend(v8, "triggerCrash:completion:", v3, v10);

  LOBYTE(v3) = *(_BYTE *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return v3;
}

void __34__NFHardwareManager_triggerCrash___block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1356, v3);
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
    v24 = 1356;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __34__NFHardwareManager_triggerCrash___block_invoke_102(uint64_t a1, void *a2)
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
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1359, v3);
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
      v18 = v12;
      v19 = 2082;
      v20 = v13;
      v21 = 2082;
      v22 = v14;
      v23 = 1024;
      v24 = 1359;
      v25 = 2114;
      v26 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

}

- (id)enableHeadlessTestMode:(unsigned __int16)a3
{
  uint64_t v3;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "enableHeadlessTestMode:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__NFHardwareManager_enableHeadlessTestMode___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __44__NFHardwareManager_enableHeadlessTestMode___block_invoke_103;
  v11[3] = &unk_1E3B51998;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  objc_msgSend(v8, "enableHeadlessTestMode:completion:", v3, v11);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __44__NFHardwareManager_enableHeadlessTestMode___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1378, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1378;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __44__NFHardwareManager_enableHeadlessTestMode___block_invoke_103(uint64_t a1, void *a2)
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
  if (v4)
  {
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1382, v4);
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
      v25 = 1382;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)toggleGPIO:(unsigned __int16)a3
{
  uint64_t v3;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[7];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "toggleGPIO:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__NFHardwareManager_toggleGPIO___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __32__NFHardwareManager_toggleGPIO___block_invoke_104;
  v11[3] = &unk_1E3B51998;
  v11[5] = &state;
  v11[6] = a2;
  v11[4] = self;
  objc_msgSend(v8, "toggleGPIO:completion:", v3, v11);

  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v9;
}

void __32__NFHardwareManager_toggleGPIO___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1397, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1397;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __32__NFHardwareManager_toggleGPIO___block_invoke_104(uint64_t a1, void *a2)
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
  if (v4)
  {
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 1401, v4);
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
      v25 = 1401;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (void)secureElementWithIdentifier:(id)a3 didChangeRestrictedMode:(BOOL)a4
{
  id v7;
  NSObject *callbackQueue;
  id v9;
  _QWORD v10[5];
  id v11;
  SEL v12;
  BOOL v13;

  v7 = a3;
  callbackQueue = self->_callbackQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__NFHardwareManager_secureElementWithIdentifier_didChangeRestrictedMode___block_invoke;
  v10[3] = &unk_1E3B52A98;
  v10[4] = self;
  v11 = v7;
  v12 = a2;
  v13 = a4;
  v9 = v7;
  dispatch_async(callbackQueue, v10);

}

void __73__NFHardwareManager_secureElementWithIdentifier_didChangeRestrictedMode___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const void **v13;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v31 = 0;
  objc_msgSend(v3, "secureElementWithIdentifier:error:", v4, &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31;
  if (v5)
  {
    objc_msgSend(v5, "_setIsInRestrictedMode:", *(unsigned __int8 *)(a1 + 56));
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v8)
    {
      v9 = v8;
      v26 = v6;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v12, "secureElement:didChangeRestrictedMode:", v5, *(unsigned __int8 *)(a1 + 56));
        }
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v9);
      v6 = v26;
    }
  }
  else
  {
    v13 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v15 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v20 = 45;
      if (isMetaClass)
        v20 = 43;
      v15(3, "%c[%{public}s %{public}s]:%i Missing SE for %{public}@ - %{public}@", v20, ClassName, Name, 1456, *(_QWORD *)(a1 + 40), v6);
    }
    dispatch_get_specific(*v13);
    NFSharedLogGetLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(*(id *)(a1 + 32));
      v24 = sel_getName(*(SEL *)(a1 + 48));
      v25 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67110402;
      v34 = v22;
      v35 = 2082;
      v36 = v23;
      v37 = 2082;
      v38 = v24;
      v39 = 1024;
      v40 = 1456;
      v41 = 2114;
      v42 = v25;
      v43 = 2114;
      v44 = v6;
      _os_log_impl(&dword_19B5EB000, v7, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Missing SE for %{public}@ - %{public}@", buf, 0x36u);
    }
  }

  objc_sync_exit(v2);
}

- (void)didChangeRadioState:(BOOL)a3
{
  NSObject *callbackQueue;
  _QWORD v4[5];
  BOOL v5;

  callbackQueue = self->_callbackQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__NFHardwareManager_didChangeRadioState___block_invoke;
  v4[3] = &unk_1E3B51E98;
  v4[4] = self;
  v5 = a3;
  dispatch_async(callbackQueue, v4);
}

void __41__NFHardwareManager_didChangeRadioState___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "didChangeRadioState:", *(unsigned __int8 *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
}

- (void)temperatureChanged:(double)a3
{
  NSObject *callbackQueue;
  _QWORD v4[6];

  callbackQueue = self->_callbackQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__NFHardwareManager_temperatureChanged___block_invoke;
  v4[3] = &unk_1E3B51460;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(callbackQueue, v4);
}

void __40__NFHardwareManager_temperatureChanged___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "temperatureChanged:", *(double *)(a1 + 40), (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_sync_exit(v2);
}

void __45__NFHardwareManager_secureElementsWithError___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1516, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1516;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __45__NFHardwareManager_secureElementsWithError___block_invoke_114(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)cachedEmbeddedSecureElementSerialNumber:(id *)a3
{
  NSObject *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  char v14;
  id v15;
  _QWORD v18[6];
  _QWORD v19[7];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  os_activity_scope_state_s state;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v5 = _os_activity_create(&dword_19B5EB000, "cachedEmbeddedSecureElementSerialNumber", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__6;
  v29 = __Block_byref_object_dispose__6;
  v30 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  v6 = 1;
  v25 = 0;
  v7 = *MEMORY[0x1E0CB28A8];
  v8 = MEMORY[0x1E0C809B0];
  do
  {
    v9 = *(void **)(state.opaque[1] + 40);
    *(_QWORD *)(state.opaque[1] + 40) = 0;

    v19[0] = v8;
    v19[1] = 3221225472;
    v19[2] = __61__NFHardwareManager_cachedEmbeddedSecureElementSerialNumber___block_invoke;
    v19[3] = &unk_1E3B51998;
    v19[5] = &state;
    v19[6] = a2;
    v19[4] = self;
    -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __61__NFHardwareManager_cachedEmbeddedSecureElementSerialNumber___block_invoke_117;
    v18[3] = &unk_1E3B52AE8;
    v18[4] = &state;
    v18[5] = &v20;
    objc_msgSend(v10, "cachedEmbeddedSecureElementSerialNumber:", v18);

    v11 = *(void **)(state.opaque[1] + 40);
    if (!v11)
      break;
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v7) & 1) == 0)
    {

      break;
    }
    v13 = objc_msgSend(*(id *)(state.opaque[1] + 40), "code") == 4097;

    v14 = v6 & v13;
    v6 = 0;
  }
  while ((v14 & 1) != 0);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v15 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&state, 8);
  return v15;
}

void __61__NFHardwareManager_cachedEmbeddedSecureElementSerialNumber___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1558, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1558;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __61__NFHardwareManager_cachedEmbeddedSecureElementSerialNumber___block_invoke_117(uint64_t a1, void *a2, void *a3)
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

- (id)secureElementWithIdentifier:(id)a3
{
  return -[NFHardwareManager secureElementWithIdentifier:error:](self, "secureElementWithIdentifier:error:", a3, 0);
}

- (void)refreshSecureElements
{
  -[NFHardwareManager refreshSecureElementsWithError:](self, "refreshSecureElementsWithError:", 0);
}

- (BOOL)refreshSecureElementsWithError:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NFHardwareManager *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
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
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = _os_activity_create(&dword_19B5EB000, "refreshSecureElementsWithError", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__6;
  v35 = __Block_byref_object_dispose__6;
  v36 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__6;
  v30 = __Block_byref_object_dispose__6;
  v31 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __52__NFHardwareManager_refreshSecureElementsWithError___block_invoke;
  v25[3] = &unk_1E3B51998;
  v25[5] = &state;
  v25[6] = a2;
  v25[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v24[1] = 3221225472;
  v24[2] = __52__NFHardwareManager_refreshSecureElementsWithError___block_invoke_118;
  v24[3] = &unk_1E3B52AC0;
  v24[4] = &v26;
  objc_msgSend(v8, "secureElementsWithCompletion:", v24);

  v9 = self;
  objc_sync_enter(v9);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = (id)v27[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v15, "identifier", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NFHardwareManager secureElementWithIdentifier:error:](v9, "secureElementWithIdentifier:error:", v16, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "_updateSecureElementInfo:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v37, 16);
    }
    while (v12);
  }

  objc_sync_exit(v9);
  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v18 = *(_QWORD *)(state.opaque[1] + 40) == 0;
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&state, 8);
  return v18;
}

void __52__NFHardwareManager_refreshSecureElementsWithError___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1621, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 1621;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __52__NFHardwareManager_refreshSecureElementsWithError___block_invoke_118(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (BOOL)secureElementBootHistory:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[NFSecureElement embeddedSecureElementWithError:](NFSecureElement, "embeddedSecureElementWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bootHistory");
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5 != 0;
}

- (id)hostEmulationLog
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

  v4 = _os_activity_create(&dword_19B5EB000, "hostEmulationLog", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__6;
  v14 = __Block_byref_object_dispose__6;
  v15 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __37__NFHardwareManager_hostEmulationLog__block_invoke;
  v10[3] = &unk_1E3B51410;
  v10[4] = self;
  v10[5] = a2;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __37__NFHardwareManager_hostEmulationLog__block_invoke_119;
  v9[3] = &unk_1E3B52B38;
  v9[4] = &state;
  objc_msgSend(v6, "getHostCardEmulationLogWithCompletion:", v9);

  v7 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v7;
}

void __37__NFHardwareManager_hostEmulationLog__block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 1660, v3);
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
    v24 = 1660;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

}

void __37__NFHardwareManager_hostEmulationLog__block_invoke_119(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id v7;

  v6 = a2;
  if (!a3)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v6 = v7;
  }

}

- (id)_synchronousQueueSessionWithRetry:(id)a3 queueBlock:(id)a4
{
  char *v7;
  id v8;
  void (**v9)(id, void *, _QWORD *);
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t Logger;
  void (*v15)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  const char *Name;
  _QWORD v27[5];
  id v28;
  SEL v29;
  _QWORD v30[5];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  SEL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = &v38;
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD *))a4;
  v10 = 0;
  v39 = 0;
  v40 = &v39;
  v11 = MEMORY[0x1E0C809B0];
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  do
  {
    v12 = v10;
    *v7 = 0;
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __66__NFHardwareManager__synchronousQueueSessionWithRetry_queueBlock___block_invoke;
    v30[3] = &unk_1E3B52B60;
    v32 = &v39;
    v33 = &v35;
    v30[4] = self;
    v34 = a2;
    v13 = v8;
    v31 = v13;
    -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v27[0] = v11;
      v27[1] = 3221225472;
      v27[2] = __66__NFHardwareManager__synchronousQueueSessionWithRetry_queueBlock___block_invoke_122;
      v27[3] = &unk_1E3B52B88;
      v27[4] = self;
      v29 = a2;
      v28 = v13;
      v9[2](v9, v10, v27);

    }
    else
    {
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v15 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v19 = 45;
        if (isMetaClass)
          v19 = 43;
        v15(3, "%c[%{public}s %{public}s]:%i Failed to get interface from XPC connection... rather unexpected.", v19, ClassName, Name, 1715);
      }
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      NFSharedLogGetLogger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = object_getClass(self);
        if (class_isMetaClass(v21))
          v22 = 43;
        else
          v22 = 45;
        v23 = object_getClassName(self);
        v24 = sel_getName(a2);
        *(_DWORD *)buf = 67109890;
        v44 = v22;
        v45 = 2082;
        v46 = v23;
        v47 = 2082;
        v48 = v24;
        v49 = 1024;
        v50 = 1715;
        _os_log_impl(&dword_19B5EB000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to get interface from XPC connection... rather unexpected.", buf, 0x22u);
      }

    }
    v7 = (char *)(v36 + 3);
  }
  while (*((_BYTE *)v36 + 24) && (unint64_t)v40[3] < 3);
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v13;
}

void __66__NFHardwareManager__synchronousQueueSessionWithRetry_queueBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  const char *ClassName;
  const char *v32;
  const char *Name;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  v7 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v4 > 1)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", v18, ClassName, Name, 1689, v3);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(*(id *)(a1 + 32));
      v23 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      v37 = v21;
      v38 = 2082;
      v39 = v22;
      v40 = 2082;
      v41 = v23;
      v42 = 1024;
      v43 = 1689;
      v44 = 2114;
      v45 = v3;
      _os_log_impl(&dword_19B5EB000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", buf, 0x2Cu);
    }

    v24 = *(void **)(a1 + 40);
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 7, v28);
    objc_msgSend(v24, "didStartSession:", v29);

    objc_msgSend(*(id *)(a1 + 40), "resume");
  }
  else
  {
    if (Logger)
    {
      v8 = object_getClass(*(id *)(a1 + 32));
      v9 = class_isMetaClass(v8);
      v30 = object_getClassName(*(id *)(a1 + 32));
      v32 = sel_getName(*(SEL *)(a1 + 64));
      v10 = 45;
      if (v9)
        v10 = 43;
      v7(4, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", v10, v30, v32, 1686, v3);
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
      v15 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      v37 = v13;
      v38 = 2082;
      v39 = v14;
      v40 = 2082;
      v41 = v15;
      v42 = 1024;
      v43 = 1686;
      v44 = 2114;
      v45 = v3;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", buf, 0x2Cu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

void __66__NFHardwareManager__synchronousQueueSessionWithRetry_queueBlock___block_invoke_122(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  const void **v9;
  uint64_t Logger;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  id v20;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (v8)
  {
    v9 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v11 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 48));
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i %{public}@", v14, ClassName, Name, 1700, v8);
    }
    dispatch_get_specific(*v9);
    NFSharedLogGetLogger();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v16))
        v17 = 43;
      else
        v17 = 45;
      v18 = object_getClassName(*(id *)(a1 + 32));
      v19 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 2082;
      v28 = v19;
      v29 = 1024;
      v30 = 1700;
      v31 = 2114;
      v32 = v8;
      _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_msgSend(*(id *)(a1 + 40), "didStartSession:", v8);
  }
  else
  {
    v20 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
    objc_sync_enter(v20);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
    objc_sync_exit(v20);

    objc_msgSend(*(id *)(a1 + 40), "setProxy:", v7);
    objc_msgSend(*(id *)(a1 + 40), "setIsFirstInQueue:", a3);
  }
  objc_msgSend(*(id *)(a1 + 40), "resume");

}

- (id)_sessionAttribute
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  v4 = v3;
  if (self->_type == 1)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E3B68FD0, CFSTR("session.prevent.ui.popup.on.radio.disabled"));
  return v4;
}

- (id)startFieldDetectSession:(id)a3
{
  return -[NFHardwareManager _startFieldDetectSession:completion:](self, "_startFieldDetectSession:completion:", 0, a3);
}

- (id)startUnfilteredFieldDetectSession:(id)a3
{
  return -[NFHardwareManager _startFieldDetectSession:completion:](self, "_startFieldDetectSession:completion:", 1, a3);
}

- (id)_startFieldDetectSession:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  NFFieldDetectSession *v9;
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[7];
  _QWORD v22[9];
  _QWORD v23[5];
  os_activity_scope_state_s state;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  int v36;

  v4 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19B5EB000, "startFieldDetectSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v33 = 0;
  v34 = (int *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__6;
  v27 = __Block_byref_object_dispose__6;
  v28 = 0;
  v9 = objc_alloc_init(NFFieldDetectSession);
  v10 = *(void **)(state.opaque[1] + 40);
  *(_QWORD *)(state.opaque[1] + 40) = v9;

  v20 = v7;
  objc_msgSend(*(id *)(state.opaque[1] + 40), "setDidStartCallback:", v7);
  v11 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke;
  v23[3] = &unk_1E3B52BB0;
  v23[4] = self;
  objc_msgSend(*(id *)(state.opaque[1] + 40), "setDidEndCallback:", v23);
  v12 = v30;
  do
  {
    *((_BYTE *)v12 + 24) = 0;
    -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("session.fd.unfiltered"));

    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke_2;
    v22[3] = &unk_1E3B52BD8;
    v22[4] = self;
    v22[5] = &v33;
    v22[7] = &state;
    v22[8] = a2;
    v22[6] = &v29;
    -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(state.opaque[1] + 40);
    v17 = (void *)objc_msgSend(v13, "copy");
    v21[0] = v11;
    v21[1] = 3221225472;
    v21[2] = __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke_133;
    v21[3] = &unk_1E3B52C00;
    v21[4] = self;
    v21[5] = &state;
    v21[6] = a2;
    objc_msgSend(v15, "queueFieldDetectSession:sessionAttribute:completion:", v16, v17, v21);

    v12 = v30;
  }
  while (*((_BYTE *)v30 + 24) && v34[6] < 3);
  v18 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v18;
}

uint64_t __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const void **v5;
  uint64_t Logger;
  void (*v7)(uint64_t, const char *, ...);
  objc_class *v8;
  _BOOL4 v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const char *v30;
  const char *ClassName;
  const char *v32;
  const char *Name;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v5 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  v7 = (void (*)(uint64_t, const char *, ...))Logger;
  if (v4 > 1)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 64));
      v18 = 45;
      if (isMetaClass)
        v18 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", v18, ClassName, Name, 1767, v3);
    }
    dispatch_get_specific(*v5);
    NFSharedLogGetLogger();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(*(id *)(a1 + 32));
      v23 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      v37 = v21;
      v38 = 2082;
      v39 = v22;
      v40 = 2082;
      v41 = v23;
      v42 = 1024;
      v43 = 1767;
      v44 = 2114;
      v45 = v3;
      _os_log_impl(&dword_19B5EB000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", buf, 0x2Cu);
    }

    v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", v26, 7, v28);
    objc_msgSend(v24, "didStartSession:", v29);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "resume");
  }
  else
  {
    if (Logger)
    {
      v8 = object_getClass(*(id *)(a1 + 32));
      v9 = class_isMetaClass(v8);
      v30 = object_getClassName(*(id *)(a1 + 32));
      v32 = sel_getName(*(SEL *)(a1 + 64));
      v10 = 45;
      if (v9)
        v10 = 43;
      v7(3, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", v10, v30, v32, 1763, v3);
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
      v15 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      v37 = v13;
      v38 = 2082;
      v39 = v14;
      v40 = 2082;
      v41 = v15;
      v42 = 1024;
      v43 = 1763;
      v44 = 2114;
      v45 = v3;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", buf, 0x2Cu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

}

void __57__NFHardwareManager__startFieldDetectSession_completion___block_invoke_133(uint64_t a1, void *a2, void *a3)
{
  id v5;
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
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  objc_sync_enter(v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_sync_exit(v7);

  if (v6)
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
      Name = sel_getName(*(SEL *)(a1 + 48));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 1780, v6);
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
      v18 = sel_getName(*(SEL *)(a1 + 48));
      *(_DWORD *)buf = 67110146;
      v22 = v16;
      v23 = 2082;
      v24 = v17;
      v25 = 2082;
      v26 = v18;
      v27 = 1024;
      v28 = 1780;
      v29 = 2114;
      v30 = v6;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "didStartSession:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setProxy:", v5);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "resume");

}

- (id)startECommercePaymentSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFECommercePaymentSession *v6;
  uint64_t v7;
  NFECommercePaymentSession *v8;
  id v9;
  NFECommercePaymentSession *v10;
  _QWORD v12[4];
  NFECommercePaymentSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startECommercePaymentSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFECommercePaymentSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__NFHardwareManager_startECommercePaymentSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __50__NFHardwareManager_startECommercePaymentSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __50__NFHardwareManager_startECommercePaymentSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __50__NFHardwareManager_startECommercePaymentSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_sessionAttribute");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "queueECommercePaymentSession:sessionAttribute:completion:", v4, v8, v6);

}

- (id)startContactlessPaymentSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFContactlessPaymentSession *v6;
  uint64_t v7;
  NFContactlessPaymentSession *v8;
  id v9;
  NFContactlessPaymentSession *v10;
  _QWORD v12[4];
  NFContactlessPaymentSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startContactlessPaymentSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFContactlessPaymentSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __52__NFHardwareManager_startContactlessPaymentSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __52__NFHardwareManager_startContactlessPaymentSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __52__NFHardwareManager_startContactlessPaymentSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __52__NFHardwareManager_startContactlessPaymentSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  +[NFHardwareManagerInterface interface]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateContactlessInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sessionAttribute");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v6, "queueContactlessPaymentSession:sessionAttribute:completion:", v8, v9, v5);

}

- (id)startContactlessSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFContactlessSession *v6;
  uint64_t v7;
  NFContactlessSession *v8;
  id v9;
  NFContactlessSession *v10;
  _QWORD v12[4];
  NFContactlessSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startContactlessSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFContactlessSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__NFHardwareManager_startContactlessSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __45__NFHardwareManager_startContactlessSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __45__NFHardwareManager_startContactlessSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __45__NFHardwareManager_startContactlessSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_sessionAttribute");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "queueContactlessSession:sessionAttribute:completion:", v4, v8, v6);

}

- (id)startSecureElementManagerSessionWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NFSecureElementManagerSession *v8;
  uint64_t v9;
  NFSecureElementManagerSession *v10;
  id v11;
  id v12;
  void *v13;
  NFSecureElementManagerSession *v14;
  _QWORD v16[4];
  NFSecureElementManagerSession *v17;
  id v18;
  _QWORD v19[5];

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(NFSecureElementManagerSession);
  -[NFSession setDidStartCallback:](v8, "setDidStartCallback:", v7);

  v9 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __79__NFHardwareManager_startSecureElementManagerSessionWithAttributes_completion___block_invoke;
  v19[3] = &unk_1E3B52BB0;
  v19[4] = self;
  -[NFSession setDidEndCallback:](v8, "setDidEndCallback:", v19);
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __79__NFHardwareManager_startSecureElementManagerSessionWithAttributes_completion___block_invoke_2;
  v16[3] = &unk_1E3B52C28;
  v10 = v8;
  v17 = v10;
  v18 = v6;
  v11 = v6;
  v12 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v10, v16);
  v13 = v18;
  v14 = v10;

  return v14;
}

uint64_t __79__NFHardwareManager_startSecureElementManagerSessionWithAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __79__NFHardwareManager_startSecureElementManagerSessionWithAttributes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = a2;
  +[NFHardwareManagerInterface interface]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateSEMInterface:]((uint64_t)NFHardwareManagerInterface, v6);

  objc_msgSend(v7, "queueSecureElementManagerSession:sessionAttribute:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
}

- (id)startSecureElementManagerSessionWithPriority:(BOOL)a3 callback:(id)a4
{
  _BOOL8 v4;
  id v6;
  const char *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  os_activity_scope_state_s v13;

  v4 = a3;
  v6 = a4;
  if (v4)
    v7 = "startSecureElementManagerSessionWithPriority:Y callback:";
  else
    v7 = "startSecureElementManagerSessionWithPriority:N callback:";
  v8 = _os_activity_create(&dword_19B5EB000, v7, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v13.opaque[0] = 0;
  v13.opaque[1] = 0;
  os_activity_scope_enter(v8, &v13);
  os_activity_scope_leave(&v13);

  -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("session.high.priority"));

  -[NFHardwareManager startSecureElementManagerSessionWithAttributes:completion:](self, "startSecureElementManagerSessionWithAttributes:completion:", v9, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)startSecureElementManagerSession:(id)a3
{
  return -[NFHardwareManager startSecureElementManagerSessionWithPriority:callback:](self, "startSecureElementManagerSessionWithPriority:callback:", 0, a3);
}

- (id)startSecureElementManagerSessionWithPriority:(id)a3
{
  return -[NFHardwareManager startSecureElementManagerSessionWithPriority:callback:](self, "startSecureElementManagerSessionWithPriority:callback:", 1, a3);
}

- (id)startLoyaltyAndContactlessPaymentSession:(id)a3
{
  return -[NFHardwareManager _startLoyaltyAndContactlessPaymentSession:force:](self, "_startLoyaltyAndContactlessPaymentSession:force:", a3, 0);
}

- (id)forceLoyaltyAndContactlessPaymentSession:(id)a3
{
  return -[NFHardwareManager _startLoyaltyAndContactlessPaymentSession:force:](self, "_startLoyaltyAndContactlessPaymentSession:force:", a3, 1);
}

- (id)_startLoyaltyAndContactlessPaymentSession:(id)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  const char *v7;
  NSObject *v8;
  NFLoyaltyAndPaymentSession *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NFLoyaltyAndPaymentSession *v13;
  id v14;
  id v15;
  void *v16;
  NFLoyaltyAndPaymentSession *v17;
  _QWORD v19[4];
  NFLoyaltyAndPaymentSession *v20;
  void *v21;
  _QWORD v22[5];
  os_activity_scope_state_s state;

  v4 = a4;
  v6 = a3;
  if (v4)
    v7 = "_startLoyaltyAndContactlessPaymentSession:force:Y";
  else
    v7 = "_startLoyaltyAndContactlessPaymentSession:force:N";
  v8 = _os_activity_create(&dword_19B5EB000, v7, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v9 = objc_alloc_init(NFLoyaltyAndPaymentSession);
  -[NFSession setDidStartCallback:](v9, "setDidStartCallback:", v6);
  v10 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__NFHardwareManager__startLoyaltyAndContactlessPaymentSession_force___block_invoke;
  v22[3] = &unk_1E3B52BB0;
  v22[4] = self;
  -[NFSession setDidEndCallback:](v9, "setDidEndCallback:", v22);
  -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  if (v4)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("session.force.express.exit"));
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __69__NFHardwareManager__startLoyaltyAndContactlessPaymentSession_force___block_invoke_2;
  v19[3] = &unk_1E3B52C28;
  v13 = v9;
  v20 = v13;
  v21 = v12;
  v14 = v12;
  v15 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v13, v19);
  v16 = v21;
  v17 = v13;

  return v17;
}

uint64_t __69__NFHardwareManager__startLoyaltyAndContactlessPaymentSession_force___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __69__NFHardwareManager__startLoyaltyAndContactlessPaymentSession_force___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = a2;
  +[NFHardwareManagerInterface interface]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateContactlessInterface:]((uint64_t)NFHardwareManagerInterface, v6);

  objc_msgSend(v7, "queueLoyaltyAndPaymentSession:sessionAttribute:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
}

- (id)startDigitalCarKeySession:(id)a3
{
  id v4;
  NSObject *v5;
  NFDigitalCarKeySession *v6;
  uint64_t v7;
  NFDigitalCarKeySession *v8;
  id v9;
  NFDigitalCarKeySession *v10;
  _QWORD v12[4];
  NFDigitalCarKeySession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startDigitalCarKeySession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFDigitalCarKeySession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__NFHardwareManager_startDigitalCarKeySession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __47__NFHardwareManager_startDigitalCarKeySession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __47__NFHardwareManager_startDigitalCarKeySession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __47__NFHardwareManager_startDigitalCarKeySession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  +[NFHardwareManagerInterface interface]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateContactlessInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sessionAttribute");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v6, "queueLoyaltyAndPaymentSession:sessionAttribute:completion:", v8, v9, v5);

}

- (id)startReaderSession:(id)a3
{
  return -[NFHardwareManager startReaderSessionWithAttributes:completion:](self, "startReaderSessionWithAttributes:completion:", &unk_1E3B69440, a3);
}

- (id)startReaderSessionWithActionSheetUI:(id)a3
{
  return -[NFHardwareManager startReaderSessionWithAttributes:completion:](self, "startReaderSessionWithAttributes:completion:", &unk_1E3B69468, a3);
}

- (id)startReaderSessionWithAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned int v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  NFReaderSession *v13;
  uint64_t v14;
  NFReaderSession *v15;
  id v16;
  NFReaderSession *v17;
  _QWORD v19[4];
  NFReaderSession *v20;
  void *v21;
  _QWORD v22[5];
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("session.show.corenfc.ui"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  if ((v9 & 1) != 0)
    v10 = "_startReaderSessionWithUI:CoreNFC callback:";
  else
    v10 = "_startReaderSessionWithUI:None callback:";
  v11 = _os_activity_create(&dword_19B5EB000, v10, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v12, "addEntriesFromDictionary:", v6);
  v13 = -[NFReaderSession initWithUIType:]([NFReaderSession alloc], "initWithUIType:", v9);
  -[NFSession setDidStartCallback:](v13, "setDidStartCallback:", v7);

  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __65__NFHardwareManager_startReaderSessionWithAttributes_completion___block_invoke;
  v22[3] = &unk_1E3B52BB0;
  v22[4] = self;
  -[NFSession setDidEndCallback:](v13, "setDidEndCallback:", v22);
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __65__NFHardwareManager_startReaderSessionWithAttributes_completion___block_invoke_2;
  v19[3] = &unk_1E3B52C28;
  v15 = v13;
  v20 = v15;
  v21 = v12;
  v16 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v15, v19);
  v17 = v15;

  return v17;
}

uint64_t __65__NFHardwareManager_startReaderSessionWithAttributes_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __65__NFHardwareManager_startReaderSessionWithAttributes_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = a2;
  +[NFHardwareManagerInterface interface]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateReaderInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  v8 = *(_QWORD *)(a1 + 32);
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v6, "queueReaderSessionInternal:sessionAttribute:completion:", v8, v9, v5);

}

- (id)startSesHatSession:(id)a3
{
  id v5;
  NSObject *v6;
  NFSeshatSession *v7;
  void *v8;
  const void **v9;
  uint64_t *v10;
  uint64_t v11;
  NFSeshatSession *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NFSeshatSession *v17;
  NSObject *v18;
  dispatch_time_t v19;
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
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NFSeshatSession *v38;
  const char *Name;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  dispatch_semaphore_t v45;
  NFSeshatSession *v46;
  _QWORD v47[5];
  NFSeshatSession *v48;
  NSObject *v49;
  os_activity_scope_state_s *v50;
  SEL v51;
  _QWORD v52[5];
  NFSeshatSession *v53;
  NSObject *v54;
  os_activity_scope_state_s *p_state;
  uint64_t *v56;
  uint64_t *v57;
  SEL v58;
  _QWORD v59[5];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  int *v65;
  uint64_t v66;
  int v67;
  os_activity_scope_state_s state;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  id v72;
  _QWORD v73[4];
  _QWORD v74[4];
  uint8_t buf[4];
  int v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  const char *v80;
  __int16 v81;
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _os_activity_create(&dword_19B5EB000, "startSesHatSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v69 = 0x3032000000;
  v70 = __Block_byref_object_copy__6;
  v71 = __Block_byref_object_dispose__6;
  v72 = 0;
  v64 = 0;
  v65 = (int *)&v64;
  v66 = 0x2020000000;
  v67 = 0;
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v7 = objc_alloc_init(NFSeshatSession);
  v41 = v5;
  -[NFSession setDidStartCallback:](v7, "setDidStartCallback:", v5);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __40__NFHardwareManager_startSesHatSession___block_invoke;
  v59[3] = &unk_1E3B52BB0;
  v59[4] = self;
  v46 = v7;
  -[NFSession setDidEndCallback:](v7, "setDidEndCallback:", v59);
  v45 = dispatch_semaphore_create(0);
  +[NFHardwareManagerInterface interface]();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateSeshatInterface:]((uint64_t)NFHardwareManagerInterface, v8);

  v42 = *MEMORY[0x1E0CB2938];
  v43 = *MEMORY[0x1E0CB2D50];
  v9 = (const void **)MEMORY[0x1E0DE7900];
  v10 = v61;
  while (1)
  {
    *((_BYTE *)v10 + 24) = 0;
    v11 = MEMORY[0x1E0C809B0];
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __40__NFHardwareManager_startSesHatSession___block_invoke_2;
    v52[3] = &unk_1E3B52C50;
    v52[4] = self;
    p_state = &state;
    v56 = &v64;
    v57 = &v60;
    v58 = a2;
    v12 = v46;
    v53 = v12;
    v13 = v45;
    v54 = v13;
    -[NFHardwareManager remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v52);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");
    v47[0] = v11;
    v47[1] = 3221225472;
    v47[2] = __40__NFHardwareManager_startSesHatSession___block_invoke_163;
    v47[3] = &unk_1E3B52C78;
    v47[4] = self;
    v17 = v12;
    v50 = &state;
    v51 = a2;
    v48 = v17;
    v18 = v13;
    v49 = v18;
    objc_msgSend(v14, "queueSeshatSession:sessionAttribute:completion:", v17, v16, v47);

    v19 = dispatch_time(0, 10000000000);
    v44 = v18;
    if (dispatch_semaphore_wait(v18, v19))
      break;

    v10 = v61;
    if (!*((_BYTE *)v61 + 24) || v65[6] >= 3)
      goto LABEL_15;
  }
  dispatch_get_specific(*v9);
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
    v21(3, "%c[%{public}s %{public}s]:%i Failed to talk to proxy!!!", v25, ClassName, Name, 2046);
  }
  dispatch_get_specific(*v9);
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
    v76 = v28;
    v77 = 2082;
    v78 = v29;
    v79 = 2082;
    v80 = v30;
    v81 = 1024;
    v82 = 2046;
    _os_log_impl(&dword_19B5EB000, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to talk to proxy!!!", buf, 0x22u);
  }

  v31 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = v43;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v33;
  v74[1] = &unk_1E3B69018;
  v73[1] = CFSTR("Line");
  v73[2] = CFSTR("Method");
  v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(a2));
  v74[2] = v34;
  v73[3] = v42;
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 2047);
  v74[3] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v31, "initWithDomain:code:userInfo:", v32, 7, v36);
  -[NFSession didStartSession:](v17, "didStartSession:", v37);

  -[NFSession resume](v17, "resume");
  -[NFHardwareManager invalidateConnection](self, "invalidateConnection");

LABEL_15:
  v38 = v17;

  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);
  _Block_object_dispose(&state, 8);

  return v38;
}

uint64_t __40__NFHardwareManager_startSesHatSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __40__NFHardwareManager_startSesHatSession___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void **v14;
  uint64_t Logger;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *v17;
  _BOOL4 v18;
  uint64_t v19;
  NSObject *v20;
  objc_class *v21;
  int v22;
  const char *v23;
  const char *v24;
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v27;
  NSObject *v28;
  objc_class *v29;
  int v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *ClassName;
  const char *v35;
  const char *Name;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  id v46;
  _QWORD v47[5];
  _QWORD v48[6];

  v48[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "XPC Error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB3388];
  v48[0] = v6;
  v48[1] = v3;
  v47[1] = v7;
  v47[2] = CFSTR("Line");
  v48[2] = &unk_1E3B68FE8;
  v47[3] = CFSTR("Method");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 80)));
  v48[3] = v8;
  v47[4] = *MEMORY[0x1E0CB2938];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 80)), 2007);
  v48[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "initWithDomain:code:userInfo:", v5, 7, v10);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  LODWORD(v6) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  v14 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  v16 = (void (*)(uint64_t, const char *, ...))Logger;
  if ((int)v6 > 1)
  {
    if (Logger)
    {
      Class = object_getClass(*(id *)(a1 + 32));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 32));
      Name = sel_getName(*(SEL *)(a1 + 80));
      v27 = 45;
      if (isMetaClass)
        v27 = 43;
      v16(3, "%c[%{public}s %{public}s]:%i %{public}@", v27, ClassName, Name, 2013, v3);
    }
    dispatch_get_specific(*v14);
    NFSharedLogGetLogger();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v29))
        v30 = 43;
      else
        v30 = 45;
      v31 = object_getClassName(*(id *)(a1 + 32));
      v32 = sel_getName(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 67110146;
      v38 = v30;
      v39 = 2082;
      v40 = v31;
      v41 = 2082;
      v42 = v32;
      v43 = 1024;
      v44 = 2013;
      v45 = 2114;
      v46 = v3;
      _os_log_impl(&dword_19B5EB000, v28, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_msgSend(*(id *)(a1 + 40), "didStartSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    objc_msgSend(*(id *)(a1 + 40), "resume");
    objc_msgSend(*(id *)(a1 + 32), "invalidateConnection");
  }
  else
  {
    if (Logger)
    {
      v17 = object_getClass(*(id *)(a1 + 32));
      v18 = class_isMetaClass(v17);
      v33 = object_getClassName(*(id *)(a1 + 32));
      v35 = sel_getName(*(SEL *)(a1 + 80));
      v19 = 45;
      if (v18)
        v19 = 43;
      v16(3, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", v19, v33, v35, 2009, v3);
    }
    dispatch_get_specific(*v14);
    NFSharedLogGetLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = object_getClass(*(id *)(a1 + 32));
      if (class_isMetaClass(v21))
        v22 = 43;
      else
        v22 = 45;
      v23 = object_getClassName(*(id *)(a1 + 32));
      v24 = sel_getName(*(SEL *)(a1 + 80));
      *(_DWORD *)buf = 67110146;
      v38 = v22;
      v39 = 2082;
      v40 = v23;
      v41 = 2082;
      v42 = v24;
      v43 = 1024;
      v44 = 2009;
      v45 = 2114;
      v46 = v3;
      _os_log_impl(&dword_19B5EB000, v20, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Retrying xpc connection - proxy error: %{public}@", buf, 0x2Cu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  }
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __40__NFHardwareManager_startSesHatSession___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id v5;
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
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *ClassName;
  const char *Name;
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  objc_sync_enter(v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v7);

  if (v6)
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
      Name = sel_getName(*(SEL *)(a1 + 64));
      v13 = 45;
      if (isMetaClass)
        v13 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 2029, v6);
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
      v18 = sel_getName(*(SEL *)(a1 + 64));
      *(_DWORD *)buf = 67110146;
      v37 = v16;
      v38 = 2082;
      v39 = v17;
      v40 = 2082;
      v41 = v18;
      v42 = 1024;
      v43 = 2029;
      v44 = 2114;
      v45 = v6;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v6, "code");
    v34[0] = *MEMORY[0x1E0CB2D50];
    v22 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v6, "code") > 70)
      v23 = 71;
    else
      v23 = objc_msgSend(v6, "code");
    objc_msgSend(v22, "stringWithUTF8String:", NFResultCodeString_1[v23]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *MEMORY[0x1E0CB3388];
    v35[0] = v24;
    v35[1] = v6;
    v34[1] = v25;
    v34[2] = CFSTR("Line");
    v35[2] = &unk_1E3B69000;
    v34[3] = CFSTR("Method");
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 64)));
    v35[3] = v26;
    v34[4] = *MEMORY[0x1E0CB2938];
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 64)), 2030);
    v35[4] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, v21, v28);
    v30 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v31 = *(void **)(v30 + 40);
    *(_QWORD *)(v30 + 40) = v29;

    objc_msgSend(*(id *)(a1 + 40), "didStartSession:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setProxy:", v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "resume");
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

- (BOOL)preWarm
{
  return -[NFHardwareManager preWarm:](self, "preWarm:", 0);
}

- (BOOL)preWarm:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[8];
  _QWORD v12[7];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v6 = _os_activity_create(&dword_19B5EB000, "preWarm:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __29__NFHardwareManager_preWarm___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __29__NFHardwareManager_preWarm___block_invoke_169;
  v11[3] = &unk_1E3B517E0;
  v11[4] = self;
  v11[5] = &v18;
  v11[6] = &state;
  v11[7] = a2;
  objc_msgSend(v8, "preWarmWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease(*(id *)(state.opaque[1] + 40));
  v9 = *((_BYTE *)v19 + 24);
  _Block_object_dispose(&state, 8);

  _Block_object_dispose(&v18, 8);
  return v9;
}

void __29__NFHardwareManager_preWarm___block_invoke(uint64_t a1, void *a2)
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2075, v3);
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
    v36 = 2075;
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
  v28[2] = &unk_1E3B69030;
  v27[3] = CFSTR("Method");
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 48)));
  v28[3] = v19;
  v27[4] = *MEMORY[0x1E0CB2938];
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 48)), 2076);
  v28[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, 7, v21);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v22;

  objc_msgSend(*(id *)(a1 + 32), "invalidateConnection");
}

void __29__NFHardwareManager_preWarm___block_invoke_169(uint64_t a1, void *a2)
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
      Name = sel_getName(*(SEL *)(a1 + 56));
      v9 = 45;
      if (isMetaClass)
        v9 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2084, v3);
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
      v33 = v12;
      v34 = 2082;
      v35 = v13;
      v36 = 2082;
      v37 = v14;
      v38 = 1024;
      v39 = 2084;
      v40 = 2114;
      v41 = v3;
      _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
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
    objc_msgSend(v18, "stringWithUTF8String:", NFResultCodeString_1[v19]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0CB3388];
    v31[0] = v20;
    v31[1] = v3;
    v30[1] = v21;
    v30[2] = CFSTR("Line");
    v31[2] = &unk_1E3B69048;
    v30[3] = CFSTR("Method");
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), sel_getName(*(SEL *)(a1 + 56)));
    v31[3] = v22;
    v30[4] = *MEMORY[0x1E0CB2938];
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s:%d"), sel_getName(*(SEL *)(a1 + 56)), 2085);
    v31[4] = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v15, "initWithDomain:code:userInfo:", v16, v17, v24);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v27 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 109) = 1;
  }

}

- (id)startTrustSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFTrustSession *v6;
  uint64_t v7;
  NFTrustSession *v8;
  id v9;
  NFTrustSession *v10;
  _QWORD v12[4];
  NFTrustSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startTrustSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFTrustSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __39__NFHardwareManager_startTrustSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __39__NFHardwareManager_startTrustSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __39__NFHardwareManager_startTrustSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __39__NFHardwareManager_startTrustSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_sessionAttribute");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "queueTrustSession:sessionAttribute:completion:", v4, v8, v6);

}

- (id)startSecureElementLoggingSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFSecureElementLoggingSession *v6;
  uint64_t v7;
  NFSecureElementLoggingSession *v8;
  id v9;
  NFSecureElementLoggingSession *v10;
  _QWORD v12[4];
  NFSecureElementLoggingSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startSecureElementLoggingSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFSecureElementLoggingSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__NFHardwareManager_startSecureElementLoggingSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __54__NFHardwareManager_startSecureElementLoggingSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __54__NFHardwareManager_startSecureElementLoggingSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __54__NFHardwareManager_startSecureElementLoggingSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_sessionAttribute");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "queueSecureElementLoggingSession:sessionAttribute:completion:", v4, v8, v6);

}

- (id)startPeerPaymentSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFPeerPaymentSession *v6;
  uint64_t v7;
  NFPeerPaymentSession *v8;
  id v9;
  NFPeerPaymentSession *v10;
  _QWORD v12[4];
  NFPeerPaymentSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startPeerPaymentSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFPeerPaymentSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__NFHardwareManager_startPeerPaymentSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __45__NFHardwareManager_startPeerPaymentSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __45__NFHardwareManager_startPeerPaymentSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __45__NFHardwareManager_startPeerPaymentSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_sessionAttribute");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "queuePeerPaymentSession:sessionAttribute:completion:", v4, v8, v6);

}

- (id)startNdefTagSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFNdefTagSession *v6;
  uint64_t v7;
  NFNdefTagSession *v8;
  id v9;
  NFNdefTagSession *v10;
  _QWORD v12[4];
  NFNdefTagSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startNdefTagSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFNdefTagSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __41__NFHardwareManager_startNdefTagSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __41__NFHardwareManager_startNdefTagSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __41__NFHardwareManager_startNdefTagSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __41__NFHardwareManager_startNdefTagSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_sessionAttribute");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "queueNdefTagSession:sessionAttribute:data:completion:", v4, v8, 0, v6);

}

- (id)startNdefTagSessionWithBluetoothLESecureOOBData:(id)a3 callback:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  NFNdefTagSession *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NFNdefTagSession *v17;
  const void **v18;
  uint64_t Logger;
  void (*v20)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  uint64_t v23;
  NSObject *v24;
  objc_class *v25;
  int v26;
  const char *v27;
  const char *v28;
  NFNdefTagSession *v29;
  NFNdefTagSession *v30;
  id v31;
  NFNdefTagSession *v32;
  const char *ClassName;
  const char *Name;
  _QWORD v36[4];
  NFNdefTagSession *v37;
  NFHardwareManager *v38;
  id v39;
  _QWORD v40[5];
  _BYTE state[18];
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  NFNdefTagSession *v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = _os_activity_create(&dword_19B5EB000, "startNdefTagSessionWithBluetoothLESecureOOBData:callback:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v9, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v10 = objc_alloc_init(NFNdefTagSession);
  -[NFSession setDidStartCallback:](v10, "setDidStartCallback:", v7);

  v11 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __78__NFHardwareManager_startNdefTagSessionWithBluetoothLESecureOOBData_callback___block_invoke;
  v40[3] = &unk_1E3B52BB0;
  v40[4] = self;
  -[NFSession setDidEndCallback:](v10, "setDidEndCallback:", v40);
  +[NFNdefTagSession generateBluetoothLESecureNdefPayloadWithOOBData:](NFNdefTagSession, "generateBluetoothLESecureNdefPayloadWithOOBData:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8 || v12)
  {
    v36[0] = v11;
    v36[1] = 3221225472;
    v36[2] = __78__NFHardwareManager_startNdefTagSessionWithBluetoothLESecureOOBData_callback___block_invoke_176;
    v36[3] = &unk_1E3B52CA0;
    v30 = v10;
    v37 = v30;
    v38 = self;
    v39 = v12;
    v31 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v30, v36);
    v32 = v30;

    v17 = v37;
  }
  else
  {
    v13 = objc_alloc(MEMORY[0x1E0CB35C8]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nfcd");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Invalid Parameter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (NFNdefTagSession *)objc_msgSend(v13, "initWithDomain:code:userInfo:", v14, 10, v16);

    v18 = (const void **)MEMORY[0x1E0DE7900];
    dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
    Logger = NFLogGetLogger();
    if (Logger)
    {
      v20 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      v23 = 45;
      if (isMetaClass)
        v23 = 43;
      v20(3, "%c[%{public}s %{public}s]:%i Invalid oobdata: %{public}@", v23, ClassName, Name, 2172, v17);
    }
    dispatch_get_specific(*v18);
    NFSharedLogGetLogger();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = object_getClass(self);
      if (class_isMetaClass(v25))
        v26 = 43;
      else
        v26 = 45;
      v27 = object_getClassName(self);
      v28 = sel_getName(a2);
      *(_DWORD *)state = 67110146;
      *(_DWORD *)&state[4] = v26;
      *(_WORD *)&state[8] = 2082;
      *(_QWORD *)&state[10] = v27;
      v42 = 2082;
      v43 = v28;
      v44 = 1024;
      v45 = 2172;
      v46 = 2114;
      v47 = v17;
      _os_log_impl(&dword_19B5EB000, v24, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Invalid oobdata: %{public}@", state, 0x2Cu);
    }

    -[NFSession didStartSession:](v10, "didStartSession:", v17);
    -[NFSession resume](v10, "resume");
    v29 = v10;
  }

  return v10;
}

uint64_t __78__NFHardwareManager_startNdefTagSessionWithBluetoothLESecureOOBData_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __78__NFHardwareManager_startNdefTagSessionWithBluetoothLESecureOOBData_callback___block_invoke_176(_QWORD *a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "_sessionAttribute");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v8, "queueNdefTagSession:sessionAttribute:data:completion:", v5, v9, a1[6], v7);

}

- (id)startHCESession:(id)a3
{
  return -[NFHardwareManager startHCESessionWithConfiguration:completion:](self, "startHCESessionWithConfiguration:completion:", MEMORY[0x1E0C9AA70], a3);
}

- (id)startHCESessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NFHCESession *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NFHCESession *v37;
  id v38;
  id v39;
  void *v40;
  NFHCESession *v41;
  _QWORD v43[4];
  NFHCESession *v44;
  void *v45;
  _QWORD v46[5];
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19B5EB000, "startHCESessionWithConfiguration:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v9 = objc_alloc_init(NFHCESession);
  -[NFSession setDidStartCallback:](v9, "setDidStartCallback:", v7);

  v10 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __65__NFHardwareManager_startHCESessionWithConfiguration_completion___block_invoke;
  v46[3] = &unk_1E3B52BB0;
  v46[4] = self;
  -[NFSession setDidEndCallback:](v9, "setDidEndCallback:", v46);
  -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "NF_arrayForKey:", CFSTR("StartOnECP"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("StartOnECP"));
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("EmulationOnSessionStart"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmulationOnSessionStart"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("EmulationOnSessionStart"));

  }
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("ReadOnReaderConnected"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReadOnReaderConnected"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("ReadOnReaderConnected"));

  }
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("SuspendOnDisconnect"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SuspendOnDisconnect"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v18, CFSTR("SuspendOnDisconnect"));

  }
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("BackgroundTagReadingECP"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("BackgroundTagReadingECP"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v20, CFSTR("BackgroundTagReadingECP"));

  }
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("ListenOnAllField"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ListenOnAllField"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v22, CFSTR("ListenOnAllField"));

  }
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("FDRestartOnMatchingECPTermInfo"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FDRestartOnMatchingECPTermInfo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v24, CFSTR("FDRestartOnMatchingECPTermInfo"));

  }
  objc_msgSend(v6, "NF_dataForKey:", CFSTR("ECPBroadcast"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ECPBroadcast"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("ECPBroadcast"));

  }
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("ECPBroadcastInterval"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ECPBroadcastInterval"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v28, CFSTR("ECPBroadcastInterval"));

  }
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("ECPBroadcastPollDuration"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ECPBroadcastPollDuration"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, CFSTR("ECPBroadcastPollDuration"));

  }
  objc_msgSend(v6, "NF_arrayForKey:", CFSTR("ECPBroadcastFieldMatch"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ECPBroadcastFieldMatch"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, CFSTR("ECPBroadcastFieldMatch"));

  }
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("disableAutostartOnField"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("disableAutostartOnField"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v34, CFSTR("disableAutostartOnField"));

  }
  objc_msgSend(v6, "NF_dataForKey:", CFSTR("bkgTagReadECPOverride"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("bkgTagReadECPOverride"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v36, CFSTR("bkgTagReadECPOverride"));

  }
  v43[0] = v10;
  v43[1] = 3221225472;
  v43[2] = __65__NFHardwareManager_startHCESessionWithConfiguration_completion___block_invoke_2;
  v43[3] = &unk_1E3B52C28;
  v37 = v9;
  v44 = v37;
  v45 = v11;
  v38 = v11;
  v39 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v37, v43);
  v40 = v45;
  v41 = v37;

  return v41;
}

uint64_t __65__NFHardwareManager_startHCESessionWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

uint64_t __65__NFHardwareManager_startHCESessionWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queueHostEmulationSession:sessionAttribute:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (id)startSecureElementAndHCESession:(id)a3
{
  return -[NFHardwareManager startSecureElementAndHCESessionWithConfiguration:completion:](self, "startSecureElementAndHCESessionWithConfiguration:completion:", MEMORY[0x1E0C9AA70], a3);
}

- (id)startSecureElementAndHCESessionWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NFSecureElementAndHostCardEmulationSession *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NFSecureElementAndHostCardEmulationSession *v14;
  id v15;
  id v16;
  void *v17;
  NFSecureElementAndHostCardEmulationSession *v18;
  _QWORD v20[4];
  NFSecureElementAndHostCardEmulationSession *v21;
  void *v22;
  _QWORD v23[5];
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19B5EB000, "startSecureElementAndHCESessionWithConfiguration:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v9 = objc_alloc_init(NFSecureElementAndHostCardEmulationSession);
  -[NFSession setDidStartCallback:](v9, "setDidStartCallback:", v7);

  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__NFHardwareManager_startSecureElementAndHCESessionWithConfiguration_completion___block_invoke;
  v23[3] = &unk_1E3B52BB0;
  v23[4] = self;
  -[NFSession setDidEndCallback:](v9, "setDidEndCallback:", v23);
  -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "NF_numberForKey:", CFSTR("EmulationOnSessionStart"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EmulationOnSessionStart"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("EmulationOnSessionStart"));

  }
  v20[0] = v10;
  v20[1] = 3221225472;
  v20[2] = __81__NFHardwareManager_startSecureElementAndHCESessionWithConfiguration_completion___block_invoke_2;
  v20[3] = &unk_1E3B52C28;
  v14 = v9;
  v21 = v14;
  v22 = v11;
  v15 = v11;
  v16 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v14, v20);
  v17 = v22;
  v18 = v14;

  return v18;
}

uint64_t __81__NFHardwareManager_startSecureElementAndHCESessionWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

uint64_t __81__NFHardwareManager_startSecureElementAndHCESessionWithConfiguration_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "queueSecureElementAndHostEmulationSession:sessionAttribute:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3);
}

- (id)startSecureElementReaderSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFSecureElementReaderSession *v6;
  uint64_t v7;
  NFSecureElementReaderSession *v8;
  id v9;
  NFSecureElementReaderSession *v10;
  _QWORD v12[4];
  NFSecureElementReaderSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startSecureElementReaderSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFSecureElementReaderSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __53__NFHardwareManager_startSecureElementReaderSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __53__NFHardwareManager_startSecureElementReaderSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __53__NFHardwareManager_startSecureElementReaderSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __53__NFHardwareManager_startSecureElementReaderSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_sessionAttribute");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "queueSecureElementReaderSession:sessionAttribute:completion:", v4, v8, v6);

}

- (id)startSecureTransactionServicesSessionWithRole:(unint64_t)a3 connectionHandoverCofig:(unint64_t)a4 completion:(id)a5
{
  id v8;
  NSObject *v9;
  NFSecureTransactionServicesHandoverSession *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  NFSecureTransactionServicesHandoverSession *v19;
  id v20;
  id v21;
  void *v22;
  NFSecureTransactionServicesHandoverSession *v23;
  _QWORD v25[4];
  NFSecureTransactionServicesHandoverSession *v26;
  void *v27;
  _QWORD v28[5];
  os_activity_scope_state_s state;

  v8 = a5;
  v9 = _os_activity_create(&dword_19B5EB000, "startSecureTransactionServicesSessionWithRole:connectionHandoverCofig:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  v10 = objc_alloc_init(NFSecureTransactionServicesHandoverSession);
  -[NFSession setDidStartCallback:](v10, "setDidStartCallback:", v8);

  v11 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __102__NFHardwareManager_startSecureTransactionServicesSessionWithRole_connectionHandoverCofig_completion___block_invoke;
  v28[3] = &unk_1E3B52BB0;
  v28[4] = self;
  -[NFSession setDidEndCallback:](v10, "setDidEndCallback:", v28);
  v13 = 2 * (a4 & 1);
  if ((a4 & 2) != 0)
  {
    switch(a3)
    {
      case 0uLL:
        v14 = 0;
        v13 |= 4uLL;
        break;
      case 1uLL:
        v13 |= 0xCuLL;
        goto LABEL_12;
      case 2uLL:
        goto LABEL_9;
      case 3uLL:
        goto LABEL_10;
      default:
        goto LABEL_8;
    }
  }
  else if (v12)
  {
LABEL_10:
    v14 = 4;
  }
  else if (a3 == 2)
  {
LABEL_9:
    v14 = 3;
  }
  else if (a3 == 1)
  {
LABEL_12:
    v14 = 1;
  }
  else
  {
LABEL_8:
    v14 = 0;
  }
  v15 = (a4 >> 1) & 0x1C | (a4 >> 2) & 1 | v13;
  -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, CFSTR("session.sts.handover.role"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("session.sts.handover.type"));

  v25[0] = v11;
  v25[1] = 3221225472;
  v25[2] = __102__NFHardwareManager_startSecureTransactionServicesSessionWithRole_connectionHandoverCofig_completion___block_invoke_2;
  v25[3] = &unk_1E3B52C28;
  v19 = v10;
  v26 = v19;
  v27 = v16;
  v20 = v16;
  v21 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v19, v25);
  v22 = v27;
  v23 = v19;

  return v23;
}

uint64_t __102__NFHardwareManager_startSecureTransactionServicesSessionWithRole_connectionHandoverCofig_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __102__NFHardwareManager_startSecureTransactionServicesSessionWithRole_connectionHandoverCofig_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = a2;
  +[NFHardwareManagerInterface interface]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateHandoverInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  v8 = *(_QWORD *)(a1 + 32);
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v6, "queueSecureTransactionServicesSession:sessionAttribute:completion:", v8, v9, v5);

}

- (id)startHandoverHybridSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NFSecureTransactionServicesHandoverHybridSession *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NFSecureTransactionServicesHandoverHybridSession *v11;
  id v12;
  id v13;
  void *v14;
  NFSecureTransactionServicesHandoverHybridSession *v15;
  _QWORD v17[4];
  NFSecureTransactionServicesHandoverHybridSession *v18;
  void *v19;
  _QWORD v20[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startHandoverHybridSessionWithCompletion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFSecureTransactionServicesHandoverHybridSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __62__NFHardwareManager_startHandoverHybridSessionWithCompletion___block_invoke;
  v20[3] = &unk_1E3B52BB0;
  v20[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v20);
  -[NFHardwareManager _sessionAttribute](self, "_sessionAttribute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("session.sts.handover.role"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("session.sts.handover.type"));

  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __62__NFHardwareManager_startHandoverHybridSessionWithCompletion___block_invoke_2;
  v17[3] = &unk_1E3B52C28;
  v11 = v6;
  v18 = v11;
  v19 = v8;
  v12 = v8;
  v13 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v11, v17);
  v14 = v19;
  v15 = v11;

  return v15;
}

uint64_t __62__NFHardwareManager_startHandoverHybridSessionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __62__NFHardwareManager_startHandoverHybridSessionWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  v6 = a2;
  +[NFHardwareManagerInterface interface]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateHandoverInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  v8 = *(_QWORD *)(a1 + 32);
  v9 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(v6, "queueSecureTransactionServicesHybridSession:sessionAttribute:completion:", v8, v9, v5);

}

- (id)startUnifiedAccessSession:(id)a3
{
  id v4;
  NSObject *v5;
  NFUnifiedAccessSession *v6;
  uint64_t v7;
  NFUnifiedAccessSession *v8;
  id v9;
  NFUnifiedAccessSession *v10;
  _QWORD v12[4];
  NFUnifiedAccessSession *v13;
  NFHardwareManager *v14;
  _QWORD v15[5];
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_19B5EB000, "startUnifiedAccessSession:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v6 = objc_alloc_init(NFUnifiedAccessSession);
  -[NFSession setDidStartCallback:](v6, "setDidStartCallback:", v4);

  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __47__NFHardwareManager_startUnifiedAccessSession___block_invoke;
  v15[3] = &unk_1E3B52BB0;
  v15[4] = self;
  -[NFSession setDidEndCallback:](v6, "setDidEndCallback:", v15);
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __47__NFHardwareManager_startUnifiedAccessSession___block_invoke_2;
  v12[3] = &unk_1E3B52C28;
  v8 = v6;
  v13 = v8;
  v14 = self;
  v9 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v8, v12);
  v10 = v8;

  return v10;
}

uint64_t __47__NFHardwareManager_startUnifiedAccessSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __47__NFHardwareManager_startUnifiedAccessSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  +[NFHardwareManagerInterface interface]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[NFHardwareManagerInterface updateContactlessInterface:]((uint64_t)NFHardwareManagerInterface, v7);

  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_sessionAttribute");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v10, "copy");
  objc_msgSend(v6, "queueUnifiedAccessSession:sessionAttribute:completion:", v8, v9, v5);

}

- (id)startLPEMConfigSession:(id)a3
{
  id v4;
  NFLPEMConfigSession *v5;
  uint64_t v6;
  NFLPEMConfigSession *v7;
  id v8;
  NFLPEMConfigSession *v9;
  _QWORD v11[4];
  NFLPEMConfigSession *v12;
  NFHardwareManager *v13;
  _QWORD v14[5];

  v4 = a3;
  v5 = objc_alloc_init(NFLPEMConfigSession);
  -[NFSession setDidStartCallback:](v5, "setDidStartCallback:", v4);

  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __44__NFHardwareManager_startLPEMConfigSession___block_invoke;
  v14[3] = &unk_1E3B52BB0;
  v14[4] = self;
  -[NFSession setDidEndCallback:](v5, "setDidEndCallback:", v14);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __44__NFHardwareManager_startLPEMConfigSession___block_invoke_2;
  v11[3] = &unk_1E3B52C28;
  v7 = v5;
  v12 = v7;
  v13 = self;
  v8 = -[NFHardwareManager _synchronousQueueSessionWithRetry:queueBlock:](self, "_synchronousQueueSessionWithRetry:queueBlock:", v7, v11);
  v9 = v7;

  return v9;
}

uint64_t __44__NFHardwareManager_startLPEMConfigSession___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "sessionDidEnd:", a2);
}

void __44__NFHardwareManager_startLPEMConfigSession___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "_sessionAttribute");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "queueLPEMConfigSession:sessionAttribute:completion:", v4, v8, v6);

}

- (void)configureReaderModeRFForTransitPartner:(BOOL)a3 transitPartner:(unsigned int)a4 callback:(id)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v9;
  NSObject *v10;
  const void **v11;
  uint64_t Logger;
  void (*v13)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  id v23;
  void *v24;
  const char *Name;
  _QWORD v26[5];
  id v27;
  SEL v28;
  _BYTE state[18];
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v34 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = _os_activity_create(&dword_19B5EB000, "configureReaderModeRFForTransitPartner:Y transitPartner:callback:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v10, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v11 = (const void **)MEMORY[0x1E0DE7900];
  dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
  Logger = NFLogGetLogger();
  if (Logger)
  {
    v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    v17 = 45;
    if (isMetaClass)
      v17 = 43;
    v13(6, "%c[%{public}s %{public}s]:%i ", v17, ClassName, Name, 2461);
  }
  dispatch_get_specific(*v11);
  NFSharedLogGetLogger();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = object_getClass(self);
    if (class_isMetaClass(v19))
      v20 = 43;
    else
      v20 = 45;
    v21 = object_getClassName(self);
    v22 = sel_getName(a2);
    *(_DWORD *)state = 67109890;
    *(_DWORD *)&state[4] = v20;
    *(_WORD *)&state[8] = 2082;
    *(_QWORD *)&state[10] = v21;
    v30 = 2082;
    v31 = v22;
    v32 = 1024;
    v33 = 2461;
    _os_log_impl(&dword_19B5EB000, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i ", state, 0x22u);
  }

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __84__NFHardwareManager_configureReaderModeRFForTransitPartner_transitPartner_callback___block_invoke;
  v26[3] = &unk_1E3B52CC8;
  v27 = v9;
  v28 = a2;
  v26[4] = self;
  v23 = v9;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v26);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configureReaderModeRFForTransitPartner:transitPartner:completion:", v6, v5, v23);

}

void __84__NFHardwareManager_configureReaderModeRFForTransitPartner_transitPartner_callback___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", v9, ClassName, Name, 2464, v3);
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
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 2464;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Failure: %{public}@", buf, 0x2Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)isInRestrictedMode
{
  NFHardwareManager *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = v2->_secureElements;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isInRestrictedMode", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  objc_sync_exit(v2);
  return v4;
}

- (BOOL)areSessionsAllowed
{
  NSObject *v3;
  void *v4;
  _QWORD v6[5];
  os_activity_scope_state_s state;
  uint64_t v8;
  char v9;

  v3 = _os_activity_create(&dword_19B5EB000, "areSessionsAllowed", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v8 = 0x2020000000;
  v9 = 0;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_214);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__NFHardwareManager_areSessionsAllowed__block_invoke_2;
  v6[3] = &unk_1E3B52D30;
  v6[4] = &state;
  objc_msgSend(v4, "areSessionsAllowedWithCompletion:", v6);

  LOBYTE(v4) = *(_BYTE *)(state.opaque[1] + 24);
  _Block_object_dispose(&state, 8);
  return (char)v4;
}

uint64_t __39__NFHardwareManager_areSessionsAllowed__block_invoke_2(uint64_t result, char a2, uint64_t a3)
{
  if (!a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)invalidateConnection
{
  NSObject *v3;
  NFHardwareManager *v4;
  NFXPCServiceClient *xpc;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_19B5EB000, "invalidateConnection", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  v4 = self;
  objc_sync_enter(v4);
  -[NFXPCServiceClient removeDelegate:](v4->_xpc, "removeDelegate:", v4);
  xpc = v4->_xpc;
  v4->_xpc = 0;

  v4->_hasEventListener = 0;
  objc_sync_exit(v4);

}

- (BOOL)isBackgroundTagReadingAvailable
{
  NSObject *v3;
  void *v4;
  os_activity_scope_state_s v6;

  v3 = _os_activity_create(&dword_19B5EB000, "isBackgroundTagReadingAvailable", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  -[NFHardwareManager controllerInfo](self, "controllerInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "hasAntenna");

  return (char)v3;
}

- (BOOL)suspendBackgroundTagReading
{
  NSObject *v4;
  BOOL v5;
  void *v6;
  int v7;
  const void **v8;
  uint64_t Logger;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v14;
  NSObject *v15;
  objc_class *v16;
  int v17;
  const char *v18;
  const char *v19;
  const char *Name;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  _BYTE state[18];
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = _os_activity_create(&dword_19B5EB000, "suspendBackgroundTagReading", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(_QWORD *)state = 0;
  *(_QWORD *)&state[8] = 0;
  os_activity_scope_enter(v4, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v5 = 1;
  v26 = 1;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_216);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __48__NFHardwareManager_suspendBackgroundTagReading__block_invoke_2;
  v22[3] = &unk_1E3B52D78;
  v22[4] = &v23;
  objc_msgSend(v6, "updateBackgroundTagReading:completion:", 0, v22);

  v7 = *((_DWORD *)v24 + 6);
  if (v7 != 2)
  {
    if (v7 == 1)
    {
      v8 = (const void **)MEMORY[0x1E0DE7900];
      dispatch_get_specific((const void *)*MEMORY[0x1E0DE7900]);
      Logger = NFLogGetLogger();
      if (Logger)
      {
        v10 = (void (*)(uint64_t, const char *, ...))Logger;
        Class = object_getClass(self);
        isMetaClass = class_isMetaClass(Class);
        ClassName = object_getClassName(self);
        Name = sel_getName(a2);
        v14 = 45;
        if (isMetaClass)
          v14 = 43;
        v10(3, "%c[%{public}s %{public}s]:%i Hardware unsupported; assume it's disabled",
          v14,
          ClassName,
          Name,
          2594);
      }
      dispatch_get_specific(*v8);
      NFSharedLogGetLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = object_getClass(self);
        if (class_isMetaClass(v16))
          v17 = 43;
        else
          v17 = 45;
        v18 = object_getClassName(self);
        v19 = sel_getName(a2);
        *(_DWORD *)state = 67109890;
        *(_DWORD *)&state[4] = v17;
        *(_WORD *)&state[8] = 2082;
        *(_QWORD *)&state[10] = v18;
        v28 = 2082;
        v29 = v19;
        v30 = 1024;
        v31 = 2594;
        _os_log_impl(&dword_19B5EB000, v15, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Hardware unsupported; assume it's disabled",
          state,
          0x22u);
      }

    }
    v5 = 0;
  }
  _Block_object_dispose(&v23, 8);
  return v5;
}

uint64_t __48__NFHardwareManager_suspendBackgroundTagReading__block_invoke_2(uint64_t result, uint64_t a2, int a3)
{
  if (!a2)
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
  return result;
}

- (void)setSuspendBackgroundTagReading:(BOOL)a3
{
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  int v9;
  os_activity_scope_state_s state;

  if (a3)
  {
    v5 = _os_activity_create(&dword_19B5EB000, "setSuspendBackgroundTagReading:Y", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);
    v6 = 3;
  }
  else
  {
    v6 = 2;
    v5 = _os_activity_create(&dword_19B5EB000, "setSuspendBackgroundTagReading:N", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);
  }

  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_218);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__NFHardwareManager_setSuspendBackgroundTagReading___block_invoke_2;
  v8[3] = &unk_1E3B52DC0;
  v9 = v6;
  v8[4] = self;
  v8[5] = a2;
  objc_msgSend(v7, "updateBackgroundTagReading:completion:", v6, v8);

}

void __52__NFHardwareManager_setSuspendBackgroundTagReading___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  const void **v4;
  uint64_t Logger;
  void (*v6)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  int v13;
  const char *v14;
  const char *v15;
  const char *Name;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a2 || *(_DWORD *)(a1 + 48) != a3)
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
      Name = sel_getName(*(SEL *)(a1 + 40));
      v10 = 45;
      if (isMetaClass)
        v10 = 43;
      v6(3, "%c[%{public}s %{public}s]:%i Error in setting state", v10, ClassName, Name, 2615);
    }
    dispatch_get_specific(*v4);
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
      v15 = sel_getName(*(SEL *)(a1 + 40));
      *(_DWORD *)buf = 67109890;
      v18 = v13;
      v19 = 2082;
      v20 = v14;
      v21 = 2082;
      v22 = v15;
      v23 = 1024;
      v24 = 2615;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Error in setting state", buf, 0x22u);
    }

  }
}

- (void)actOnUserInitiatedSystemShutDown:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  SEL v15;
  _QWORD v16[5];
  id v17;
  SEL v18;
  os_activity_scope_state_s state;

  v4 = *(_QWORD *)&a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_19B5EB000, "actOnUserInitiatedSystemShutDown:completion:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__NFHardwareManager_actOnUserInitiatedSystemShutDown_completion___block_invoke;
  v16[3] = &unk_1E3B52CC8;
  v16[4] = self;
  v18 = a2;
  v10 = v7;
  v17 = v10;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __65__NFHardwareManager_actOnUserInitiatedSystemShutDown_completion___block_invoke_220;
  v13[3] = &unk_1E3B52DE8;
  v14 = v10;
  v15 = a2;
  v13[4] = self;
  v12 = v10;
  objc_msgSend(v11, "actOnUserInitiatedSystemShutDown:completion:", v4, v13);

}

void __65__NFHardwareManager_actOnUserInitiatedSystemShutDown_completion___block_invoke(uint64_t a1, void *a2)
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
    Name = sel_getName(*(SEL *)(a1 + 48));
    v9 = 45;
    if (isMetaClass)
      v9 = 43;
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2625, v3);
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
    v18 = v12;
    v19 = 2082;
    v20 = v13;
    v21 = 2082;
    v22 = v14;
    v23 = 1024;
    v24 = 2625;
    v25 = 2114;
    v26 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __65__NFHardwareManager_actOnUserInitiatedSystemShutDown_completion___block_invoke_220(uint64_t a1)
{
  const void **v2;
  uint64_t Logger;
  void (*v4)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  int v11;
  const char *v12;
  const char *v13;
  const char *Name;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
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
    v8 = 45;
    if (isMetaClass)
      v8 = 43;
    v4(6, "%c[%{public}s %{public}s]:%i Done", v8, ClassName, Name, 2628);
  }
  dispatch_get_specific(*v2);
  NFSharedLogGetLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = object_getClass(*(id *)(a1 + 32));
    if (class_isMetaClass(v10))
      v11 = 43;
    else
      v11 = 45;
    v12 = object_getClassName(*(id *)(a1 + 32));
    v13 = sel_getName(*(SEL *)(a1 + 48));
    *(_DWORD *)buf = 67109890;
    v17 = v11;
    v18 = 2082;
    v19 = v12;
    v20 = 2082;
    v21 = v13;
    v22 = 1024;
    v23 = 2628;
    _os_log_impl(&dword_19B5EB000, v9, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Done", buf, 0x22u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)setChipscope:(BOOL)a3
{
  _BOOL8 v3;
  const char *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  _QWORD v13[7];
  os_activity_scope_state_s state;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a3;
  if (a3)
    v6 = "setChipscope:Y";
  else
    v6 = "setChipscope:N";
  v7 = _os_activity_create(&dword_19B5EB000, v6, MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __34__NFHardwareManager_setChipscope___block_invoke;
  v13[3] = &unk_1E3B51998;
  v13[5] = &state;
  v13[6] = a2;
  v13[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __34__NFHardwareManager_setChipscope___block_invoke_222;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  objc_msgSend(v9, "setChipscope:completion:", v3, v12);

  v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v10;
}

void __34__NFHardwareManager_setChipscope___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2644, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 2644;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __34__NFHardwareManager_setChipscope___block_invoke_222(uint64_t a1, void *a2)
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
  if (v4)
  {
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
      v7(3, "%c[%{public}s %{public}s]:%i %{public}@", v10, ClassName, Name, 2648, v4);
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
      v25 = 2648;
      v26 = 2114;
      v27 = v4;
      _os_log_impl(&dword_19B5EB000, v11, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

}

- (id)getLPEMFTALogging:(id *)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[8];
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  os_activity_scope_state_s state;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = _os_activity_create(&dword_19B5EB000, "getLPEMFTALogging:", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  v23 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__6;
  v17 = __Block_byref_object_dispose__6;
  v18 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __39__NFHardwareManager_getLPEMFTALogging___block_invoke;
  v12[3] = &unk_1E3B51998;
  v12[5] = &state;
  v12[6] = a2;
  v12[4] = self;
  -[NFHardwareManager synchronousRemoteObjectProxyWithErrorHandler:](self, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __39__NFHardwareManager_getLPEMFTALogging___block_invoke_223;
  v11[3] = &unk_1E3B52A20;
  v11[4] = self;
  v11[5] = &state;
  v11[6] = &v13;
  v11[7] = a2;
  objc_msgSend(v8, "getLPEMFTALoggingWithCompletion:", v11);

  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v9 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&v13, 8);

  _Block_object_dispose(&state, 8);
  return v9;
}

void __39__NFHardwareManager_getLPEMFTALogging___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v15;
  void *v16;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
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
    v6(3, "%c[%{public}s %{public}s]:%i %{public}@", v9, ClassName, Name, 2664, v3);
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
    v20 = v12;
    v21 = 2082;
    v22 = v13;
    v23 = 2082;
    v24 = v14;
    v25 = 1024;
    v26 = 2664;
    v27 = 2114;
    v28 = v3;
    _os_log_impl(&dword_19B5EB000, v10, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v3;

}

void __39__NFHardwareManager_getLPEMFTALogging___block_invoke_223(uint64_t a1, void *a2, void *a3)
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
  id *v19;
  void *v20;
  const char *ClassName;
  const char *Name;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (v6)
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
      v10(3, "%c[%{public}s %{public}s]:%i %{public}@", v13, ClassName, Name, 2668, v6);
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
      v24 = v16;
      v25 = 2082;
      v26 = v17;
      v27 = 2082;
      v28 = v18;
      v29 = 1024;
      v30 = 2668;
      v31 = 2114;
      v32 = v6;
      _os_log_impl(&dword_19B5EB000, v14, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
    }

    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v20 = a2;
  }
  else
  {
    v19 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v20 = a3;
  }
  objc_storeStrong(v19, v20);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_listeningQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_waitingClients, 0);
  objc_storeStrong((id *)&self->_secureElementsById, 0);
  objc_storeStrong((id *)&self->_secureElements, 0);
  objc_storeStrong((id *)&self->_eventListeners, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_controllerInfo, 0);
  objc_storeStrong((id *)&self->_xpc, 0);
}

@end
