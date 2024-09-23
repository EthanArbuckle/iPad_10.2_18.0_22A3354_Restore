@implementation _LSLocalQueryResolver

- (void)_enumerateResolvedResultsOfQuery:(id)a3 XPCConnection:(id)a4 withBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  int v24;
  void *v25;
  NSObject *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  id v31;
  id v32;
  uint64_t v33;
  const __CFString *v34;
  _BYTE buf[24];
  char v36;
  uint8_t v37[24];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isInXCTestRigInsecure");
  v11 = v10;
  if (v7)
    v12 = v10;
  else
    v12 = 0;
  if (v12 != 1)
    goto LABEL_15;
  v13 = (void *)MEMORY[0x186DAE7A0]();
  v32 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v32;
  if (!v14)
  {
    _LSDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:].cold.2((uint64_t)v15, v18, v19);
    goto LABEL_13;
  }
  v31 = v15;
  objc_msgSend(MEMORY[0x1E0CB3710], "ls_unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v31);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v31;

  if (!v16)
  {
    _LSDefaultLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:].cold.3((uint64_t)v17, v18, v20);
    v7 = 0;
    v15 = v17;
LABEL_13:

    goto LABEL_14;
  }
  v15 = v17;
  v7 = (id)v16;
LABEL_14:

  objc_autoreleasePoolPop(v13);
LABEL_15:
  if (!v7 || !objc_msgSend(v7, "_requiresDatabaseMappingEntitlement"))
    goto LABEL_27;
  if (v8)
  {
    objc_msgSend(v8, "_xpcConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = _LSXPCConnectionMayMapDatabase(v21) == 0;

  }
  else
  {
    v22 = 0;
  }
  if (((v22 | v11 ^ 1) & 1) == 0)
    v22 = +[_LSQueryContext simulateLimitedMappingForXCTests](_LSQueryContext, "simulateLimitedMappingForXCTests");
  if (!v22)
    goto LABEL_27;
  if (objc_msgSend(v7, "isLegacy"))
  {
    _LSDefaultLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(v8, "processIdentifier");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v24;
      _os_log_impl(&dword_182882000, v23, OS_LOG_TYPE_DEFAULT, "Unentitled query %{public}@ issued from pid %i. Allowing due to legacy SPI.", buf, 0x12u);
    }

LABEL_27:
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v36 = 0;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __82___LSLocalQueryResolver__enumerateResolvedResultsOfQuery_XPCConnection_withBlock___block_invoke;
    v28[3] = &unk_1E1044DB0;
    v30 = buf;
    v29 = v9;
    objc_msgSend(v7, "_enumerateWithXPCConnection:block:", v8, v28);
    v25 = v29;
    goto LABEL_28;
  }
  _LSDefaultLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:].cold.1((uint64_t)v7, v37, objc_msgSend(v8, "processIdentifier"), v26);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v36 = 0;
  v33 = *MEMORY[0x1E0CB2938];
  v34 = CFSTR("Query not allowed");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], -54, (uint64_t)"-[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:]", 308, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  (*((void (**)(id, _QWORD, void *, uint64_t))v9 + 2))(v9, 0, v25, *(_QWORD *)&buf[8] + 24);
LABEL_28:

  _Block_object_dispose(buf, 8);
}

- (id)_resolveQueries:(id)a3 XPCConnection:(id)a4 error:(id *)a5
{
  id v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v16;
  id obj;
  id v19;
  id v20;
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v20 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)__LSDefaultsGetSharedInstance(), "isServer"))
  {
    _LSServer_DatabaseExecutionContext();
    v8 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext assertActiveForThisThread](v8);

  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v9)
  {
    v16 = v7;
    v19 = 0;
    v10 = *(_QWORD *)v36;
LABEL_5:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v10)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v11);
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__41;
      v33 = __Block_byref_object_dispose__41;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v16);
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__41;
      v27 = __Block_byref_object_dispose__41;
      v28 = 0;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __61___LSLocalQueryResolver__resolveQueries_XPCConnection_error___block_invoke;
      v22[3] = &unk_1E1044D88;
      v22[4] = &v29;
      v22[5] = &v23;
      -[_LSLocalQueryResolver _enumerateResolvedResultsOfQuery:XPCConnection:withBlock:](self, "_enumerateResolvedResultsOfQuery:XPCConnection:withBlock:", v12, v20, v22);
      v13 = v30[5];
      if (v13)
      {
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v30[5], v12);
      }
      else
      {

        v14 = (id)v24[5];
        v21 = 0;
        v19 = v14;
      }
      _Block_object_dispose(&v23, 8);

      _Block_object_dispose(&v29, 8);
      if (!v13)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v9)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v19 = 0;
  }

  if (a5 && !v21)
    *a5 = objc_retainAutorelease(v19);

  return v21;
}

- (void)_enumerateResolvedResultsOfQuery:(int)a3 XPCConnection:(os_log_t)log withBlock:.cold.1(uint64_t a1, uint8_t *buf, int a3, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Unentitled query %{public}@ issued from pid %i. Disallowing and yielding an error.", buf, 0x12u);
}

- (void)_enumerateResolvedResultsOfQuery:(uint64_t)a1 XPCConnection:(NSObject *)a2 withBlock:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "Failed to encode query: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)_enumerateResolvedResultsOfQuery:(uint64_t)a1 XPCConnection:(NSObject *)a2 withBlock:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_182882000, a2, a3, "Failed to decode query: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
