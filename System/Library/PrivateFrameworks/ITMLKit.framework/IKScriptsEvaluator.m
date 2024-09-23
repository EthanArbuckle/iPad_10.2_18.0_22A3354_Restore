@implementation IKScriptsEvaluator

- (IKScriptsEvaluator)initWithScripts:(id)a3 withContext:(id)a4 callback:(id)a5 jingleRequest:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  IKScriptsEvaluator *v14;
  IKScriptsEvaluator *v15;
  NSMutableArray *v16;
  NSMutableArray *records;
  void *v18;
  uint64_t v19;
  NSString *identifier;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v27.receiver = self;
  v27.super_class = (Class)IKScriptsEvaluator;
  v14 = -[IKScriptsEvaluator init](&v27, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_scripts, a3);
    objc_storeWeak((id *)&v15->_appContext, v12);
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    records = v15->_records;
    v15->_records = v16;

    v15->_isJingleRequest = a6;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "UUIDString");
    v19 = objc_claimAutoreleasedReturnValue();
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v19;

    objc_setAssociatedObject(v12, v15->_identifier, v15, (void *)0x301);
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CBE0F8], "managedValueWithValue:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "jsContext");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "virtualMachine");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "jsContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("Device"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addManagedReference:withOwner:", v21, v25);

      -[IKScriptsEvaluator setCallback:](v15, "setCallback:", v21);
    }
  }

  return v15;
}

- (void)evaluate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  IKLoadRecord *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id *to;
  id obj;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  uint64_t v43;
  id location;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[5];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  -[IKScriptsEvaluator scripts](self, "scripts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v51 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
        if (objc_msgSend(v7, "length"))
        {
          objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (v8)
          {
            v9 = objc_alloc_init(IKLoadRecord);
            -[IKLoadRecord setURL:](v9, "setURL:", v8);
            -[IKScriptsEvaluator records](self, "records");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v9);

          }
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v4);
  }

  -[IKScriptsEvaluator scripts](self, "scripts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  -[IKScriptsEvaluator records](self, "records");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = v12 == objc_msgSend(v13, "count");

  if ((v12 & 1) != 0)
  {
    v14 = +[IKPreference ignoreHTTPCache](IKPreference, "ignoreHTTPCache");
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[IKScriptsEvaluator records](self, "records");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (!v38)
      goto LABEL_32;
    v39 = v14;
    v37 = *(_QWORD *)v46;
    to = (id *)&v43;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v46 != v37)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v15);
        v17 = (void *)objc_opt_new();
        v18 = v17;
        if (v39)
          objc_msgSend(v17, "setCachePolicy:", v39);
        objc_msgSend(v16, "URL", to);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setURL:", v19);

        objc_msgSend(v18, "setAllowedRetryCount:", 0);
        objc_msgSend(v18, "setTimeoutInterval:", 30.0);
        -[IKScriptsEvaluator appContext](self, "appContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "delegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v21, "sourceApplicationBundleIdentifierForContext:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setClientAuditBundleIdentifier:", v22);

        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v21, "sourceApplicationAuditTokenDataForContext:", v20);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setClientAuditTokenData:", v23);

        }
        if (self->_isJingleRequest)
        {
          +[IKJSITunesStore setITunesStoreHeaders:](IKJSITunesStore, "setITunesStoreHeaders:", v18);
          v24 = objc_alloc_init(MEMORY[0x1E0DDC1B0]);
          objc_msgSend(v24, "setNeedsURLBag:", 0);
          objc_msgSend(v24, "setUrlKnownToBeTrusted:", 1);
LABEL_27:
          objc_msgSend(v24, "setDelegate:", self);
          v27 = (void *)objc_opt_new();
          objc_msgSend(v24, "setDataProvider:", v27);

          objc_msgSend(v24, "setRequestProperties:", v18);
          objc_initWeak(&location, v24);
          v40[0] = MEMORY[0x1E0C809B0];
          v40[1] = 3221225472;
          v40[2] = __30__IKScriptsEvaluator_evaluate__block_invoke_3;
          v40[3] = &unk_1E9F4C210;
          v40[4] = self;
          objc_copyWeak(&v41, &location);
          objc_msgSend(v24, "setCompletionBlock:", v40);
          objc_msgSend(v16, "setOpertaion:", v24);
          objc_msgSend(MEMORY[0x1E0DDC190], "mainQueue");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addOperation:", v24);

          objc_destroyWeak(&v41);
          objc_destroyWeak(&location);
          goto LABEL_28;
        }
        objc_msgSend(v20, "app");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "appIsTrusted");

        if (v26)
        {
          v24 = objc_alloc_init(MEMORY[0x1E0DDC1C0]);
          objc_msgSend(v24, "_setUsesPrivateCookieStore:", 0);
          goto LABEL_27;
        }
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setRequestID:", v29);

        objc_msgSend(MEMORY[0x1E0CB39F0], "sharedSession");
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, self);
        objc_msgSend(v18, "URL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v42[0] = MEMORY[0x1E0C809B0];
        v42[1] = 3221225472;
        v42[2] = __30__IKScriptsEvaluator_evaluate__block_invoke_2;
        v42[3] = &unk_1E9F4C1E8;
        objc_copyWeak(to, &location);
        v42[4] = v16;
        objc_msgSend(v24, "dataTaskWithURL:completionHandler:", v30, v42);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "setDataTask:", v31);
        objc_msgSend(v31, "resume");

        objc_destroyWeak(to);
        objc_destroyWeak(&location);
LABEL_28:

        ++v15;
      }
      while (v38 != v15);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      v38 = v32;
      if (!v32)
      {
LABEL_32:

        return;
      }
    }
  }
  -[IKScriptsEvaluator callback](self, "callback");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[IKScriptsEvaluator appContext](self, "appContext");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __30__IKScriptsEvaluator_evaluate__block_invoke;
    v49[3] = &unk_1E9F4C1C0;
    v49[4] = self;
    objc_msgSend(v34, "addPostEvaluateBlock:", v49);

  }
}

void __30__IKScriptsEvaluator_evaluate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "callback");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_sendCallback:inContext:success:", v4, v3, 0);

}

void __30__IKScriptsEvaluator_evaluate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id v8;
  void *v9;
  id WeakRetained;

  v6 = (id *)(a1 + 40);
  v7 = a4;
  v8 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(*(id *)(a1 + 32), "requestID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "scriptDidLoadWithID:data:error:", v9, v8, v7);

}

void __30__IKScriptsEvaluator_evaluate__block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ITMLKitErrorDomain"), 101, 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "_operation:finishedWithResult:error:", WeakRetained, 0, v4);

}

- (void)parseScriptData:(id)a3 successPredicate:(id)a4 completion:(id)a5
{
  id v8;
  unsigned int (**v9)(id, void *);
  void (**v10)(id, uint64_t, void *);
  IKScriptsEvaluator *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t i;
  void *v18;
  char v19;
  char v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (unsigned int (**)(id, void *))a4;
  v10 = (void (**)(id, uint64_t, void *))a5;
  v11 = self;
  objc_sync_enter(v11);
  if (objc_msgSend(v8, "length"))
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
  else
    v12 = 0;
  if (objc_msgSend(v12, "length"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[IKScriptsEvaluator records](v11, "records");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v21 = v8;
      v15 = *(_QWORD *)v23;
      v16 = 1;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v19 = objc_msgSend(v18, "loadCompleted");
          if (v9)
            v20 = v19;
          else
            v20 = 1;
          if ((v20 & 1) != 0)
          {
            v16 &= v19;
          }
          else if (v9[2](v9, v18))
          {
            objc_msgSend(v18, "setLoadCompleted:", 1);
            objc_msgSend(v18, "setScriptStr:", v12);
            if (v10)
              v10[2](v10, 1, v18);
          }
          else
          {
            v16 = 0;
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v14);

      v8 = v21;
      if ((v16 & 1) == 0)
        goto LABEL_27;
    }
    else
    {

    }
    -[IKScriptsEvaluator evaluateScripts](v11, "evaluateScripts");
    goto LABEL_27;
  }
  -[IKScriptsEvaluator handleScirptLoadFailure](v11, "handleScirptLoadFailure");
  if (v10)
    v10[2](v10, 0, 0);
LABEL_27:

  objc_sync_exit(v11);
}

- (void)scriptDidLoadWithID:(id)a3 data:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;

  v7 = a3;
  v9[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__IKScriptsEvaluator_scriptDidLoadWithID_data_error___block_invoke;
  v10[3] = &unk_1E9F4C238;
  v11 = v7;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__IKScriptsEvaluator_scriptDidLoadWithID_data_error___block_invoke_2;
  v9[3] = &unk_1E9F4C260;
  v8 = v7;
  -[IKScriptsEvaluator parseScriptData:successPredicate:completion:](self, "parseScriptData:successPredicate:completion:", a4, v10, v9);

}

uint64_t __53__IKScriptsEvaluator_scriptDidLoadWithID_data_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "requestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __53__IKScriptsEvaluator_scriptDidLoadWithID_data_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v3;
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
  if (a2)
  {
    objc_msgSend(a3, "setDataTask:", 0);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "records", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "dataTask");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "cancel");

          ++v7;
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
}

- (void)handleScirptLoadFailure
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (self->_callback)
  {
    objc_initWeak(&location, self);
    -[IKScriptsEvaluator appContext](self, "appContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __45__IKScriptsEvaluator_handleScirptLoadFailure__block_invoke;
    v4[3] = &unk_1E9F4BE58;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "evaluate:completionBlock:", v4, 0);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __45__IKScriptsEvaluator_handleScirptLoadFailure__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[4];
    if (v5)
      objc_msgSend(WeakRetained, "_sendCallback:inContext:success:", v5, v6, 0);
  }

}

- (void)evaluateScripts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[IKScriptsEvaluator records](self, "records");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  -[IKScriptsEvaluator appContext](self, "appContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__IKScriptsEvaluator_evaluateScripts__block_invoke;
  v8[3] = &unk_1E9F4C288;
  v7 = v5;
  v9 = v7;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v6, "evaluate:completionBlock:", v8, 0);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __37__IKScriptsEvaluator_evaluateScripts__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  const OpaqueJSContext *v11;
  JSStringRef v12;
  OpaqueJSString *v13;
  void *v14;
  OpaqueJSString *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  _QWORD *WeakRetained;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  JSValueRef exception;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = a1;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v25;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v11 = (const OpaqueJSContext *)objc_msgSend(v3, "JSGlobalContextRef");
        v12 = JSStringCreateWithCFString((CFStringRef)objc_msgSend(v10, "scriptStr"));
        if (v12)
        {
          v13 = v12;
          exception = 0;
          objc_msgSend(v10, "URL");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = JSStringCreateWithCFString((CFStringRef)objc_msgSend(v14, "absoluteString"));

          if (!JSEvaluateScript(v11, v13, 0, v15, 1, &exception))
          {
            objc_msgSend(MEMORY[0x1E0CBE108], "valueWithJSValueRef:inContext:", exception, v3);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            ITMLKitGetLogObject(0);
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v16, "toDictionary");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v29 = v16;
              v30 = 2112;
              v31 = v18;
              _os_log_error_impl(&dword_1D95F2000, v17, OS_LOG_TYPE_ERROR, "Failed to evaluate Script: %@...%@", buf, 0x16u);

            }
            v8 = 0;
          }
          JSStringRelease(v15);
          JSStringRelease(v13);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  WeakRetained = objc_loadWeakRetained((id *)(v22 + 40));
  v20 = WeakRetained;
  if (WeakRetained)
  {
    v21 = WeakRetained[4];
    if (v21)
      objc_msgSend(WeakRetained, "_sendCallback:inContext:success:", v21, v3, v8 & 1);
  }

}

- (void)operation:(id)a3 failedWithError:(id)a4
{
  -[IKScriptsEvaluator _operation:finishedWithResult:error:](self, "_operation:finishedWithResult:error:", a3, 0, a4);
}

- (void)operation:(id)a3 finishedWithOutput:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[IKScriptsEvaluator _operation:finishedWithResult:error:](self, "_operation:finishedWithResult:error:", v7, v6, 0);

}

- (void)_operation:(id)a3 finishedWithResult:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, int, void *);
  void *v15;
  IKScriptsEvaluator *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL (*v19)(uint64_t, void *);
  void *v20;
  id v21;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  v16 = self;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __58__IKScriptsEvaluator__operation_finishedWithResult_error___block_invoke;
  v20 = &unk_1E9F4C238;
  v21 = v7;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __58__IKScriptsEvaluator__operation_finishedWithResult_error___block_invoke_2;
  v15 = &unk_1E9F4C260;
  v11 = v7;
  -[IKScriptsEvaluator parseScriptData:successPredicate:completion:](self, "parseScriptData:successPredicate:completion:", v10, &v17, &v12);
  objc_msgSend(v11, "setDelegate:", 0, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  objc_msgSend(v11, "setCompletionBlock:", 0);

}

BOOL __58__IKScriptsEvaluator__operation_finishedWithResult_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "opertaion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == *(void **)(a1 + 32);

  return v4;
}

void __58__IKScriptsEvaluator__operation_finishedWithResult_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    objc_msgSend(a3, "setOpertaion:", 0);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "records", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v8, "opertaion");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setDelegate:", 0);

          objc_msgSend(v8, "opertaion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCompletionBlock:", 0);

          objc_msgSend(v8, "opertaion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "cancel");

          objc_msgSend(v8, "setOpertaion:", 0);
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

  }
}

- (void)_sendCallback:(id)a3 inContext:(id)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v5 = a5;
  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    objc_msgSend(v8, "value");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "callWithArguments:", v12);

    objc_msgSend(v9, "virtualMachine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Device"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeManagedReference:withOwner:", v8, v15);

  }
  +[IKAppContext currentAppContext](IKAppContext, "currentAppContext");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[IKScriptsEvaluator identifier](self, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v16, v17, 0, (void *)0x301);

  }
}

- (BOOL)isJingleRequest
{
  return self->_isJingleRequest;
}

- (void)setIsJingleRequest:(BOOL)a3
{
  self->_isJingleRequest = a3;
}

- (NSArray)scripts
{
  return self->_scripts;
}

- (void)setScripts:(id)a3
{
  objc_storeStrong((id *)&self->_scripts, a3);
}

- (IKAppContext)appContext
{
  return (IKAppContext *)objc_loadWeakRetained((id *)&self->_appContext);
}

- (void)setAppContext:(id)a3
{
  objc_storeWeak((id *)&self->_appContext, a3);
}

- (JSManagedValue)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_storeStrong((id *)&self->_callback, a3);
}

- (NSMutableArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_records, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_destroyWeak((id *)&self->_appContext);
  objc_storeStrong((id *)&self->_scripts, 0);
}

@end
