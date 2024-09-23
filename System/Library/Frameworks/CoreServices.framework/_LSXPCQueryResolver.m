@implementation _LSXPCQueryResolver

- (void)_enumerateResolvedResultsOfQuery:(id)a3 XPCConnection:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  char v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  -[_LSXPCQueryResolver _resolveQueries:XPCConnection:error:](self, "_resolveQueries:XPCConnection:error:", v10, v8, &v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v18;

  if (v11)
  {
    objc_msgSend(v11, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80___LSXPCQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke;
    v16[3] = &unk_1E1044E28;
    v17 = v9;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v16);

  }
  else
  {
    v15 = 0;
    (*((void (**)(id, _QWORD, id, char *))v9 + 2))(v9, 0, v12, &v15);
  }

}

- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  char v14;
  id *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(_QWORD);
  int v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  id v34;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  char v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint64_t v50;
  id *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint8_t v56[4];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v50 = 0;
  v51 = (id *)&v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__41;
  v54 = __Block_byref_object_dispose__41;
  v55 = 0;
  v47 = 0;
  v48[0] = &v47;
  v48[1] = 0x3032000000;
  v48[2] = __Block_byref_object_copy__41;
  v48[3] = __Block_byref_object_dispose__41;
  v49 = 0;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v44;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "isLegacy") & 1) != 0)
        {
          v14 = 1;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v58, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  v15 = (id *)(v48[0] + 40);
  obj = *(id *)(v48[0] + 40);
  -[_LSXPCQueryResolver resolveWhatWeCanLocallyWithQueries:XPCConnection:error:](self, "resolveWhatWeCanLocallyWithQueries:XPCConnection:error:", v10, v9, &obj);
  v16 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v15, obj);
  v17 = v51[5];
  v51[5] = (id)v16;

  v18 = v51[5];
  if (v18)
  {
    v19 = (void *)objc_msgSend(v10, "mutableCopy");
    v20 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v51[5], "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "minusSet:", v22);

    if (objc_msgSend(v19, "count"))
    {
      v23 = (id *)(v48[0] + 40);
      v41 = *(id *)(v48[0] + 40);
      -[_LSXPCQueryResolver resolveExpensiveRemoteQueriesInSet:XPCConnection:error:](self, "resolveExpensiveRemoteQueriesInSet:XPCConnection:error:", v19, v9, &v41);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v23, v41);
      if (v24)
      {
        v25 = (void *)objc_msgSend(v51[5], "mutableCopy");
        objc_msgSend(v25, "addEntriesFromDictionary:", v24);
        objc_storeStrong(v51 + 5, v25);
        v26 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v24, "allKeys");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setWithArray:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "minusSet:", v28);

      }
    }
    if (objc_msgSend(v19, "count"))
    {
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __59___LSXPCQueryResolver__resolveQueries_XPCConnection_error___block_invoke;
      v36[3] = &unk_1E1044E00;
      v38 = &v47;
      v40 = v14;
      v37 = v19;
      v39 = &v50;
      v29 = (void (**)(_QWORD))MEMORY[0x186DAE9BC](v36);
      v30 = 0;
      while (1)
      {
        v29[2](v29);
        if (!_LSNSErrorIsXPCConnectionInterrupted(*(void **)(v48[0] + 40)))
          break;
        _LSDefaultLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[_LSXPCQueryResolver _resolveQueries:XPCConnection:error:].cold.1(v56, (uint64_t)v48, &v57, v31);

        v32 = *(void **)(v48[0] + 40);
        *(_QWORD *)(v48[0] + 40) = 0;

        if (++v30 == 5)
          goto LABEL_27;
      }
      if (v30)
      {
        _LSDefaultLog();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[_LSXPCQueryResolver _resolveQueries:XPCConnection:error:].cold.2(v30, v33);

      }
LABEL_27:

    }
    v18 = v51[5];
  }
  if (a5 && !v18)
  {
    *a5 = objc_retainAutorelease(*(id *)(v48[0] + 40));
    v18 = v51[5];
  }
  v34 = v18;
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v50, 8);
  return v34;
}

- (id)resolveWhatWeCanLocallyWithQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  _LSLocalQueryResolver *localResolver;
  void *v18;
  id v19;
  id v20;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSQueryContext.mm"), 338, CFSTR("Hit the client-side query resolution codepath from within lsd! This is a serious bug! Please file a radar against Launch Services."));

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v16, "_canResolveLocallyWithoutMappingDatabase"))
          objc_msgSend(v11, "addObject:", v16);
      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v11, "count"))
  {
    localResolver = self->_localResolver;
    v23 = 0;
    -[_LSLocalQueryResolver _resolveQueries:XPCConnection:error:](localResolver, "_resolveQueries:XPCConnection:error:", v11, v10, &v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v23;
    v20 = v19;
    if (a5 && !v18)
    {
      v20 = objc_retainAutorelease(v19);
      v18 = 0;
      *a5 = v20;
    }
  }
  else
  {
    v20 = 0;
    v18 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v18;
}

- (id)resolveExpensiveRemoteQueriesInSet:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v18;
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LSQueryContext.mm"), 372, CFSTR("Hit the client-side remote-expensive query resolution codepath from within lsd! This is a serious bug! Please file a radar against Launch Services."));

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v19;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v9)
  {
    v10 = 0;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v13, "_remoteResolutionIsExpensive"))
        {
          if ((v10 & 1) == 0)
            __LAUNCH_SERVICES_IS_FAULTING_BECAUSE_THIS_PROCESS_IS_USING_VERY_EXPENSIVE_SPI__();
          v20 = 0;
          objc_msgSend(v13, "resolveExpensiveQueryRemotelyUsingResolver:error:", self, &v20);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v20;
          if (v14)
          {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v13);
          }
          else
          {
            _LSDefaultLog();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v26 = v15;
              _os_log_fault_impl(&dword_182882000, v16, OS_LOG_TYPE_FAULT, "Could not resolve expensive query remotely! This may lead to lsd jetsams! %@", buf, 0xCu);
            }

          }
          v10 = 1;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }

  return v7;
}

- (_LSXPCQueryResolver)init
{
  _LSXPCQueryResolver *v2;
  _LSLocalQueryResolver *v3;
  _LSLocalQueryResolver *localResolver;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_LSXPCQueryResolver;
  v2 = -[_LSXPCQueryResolver init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(_LSLocalQueryResolver);
    localResolver = v2->_localResolver;
    v2->_localResolver = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localResolver, 0);
}

- (void)_resolveQueries:(_QWORD *)a3 XPCConnection:(NSObject *)a4 error:.cold.1(uint8_t *a1, uint64_t a2, _QWORD *a3, NSObject *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a2 + 40);
  *(_DWORD *)a1 = 138543362;
  *a3 = v4;
  OUTLINED_FUNCTION_5(&dword_182882000, a4, (uint64_t)a3, "Re-trying failed xpc message to lsd: %{public}@", a1);
}

- (void)_resolveQueries:(int)a1 XPCConnection:(NSObject *)a2 error:.cold.2(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "Got result for query with attempt %d", (uint8_t *)v2, 8u);
}

@end
