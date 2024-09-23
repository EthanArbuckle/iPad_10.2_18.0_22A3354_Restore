@implementation LSPlugInQueryAll

- (BOOL)_remoteResolutionIsExpensive
{
  return 1;
}

- (id)resolveExpensiveQueryRemotelyUsingResolver:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  int v6;
  int *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  LSPlugInQueryWithUnits *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  BOOL v39;
  char v40;
  void *v41;
  BOOL v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  id v59;
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = &OBJC_IVAR___LSBundleInfoCachedValues__values;
  do
  {
    if (v5)
    {
      _LSDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v61 = v5;
        _os_log_error_impl(&dword_182882000, v8, OS_LOG_TYPE_ERROR, "failed batch fetch of all plugins, retrying: %@", buf, 0xCu);
      }

    }
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = (void *)objc_msgSend(objc_alloc((Class)(v7 + 958)), "_init");
    objc_msgSend(v9, "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = 0;
    objc_msgSend(v56, "_resolveQueries:XPCConnection:error:", v11, 0, &v59);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v59;

    objc_msgSend(v12, "allValues");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "pluginUnits");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v15;
    objc_msgSend(v15, "dbUUID");
    v17 = objc_claimAutoreleasedReturnValue();
    v57 = (void *)v17;
    if (v16)
      v18 = v17 == 0;
    else
      v18 = 1;
    if (!v18)
    {
      v52 = v12;
      v53 = v6;
      v54 = v4;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      if (objc_msgSend(v16, "count"))
      {
        v20 = 0;
        v21 = 50;
        while (1)
        {
          v22 = (void *)MEMORY[0x186DAE7A0]();
          v23 = objc_msgSend(v16, "count");
          v24 = (unint64_t)(v23 - v20) >= 0x32 ? 50 : v23 - v20;
          objc_msgSend(v16, "subarrayWithRange:", v20, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = 0;
          v26 = (void *)MEMORY[0x1E0C99E60];
          v27 = v56;
          v28 = v25;
          v29 = v57;
          v30 = -[LSPlugInQueryWithUnits initWithPlugInUnits:forDatabaseWithUUID:]([LSPlugInQueryWithUnits alloc], "initWithPlugInUnits:forDatabaseWithUUID:", v28, v29);

          objc_msgSend(v26, "setWithObject:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "_resolveQueries:XPCConnection:error:", v31, 0, &v58);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            objc_msgSend(v32, "allValues");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "firstObject");
            v34 = objc_claimAutoreleasedReturnValue();
            v35 = (void *)v34;
            v36 = (void *)MEMORY[0x1E0C9AA60];
            if (v34)
              v36 = (void *)v34;
            v37 = v36;

          }
          else
          {
            v37 = 0;
          }

          v38 = v58;
          if (!v37)
            break;
          objc_msgSend(v19, "addObjectsFromArray:", v37);

          objc_autoreleasePoolPop(v22);
          v20 = v21;
          v39 = objc_msgSend(v16, "count") > (unint64_t)v21;
          v21 += 50;
          v5 = v38;
          if (!v39)
            goto LABEL_24;
        }

        objc_autoreleasePoolPop(v22);
        v4 = v54;
      }
      else
      {
        v38 = v5;
LABEL_24:
        v4 = (void *)objc_msgSend(v19, "copy");

      }
      v5 = v38;
      v6 = v53;
      v7 = &OBJC_IVAR___LSBundleInfoCachedValues__values;
      v12 = v52;
    }
    if (v4)
    {
      v40 = 1;
    }
    else if (_LSNSErrorIsXPCConnectionInterrupted(v5))
    {
      v40 = 0;
    }
    else
    {
      objc_msgSend(v5, "domain");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "isEqual:", CFSTR("LSApplicationWorkspaceErrorDomain")))
        v42 = objc_msgSend(v5, "code") == 114;
      else
        v42 = 0;
      v40 = !v42;

    }
    if ((v40 & 1) != 0)
      break;
    ++v6;
  }
  while (v6 != 10);
  if (!v4)
  {
    _LSDefaultLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      -[LSPlugInQueryAll resolveExpensiveQueryRemotelyUsingResolver:error:].cold.1((uint64_t)v5, v43, v44, v45, v46, v47, v48, v49);

    if (a4)
      *a4 = objc_retainAutorelease(v5);
  }

  return v4;
}

- (void)resolveExpensiveQueryRemotelyUsingResolver:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_182882000, a2, a3, "failed batch fetch of all plugins, giving up: %@", a5, a6, a7, a8, 2u);
}

@end
