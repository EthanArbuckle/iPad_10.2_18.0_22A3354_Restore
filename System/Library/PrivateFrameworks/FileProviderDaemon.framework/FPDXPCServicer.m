@implementation FPDXPCServicer

- (void)valuesForAttributes:(id)a3 forItemAtURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  FPDXPCServicer *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  id v40;
  _QWORD v41[8];

  v41[7] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke;
  v37 = &unk_1E8C774D8;
  v38 = self;
  v39 = v9;
  v12 = v10;
  v40 = v12;
  v13 = self;
  v14 = v39;
  v15 = v35;
  if (!v14)
  {
    FPInvalidParameterError();
    v28 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v29 = (void *)v28;
    v36((uint64_t)v15, (void *)v28);

    goto LABEL_15;
  }
  -[FPDXPCServicer connection](v13, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fp_hasSandboxAccessToFile:accessType:logLevel:", v14, *MEMORY[0x1E0CAA660], 0);

  if ((v17 & 1) == 0)
  {
    -[FPDXPCServicer connection](v13, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "fp_hasOneOfEntitlements:logLevel:", v19, 0);

    if ((v20 & 1) == 0)
    {
      -[FPDXPCServicer connection](v13, "connection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "fp_isNonSandboxedConnection");

      if ((v22 & 1) == 0)
      {
        FPNotPermittedError();
        v28 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v13, "server");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "extensionManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "domainForURL:reason:", v14, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v25, "defaultBackend");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v13, "pid"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v11;
    v32[1] = 3221225472;
    v32[2] = __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke_163;
    v32[3] = &unk_1E8C75760;
    v32[4] = v13;
    v33 = v12;
    objc_msgSend(v26, "valuesForAttributes:forURL:request:completionHandler:", v8, v14, v27, v32);

  }
  else
  {
    fp_current_or_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer valuesForAttributes:forItemAtURL:completionHandler:].cold.2(v14, v30);

    fpfs_adopt_log();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer valuesForAttributes:forItemAtURL:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);
    __fp_pop_log();

  }
LABEL_15:

}

- (void)itemForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, void *);
  void *v34;
  FPDXPCServicer *v35;
  id v36;
  _QWORD v37[8];

  v37[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = __47__FPDXPCServicer_itemForURL_completionHandler___block_invoke;
  v34 = &unk_1E8C75530;
  v35 = self;
  v9 = v7;
  v36 = v9;
  v10 = self;
  v11 = v6;
  v12 = v32;
  if (!v11)
  {
    FPInvalidParameterError();
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v26 = (void *)v25;
    v33((uint64_t)v12, (void *)v25);

    goto LABEL_15;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:accessType:logLevel:", v11, *MEMORY[0x1E0CAA660], 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedError();
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "defaultBackend");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v10, "pid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __47__FPDXPCServicer_itemForURL_completionHandler___block_invoke_149;
    v29[3] = &unk_1E8C77C78;
    v29[4] = v10;
    v30 = v9;
    objc_msgSend(v23, "itemForURL:request:completionHandler:", v11, v24, v29);

  }
  else
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer itemForURL:completionHandler:].cold.2(v11, v27);

    fpfs_adopt_log();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer itemForURL:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    __fp_pop_log();

  }
LABEL_15:

}

- (id)_providerForIdentifier:(id)a3 enumerateEntitlementRequired:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  NSXPCConnection **p_connection;
  id WeakRetained;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char v27;
  NSObject *v28;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL4 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE buf[12];
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v6 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[FPDXPCServicer defaultProviderForCurrentConnection:](self, "defaultProviderForCurrentConnection:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "fp_bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPDXPCServicer server](self, "server");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extensionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = 0;
  if (!v8)
  {
    if (v9)
    {
      v18 = v9;
LABEL_24:
      v17 = v18;
      goto LABEL_25;
    }
    fp_current_or_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer _providerForIdentifier:enumerateEntitlementRequired:error:].cold.1();

    if (!a5)
    {
LABEL_42:
      v17 = 0;
      goto LABEL_28;
    }
    FPProviderNotFoundError();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:
    v17 = 0;
    *a5 = v31;
    goto LABEL_28;
  }
  v39 = v6;
  objc_msgSend(v9, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", v8);

  if (!v16)
  {
    -[FPDXPCServicer providersForCurrentConnection](self, "providersForCurrentConnection");
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v17 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    if (v17)
    {
      v36 = v14;
      v37 = v12;
      v38 = v9;
      v20 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v41 != v20)
            objc_enumerationMutation(v19);
          v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v22, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "isEqualToString:", v8);

          if (v24)
          {
            v17 = v22;
            goto LABEL_19;
          }
        }
        v17 = (id)objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        if (v17)
          continue;
        break;
      }
LABEL_19:
      v12 = v37;
      v9 = v38;
      v14 = v36;
    }

    p_connection = &self->_connection;
    if (v17)
      goto LABEL_25;
    goto LABEL_21;
  }
  v17 = v9;
  if (!v17)
  {
LABEL_21:
    if (!v39)
      goto LABEL_23;
    -[FPDXPCServicer connection](self, "connection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "fp_hasOneOfEntitlements:", v26);

    if ((v27 & 1) != 0)
    {
LABEL_23:
      *(_QWORD *)buf = 0;
      objc_msgSend(v14, "providerWithIdentifier:reason:", v8, buf);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (v18)
        goto LABEL_24;
      fp_current_or_default_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer _providerForIdentifier:enumerateEntitlementRequired:error:].cold.2();

      if (a5)
      {
        FPProviderNotFoundError();
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_42;
    }
    fp_current_or_default_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[FPDXPCServicer _providerForIdentifier:enumerateEntitlementRequired:error:].cold.3();

    if (!a5)
      goto LABEL_42;
    FPNotPermittedError();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_41;
  }
LABEL_25:
  fp_current_or_default_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    v34 = objc_loadWeakRetained((id *)p_connection);
    objc_msgSend(v17, "identifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v34;
    v45 = 2112;
    v46 = v8;
    v47 = 2112;
    v48 = v35;
    _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ is allowed to access %@, resolved to %@", buf, 0x20u);

  }
LABEL_28:

  return v17;
}

- (id)defaultProviderForCurrentConnection:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSXPCConnection **p_connection;
  id WeakRetained;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[FPDXPCServicer server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "extensionManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CA5898];
  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  v10 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "auditToken");
  }
  else
  {
    v36 = 0u;
    v37 = 0u;
  }
  objc_msgSend(v7, "bundleRecordForAuditToken:error:", &v36, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "containingBundleRecord");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = v11;
  else
    v13 = 0;

  v14 = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(v14, "fp_bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "defaultProviderWithTopLevelBundleIdentifier:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v6, "providerWithIdentifier:reason:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        objc_msgSend(v13, "bundleIdentifier");
        v17 = objc_claimAutoreleasedReturnValue();
        if (!v17
          || (v18 = (void *)v17,
              objc_msgSend(v6, "defaultProviderWithTopLevelBundleIdentifier:", v17),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v18,
              !v16))
        {
          v19 = objc_loadWeakRetained((id *)p_connection);
          objc_msgSend(v19, "fp_applicationGroups");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "providersWithGroupContainers:bundleIdentifier:", v20, v15);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if ((unint64_t)objc_msgSend(v21, "count") >= 2)
          {
            fp_current_or_default_log();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v39 = v15;
              v40 = 2114;
              v41 = v21;
              _os_log_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Caller %{public}@ has multiple candidates for associated provider (%{public}@)", buf, 0x16u);
            }

          }
          objc_msgSend(v21, "firstObject", v36, v37);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
    }
  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v16, "isAppExtensionReachable", v36, v37))
  {
    if (v16 && v13)
    {
      objc_msgSend(v16, "asAppExtensionBackedProvider");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "extensionRecord");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v24, "containingBundleRecord");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = FPGetRelation(v13, v25);

      if (v26)
      {
        fp_current_or_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CF55F000, v27, OS_LOG_TYPE_DEFAULT, "[WARNING] Called from a process with a different version than the provider currently in use", buf, 2u);
        }

        if (v26 == 1)
        {
          if (a3)
          {
            objc_msgSend(v24, "containingBundleRecord");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "URL");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            FPProviderOlderVersionRunningError();
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          fp_current_or_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            goto LABEL_40;
          *(_WORD *)buf = 0;
          v31 = "[INFO] Calling application is newer";
        }
        else
        {
          if (a3)
          {
            objc_msgSend(v24, "containingBundleRecord");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "URL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            FPProviderNewerVersionFoundError();
            *a3 = (id)objc_claimAutoreleasedReturnValue();

          }
          fp_current_or_default_log();
          v30 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            goto LABEL_40;
          *(_WORD *)buf = 0;
          v31 = "[INFO] Calling application is older";
        }
        _os_log_impl(&dword_1CF55F000, v30, OS_LOG_TYPE_INFO, v31, buf, 2u);
LABEL_40:

        goto LABEL_41;
      }

    }
    objc_msgSend(v16, "asAppExtensionBackedProvider");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!a3)
    {
LABEL_41:
      v32 = 0;
      goto LABEL_42;
    }
    FPProviderNotRegistered();
    v32 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_42:

  return v32;
}

- (void)providerDomainsCompletionHandler:(id)a3
{
  id v5;
  id v6;
  _QWORD *v7;
  FPDXPCServicer *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  void (*v22)(uint64_t, void *);
  void *v23;
  FPDXPCServicer *v24;
  id v25;
  _BYTE buf[24];
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __51__FPDXPCServicer_providerDomainsCompletionHandler___block_invoke;
  v23 = &unk_1E8C75530;
  v24 = self;
  v6 = v5;
  v25 = v6;
  v7 = v21;
  v8 = self;
  -[FPDXPCServicer connection](v8, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)buf = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&buf[8] = v10;
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v9, "fp_hasOneOfEntitlements:", v11);
  if ((v12 & 1) != 0)
  {

    -[FPDXPCServicer server](v8, "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extensionManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "providerDomainsByID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer providerDomainsCompletionHandler:].cold.1(a2, v15);

    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2080;
      v27 = "-[FPDXPCServicer providerDomainsCompletionHandler:]";
      v28 = 2112;
      v29 = 0;
      v30 = 2112;
      v31 = v15;
      _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@, domains: %@", buf, 0x34u);
    }

    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v15);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22((uint64_t)v7, v18);

  }
}

- (FPDServer)server
{
  return (FPDServer *)objc_loadWeakRetained((id *)&self->_server);
}

- (int)pid
{
  void *v2;
  int v3;

  -[FPDXPCServicer connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "processIdentifier");

  return v3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)addDomain:(id)a3 forProviderIdentifier:(id)a4 byImportingDirectoryAtURL:(id)a5 nonWrappedURL:(id)a6 userAllowedDBDrop:(BOOL)a7 knownFolders:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  FPDXPCServicer *v17;
  _QWORD *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int IsEnabled;
  id WeakRetained;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  FPDXPCServicer *v38;
  _QWORD *v39;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  void *v47;
  void *v48;
  char v49;
  void *v50;
  void *v51;
  id v52;
  FPDXPCServicer *v53;
  id v54;
  _QWORD *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  char v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  char v69;
  id v70;
  BOOL v71;
  NSObject *v72;
  NSObject *v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  NSObject *v87;
  void *v88;
  void *v89;
  id v90;
  NSObject *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  char v99;
  NSObject *v100;
  void *v101;
  FPDXPCServicer *v102;
  char *v103;
  int v104;
  int v105;
  int v106;
  uint64_t v107;
  id v108;
  void *v109;
  NSObject *v110;
  NSObject *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  uint64_t v118;
  void *v119;
  id v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  void *v126;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  void *v135;
  FPDXPCServicer *v136;
  char *v137;
  int v138;
  void *v139;
  void *v140;
  char v141;
  _BOOL4 v142;
  void *v143;
  id v144;
  id v145;
  id v146;
  id v147;
  id v148;
  _QWORD v149[4];
  id v150;
  FPDXPCServicer *v151;
  id v152;
  char v153;
  void *v154;
  __int128 v155;
  __int128 v156;
  id v157;
  _QWORD v158[2];
  void (*v159)(uint64_t, void *);
  void *v160;
  id v161;
  FPDXPCServicer *v162;
  id v163;
  char v164;
  _QWORD v165[2];
  void (*v166)(uint64_t, void *);
  void *v167;
  FPDXPCServicer *v168;
  id v169;
  id v170;
  _QWORD v171[2];
  void (*v172)(uint64_t, void *);
  void *v173;
  FPDXPCServicer *v174;
  id v175;
  id v176;
  _BYTE buf[12];
  __int16 v178;
  FPDXPCServicer *v179;
  __int16 v180;
  const char *v181;
  __int16 v182;
  _BYTE v183[10];
  id v184;
  int v185;
  __int16 v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  _QWORD v190[4];

  v142 = a7;
  v190[1] = *MEMORY[0x1E0C80C00];
  v148 = a3;
  v14 = a4;
  v146 = a5;
  v145 = a6;
  v144 = a8;
  v15 = a9;
  v171[0] = MEMORY[0x1E0C809B0];
  v171[1] = 3221225472;
  v172 = __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke;
  v173 = &unk_1E8C75530;
  v174 = self;
  v16 = v15;
  v175 = v16;
  v17 = self;
  v18 = v171;
  v176 = 0;
  v143 = v14;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v17, "providerForIdentifier:enumerateEntitlementRequired:error:", v14, 1, &v176);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v176;
  if (!v19)
  {
    v172((uint64_t)v18, v20);
LABEL_7:
    v147 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v19, "invalidated"))
  {
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v19, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v172((uint64_t)v18, v25);

    goto LABEL_7;
  }
  v147 = v19;
LABEL_9:

  if (!v147)
    goto LABEL_88;
  objc_msgSend(v148, "volumeUUID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    IsEnabled = FPFeatureFlagEbihilIsEnabled();

    if (IsEnabled)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v17->_server);
      objc_msgSend(WeakRetained, "volumeManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "volumeUUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v170 = 0;
      objc_msgSend(v29, "libraryForVolume:createIfNeeded:error:", v30, 1, &v170);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v170;

      if (v31)
      {
        if (objc_msgSend(v31, "role") != 3)
          goto LABEL_20;
        objc_msgSend(v147, "domainsByID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35 == 0;

        if (!v36)
          goto LABEL_20;
        objc_msgSend(v31, "rootURL");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v165[0] = MEMORY[0x1E0C809B0];
        v165[1] = 3221225472;
        v166 = __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_200;
        v167 = &unk_1E8C75530;
        v168 = v17;
        v169 = v16;
        v38 = v17;
        v39 = v165;
        if (v37)
        {
          -[FPDXPCServicer connection](v38, "connection");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "fp_hasSandboxAccessToFile:logLevel:", v37, 0);

          if ((v41 & 1) != 0)
            goto LABEL_19;
          -[FPDXPCServicer connection](v38, "connection");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v42, "fp_hasOneOfEntitlements:logLevel:", v43, 0);

          if ((v44 & 1) != 0
            || (-[FPDXPCServicer connection](v38, "connection"),
                v45 = (void *)objc_claimAutoreleasedReturnValue(),
                v46 = objc_msgSend(v45, "fp_isNonSandboxedConnection"),
                v45,
                (v46 & 1) != 0))
          {
LABEL_19:

LABEL_20:
            goto LABEL_21;
          }
          FPNotPermittedWriteError();
          v118 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          FPInvalidParameterError();
          v118 = objc_claimAutoreleasedReturnValue();
        }
        v119 = (void *)v118;
        v166((uint64_t)v39, (void *)v118);

      }
      else
      {
        objc_msgSend(v148, "volumeUUID");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "fp_UUID");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v77, "isEqualToString:", *MEMORY[0x1E0CAAEE0]);

        if (v78)
        {
          fp_current_or_default_log();
          v79 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
            -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:].cold.6();

        }
        fpfs_adopt_log();
        v176 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v80 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
        {
          v123 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v123;
          v178 = 2112;
          v179 = v17;
          v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          v182 = 2112;
          *(_QWORD *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          v184 = v32;
          _os_log_debug_impl(&dword_1CF55F000, v80, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }

        (*((void (**)(id, _QWORD, id))v16 + 2))(v16, 0, v32);
        __fp_pop_log();

      }
      goto LABEL_88;
    }
  }
LABEL_21:
  if (objc_msgSend(v148, "testingModes"))
  {
    -[FPDXPCServicer connection](v17, "connection");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v190[0] = *MEMORY[0x1E0CAAEC0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v190, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v48, 0, 2);

    if ((v49 & 1) == 0)
    {
      fpfs_adopt_log();
      v176 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        v116 = FPPopLogSectionForBlock();
        FPNotPermittedError();
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v116;
        v178 = 2112;
        v179 = v17;
        v180 = 2080;
        v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDro"
               "p:knownFolders:completionHandler:]";
        v182 = 2112;
        *(_QWORD *)v183 = 0;
        *(_WORD *)&v183[8] = 2112;
        v184 = v117;
        _os_log_debug_impl(&dword_1CF55F000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPNotPermittedError();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v65);

      __fp_pop_log();
      goto LABEL_88;
    }
  }
  objc_msgSend(v146, "url");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v141 = objc_msgSend(v50, "startAccessingSecurityScopedResource");

  if (!v146)
  {
    if (v145)
    {
      v66 = (void *)MEMORY[0x1E0CB35C8];
      v188 = *MEMORY[0x1E0CB3308];
      v189 = v145;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v189, &v188, 1);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 513, v67);
      v63 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v145, "isFileURL") & 1) == 0)
      {
        fp_current_or_default_log();
        v91 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
          -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:].cold.5();

        fpfs_adopt_log();
        v176 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          v124 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v124;
          v178 = 2112;
          v179 = v17;
          v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          v182 = 2112;
          *(_QWORD *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          v184 = v63;
          _os_log_debug_impl(&dword_1CF55F000, v73, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        goto LABEL_74;
      }
      objc_msgSend(v147, "identifier");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));

      if ((v69 & 1) == 0)
      {
        fp_current_or_default_log();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:].cold.4();

        fpfs_adopt_log();
        v176 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          v132 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v132;
          v178 = 2112;
          v179 = v17;
          v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          v182 = 2112;
          *(_QWORD *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          v184 = v63;
          _os_log_debug_impl(&dword_1CF55F000, v73, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
        goto LABEL_74;
      }
      getpid();
      objc_msgSend(v145, "path");
      v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v70, "fileSystemRepresentation");
      v71 = fpfs_lp_sandbox_check() == 0;

      if (!v71)
      {
        fp_current_or_default_log();
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:].cold.3();

        fpfs_adopt_log();
        v176 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG))
        {
          v133 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v133;
          v178 = 2112;
          v179 = v17;
          v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          v182 = 2112;
          *(_QWORD *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          v184 = v63;
          _os_log_debug_impl(&dword_1CF55F000, v73, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }
LABEL_74:

        (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v63);
        __fp_pop_log();

LABEL_87:
        goto LABEL_88;
      }
      v120 = v145;

      v63 = v120;
    }
    else
    {
      v63 = 0;
    }
LABEL_52:
    if (objc_msgSend(v144, "count"))
    {
      fp_current_or_default_log();
      v81 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
        -[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:].cold.2();

      fpfs_adopt_log();
      v176 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v82 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      {
        v121 = FPPopLogSectionForBlock();
        FPNotSupportedError();
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v121;
        v178 = 2112;
        v179 = v17;
        v180 = 2080;
        v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDro"
               "p:knownFolders:completionHandler:]";
        v182 = 2112;
        *(_QWORD *)v183 = 0;
        *(_WORD *)&v183[8] = 2112;
        v184 = v122;
        _os_log_debug_impl(&dword_1CF55F000, v82, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPNotSupportedError();
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v83);

      __fp_pop_log();
    }
    else
    {
      if ((objc_msgSend(v143, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0
        || objc_msgSend(v143, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider")))
      {
        objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "currentPersona");
        v85 = (void *)objc_claimAutoreleasedReturnValue();

        v157 = 0;
        v139 = (void *)objc_msgSend(v85, "copyCurrentPersonaContextWithError:", &v157);
        v86 = v157;
        if (v86)
        {
          fp_current_or_default_log();
          v87 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
            -[FPDDomainExtensionBackend startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:].cold.2();

        }
        objc_msgSend(v147, "descriptor");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "personaIdentifier");
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v90 = (id)objc_msgSend(v85, "generateAndRestorePersonaContextWithPersonaUniqueString:", v89);

      }
      else
      {
        v139 = 0;
      }
      objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "currentPersona");
      v140 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v148, "setIsEnterpriseDomain:", objc_msgSend(v140, "isEnterprisePersona"));
      objc_msgSend(v148, "setIsDataSeparatedDomain:", objc_msgSend(v140, "isDataSeparatedPersona"));
      objc_msgSend(v140, "userPersonaUniqueString");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "setPersonaIdentifier:", v94);

      objc_msgSend(v148, "personaIdentifier");
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v95)
        goto LABEL_79;
      objc_msgSend(v148, "personaIdentifier");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v147, "descriptor");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "personaIdentifier");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      v99 = objc_msgSend(v96, "isEqual:", v98);

      if ((v99 & 1) == 0)
      {
        fp_current_or_default_log();
        v110 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
        {
          v125 = objc_loadWeakRetained((id *)&v17->_connection);
          v126 = v125;
          if (v125)
          {
            objc_msgSend(v125, "auditToken");
          }
          else
          {
            v155 = 0u;
            v156 = 0u;
          }
          FPExecutableNameForAuditToken();
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "descriptor");
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v135, "personaIdentifier");
          v136 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "personaIdentifier");
          v137 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          *(_QWORD *)&buf[4] = v134;
          v178 = 2112;
          v179 = v136;
          v180 = 2112;
          v181 = v137;
          _os_log_error_impl(&dword_1CF55F000, v110, OS_LOG_TYPE_ERROR, "[ERROR] %@ called fileproviderd to add a domain for an extension with persona %@ while running in persona %@", buf, 0x20u);

        }
        fpfs_adopt_log();
        v176 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v111 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG))
        {
          v127 = FPPopLogSectionForBlock();
          objc_msgSend(v148, "personaIdentifier");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v147, "descriptor");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "personaIdentifier");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          FPInvalidParameterErrorWithExpectation();
          v131 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v127;
          v178 = 2112;
          v179 = v17;
          v180 = 2080;
          v181 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBD"
                 "rop:knownFolders:completionHandler:]";
          v182 = 2112;
          *(_QWORD *)v183 = 0;
          *(_WORD *)&v183[8] = 2112;
          v184 = v131;
          _os_log_debug_impl(&dword_1CF55F000, v111, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        objc_msgSend(v148, "personaIdentifier");
        v112 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v147, "descriptor");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "personaIdentifier");
        v114 = (void *)objc_claimAutoreleasedReturnValue();
        FPInvalidParameterErrorWithExpectation();
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v115);

        __fp_pop_log();
      }
      else
      {
LABEL_79:
        fp_current_or_default_log();
        v100 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v148, "description");
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "fp_shortDescription");
          v102 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v148, "personaIdentifier");
          v103 = (char *)objc_claimAutoreleasedReturnValue();
          v138 = objc_msgSend(v140, "isPersonalPersona");
          v104 = objc_msgSend(v140, "isEnterprisePersona");
          v105 = objc_msgSend(v140, "isDefaultPersona");
          v106 = objc_msgSend(v140, "isSystemPersona");
          v107 = objc_msgSend(v140, "userPersonaType");
          *(_DWORD *)buf = 138414082;
          *(_QWORD *)&buf[4] = v101;
          v178 = 2112;
          v179 = v102;
          v180 = 2112;
          v181 = v103;
          v182 = 1024;
          *(_DWORD *)v183 = v138;
          *(_WORD *)&v183[4] = 1024;
          *(_DWORD *)&v183[6] = v104;
          LOWORD(v184) = 1024;
          *(_DWORD *)((char *)&v184 + 2) = v105;
          HIWORD(v184) = 1024;
          v185 = v106;
          v186 = 2048;
          v187 = v107;
          _os_log_impl(&dword_1CF55F000, v100, OS_LOG_TYPE_INFO, "[INFO] Adding domain %@ at URL %@ with persona unique string:'%@', perso:%{BOOL}d ent:%{BOOL}d def:%{BOOL}d sys:%{BOOL}d type:%lu", buf, 0x42u);

        }
        v154 = v139;
        _FPRestorePersona();
        v108 = v139;

        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v17, "pid"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        v149[0] = MEMORY[0x1E0C809B0];
        v149[1] = 3221225472;
        v149[2] = __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_211;
        v149[3] = &unk_1E8C77EC0;
        v153 = v141;
        v150 = v146;
        v151 = v17;
        v152 = v16;
        objc_msgSend(v147, "addDomain:byImportingDirectoryAtURL:userAllowedDBDrop:knownFolders:request:completionHandler:", v148, v63, v142, v144, v109, v149);

        v139 = v108;
      }

    }
    goto LABEL_87;
  }
  objc_msgSend(v146, "url");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v158[0] = MEMORY[0x1E0C809B0];
  v158[1] = 3221225472;
  v159 = __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_201;
  v160 = &unk_1E8C77E98;
  v164 = v141;
  v52 = v146;
  v161 = v52;
  v162 = v17;
  v163 = v16;
  v53 = v17;
  v54 = v51;
  v55 = v158;
  if (v54)
  {
    -[FPDXPCServicer connection](v53, "connection");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v56, "fp_hasSandboxAccessToFile:logLevel:", v54, 0);

    if ((v57 & 1) != 0)
      goto LABEL_28;
    -[FPDXPCServicer connection](v53, "connection");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v58, "fp_hasOneOfEntitlements:logLevel:", v59, 0);

    if ((v60 & 1) != 0
      || (-[FPDXPCServicer connection](v53, "connection"),
          v61 = (void *)objc_claimAutoreleasedReturnValue(),
          v62 = objc_msgSend(v61, "fp_isNonSandboxedConnection"),
          v61,
          (v62 & 1) != 0))
    {
LABEL_28:

      objc_msgSend(v52, "url");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
    FPNotPermittedWriteError();
    v74 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    FPInvalidParameterError();
    v74 = objc_claimAutoreleasedReturnValue();
  }
  v75 = (void *)v74;
  v159((uint64_t)v55, (void *)v74);

LABEL_88:
}

- (id)providerForIdentifier:(id)a3 enumerateEntitlementRequired:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id WeakRetained;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v6 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[FPDXPCServicer server](self, "server");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "updateProvidersIfNecessary");
  -[FPDXPCServicer _providerForIdentifier:enumerateEntitlementRequired:error:](self, "_providerForIdentifier:enumerateEntitlementRequired:error:", v8, v6, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
      objc_msgSend(WeakRetained, "fp_bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v8;
      v20 = 2112;
      v21 = v16;
      _os_log_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] No provider found with identifier %@ for calling bundle %@", (uint8_t *)&v18, 0x16u);

    }
  }

  return v12;
}

- (void)setServer:(id)a3
{
  objc_storeWeak((id *)&self->_server, a3);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (FPDXPCServicer)init
{
  FPDXPCServicer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  OS_os_log *log;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FPDXPCServicer;
  v2 = -[FPDXPCServicer init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("servicer", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    fp_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    log = v2->_log;
    v2->_log = (OS_os_log *)v6;

  }
  return v2;
}

- (void)fetchDaemonOperationIDsWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  FPDXPCServicer *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  NSObject *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  void (*v22)(uint64_t, void *);
  void *v23;
  FPDXPCServicer *v24;
  id v25;
  _BYTE buf[24];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __63__FPDXPCServicer_fetchDaemonOperationIDsWithCompletionHandler___block_invoke;
  v23 = &unk_1E8C75530;
  v24 = self;
  v5 = v4;
  v25 = v5;
  v6 = v21;
  v7 = self;
  -[FPDXPCServicer connection](v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)buf = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&buf[8] = v9;
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "fp_hasOneOfEntitlements:", v10);
  if ((v11 & 1) != 0)
  {

    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer fetchDaemonOperationIDsWithCompletionHandler:].cold.1();

    WeakRetained = objc_loadWeakRetained((id *)&v7->_server);
    objc_msgSend(WeakRetained, "operationEngine");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inFlightOperations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fp_map:", &__block_literal_global_287);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v19 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2080;
      v27 = "-[FPDXPCServicer fetchDaemonOperationIDsWithCompletionHandler:]";
      v28 = 2112;
      v29 = v16;
      v30 = 2112;
      v31 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, void *, _QWORD))v5 + 2))(v5, v16, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22((uint64_t)v6, v18);

  }
}

- (void)fetchListOfMonitoredApps:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  FPDXPCServicer *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char v11;
  id WeakRetained;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  void (*v23)(uint64_t, void *);
  void *v24;
  FPDXPCServicer *v25;
  id v26;
  _BYTE buf[24];
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v23 = __43__FPDXPCServicer_fetchListOfMonitoredApps___block_invoke;
  v24 = &unk_1E8C75530;
  v25 = self;
  v5 = v4;
  v26 = v5;
  v6 = v22;
  v7 = self;
  -[FPDXPCServicer connection](v7, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)buf = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&buf[8] = v9;
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "fp_hasOneOfEntitlements:", v10);
  if ((v11 & 1) != 0)
  {

    WeakRetained = objc_loadWeakRetained((id *)&v7->_server);
    objc_msgSend(WeakRetained, "appMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "startMonitoring");
    fpfs_adopt_log();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = FPPopLogSectionForBlock();
      objc_msgSend(v13, "appRegistry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "listOfMonitoredApps");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      *(_WORD *)&buf[22] = 2080;
      v28 = "-[FPDXPCServicer fetchListOfMonitoredApps:]";
      v29 = 2112;
      v30 = v20;
      v31 = 2112;
      v32 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    objc_msgSend(v13, "appRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "listOfMonitoredApps");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v5 + 2))(v5, v16, 0);

    __fp_pop_log();
  }
  else
  {
    FPNotPermittedError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23((uint64_t)v6, v17);

  }
}

- (void)forceIndexingInForeground:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t *v9;
  FPDDomainIndexerSchedulerAssertion *v10;
  void *v11;
  char v12;
  FPDDomainIndexerSchedulerAssertion *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  FPDXPCServicer *v19;
  id v20;
  _QWORD v21[2];

  v4 = a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v21[0] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __62__FPDXPCServicer_forceIndexingInForeground_completionHandler___block_invoke;
  v18 = &unk_1E8C75530;
  v19 = self;
  v20 = v6;
  v8 = v7;
  v9 = &v15;
  v10 = (FPDDomainIndexerSchedulerAssertion *)v6;
  -[FPDXPCServicer connection](self, "connection", v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v8);

  if ((v12 & 1) != 0)
  {

    v13 = -[FPDDomainIndexerSchedulerAssertion initWithPID:forceForeground:]([FPDDomainIndexerSchedulerAssertion alloc], "initWithPID:forceForeground:", -[FPDXPCServicer pid](self, "pid"), v4);
    (*(void (**)(FPDDomainIndexerSchedulerAssertion *, FPDDomainIndexerSchedulerAssertion *, _QWORD))&v10->_pid)(v10, v13, 0);

    v10 = v13;
  }
  else
  {
    FPNotPermittedError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17((uint64_t)v9, v14);

  }
}

- (void)providerDomainForIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  FPDXPCServicer *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  void (*v24)(uint64_t, void *);
  void *v25;
  FPDXPCServicer *v26;
  id v27;
  _BYTE buf[24];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v24 = __64__FPDXPCServicer_providerDomainForIdentifier_completionHandler___block_invoke;
  v25 = &unk_1E8C75530;
  v26 = self;
  v8 = v7;
  v27 = v8;
  v9 = v23;
  v10 = self;
  -[FPDXPCServicer connection](v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)buf = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&buf[8] = v12;
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if ((v14 & 1) != 0)
  {

    -[FPDXPCServicer server](v10, "server");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extensionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "providerDomainsByID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectForKeyedSubscript:", v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v10;
      *(_WORD *)&buf[22] = 2080;
      v29 = "-[FPDXPCServicer providerDomainForIdentifier:completionHandler:]";
      v30 = 2112;
      v31 = v18;
      v32 = 2112;
      v33 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s domain: %@, error: %@", buf, 0x34u);
    }

    (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v18, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24((uint64_t)v9, v20);

  }
}

void __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = a1[4];
    v10 = a1[5];
    *(_DWORD *)buf = 134219266;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2080;
    v17 = "-[FPDXPCServicer fetchAndStartEnumeratingWithSettings:observer:completionHandler:]_block_invoke_3";
    v18 = 2112;
    v19 = v5;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(a1[6] + 16))();
  __fp_pop_log();

}

void __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  WrappedFPXEnumeratorObserverProxy *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _BYTE location[12];
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  v25 = v10;
  if (!v9 || v12)
  {
    fpfs_adopt_log();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v23 = FPPopLogSectionForBlock();
      v24 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)location = 134219266;
      *(_QWORD *)&location[4] = v23;
      v33 = 2112;
      v34 = v24;
      v35 = 2080;
      v36 = "-[FPDXPCServicer fetchAndStartEnumeratingWithSettings:observer:completionHandler:]_block_invoke";
      v37 = 2112;
      v38 = 0;
      v39 = 2112;
      v40 = 0;
      v41 = 2112;
      v42 = v13;
      _os_log_debug_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", location, 0x3Eu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
  else
  {
    v14 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v14, "setEnumeratedItemID:", v11);
    v15 = -[WrappedFPXEnumeratorObserverProxy initWithTarget:]([WrappedFPXEnumeratorObserverProxy alloc], "initWithTarget:", *(_QWORD *)(a1 + 48));
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setRequestEffectivePID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("enumerator of %@ for %@"), v14, v10, v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPrettyDescription:", v17);

    *(_QWORD *)location = 0;
    objc_msgSend(v9, "session");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak((id *)location, v18);

    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke_301;
    v29[3] = &unk_1E8C757B0;
    objc_copyWeak(&v30, (id *)location);
    objc_msgSend(v16, "setStopBlock:", v29);
    if (!v16)
      __assert_rtn("-[FPDXPCServicer fetchAndStartEnumeratingWithSettings:observer:completionHandler:]_block_invoke_2", "FPDXPCServicer.m", 3686, "extender");
    if (objc_msgSend(v14, "wantsDirectExtensionEnumeration"))
      objc_msgSend(v9, "extensionBackend");
    else
      objc_msgSend(v9, "defaultBackend");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v19;
    v26[1] = 3221225472;
    v26[2] = __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke_3;
    v26[3] = &unk_1E8C781D0;
    v26[4] = *(_QWORD *)(a1 + 32);
    v28 = *(id *)(a1 + 56);
    v22 = v16;
    v27 = v22;
    objc_msgSend(v21, "enumerateWithSettings:lifetimeExtender:observer:completionHandler:", v14, v22, v15, v26);

    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)location);

  }
}

void __76__FPDXPCServicer_startAccessingOperationServiceForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  unint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 | v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "startExtendingLifetime");
    fpfs_adopt_log();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v15 = FPPopLogSectionForBlock();
      v17 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(a1 + 40);
      objc_msgSend(v16, "providerDomainID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219778;
      v24 = v15;
      v25 = 2112;
      v26 = v17;
      v27 = 2080;
      v28 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]_block_invoke";
      v29 = 2112;
      v30 = v7;
      v31 = 2112;
      v32 = v8;
      v33 = 2112;
      v34 = v16;
      v35 = 2112;
      v36 = v18;
      v37 = 2112;
      v38 = v9;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);

    }
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "providerDomainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, unint64_t, unint64_t, void *, void *, id))(v12 + 16))(v12, v7, v8, v11, v13, v9);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v19 = FPPopLogSectionForBlock();
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219778;
      v24 = v19;
      v25 = 2112;
      v26 = v20;
      v27 = 2080;
      v28 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]_block_invoke";
      v29 = 2112;
      v30 = 0;
      v31 = 2112;
      v32 = 0;
      v33 = 2112;
      v34 = 0;
      v35 = 2112;
      v36 = 0;
      v37 = 2112;
      v38 = v9;
      _os_log_debug_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    __fp_pop_log();

  }
}

- (void)startAccessingOperationServiceForProviderDomainID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  FPDXPCServicer *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v27 = 0;
    -[FPDXPCServicer createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:](self, "createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:", v6, 0, 0, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    v28 = 0;
    objc_msgSend(v8, "domainOrNil:", &v28);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v8)
    {
      if (v10)
      {
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __76__FPDXPCServicer_startAccessingOperationServiceForProviderDomainID_handler___block_invoke;
        v23[3] = &unk_1E8C78158;
        v23[4] = self;
        v25 = v7;
        v24 = v8;
        objc_msgSend(v11, "fetchOperationServiceOrEndpointWithRequest:completionHandler:", v12, v23);

      }
      else
      {
        fpfs_adopt_log();
        v26 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          v21 = FPPopLogSectionForBlock();
          FPProviderNotFoundError();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219778;
          v30 = v21;
          v31 = 2112;
          v32 = self;
          v33 = 2080;
          v34 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]";
          v35 = 2112;
          v36 = 0;
          v37 = 2112;
          v38 = 0;
          v39 = 2112;
          v40 = 0;
          v41 = 2112;
          v42 = 0;
          v43 = 2112;
          v44 = v22;
          _os_log_debug_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);

        }
        FPProviderNotFoundError();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, 0, v17);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v20 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219778;
        v30 = v20;
        v31 = 2112;
        v32 = self;
        v33 = 2080;
        v34 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]";
        v35 = 2112;
        v36 = 0;
        v37 = 2112;
        v38 = 0;
        v39 = 2112;
        v40 = 0;
        v41 = 2112;
        v42 = 0;
        v43 = 2112;
        v44 = v9;
        _os_log_debug_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, 0, 0, v9);
      __fp_pop_log();

    }
  }
  else
  {
    fpfs_adopt_log();
    v28 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v18 = FPPopLogSectionForBlock();
      FPInvalidParameterError();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219778;
      v30 = v18;
      v31 = 2112;
      v32 = self;
      v33 = 2080;
      v34 = "-[FPDXPCServicer startAccessingOperationServiceForProviderDomainID:handler:]";
      v35 = 2112;
      v36 = 0;
      v37 = 2112;
      v38 = 0;
      v39 = 2112;
      v40 = 0;
      v41 = 2112;
      v42 = 0;
      v43 = 2112;
      v44 = v19;
      _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);

    }
    FPInvalidParameterError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, 0, v14);

    __fp_pop_log();
  }

}

- (id)providersForCurrentConnection
{
  void *v3;
  void *v4;
  NSXPCConnection **p_connection;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  -[FPDXPCServicer server](self, "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  p_connection = &self->_connection;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "fp_bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "defaultProviderWithTopLevelBundleIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(v4, "providerWithIdentifier:reason:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v9 = (void *)MEMORY[0x1E0CA5898];
        v10 = objc_loadWeakRetained((id *)p_connection);
        v11 = v10;
        if (v10)
        {
          objc_msgSend(v10, "auditToken");
        }
        else
        {
          v23 = 0u;
          v24 = 0u;
        }
        objc_msgSend(v9, "bundleRecordForAuditToken:error:", &v23, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (objc_msgSend(v17, "containingBundleRecord"),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v18, "bundleIdentifier"),
              v19 = (void *)objc_claimAutoreleasedReturnValue(),
              v18,
              !v19))
        {

LABEL_18:
          v20 = objc_loadWeakRetained((id *)p_connection);
          objc_msgSend(v20, "fp_applicationGroups");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "providersWithGroupContainers:bundleIdentifier:", v21, v7);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_7;
        }
        objc_msgSend(v4, "defaultProviderWithTopLevelBundleIdentifier:", v19);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
          goto LABEL_18;
      }
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_7:
  objc_msgSend(v8, "descriptor", v23, v24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topLevelBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13 || !objc_msgSend(v8, "isAppExtensionReachable"))
  {
    objc_msgSend(v4, "providersWithTopLevelBundleIdentifier:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "asAppExtensionBackedProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (void)fetchAndStartEnumeratingWithSettings:(id)a3 observer:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke;
  v14[3] = &unk_1E8C781F8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  -[FPDXPCServicer _performWithCheckedEnumerationAttributes:completionHandler:](self, "_performWithCheckedEnumerationAttributes:completionHandler:", v12, v14);

}

- (void)documentURLFromItemID:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  FPDXPCServicer *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  id v60;
  _BOOL4 v61;
  _BOOL4 v62;
  void *v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[2];
  void (*v67)(uint64_t, void *);
  void *v68;
  FPDXPCServicer *v69;
  id v70;
  id v71;
  id v72;
  uint8_t buf[4];
  uint64_t v74;
  __int16 v75;
  FPDXPCServicer *v76;
  __int16 v77;
  const char *v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  _QWORD v85[4];

  v61 = a4;
  v62 = a5;
  v85[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:].cold.2();

  -[FPDXPCServicer connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = *MEMORY[0x1E0CAAEA8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fp_hasOneOfEntitlements:logLevel:", v12, 0);

  if ((v13 & 1) != 0)
    goto LABEL_19;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fp_bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "providerID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (v17)
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:].cold.1(self, v18);

    fpfs_adopt_log();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v50 = FPPopLogSectionForBlock();
      FPNotPermittedError();
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v74 = v50;
      v75 = 2112;
      v76 = self;
      v77 = 2080;
      v78 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
      v79 = 2112;
      v80 = 0;
      v81 = 2112;
      v82 = 0;
      v83 = 2112;
      v84 = v51;
      _os_log_debug_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

    }
    FPNotPermittedError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v20);

    __fp_pop_log();
    goto LABEL_33;
  }
  objc_msgSend(v8, "providerID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v67 = __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke;
  v68 = &unk_1E8C774D8;
  v69 = self;
  v60 = v8;
  v70 = v60;
  v71 = v9;
  v22 = self;
  v23 = v66;
  v72 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v22, "providerForIdentifier:enumerateEntitlementRequired:error:", v21, 1, &v72);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v72;
  if (!v24)
  {
    v67((uint64_t)v23, v25);
LABEL_16:
    v31 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend(v24, "invalidated"))
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v74 = (uint64_t)v24;
      _os_log_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v27 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v24, "identifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v67((uint64_t)v23, v30);

    goto LABEL_16;
  }
  v31 = v24;
LABEL_18:

  if (!v31)
  {
    v8 = v60;
    goto LABEL_33;
  }
LABEL_19:
  if (v8)
  {
    objc_msgSend(v8, "identifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "length") == 0;

    if (!v33)
    {
      v72 = 0;
      -[FPDXPCServicer server](self, "server");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "extensionManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "domainFromItemID:checkInvalidation:reason:", v8, 1, &v72);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        v37 = v8;
      }
      else
      {
        -[FPDXPCServicer tryTransformItemIDAfterMigration:](self, "tryTransformItemIDAfterMigration:", v8);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        -[FPDXPCServicer server](self, "server");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "extensionManager");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "domainFromItemID:checkInvalidation:reason:", v37, 1, &v72);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v36)
        {
          fpfs_adopt_log();
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          fp_current_or_default_log();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          {
            v57 = FPPopLogSectionForBlock();
            objc_msgSend(v37, "providerDomainID");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            FPProviderNotFoundError();
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219266;
            v74 = v57;
            v75 = 2112;
            v76 = self;
            v77 = 2080;
            v78 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
            v79 = 2112;
            v80 = 0;
            v81 = 2112;
            v82 = 0;
            v83 = 2112;
            v84 = v59;
            _os_log_debug_impl(&dword_1CF55F000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

          }
          objc_msgSend(v37, "providerDomainID");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          FPProviderNotFoundError();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v49);

          __fp_pop_log();
          goto LABEL_31;
        }
      }
      objc_msgSend(v36, "defaultBackend");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v64[0] = MEMORY[0x1E0C809B0];
      v64[1] = 3221225472;
      v64[2] = __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_139;
      v64[3] = &unk_1E8C755A8;
      v64[4] = self;
      v65 = v9;
      objc_msgSend(v45, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v37, v61, v62, 0, v46, v64);

LABEL_31:
      v8 = v37;
      goto LABEL_33;
    }
    fpfs_adopt_log();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
    {
      v54 = FPPopLogSectionForBlock();
      objc_msgSend(v8, "identifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundError();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v74 = v54;
      v75 = 2112;
      v76 = self;
      v77 = 2080;
      v78 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
      v79 = 2112;
      v80 = 0;
      v81 = 2112;
      v82 = 0;
      v83 = 2112;
      v84 = v56;
      _os_log_debug_impl(&dword_1CF55F000, v40, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

    }
    objc_msgSend(v8, "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    FPItemNotFoundError();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v42);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    v72 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v52 = FPPopLogSectionForBlock();
      FPInvalidParameterError();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v74 = v52;
      v75 = 2112;
      v76 = self;
      v77 = 2080;
      v78 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:]";
      v79 = 2112;
      v80 = 0;
      v81 = 2112;
      v82 = 0;
      v83 = 2112;
      v84 = v53;
      _os_log_debug_impl(&dword_1CF55F000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

    }
    FPInvalidParameterError();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v9 + 2))(v9, 0, 0, v39);

    __fp_pop_log();
    v8 = 0;
  }
LABEL_33:

}

- (void)_performWithCheckedEnumerationAttributes:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
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
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  FPDXPCServicer *v56;
  id v57;
  id v58;
  id v59;
  uint64_t v60;
  id v61[2];

  v6 = a3;
  v7 = a4;
  +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "requireSandboxAccess") & 1) != 0
    || (objc_msgSend(v6, "enumeratedURL"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer _performWithCheckedEnumerationAttributes:completionHandler:].cold.3();

    v11 = 0;
  }
  else
  {
    objc_msgSend(v6, "enumeratedItemID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "providerID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = 0;
    -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](self, "providerForIdentifier:enumerateEntitlementRequired:error:", v18, 1, v61);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v61[0];

    if (v19)
    {
      v20 = 0;
      goto LABEL_15;
    }
  }
  objc_msgSend(v6, "searchQuery");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

    goto LABEL_9;
  }
  objc_msgSend(v6, "enumeratedItemID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", *MEMORY[0x1E0CAABD8]);

  if (v15)
  {
LABEL_9:
    if (v11)
    {
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, 0, v11);
    }
    else
    {
      FPNotPermittedError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v16);

      v11 = 0;
    }
    goto LABEL_32;
  }
  v19 = 0;
  v20 = 1;
LABEL_15:
  objc_msgSend(v6, "enumeratedURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[FPDXPCServicer connection](self, "connection");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumeratedURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "fp_hasSandboxAccessToFile:accessType:logLevel:", v23, *MEMORY[0x1E0CAA668], 1);

    if ((v24 & 1) != 0)
    {
      v47 = v19;
      v60 = 0;
      -[FPDXPCServicer server](self, "server");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "extensionManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enumeratedURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "domainForURL:reason:", v27, &v60);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v28, "defaultBackend");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "enumeratedURL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_295;
        v49[3] = &unk_1E8C77B90;
        v50 = v6;
        v53 = v7;
        v51 = v28;
        v52 = v8;
        objc_msgSend(v29, "itemIDForURL:requireProviderItemID:request:completionHandler:", v30, 0, v31, v49);

        v32 = v50;
      }
      else
      {
        objc_msgSend(v6, "enumeratedURL");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundErrorForURL();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v46);

      }
    }
    else
    {
      fp_current_or_default_log();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer _performWithCheckedEnumerationAttributes:completionHandler:].cold.2(v6, v42);

      FPNotPermittedError();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v43);

    }
  }
  else
  {
    v48 = v19;
    v60 = 0;
    -[FPDXPCServicer server](self, "server");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "extensionManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumeratedItemID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "domainFromItemID:reason:", v35, &v60);
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = (void *)v36;
    if (v36)
    {
      v38 = v48;
      if (v20)
      {
        fp_current_or_default_log();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
          -[FPDXPCServicer _performWithCheckedEnumerationAttributes:completionHandler:].cold.1();

        objc_msgSend(v37, "defaultBackend");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "enumeratedItemID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke;
        v54[3] = &unk_1E8C781A8;
        v55 = v6;
        v59 = v7;
        v56 = self;
        v57 = v37;
        v58 = v8;
        objc_msgSend(v40, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v41, 1, 1, 0, v58, v54);

      }
      else
      {
        objc_msgSend(v6, "enumeratedItemID");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *, void *, void *, _QWORD))v7 + 2))(v7, v37, v8, v40, 0);
      }
    }
    else
    {
      objc_msgSend(v6, "enumeratedItemID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "providerDomainID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v45);

      v38 = v48;
    }

  }
LABEL_32:

}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "processIdentifier");
  FPExecutableNameForProcessIdentifier();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@[%d]>"), v4, self, v6, objc_msgSend(v7, "processIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)invalidate
{
  FPDXPCServicer *v2;
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = v2->_providerServicers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidate", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

  objc_sync_exit(v2);
}

- (BOOL)_isNonSandboxedConnection
{
  void *v2;
  char v3;

  -[FPDXPCServicer connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fp_isNonSandboxedConnection");

  return v3;
}

- (BOOL)clientHasSandboxAccessToFile:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[FPDXPCServicer connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fp_hasSandboxAccessToFile:logLevel:", v4, 2);

  return v6;
}

- (id)createDomainServicerForProviderDomainID:(id)a3 provider:(id)a4 enumerateEntitlementRequired:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  FPDXPCDomainServicer *v13;
  void *v14;
  void *v15;
  FPDXPCDomainServicer *v16;
  FPDXPCServicer *v17;
  NSHashTable *providerServicers;
  uint64_t v19;
  NSHashTable *v20;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  if (v11
    || (objc_msgSend(v10, "fp_toProviderID"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](self, "providerForIdentifier:enumerateEntitlementRequired:error:", v12, v7, a6), v11 = (id)objc_claimAutoreleasedReturnValue(), v12, v11))
  {
    v13 = [FPDXPCDomainServicer alloc];
    -[FPDXPCServicer server](self, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPDXPCServicer connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[FPDXPCDomainServicer initWithServer:providerDomainID:domain:connection:](v13, "initWithServer:providerDomainID:domain:connection:", v14, v10, 0, v15);

    v17 = self;
    objc_sync_enter(v17);
    providerServicers = v17->_providerServicers;
    if (!providerServicers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v17->_providerServicers;
      v17->_providerServicers = (NSHashTable *)v19;

      providerServicers = v17->_providerServicers;
    }
    -[NSHashTable addObject:](providerServicers, "addObject:", v16);
    objc_sync_exit(v17);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)startAccessingServiceWithName:(id)a3 itemID:(id)a4 domain:(id)a5 connection:(id)a6 enumerateEntitlementRequired:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  SEL v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  FPDXPCServicer *v35;
  id v36;
  id v37;
  id v38;
  SEL v39;
  uint64_t v40;
  id v41;

  v9 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v32 = a6;
  v18 = a8;
  objc_msgSend(v16, "providerDomainID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = a2;
  if (v17)
  {
    objc_msgSend(v17, "provider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  v41 = 0;
  -[FPDXPCServicer createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:](self, "createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:", v19, v21, v9, &v41, v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v41;
  if (v17)
  {

    if (!v22)
      goto LABEL_10;
  }
  else
  {

    if (!v22)
    {
LABEL_10:
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, id))v18 + 2))(v18, 0, 0, 0, 0, v23);
LABEL_12:

      v29 = v31;
      v28 = v32;
      goto LABEL_13;
    }
    v40 = 0;
    -[FPDXPCServicer server](self, "server");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "extensionManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "domainFromItemID:reason:", v16, &v40);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      objc_msgSend(v16, "providerID");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v18 + 2))(v18, 0, 0, 0, 0, v30);

      goto LABEL_12;
    }
  }
  objc_msgSend(v17, "defaultBackend");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke;
  v33[3] = &unk_1E8C77B68;
  v38 = v18;
  v28 = v32;
  v39 = v20;
  v34 = v32;
  v35 = self;
  v29 = v31;
  v36 = v31;
  v37 = v22;
  objc_msgSend(v26, "fetchServicesForItemID:allowRestrictedSources:request:completionHandler:", v16, 0, v27, v33);

LABEL_13:
}

void __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t v24;
  char v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v7)
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "fp_isNonSandboxedConnection");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[2] = __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke_82;
    v21[3] = &unk_1E8C77B40;
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(a1 + 48);
    v24 = *(_QWORD *)(a1 + 72);
    v21[4] = v12;
    v21[1] = 3221225472;
    v22 = v13;
    v25 = v11;
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v8, "fp_map:", v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (*(_QWORD *)(a1 + 48) && !objc_msgSend(v14, "count"))
    {
      v20 = *(_QWORD *)(a1 + 64);
      FPNotSupportedError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v20 + 16))(v20, 0, 0, 0, 0, v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "startExtendingLifetime");
      v17 = *(void **)(a1 + 56);
      v16 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v17, "providerDomainID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *, void *, void *, void *))(v16 + 16))(v16, v7, v17, v18, v15, v10);
    }

  }
  else
  {
    if (!v9)
    {
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke_cold_1();

      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("error"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

id __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke_82(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "serviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ nil message interface name"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDXPCServicer startAccessingServiceWithName:itemID:domain:connection:enumerateEntitlementRequired:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDXPCServicer.m", 736, (const char *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String"));
  }
  v5 = v4;
  if (*(_QWORD *)(a1 + 40) && !objc_msgSend(v4, "isEqualToString:"))
    goto LABEL_6;
  objc_msgSend(v3, "requiredEntitlement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (*(_BYTE *)(a1 + 64))
    {
LABEL_6:
      v7 = 0;
      goto LABEL_17;
    }
    v11 = *(void **)(a1 + 48);
    objc_msgSend(v3, "requiredEntitlement");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:logLevel:", v13, 0);

    v7 = 0;
    if ((v14 & 1) == 0)
      goto LABEL_17;
LABEL_16:
    objc_msgSend(v3, "serviceName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.iWork")))
  {
    if (*(_BYTE *)(a1 + 64))
      goto LABEL_16;
    v8 = *(void **)(a1 + 48);
    v22 = *MEMORY[0x1E0CAAF00];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fp_hasOneOfEntitlements:logLevel:", v9, 0);

    v7 = 0;
    if ((v10 & 1) != 0)
      goto LABEL_16;
  }
  else
  {
    if (!objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.CloudDocs.AccountManagement")))
      goto LABEL_16;
    if (*(_BYTE *)(a1 + 64))
      goto LABEL_16;
    v15 = *(void **)(a1 + 48);
    v21 = *MEMORY[0x1E0CAAE88];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    v7 = 0;
    if (v17)
      goto LABEL_16;
  }
LABEL_17:

  return v7;
}

- (void)wakeUpForURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  FPDXPCServicer *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FPDXPCServicer wakeUpForURL:completionHandler:].cold.1(a2);

  fpfs_adopt_log();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = FPPopLogSectionForBlock();
    v13 = (void *)objc_opt_new();
    *(_DWORD *)buf = 134219010;
    v16 = v12;
    v17 = 2112;
    v18 = self;
    v19 = 2080;
    v20 = "-[FPDXPCServicer wakeUpForURL:completionHandler:]";
    v21 = 2112;
    v22 = 0;
    v23 = 2112;
    v24 = v13;
    _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error:%@, transaction:%@", buf, 0x34u);

  }
  v11 = (void *)objc_opt_new();
  v8[2](v8, 0, v11);

  __fp_pop_log();
}

- (void)extendBookmarkForItemID:(id)a3 consumerID:(id)a4 completionHandler:(id)a5
{
  id v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  char v17;
  id WeakRetained;
  FPDXPCServicer *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  void (*v34)(uint64_t, void *);
  void *v35;
  FPDXPCServicer *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  FPDXPCServicer *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (char *)a4;
  v10 = a5;
  v49[0] = *MEMORY[0x1E0CAAE78];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v34 = __71__FPDXPCServicer_extendBookmarkForItemID_consumerID_completionHandler___block_invoke;
  v35 = &unk_1E8C774D8;
  v36 = self;
  v12 = v8;
  v37 = v12;
  v13 = v10;
  v38 = v13;
  v14 = v11;
  v15 = v33;
  -[FPDXPCServicer connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fp_hasOneOfEntitlements:", v14);

  if ((v17 & 1) != 0)
  {

    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "fp_bundleIdentifier");
    v19 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v40 = (uint64_t)v12;
      v41 = 2112;
      v42 = v19;
      v43 = 2112;
      v44 = v9;
      _os_log_debug_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Extending bookmark privileges for: “%@” from bundle %@ to %@.", buf, 0x20u);
    }

    if (v9)
    {
      +[FPDAccessControlStore sharedStore](FPDAccessControlStore, "sharedStore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "bookmarkForItemID:consumerIdentifier:", v12, v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer extendBookmarkForItemID:consumerID:completionHandler:].cold.1();

      fpfs_adopt_log();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v28 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219010;
        v40 = v28;
        v41 = 2112;
        v42 = self;
        v43 = 2080;
        v44 = "-[FPDXPCServicer extendBookmarkForItemID:consumerID:completionHandler:]";
        v45 = 2112;
        v46 = v22;
        v47 = 2112;
        v48 = 0;
        _os_log_debug_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*((void (**)(id, void *, _QWORD))v13 + 2))(v13, v22, 0);
      __fp_pop_log();

    }
    else
    {
      fpfs_adopt_log();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = FPPopLogSectionForBlock();
        FPNotPermittedWriteError();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v40 = v29;
        v41 = 2112;
        v42 = self;
        v43 = 2080;
        v44 = "-[FPDXPCServicer extendBookmarkForItemID:consumerID:completionHandler:]";
        v45 = 2112;
        v46 = 0;
        v47 = 2112;
        v48 = v30;
        _os_log_debug_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPNotPermittedWriteError();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v27);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34((uint64_t)v15, v25);

  }
}

void __71__FPDXPCServicer_extendBookmarkForItemID_consumerID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __71__FPDXPCServicer_extendBookmarkForItemID_consumerID_completionHandler___block_invoke_cold_1(a1, v4);

  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCServicer extendBookmarkForItemID:consumerID:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = 0;
    v17 = 2112;
    v18 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

- (void)extendBookmarkForFileURL:(id)a3 toConsumerID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[5];
  id v38;
  id v39;
  id v40;
  _BYTE buf[42];
  __int16 v42;
  void *v43;
  _QWORD v44[3];

  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "fp_bundleIdentifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v8, "fp_shortDescription");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v27;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v9;
    _os_log_debug_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Extending bookmark privileges for: “%@” from bundle %@ to %@.", buf, 0x20u);

  }
  if (v9 && v35)
  {
    v13 = 0;
  }
  else
  {
    FPNotPermittedWriteError();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v14, "fp_hasSandboxAccessToFile:logLevel:", v8, 0) & 1) == 0)
  {
    -[FPDXPCServicer connection](self, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CAAE78];
    v44[0] = *MEMORY[0x1E0CAAE78];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v17, 0);

    if ((v18 & 1) != 0)
      goto LABEL_13;
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      -[FPDXPCServicer connection](self, "connection");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v34, "processIdentifier");
      -[FPDXPCServicer connection](self, "connection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "processIdentifier");
      FPExecutableNameForProcessIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "fp_shortDescription");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&buf[4] = v33;
      *(_WORD *)&buf[8] = 2112;
      *(_QWORD *)&buf[10] = v31;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v16;
      *(_WORD *)&buf[28] = 2112;
      *(_QWORD *)&buf[30] = v32;
      _os_log_debug_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) has neither sandbox access nor %@ entitlement to extend bookmark for %@", buf, 0x26u);

    }
    FPNotPermittedWriteError();
    v14 = v13;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_13:
  if (!v13)
  {
    *(_QWORD *)buf = 0;
    -[FPDXPCServicer server](self, "server");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "extensionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "domainForURL:reason:", v8, buf);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "defaultBackend");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __74__FPDXPCServicer_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke;
      v37[3] = &unk_1E8C77B90;
      v37[4] = self;
      v40 = v10;
      v38 = v9;
      v39 = v8;
      objc_msgSend(v25, "itemIDForURL:requireProviderItemID:request:completionHandler:", v39, 0, v26, v37);

      goto LABEL_21;
    }
    FPProviderNotFoundErrorForURL();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_21;
  }
  fp_current_or_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "fp_shortDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v28;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v35;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v9;
    *(_WORD *)&buf[32] = 2112;
    *(_QWORD *)&buf[34] = v13;
    _os_log_error_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_ERROR, "[ERROR] Could not extend bookmark privileges for %@ from bundle %@ to consumer ID %@, error: %@", buf, 0x2Au);

  }
  fpfs_adopt_log();
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v29 = FPPopLogSectionForBlock();
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    *(_WORD *)&buf[22] = 2080;
    *(_QWORD *)&buf[24] = "-[FPDXPCServicer extendBookmarkForFileURL:toConsumerID:completionHandler:]";
    *(_WORD *)&buf[32] = 2112;
    *(_QWORD *)&buf[34] = 0;
    v42 = 2112;
    v43 = v13;
    _os_log_debug_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s bookmarkstring: %@, error: %@", buf, 0x34u);
  }

  (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);
  __fp_pop_log();

LABEL_21:
}

void __74__FPDXPCServicer_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fpfs_adopt_log();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v14 = FPPopLogSectionForBlock();
      v15 = a1[4];
      FPPluginOperationFailedError();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v22 = v14;
      v23 = 2112;
      v24 = v15;
      v25 = 2080;
      v26 = "-[FPDXPCServicer extendBookmarkForFileURL:toConsumerID:completionHandler:]_block_invoke";
      v27 = 2112;
      v28 = 0;
      v29 = 2112;
      v30 = v16;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v8 = a1[7];
    FPPluginOperationFailedError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    __fp_pop_log();
  }
  else
  {
    +[FPDAccessControlStore sharedStore](FPDAccessControlStore, "sharedStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bookmarkForItemID:consumerIdentifier:", v5, a1[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __74__FPDXPCServicer_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke_cold_1();

    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v17 = FPPopLogSectionForBlock();
      v18 = a1[4];
      *(_DWORD *)buf = 134219010;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2080;
      v26 = "-[FPDXPCServicer extendBookmarkForFileURL:toConsumerID:completionHandler:]_block_invoke";
      v27 = 2112;
      v28 = v11;
      v29 = 2112;
      v30 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(a1[7] + 16))();
    __fp_pop_log();

  }
}

- (void)extendSandboxForFileURL:(id)a3 fromProviderID:(id)a4 toConsumerID:(id)a5 completionHandler:(id)a6
{
  id v11;
  FPDXPCServicer *v12;
  char *v13;
  void (**v14)(id, _QWORD, void *);
  NSObject *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  FPDXPCServicer *v36;
  char *v37;
  void (**v38)(id, _QWORD, void *);
  id v39;
  _BYTE buf[12];
  __int16 v41;
  FPDXPCServicer *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (FPDXPCServicer *)a4;
  v13 = (char *)a5;
  v14 = (void (**)(id, _QWORD, void *))a6;
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:].cold.1(a2, v15);

  -[FPDXPCServicer connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = *MEMORY[0x1E0CAAE78];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "fp_hasOneOfEntitlements:logLevel:", v17, 2);

  if ((v18 & 1) != 0)
  {
    if (!v11 || !v12 || !v13)
    {
      FPInvalidParameterError();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v22 = 0;
LABEL_18:
        fp_current_or_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v11, "fp_shortDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          *(_QWORD *)&buf[4] = v32;
          v41 = 2112;
          v42 = v12;
          v43 = 2112;
          v44 = v13;
          v45 = 2112;
          v46 = v21;
          _os_log_error_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_ERROR, "[ERROR] Could not extend sandbox for %@ from provider ID %@ to consumer ID %@, error: %@", buf, 0x2Au);

        }
        fpfs_adopt_log();
        v39 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v33 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v33;
          v41 = 2112;
          v42 = self;
          v43 = 2080;
          v44 = "-[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:]";
          v45 = 2112;
          v46 = 0;
          v47 = 2112;
          v48 = v21;
          _os_log_debug_impl(&dword_1CF55F000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s url: %@, error: %@", buf, 0x34u);
        }

        v14[2](v14, 0, v21);
        __fp_pop_log();

        goto LABEL_24;
      }
    }
    *(_QWORD *)buf = 0;
    -[FPDXPCServicer server](self, "server");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "extensionManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "providerWithIdentifier:reason:", v12, buf);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v22, "domainForURL:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        goto LABEL_23;
      FPProviderNotFoundErrorForURL();
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      FPProviderNotFoundError();
      v25 = objc_claimAutoreleasedReturnValue();
    }
    v21 = (void *)v25;
    if (v25)
      goto LABEL_18;
LABEL_23:
    objc_msgSend(v21, "defaultBackend");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __88__FPDXPCServicer_extendSandboxForFileURL_fromProviderID_toConsumerID_completionHandler___block_invoke;
    v34[3] = &unk_1E8C75C00;
    v34[4] = self;
    v38 = v14;
    v35 = v11;
    v36 = v12;
    v37 = v13;
    objc_msgSend(v28, "itemIDForURL:requireProviderItemID:request:completionHandler:", v35, 0, v29, v34);

LABEL_24:
    goto LABEL_25;
  }
  fpfs_adopt_log();
  v39 = (id)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v30 = FPPopLogSectionForBlock();
    FPClientLacksEntitlement();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    *(_QWORD *)&buf[4] = v30;
    v41 = 2112;
    v42 = self;
    v43 = 2080;
    v44 = "-[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:]";
    v45 = 2112;
    v46 = 0;
    v47 = 2112;
    v48 = v31;
    _os_log_debug_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s url: %@, error: %@", buf, 0x34u);

  }
  FPClientLacksEntitlement();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2](v14, 0, v20);

  __fp_pop_log();
LABEL_25:

}

void __88__FPDXPCServicer_extendSandboxForFileURL_fromProviderID_toConsumerID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    fpfs_adopt_log();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v18 = FPPopLogSectionForBlock();
      v19 = *(_QWORD *)(a1 + 32);
      FPPluginOperationFailedError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      v29 = 2080;
      v30 = "-[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:]_block_invoke";
      v31 = 2112;
      v32 = 0;
      v33 = 2112;
      v34 = v20;
      _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s url: %@, error: %@", buf, 0x34u);

    }
    v9 = *(_QWORD *)(a1 + 64);
    FPPluginOperationFailedError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

    __fp_pop_log();
  }
  else
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      v14 = *(const char **)(a1 + 56);
      *(_DWORD *)buf = 138412802;
      v26 = (uint64_t)v12;
      v27 = 2112;
      v28 = v13;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_INFO, "[INFO] Successfully extended sandbox for %@ from provider ID %@ to consumer ID %@.", buf, 0x20u);

    }
    v15 = *(_QWORD *)(a1 + 40);
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v15, 0, &v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v23;
    fpfs_adopt_log();
    v24 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v21 = FPPopLogSectionForBlock();
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v26 = v21;
      v27 = 2112;
      v28 = v22;
      v29 = 2080;
      v30 = "-[FPDXPCServicer extendSandboxForFileURL:fromProviderID:toConsumerID:completionHandler:]_block_invoke";
      v31 = 2112;
      v32 = v16;
      v33 = 2112;
      v34 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s url: %@, error: %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log();

  }
}

- (void)startProvidingItemAtURL:(id)a3 fromProviderID:(id)a4 forConsumerID:(id)a5 completionHandler:(id)a6
{
  id v10;
  FPDXPCServicer *v11;
  id v12;
  uint64_t v13;
  id v14;
  FPDXPCServicer *v15;
  id v16;
  _QWORD *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  FPDXPCServicer *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[2];
  void (*v60)(uint64_t, void *);
  void *v61;
  FPDXPCServicer *v62;
  id v63;
  _BYTE buf[12];
  __int16 v65;
  FPDXPCServicer *v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  void *v70;
  _QWORD v71[5];

  v71[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (FPDXPCServicer *)a4;
  v51 = a5;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v60 = __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke;
  v61 = &unk_1E8C75530;
  v62 = self;
  v14 = v12;
  v63 = v14;
  v15 = self;
  v16 = v10;
  v17 = v59;
  if (!v16)
  {
    FPInvalidParameterError();
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v30 = (void *)v29;
    v60((uint64_t)v17, (void *)v29);

    goto LABEL_27;
  }
  -[FPDXPCServicer connection](v15, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fp_hasSandboxAccessToFile:accessType:logLevel:", v16, *MEMORY[0x1E0CAA660], 0);

  if ((v19 & 1) == 0)
  {
    -[FPDXPCServicer connection](v15, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "fp_hasOneOfEntitlements:logLevel:", v21, 0);

    if ((v22 & 1) == 0)
    {
      -[FPDXPCServicer connection](v15, "connection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "fp_isNonSandboxedConnection");

      if ((v24 & 1) == 0)
      {
        FPNotPermittedError();
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
  }

  -[FPDXPCServicer connection](v15, "connection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0CAAE78];
  v71[0] = *MEMORY[0x1E0CAAE70];
  v71[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v71, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v25, "fp_hasOneOfEntitlements:logLevel:", v27, 2);

  if ((v28 & 1) != 0)
  {
    if (v11 && v51 || (FPInvalidParameterError(), (v33 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      *(_QWORD *)buf = 0;
      -[FPDXPCServicer server](v15, "server");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "extensionManager");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "domainForURL:reason:", v16, buf);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "provider");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "identifier");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", v11);

        if (v39)
        {
          objc_msgSend(v36, "defaultBackend");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v15, "pid"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v13;
          v52[1] = 3221225472;
          v52[2] = __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke_97;
          v52[3] = &unk_1E8C77BE0;
          v53 = v36;
          v54 = v15;
          v57 = v14;
          v55 = v16;
          v56 = v51;
          v42 = v36;
          objc_msgSend(v40, "itemIDForURL:requireProviderItemID:request:completionHandler:", v55, 0, v41, v52);

          goto LABEL_27;
        }
        FPInvalidParameterError();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        FPProviderNotFoundError();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
      }

      if (!v33)
        goto LABEL_27;
    }
    fp_current_or_default_log();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "fp_shortDescription");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      *(_QWORD *)&buf[4] = v48;
      v65 = 2112;
      v66 = v11;
      v67 = 2112;
      v68 = (const char *)v51;
      v69 = 2112;
      v70 = v33;
      _os_log_error_impl(&dword_1CF55F000, v43, OS_LOG_TYPE_ERROR, "[ERROR] Cannot provide item at %@ from provider ID %@ to consumer ID %@. Error: %@", buf, 0x2Au);

    }
    fpfs_adopt_log();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      v49 = FPPopLogSectionForBlock();
      FPProviderNotFoundError();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v49;
      v65 = 2112;
      v66 = v15;
      v67 = 2080;
      v68 = "-[FPDXPCServicer startProvidingItemAtURL:fromProviderID:forConsumerID:completionHandler:]";
      v69 = 2112;
      v70 = v50;
      _os_log_debug_impl(&dword_1CF55F000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", buf, 0x2Au);

    }
    FPProviderNotFoundError();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v14 + 2))(v14, v45);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v46 = FPPopLogSectionForBlock();
      FPClientLacksEntitlement();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v46;
      v65 = 2112;
      v66 = v15;
      v67 = 2080;
      v68 = "-[FPDXPCServicer startProvidingItemAtURL:fromProviderID:forConsumerID:completionHandler:]";
      v69 = 2112;
      v70 = v47;
      _os_log_debug_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", buf, 0x2Au);

    }
    FPClientLacksEntitlement();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v14 + 2))(v14, v32);

    __fp_pop_log();
  }
LABEL_27:

}

void __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer startProvidingItemAtURL:fromProviderID:forConsumerID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke_97(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E8C77BB8;
  v6 = *(_QWORD *)(a1 + 40);
  v9 = v4;
  v10 = v6;
  v14 = *(id *)(a1 + 64);
  v11 = *(id *)(a1 + 32);
  v12 = *(id *)(a1 + 48);
  v13 = *(id *)(a1 + 56);
  v7 = v4;
  dispatch_async(v5, v8);

}

void __89__FPDXPCServicer_startProvidingItemAtURL_fromProviderID_forConsumerID_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    fpfs_adopt_log();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v9 = FPPopLogSectionForBlock();
      v10 = *(_QWORD *)(a1 + 40);
      FPPluginOperationFailedError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2080;
      v19 = "-[FPDXPCServicer startProvidingItemAtURL:fromProviderID:forConsumerID:completionHandler:]_block_invoke_2";
      v20 = 2112;
      v21 = v11;
      _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v3 = *(_QWORD *)(a1 + 72);
    FPPluginOperationFailedError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    __fp_pop_log();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "defaultBackend");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("consumer %@"), *(_QWORD *)(a1 + 64));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 40), "pid"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v12, "startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:", v5, v6, 0, v7, *(_QWORD *)(a1 + 72));

  }
}

- (void)startDownloadingItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  FPDXPCServicer *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[2];
  void (*v40)(uint64_t, void *);
  void *v41;
  FPDXPCServicer *v42;
  id v43;
  _BYTE buf[12];
  __int16 v45;
  FPDXPCServicer *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v40 = __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke;
  v41 = &unk_1E8C75530;
  v42 = self;
  v9 = v7;
  v43 = v9;
  v10 = self;
  v11 = v6;
  v12 = v39;
  if (!v11)
  {
    FPInvalidParameterError();
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v27 = (void *)v26;
    v40((uint64_t)v12, (void *)v26);

    goto LABEL_13;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:accessType:logLevel:", v11, *MEMORY[0x1E0CAA660], 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedError();
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v10, "pid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultBackend");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_101;
    v32[3] = &unk_1E8C77BE0;
    v33 = v22;
    v34 = v10;
    v37 = v9;
    v35 = v11;
    v36 = v23;
    v25 = v23;
    objc_msgSend(v24, "itemIDForURL:requireProviderItemID:request:completionHandler:", v35, 0, v25, v32);

  }
  else
  {
    fpfs_adopt_log();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock();
      FPProviderNotFoundErrorForURL();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v30;
      v45 = 2112;
      v46 = v10;
      v47 = 2080;
      v48 = "-[FPDXPCServicer startDownloadingItemAtURL:completionHandler:]";
      v49 = 2112;
      v50 = v31;
      _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    FPProviderNotFoundErrorForURL();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v29);

    __fp_pop_log();
  }

LABEL_13:
}

void __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer startDownloadingItemAtURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_2;
  block[3] = &unk_1E8C77C28;
  v8 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v8;
  v18 = *(id *)(a1 + 64);
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 56);
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    fpfs_adopt_log();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v11 = FPPopLogSectionForBlock();
      v12 = *(_QWORD *)(a1 + 40);
      FPPluginOperationFailedError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2080;
      v25 = "-[FPDXPCServicer startDownloadingItemAtURL:completionHandler:]_block_invoke_2";
      v26 = 2112;
      v27 = v13;
      _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v3 = *(_QWORD *)(a1 + 80);
    FPPluginOperationFailedError();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    __fp_pop_log();
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 64), "defaultBackend");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v5, "startProvidingItemAtURL:readerID:readingOptions:request:completionHandler:", *(_QWORD *)(a1 + 56), CFSTR("startDownloadingItemAtURL"), 0, *(_QWORD *)(a1 + 72), &__block_literal_global_105);

    fpfs_adopt_log();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
    __fp_pop_log();

  }
  else
  {
    fpfs_adopt_log();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v14 = FPPopLogSectionForBlock();
      v15 = *(_QWORD *)(a1 + 40);
      FPItemNotFoundErrorAtURL();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2080;
      v25 = "-[FPDXPCServicer startDownloadingItemAtURL:completionHandler:]_block_invoke";
      v26 = 2112;
      v27 = v16;
      _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    v9 = *(_QWORD *)(a1 + 80);
    FPItemNotFoundErrorAtURL();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    __fp_pop_log();
  }
}

- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 completionHandler:(id)a6
{
  return -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:](self, "evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:", a3, a4, a5, 3, a6);
}

- (id)evictItemAtURL:(id)a3 evenIfEnumeratingFP:(BOOL)a4 andClearACLForConsumer:(id)a5 evictionReason:(unsigned int)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  FPDXPCServicer *v16;
  id v17;
  _QWORD *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  FPDXPCServicer *v46;
  id v47;
  id v48;
  _QWORD v49[2];
  void (*v50)(uint64_t, void *);
  void *v51;
  FPDXPCServicer *v52;
  id v53;
  _QWORD v54[8];

  v9 = a4;
  v54[6] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v42 = a5;
  v13 = a7;
  v14 = MEMORY[0x1E0C809B0];
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v50 = __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke;
  v51 = &unk_1E8C75530;
  v52 = self;
  v15 = v13;
  v53 = v15;
  v16 = self;
  v17 = v12;
  v18 = v49;
  if (v17)
  {
    -[FPDXPCServicer connection](v16, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "fp_hasSandboxAccessToFile:accessType:logLevel:", v17, *MEMORY[0x1E0CAA660], 0);

    if ((v20 & 1) != 0)
      goto LABEL_5;
    -[FPDXPCServicer connection](v16, "connection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "fp_hasOneOfEntitlements:logLevel:", v22, 0);

    if ((v23 & 1) != 0
      || (-[FPDXPCServicer connection](v16, "connection"),
          v24 = (void *)objc_claimAutoreleasedReturnValue(),
          v25 = objc_msgSend(v24, "fp_isNonSandboxedConnection"),
          v24,
          (v25 & 1) != 0))
    {
LABEL_5:

      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:].cold.5(a2, v26);

      -[FPDXPCServicer server](v16, "server");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "extensionManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "domainForURL:reason:", v17, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v29, "provider");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "supportsEnumeration");

        if ((v31 & !v9) == 0)
        {
          objc_msgSend(v29, "defaultBackend");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v16, "pid"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v43[0] = v14;
          v43[1] = 3221225472;
          v43[2] = __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_106;
          v43[3] = &unk_1E8C77C50;
          v44 = v29;
          v45 = v17;
          v46 = v16;
          v47 = v15;
          objc_msgSend(v38, "evictItemAtURL:evictionReason:request:completionHandler:", v45, a6, v39, v43);
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_22;
        }
        fp_current_or_default_log();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:].cold.4();

        fpfs_adopt_log();
        v48 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          FPPopLogSectionForBlock();
          -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:].cold.3();
        }
      }
      else
      {
        fp_current_or_default_log();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:].cold.2(v17, v37);

        fpfs_adopt_log();
        v48 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          FPPopLogSectionForBlock();
          -[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:].cold.1();
        }
      }

      (*((void (**)(id, _QWORD))v15 + 2))(v15, 0);
      __fp_pop_log();

      v36 = 0;
LABEL_22:

      goto LABEL_23;
    }
    FPNotPermittedError();
    v34 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    FPInvalidParameterError();
    v34 = objc_claimAutoreleasedReturnValue();
  }
  v35 = (void *)v34;
  v50((uint64_t)v18, (void *)v34);

  v36 = 0;
LABEL_23:

  return v36;
}

void __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_106(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_106_cold_2();

    fpfs_adopt_log();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock();
      v13 = *(_QWORD *)(a1 + 48);
      FPPluginOperationFailedError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v18 = v12;
      v19 = 2112;
      v20 = v13;
      v21 = 2080;
      v22 = "-[FPDXPCServicer evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:]_block_invoke";
      v23 = 2112;
      v24 = v14;
      _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", buf, 0x2Au);

    }
    v9 = *(_QWORD *)(a1 + 56);
    FPPluginOperationFailedError();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_106_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
}

- (void)evictItemWithID:(id)a3 completionHandler:(id)a4
{
  -[FPDXPCServicer evictItemWithID:evictionReason:completionHandler:](self, "evictItemWithID:evictionReason:completionHandler:", a3, 4, a4);
}

- (void)evictItemWithID:(id)a3 evictionReason:(unsigned int)a4 completionHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  FPDXPCServicer *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, void *);
  void *v38;
  FPDXPCServicer *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  FPDXPCServicer *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v6 = *(_QWORD *)&a4;
  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "providerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v37 = __67__FPDXPCServicer_evictItemWithID_evictionReason_completionHandler___block_invoke;
  v38 = &unk_1E8C75530;
  v39 = self;
  v11 = v9;
  v40 = v11;
  v12 = self;
  v13 = v36;
  v41 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v12, "providerForIdentifier:enumerateEntitlementRequired:error:", v10, 1, &v41);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v41;
  if (!v14)
  {
    v37((uint64_t)v13, v15);
LABEL_7:
    v21 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v14, "invalidated"))
  {
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v43 = (uint64_t)v14;
      _os_log_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v37((uint64_t)v13, v20);

    goto LABEL_7;
  }
  v21 = v14;
LABEL_9:

  if (v21)
  {
    v41 = 0;
    -[FPDXPCServicer server](v12, "server");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "extensionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "domainFromItemID:reason:", v8, &v41);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "defaultBackend");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v12, "pid"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __67__FPDXPCServicer_evictItemWithID_evictionReason_completionHandler___block_invoke_107;
      v33[3] = &unk_1E8C75530;
      v33[4] = v12;
      v34 = v11;
      objc_msgSend(v25, "evictItemWithID:evictionReason:request:completionHandler:", v8, v6, v26, v33);

    }
    else
    {
      fpfs_adopt_log();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v30 = FPPopLogSectionForBlock();
        objc_msgSend(v8, "providerID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v43 = v30;
        v44 = 2112;
        v45 = v12;
        v46 = 2080;
        v47 = "-[FPDXPCServicer evictItemWithID:evictionReason:completionHandler:]";
        v48 = 2112;
        v49 = v32;
        _os_log_debug_impl(&dword_1CF55F000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      objc_msgSend(v8, "providerID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v11 + 2))(v11, v29);

      __fp_pop_log();
    }

  }
}

void __67__FPDXPCServicer_evictItemWithID_evictionReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer evictItemWithID:evictionReason:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __67__FPDXPCServicer_evictItemWithID_evictionReason_completionHandler___block_invoke_107(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer evictItemWithID:evictionReason:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)pinItemWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  FPDXPCServicer *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[2];
  void (*v42)(uint64_t, void *);
  void *v43;
  FPDXPCServicer *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  FPDXPCServicer *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "providerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v42 = __50__FPDXPCServicer_pinItemWithID_completionHandler___block_invoke;
  v43 = &unk_1E8C75530;
  v44 = self;
  v10 = v7;
  v45 = v10;
  v11 = self;
  v12 = v41;
  v46 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v11, "providerForIdentifier:enumerateEntitlementRequired:error:", v8, 1, &v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v46;
  if (!v13)
  {
    v42((uint64_t)v12, v14);
LABEL_7:
    v20 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v13, "invalidated"))
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = (uint64_t)v13;
      _os_log_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42((uint64_t)v12, v19);

    goto LABEL_7;
  }
  v20 = v13;
LABEL_9:

  if (v20)
  {
    v46 = 0;
    -[FPDXPCServicer server](v11, "server");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extensionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "domainFromItemID:reason:", v6, &v46);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "defaultBackend");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        objc_msgSend(v23, "defaultBackend");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v11, "pid"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v9;
        v38[1] = 3221225472;
        v38[2] = __50__FPDXPCServicer_pinItemWithID_completionHandler___block_invoke_110;
        v38[3] = &unk_1E8C77C78;
        v38[4] = v11;
        v39 = v10;
        objc_msgSend(v26, "pinItemWithID:request:completionHandler:", v6, v27, v38);

      }
      else
      {
        fpfs_adopt_log();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v36 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v48 = v36;
          v49 = 2112;
          v50 = v11;
          v51 = 2080;
          v52 = "-[FPDXPCServicer pinItemWithID:completionHandler:]";
          v53 = 2112;
          v54 = 0;
          v55 = 2112;
          v56 = v37;
          _os_log_debug_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        FPNotSupportedError();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v32);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v33 = FPPopLogSectionForBlock();
        objc_msgSend(v6, "providerID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v48 = v33;
        v49 = 2112;
        v50 = v11;
        v51 = 2080;
        v52 = "-[FPDXPCServicer pinItemWithID:completionHandler:]";
        v53 = 2112;
        v54 = 0;
        v55 = 2112;
        v56 = v35;
        _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      objc_msgSend(v6, "providerID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v30);

      __fp_pop_log();
    }

  }
}

void __50__FPDXPCServicer_pinItemWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer pinItemWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __50__FPDXPCServicer_pinItemWithID_completionHandler___block_invoke_110(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer pinItemWithID:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)unpinItemWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  FPDXPCServicer *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[2];
  void (*v42)(uint64_t, void *);
  void *v43;
  FPDXPCServicer *v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  FPDXPCServicer *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "providerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v42 = __52__FPDXPCServicer_unpinItemWithID_completionHandler___block_invoke;
  v43 = &unk_1E8C75530;
  v44 = self;
  v10 = v7;
  v45 = v10;
  v11 = self;
  v12 = v41;
  v46 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v11, "providerForIdentifier:enumerateEntitlementRequired:error:", v8, 1, &v46);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v46;
  if (!v13)
  {
    v42((uint64_t)v12, v14);
LABEL_7:
    v20 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v13, "invalidated"))
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v48 = (uint64_t)v13;
      _os_log_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42((uint64_t)v12, v19);

    goto LABEL_7;
  }
  v20 = v13;
LABEL_9:

  if (v20)
  {
    v46 = 0;
    -[FPDXPCServicer server](v11, "server");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extensionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "domainFromItemID:reason:", v6, &v46);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "defaultBackend");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_opt_respondsToSelector();

      if ((v25 & 1) != 0)
      {
        objc_msgSend(v23, "defaultBackend");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v11, "pid"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v9;
        v38[1] = 3221225472;
        v38[2] = __52__FPDXPCServicer_unpinItemWithID_completionHandler___block_invoke_114;
        v38[3] = &unk_1E8C77C78;
        v38[4] = v11;
        v39 = v10;
        objc_msgSend(v26, "unpinItemWithID:request:completionHandler:", v6, v27, v38);

      }
      else
      {
        fpfs_adopt_log();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          v36 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v48 = v36;
          v49 = 2112;
          v50 = v11;
          v51 = 2080;
          v52 = "-[FPDXPCServicer unpinItemWithID:completionHandler:]";
          v53 = 2112;
          v54 = 0;
          v55 = 2112;
          v56 = v37;
          _os_log_debug_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        FPNotSupportedError();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v32);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        v33 = FPPopLogSectionForBlock();
        objc_msgSend(v6, "providerID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v48 = v33;
        v49 = 2112;
        v50 = v11;
        v51 = 2080;
        v52 = "-[FPDXPCServicer unpinItemWithID:completionHandler:]";
        v53 = 2112;
        v54 = 0;
        v55 = 2112;
        v56 = v35;
        _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      objc_msgSend(v6, "providerID");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v30);

      __fp_pop_log();
    }

  }
}

void __52__FPDXPCServicer_unpinItemWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer unpinItemWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __52__FPDXPCServicer_unpinItemWithID_completionHandler___block_invoke_114(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer unpinItemWithID:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)detachKnownFolders:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  void (*v22)(uint64_t, void *);
  void *v23;
  FPDXPCServicer *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  FPDXPCServicer *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAEF0];
  v34[0] = *MEMORY[0x1E0CAAE90];
  v34[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __55__FPDXPCServicer_detachKnownFolders_completionHandler___block_invoke;
  v23 = &unk_1E8C75530;
  v24 = self;
  v10 = v7;
  v25 = v10;
  v11 = v9;
  v12 = v21;
  -[FPDXPCServicer connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if ((v14 & 1) != 0)
  {

    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v18 = FPPopLogSectionForBlock();
      FPNotSupportedError();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v27 = v18;
      v28 = 2112;
      v29 = self;
      v30 = 2080;
      v31 = "-[FPDXPCServicer detachKnownFolders:completionHandler:]";
      v32 = 2112;
      v33 = v19;
      _os_log_debug_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    FPNotSupportedError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v16);

    __fp_pop_log();
  }
  else
  {
    FPNotPermittedError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22((uint64_t)v12, v17);

  }
}

void __55__FPDXPCServicer_detachKnownFolders_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer detachKnownFolders:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)attachKnownFolders:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  void (*v23)(uint64_t, void *);
  void *v24;
  FPDXPCServicer *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  FPDXPCServicer *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  void *v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = *MEMORY[0x1E0CAAEF0];
  v35[0] = *MEMORY[0x1E0CAAE90];
  v35[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v23 = __63__FPDXPCServicer_attachKnownFolders_options_completionHandler___block_invoke;
  v24 = &unk_1E8C75530;
  v25 = self;
  v11 = v8;
  v26 = v11;
  v12 = v10;
  v13 = v22;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    fpfs_adopt_log();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v19 = FPPopLogSectionForBlock();
      FPNotSupportedError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v28 = v19;
      v29 = 2112;
      v30 = self;
      v31 = 2080;
      v32 = "-[FPDXPCServicer attachKnownFolders:options:completionHandler:]";
      v33 = 2112;
      v34 = v20;
      _os_log_debug_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    FPNotSupportedError();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v11 + 2))(v11, v17);

    __fp_pop_log();
  }
  else
  {
    FPNotPermittedError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23((uint64_t)v13, v18);

  }
}

void __63__FPDXPCServicer_attachKnownFolders_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer attachKnownFolders:options:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  FPNotSupportedError();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))a5 + 2))(v6, v7);

}

- (void)selectNewProviderDomain:(id)a3 knownFolders:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  FPDXPCServicer *v22;
  id v23;
  _QWORD v24[2];
  void (*v25)(uint64_t, void *);
  void *v26;
  FPDXPCServicer *v27;
  id v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0CAAEF0];
  v29[0] = *MEMORY[0x1E0CAAE90];
  v29[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = __73__FPDXPCServicer_selectNewProviderDomain_knownFolders_completionHandler___block_invoke;
  v26 = &unk_1E8C75530;
  v27 = self;
  v13 = v9;
  v28 = v13;
  v14 = v11;
  v15 = v24;
  -[FPDXPCServicer connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fp_hasOneOfEntitlements:", v14);

  if ((v17 & 1) != 0)
  {

    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __73__FPDXPCServicer_selectNewProviderDomain_knownFolders_completionHandler___block_invoke_115;
    v20[3] = &unk_1E8C774D8;
    v21 = v8;
    v22 = self;
    v23 = v13;
    -[FPDXPCServicer _selectNewProviderDomain:knownFolders:completionHandler:](self, "_selectNewProviderDomain:knownFolders:completionHandler:", v21, a4, v20);

    v18 = v21;
  }
  else
  {
    FPNotPermittedError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25((uint64_t)v15, v19);

    v18 = v28;
  }

}

void __73__FPDXPCServicer_selectNewProviderDomain_knownFolders_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer selectNewProviderDomain:knownFolders:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __73__FPDXPCServicer_selectNewProviderDomain_knownFolders_completionHandler___block_invoke_115(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "fp_toProviderID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("no provider");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x1E0D211B0], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sessionForProviderID:version:", v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "postReportWithCategory:type:payload:error:", 1, 1, &unk_1E8C95EC0, v3);
  fpfs_adopt_log();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = FPPopLogSectionForBlock();
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2080;
    v19 = "-[FPDXPCServicer selectNewProviderDomain:knownFolders:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

void __51__FPDXPCServicer_providerDomainsCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer providerDomainsCompletionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    v16 = 2112;
    v17 = 0;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@, domains: %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __64__FPDXPCServicer_providerDomainForIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer providerDomainForIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@, domains: %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)providerDomainForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  FPDXPCServicer *v9;
  id v10;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  void (*v34)(uint64_t, void *);
  void *v35;
  FPDXPCServicer *v36;
  id v37;
  _BYTE buf[12];
  __int16 v39;
  FPDXPCServicer *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v34 = __57__FPDXPCServicer_providerDomainForURL_completionHandler___block_invoke;
  v35 = &unk_1E8C75530;
  v36 = self;
  v8 = v7;
  v37 = v8;
  v9 = self;
  v10 = v6;
  v11 = v33;
  if (!v10)
  {
    FPInvalidParameterError();
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v27 = (void *)v26;
    v34((uint64_t)v11, (void *)v26);

    goto LABEL_18;
  }
  -[FPDXPCServicer connection](v9, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fp_hasSandboxAccessToFile:accessType:logLevel:", v10, *MEMORY[0x1E0CAA660], 0);

  if ((v13 & 1) == 0)
  {
    -[FPDXPCServicer connection](v9, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

    if ((v16 & 1) == 0)
    {
      -[FPDXPCServicer connection](v9, "connection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "fp_isNonSandboxedConnection");

      if ((v18 & 1) == 0)
      {
        FPNotPermittedError();
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
  }

  -[FPDXPCServicer server](v9, "server");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "extensionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "domainForURL:reason:", v10, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "provider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v21 && v22)
  {
    objc_msgSend(v22, "providerDomainForDomain:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setShouldHideDomainDisplayName:", objc_msgSend(v23, "shouldHideDomainDisplayName"));
    fpfs_adopt_log();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v30;
      v39 = 2112;
      v40 = v9;
      v41 = 2080;
      v42 = "-[FPDXPCServicer providerDomainForURL:completionHandler:]";
      v43 = 2112;
      v44 = v24;
      v45 = 2112;
      v46 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, void *, _QWORD))v8 + 2))(v8, v24, 0);
    __fp_pop_log();

  }
  else
  {
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer providerDomainForURL:completionHandler:].cold.2(v10, v28);

    fpfs_adopt_log();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer providerDomainForURL:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    __fp_pop_log();

  }
LABEL_18:

}

void __57__FPDXPCServicer_providerDomainForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer providerDomainForURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (id)tryTransformItemIDAfterMigration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  const __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = a3;
  if (!FPIsCloudDocsWithFPFSEnabled())
    goto LABEL_12;
  objc_msgSend(v4, "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")))
  {

    goto LABEL_5;
  }
  objc_msgSend(v4, "providerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

  if (!v7)
  {
LABEL_12:
    v19 = v4;
    goto LABEL_13;
  }
LABEL_5:
  objc_msgSend(v4, "providerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));

  if ((v9 & 1) != 0)
  {
    v10 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider");
  }
  else
  {
    objc_msgSend(v4, "providerID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));

    if (v12)
      v10 = CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged");
    else
      v10 = 0;
  }
  -[FPDXPCServicer server](self, "server");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "extensionManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "domainsForAppBundleIdentifier:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "fp_filter:", &__block_literal_global_133);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
    goto LABEL_12;
  objc_msgSend(v17, "providerDomainID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transformForMigratedCloudDocsProviderDomainIdentifier:", v18);
  v19 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v19;
}

uint64_t __51__FPDXPCServicer_tryTransformItemIDAfterMigration___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *MEMORY[0x1E0CAAB38]) ^ 1;

  return v3;
}

- (void)documentURLFromBookmarkableString:(id)a3 creatingPlaceholderIfMissing:(BOOL)a4 ignoreAlternateContentsURL:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  id v48;
  _OWORD v49[2];
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  FPDXPCServicer *v54;
  __int16 v55;
  const char *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  _QWORD v63[4];

  v7 = a5;
  v8 = a4;
  v63[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a6;
  fp_current_or_default_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:].cold.1();

  -[FPDXPCServicer connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fp_bundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPDXPCServicer connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = *MEMORY[0x1E0CAAEA8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

  if (v14)
    v18 = 1;
  else
    v18 = v17;
  if ((v18 & 1) != 0)
  {
    +[FPDAccessControlStore sharedStore](FPDAccessControlStore, "sharedStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v17)
    {
      objc_msgSend(v19, "parseUnverifiedBookmark:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FPDXPCServicer connection](self, "connection");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
        objc_msgSend(v24, "auditToken");
      else
        memset(v49, 0, sizeof(v49));
      objc_msgSend(v20, "verifyBookmark:auditToken:consumerIdentifier:", v10, v49, v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v21)
    {
      v50 = 0;
      -[FPDXPCServicer server](self, "server");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "extensionManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "domainFromItemID:reason:", v21, &v50);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(v28, "defaultBackend", v21);
      }
      else
      {
        -[FPDXPCServicer tryTransformItemIDAfterMigration:](self, "tryTransformItemIDAfterMigration:", v21);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        -[FPDXPCServicer server](self, "server");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "extensionManager");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "domainFromItemID:reason:", v45, &v50);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          fpfs_adopt_log();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          fp_current_or_default_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            v42 = FPPopLogSectionForBlock();
            objc_msgSend(v45, "providerID");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            FPProviderNotFoundError();
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219266;
            v52 = v42;
            v53 = 2112;
            v54 = self;
            v55 = 2080;
            v56 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContent"
                  "sURL:completionHandler:]";
            v57 = 2112;
            v58 = 0;
            v59 = 2112;
            v60 = 0;
            v61 = 2112;
            v62 = v44;
            _os_log_debug_impl(&dword_1CF55F000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

          }
          objc_msgSend(v45, "providerID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          FPProviderNotFoundError();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v37);

          __fp_pop_log();
          goto LABEL_25;
        }
        objc_msgSend(v28, "defaultBackend", v45);
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __126__FPDXPCServicer_documentURLFromBookmarkableString_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke;
      v47[3] = &unk_1E8C755A8;
      v47[4] = self;
      v48 = v11;
      objc_msgSend(v33, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v45, v8, v7, 1, v34, v47);

LABEL_25:
      goto LABEL_26;
    }
    fpfs_adopt_log();
    v50 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v40 = FPPopLogSectionForBlock();
      FPNotPermittedError();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v52 = v40;
      v53 = 2112;
      v54 = self;
      v55 = 2080;
      v56 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:c"
            "ompletionHandler:]";
      v57 = 2112;
      v58 = 0;
      v59 = 2112;
      v60 = 0;
      v61 = 2112;
      v62 = v41;
      _os_log_debug_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

    }
    FPNotPermittedError();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v30);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    v50 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v38 = FPPopLogSectionForBlock();
      FPNotPermittedError();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      v52 = v38;
      v53 = 2112;
      v54 = self;
      v55 = 2080;
      v56 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:c"
            "ompletionHandler:]";
      v57 = 2112;
      v58 = 0;
      v59 = 2112;
      v60 = 0;
      v61 = 2112;
      v62 = v39;
      _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

    }
    FPNotPermittedError();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v23);

    __fp_pop_log();
  }
LABEL_26:

}

void __126__FPDXPCServicer_documentURLFromBookmarkableString_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    fpfs_adopt_log();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = FPPopLogSectionForBlock();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2080;
      v21 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:c"
            "ompletionHandler:]_block_invoke";
      v22 = 2112;
      v23 = 0;
      v24 = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }
  else
  {
    fpfs_adopt_log();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = FPPopLogSectionForBlock();
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2080;
      v21 = "-[FPDXPCServicer documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:c"
            "ompletionHandler:]_block_invoke";
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fp_bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_cold_1(a1, (uint64_t)v5, v6);

  fpfs_adopt_log();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = FPPopLogSectionForBlock();
    v11 = *(_QWORD *)(a1 + 32);
    FPNotPermittedError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    v18 = 2080;
    v19 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandl"
          "er:]_block_invoke";
    v20 = 2112;
    v21 = 0;
    v22 = 2112;
    v23 = 0;
    v24 = 2112;
    v25 = v12;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

  }
  v8 = *(_QWORD *)(a1 + 48);
  FPNotPermittedError();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v8 + 16))(v8, 0, 0, v9);

  __fp_pop_log();
}

void __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_139(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    fpfs_adopt_log();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = FPPopLogSectionForBlock();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2080;
      v21 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHan"
            "dler:]_block_invoke";
      v22 = 2112;
      v23 = 0;
      v24 = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }
  else
  {
    fpfs_adopt_log();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = FPPopLogSectionForBlock();
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      v20 = 2080;
      v21 = "-[FPDXPCServicer documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHan"
            "dler:]_block_invoke";
      v22 = 2112;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v6 = a3;
  v7 = a4;
  -[FPDXPCServicer server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainFromItemID:reason:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer _forceIngestionForItemID:completionHandler:].cold.1();

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__FPDXPCServicer__forceIngestionForItemID_completionHandler___block_invoke;
    v13[3] = &unk_1E8C77CE0;
    v14 = v7;
    objc_msgSend(v10, "forceIngestionForItemID:completionHandler:", v6, v13);

  }
  else
  {
    FPNotSupportedError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v12);

  }
}

uint64_t __61__FPDXPCServicer__forceIngestionForItemID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forceIngestionForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t *v9;
  FPDXPCServicer *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  FPDXPCServicer *v20;
  id v21;
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __60__FPDXPCServicer_forceIngestionForItemID_completionHandler___block_invoke;
  v19 = &unk_1E8C75530;
  v20 = self;
  v8 = v7;
  v21 = v8;
  v9 = &v16;
  v10 = self;
  -[FPDXPCServicer connection](v10, "connection", v16, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CAAE78];
  v22[0] = *MEMORY[0x1E0CAAE70];
  v22[1] = v12;
  v22[2] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if ((v14 & 1) != 0)
  {

    -[FPDXPCServicer _forceIngestionForItemID:completionHandler:](v10, "_forceIngestionForItemID:completionHandler:", v6, v8);
  }
  else
  {
    FPNotPermittedError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18((uint64_t)v9, v15);

  }
}

void __60__FPDXPCServicer_forceIngestionForItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer forceIngestionForItemID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)forceIngestionForItemIDs:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  FPDXPCServicer *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  NSObject *queue;
  id v24;
  void *v25;
  id v26;
  _QWORD block[4];
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[2];
  void (*v39)(uint64_t, void *);
  void *v40;
  FPDXPCServicer *v41;
  id v42;
  _BYTE v43[128];
  _QWORD v44[6];

  v44[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v39 = __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke;
  v40 = &unk_1E8C75530;
  v41 = self;
  v8 = v7;
  v42 = v8;
  v9 = v38;
  v10 = self;
  -[FPDXPCServicer connection](v10, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0CAAE78];
  v44[0] = *MEMORY[0x1E0CAAE70];
  v44[1] = v12;
  v44[2] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v13);
  if ((v14 & 1) != 0)
  {

    if (objc_msgSend(v6, "count"))
    {
      v15 = dispatch_group_create();
      v16 = (void *)objc_opt_new();
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v26 = v6;
      v17 = v6;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v35 != v20)
              objc_enumerationMutation(v17);
            v22 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
            dispatch_group_enter(v15);
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke_141;
            v30[3] = &unk_1E8C75358;
            v31 = v16;
            v32 = v22;
            v33 = v15;
            -[FPDXPCServicer _forceIngestionForItemID:completionHandler:](v10, "_forceIngestionForItemID:completionHandler:", v22, v30);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v19);
      }

      queue = v10->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke_2;
      block[3] = &unk_1E8C76C10;
      v28 = v16;
      v29 = v8;
      v24 = v16;
      dispatch_group_notify(v15, queue, block);

      v6 = v26;
    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
    }
  }
  else
  {
    FPNotPermittedError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v39((uint64_t)v9, v25);

  }
}

void __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer forceIngestionForItemIDs:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke_141(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = *(id *)(a1 + 32);
    objc_sync_enter(v3);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));
    objc_sync_exit(v3);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

void __61__FPDXPCServicer_forceIngestionForItemIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "copy");
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)forceLatestVersionOnDiskForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  FPDXPCServicer *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[5];
  id v34;
  id v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, void *);
  void *v38;
  FPDXPCServicer *v39;
  id v40;
  _BYTE buf[24];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v37 = __70__FPDXPCServicer_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke;
  v38 = &unk_1E8C75530;
  v39 = self;
  v9 = v7;
  v40 = v9;
  v10 = v36;
  v11 = self;
  -[FPDXPCServicer connection](v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)buf = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&buf[8] = v13;
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v14);
  if ((v15 & 1) != 0)
  {

    -[FPDXPCServicer server](v11, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainFromItemID:reason:", v6, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        objc_msgSend(v18, "defaultBackend");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v33[0] = v8;
        v33[1] = 3221225472;
        v33[2] = __70__FPDXPCServicer_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke_144;
        v33[3] = &unk_1E8C77C78;
        v33[4] = v11;
        v34 = v9;
        objc_msgSend(v21, "forceIngestionForItemID:completionHandler:", v6, v33);

      }
      else
      {
        fpfs_adopt_log();
        v35 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          v31 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)&buf[4] = v31;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v11;
          *(_WORD *)&buf[22] = 2080;
          v42 = "-[FPDXPCServicer forceLatestVersionOnDiskForItemID:completionHandler:]";
          v43 = 2112;
          v44 = 0;
          v45 = 2112;
          v46 = v32;
          _os_log_debug_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        FPNotSupportedError();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v27);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v28 = FPPopLogSectionForBlock();
        objc_msgSend(v6, "providerID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v28;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2080;
        v42 = "-[FPDXPCServicer forceLatestVersionOnDiskForItemID:completionHandler:]";
        v43 = 2112;
        v44 = 0;
        v45 = 2112;
        v46 = v30;
        _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      objc_msgSend(v6, "providerID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v25);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37((uint64_t)v10, v22);

  }
}

void __70__FPDXPCServicer_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer forceLatestVersionOnDiskForItemID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __70__FPDXPCServicer_forceLatestVersionOnDiskForItemID_completionHandler___block_invoke_144(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "itemVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fpfs_adopt_log();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = FPPopLogSectionForBlock();
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2080;
    v17 = "-[FPDXPCServicer forceLatestVersionOnDiskForItemID:completionHandler:]_block_invoke";
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)createItemBasedOnTemplate:(id)a3 fields:(unint64_t)a4 urlWrapper:(id)a5 options:(unint64_t)a6 bounceOnCollision:(BOOL)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD *v17;
  FPDXPCServicer *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  _BOOL4 v33;
  id v34;
  _QWORD v35[4];
  id v36;
  FPDXPCServicer *v37;
  id v38;
  id v39;
  _QWORD v40[2];
  void (*v41)(uint64_t, void *);
  void *v42;
  FPDXPCServicer *v43;
  id v44;
  _BYTE buf[24];
  const char *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v33 = a7;
  v51 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v34 = a5;
  v14 = a8;
  v15 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v41 = __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke;
  v42 = &unk_1E8C75530;
  v43 = self;
  v16 = v14;
  v44 = v16;
  v17 = v40;
  v18 = self;
  -[FPDXPCServicer connection](v18, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)buf = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&buf[8] = v20;
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a8) = objc_msgSend(v19, "fp_hasOneOfEntitlements:", v21);
  if ((a8 & 1) != 0)
  {

    -[FPDXPCServicer server](v18, "server");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "extensionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "itemID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "domainFromItemID:reason:", v24, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      objc_msgSend(v25, "defaultBackend");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v18, "pid"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v15;
      v35[1] = 3221225472;
      v35[2] = __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_145;
      v35[3] = &unk_1E8C758B8;
      v36 = v13;
      v37 = v18;
      v38 = v16;
      objc_msgSend(v26, "createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:request:completionHandler:", v36, a4, v34, a6, v33, v27, v35);

    }
    else
    {
      fpfs_adopt_log();
      v39 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v31 = FPPopLogSectionForBlock();
        FPNotSupportedError();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v31;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v18;
        *(_WORD *)&buf[22] = 2080;
        v46 = "-[FPDXPCServicer createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:]";
        v47 = 2112;
        v48 = 0;
        v49 = 2112;
        v50 = v32;
        _os_log_debug_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPNotSupportedError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v30);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v41((uint64_t)v17, v28);

  }
}

void __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_145(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_145_cold_2();

    fpfs_adopt_log();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock();
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      v19 = 2080;
      v20 = "-[FPDXPCServicer createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:]_block_invoke";
      v21 = 2112;
      v22 = 0;
      v23 = 2112;
      v24 = v6;
      _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_145_cold_1();

    fpfs_adopt_log();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock();
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134219010;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2080;
      v20 = "-[FPDXPCServicer createItemBasedOnTemplate:fields:urlWrapper:options:bounceOnCollision:completionHandler:]_block_invoke";
      v21 = 2112;
      v22 = v5;
      v23 = 2112;
      v24 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

- (void)bookmarkableStringFromDocumentURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  FPDAccessRight *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  FPDAccessRight *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  _QWORD v41[5];
  id v42;
  id v43;
  void (**v44)(id, _QWORD, void *);
  id v45;
  uint8_t buf[4];
  _BYTE v47[38];
  __int16 v48;
  void *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  -[FPDXPCServicer connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = [FPDAccessRight alloc];
  v10 = *MEMORY[0x1E0CAAEA8];
  v50[0] = *MEMORY[0x1E0CAAEA8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPDXPCServicer server](self, "server");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extensionManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[FPDAccessRight initWithURL:entitlements:connection:manager:](v9, "initWithURL:entitlements:connection:manager:", v6, v11, v8, v13);

  LODWORD(v12) = -[FPDAccessRight level](v14, "level") == 0;
  fp_current_or_default_log();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);
  if ((_DWORD)v12)
  {
    if (v16)
    {
      v32 = objc_msgSend(v8, "processIdentifier");
      objc_msgSend(v8, "processIdentifier");
      FPExecutableNameForProcessIdentifier();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "fp_shortDescription");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v47 = v32;
      *(_WORD *)&v47[4] = 2112;
      *(_QWORD *)&v47[6] = v33;
      *(_WORD *)&v47[14] = 2112;
      *(_QWORD *)&v47[16] = v10;
      *(_WORD *)&v47[24] = 2112;
      *(_QWORD *)&v47[26] = v34;
      _os_log_debug_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) has neither sandbox access nor %@ entitlement to get a bookmark for %@", buf, 0x26u);

    }
    fpfs_adopt_log();
    v45 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v35 = FPPopLogSectionForBlock();
      FPNotPermittedError();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)v47 = v35;
      *(_WORD *)&v47[8] = 2112;
      *(_QWORD *)&v47[10] = self;
      *(_WORD *)&v47[18] = 2080;
      *(_QWORD *)&v47[20] = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]";
      *(_WORD *)&v47[28] = 2112;
      *(_QWORD *)&v47[30] = 0;
      v48 = 2112;
      v49 = v36;
      _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    FPNotPermittedError();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v23);

    __fp_pop_log();
  }
  else
  {
    if (v16)
      -[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:].cold.1(v6, v15);

    -[FPDAccessRight provider](v14, "provider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      -[FPDAccessRight domain](v14, "domain");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "defaultBackend");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke;
        v41[3] = &unk_1E8C77B90;
        v41[4] = self;
        v44 = v7;
        v42 = v6;
        v43 = v8;
        objc_msgSend(v20, "itemIDForURL:requireProviderItemID:request:completionHandler:", v42, 0, v21, v41);

      }
      else
      {
        fp_current_or_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v6, "fp_shortDescription");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v47 = v29;
          _os_log_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_INFO, "[INFO] Could not find the domain for %@", buf, 0xCu);

        }
        fpfs_adopt_log();
        v45 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v39 = FPPopLogSectionForBlock();
          FPProviderNotFoundErrorForURL();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          *(_QWORD *)v47 = v39;
          *(_WORD *)&v47[8] = 2112;
          *(_QWORD *)&v47[10] = self;
          *(_WORD *)&v47[18] = 2080;
          *(_QWORD *)&v47[20] = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]";
          *(_WORD *)&v47[28] = 2112;
          *(_QWORD *)&v47[30] = 0;
          v48 = 2112;
          v49 = v40;
          _os_log_debug_impl(&dword_1CF55F000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        FPProviderNotFoundErrorForURL();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v7[2](v7, 0, v31);

        __fp_pop_log();
      }

    }
    else
    {
      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "fp_shortDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v47 = v25;
        _os_log_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_INFO, "[INFO] Could not find the provider for %@", buf, 0xCu);

      }
      fpfs_adopt_log();
      v45 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v37 = FPPopLogSectionForBlock();
        FPProviderNotFoundErrorForURL();
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)v47 = v37;
        *(_WORD *)&v47[8] = 2112;
        *(_QWORD *)&v47[10] = self;
        *(_WORD *)&v47[18] = 2080;
        *(_QWORD *)&v47[20] = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]";
        *(_WORD *)&v47[28] = 2112;
        *(_QWORD *)&v47[30] = 0;
        v48 = 2112;
        v49 = v38;
        _os_log_debug_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPProviderNotFoundErrorForURL();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v27);

      __fp_pop_log();
    }

  }
}

void __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v16 = FPPopLogSectionForBlock();
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v24 = v16;
      v25 = 2112;
      v26 = v17;
      v27 = 2080;
      v28 = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]_block_invoke";
      v29 = 2112;
      v30 = 0;
      v31 = 2112;
      v32 = v6;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
  else if (v5)
  {
    +[FPDAccessControlStore sharedStore](FPDAccessControlStore, "sharedStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "fp_bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bookmarkForItemID:consumerIdentifier:", v5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke_cold_2();

    fpfs_adopt_log();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v18 = FPPopLogSectionForBlock();
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v24 = v18;
      v25 = 2112;
      v26 = v19;
      v27 = 2080;
      v28 = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]_block_invoke";
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
  else
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = (uint64_t)v14;
      _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Could not get Item ID for %@.", buf, 0xCu);

    }
    fpfs_adopt_log();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
}

- (void)fetchDomainServicerForProviderDomainID:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, void *, void *, id);
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  FPDXPCServicer *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, void *, id))a4;
  v15 = 0;
  -[FPDXPCServicer createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:](self, "createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:", v6, 0, 1, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  fpfs_adopt_log();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = FPPopLogSectionForBlock();
    objc_msgSend(v8, "providerDomainID", v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219266;
    v17 = v12;
    v18 = 2112;
    v19 = self;
    v20 = 2080;
    v21 = "-[FPDXPCServicer fetchDomainServicerForProviderDomainID:handler:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v9;
    _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

  }
  objc_msgSend(v8, "providerDomainID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v8, v11, v9);

  __fp_pop_log();
}

- (void)fetchAccessServicer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  char v10;
  NSObject *v11;
  FPDAccessControlServicer *v12;
  void *v13;
  FPDAccessControlServicer *v14;
  void *v15;
  uint64_t v16;
  FPDAccessControlServicer *v17;
  void *v18;
  FPDAccessControlServicer *v19;
  void *v20;
  _QWORD v21[2];
  void (*v22)(uint64_t, void *);
  void *v23;
  FPDXPCServicer *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  FPDXPCServicer *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  FPDAccessControlServicer *v33;
  __int16 v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36[0] = *MEMORY[0x1E0CAAE78];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __38__FPDXPCServicer_fetchAccessServicer___block_invoke;
  v23 = &unk_1E8C75530;
  v24 = self;
  v6 = v4;
  v25 = v6;
  v7 = v5;
  v8 = v21;
  -[FPDXPCServicer connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fp_hasOneOfEntitlements:", v7);

  if ((v10 & 1) != 0)
  {

    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = FPPopLogSectionForBlock();
      v17 = [FPDAccessControlServicer alloc];
      +[FPDAccessControlStore sharedStore](FPDAccessControlStore, "sharedStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[FPDAccessControlServicer initWithAccessStore:](v17, "initWithAccessStore:", v18);
      *(_DWORD *)buf = 134219010;
      v27 = v16;
      v28 = 2112;
      v29 = self;
      v30 = 2080;
      v31 = "-[FPDXPCServicer fetchAccessServicer:]";
      v32 = 2112;
      v33 = v19;
      v34 = 2112;
      v35 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v12 = [FPDAccessControlServicer alloc];
    +[FPDAccessControlStore sharedStore](FPDAccessControlStore, "sharedStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[FPDAccessControlServicer initWithAccessStore:](v12, "initWithAccessStore:", v13);
    (*((void (**)(id, FPDAccessControlServicer *, _QWORD))v6 + 2))(v6, v14, 0);

    __fp_pop_log();
  }
  else
  {
    FPNotPermittedError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22((uint64_t)v8, v15);

  }
}

void __38__FPDXPCServicer_fetchAccessServicer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer fetchAccessServicer:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __47__FPDXPCServicer_itemForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer itemForURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __47__FPDXPCServicer_itemForURL_completionHandler___block_invoke_149(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer itemForURL:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)providerItemIDForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _QWORD v40[2];
  void (*v41)(uint64_t, void *);
  void *v42;
  FPDXPCServicer *v43;
  id v44;
  _BYTE buf[12];
  __int16 v46;
  FPDXPCServicer *v47;
  __int16 v48;
  const char *v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v41 = __57__FPDXPCServicer_providerItemIDForURL_completionHandler___block_invoke;
  v42 = &unk_1E8C75530;
  v43 = self;
  v9 = v7;
  v44 = v9;
  v10 = self;
  v11 = v6;
  v12 = v40;
  if (!v11)
  {
    FPInvalidParameterError();
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v30 = (void *)v29;
    v41((uint64_t)v12, (void *)v29);

    goto LABEL_22;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:accessType:logLevel:", v11, *MEMORY[0x1E0CAA660], 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedError();
        v29 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "provider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v10, "providerForIdentifier:enumerateEntitlementRequired:error:", v24, 1, &v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v38;

    if (v25)
    {
      objc_msgSend(v22, "defaultBackend");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v10, "pid"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v8;
      v36[1] = 3221225472;
      v36[2] = __57__FPDXPCServicer_providerItemIDForURL_completionHandler___block_invoke_150;
      v36[3] = &unk_1E8C75A20;
      v36[4] = v10;
      v37 = v9;
      objc_msgSend(v27, "itemIDForURL:requireProviderItemID:request:completionHandler:", v11, 1, v28, v36);

    }
    else
    {
      fp_current_or_default_log();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer providerItemIDForURL:completionHandler:].cold.3(v22, v33);

      fpfs_adopt_log();
      v39 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v35 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v35;
        v46 = 2112;
        v47 = v10;
        v48 = 2080;
        v49 = "-[FPDXPCServicer providerItemIDForURL:completionHandler:]";
        v50 = 2112;
        v51 = 0;
        v52 = 2112;
        v53 = v26;
        _os_log_debug_impl(&dword_1CF55F000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
      }

      (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v26);
      __fp_pop_log();

    }
  }
  else
  {
    fp_current_or_default_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer providerItemIDForURL:completionHandler:].cold.2(v11, v31);

    fpfs_adopt_log();
    v39 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer providerItemIDForURL:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
    __fp_pop_log();

  }
LABEL_22:

}

void __57__FPDXPCServicer_providerItemIDForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer providerItemIDForURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __57__FPDXPCServicer_providerItemIDForURL_completionHandler___block_invoke_150(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer providerItemIDForURL:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)fetchFSItemsForItemIdentifiers:(id)a3 providerIdentifier:(id)a4 domainIdentifier:(id)a5 materializingIfNeeded:(BOOL)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  FPDXPCServicer *v16;
  _QWORD *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[2];
  void (*v35)(uint64_t, void *);
  void *v36;
  FPDXPCServicer *v37;
  id v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v31 = a6;
  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v35 = __125__FPDXPCServicer_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler___block_invoke;
  v36 = &unk_1E8C75530;
  v37 = self;
  v15 = v14;
  v38 = v15;
  v16 = self;
  v17 = v34;
  v39 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v16, "providerForIdentifier:enumerateEntitlementRequired:error:", v12, 1, &v39);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v39;
  if (!v18)
  {
    v35((uint64_t)v17, v19);
LABEL_7:
    v25 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v18, "invalidated"))
  {
    fp_current_or_default_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v41 = v18;
      _os_log_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v21 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v18, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v35((uint64_t)v17, v24);

    goto LABEL_7;
  }
  v25 = v18;
LABEL_9:

  if (v25)
  {
    objc_msgSend(v25, "domainForIdentifier:reason:", v13, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:].cold.2();

      fpfs_adopt_log();
      v39 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock();
        -[FPDXPCServicer fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:].cold.1();
      }

      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
      __fp_pop_log();

    }
    objc_msgSend(v26, "defaultBackend");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v16, "pid"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __125__FPDXPCServicer_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler___block_invoke_151;
    v32[3] = &unk_1E8C75760;
    v32[4] = v16;
    v33 = v15;
    objc_msgSend(v29, "fetchFSItemsForItemIdentifiers:materializingIfNeeded:request:completionHandler:", v11, v31, v30, v32);

  }
}

void __125__FPDXPCServicer_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:comp"
          "letionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __125__FPDXPCServicer_fetchFSItemsForItemIdentifiers_providerIdentifier_domainIdentifier_materializingIfNeeded_completionHandler___block_invoke_151(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:comp"
          "letionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)trashItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  _QWORD v33[2];
  void (*v34)(uint64_t, void *);
  void *v35;
  FPDXPCServicer *v36;
  id v37;
  _BYTE buf[12];
  __int16 v39;
  FPDXPCServicer *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v34 = __51__FPDXPCServicer_trashItemAtURL_completionHandler___block_invoke;
  v35 = &unk_1E8C75530;
  v36 = self;
  v9 = v7;
  v37 = v9;
  v10 = self;
  v11 = v6;
  v12 = v33;
  if (!v11)
  {
    FPInvalidParameterError();
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v26 = (void *)v25;
    v34((uint64_t)v12, (void *)v25);

    goto LABEL_15;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:logLevel:", v11, 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedWriteError();
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v10, "pid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultBackend");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __51__FPDXPCServicer_trashItemAtURL_completionHandler___block_invoke_153;
    v30[3] = &unk_1E8C77D08;
    v30[4] = v10;
    v31 = v9;
    objc_msgSend(v24, "trashItemAtURL:request:completionHandler:", v11, v23, v30);

  }
  else
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer trashItemAtURL:completionHandler:].cold.1(v11, v27);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log();
    v32 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v29;
      v39 = 2112;
      v40 = v10;
      v41 = 2080;
      v42 = "-[FPDXPCServicer trashItemAtURL:completionHandler:]";
      v43 = 2112;
      v44 = 0;
      v45 = 2112;
      v46 = v23;
      _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v23);
    __fp_pop_log();

  }
LABEL_15:

}

void __51__FPDXPCServicer_trashItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer trashItemAtURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __51__FPDXPCServicer_trashItemAtURL_completionHandler___block_invoke_153(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer trashItemAtURL:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)putBackURLForTrashedItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  id v40;
  _BYTE buf[12];
  __int16 v42;
  FPDXPCServicer *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke;
  v37 = &unk_1E8C774D8;
  v38 = self;
  v39 = v6;
  v9 = v7;
  v40 = v9;
  v10 = self;
  v11 = v39;
  v12 = v35;
  if (!v11)
  {
    FPInvalidParameterError();
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v26 = (void *)v25;
    v36((uint64_t)v12, (void *)v25);

    goto LABEL_15;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:accessType:logLevel:", v11, *MEMORY[0x1E0CAA660], 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedError();
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v10, "pid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultBackend");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke_155;
    v32[3] = &unk_1E8C77D08;
    v32[4] = v10;
    v33 = v9;
    objc_msgSend(v24, "putBackURLForTrashedItemAtURL:request:completionHandler:", v11, v23, v32);

  }
  else
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[FPDXPCServicer putBackURLForTrashedItemAtURL:completionHandler:].cold.1(v11, v27);

    fpfs_adopt_log();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock();
      FPProviderNotFoundErrorForURL();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v30;
      v42 = 2112;
      v43 = v10;
      v44 = 2080;
      v45 = "-[FPDXPCServicer putBackURLForTrashedItemAtURL:completionHandler:]";
      v46 = 2112;
      v47 = 0;
      v48 = 2112;
      v49 = v31;
      _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    FPProviderNotFoundErrorForURL();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v29);

    __fp_pop_log();
  }

LABEL_15:
}

void __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke_cold_1(a1);

  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCServicer putBackURLForTrashedItemAtURL:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = 0;
    v17 = 2112;
    v18 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

void __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke_155(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer putBackURLForTrashedItemAtURL:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)setPutBackInfoOnItemAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  _BYTE buf[12];
  __int16 v41;
  FPDXPCServicer *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __62__FPDXPCServicer_setPutBackInfoOnItemAtURL_completionHandler___block_invoke;
  v37 = &unk_1E8C75530;
  v38 = self;
  v9 = v7;
  v39 = v9;
  v10 = self;
  v11 = v6;
  v12 = v35;
  if (!v11)
  {
    FPInvalidParameterError();
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v26 = (void *)v25;
    v36((uint64_t)v12, (void *)v25);

    goto LABEL_15;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:logLevel:", v11, 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedWriteError();
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v10, "pid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultBackend");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __62__FPDXPCServicer_setPutBackInfoOnItemAtURL_completionHandler___block_invoke_156;
    v32[3] = &unk_1E8C75530;
    v32[4] = v10;
    v33 = v9;
    objc_msgSend(v24, "setPutBackInfoOnItemAtURL:completionHandler:", v11, v32);

  }
  else
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[FPDXPCServicer setPutBackInfoOnItemAtURL:completionHandler:].cold.1(v11, v27);

    fpfs_adopt_log();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock();
      FPProviderNotFoundErrorForURL();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v30;
      v41 = 2112;
      v42 = v10;
      v43 = 2080;
      v44 = "-[FPDXPCServicer setPutBackInfoOnItemAtURL:completionHandler:]";
      v45 = 2112;
      v46 = v31;
      _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    FPProviderNotFoundErrorForURL();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v29);

    __fp_pop_log();
  }

LABEL_15:
}

void __62__FPDXPCServicer_setPutBackInfoOnItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer setPutBackInfoOnItemAtURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __62__FPDXPCServicer_setPutBackInfoOnItemAtURL_completionHandler___block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer setPutBackInfoOnItemAtURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)fetchProviderForShareURL:(id)a3 fallbackIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  char v18;
  void *v19;
  id *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[2];
  void (*v26)(uint64_t, void *);
  void *v27;
  FPDXPCServicer *v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0CAAE90];
  v30[0] = *MEMORY[0x1E0CAAEE8];
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v26 = __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke;
  v27 = &unk_1E8C75530;
  v28 = self;
  v14 = v10;
  v29 = v14;
  v15 = v12;
  v16 = v25;
  -[FPDXPCServicer connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "fp_hasOneOfEntitlements:", v15);

  if ((v18 & 1) != 0)
  {

    v19 = (void *)MEMORY[0x1E0CA5838];
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158;
    v22[3] = &unk_1E8C77D30;
    v22[4] = self;
    v20 = &v24;
    v24 = v14;
    v23 = v9;
    objc_msgSend(v19, "getAppLinksWithURL:completionHandler:", v8, v22);
    v15 = v23;
  }
  else
  {
    v20 = &v29;
    FPNotPermittedError();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26((uint64_t)v16, v21);

  }
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  id v46;
  id obj;
  void *v48;
  void *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  const char *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint8_t v65[4];
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v46 = a3;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v52 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        fp_current_or_default_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_5(v65, v9, &v66, v10);

        objc_msgSend(*(id *)(a1 + 32), "server");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "extensionManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "targetApplicationRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "defaultProviderWithTopLevelBundleIdentifier:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          fp_current_or_default_log();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_4();

          fpfs_adopt_log();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          fp_current_or_default_log();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            v34 = FPPopLogSectionForBlock();
            v35 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v15, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219010;
            v56 = v34;
            v57 = 2112;
            v58 = v35;
            v59 = 2080;
            v60 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
            v61 = 2112;
            v62 = v36;
            v63 = 2112;
            v64 = 0;
            _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

          }
          v23 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v15, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, _QWORD))(v23 + 16))(v23, v24, 0);

          __fp_pop_log();
          goto LABEL_34;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v67, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "providerWithIdentifier:reason:", *(_QWORD *)(a1 + 40), 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_3();

      fpfs_adopt_log();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v40 = FPPopLogSectionForBlock();
        v41 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v18, "identifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v56 = v40;
        v57 = 2112;
        v58 = v41;
        v59 = 2080;
        v60 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
        v61 = 2112;
        v62 = v42;
        v63 = 2112;
        v64 = 0;
        _os_log_debug_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
LABEL_28:

      v28 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v18, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v28 + 16))(v28, v29, 0);

      __fp_pop_log();
      goto LABEL_34;
    }
    objc_msgSend(*(id *)(a1 + 32), "server");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "extensionManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "defaultProviderWithTopLevelBundleIdentifier:", *(_QWORD *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      fp_current_or_default_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_2();

      fpfs_adopt_log();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v43 = FPPopLogSectionForBlock();
        v44 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v18, "identifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v56 = v43;
        v57 = 2112;
        v58 = v44;
        v59 = 2080;
        v60 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
        v61 = 2112;
        v62 = v45;
        v63 = 2112;
        v64 = 0;
        _os_log_debug_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      goto LABEL_28;
    }
  }
  fp_current_or_default_log();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_1();

  fpfs_adopt_log();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v37 = FPPopLogSectionForBlock();
    v38 = *(_QWORD *)(a1 + 32);
    FPProviderNotFoundError();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v56 = v37;
    v57 = 2112;
    v58 = v38;
    v59 = 2080;
    v60 = "-[FPDXPCServicer fetchProviderForShareURL:fallbackIdentifier:completionHandler:]_block_invoke";
    v61 = 2112;
    v62 = 0;
    v63 = 2112;
    v64 = v39;
    _os_log_debug_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  v32 = *(_QWORD *)(a1 + 48);
  FPProviderNotFoundError();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v32 + 16))(v32, 0, v33);

  __fp_pop_log();
LABEL_34:

}

- (void)updateLastUsedDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  id v40;
  _QWORD v41[8];

  v41[7] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke;
  v37 = &unk_1E8C774D8;
  v38 = self;
  v39 = v6;
  v9 = v7;
  v40 = v9;
  v10 = self;
  v11 = v39;
  v12 = v35;
  if (!v11)
  {
    FPInvalidParameterError();
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v27 = (void *)v26;
    v36((uint64_t)v12, (void *)v26);

    goto LABEL_15;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:logLevel:", v11, 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedWriteError();
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v10, "pid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultBackend");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v8;
    v31[1] = 3221225472;
    v31[2] = __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_160;
    v31[3] = &unk_1E8C77D58;
    v31[4] = v10;
    v34 = v9;
    v32 = v22;
    v33 = v23;
    v25 = v23;
    objc_msgSend(v24, "itemForURL:request:completionHandler:", v11, v25, v31);

  }
  else
  {
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer updateLastUsedDate:completionHandler:].cold.2(v11, v28);

    fpfs_adopt_log();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer updateLastUsedDate:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    __fp_pop_log();

  }
LABEL_15:

}

void __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_cold_1(a1);

  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCServicer updateLastUsedDate:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

void __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_160(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLastUsedDate:", v7);

    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_162;
    v13[3] = &unk_1E8C77C78;
    v8 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(v8, "daemonSideItemChange:changedFields:request:completionHandler:", v5, 8, v9, v13);

  }
  else
  {
    fpfs_adopt_log();
    v15 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = FPPopLogSectionForBlock();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v17 = v11;
      v18 = 2112;
      v19 = v12;
      v20 = 2080;
      v21 = "-[FPDXPCServicer updateLastUsedDate:completionHandler:]_block_invoke";
      v22 = 2112;
      v23 = v6;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
}

void __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_162(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer updateLastUsedDate:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke_cold_1(a1);

  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCServicer valuesForAttributes:forItemAtURL:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = 0;
    v17 = 2112;
    v18 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

void __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke_163(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer valuesForAttributes:forItemAtURL:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __43__FPDXPCServicer_fetchListOfMonitoredApps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer fetchListOfMonitoredApps:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)startOperation:(id)a3 toFetchIconsForAppBundleIDs:(id)a4 requestedSize:(CGSize)a5 scale:(double)a6 completionHandler:(id)a7
{
  double height;
  double width;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD *v19;
  FPDXPCServicer *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  FPDFetchAppLibraryIconOperation *v25;
  dispatch_group_t v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  FPDXPCServicer *v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  FPDXPCServicer *v48;
  NSObject *v49;
  id v50;
  SEL v51;
  id v52;
  _QWORD v53[2];
  void (*v54)(uint64_t, void *);
  void *v55;
  FPDXPCServicer *v56;
  id v57;
  _BYTE location[24];
  const char *v59;
  __int16 v60;
  NSObject *v61;
  uint64_t v62;

  height = a5.height;
  width = a5.width;
  v62 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = MEMORY[0x1E0C809B0];
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v54 = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke;
  v55 = &unk_1E8C75530;
  v56 = self;
  v18 = v16;
  v57 = v18;
  v19 = v53;
  v20 = self;
  -[FPDXPCServicer connection](v20, "connection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)location = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&location[8] = v22;
  *(_QWORD *)&location[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", location, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_msgSend(v21, "fp_hasOneOfEntitlements:", v23);
  if ((v24 & 1) != 0)
  {

    v25 = -[FPDFetchAppLibraryIconOperation initWithAppBundleIDs:desiredSize:screenScale:]([FPDFetchAppLibraryIconOperation alloc], "initWithAppBundleIDs:desiredSize:screenScale:", v15, width, height, a6);
    if (v25)
    {
      v26 = dispatch_group_create();
      -[FPOperation callbackQueue](v25, "callbackQueue");
      v46[0] = v17;
      v46[1] = 3221225472;
      v46[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_167;
      v46[3] = &unk_1E8C77D80;
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v51 = a2;
      v47 = v27;
      v48 = v20;
      v28 = v26;
      v49 = v28;
      v29 = v14;
      v50 = v29;
      -[FPDFetchAppLibraryIconOperation setPerAppBundleCompletion:](v25, "setPerAppBundleCompletion:", v46);
      *(_QWORD *)location = 0;
      objc_initWeak((id *)location, v20);
      v40[0] = v17;
      v40[1] = 3221225472;
      v40[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_3;
      v40[3] = &unk_1E8C77DA8;
      v30 = v27;
      v41 = v30;
      objc_copyWeak(&v45, (id *)location);
      v31 = v28;
      v42 = v31;
      v43 = v20;
      v44 = v18;
      -[FPOperation setFinishedBlock:](v25, "setFinishedBlock:", v40);
      -[FPDFetchAppLibraryIconOperation progress](v25, "progress");
      v38[0] = v17;
      v38[1] = 3221225472;
      v38[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_178;
      v38[3] = &unk_1E8C753A8;
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v39 = v32;
      objc_msgSend(v29, "remoteObjectProxyWithErrorHandler:", v38);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setCancellationHandler:", v32);
      +[FPDFetchAppLibraryIconOperation sharedOperationQueue](FPDFetchAppLibraryIconOperation, "sharedOperationQueue");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addOperation:", v25);

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)location);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "fp_invalidArgumentError:", CFSTR("can't fetch icons for %@"), v15);
      v31 = objc_claimAutoreleasedReturnValue();
      fpfs_adopt_log();
      v52 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v37 = FPPopLogSectionForBlock();
        *(_DWORD *)location = 134218754;
        *(_QWORD *)&location[4] = v37;
        *(_WORD *)&location[12] = 2112;
        *(_QWORD *)&location[14] = v20;
        *(_WORD *)&location[22] = 2080;
        v59 = "-[FPDXPCServicer startOperation:toFetchIconsForAppBundleIDs:requestedSize:scale:completionHandler:]";
        v60 = 2112;
        v61 = v31;
        _os_log_debug_impl(&dword_1CF55F000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", location, 0x2Au);
      }

      (*((void (**)(id, NSObject *))v18 + 2))(v18, v31);
      __fp_pop_log();

    }
  }
  else
  {
    FPNotPermittedError();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v54((uint64_t)v19, v35);

  }
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer startOperation:toFetchIconsForAppBundleIDs:requestedSize:scale:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_167(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ UNREACHABLE: per app bundle block call without appBundleID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[FPDXPCServicer startOperation:toFetchIconsForAppBundleIDs:requestedSize:scale:completionHandler:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDXPCServicer.m", 1867, (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
  }
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("appBundleID"));
  if (v10)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v10, CFSTR("thumbnailData"));
  if (v11)
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("contentType"));
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_2;
  v17[3] = &unk_1E8C75E48;
  v14 = *(void **)(a1 + 56);
  v18 = *(id *)(a1 + 48);
  objc_msgSend(v14, "operationDidProgressWithInfo:error:completionHandler:", v13, v12, v17);

}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject **WeakRetained;
  NSObject **v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 64));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_4;
    block[3] = &unk_1E8C75580;
    v8 = *(NSObject **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    v10 = v4;
    dispatch_group_notify(v8, v7, block);

  }
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_4(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  fpfs_adopt_log();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = FPPopLogSectionForBlock();
    v4 = a1[4];
    v5 = a1[5];
    *(_DWORD *)buf = 134218754;
    v8 = v3;
    v9 = 2112;
    v10 = v4;
    v11 = 2080;
    v12 = "-[FPDXPCServicer startOperation:toFetchIconsForAppBundleIDs:requestedSize:scale:completionHandler:]_block_invoke_4";
    v13 = 2112;
    v14 = v5;
    _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(a1[6] + 16))();
  __fp_pop_log();

}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_178(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_178_cold_1(v3, v4);

  objc_msgSend(*(id *)(a1 + 32), "cancel");
}

- (void)materializeURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  FPDXPCServicer *v9;
  uint64_t *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  FPDXPCServicer *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __51__FPDXPCServicer_materializeURL_completionHandler___block_invoke;
  v24 = &unk_1E8C75530;
  v25 = self;
  v8 = v7;
  v26 = v8;
  v9 = self;
  v10 = &v21;
  if (!v6)
  {
    FPInvalidParameterError();
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v20 = (void *)v19;
    v23((uint64_t)v10, (void *)v19);

    goto LABEL_8;
  }
  -[FPDXPCServicer connection](v9, "connection", v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fp_hasSandboxAccessToFile:accessType:logLevel:", v6, *MEMORY[0x1E0CAA660], 0);

  if ((v12 & 1) == 0)
  {
    -[FPDXPCServicer connection](v9, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "fp_hasOneOfEntitlements:logLevel:", v14, 0);

    if ((v15 & 1) == 0)
    {
      -[FPDXPCServicer connection](v9, "connection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "fp_isNonSandboxedConnection");

      if ((v17 & 1) == 0)
      {
        FPNotPermittedError();
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
    }
  }

  -[FPDXPCServicer server](v9, "server");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "materializeURL:completion:", v6, v8);

LABEL_8:
}

void __51__FPDXPCServicer_materializeURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer materializeURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (id)stageLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  id v17;

  +[FPDServer appSupportPath](FPDServer, "appSupportPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.fileproviderd.stage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __31__FPDXPCServicer_stageLocation__block_invoke;
  v15 = &unk_1E8C75850;
  v16 = v5;
  v6 = v4;
  v17 = v6;
  v7 = stageLocation_onceToken;
  v8 = v5;
  if (v7 != -1)
    dispatch_once(&stageLocation_onceToken, &v12);
  objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0, v12, v13, v14, v15);
  v9 = v17;
  v10 = v6;

  return v10;
}

uint64_t __31__FPDXPCServicer_stageLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", *(_QWORD *)(a1 + 40), 0);
}

- (BOOL)writeMetadata:(id)a3 onURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v7 = a3;
  v8 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__11;
  v20 = __Block_byref_object_dispose__11;
  v21 = 0;
  objc_msgSend(v7, "extendedAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke;
  v13[3] = &unk_1E8C77DD0;
  v10 = v8;
  v14 = v10;
  v15 = &v16;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);

  v11 = (void *)v17[5];
  if (a5 && v11)
    *a5 = objc_retainAutorelease(v11);

  _Block_object_dispose(&v16, 8);
  return v11 == 0;
}

void __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  const void *v12;
  size_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = a2;
  v6 = objc_retainAutorelease(*(id *)(a1 + 32));
  v7 = a3;
  v8 = (const char *)objc_msgSend(v6, "fileSystemRepresentation");
  v9 = objc_retainAutorelease(v5);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  v11 = objc_retainAutorelease(v7);
  v12 = (const void *)objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");

  if (setxattr(v8, v10, v12, v13, 0, 0) < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke_cold_1();
  }
  else
  {
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke_cold_2((uint64_t)v9, (id *)(a1 + 32));
  }

}

- (void)makeTopologicallySortedItemsOnDisk:(id)a3 completionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  FPDXPCServicer *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  NSObject *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  FPDXPCServicer *v41;
  id *v42;
  id *v43;
  BOOL v44;
  id *v45;
  char v46;
  NSObject *v47;
  void *v48;
  int v49;
  void *v50;
  int v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id *v58;
  id *v59;
  BOOL v60;
  id *v61;
  char v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  void *v66;
  FPDXPCServicer *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  FPDXPCServicer *v71;
  void *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  id v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  void *v86;
  NSObject *v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  NSObject *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  void *v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  void *v104;
  void *v105;
  uint64_t v106;
  void *v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  void *v113;
  void *v114;
  uint64_t v115;
  id v116;
  id v117;
  void *v118;
  id v119;
  id obj;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  void *v124;
  FPDXPCServicer *v125;
  _QWORD v126[4];
  id v127;
  id *v128;
  uint8_t v129;
  char v130[15];
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  id v136;
  id v137;
  id v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  id v143;
  id *v144;
  uint64_t v145;
  uint64_t (*v146)(uint64_t, uint64_t);
  void (*v147)(uint64_t);
  id v148;
  _QWORD v149[2];
  void (*v150)(uint64_t, void *);
  void *v151;
  FPDXPCServicer *v152;
  id v153;
  uint8_t v154[4];
  uint64_t v155;
  uint8_t v156[4];
  uint64_t v157;
  uint8_t buf[4];
  uint64_t v159;
  __int16 v160;
  FPDXPCServicer *v161;
  __int16 v162;
  const char *v163;
  __int16 v164;
  id v165;
  __int16 v166;
  void *v167;
  _BYTE v168[128];
  uint64_t v169;

  v169 = *MEMORY[0x1E0C80C00];
  v116 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend(WeakRetained, "extensionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clouddocsExtensionIdentifier");
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  v149[0] = MEMORY[0x1E0C809B0];
  v149[1] = 3221225472;
  v150 = __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke;
  v151 = &unk_1E8C75530;
  v152 = self;
  v119 = v6;
  v153 = v119;
  v9 = self;
  v10 = v149;
  v143 = 0;
  v125 = v9;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v9, "providerForIdentifier:enumerateEntitlementRequired:error:", v118, 1, &v143);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v143;
  if (!v11)
  {
    v150((uint64_t)v10, v12);
LABEL_7:
    v117 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "invalidated"))
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v159 = (uint64_t)v11;
      _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v150((uint64_t)v10, v17);

    goto LABEL_7;
  }
  v117 = v11;
LABEL_9:

  if (v117)
  {
    v122 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = 0;
    v144 = &v143;
    v145 = 0x3032000000;
    v146 = __Block_byref_object_copy__11;
    v147 = __Block_byref_object_dispose__11;
    v148 = 0;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    obj = v116;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v168, 16);
    if (v18)
    {
      v121 = *(_QWORD *)v140;
      v123 = *MEMORY[0x1E0CAABA0];
      v115 = *MEMORY[0x1E0CEC5F8];
LABEL_12:
      v19 = 0;
      while (1)
      {
        if (*(_QWORD *)v140 != v121)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * v19);
        v138 = 0;
        -[FPDXPCServicer server](v125, "server");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "extensionManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "parentItemID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "domainFromItemID:reason:", v23, &v138);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v24)
        {
          fpfs_adopt_log();
          v137 = (id)objc_claimAutoreleasedReturnValue();
          fp_current_or_default_log();
          v88 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
          {
            v102 = FPPopLogSectionForBlock();
            objc_msgSend(v20, "parentItemID");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "providerDomainID");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            FPProviderNotFoundError();
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134219010;
            v159 = v102;
            v160 = 2112;
            v161 = v125;
            v162 = 2080;
            v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
            v164 = 2112;
            v165 = 0;
            v166 = 2112;
            v167 = v105;
            _os_log_debug_impl(&dword_1CF55F000, v88, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

          }
          objc_msgSend(v20, "parentItemID");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "providerDomainID");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          FPProviderNotFoundError();
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          (*((void (**)(id, _QWORD, void *))v119 + 2))(v119, 0, v91);

          __fp_pop_log();
          goto LABEL_93;
        }
        objc_msgSend(v20, "itemIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "isEqualToString:", v123);

        if (v26)
        {
          objc_msgSend(v24, "rootURLs");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "firstObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v20, "parentItemIdentifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "isEqualToString:", v123);

          if (v30)
          {
            objc_msgSend(v24, "rootURLs");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "firstObject");
          }
          else
          {
            objc_msgSend(v20, "parentItemID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "objectForKeyedSubscript:", v31);
          }
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v27)
          {
            fpfs_adopt_log();
            v137 = (id)objc_claimAutoreleasedReturnValue();
            fp_current_or_default_log();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
            {
              v106 = FPPopLogSectionForBlock();
              objc_msgSend(v20, "parentItemIdentifier");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              FPItemNotFoundError();
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134219010;
              v159 = v106;
              v160 = 2112;
              v161 = v125;
              v162 = 2080;
              v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
              v164 = 2112;
              v165 = 0;
              v166 = 2112;
              v167 = v108;
              _os_log_debug_impl(&dword_1CF55F000, v92, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

            }
            objc_msgSend(v20, "parentItemIdentifier");
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            FPItemNotFoundError();
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, _QWORD, void *))v119 + 2))(v119, 0, v94);

            __fp_pop_log();
            goto LABEL_92;
          }
          objc_msgSend(v20, "filename");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "URLByAppendingPathComponent:", v32);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (objc_msgSend(v20, "isFolder"))
        {
          objc_msgSend(v20, "itemID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v122, "setObject:forKeyedSubscript:", v28, v33);

        }
        objc_msgSend(v28, "path");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v124, "fileExistsAtPath:", v34);

        if (v35)
        {
          fp_current_or_default_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v28, "path");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "itemID");
            v67 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v159 = (uint64_t)v66;
            v160 = 2112;
            v161 = v67;
            _os_log_debug_impl(&dword_1CF55F000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] item already exists at %@ [%@]", buf, 0x16u);

          }
        }
        else
        {
          if (objc_msgSend(v20, "isFolder"))
          {
            fp_current_or_default_log();
            v37 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v28, "path");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "itemID");
              v71 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v159 = (uint64_t)v70;
              v160 = 2112;
              v161 = v71;
              _os_log_debug_impl(&dword_1CF55F000, v37, OS_LOG_TYPE_DEBUG, "[DEBUG] creating folder %@ [%@]", buf, 0x16u);

            }
            -[FPDXPCServicer stageLocation](v125, "stageLocation");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "UUIDString");
            v40 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "URLByAppendingPathComponent:", v40);
            v41 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();

            v42 = v144 + 5;
            v136 = v144[5];
            LOBYTE(v40) = objc_msgSend(v124, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v41, 0, 0, &v136);
            objc_storeStrong(v42, v136);
            if ((v40 & 1) == 0)
            {
              v137 = 0;
              fpfs_adopt_log();
              v137 = (id)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v73 = FPPopLogSectionForBlock();
                v74 = v144[5];
                *(_DWORD *)buf = 134219010;
                v159 = v73;
                v160 = 2112;
                v161 = v125;
                v162 = 2080;
                v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                v164 = 2112;
                v165 = 0;
                v166 = 2112;
                v167 = v74;
                _os_log_debug_impl(&dword_1CF55F000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
              goto LABEL_58;
            }
            v43 = v144 + 5;
            v135 = v144[5];
            v44 = -[FPDXPCServicer writeMetadata:onURL:error:](v125, "writeMetadata:onURL:error:", v20, v41, &v135);
            objc_storeStrong(v43, v135);
            if (!v44)
            {
              v137 = 0;
              fpfs_adopt_log();
              v137 = (id)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v77 = FPPopLogSectionForBlock();
                v78 = v144[5];
                *(_DWORD *)buf = 134219010;
                v159 = v77;
                v160 = 2112;
                v161 = v125;
                v162 = 2080;
                v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                v164 = 2112;
                v165 = 0;
                v166 = 2112;
                v167 = v78;
                _os_log_debug_impl(&dword_1CF55F000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
              goto LABEL_58;
            }
            v45 = v144 + 5;
            v134 = v144[5];
            v46 = objc_msgSend(v124, "moveItemAtURL:toURL:error:", v41, v28, &v134);
            objc_storeStrong(v45, v134);
            if ((v46 & 1) == 0)
            {
              if (objc_msgSend(v144[5], "fp_isCocoaErrorCode:", 516))
              {
                fp_current_or_default_log();
                v47 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend(v28, "path");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:].cold.2(v48, v156, &v157, v47);
                }

                v49 = 5;
                goto LABEL_63;
              }
              v137 = 0;
              fpfs_adopt_log();
              v137 = (id)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
              {
                v81 = FPPopLogSectionForBlock();
                v82 = v144[5];
                *(_DWORD *)buf = 134219010;
                v159 = v81;
                v160 = 2112;
                v161 = v125;
                v162 = 2080;
                v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                v164 = 2112;
                v165 = 0;
                v166 = 2112;
                v167 = v82;
                _os_log_debug_impl(&dword_1CF55F000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
LABEL_58:

              (*((void (**)(id, _QWORD, id))v119 + 2))(v119, 0, v144[5]);
              __fp_pop_log();

              v49 = 1;
              goto LABEL_63;
            }
          }
          else
          {
            objc_msgSend(v20, "contentType");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v50, "conformsToType:", v115);

            if (!v51)
            {
              fpfs_adopt_log();
              v137 = (id)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v95 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v95, OS_LOG_TYPE_DEBUG))
              {
                v109 = FPPopLogSectionForBlock();
                objc_msgSend(v20, "typeIdentifier");
                v110 = (void *)objc_claimAutoreleasedReturnValue();
                FPInvalidParameterError();
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134219010;
                v159 = v109;
                v160 = 2112;
                v161 = v125;
                v162 = 2080;
                v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                v164 = 2112;
                v165 = 0;
                v166 = 2112;
                v167 = v111;
                _os_log_debug_impl(&dword_1CF55F000, v95, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

              }
              objc_msgSend(v20, "typeIdentifier");
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              FPInvalidParameterError();
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, _QWORD, void *))v119 + 2))(v119, 0, v97);

              __fp_pop_log();
              goto LABEL_92;
            }
            objc_msgSend(v20, "itemID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v122, "objectForKeyedSubscript:", v52);
            v41 = (FPDXPCServicer *)objc_claimAutoreleasedReturnValue();

            fp_current_or_default_log();
            v53 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v28, "path");
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v159 = (uint64_t)v72;
              v160 = 2112;
              v161 = v41;
              _os_log_debug_impl(&dword_1CF55F000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] creating symlink %@ to %@", buf, 0x16u);

            }
            if (!v41)
            {
              fpfs_adopt_log();
              v137 = (id)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v98 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
              {
                v112 = FPPopLogSectionForBlock();
                objc_msgSend(v20, "itemID");
                v113 = (void *)objc_claimAutoreleasedReturnValue();
                FPInvalidParameterError();
                v114 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134219010;
                v159 = v112;
                v160 = 2112;
                v161 = v125;
                v162 = 2080;
                v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                v164 = 2112;
                v165 = 0;
                v166 = 2112;
                v167 = v114;
                _os_log_debug_impl(&dword_1CF55F000, v98, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

              }
              objc_msgSend(v20, "itemID");
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              FPInvalidParameterError();
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, _QWORD, void *))v119 + 2))(v119, 0, v100);

              __fp_pop_log();
LABEL_92:

              goto LABEL_93;
            }
            -[FPDXPCServicer stageLocation](v125, "stageLocation");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "UUIDString");
            v56 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "URLByAppendingPathComponent:", v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();

            v58 = v144 + 5;
            v133 = v144[5];
            LOBYTE(v56) = objc_msgSend(v124, "createSymbolicLinkAtURL:withDestinationURL:error:", v57, v41, &v133);
            objc_storeStrong(v58, v133);
            if ((v56 & 1) == 0)
            {
              v137 = 0;
              fpfs_adopt_log();
              v137 = (id)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                v75 = FPPopLogSectionForBlock();
                v76 = v144[5];
                *(_DWORD *)buf = 134219010;
                v159 = v75;
                v160 = 2112;
                v161 = v125;
                v162 = 2080;
                v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                v164 = 2112;
                v165 = 0;
                v166 = 2112;
                v167 = v76;
                _os_log_debug_impl(&dword_1CF55F000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
LABEL_61:

              (*((void (**)(id, _QWORD, id))v119 + 2))(v119, 0, v144[5]);
              __fp_pop_log();

              v49 = 1;
LABEL_62:

LABEL_63:
              if (v49 != 5)
                goto LABEL_93;
              goto LABEL_64;
            }
            v59 = v144 + 5;
            v132 = v144[5];
            v60 = -[FPDXPCServicer writeMetadata:onURL:error:](v125, "writeMetadata:onURL:error:", v20, v57, &v132);
            objc_storeStrong(v59, v132);
            if (!v60)
            {
              v137 = 0;
              fpfs_adopt_log();
              v137 = (id)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v65 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
              {
                v79 = FPPopLogSectionForBlock();
                v80 = v144[5];
                *(_DWORD *)buf = 134219010;
                v159 = v79;
                v160 = 2112;
                v161 = v125;
                v162 = 2080;
                v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                v164 = 2112;
                v165 = 0;
                v166 = 2112;
                v167 = v80;
                _os_log_debug_impl(&dword_1CF55F000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
              }
              goto LABEL_61;
            }
            v61 = v144 + 5;
            v131 = v144[5];
            v62 = objc_msgSend(v124, "moveItemAtURL:toURL:error:", v57, v28, &v131);
            objc_storeStrong(v61, v131);
            if ((v62 & 1) == 0)
            {
              if (!objc_msgSend(v144[5], "fp_isCocoaErrorCode:", 516))
              {
                v137 = 0;
                fpfs_adopt_log();
                v137 = (id)objc_claimAutoreleasedReturnValue();
                fp_current_or_default_log();
                v65 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                {
                  v83 = FPPopLogSectionForBlock();
                  v84 = v144[5];
                  *(_DWORD *)buf = 134219010;
                  v159 = v83;
                  v160 = 2112;
                  v161 = v125;
                  v162 = 2080;
                  v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
                  v164 = 2112;
                  v165 = 0;
                  v166 = 2112;
                  v167 = v84;
                  _os_log_debug_impl(&dword_1CF55F000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
                }
                goto LABEL_61;
              }
              fp_current_or_default_log();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v28, "path");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                -[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:].cold.2(v69, v154, &v155, v68);
              }

              v49 = 5;
              goto LABEL_62;
            }

          }
          fp_current_or_default_log();
          v63 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
            -[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:].cold.1(&v129, v130, v63);

          objc_msgSend(v24, "defaultBackend");
          v36 = objc_claimAutoreleasedReturnValue();
          -[NSObject fakeFSEventAtURL:](v36, "fakeFSEventAtURL:", v28);
        }

LABEL_64:
        if (v18 == ++v19)
        {
          v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v139, v168, 16);
          v18 = v85;
          if (v85)
            goto LABEL_12;
          break;
        }
      }
    }

    v86 = (void *)objc_opt_new();
    v126[0] = MEMORY[0x1E0C809B0];
    v126[1] = 3221225472;
    v126[2] = __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke_190;
    v126[3] = &unk_1E8C77DF8;
    v128 = &v143;
    obj = v86;
    v127 = obj;
    objc_msgSend(v122, "enumerateKeysAndObjectsUsingBlock:", v126);
    fpfs_adopt_log();
    v138 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v87 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      v101 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      v159 = v101;
      v160 = 2112;
      v161 = v125;
      v162 = 2080;
      v163 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]";
      v164 = 2112;
      v165 = obj;
      v166 = 2112;
      v167 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v87, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, id, _QWORD))v119 + 2))(v119, obj, 0);
    __fp_pop_log();

LABEL_93:
    _Block_object_dispose(&v143, 8);

  }
}

void __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer makeTopologicallySortedItemsOnDisk:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke_190(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id obj;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CAACB8];
  objc_msgSend(v6, "URLByStandardizingPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v9 + 40);
  objc_msgSend(v7, "wrapperWithURL:readonly:error:", v8, 0, &obj);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v9 + 40), obj);

  if (!v10)
  {
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke_190_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v5);

}

- (void)getURLForContainerWithItemID:(id)a3 inDataScopeDomainWithIdentifier:(id)a4 documentsScopeDomainIdentifier:(id)a5 documentsFolderItemIdentifier:(id)a6 completionHandler:(id)a7
{
  id v12;
  FPDServer **p_server;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  FPDXPCServicer *v18;
  _QWORD *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[2];
  void (*v64)(uint64_t, void *);
  void *v65;
  FPDXPCServicer *v66;
  id v67;
  id v68;
  uint8_t buf[4];
  uint64_t v70;
  __int16 v71;
  FPDXPCServicer *v72;
  __int16 v73;
  const char *v74;
  __int16 v75;
  uint64_t v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  v57 = a4;
  v54 = a5;
  v55 = a6;
  v12 = a7;
  p_server = &self->_server;
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend(WeakRetained, "extensionManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clouddocsExtensionIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v64 = __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke;
  v65 = &unk_1E8C75530;
  v66 = self;
  v17 = v12;
  v67 = v17;
  v18 = self;
  v19 = v63;
  v68 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v18, "providerForIdentifier:enumerateEntitlementRequired:error:", v16, 1, &v68);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v68;
  if (!v20)
  {
    v64((uint64_t)v19, v21);
LABEL_7:
    v27 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v20, "invalidated"))
  {
    fp_current_or_default_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v70 = (uint64_t)v20;
      _os_log_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v20, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v64((uint64_t)v19, v26);

    goto LABEL_7;
  }
  v27 = v20;
LABEL_9:

  if (v27)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC70]), "initWithProviderID:domainIdentifier:itemIdentifier:", v16, v57, v56);
    v68 = 0;
    -[FPDXPCServicer server](v18, "server");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "extensionManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "domainFromItemID:reason:", v28, &v68);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v31 = objc_alloc(MEMORY[0x1E0CAAC70]);
      v32 = objc_loadWeakRetained((id *)p_server);
      objc_msgSend(v32, "extensionManager");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "clouddocsExtensionIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v31, "initWithProviderID:domainIdentifier:itemIdentifier:", v34, v54, v55);

      -[FPDXPCServicer server](v18, "server");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "extensionManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "domainFromItemID:reason:", v35, &v68);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      if (v38)
      {
        objc_msgSend(v38, "defaultBackend");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v18, "pid"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke_193;
        v58[3] = &unk_1E8C77E48;
        v58[4] = v18;
        v61 = v17;
        v59 = v53;
        v60 = v28;
        objc_msgSend(v39, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v35, 1, 1, 0, v40, v58);

      }
      else
      {
        fpfs_adopt_log();
        v62 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        {
          v52 = FPPopLogSectionForBlock();
          objc_msgSend(v35, "providerDomainID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          FPProviderNotFoundError();
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219266;
          v70 = v52;
          v71 = 2112;
          v72 = v18;
          v73 = 2080;
          v74 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdenti"
                "fier:documentsFolderItemIdentifier:completionHandler:]";
          v75 = 2112;
          v76 = 0;
          v77 = 2112;
          v78 = 0;
          v79 = 2112;
          v80 = v51;
          _os_log_debug_impl(&dword_1CF55F000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

        }
        objc_msgSend(v35, "providerDomainID");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v46);

        __fp_pop_log();
      }

    }
    else
    {
      fpfs_adopt_log();
      v62 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v47 = FPPopLogSectionForBlock();
        objc_msgSend(v28, "providerDomainID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        v70 = v47;
        v71 = 2112;
        v72 = v18;
        v73 = 2080;
        v74 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifi"
              "er:documentsFolderItemIdentifier:completionHandler:]";
        v75 = 2112;
        v76 = 0;
        v77 = 2112;
        v78 = 0;
        v79 = 2112;
        v80 = v49;
        _os_log_debug_impl(&dword_1CF55F000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

      }
      objc_msgSend(v28, "providerDomainID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v17 + 2))(v17, 0, 0, v43);

      __fp_pop_log();
    }

  }
}

void __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier:d"
          "ocumentsFolderItemIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = 0;
    v18 = 2112;
    v19 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke_193(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    fpfs_adopt_log();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v14 = FPPopLogSectionForBlock();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219266;
      v21 = v14;
      v22 = 2112;
      v23 = v15;
      v24 = 2080;
      v25 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier"
            ":documentsFolderItemIdentifier:completionHandler:]_block_invoke";
      v26 = 2112;
      v27 = 0;
      v28 = 2112;
      v29 = 0;
      v30 = 2112;
      v31 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "defaultBackend");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", objc_msgSend(*(id *)(a1 + 32), "pid"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke_194;
    v16[3] = &unk_1E8C77E20;
    v16[4] = *(_QWORD *)(a1 + 32);
    v18 = *(id *)(a1 + 56);
    v17 = v8;
    objc_msgSend(v11, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v12, 1, 1, 0, v13, v16);

  }
}

void __158__FPDXPCServicer_getURLForContainerWithItemID_inDataScopeDomainWithIdentifier_documentsScopeDomainIdentifier_documentsFolderItemIdentifier_completionHandler___block_invoke_194(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7)
  {
    fpfs_adopt_log();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = FPPopLogSectionForBlock();
      v12 = a1[4];
      *(_DWORD *)buf = 134219266;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      v21 = 2080;
      v22 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier"
            ":documentsFolderItemIdentifier:completionHandler:]_block_invoke";
      v23 = 2112;
      v24 = 0;
      v25 = 2112;
      v26 = 0;
      v27 = 2112;
      v28 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }
  else
  {
    fpfs_adopt_log();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v13 = FPPopLogSectionForBlock();
      v14 = a1[4];
      v15 = a1[5];
      *(_DWORD *)buf = 134219266;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2080;
      v22 = "-[FPDXPCServicer getURLForContainerWithItemID:inDataScopeDomainWithIdentifier:documentsScopeDomainIdentifier"
            ":documentsFolderItemIdentifier:completionHandler:]_block_invoke";
      v23 = 2112;
      v24 = v8;
      v25 = 2112;
      v26 = v15;
      v27 = 2112;
      v28 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
    }
  }

  (*(void (**)(void))(a1[6] + 16))();
  __fp_pop_log();

}

- (void)updateBlockedProcessNamesForProvider:(id)a3 processNames:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  FPDXPCServicer *v12;
  uint64_t *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  FPDXPCServicer *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v25 = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __86__FPDXPCServicer_updateBlockedProcessNamesForProvider_processNames_completionHandler___block_invoke;
  v28 = &unk_1E8C75530;
  v29 = self;
  v11 = v10;
  v30 = v11;
  v12 = self;
  v13 = &v25;
  v31 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v12, "providerForIdentifier:enumerateEntitlementRequired:error:", v8, 1, &v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v31;
  if (!v14)
  {
    v27((uint64_t)v13, v15);
LABEL_7:
    v21 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v14, "invalidated"))
  {
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v14;
      _os_log_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v18, v25, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27((uint64_t)v13, v20);

    goto LABEL_7;
  }
  v21 = v14;
LABEL_9:

  if (v21)
  {
    v22 = v21;
    objc_sync_enter(v22);
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setBlockedProcessNames:", v23);

    }
    else
    {
      objc_msgSend(v22, "setBlockedProcessNames:", 0);
    }
    objc_sync_exit(v22);

    fpfs_adopt_log();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer updateBlockedProcessNamesForProvider:processNames:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    __fp_pop_log();

  }
}

void __86__FPDXPCServicer_updateBlockedProcessNamesForProvider_processNames_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer updateBlockedProcessNamesForProvider:processNames:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)fetchPathComponentsForURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, void *);
  void *v38;
  FPDXPCServicer *v39;
  id v40;
  _BYTE buf[12];
  __int16 v42;
  FPDXPCServicer *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v37 = __62__FPDXPCServicer_fetchPathComponentsForURL_completionHandler___block_invoke;
  v38 = &unk_1E8C75530;
  v39 = self;
  v9 = v7;
  v40 = v9;
  v10 = self;
  v11 = v6;
  v12 = v36;
  if (!v11)
  {
    FPInvalidParameterError();
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v26 = (void *)v25;
    v37((uint64_t)v12, (void *)v25);

    goto LABEL_15;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:accessType:logLevel:", v11, *MEMORY[0x1E0CAA660], 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedError();
        v25 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v10, "pid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "defaultBackend");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v8;
    v32[1] = 3221225472;
    v32[2] = __62__FPDXPCServicer_fetchPathComponentsForURL_completionHandler___block_invoke_196;
    v32[3] = &unk_1E8C77D30;
    v32[4] = v10;
    v34 = v9;
    v33 = v22;
    objc_msgSend(v24, "hierarchyForURL:request:completionHandler:", v11, v23, v32);

  }
  else
  {
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer fetchPathComponentsForURL:completionHandler:].cold.1(v11, v27);

    fpfs_adopt_log();
    v35 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock();
      FPProviderNotFoundErrorForURL();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v30;
      v42 = 2112;
      v43 = v10;
      v44 = 2080;
      v45 = "-[FPDXPCServicer fetchPathComponentsForURL:completionHandler:]";
      v46 = 2112;
      v47 = MEMORY[0x1E0C9AA60];
      v48 = 2112;
      v49 = v31;
      _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    FPProviderNotFoundErrorForURL();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, MEMORY[0x1E0C9AA60], v29);

    __fp_pop_log();
  }

LABEL_15:
}

void __62__FPDXPCServicer_fetchPathComponentsForURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer fetchPathComponentsForURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = MEMORY[0x1E0C9AA60];
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __62__FPDXPCServicer_fetchPathComponentsForURL_completionHandler___block_invoke_196(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    fpfs_adopt_log();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = FPPopLogSectionForBlock();
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2080;
      v27 = "-[FPDXPCServicer fetchPathComponentsForURL:completionHandler:]_block_invoke";
      v28 = 2112;
      v29 = (void *)MEMORY[0x1E0C9AA60];
      v30 = 2112;
      v31 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "providerDomainsByID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "providerDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    FPPathComponentsForFPItems();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v18 = FPPopLogSectionForBlock();
      v19 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v23 = v18;
      v24 = 2112;
      v25 = v19;
      v26 = 2080;
      v27 = "-[FPDXPCServicer fetchPathComponentsForURL:completionHandler:]_block_invoke";
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    __fp_pop_log();

  }
}

- (void)backUpUserURL:(id)a3 outputUserURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  -[FPDXPCServicer connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = *MEMORY[0x1E0CAAEB0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v12, 0, 2);

  if ((v13 & 1) != 0)
  {
    -[FPDXPCServicer server](self, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v14, "fpfsSQLBackupManagerClass")), "initWithUserURL:outputUserURL:", v8, v9);

    objc_msgSend(v15, "backUpWithCompletionHandler:", v10);
  }
  else
  {
    FPNotPermittedError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v15);
  }

}

- (void)restoreUserURL:(id)a3 fromBuild:(id)a4 restoreType:(id)a5 cleanupOnSuccess:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, void *);
  void *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v8 = a6;
  v21[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void (**)(id, _QWORD, void *))a7;
  -[FPDXPCServicer connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = *MEMORY[0x1E0CAAEB0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "fp_hasOneOfEntitlements:nonSandboxedAccess:logLevel:", v17, 0, 2);

  if ((v18 & 1) != 0)
  {
    -[FPDXPCServicer server](self, "server");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v19, "fpfsSQLRestoreManagerClass")), "initWithUserURL:fromBuild:restoreType:cleanupOnSuccess:", v12, v13, v14, v8);

    objc_msgSend(v20, "restoreWithCompletionHandler:", v15);
  }
  else
  {
    FPNotPermittedError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v15[2](v15, 0, v20);
  }

}

- (void)resolveConflictAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  FPDXPCServicer *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  _QWORD v34[2];
  void (*v35)(uint64_t, void *);
  void *v36;
  FPDXPCServicer *v37;
  id v38;
  _BYTE buf[12];
  __int16 v40;
  FPDXPCServicer *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v35 = __57__FPDXPCServicer_resolveConflictAtURL_completionHandler___block_invoke;
  v36 = &unk_1E8C75530;
  v37 = self;
  v9 = v7;
  v38 = v9;
  v10 = self;
  v11 = v6;
  v12 = v34;
  if (!v11)
  {
    FPInvalidParameterError();
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v25 = (void *)v24;
    v35((uint64_t)v12, (void *)v24);

    goto LABEL_15;
  }
  -[FPDXPCServicer connection](v10, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasSandboxAccessToFile:accessType:logLevel:", v11, *MEMORY[0x1E0CAA660], 0);

  if ((v14 & 1) == 0)
  {
    -[FPDXPCServicer connection](v10, "connection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

    if ((v17 & 1) == 0)
    {
      -[FPDXPCServicer connection](v10, "connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "fp_isNonSandboxedConnection");

      if ((v19 & 1) == 0)
      {
        FPNotPermittedError();
        v24 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v10, "server");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "extensionManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "domainForURL:reason:", v11, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "defaultBackend");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v8;
    v31[1] = 3221225472;
    v31[2] = __57__FPDXPCServicer_resolveConflictAtURL_completionHandler___block_invoke_197;
    v31[3] = &unk_1E8C75530;
    v31[4] = v10;
    v32 = v9;
    objc_msgSend(v23, "resolveConflictAtURL:completionHandler:", v11, v31);

  }
  else
  {
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer resolveConflictAtURL:completionHandler:].cold.1(v11, v26);

    fpfs_adopt_log();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v29 = FPPopLogSectionForBlock();
      FPProviderNotFoundErrorForURL();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v29;
      v40 = 2112;
      v41 = v10;
      v42 = 2080;
      v43 = "-[FPDXPCServicer resolveConflictAtURL:completionHandler:]";
      v44 = 2112;
      v45 = v30;
      _os_log_debug_impl(&dword_1CF55F000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    FPProviderNotFoundErrorForURL();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v28);

    __fp_pop_log();
  }

LABEL_15:
}

void __57__FPDXPCServicer_resolveConflictAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer resolveConflictAtURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __57__FPDXPCServicer_resolveConflictAtURL_completionHandler___block_invoke_197(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer resolveConflictAtURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)listRemoteVersionsOfItemAtURL:(id)a3 includeCachedVersions:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  FPDXPCServicer *v12;
  id v13;
  _QWORD *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  _BYTE buf[12];
  __int16 v41;
  FPDXPCServicer *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v6 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __88__FPDXPCServicer_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler___block_invoke;
  v37 = &unk_1E8C75530;
  v38 = self;
  v11 = v9;
  v39 = v11;
  v12 = self;
  v13 = v8;
  v14 = v35;
  if (!v13)
  {
    FPInvalidParameterError();
    v26 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v27 = (void *)v26;
    v36((uint64_t)v14, (void *)v26);

    goto LABEL_13;
  }
  -[FPDXPCServicer connection](v12, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "fp_hasSandboxAccessToFile:accessType:logLevel:", v13, *MEMORY[0x1E0CAA660], 0);

  if ((v16 & 1) == 0)
  {
    -[FPDXPCServicer connection](v12, "connection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "fp_hasOneOfEntitlements:logLevel:", v18, 0);

    if ((v19 & 1) == 0)
    {
      -[FPDXPCServicer connection](v12, "connection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "fp_isNonSandboxedConnection");

      if ((v21 & 1) == 0)
      {
        FPNotPermittedError();
        v26 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }

  -[FPDXPCServicer server](v12, "server");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extensionManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "domainForURL:reason:", v13, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "defaultBackend");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v10;
    v32[1] = 3221225472;
    v32[2] = __88__FPDXPCServicer_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler___block_invoke_198;
    v32[3] = &unk_1E8C77E70;
    v32[4] = v12;
    v33 = v11;
    objc_msgSend(v25, "listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:", v13, v6, v32);

  }
  else
  {
    fpfs_adopt_log();
    v34 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v30 = FPPopLogSectionForBlock();
      FPProviderNotFoundErrorForURL();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      *(_QWORD *)&buf[4] = v30;
      v41 = 2112;
      v42 = v12;
      v43 = 2080;
      v44 = "-[FPDXPCServicer listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:]";
      v45 = 2112;
      v46 = 0;
      v47 = 2112;
      v48 = 0;
      v49 = 2112;
      v50 = v31;
      _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

    }
    FPProviderNotFoundErrorForURL();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v11 + 2))(v11, 0, 0, v29);

    __fp_pop_log();
  }

LABEL_13:
}

void __88__FPDXPCServicer_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = 0;
    v18 = 2112;
    v19 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __88__FPDXPCServicer_listRemoteVersionsOfItemAtURL_includeCachedVersions_completionHandler___block_invoke_198(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  fpfs_adopt_log();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = FPPopLogSectionForBlock();
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2080;
    v19 = "-[FPDXPCServicer listRemoteVersionsOfItemAtURL:includeCachedVersions:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:kno"
          "wnFolders:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_200(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:kno"
          "wnFolders:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_201(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopAccessingSecurityScopedResource");

  }
  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:kno"
          "wnFolders:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = 0;
    v17 = 2112;
    v18 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

void __139__FPDXPCServicer_addDomain_forProviderIdentifier_byImportingDirectoryAtURL_nonWrappedURL_userAllowedDBDrop_knownFolders_completionHandler___block_invoke_211(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAccessingSecurityScopedResource");

  }
  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "signalProviderChanges");

  }
  fpfs_adopt_log();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = FPPopLogSectionForBlock();
    v11 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134219010;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2080;
    v18 = "-[FPDXPCServicer addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:kno"
          "wnFolders:completionHandler:]_block_invoke";
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  __fp_pop_log();

}

- (void)prepareRemovalOfDomainWithIdentifier:(id)a3 provider:(id)a4 request:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (void)removeDomainAndPreserveDataWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  FPDXPCServicer *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, void *);
  void *v34;
  FPDXPCServicer *v35;
  id v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "fp_toProviderID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke;
  v34 = &unk_1E8C75530;
  v35 = self;
  v12 = v9;
  v36 = v12;
  v13 = self;
  v14 = v32;
  v37 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v13, "providerForIdentifier:enumerateEntitlementRequired:error:", v10, 1, &v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v37;
  if (v15)
  {
    if (objc_msgSend(v15, "invalidated"))
    {
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = v15;
        _os_log_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
      }

      v18 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v15, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      FPProviderNotRegistered();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v33((uint64_t)v14, v21);

      v22 = 0;
      v11 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v22 = v15;
    }
  }
  else
  {
    v33((uint64_t)v14, v16);
    v22 = 0;
  }

  if (v22)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v13, "pid"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fp_toDomainIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke_213;
    v26[3] = &unk_1E8C77EE8;
    v26[4] = v13;
    v30 = v12;
    v27 = v22;
    v31 = a4;
    v28 = v8;
    v29 = v23;
    v25 = v23;
    -[FPDXPCServicer prepareRemovalOfDomainWithIdentifier:provider:request:completionHandler:](v13, "prepareRemovalOfDomainWithIdentifier:provider:request:completionHandler:", v24, v27, v25, v26);

  }
}

void __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke_213(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fpfs_adopt_log();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v9 = FPPopLogSectionForBlock();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2080;
      v19 = "-[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:]_block_invoke";
      v20 = 2112;
      v21 = 0;
      v22 = 2112;
      v23 = v3;
      _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log();

  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "fp_toDomainIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke_214;
    v11[3] = &unk_1E8C77D08;
    v11[4] = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 72);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v5, "removeDomain:mode:request:completionHandler:", v6, v8, v7, v11);

  }
}

void __75__FPDXPCServicer_removeDomainAndPreserveDataWithID_mode_completionHandler___block_invoke_214(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    fpfs_adopt_log();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock();
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2080;
      v23 = "-[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log();

  }
  else
  {
    if (v5)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v5, 0, &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v16;
    }
    else
    {
      v7 = 0;
      v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signalProviderChanges");

    fpfs_adopt_log();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = FPPopLogSectionForBlock();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2080;
      v23 = "-[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log();

  }
}

- (void)removeDomainWithID:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__FPDXPCServicer_removeDomainWithID_mode_completionHandler___block_invoke;
  v10[3] = &unk_1E8C77F10;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  -[FPDXPCServicer removeDomainAndPreserveDataWithID:mode:completionHandler:](self, "removeDomainAndPreserveDataWithID:mode:completionHandler:", a3, a4, v10);

}

void __60__FPDXPCServicer_removeDomainWithID_mode_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer removeDomainWithID:mode:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)removeDomain:(id)a3 mode:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  FPDXPCServicer *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  unint64_t v30;
  _QWORD v31[2];
  void (*v32)(uint64_t, void *);
  void *v33;
  FPDXPCServicer *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v32 = __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke;
  v33 = &unk_1E8C75530;
  v34 = self;
  v11 = v9;
  v35 = v11;
  v12 = self;
  v13 = v31;
  v36 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v12, "providerForIdentifier:enumerateEntitlementRequired:error:", 0, 1, &v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v36;
  if (!v14)
  {
    v32((uint64_t)v13, v15);
LABEL_7:
    v21 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v14, "invalidated"))
  {
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v14;
      _os_log_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32((uint64_t)v13, v20);

    goto LABEL_7;
  }
  v21 = v14;
LABEL_9:

  if (v21)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v12, "pid"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v10;
    v25[1] = 3221225472;
    v25[2] = __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke_216;
    v25[3] = &unk_1E8C77EE8;
    v25[4] = v12;
    v29 = v11;
    v26 = v21;
    v30 = a4;
    v27 = v8;
    v28 = v22;
    v24 = v22;
    -[FPDXPCServicer prepareRemovalOfDomainWithIdentifier:provider:request:completionHandler:](v12, "prepareRemovalOfDomainWithIdentifier:provider:request:completionHandler:", v23, v26, v24, v25);

  }
}

void __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer removeDomain:mode:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke_216(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fpfs_adopt_log();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v9 = FPPopLogSectionForBlock();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      v18 = 2080;
      v19 = "-[FPDXPCServicer removeDomain:mode:completionHandler:]_block_invoke";
      v20 = 2112;
      v21 = 0;
      v22 = 2112;
      v23 = v3;
      _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log();

  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke_217;
    v11[3] = &unk_1E8C77D08;
    v11[4] = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 56);
    v8 = *(_QWORD *)(a1 + 72);
    v12 = *(id *)(a1 + 64);
    objc_msgSend(v5, "removeDomain:mode:request:completionHandler:", v6, v8, v7, v11);

  }
}

void __54__FPDXPCServicer_removeDomain_mode_completionHandler___block_invoke_217(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    fpfs_adopt_log();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock();
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2080;
      v23 = "-[FPDXPCServicer removeDomain:mode:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log();

  }
  else
  {
    if (v5)
    {
      v16 = 0;
      objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v5, 0, &v16);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v16;
    }
    else
    {
      v7 = 0;
      v9 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "signalProviderChanges");

    fpfs_adopt_log();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = FPPopLogSectionForBlock();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2080;
      v23 = "-[FPDXPCServicer removeDomain:mode:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log();

  }
}

- (void)removeDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__FPDXPCServicer_removeDomain_completionHandler___block_invoke;
  v8[3] = &unk_1E8C77F10;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[FPDXPCServicer removeDomain:mode:completionHandler:](self, "removeDomain:mode:completionHandler:", a3, 0, v8);

}

void __49__FPDXPCServicer_removeDomain_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer removeDomain:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)removeAllDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  FPDXPCServicer *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[2];
  void (*v23)(uint64_t, void *);
  void *v24;
  FPDXPCServicer *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v23 = __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke;
  v24 = &unk_1E8C75530;
  v25 = self;
  v8 = v6;
  v26 = v8;
  v9 = self;
  v10 = v22;
  v27 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v9, "providerForIdentifier:enumerateEntitlementRequired:error:", a3, 1, &v27);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v27;
  if (!v11)
  {
    v23((uint64_t)v10, v12);
LABEL_7:
    v18 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "invalidated"))
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v11;
      _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23((uint64_t)v10, v17);

    goto LABEL_7;
  }
  v18 = v11;
LABEL_9:

  if (v18)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v9, "pid"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke_218;
    v20[3] = &unk_1E8C75530;
    v20[4] = v9;
    v21 = v8;
    objc_msgSend(v18, "removeAllDomainsForRequest:completionHandler:", v19, v20);

  }
}

void __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer removeAllDomainsForProviderIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke_218(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fpfs_adopt_log();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = FPPopLogSectionForBlock();
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218754;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2080;
      v16 = "-[FPDXPCServicer removeAllDomainsForProviderIdentifier:completionHandler:]_block_invoke";
      v17 = 2112;
      v18 = v3;
      _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "signalProviderChanges");

    fpfs_adopt_log();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke_218_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log();

  }
}

- (void)getDomainsForProviderIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  FPDXPCServicer *v9;
  uint64_t *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  FPDXPCServicer *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  FPDXPCServicer *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __68__FPDXPCServicer_getDomainsForProviderIdentifier_completionHandler___block_invoke;
  v30 = &unk_1E8C75530;
  v31 = self;
  v8 = v7;
  v32 = v8;
  v9 = self;
  v10 = &v27;
  v33 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v9, "providerForIdentifier:enumerateEntitlementRequired:error:", v6, 1, &v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v33;
  if (!v11)
  {
    v29((uint64_t)v10, v12);
LABEL_7:
    v18 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v11, "invalidated"))
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = (uint64_t)v11;
      _os_log_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v14 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v15, v27, v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29((uint64_t)v10, v17);

    goto LABEL_7;
  }
  v18 = v11;
LABEL_9:

  if (v18)
  {
    fpfs_adopt_log();
    v33 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v23 = FPPopLogSectionForBlock();
      objc_msgSend(v18, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "nsDomainsByID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "allValues");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v35 = v23;
      v36 = 2112;
      v37 = v9;
      v38 = 2080;
      v39 = "-[FPDXPCServicer getDomainsForProviderIdentifier:completionHandler:]";
      v40 = 2112;
      v41 = v24;
      v42 = 2112;
      v43 = v26;
      _os_log_debug_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    objc_msgSend(v18, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "nsDomainsByID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "allValues");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, void *, _QWORD))v8 + 2))(v8, v20, v22, 0);

    __fp_pop_log();
  }

}

void __68__FPDXPCServicer_getDomainsForProviderIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer getDomainsForProviderIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = 0;
    v18 = 2112;
    v19 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)setEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  FPDXPCServicer *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[2];
  void (*v28)(uint64_t, void *);
  void *v29;
  FPDXPCServicer *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v8 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = __86__FPDXPCServicer_setEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke;
  v29 = &unk_1E8C75530;
  v30 = self;
  v13 = v11;
  v31 = v13;
  v14 = self;
  v15 = v27;
  v32 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v14, "providerForIdentifier:enumerateEntitlementRequired:error:", a5, 1, &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  if (v16)
  {
    if (objc_msgSend(v16, "invalidated"))
    {
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v16;
        _os_log_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
      }

      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      FPProviderNotRegistered();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28((uint64_t)v15, v22);

      v23 = 0;
      v12 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v23 = v16;
    }
  }
  else
  {
    v28((uint64_t)v15, v17);
    v23 = 0;
  }

  if (v23)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v14, "pid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __86__FPDXPCServicer_setEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_219;
    v25[3] = &unk_1E8C75530;
    v25[4] = v14;
    v26 = v13;
    objc_msgSend(v23, "setEnabled:forDomainIdentifier:request:completionHandler:", v8, v10, v24, v25);

  }
}

void __86__FPDXPCServicer_setEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer setEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __86__FPDXPCServicer_setEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_219(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signalProviderChanges");

  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCServicer setEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)setHiddenByUser:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  FPDXPCServicer *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[2];
  void (*v28)(uint64_t, void *);
  void *v29;
  FPDXPCServicer *v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v8 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a6;
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = __91__FPDXPCServicer_setHiddenByUser_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke;
  v29 = &unk_1E8C75530;
  v30 = self;
  v13 = v11;
  v31 = v13;
  v14 = self;
  v15 = v27;
  v32 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v14, "providerForIdentifier:enumerateEntitlementRequired:error:", a5, 1, &v32);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v32;
  if (v16)
  {
    if (objc_msgSend(v16, "invalidated"))
    {
      fp_current_or_default_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v16;
        _os_log_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
      }

      v19 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v16, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      FPProviderNotRegistered();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28((uint64_t)v15, v22);

      v23 = 0;
      v12 = MEMORY[0x1E0C809B0];
    }
    else
    {
      v23 = v16;
    }
  }
  else
  {
    v28((uint64_t)v15, v17);
    v23 = 0;
  }

  if (v23)
  {
    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v14, "pid"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v12;
    v25[1] = 3221225472;
    v25[2] = __91__FPDXPCServicer_setHiddenByUser_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_220;
    v25[3] = &unk_1E8C75530;
    v25[4] = v14;
    v26 = v13;
    objc_msgSend(v23, "setHiddenByUser:forDomainIdentifier:request:completionHandler:", v8, v10, v24, v25);

  }
}

void __91__FPDXPCServicer_setHiddenByUser_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer setHiddenByUser:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __91__FPDXPCServicer_setHiddenByUser_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_220(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signalProviderChanges");

  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCServicer setHiddenByUser:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)setIndexingEnabled:(BOOL)a3 forDomainIdentifier:(id)a4 providerIdentifier:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  id v13;
  FPDXPCServicer *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  _QWORD v37[2];
  void (*v38)(uint64_t, void *);
  void *v39;
  FPDXPCServicer *v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  FPDXPCServicer *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v8 = a3;
  v51 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v38 = __94__FPDXPCServicer_setIndexingEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke;
  v39 = &unk_1E8C75530;
  v40 = self;
  v13 = v12;
  v41 = v13;
  v14 = self;
  v15 = v37;
  v42 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v14, "providerForIdentifier:enumerateEntitlementRequired:error:", v11, 1, &v42);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v42;
  if (!v16)
  {
    v38((uint64_t)v15, v17);
LABEL_7:
    v23 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v16, "invalidated"))
  {
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = (uint64_t)v16;
      _os_log_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38((uint64_t)v15, v22);

    goto LABEL_7;
  }
  v23 = v16;
LABEL_9:

  if (v23)
  {
    v42 = 0;
    objc_msgSend(v23, "domainForIdentifier:reason:", v10, &v42);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "indexer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26 == 0;

      if (v27)
      {
        fpfs_adopt_log();
        v36 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          FPPopLogSectionForBlock();
          -[FPDXPCServicer setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:].cold.1();
        }

        (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
        __fp_pop_log();

      }
      else
      {
        objc_msgSend(v25, "indexer");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __94__FPDXPCServicer_setIndexingEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_221;
        v34[3] = &unk_1E8C75530;
        v34[4] = v14;
        v35 = v13;
        objc_msgSend(v28, "setIndexingEnabled:completionHandler:", v8, v34);

      }
    }
    else
    {
      fpfs_adopt_log();
      v36 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        v32 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v44 = v32;
        v45 = 2112;
        v46 = v14;
        v47 = 2080;
        v48 = "-[FPDXPCServicer setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]";
        v49 = 2112;
        v50 = v33;
        _os_log_debug_impl(&dword_1CF55F000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPProviderNotFoundError();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v13 + 2))(v13, v30);

      __fp_pop_log();
    }

  }
}

void __94__FPDXPCServicer_setIndexingEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __94__FPDXPCServicer_setIndexingEnabled_forDomainIdentifier_providerIdentifier_completionHandler___block_invoke_221(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)reimportItemsBelowItemWithID:(id)a3 markItemDataless:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  FPDXPCServicer *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  FPDXPCServicer *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v6 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "providerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __82__FPDXPCServicer_reimportItemsBelowItemWithID_markItemDataless_completionHandler___block_invoke;
  v37 = &unk_1E8C75530;
  v38 = self;
  v11 = v9;
  v39 = v11;
  v12 = self;
  v13 = v35;
  v40 = 0;
  -[FPDXPCServicer providerForIdentifier:enumerateEntitlementRequired:error:](v12, "providerForIdentifier:enumerateEntitlementRequired:error:", v10, 1, &v40);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v40;
  if (!v14)
  {
    v36((uint64_t)v13, v15);
LABEL_7:
    v21 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v14, "invalidated"))
  {
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = (uint64_t)v14;
      _os_log_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Provider %@ is invalidated.", buf, 0xCu);
    }

    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v14, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("A provider with ID %@ was found, but is in the process of being invalidated. Retry later."), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    FPProviderNotRegistered();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36((uint64_t)v13, v20);

    goto LABEL_7;
  }
  v21 = v14;
LABEL_9:

  if (v21)
  {
    v40 = 0;
    -[FPDXPCServicer server](v12, "server");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "extensionManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "domainFromItemID:reason:", v8, &v40);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v24, "defaultBackend");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __82__FPDXPCServicer_reimportItemsBelowItemWithID_markItemDataless_completionHandler___block_invoke_222;
      v32[3] = &unk_1E8C75530;
      v32[4] = v12;
      v33 = v11;
      objc_msgSend(v25, "reimportItemsBelowItemWithID:markItemDataless:completionHandler:", v8, v6, v32);

    }
    else
    {
      fpfs_adopt_log();
      v34 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = FPPopLogSectionForBlock();
        objc_msgSend(v8, "providerID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v42 = v29;
        v43 = 2112;
        v44 = v12;
        v45 = 2080;
        v46 = "-[FPDXPCServicer reimportItemsBelowItemWithID:markItemDataless:completionHandler:]";
        v47 = 2112;
        v48 = v31;
        _os_log_debug_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      objc_msgSend(v8, "providerID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v11 + 2))(v11, v28);

      __fp_pop_log();
    }

  }
}

void __82__FPDXPCServicer_reimportItemsBelowItemWithID_markItemDataless_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer reimportItemsBelowItemWithID:markItemDataless:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __82__FPDXPCServicer_reimportItemsBelowItemWithID_markItemDataless_completionHandler___block_invoke_222(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer reimportItemsBelowItemWithID:markItemDataless:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)forceUpdateBlockedProcessNamesFromDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t v27;
  _QWORD v28[2];
  void (*v29)(uint64_t, void *);
  void *v30;
  FPDXPCServicer *v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  FPDXPCServicer *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41[0] = *MEMORY[0x1E0CAAE90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v29 = __77__FPDXPCServicer_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke;
  v30 = &unk_1E8C75530;
  v31 = self;
  v10 = v7;
  v32 = v10;
  v11 = v8;
  v12 = v28;
  -[FPDXPCServicer connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if ((v14 & 1) != 0)
  {

    v27 = 0;
    -[FPDXPCServicer server](self, "server");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extensionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "domainWithID:reason:", v6, &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "defaultBackend");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v9;
      v24[1] = 3221225472;
      v24[2] = __77__FPDXPCServicer_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke_223;
      v24[3] = &unk_1E8C75530;
      v24[4] = self;
      v25 = v10;
      objc_msgSend(v18, "forceUpdateBlockedProcessNamesFromDomain:completionHandler:", v6, v24);

    }
    else
    {
      fpfs_adopt_log();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v22 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v34 = v22;
        v35 = 2112;
        v36 = self;
        v37 = 2080;
        v38 = "-[FPDXPCServicer forceUpdateBlockedProcessNamesFromDomain:completionHandler:]";
        v39 = 2112;
        v40 = v23;
        _os_log_debug_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPProviderNotFoundError();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v21);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29((uint64_t)v12, v19);

  }
}

void __77__FPDXPCServicer_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer forceUpdateBlockedProcessNamesFromDomain:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __77__FPDXPCServicer_forceUpdateBlockedProcessNamesFromDomain_completionHandler___block_invoke_223(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer forceUpdateBlockedProcessNamesFromDomain:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)importProgressForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  FPDXPCServicer *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAED0];
  v50[0] = *MEMORY[0x1E0CAAE90];
  v50[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __66__FPDXPCServicer_importProgressForDomainWithID_completionHandler___block_invoke;
  v37 = &unk_1E8C75530;
  v38 = self;
  v11 = v7;
  v39 = v11;
  v12 = v9;
  v13 = v35;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    v34 = 0;
    -[FPDXPCServicer server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v6, &v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        objc_msgSend(v18, "defaultBackend");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v10;
        v31[1] = 3221225472;
        v31[2] = __66__FPDXPCServicer_importProgressForDomainWithID_completionHandler___block_invoke_226;
        v31[3] = &unk_1E8C77F38;
        v31[4] = self;
        v32 = v11;
        objc_msgSend(v21, "importProgressWithCompletionHandler:", v31);

      }
      else
      {
        fpfs_adopt_log();
        v33 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v29 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v41 = v29;
          v42 = 2112;
          v43 = self;
          v44 = 2080;
          v45 = "-[FPDXPCServicer importProgressForDomainWithID:completionHandler:]";
          v46 = 2112;
          v47 = 0;
          v48 = 2112;
          v49 = v30;
          _os_log_debug_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        FPNotSupportedError();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v26);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v27 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v41 = v27;
        v42 = 2112;
        v43 = self;
        v44 = 2080;
        v45 = "-[FPDXPCServicer importProgressForDomainWithID:completionHandler:]";
        v46 = 2112;
        v47 = 0;
        v48 = 2112;
        v49 = v28;
        _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPProviderNotFoundError();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v24);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36((uint64_t)v13, v22);

  }
}

void __66__FPDXPCServicer_importProgressForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer importProgressForDomainWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __66__FPDXPCServicer_importProgressForDomainWithID_completionHandler___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer importProgressForDomainWithID:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)checkLocationEligibilityForDomain:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  FPNotSupportedError();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, _QWORD, id))a4 + 2))(v5, 0, 0, v6);

}

- (void)stateForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  FPDXPCServicer *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;
  id v26;
  _QWORD v27[2];
  void (*v28)(uint64_t, void *);
  void *v29;
  FPDXPCServicer *v30;
  id v31;
  _BYTE buf[24];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v28 = __57__FPDXPCServicer_stateForDomainWithID_completionHandler___block_invoke;
  v29 = &unk_1E8C75530;
  v30 = self;
  v9 = v7;
  v31 = v9;
  v10 = v27;
  v11 = self;
  -[FPDXPCServicer connection](v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)buf = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&buf[8] = v13;
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v14);
  if ((v15 & 1) != 0)
  {

    -[FPDXPCServicer server](v11, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v6, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __57__FPDXPCServicer_stateForDomainWithID_completionHandler___block_invoke_228;
      v24[3] = &unk_1E8C77F60;
      v24[4] = v11;
      v25 = v9;
      objc_msgSend(v19, "stateWithCompletionHandler:", v24);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAAB88], 12, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      fpfs_adopt_log();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219010;
        *(_QWORD *)&buf[4] = v23;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        *(_WORD *)&buf[22] = 2080;
        v33 = "-[FPDXPCServicer stateForDomainWithID:completionHandler:]";
        v34 = 2048;
        v35 = 0;
        v36 = 2112;
        v37 = v21;
        _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu, %@", buf, 0x34u);
      }

      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v21);
      __fp_pop_log();

    }
  }
  else
  {
    FPNotPermittedError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28((uint64_t)v10, v20);

  }
}

void __57__FPDXPCServicer_stateForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer stateForDomainWithID:completionHandler:]_block_invoke";
    v14 = 2048;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __57__FPDXPCServicer_stateForDomainWithID_completionHandler___block_invoke_228(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  fpfs_adopt_log();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = FPPopLogSectionForBlock();
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2080;
    v15 = "-[FPDXPCServicer stateForDomainWithID:completionHandler:]_block_invoke";
    v16 = 2048;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)runFPCKForDomainWithID:(id)a3 domainRootURL:(id)a4 databaseBackupPath:(id)a5 options:(unint64_t)a6 reason:(unint64_t)a7 launchType:(unint64_t)a8 completionHandler:(id)a9
{
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  void *v19;
  char v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  char v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v49;
  id v50;
  id v51;
  id v52;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  id v62;
  _QWORD v63[2];
  void (*v64)(uint64_t, void *);
  void *v65;
  FPDXPCServicer *v66;
  id v67;
  uint8_t buf[4];
  uint64_t v69;
  __int16 v70;
  FPDXPCServicer *v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  __int16 v78;
  uint64_t v79;
  __int16 v80;
  void *v81;
  _QWORD v82[5];

  v82[2] = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v49 = a4;
  v50 = a5;
  v13 = a9;
  v14 = *MEMORY[0x1E0CAAEA0];
  v82[0] = *MEMORY[0x1E0CAAE90];
  v82[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v82, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v63[0] = MEMORY[0x1E0C809B0];
  v63[1] = 3221225472;
  v64 = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke;
  v65 = &unk_1E8C75530;
  v66 = self;
  v51 = v13;
  v67 = v51;
  v17 = v15;
  v18 = v63;
  -[FPDXPCServicer connection](self, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "fp_hasOneOfEntitlements:", v17);

  if ((v20 & 1) != 0)
  {

    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_INFO, "[INFO] 🧹 FPCK launched from XPC", buf, 2u);
    }

    if (a8 == 1)
    {
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:].cold.3();
    }
    else if (a8)
    {
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:].cold.1();
    }
    else
    {
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:].cold.2();
    }

    -[FPDXPCServicer server](self, "server");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "extensionManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "domainWithID:reason:", v52, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      -[FPDXPCServicer server](self, "server");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_msgSend(v46, "fpckTaskClass"), "sharedManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "nsDomain");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "userInfo");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "checkableURLs");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "volume");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v44, "role");
      objc_msgSend(v26, "nsDomain");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "personaIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 128;
      if (a7)
        v28 = a7;
      v38 = v28;
      v29 = objc_msgSend(v26, "isUsingFPFS");
      objc_msgSend(v26, "provider");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "descriptor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "wantsBundleBitOnlyPackageDetection");
      v53[0] = v16;
      v53[1] = 3221225472;
      v53[2] = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_230;
      v53[3] = &unk_1E8C77FB0;
      v53[4] = self;
      v58 = v51;
      v54 = v52;
      v55 = v26;
      v56 = v49;
      v57 = v50;
      v59 = a6;
      v60 = a7;
      v61 = a8;
      LOBYTE(v37) = 1;
      BYTE1(v36) = v32;
      LOBYTE(v36) = v29;
      objc_msgSend(v41, "prepareFPCKRun:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:personaIdentifier:options:reason:fpfs:iCDPackageDetection:launchType:runOnWorkQueue:completionHandler:", v54, v42, v56, v57, v40, v39, v27, a6, v38, v36, a8, v37, v53);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAAB88], 12, 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      fpfs_adopt_log();
      v62 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        v35 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219522;
        v69 = v35;
        v70 = 2112;
        v71 = self;
        v72 = 2080;
        v73 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:]";
        v74 = 2112;
        v75 = 0;
        v76 = 2112;
        v77 = 0;
        v78 = 2112;
        v79 = 0;
        v80 = 2112;
        v81 = v33;
        _os_log_debug_impl(&dword_1CF55F000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v51 + 2))(v51, 0, 0, 0, v33);
      __fp_pop_log();

    }
  }
  else
  {
    FPNotPermittedError();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v64((uint64_t)v18, v23);

  }
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219522;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionH"
          "andler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = 0;
    v18 = 2112;
    v19 = 0;
    v20 = 2112;
    v21 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_230(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id WeakRetained;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  id v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_2;
  v45[3] = &unk_1E8C75E48;
  v11 = v8;
  v46 = v11;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(WeakRetained, "setInvalidationHandler:", v45);

  if (v9)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_230_cold_1(v9, v13);

    fpfs_adopt_log();
    v44 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v27 = FPPopLogSectionForBlock();
      v28 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219522;
      v48 = v27;
      v49 = 2112;
      v50 = v28;
      v51 = 2080;
      v52 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completio"
            "nHandler:]_block_invoke";
      v53 = 2112;
      v54 = 0;
      v55 = 2112;
      v56 = 0;
      v57 = 2112;
      v58 = 0;
      v59 = 2112;
      v60 = v9;
      _os_log_debug_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    __fp_pop_log();

    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "invalidate");

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v16, "fpckTaskClass"), "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (id *)(a1 + 48);
    v37 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "nsDomain");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "userInfo");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *(_QWORD *)(a1 + 64);
    v36 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 48), "checkableURLs");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "volume");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v40, "role");
    v19 = *(_QWORD *)(a1 + 88);
    if (!v19)
      v19 = 128;
    v32 = v19;
    v33 = *(_QWORD *)(a1 + 80);
    v31 = objc_msgSend(*v18, "isUsingFPFS");
    objc_msgSend(*v18, "provider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "descriptor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "wantsBundleBitOnlyPackageDetection");
    v23 = v16;
    v24 = v11;
    v25 = *(_QWORD *)(a1 + 96);
    v42[0] = v10;
    v42[1] = 3221225472;
    v42[2] = __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_232;
    v42[3] = &unk_1E8C77F88;
    v42[4] = *(_QWORD *)(a1 + 32);
    v43 = *(id *)(a1 + 72);
    v30 = v25;
    v11 = v24;
    v26 = v23;
    v9 = 0;
    BYTE1(v29) = v22;
    LOBYTE(v29) = v31;
    objc_msgSend(v17, "scheduleFPCKRun:domainUserInfo:domainRootURL:databaseBackupPath:urls:volumeRole:options:reason:fpfs:iCDPackageDetection:launchType:pauseChecker:shouldPause:proxy:completionHandler:", v37, v38, v36, v35, v39, v34, v33, v32, v29, v30, 0, 0, v7, v42);

  }
}

uint64_t __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_232(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  fpfs_adopt_log();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = FPPopLogSectionForBlock();
    v16 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219522;
    v19 = v15;
    v20 = 2112;
    v21 = v16;
    v22 = 2080;
    v23 = "-[FPDXPCServicer runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionH"
          "andler:]_block_invoke";
    v24 = 2112;
    v25 = v9;
    v26 = 2112;
    v27 = v10;
    v28 = 2112;
    v29 = v11;
    v30 = 2112;
    v31 = v12;
    _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

}

- (void)dumpDatabaseAt:(id)a3 fullDump:(BOOL)a4 writeTo:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  char v17;
  void *v18;
  id *v19;
  void *v20;
  _BOOL4 v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];
  void (*v25)(uint64_t, void *);
  void *v26;
  FPDXPCServicer *v27;
  id v28;
  _QWORD v29[2];

  v21 = a4;
  v29[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v29[0] = *MEMORY[0x1E0CAAE90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = __68__FPDXPCServicer_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke;
  v26 = &unk_1E8C75530;
  v27 = self;
  v13 = v11;
  v28 = v13;
  v14 = v12;
  v15 = v24;
  -[FPDXPCServicer connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fp_hasOneOfEntitlements:", v14);

  if ((v17 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_msgSend(v18, "fpckTaskClass"), "sharedManager");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __68__FPDXPCServicer_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke_235;
    v22[3] = &unk_1E8C75530;
    v22[4] = self;
    v19 = &v23;
    v23 = v13;
    objc_msgSend(v14, "dumpDatabaseAt:fullDump:writeTo:completionHandler:", v9, v21, v10, v22);
  }
  else
  {
    v19 = &v28;
    FPNotPermittedError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25((uint64_t)v15, v20);

    v18 = v14;
  }

}

void __68__FPDXPCServicer_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer dumpDatabaseAt:fullDump:writeTo:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __68__FPDXPCServicer_dumpDatabaseAt_fullDump_writeTo_completionHandler___block_invoke_235(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer dumpDatabaseAt:fullDump:writeTo:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)calculateNonPurgeableSpaceUsageOfDomain:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  void (*v30)(uint64_t, void *);
  void *v31;
  FPDXPCServicer *v32;
  id v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  FPDXPCServicer *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v44[0] = *MEMORY[0x1E0CAAEB8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v30 = __76__FPDXPCServicer_calculateNonPurgeableSpaceUsageOfDomain_completionHandler___block_invoke;
  v31 = &unk_1E8C75530;
  v32 = self;
  v9 = v7;
  v33 = v9;
  v10 = v8;
  v11 = v29;
  -[FPDXPCServicer connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if ((v13 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extensionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "domainWithID:reason:", v6, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      fpfs_adopt_log();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v23 = FPPopLogSectionForBlock();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "nonEvictableSpace"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v35 = v23;
        v36 = 2112;
        v37 = self;
        v38 = 2080;
        v39 = "-[FPDXPCServicer calculateNonPurgeableSpaceUsageOfDomain:completionHandler:]";
        v40 = 2112;
        v41 = v24;
        v42 = 2112;
        v43 = 0;
        _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v16, "nonEvictableSpace"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v18, 0);

      __fp_pop_log();
    }
    else
    {
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = (uint64_t)v6;
        _os_log_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] No domain found with identifier %@", buf, 0xCu);
      }

      fpfs_adopt_log();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v25 = FPPopLogSectionForBlock();
        FPDomainUnavailableError();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v35 = v25;
        v36 = 2112;
        v37 = self;
        v38 = 2080;
        v39 = "-[FPDXPCServicer calculateNonPurgeableSpaceUsageOfDomain:completionHandler:]";
        v40 = 2112;
        v41 = 0;
        v42 = 2112;
        v43 = v26;
        _os_log_debug_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);

      }
      FPDomainUnavailableError();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v22);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30((uint64_t)v11, v19);

  }
}

void __76__FPDXPCServicer_calculateNonPurgeableSpaceUsageOfDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer calculateNonPurgeableSpaceUsageOfDomain:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)accumulatedSizeOfPinnedItemsInDomain:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  void (*v29)(uint64_t, void *);
  void *v30;
  FPDXPCServicer *v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  FPDXPCServicer *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v43[0] = *MEMORY[0x1E0CAAEB8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v29 = __66__FPDXPCServicer_accumulatedSizeOfPinnedItemsInDomain_completion___block_invoke;
  v30 = &unk_1E8C75530;
  v31 = self;
  v9 = v7;
  v32 = v9;
  v10 = v8;
  v11 = v28;
  -[FPDXPCServicer connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if ((v13 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extensionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "domainWithID:reason:", v6, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      fpfs_adopt_log();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v22 = FPPopLogSectionForBlock();
        v23 = objc_msgSend(v16, "accumulatedSizeOfPinnedItems");
        *(_DWORD *)buf = 134219010;
        v34 = v22;
        v35 = 2112;
        v36 = self;
        v37 = 2080;
        v38 = "-[FPDXPCServicer accumulatedSizeOfPinnedItemsInDomain:completion:]";
        v39 = 2048;
        v40 = v23;
        v41 = 2112;
        v42 = 0;
        _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu %@", buf, 0x34u);
      }

      (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, objc_msgSend(v16, "accumulatedSizeOfPinnedItems"), 0);
      __fp_pop_log();

    }
    else
    {
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v34 = (uint64_t)v6;
        _os_log_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] No domain found with identifier %@", buf, 0xCu);
      }

      fpfs_adopt_log();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v24 = FPPopLogSectionForBlock();
        FPDomainUnavailableError();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v34 = v24;
        v35 = 2112;
        v36 = self;
        v37 = 2080;
        v38 = "-[FPDXPCServicer accumulatedSizeOfPinnedItemsInDomain:completion:]";
        v39 = 2048;
        v40 = 0;
        v41 = 2112;
        v42 = v25;
        _os_log_debug_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu %@", buf, 0x34u);

      }
      FPDomainUnavailableError();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v21);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29((uint64_t)v11, v18);

  }
}

void __66__FPDXPCServicer_accumulatedSizeOfPinnedItemsInDomain_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer accumulatedSizeOfPinnedItemsInDomain:completion:]_block_invoke";
    v14 = 2048;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %llu %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)accumulatedSizeOfItemsInDomain:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[2];
  void (*v34)(uint64_t, void *);
  void *v35;
  FPDXPCServicer *v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  FPDXPCServicer *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v48[0] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v34 = __60__FPDXPCServicer_accumulatedSizeOfItemsInDomain_completion___block_invoke;
  v35 = &unk_1E8C75530;
  v36 = self;
  v9 = v7;
  v37 = v9;
  v10 = v8;
  v11 = v33;
  -[FPDXPCServicer connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if ((v13 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extensionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "domainWithID:reason:", v6, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "accumulatedSizeOfItems");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        fpfs_adopt_log();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          v25 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          v39 = v25;
          v40 = 2112;
          v41 = self;
          v42 = 2080;
          v43 = "-[FPDXPCServicer accumulatedSizeOfItemsInDomain:completion:]";
          v44 = 2112;
          v45 = v17;
          v46 = 2112;
          v47 = 0;
          _os_log_debug_impl(&dword_1CF55F000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
        }

        (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v17, 0);
        __fp_pop_log();

      }
      else
      {
        fpfs_adopt_log();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v28 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v39 = v28;
          v40 = 2112;
          v41 = self;
          v42 = 2080;
          v43 = "-[FPDXPCServicer accumulatedSizeOfItemsInDomain:completion:]";
          v44 = 2112;
          v45 = 0;
          v46 = 2112;
          v47 = v29;
          _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);

        }
        FPNotSupportedError();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v24);

        __fp_pop_log();
      }

    }
    else
    {
      fp_current_or_default_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v39 = (uint64_t)v6;
        _os_log_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] No domain found with identifier %@", buf, 0xCu);
      }

      fpfs_adopt_log();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        v26 = FPPopLogSectionForBlock();
        FPDomainUnavailableError();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v39 = v26;
        v40 = 2112;
        v41 = self;
        v42 = 2080;
        v43 = "-[FPDXPCServicer accumulatedSizeOfItemsInDomain:completion:]";
        v44 = 2112;
        v45 = 0;
        v46 = 2112;
        v47 = v27;
        _os_log_debug_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);

      }
      FPDomainUnavailableError();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v22);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34((uint64_t)v11, v19);

  }
}

void __60__FPDXPCServicer_accumulatedSizeOfItemsInDomain_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer accumulatedSizeOfItemsInDomain:completion:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@ %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)setAlternateContentsURL:(id)a3 onDocumentURL:(id)a4 completionHandler:(id)a5
{
  void *v5;
  id v9;
  id v10;
  void (**v11)(id, void *);
  BOOL v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  FPDXPCServicer *v39;
  id v40;
  void (**v41)(id, void *);
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  FPDXPCServicer *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, void *))a5;
  if (v9)
  {
    objc_msgSend(v9, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[FPDXPCServicer clientHasSandboxAccessToFile:](self, "clientHasSandboxAccessToFile:", v5))
    {
      v12 = -[FPDXPCServicer _isNonSandboxedConnection](self, "_isNonSandboxedConnection");

      if (!v12)
        goto LABEL_19;
      goto LABEL_14;
    }
  }
  if (-[FPDXPCServicer clientHasSandboxAccessToFile:](self, "clientHasSandboxAccessToFile:", v10))
  {
    -[FPDXPCServicer connection](self, "connection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = *MEMORY[0x1E0CAAE80];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "fp_hasOneOfEntitlements:", v14) & 1) != 0)
    {

      if (v9)
      goto LABEL_14;
    }
    v15 = -[FPDXPCServicer _isNonSandboxedConnection](self, "_isNonSandboxedConnection");

    if (!v9)
      goto LABEL_13;
    goto LABEL_12;
  }
  v15 = -[FPDXPCServicer _isNonSandboxedConnection](self, "_isNonSandboxedConnection");
  if (v9)
LABEL_12:

LABEL_13:
  if (!v15)
  {
LABEL_19:
    fp_current_or_default_log();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:].cold.4();

    fpfs_adopt_log();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      v33 = FPPopLogSectionForBlock();
      FPNotPermittedWriteError();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v44 = v33;
      v45 = 2112;
      v46 = self;
      v47 = 2080;
      v48 = "-[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]";
      v49 = 2112;
      v50 = v34;
      _os_log_debug_impl(&dword_1CF55F000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    FPNotPermittedWriteError();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v28);

    __fp_pop_log();
    goto LABEL_33;
  }
LABEL_14:
  -[FPDXPCServicer server](self, "server");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "extensionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "domainForURL:reason:", v10, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v18, "defaultBackend");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_opt_respondsToSelector();

    if ((v20 & 1) != 0)
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:].cold.3(v21, v22, v23);

      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "defaultBackend");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke;
      v37[3] = &unk_1E8C77FD8;
      v38 = v10;
      v39 = self;
      v41 = v11;
      v40 = v9;
      objc_msgSend(v25, "setAlternateContentsURLWrapper:forDocumentWithURL:request:completionHandler:", v40, v38, v24, v37);

    }
    else
    {
      fpfs_adopt_log();
      v42 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        v35 = FPPopLogSectionForBlock();
        FPNotSupportedError();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v44 = v35;
        v45 = 2112;
        v46 = self;
        v47 = 2080;
        v48 = "-[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]";
        v49 = 2112;
        v50 = v36;
        _os_log_debug_impl(&dword_1CF55F000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPNotSupportedError();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v11[2](v11, v32);

      __fp_pop_log();
    }
  }
  else
  {
    fp_current_or_default_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:].cold.2(v10, v29);

    fpfs_adopt_log();
    v42 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:].cold.1();
    }

    v11[2](v11, 0);
    __fp_pop_log();

  }
LABEL_33:

}

void __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke_cold_2();

    fpfs_adopt_log();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = FPPopLogSectionForBlock();
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2080;
      v23 = "-[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "url");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlternateContentsURL:forItemID:", v10, v5);

    fpfs_adopt_log();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    __fp_pop_log();

  }
}

- (void)fetchAlternateContentsURLForDocumentURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  FPDXPCServicer *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FPDXPCServicer connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fp_hasSandboxAccessToFile:accessType:logLevel:", v6, *MEMORY[0x1E0CAA658], 0))
  {
    -[FPDXPCServicer connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = *MEMORY[0x1E0CAAE80];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "fp_hasOneOfEntitlements:", v10))
    {

LABEL_5:
      -[FPDXPCServicer server](self, "server");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "extensionManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "domainForURL:reason:", v6, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "defaultBackend");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __76__FPDXPCServicer_fetchAlternateContentsURLForDocumentURL_completionHandler___block_invoke;
        v25[3] = &unk_1E8C75A20;
        v25[4] = self;
        v26 = v7;
        objc_msgSend(v15, "itemIDForURL:requireProviderItemID:request:completionHandler:", v6, 0, v16, v25);

      }
      else
      {
        fp_current_or_default_log();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          -[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:].cold.2(v6, v21);

        fpfs_adopt_log();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          FPPopLogSectionForBlock();
          -[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:].cold.1();
        }

        (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
        __fp_pop_log();

      }
      goto LABEL_19;
    }
    v17 = -[FPDXPCServicer _isNonSandboxedConnection](self, "_isNonSandboxedConnection");

    if (v17)
      goto LABEL_5;
  }
  else
  {
    v11 = -[FPDXPCServicer _isNonSandboxedConnection](self, "_isNonSandboxedConnection");

    if (v11)
      goto LABEL_5;
  }
  fp_current_or_default_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:].cold.3();

  fpfs_adopt_log();
  v27 = (id)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    v23 = FPPopLogSectionForBlock();
    FPNotPermittedError();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v29 = v23;
    v30 = 2112;
    v31 = self;
    v32 = 2080;
    v33 = "-[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:]";
    v34 = 2112;
    v35 = 0;
    v36 = 2112;
    v37 = v24;
    _os_log_debug_impl(&dword_1CF55F000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  FPNotPermittedError();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v20);

  __fp_pop_log();
LABEL_19:

}

void __76__FPDXPCServicer_fetchAlternateContentsURLForDocumentURL_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fpfs_adopt_log();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock();
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v19 = v12;
      v20 = 2112;
      v21 = v13;
      v22 = 2080;
      v23 = "-[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v6;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "server");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "alternateContentsURLForItemID:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    fpfs_adopt_log();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v14 = FPPopLogSectionForBlock();
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v19 = v14;
      v20 = 2112;
      v21 = v15;
      v22 = 2080;
      v23 = "-[FPDXPCServicer fetchAlternateContentsURLForDocumentURL:completionHandler:]_block_invoke";
      v24 = 2112;
      v25 = v10;
      v26 = 2112;
      v27 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    __fp_pop_log();

  }
}

- (void)didUpdateAlternateContentsDocumentForDocumentAtURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  FPDXPCServicer *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  FPDXPCServicer *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FPDXPCServicer connection](self, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "fp_hasSandboxAccessToFile:accessType:logLevel:", v6, *MEMORY[0x1E0CAA658], 0))
  {
    -[FPDXPCServicer connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = *MEMORY[0x1E0CAAE80];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "fp_hasOneOfEntitlements:", v10))
    {

LABEL_5:
      -[FPDXPCServicer server](self, "server");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "extensionManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "domainForURL:reason:", v6, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "providerDomainID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "defaultBackend");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __87__FPDXPCServicer_didUpdateAlternateContentsDocumentForDocumentAtURL_completionHandler___block_invoke;
        v29[3] = &unk_1E8C78000;
        v30 = v6;
        v31 = v16;
        v32 = self;
        v33 = v7;
        v18 = v16;
        objc_msgSend(v17, "didUpdateAlternateContentsDocumentForDocumentWithURL:request:completionHandler:", v30, v15, v29);

      }
      else
      {
        fpfs_adopt_log();
        v34 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          v27 = FPPopLogSectionForBlock();
          FPProviderNotFoundErrorForURL();
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v36 = v27;
          v37 = 2112;
          v38 = self;
          v39 = 2080;
          v40 = "-[FPDXPCServicer didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:]";
          v41 = 2112;
          v42 = v28;
          _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

        }
        FPProviderNotFoundErrorForURL();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v7 + 2))(v7, v24);

        __fp_pop_log();
      }

      goto LABEL_17;
    }
    v19 = -[FPDXPCServicer _isNonSandboxedConnection](self, "_isNonSandboxedConnection");

    if (v19)
      goto LABEL_5;
  }
  else
  {
    v11 = -[FPDXPCServicer _isNonSandboxedConnection](self, "_isNonSandboxedConnection");

    if (v11)
      goto LABEL_5;
  }
  fp_current_or_default_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[FPDXPCServicer didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:].cold.1();

  fpfs_adopt_log();
  v34 = (id)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v25 = FPPopLogSectionForBlock();
    FPNotPermittedError();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218754;
    v36 = v25;
    v37 = 2112;
    v38 = self;
    v39 = 2080;
    v40 = "-[FPDXPCServicer didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:]";
    v41 = 2112;
    v42 = v26;
    _os_log_debug_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

  }
  FPNotPermittedError();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))v7 + 2))(v7, v22);

  __fp_pop_log();
LABEL_17:

}

void __87__FPDXPCServicer_didUpdateAlternateContentsDocumentForDocumentAtURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87__FPDXPCServicer_didUpdateAlternateContentsDocumentForDocumentAtURL_completionHandler___block_invoke_cold_1(a1, v3, v4);

  }
  fpfs_adopt_log();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = FPPopLogSectionForBlock();
    v7 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134218754;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v13 = 2080;
    v14 = "-[FPDXPCServicer didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  __fp_pop_log();

}

- (void)appHasNonUploadedFiles:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  _QWORD v23[2];
  void (*v24)(uint64_t, void *);
  void *v25;
  FPDXPCServicer *v26;
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v28[0] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v24 = __59__FPDXPCServicer_appHasNonUploadedFiles_completionHandler___block_invoke;
  v25 = &unk_1E8C75530;
  v26 = self;
  v10 = v7;
  v27 = v10;
  v11 = v8;
  v12 = v23;
  -[FPDXPCServicer connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if ((v14 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extensionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "domainsForAppBundleIdentifier:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v17, "count"))
    {
      v20[0] = v9;
      v20[1] = 3221225472;
      v20[2] = __59__FPDXPCServicer_appHasNonUploadedFiles_completionHandler___block_invoke_240;
      v20[3] = &unk_1E8C78028;
      v20[4] = self;
      v21 = v10;
      hasNonUploadedFiles(v17, v20);

    }
    else
    {
      fpfs_adopt_log();
      v22 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock();
        -[FPDXPCServicer appHasNonUploadedFiles:completionHandler:].cold.1();
      }

      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
      __fp_pop_log();

    }
  }
  else
  {
    FPNotPermittedError();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24((uint64_t)v12, v18);

  }
}

void __59__FPDXPCServicer_appHasNonUploadedFiles_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = FPPopLogSectionForBlock();
    v8 = *(_QWORD *)(a1 + 32);
    FPNotPermittedError();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2080;
    v16 = "-[FPDXPCServicer appHasNonUploadedFiles:completionHandler:]_block_invoke";
    v17 = 1024;
    v18 = 0;
    v19 = 2112;
    v20 = v9;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);

  }
  v5 = *(_QWORD *)(a1 + 40);
  FPNotPermittedError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  __fp_pop_log();
}

void __59__FPDXPCServicer_appHasNonUploadedFiles_completionHandler___block_invoke_240(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  fpfs_adopt_log();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = FPPopLogSectionForBlock();
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2080;
    v15 = "-[FPDXPCServicer appHasNonUploadedFiles:completionHandler:]_block_invoke";
    v16 = 1024;
    v17 = a2;
    v18 = 2112;
    v19 = v5;
    _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", buf, 0x30u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)dumpProviders:(id)a3 dumper:(id)a4 auditToken:(id *)a5 request:(id)a6 limitNumberOfItems:(BOOL)a7 providerFilter:(id)a8 completionHandler:(id)a9
{
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  _OWORD v23[2];
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  BOOL v32;

  v10 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectAtIndex:", 0);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __110__FPDXPCServicer_dumpProviders_dumper_auditToken_request_limitNumberOfItems_providerFilter_completionHandler___block_invoke;
    v24[3] = &unk_1E8C78050;
    v24[4] = self;
    v25 = v15;
    v26 = v16;
    v20 = *(_OWORD *)&a5->var0[4];
    v30 = *(_OWORD *)a5->var0;
    v31 = v20;
    v27 = v17;
    v32 = v10;
    v28 = v18;
    v29 = v19;
    v21 = *(_OWORD *)&a5->var0[4];
    v23[0] = *(_OWORD *)a5->var0;
    v23[1] = v21;
    objc_msgSend(v22, "dumpStateTo:auditToken:request:providerFilter:limitNumberOfItems:completionHandler:", v26, v23, v27, v28, v10, v24);

  }
  else
  {
    (*((void (**)(id, _QWORD))v19 + 2))(v19, 0);
  }

}

uint64_t __110__FPDXPCServicer_dumpProviders_dumper_auditToken_request_limitNumberOfItems_providerFilter_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  _OWORD v10[2];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(unsigned __int8 *)(a1 + 112);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 96);
  v10[0] = *(_OWORD *)(a1 + 80);
  v10[1] = v8;
  return objc_msgSend(v2, "dumpProviders:dumper:auditToken:request:limitNumberOfItems:providerFilter:completionHandler:", v1, v3, v10, v4, v5, v6, v7);
}

- (void)dumpStateTo:(id)a3 limitNumberOfItems:(BOOL)a4 providerFilter:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id WeakRetained;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  unsigned int v31;
  void *v32;
  char isKindOfClass;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  BOOL v39;
  uint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  _BOOL4 v56;
  id v57;
  _OWORD v58[2];
  _QWORD v59[4];
  id v60;
  FPDXPCServicer *v61;
  id v62;
  id v63;
  id v64;
  uint64_t v65;
  _QWORD v66[2];
  void (*v67)(uint64_t, void *);
  void *v68;
  FPDXPCServicer *v69;
  id v70;
  uint8_t buf[32];
  __int16 v72;
  void *v73;
  _QWORD v74[4];

  v56 = a4;
  v74[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v57 = a5;
  v10 = a6;
  v74[0] = *MEMORY[0x1E0CAAE90];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v67 = __82__FPDXPCServicer_dumpStateTo_limitNumberOfItems_providerFilter_completionHandler___block_invoke;
  v68 = &unk_1E8C75530;
  v69 = self;
  v12 = v10;
  v70 = v12;
  v13 = v11;
  v14 = v66;
  -[FPDXPCServicer connection](self, "connection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "fp_hasOneOfEntitlements:", v13);

  if ((v16 & 1) != 0)
  {

    if (v9)
    {
      -[FPDXPCServicer connection](self, "connection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForXPCConnection:](FPDRequest, "requestForXPCConnection:", v17);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC08]), "initWithFd:forceColor:", objc_msgSend(v9, "fileDescriptor"), 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "description");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = objc_msgSend(v20, "UTF8String");
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceReferenceDate");
      objc_msgSend(v18, "write:", CFSTR("Date/Time:         %s, (%f)\n"), v21, v23);

      FPOSVersion();
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "write:", CFSTR("OS Version:        %s\n"), objc_msgSend(v24, "UTF8String"));

      FPVersion();
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v18, "write:", CFSTR("FP Version:        %s\n"), objc_msgSend(v25, "UTF8String"));

      objc_msgSend(v18, "write:", CFSTR("uid:               %u\n"), geteuid());
      objc_msgSend(v18, "write:", CFSTR("\n\n"));
      WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      objc_msgSend(WeakRetained, "extensionManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "allProviders");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)objc_msgSend(v28, "mutableCopy");

      if (objc_msgSend(v29, "count"))
      {
        v30 = 0;
        v31 = 1;
        while (1)
        {
          objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
            break;
          v30 = v31++;
          if (objc_msgSend(v29, "count") <= v30)
            goto LABEL_15;
        }
        objc_msgSend(v29, "objectAtIndexedSubscript:", v30);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "removeObjectAtIndex:", v30);
        objc_msgSend(v29, "insertObject:atIndex:", v38, 0);

      }
LABEL_15:
      v39 = objc_msgSend(v57, "length") == 0;
      v40 = objc_msgSend(v29, "count");
      if (v39)
        objc_msgSend(v18, "write:", CFSTR("%ld providers\n"), v40);
      else
        objc_msgSend(v18, "write:", CFSTR("%ld providers, filtered by '%@'\n"), v40, v57);
      objc_msgSend(MEMORY[0x1E0C99E98], "fp_homeDirectory");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0;
      FPGetImportCookieForURL();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = (unint64_t)0;

      objc_msgSend(v42, "entries");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = (objc_msgSend(v44, "count") | v43) != 0;

      if (v45)
      {
        objc_msgSend(v42, "description");
        v46 = objc_claimAutoreleasedReturnValue();
        v47 = (void *)v46;
        if (v46)
        {
          objc_msgSend(v18, "write:", CFSTR("Import Cookie: %@\n"), v46);
        }
        else
        {
          objc_msgSend((id)v43, "localizedDescription");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "write:", CFSTR("Import Cookie: %@\n"), v48);

        }
      }
      memset(buf, 0, sizeof(buf));
      -[FPDXPCServicer connection](self, "connection");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v49;
      if (v49)
        objc_msgSend(v49, "auditToken");
      else
        memset(buf, 0, sizeof(buf));

      v51 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v51, "addObjectsFromArray:", v29);
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __82__FPDXPCServicer_dumpStateTo_limitNumberOfItems_providerFilter_completionHandler___block_invoke_263;
      v59[3] = &unk_1E8C76CD0;
      v60 = v9;
      v61 = self;
      v62 = v18;
      v63 = v57;
      v64 = v12;
      v58[0] = *(_OWORD *)buf;
      v58[1] = *(_OWORD *)&buf[16];
      v52 = v18;
      -[FPDXPCServicer dumpProviders:dumper:auditToken:request:limitNumberOfItems:providerFilter:completionHandler:](self, "dumpProviders:dumper:auditToken:request:limitNumberOfItems:providerFilter:completionHandler:", v51, v52, v58, v55, v56, v63, v59);

    }
    else
    {
      fp_current_or_default_log();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[FPDXPCServicer dumpStateTo:limitNumberOfItems:providerFilter:completionHandler:].cold.1();

      fpfs_adopt_log();
      *(_QWORD *)&v58[0] = objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v53 = FPPopLogSectionForBlock();
        FPInvalidParameterError();
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = "-[FPDXPCServicer dumpStateTo:limitNumberOfItems:providerFilter:completionHandler:]";
        v72 = 2112;
        v73 = v54;
        _os_log_debug_impl(&dword_1CF55F000, v36, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPInvalidParameterError();
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v12 + 2))(v12, v37);

      __fp_pop_log();
    }
  }
  else
  {
    FPNotPermittedError();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v67((uint64_t)v14, v34);

  }
}

void __82__FPDXPCServicer_dumpStateTo_limitNumberOfItems_providerFilter_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer dumpStateTo:limitNumberOfItems:providerFilter:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __82__FPDXPCServicer_dumpStateTo_limitNumberOfItems_providerFilter_completionHandler___block_invoke_263(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(WeakRetained, "operationEngine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dumpStateTo:", *(_QWORD *)(a1 + 48));

  v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
  objc_msgSend(v6, "appMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dumpStateTo:", *(_QWORD *)(a1 + 48));

  if (!objc_msgSend(*(id *)(a1 + 56), "length"))
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 32));
    objc_msgSend(v8, "volumeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__FPDXPCServicer_dumpStateTo_limitNumberOfItems_providerFilter_completionHandler___block_invoke_2;
    v14[3] = &unk_1E8C75330;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v9, "enumerateLibrariesWithBlock:", v14);

  }
  fpfs_adopt_log();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = FPPopLogSectionForBlock();
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    v17 = v11;
    v18 = 2112;
    v19 = v12;
    v20 = 2080;
    v21 = "-[FPDXPCServicer dumpStateTo:limitNumberOfItems:providerFilter:completionHandler:]_block_invoke";
    v22 = 2112;
    v23 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  __fp_pop_log();

}

uint64_t __82__FPDXPCServicer_dumpStateTo_limitNumberOfItems_providerFilter_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "isLibraryConfigured"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "root");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fp_prettyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "write:", CFSTR("== Volume: %@ ==\n"), v6);

    +[FPDProvider dumpXattrsForSyncRootDirectoryOfVolume:dumper:](FPDProvider, "dumpXattrsForSyncRootDirectoryOfVolume:dumper:", v3, *(_QWORD *)(a1 + 32));
    +[FPDProvider dumpXattrsForSystemDirectoryOfVolume:dumper:](FPDProvider, "dumpXattrsForSystemDirectoryOfVolume:dumper:", v3, *(_QWORD *)(a1 + 32));
  }

  return 1;
}

- (void)getPersonaForProvider:(id)a3 completionHandler:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  FPDXPCServicer *v23;
  void (**v24)(id, void *, _QWORD);
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  FPDXPCServicer *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = self;
  v24 = (void (**)(id, void *, _QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_server);
  objc_msgSend(WeakRetained, "extensionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allProviders");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v9;
  v11 = 0;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", v6);

        if (v18)
        {
          objc_msgSend(v15, "descriptor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "personaIdentifier");
          v20 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v20;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
    }
    while (v12);
  }

  fpfs_adopt_log();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v22 = FPPopLogSectionForBlock();
    *(_DWORD *)buf = 134219010;
    v31 = v22;
    v32 = 2112;
    v33 = v23;
    v34 = 2080;
    v35 = "-[FPDXPCServicer getPersonaForProvider:completionHandler:]";
    v36 = 2112;
    v37 = v11;
    v38 = 2112;
    v39 = 0;
    _os_log_debug_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  v24[2](v24, v11, 0);
  __fp_pop_log();

}

- (void)createDatabaseCopyOutputPathForDomain:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isUsingFPFS") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0C99E98], "fp_secureTempDirectory");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "providerDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v29 = 0;
    LOBYTE(v9) = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v29);
    v14 = v29;
    if ((v9 & 1) != 0)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timeIntervalSince1970");
      objc_msgSend(v15, "stringWithFormat:", CFSTR("database-%f"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("."), CFSTR("-"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "stringByAppendingString:", CFSTR(".db"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "URLByAppendingPathComponent:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer createDatabaseCopyOutputPathForDomain:completionHandler:].cold.1();

      objc_msgSend(v5, "defaultBackend");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke;
      v25[3] = &unk_1E8C75788;
      v26 = v5;
      v28 = v6;
      v13 = v21;
      v27 = v13;
      objc_msgSend(v23, "copyDatabaseToURL:completionHandler:", v13, v25);

    }
    else
    {
      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[FPDXPCServicer createDatabaseCopyOutputPathForDomain:completionHandler:].cold.2();

      (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v14);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }

}

void __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke_cold_2();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke_cold_1(a1);

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v6 + 16))(v6, v7, 0);

  }
}

- (void)copyDatabaseForFPCKStartingAtPath:(id)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  NSObject *v34;
  NSObject *queue;
  id v36;
  id v37;
  NSObject *obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD block[5];
  id v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD v48[4];
  NSObject *v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD v61[4];
  NSObject *v62;
  NSObject *v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD v66[5];
  id v67;
  _QWORD v68[5];
  id v69;
  _QWORD v70[2];
  void (*v71)(uint64_t, void *);
  void *v72;
  FPDXPCServicer *v73;
  id v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _QWORD v77[4];

  v77[2] = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v5 = a4;
  v6 = *MEMORY[0x1E0CAAEA0];
  v77[0] = *MEMORY[0x1E0CAAE90];
  v77[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v77, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v71 = __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke;
  v72 = &unk_1E8C75530;
  v73 = self;
  v36 = v5;
  v74 = v36;
  v8 = v7;
  v9 = v70;
  -[FPDXPCServicer connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fp_hasOneOfEntitlements:", v8);

  if ((v11 & 1) != 0)
  {

    v12 = dispatch_group_create();
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x3032000000;
    v68[3] = __Block_byref_object_copy__11;
    v68[4] = __Block_byref_object_dispose__11;
    v69 = 0;
    v69 = (id)objc_opt_new();
    v66[0] = 0;
    v66[1] = v66;
    v66[2] = 0x3032000000;
    v66[3] = __Block_byref_object_copy__11;
    v66[4] = __Block_byref_object_dispose__11;
    v67 = 0;
    if (v37)
    {
      -[FPDXPCServicer server](self, "server", v36);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "extensionManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v37);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "domainForURL:reason:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      dispatch_group_enter(v12);
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_276;
      v61[3] = &unk_1E8C78078;
      v62 = v12;
      v64 = v66;
      v65 = v68;
      v17 = v16;
      v63 = v17;
      -[FPDXPCServicer createDatabaseCopyOutputPathForDomain:completionHandler:](self, "createDatabaseCopyOutputPathForDomain:completionHandler:", v17, v61);

      v18 = v62;
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_server);
      objc_msgSend(WeakRetained, "extensionManager", v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "allProviders");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(v22, "mutableCopy");

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v18 = v23;
      v24 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
      if (v24)
      {
        obj = v18;
        v39 = *(_QWORD *)v58;
        do
        {
          v25 = 0;
          v40 = v24;
          do
          {
            if (*(_QWORD *)v58 != v39)
              objc_enumerationMutation(obj);
            v26 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * v25);
            objc_sync_enter(v26);
            objc_msgSend(v26, "domainsByID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "allValues");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)objc_msgSend(v28, "copy");
            v41 = v25;

            objc_sync_exit(v26);
            v55 = 0u;
            v56 = 0u;
            v53 = 0u;
            v54 = 0u;
            v29 = v42;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v54;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v54 != v31)
                    objc_enumerationMutation(v29);
                  v33 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
                  dispatch_group_enter(v12);
                  v48[0] = MEMORY[0x1E0C809B0];
                  v48[1] = 3221225472;
                  v48[2] = __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_2;
                  v48[3] = &unk_1E8C78078;
                  v34 = v12;
                  v51 = v66;
                  v52 = v68;
                  v49 = v34;
                  v50 = v33;
                  -[FPDXPCServicer createDatabaseCopyOutputPathForDomain:completionHandler:](self, "createDatabaseCopyOutputPathForDomain:completionHandler:", v33, v48);

                }
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v53, v75, 16);
              }
              while (v30);
            }

            v25 = v41 + 1;
          }
          while (v41 + 1 != v40);
          v24 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v57, v76, 16);
        }
        while (v24);
        v18 = obj;
      }
      v17 = v18;
    }

    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_3;
    block[3] = &unk_1E8C780A0;
    v46 = v66;
    block[4] = self;
    v45 = v36;
    v47 = v68;
    dispatch_group_notify(v12, queue, block);

    _Block_object_dispose(v66, 8);
    _Block_object_dispose(v68, 8);

  }
  else
  {
    FPNotPermittedError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v71((uint64_t)v9, v19);

  }
}

void __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer copyDatabaseForFPCKStartingAtPath:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_276(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v5;
    v9 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
LABEL_5:

    goto LABEL_6;
  }
  if (v13)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "rootURLs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v13, v12);

    goto LABEL_5;
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_sync_exit(v6);

}

void __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  v6 = *(id *)(a1 + 32);
  objc_sync_enter(v6);
  if (v5)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v5;
    v9 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
LABEL_5:

    goto LABEL_6;
  }
  if (v13)
  {
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "rootURLs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKeyPath:", v13, v12);

    goto LABEL_5;
  }
LABEL_6:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  objc_sync_exit(v6);

}

void __70__FPDXPCServicer_copyDatabaseForFPCKStartingAtPath_completionHandler___block_invoke_3(_QWORD *a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    fpfs_adopt_log();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock();
      v11 = a1[4];
      v12 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
      *(_DWORD *)buf = 134219010;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      v26 = 2080;
      v27 = "-[FPDXPCServicer copyDatabaseForFPCKStartingAtPath:completionHandler:]_block_invoke_3";
      v28 = 2112;
      v29 = 0;
      v30 = 2112;
      v31 = v12;
      _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*(void (**)(void))(a1[5] + 16))();
    __fp_pop_log();

  }
  else if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
  {
    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      v13 = FPPopLogSectionForBlock();
      v14 = a1[4];
      v15 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "copy");
      *(_DWORD *)buf = 134219010;
      v23 = v13;
      v24 = 2112;
      v25 = v14;
      v26 = 2080;
      v27 = "-[FPDXPCServicer copyDatabaseForFPCKStartingAtPath:completionHandler:]_block_invoke";
      v28 = 2112;
      v29 = v15;
      v30 = 2112;
      v31 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    v4 = a1[5];
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "copy");
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v16 = FPPopLogSectionForBlock();
      v17 = a1[4];
      v7 = *MEMORY[0x1E0CAAB88];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAAB88], 21, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219010;
      v23 = v16;
      v24 = 2112;
      v25 = v17;
      v26 = 2080;
      v27 = "-[FPDXPCServicer copyDatabaseForFPCKStartingAtPath:completionHandler:]_block_invoke";
      v28 = 2112;
      v29 = 0;
      v30 = 2112;
      v31 = v18;
      _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

    }
    else
    {
      v7 = *MEMORY[0x1E0CAAB88];
    }

    v8 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v7, 21, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v9);

    __fp_pop_log();
  }
}

- (void)waitForChangesOnItemsBelowItemWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t v41;
  _QWORD v42[2];
  void (*v43)(uint64_t, void *);
  void *v44;
  FPDXPCServicer *v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  FPDXPCServicer *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  void *v54;
  _QWORD v55[5];

  v55[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAEF8];
  v55[0] = *MEMORY[0x1E0CAAE90];
  v55[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v43 = __73__FPDXPCServicer_waitForChangesOnItemsBelowItemWithID_completionHandler___block_invoke;
  v44 = &unk_1E8C75530;
  v45 = self;
  v11 = v7;
  v46 = v11;
  v12 = v9;
  v13 = v42;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    v41 = 0;
    -[FPDXPCServicer server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "providerDomainID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v18, &v41);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "defaultBackend");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_respondsToSelector();

      if ((v21 & 1) != 0)
      {
        objc_msgSend(v19, "defaultBackend");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "identifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v10;
        v38[1] = 3221225472;
        v38[2] = __73__FPDXPCServicer_waitForChangesOnItemsBelowItemWithID_completionHandler___block_invoke_279;
        v38[3] = &unk_1E8C75530;
        v38[4] = self;
        v39 = v11;
        objc_msgSend(v22, "waitForChangesOnItemsBelowItemWithIdentifier:request:completionHandler:", v23, v24, v38);

      }
      else
      {
        fpfs_adopt_log();
        v40 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          v36 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218754;
          v48 = v36;
          v49 = 2112;
          v50 = self;
          v51 = 2080;
          v52 = "-[FPDXPCServicer waitForChangesOnItemsBelowItemWithID:completionHandler:]";
          v53 = 2112;
          v54 = v37;
          _os_log_debug_impl(&dword_1CF55F000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

        }
        FPNotSupportedError();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, void *))v11 + 2))(v11, v31);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v40 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v32 = FPPopLogSectionForBlock();
        objc_msgSend(v6, "providerDomainID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "fp_toProviderID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v48 = v32;
        v49 = 2112;
        v50 = self;
        v51 = 2080;
        v52 = "-[FPDXPCServicer waitForChangesOnItemsBelowItemWithID:completionHandler:]";
        v53 = 2112;
        v54 = v35;
        _os_log_debug_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      objc_msgSend(v6, "providerDomainID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fp_toProviderID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v11 + 2))(v11, v29);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43((uint64_t)v13, v25);

  }
}

void __73__FPDXPCServicer_waitForChangesOnItemsBelowItemWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer waitForChangesOnItemsBelowItemWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __73__FPDXPCServicer_waitForChangesOnItemsBelowItemWithID_completionHandler___block_invoke_279(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer waitForChangesOnItemsBelowItemWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)waitForStabilizationOfDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, void *);
  void *v34;
  FPDXPCServicer *v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  FPDXPCServicer *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  void *v44;
  _QWORD v45[3];

  v45[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAEF8];
  v45[0] = *MEMORY[0x1E0CAAE90];
  v45[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = __71__FPDXPCServicer_waitForStabilizationOfDomainWithID_completionHandler___block_invoke;
  v34 = &unk_1E8C75530;
  v35 = self;
  v11 = v7;
  v36 = v11;
  v12 = v9;
  v13 = v32;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    v31 = 0;
    -[FPDXPCServicer server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v6, &v31);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v10;
      v28[1] = 3221225472;
      v28[2] = __71__FPDXPCServicer_waitForStabilizationOfDomainWithID_completionHandler___block_invoke_280;
      v28[3] = &unk_1E8C75530;
      v28[4] = self;
      v29 = v11;
      objc_msgSend(v19, "waitForStabilizationForRequest:completionHandler:", v20, v28);

    }
    else
    {
      fpfs_adopt_log();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v25 = FPPopLogSectionForBlock();
        objc_msgSend(v6, "fp_toProviderID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v38 = v25;
        v39 = 2112;
        v40 = self;
        v41 = 2080;
        v42 = "-[FPDXPCServicer waitForStabilizationOfDomainWithID:completionHandler:]";
        v43 = 2112;
        v44 = v27;
        _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      objc_msgSend(v6, "fp_toProviderID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v11 + 2))(v11, v24);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33((uint64_t)v13, v21);

  }
}

void __71__FPDXPCServicer_waitForStabilizationOfDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer waitForStabilizationOfDomainWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __71__FPDXPCServicer_waitForStabilizationOfDomainWithID_completionHandler___block_invoke_280(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer waitForStabilizationOfDomainWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)spotlightReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  char v18;
  id WeakRetained;
  void *v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[2];
  void (*v26)(uint64_t, void *);
  void *v27;
  FPDXPCServicer *v28;
  id v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = *MEMORY[0x1E0CAAEF8];
  v30[0] = *MEMORY[0x1E0CAAE90];
  v30[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v26 = __88__FPDXPCServicer_spotlightReindexAllItemsForBundleID_protectionClass_completionHandler___block_invoke;
  v27 = &unk_1E8C75530;
  v28 = self;
  v14 = v10;
  v29 = v14;
  v15 = v12;
  v16 = v25;
  -[FPDXPCServicer connection](self, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "fp_hasOneOfEntitlements:", v15);

  if ((v18 & 1) != 0)
  {

    WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    objc_msgSend(WeakRetained, "spotlightDaemonClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v13;
    v23[1] = 3221225472;
    v23[2] = __88__FPDXPCServicer_spotlightReindexAllItemsForBundleID_protectionClass_completionHandler___block_invoke_281;
    v23[3] = &unk_1E8C77448;
    v24 = v14;
    objc_msgSend(v20, "reindexAllItemsForBundleID:protectionClass:acknowledgementHandler:", v8, v9, v23);

    v21 = v24;
  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26((uint64_t)v16, v22);

    v21 = v29;
  }

}

void __88__FPDXPCServicer_spotlightReindexAllItemsForBundleID_protectionClass_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer spotlightReindexAllItemsForBundleID:protectionClass:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

uint64_t __88__FPDXPCServicer_spotlightReindexAllItemsForBundleID_protectionClass_completionHandler___block_invoke_281(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)spotlightReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD *v19;
  void *v20;
  char v21;
  id WeakRetained;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[2];
  void (*v29)(uint64_t, void *);
  void *v30;
  FPDXPCServicer *v31;
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = *MEMORY[0x1E0CAAEF8];
  v33[0] = *MEMORY[0x1E0CAAE90];
  v33[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v29 = __98__FPDXPCServicer_spotlightReindexItemsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke;
  v30 = &unk_1E8C75530;
  v31 = self;
  v17 = v13;
  v32 = v17;
  v18 = v15;
  v19 = v28;
  -[FPDXPCServicer connection](self, "connection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "fp_hasOneOfEntitlements:", v18);

  if ((v21 & 1) != 0)
  {

    WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    objc_msgSend(WeakRetained, "spotlightDaemonClient");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v16;
    v26[1] = 3221225472;
    v26[2] = __98__FPDXPCServicer_spotlightReindexItemsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_282;
    v26[3] = &unk_1E8C77448;
    v27 = v17;
    objc_msgSend(v23, "reindexItemsWithIdentifiers:bundleID:protectionClass:acknowledgementHandler:", v10, v11, v12, v26);

    v24 = v27;
  }
  else
  {
    FPNotPermittedError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29((uint64_t)v19, v25);

    v24 = v32;
  }

}

void __98__FPDXPCServicer_spotlightReindexItemsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer spotlightReindexItemsWithIdentifiers:bundleID:protectionClass:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

uint64_t __98__FPDXPCServicer_spotlightReindexItemsWithIdentifiers_bundleID_protectionClass_completionHandler___block_invoke_282(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)scheduleActionOperationWithInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *WeakRetained;
  FPDXPCServicer *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[2];
  void (*v25)(uint64_t, void *);
  void *v26;
  FPDXPCServicer *v27;
  id v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v25 = __68__FPDXPCServicer_scheduleActionOperationWithInfo_completionHandler___block_invoke;
  v26 = &unk_1E8C75530;
  v27 = self;
  v9 = v7;
  v28 = v9;
  WeakRetained = v24;
  v11 = self;
  -[FPDXPCServicer connection](v11, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0CAAE78];
  v29[0] = *MEMORY[0x1E0CAAE70];
  v29[1] = v13;
  v29[2] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v14);
  if ((v15 & 1) != 0)
  {

    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer scheduleActionOperationWithInfo:completionHandler:].cold.1();

    WeakRetained = objc_loadWeakRetained((id *)&v11->_server);
    objc_msgSend(WeakRetained, "operationEngine");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[FPDRequest requestForXPCConnection:](FPDRequest, "requestForXPCConnection:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __68__FPDXPCServicer_scheduleActionOperationWithInfo_completionHandler___block_invoke_283;
    v22[3] = &unk_1E8C780C8;
    v22[4] = v11;
    v20 = &v23;
    v23 = v9;
    objc_msgSend(v17, "scheduleActionOperationWithInfo:request:completionHandler:", v6, v19, v22);

  }
  else
  {
    v20 = &v28;
    FPNotPermittedError();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25((uint64_t)WeakRetained, v21);

  }
}

void __68__FPDXPCServicer_scheduleActionOperationWithInfo_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer scheduleActionOperationWithInfo:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __68__FPDXPCServicer_scheduleActionOperationWithInfo_completionHandler___block_invoke_283(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer scheduleActionOperationWithInfo:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __63__FPDXPCServicer_fetchDaemonOperationIDsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer fetchDaemonOperationIDsWithCompletionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

id __63__FPDXPCServicer_fetchDaemonOperationIDsWithCompletionHandler___block_invoke_285(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "info");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operationID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)fetchDaemonOperationWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  FPDXPCServicer *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  char v13;
  NSObject *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, void *);
  void *v38;
  FPDXPCServicer *v39;
  id v40;
  _BYTE buf[24];
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v37 = __63__FPDXPCServicer_fetchDaemonOperationWithID_completionHandler___block_invoke;
  v38 = &unk_1E8C75530;
  v39 = self;
  v30 = v7;
  v40 = v30;
  v8 = v36;
  v9 = self;
  -[FPDXPCServicer connection](v9, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0CAAE78];
  *(_QWORD *)buf = *MEMORY[0x1E0CAAE70];
  *(_QWORD *)&buf[8] = v11;
  *(_QWORD *)&buf[16] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v10, "fp_hasOneOfEntitlements:", v12);
  if ((v13 & 1) != 0)
  {

    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer fetchDaemonOperationWithID:completionHandler:].cold.1();

    WeakRetained = objc_loadWeakRetained((id *)&v9->_server);
    objc_msgSend(WeakRetained, "operationEngine");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "inFlightOperations");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v18 = v17;
    v19 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v33 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v22, "info", v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "operationID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", v6);

          if (v25)
          {
            v19 = v22;
            objc_msgSend(v19, "info");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          }
        }
        v19 = (id)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
        if (v19)
          continue;
        break;
      }
    }
    v26 = 0;
LABEL_15:

    fpfs_adopt_log();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = FPPopLogSectionForBlock();
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v29;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2080;
      v42 = "-[FPDXPCServicer fetchDaemonOperationWithID:completionHandler:]";
      v43 = 2112;
      v44 = v19;
      v45 = 2112;
      v46 = v26;
      _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, id, void *, _QWORD))v30 + 2))(v30, v19, v26, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37((uint64_t)v8, v27);

  }
}

void __63__FPDXPCServicer_fetchDaemonOperationWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer fetchDaemonOperationWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = 0;
    v18 = 2112;
    v19 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)startAccessingExtensionForProviderDomainID:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  FPDXPCServicer *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v28 = 0;
    -[FPDXPCServicer createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:](self, "createDomainServicerForProviderDomainID:provider:enumerateEntitlementRequired:error:", v6, 0, 1, &v28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v28;
    if (v8)
    {
      v29 = 0;
      objc_msgSend(v8, "domainOrNil:", &v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "defaultBackend");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __69__FPDXPCServicer_startAccessingExtensionForProviderDomainID_handler___block_invoke;
        v24[3] = &unk_1E8C78130;
        v24[4] = self;
        v26 = v7;
        v25 = v8;
        objc_msgSend(v12, "fetchVendorEndpointWithRequest:completionHandler:", v13, v24);

      }
      else
      {
        fpfs_adopt_log();
        v27 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v22 = FPPopLogSectionForBlock();
          FPProviderNotFoundError();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219522;
          v31 = v22;
          v32 = 2112;
          v33 = self;
          v34 = 2080;
          v35 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]";
          v36 = 2112;
          v37 = 0;
          v38 = 2112;
          v39 = 0;
          v40 = 2112;
          v41 = 0;
          v42 = 2112;
          v43 = v23;
          _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);

        }
        FPProviderNotFoundError();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v18);

        __fp_pop_log();
      }

    }
    else
    {
      fpfs_adopt_log();
      v29 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v21 = FPPopLogSectionForBlock();
        *(_DWORD *)buf = 134219522;
        v31 = v21;
        v32 = 2112;
        v33 = self;
        v34 = 2080;
        v35 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]";
        v36 = 2112;
        v37 = 0;
        v38 = 2112;
        v39 = 0;
        v40 = 2112;
        v41 = 0;
        v42 = 2112;
        v43 = v9;
        _os_log_debug_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
      }

      (*((void (**)(id, _QWORD, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, 0, v9);
      __fp_pop_log();

    }
  }
  else
  {
    fpfs_adopt_log();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v19 = FPPopLogSectionForBlock();
      FPInvalidParameterError();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v31 = v19;
      v32 = 2112;
      v33 = self;
      v34 = 2080;
      v35 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]";
      v36 = 2112;
      v37 = 0;
      v38 = 2112;
      v39 = 0;
      v40 = 2112;
      v41 = 0;
      v42 = 2112;
      v43 = v20;
      _os_log_debug_impl(&dword_1CF55F000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);

    }
    FPInvalidParameterError();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *))v7 + 2))(v7, 0, 0, 0, v15);

    __fp_pop_log();
  }

}

void __69__FPDXPCServicer_startAccessingExtensionForProviderDomainID_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "startExtendingLifetime");
    fpfs_adopt_log();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v12 = FPPopLogSectionForBlock();
      v14 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(a1 + 40);
      objc_msgSend(v13, "providerDomainID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219522;
      v21 = v12;
      v22 = 2112;
      v23 = v14;
      v24 = 2080;
      v25 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]_block_invoke";
      v26 = 2112;
      v27 = v5;
      v28 = 2112;
      v29 = v13;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v6;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);

    }
    v8 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v8, "providerDomainID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, void *, void *, id))(v9 + 16))(v9, v5, v8, v10, v6);

    __fp_pop_log();
  }
  else
  {
    fpfs_adopt_log();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v16 = FPPopLogSectionForBlock();
      v17 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219522;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      v24 = 2080;
      v25 = "-[FPDXPCServicer startAccessingExtensionForProviderDomainID:handler:]_block_invoke";
      v26 = 2112;
      v27 = 0;
      v28 = 2112;
      v29 = 0;
      v30 = 2112;
      v31 = 0;
      v32 = 2112;
      v33 = v6;
      _os_log_debug_impl(&dword_1CF55F000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@", buf, 0x48u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    __fp_pop_log();

  }
}

- (void)startAccessingServiceForItemID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__FPDXPCServicer_startAccessingServiceForItemID_completionHandler___block_invoke;
  v10[3] = &unk_1E8C78180;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[FPDXPCServicer startAccessingServiceWithName:itemID:domain:connection:enumerateEntitlementRequired:completionHandler:](self, "startAccessingServiceWithName:itemID:domain:connection:enumerateEntitlementRequired:completionHandler:", 0, v7, 0, v8, 1, v10);

}

void __67__FPDXPCServicer_startAccessingServiceForItemID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  fpfs_adopt_log();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = FPPopLogSectionForBlock();
    v18 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219778;
    v21 = v17;
    v22 = 2112;
    v23 = v18;
    v24 = 2080;
    v25 = "-[FPDXPCServicer startAccessingServiceForItemID:completionHandler:]_block_invoke";
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v12;
    v30 = 2112;
    v31 = v13;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    _os_log_debug_impl(&dword_1CF55F000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)startAccessingServiceWithName:(id)a3 itemURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  FPDXPCServicer *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[5];
  id v56;
  id v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  id v64;
  uint64_t v65;
  _QWORD v66[2];
  void (*v67)(uint64_t, void *);
  void *v68;
  FPDXPCServicer *v69;
  id v70;
  _BYTE v71[128];
  _BYTE buf[12];
  __int16 v73;
  FPDXPCServicer *v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  uint64_t v84;
  __int16 v85;
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v67 = __74__FPDXPCServicer_startAccessingServiceWithName_itemURL_completionHandler___block_invoke;
  v68 = &unk_1E8C75530;
  v69 = self;
  v12 = v10;
  v70 = v12;
  v13 = self;
  v14 = v9;
  v15 = v66;
  if (!v14)
  {
    FPInvalidParameterError();
    v37 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v38 = (void *)v37;
    v67((uint64_t)v15, (void *)v37);

    goto LABEL_28;
  }
  -[FPDXPCServicer connection](v13, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fp_hasSandboxAccessToFile:logLevel:", v14, 0);

  if ((v17 & 1) == 0)
  {
    -[FPDXPCServicer connection](v13, "connection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "fp_hasOneOfEntitlements:logLevel:", v19, 0);

    if ((v20 & 1) == 0)
    {
      -[FPDXPCServicer connection](v13, "connection");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "fp_isNonSandboxedConnection");

      if ((v22 & 1) == 0)
      {
        FPNotPermittedWriteError();
        v37 = objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      }
    }
  }

  v65 = 0;
  -[FPDXPCServicer server](v13, "server");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "extensionManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "domainForURL:reason:", v14, &v65);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "hasPrefix:", CFSTR("com.apple.CloudDocs"))
    && (objc_msgSend(v25, "provider"),
        v26 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v26, "identifier"),
        v27 = (void *)objc_claimAutoreleasedReturnValue(),
        v28 = objc_msgSend(v27, "fp_isiCloudDriveOrCloudDocsIdentifier"),
        v27,
        v26,
        (v28 & 1) == 0))
  {
    fpfs_adopt_log();
    v64 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    {
      v49 = FPPopLogSectionForBlock();
      FPNotSupportedError();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219778;
      *(_QWORD *)&buf[4] = v49;
      v73 = 2112;
      v74 = v13;
      v75 = 2080;
      v76 = "-[FPDXPCServicer startAccessingServiceWithName:itemURL:completionHandler:]";
      v77 = 2112;
      v78 = 0;
      v79 = 2112;
      v80 = 0;
      v81 = 2112;
      v82 = 0;
      v83 = 2112;
      v84 = 0;
      v85 = 2112;
      v86 = v50;
      _os_log_debug_impl(&dword_1CF55F000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);

    }
    FPNotSupportedError();
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, 0, 0, v45);

    __fp_pop_log();
  }
  else
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v25, "extensionStorageURLs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rootURLs");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayByAddingObjectsFromArray:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v61;
      while (2)
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v61 != v33)
            objc_enumerationMutation(v31);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v34), "fp_relationshipToItemAtURL:", v14) == 1)
          {
            v39 = (void *)MEMORY[0x1E0CAAC70];
            objc_msgSend(v25, "providerDomainID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "fp_toProviderID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "identifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "rootItemIDWithProviderIdentifier:domainIdentifier:", v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            -[FPDXPCServicer startAccessingServiceWithName:itemID:domain:connection:enumerateEntitlementRequired:completionHandler:](v13, "startAccessingServiceWithName:itemID:domain:connection:enumerateEntitlementRequired:completionHandler:", v8, v43, v25, v54, 0, v12);
            goto LABEL_27;
          }
          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
        if (v32)
          continue;
        break;
      }
    }

    if (v25)
    {
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v13, "pid"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "defaultBackend");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v11;
      v55[1] = 3221225472;
      v55[2] = __74__FPDXPCServicer_startAccessingServiceWithName_itemURL_completionHandler___block_invoke_294;
      v55[3] = &unk_1E8C75C00;
      v55[4] = v13;
      v59 = v12;
      v56 = v8;
      v57 = v25;
      v58 = v54;
      objc_msgSend(v36, "itemIDForURL:requireProviderItemID:request:completionHandler:", v14, 0, v35, v55);

    }
    else
    {
      fpfs_adopt_log();
      v64 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v51 = FPPopLogSectionForBlock();
        objc_msgSend(v14, "path");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        FPProviderNotFoundError();
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219778;
        *(_QWORD *)&buf[4] = v51;
        v73 = 2112;
        v74 = v13;
        v75 = 2080;
        v76 = "-[FPDXPCServicer startAccessingServiceWithName:itemURL:completionHandler:]";
        v77 = 2112;
        v78 = 0;
        v79 = 2112;
        v80 = 0;
        v81 = 2112;
        v82 = 0;
        v83 = 2112;
        v84 = 0;
        v85 = 2112;
        v86 = v53;
        _os_log_debug_impl(&dword_1CF55F000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);

      }
      objc_msgSend(v14, "path");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      FPProviderNotFoundError();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, 0, 0, v48);

      __fp_pop_log();
    }
  }
LABEL_27:

LABEL_28:
}

void __74__FPDXPCServicer_startAccessingServiceWithName_itemURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219778;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer startAccessingServiceWithName:itemURL:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = 0;
    v18 = 2112;
    v19 = 0;
    v20 = 2112;
    v21 = 0;
    v22 = 2112;
    v23 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __74__FPDXPCServicer_startAccessingServiceWithName_itemURL_completionHandler___block_invoke_294(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    fpfs_adopt_log();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      v9 = FPPopLogSectionForBlock();
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219778;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      v16 = 2080;
      v17 = "-[FPDXPCServicer startAccessingServiceWithName:itemURL:completionHandler:]_block_invoke";
      v18 = 2112;
      v19 = 0;
      v20 = 2112;
      v21 = 0;
      v22 = 2112;
      v23 = 0;
      v24 = 2112;
      v25 = 0;
      v26 = 2112;
      v27 = v7;
      _os_log_debug_impl(&dword_1CF55F000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@, %@, %@", buf, 0x52u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "startAccessingServiceWithName:itemID:domain:connection:enumerateEntitlementRequired:completionHandler:", *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 64));
  }

}

void __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "connection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "fp_hasSandboxAccessToFile:accessType:logLevel:", v9, *MEMORY[0x1E0CAA668], 1);

    if ((v10 & 1) != 0)
    {
      v12 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 64);
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "enumeratedItemID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, uint64_t, void *, _QWORD))(v11 + 16))(v11, v13, v12, v14, 0);

    }
    else
    {
      fp_current_or_default_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_cold_2(v6, v16);

      v17 = *(_QWORD *)(a1 + 64);
      FPNotPermittedError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v17 + 16))(v17, 0, 0, 0, v18);

    }
  }
  else
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_295(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (!v8 || v5)
  {
    if (!v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "enumeratedURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      FPItemNotFoundErrorAtURL();
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __82__FPDXPCServicer_fetchAndStartEnumeratingWithSettings_observer_completionHandler___block_invoke_301(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "unregisterLifetimeExtensionForObject:", v3);

}

void __62__FPDXPCServicer_forceIndexingInForeground_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer forceIndexingInForeground:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)preventDiskImportSchedulerFromRunning:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  void (*v32)(uint64_t, void *);
  void *v33;
  FPDXPCServicer *v34;
  id v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  FPDXPCServicer *v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  _QWORD v45[4];

  v4 = a3;
  v45[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v45[0] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v32 = __74__FPDXPCServicer_preventDiskImportSchedulerFromRunning_completionHandler___block_invoke;
  v33 = &unk_1E8C75530;
  v34 = self;
  v8 = v6;
  v35 = v8;
  v9 = v7;
  v10 = v31;
  -[FPDXPCServicer connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v9);

  if ((v12 & 1) != 0)
  {

    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = objc_msgSend(&unk_1E8C95DA8, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(&unk_1E8C95DA8);
          +[FPDSharedScheduler schedulerWithLabel:](FPDSharedScheduler, "schedulerWithLabel:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (!v16)
          {
            fpfs_adopt_log();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            fp_current_or_default_log();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
            {
              v23 = FPPopLogSectionForBlock();
              v21 = *MEMORY[0x1E0CB28A8];
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218754;
              v37 = v23;
              v38 = 2112;
              v39 = self;
              v40 = 2080;
              v41 = "-[FPDXPCServicer preventDiskImportSchedulerFromRunning:completionHandler:]";
              v42 = 2112;
              v43 = v24;
              _os_log_debug_impl(&dword_1CF55F000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

            }
            else
            {
              v21 = *MEMORY[0x1E0CB28A8];
            }

            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v21, 4, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, void *))v8 + 2))(v8, v22);

            __fp_pop_log();
            goto LABEL_17;
          }
          objc_msgSend(v16, "setPreventRunning:", v4);

        }
        v13 = objc_msgSend(&unk_1E8C95DA8, "countByEnumeratingWithState:objects:count:", &v27, v44, 16);
        if (v13)
          continue;
        break;
      }
    }
    fpfs_adopt_log();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer preventDiskImportSchedulerFromRunning:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32((uint64_t)v10, v19);

  }
LABEL_17:

}

void __74__FPDXPCServicer_preventDiskImportSchedulerFromRunning_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer preventDiskImportSchedulerFromRunning:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)dumpIndexerInfoFor:(id)a3 withName:(id)a4 to:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  void (*v29)(uint64_t, void *);
  void *v30;
  FPDXPCServicer *v31;
  id v32;
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = *MEMORY[0x1E0CAAEF8];
  v33[0] = *MEMORY[0x1E0CAAE90];
  v33[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v29 = __67__FPDXPCServicer_dumpIndexerInfoFor_withName_to_completionHandler___block_invoke;
  v30 = &unk_1E8C75530;
  v31 = self;
  v16 = v13;
  v32 = v16;
  v17 = v15;
  v18 = v28;
  -[FPDXPCServicer connection](self, "connection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "fp_hasOneOfEntitlements:", v17);

  if ((v20 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "extensionManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "domainWithID:reason:", v10, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "indexer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dumpStateTo:withName:", v12, v11);

    fpfs_adopt_log();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer dumpIndexerInfoFor:withName:to:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v16 + 2))(v16, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29((uint64_t)v18, v26);

  }
}

void __67__FPDXPCServicer_dumpIndexerInfoFor_withName_to_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer dumpIndexerInfoFor:withName:to:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)signalReindexCSIdentifiersByProviderDomainID:(id)a3 indexReason:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  void (*v37)(uint64_t, void *);
  void *v38;
  FPDXPCServicer *v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  _BYTE v45[128];
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v7 = a5;
  v46[0] = *MEMORY[0x1E0CAAE98];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v37 = __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke;
  v38 = &unk_1E8C75530;
  v39 = self;
  v28 = v7;
  v40 = v28;
  v9 = v8;
  v10 = v36;
  -[FPDXPCServicer connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v9);

  if ((v12 & 1) != 0)
  {

    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v27;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v31 = 0;
          -[FPDXPCServicer server](self, "server", v27);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "extensionManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "domainWithID:reason:", v17, &v31);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v13, "objectForKeyedSubscript:", v17);
            v21 = objc_claimAutoreleasedReturnValue();
            if (-[NSObject count](v21, "count"))
            {
              objc_msgSend(v20, "defaultBackend");
              v22 = objc_claimAutoreleasedReturnValue();
              v23 = v22;
              if (v22)
              {
                v30[0] = MEMORY[0x1E0C809B0];
                v30[1] = 3221225472;
                v30[2] = __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_315;
                v30[3] = &unk_1E8C753A8;
                v30[4] = v17;
                -[NSObject reindexItemsWithIndexReason:identifiers:completionHandler:](v22, "reindexItemsWithIndexReason:identifiers:completionHandler:", a4, v21, v30);
              }
              else
              {
                fp_current_or_default_log();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v42 = v17;
                  _os_log_error_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_ERROR, "[ERROR] No indexer to reindex items in domain: %@", buf, 0xCu);
                }

              }
            }
            else
            {
              fp_current_or_default_log();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v17;
                _os_log_error_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_ERROR, "[ERROR] Tried to reindex empty array of identifiersin domain: %@", buf, 0xCu);
              }
            }

          }
          else
          {
            fp_current_or_default_log();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v42 = v17;
              v43 = 2048;
              v44 = v31;
              _os_log_error_impl(&dword_1CF55F000, v21, OS_LOG_TYPE_ERROR, "[ERROR] Failed to reindex items in domain %@, reason %lu", buf, 0x16u);
            }
          }

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
      }
      while (v14);
    }

    fpfs_adopt_log();
    v31 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer signalReindexCSIdentifiersByProviderDomainID:indexReason:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v28 + 2))(v28, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v37((uint64_t)v10, v26);

  }
}

void __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer signalReindexCSIdentifiersByProviderDomainID:indexReason:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_315(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_315_cold_2(v3, v4);

  }
  fp_current_or_default_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_315_cold_1(a1, v5, v6);

}

- (void)_test_setDocIDResolutionPolicy:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  void (*v17)(uint64_t, void *);
  void *v18;
  FPDXPCServicer *v19;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = *MEMORY[0x1E0CAAEF8];
  v21[0] = *MEMORY[0x1E0CAAE90];
  v21[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v17 = __67__FPDXPCServicer__test_setDocIDResolutionPolicy_completionHandler___block_invoke;
  v18 = &unk_1E8C75530;
  v19 = self;
  v8 = v5;
  v20 = v8;
  v9 = v7;
  v10 = v16;
  -[FPDXPCServicer connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v9);

  if ((v12 & 1) != 0)
  {

    GSSetDocIDResolutionPolicy();
    fpfs_adopt_log();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_setDocIDResolutionPolicy:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17((uint64_t)v10, v14);

  }
}

void __67__FPDXPCServicer__test_setDocIDResolutionPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_setDocIDResolutionPolicy:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_getNeedsIndexingStateForRootURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  void (*v35)(uint64_t, void *);
  void *v36;
  FPDXPCServicer *v37;
  id v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  FPDXPCServicer *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v49[0] = *MEMORY[0x1E0CAAEF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v35 = __74__FPDXPCServicer__test_getNeedsIndexingStateForRootURL_completionHandler___block_invoke;
  v36 = &unk_1E8C75530;
  v37 = self;
  v9 = v7;
  v38 = v9;
  v10 = v8;
  v11 = v34;
  -[FPDXPCServicer connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if ((v13 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extensionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "domainForURL:reason:", v6, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      fpfs_adopt_log();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v31 = FPPopLogSectionForBlock();
        v25 = objc_alloc(MEMORY[0x1E0CB37E8]);
        objc_msgSend(v16, "indexer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "state");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v25, "initWithBool:", objc_msgSend(v27, "needsIndexing"));
        *(_DWORD *)buf = 134219010;
        v40 = v31;
        v41 = 2112;
        v42 = self;
        v43 = 2080;
        v44 = "-[FPDXPCServicer _test_getNeedsIndexingStateForRootURL:completionHandler:]";
        v45 = 2112;
        v46 = v28;
        v47 = 2112;
        v48 = 0;
        _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      v18 = objc_alloc(MEMORY[0x1E0CB37E8]);
      objc_msgSend(v16, "indexer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "state");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v18, "initWithBool:", objc_msgSend(v20, "needsIndexing"));
      (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v21, 0);

      __fp_pop_log();
    }
    else
    {
      fpfs_adopt_log();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v29 = FPPopLogSectionForBlock();
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
        *(_DWORD *)buf = 134219010;
        v40 = v29;
        v41 = 2112;
        v42 = self;
        v43 = 2080;
        v44 = "-[FPDXPCServicer _test_getNeedsIndexingStateForRootURL:completionHandler:]";
        v45 = 2112;
        v46 = v30;
        v47 = 2112;
        v48 = 0;
        _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
      (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v24, 0);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35((uint64_t)v11, v22);

  }
}

void __74__FPDXPCServicer__test_getNeedsIndexingStateForRootURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = FPPopLogSectionForBlock();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
    *(_DWORD *)buf = 134219010;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2080;
    v16 = "-[FPDXPCServicer _test_getNeedsIndexingStateForRootURL:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", 0);
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v3);

  __fp_pop_log();
}

- (void)_test_retrieveItemWithName:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  _QWORD v37[2];
  void (*v38)(uint64_t, void *);
  void *v39;
  FPDXPCServicer *v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  FPDXPCServicer *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v52[0] = *MEMORY[0x1E0CAAEF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v38 = __63__FPDXPCServicer__test_retrieveItemWithName_completionHandler___block_invoke;
  v39 = &unk_1E8C75530;
  v40 = self;
  v9 = v7;
  v41 = v9;
  v10 = v8;
  v11 = v37;
  -[FPDXPCServicer connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if ((v13 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "extensionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0;
    objc_msgSend(v15, "providerWithIdentifier:reason:", CFSTR("com.apple.FileProvider.TestingHarness.TestFileProvider"), &v36);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      objc_msgSend(v16, "providedItemsURLs");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v19, "URLByAppendingPathComponent:", v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = 0;
      LOBYTE(v19) = objc_msgSend(CFSTR("Test"), "writeToURL:atomically:encoding:error:", v20, 0, 4, &v34);
      v21 = v34;
      if ((v19 & 1) != 0)
      {
        v33 = v21;
        objc_msgSend(MEMORY[0x1E0CAACB8], "wrapperWithURL:readonly:error:", v20, 0, &v33);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v33;

        fpfs_adopt_log();
        v35 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          v32 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          v43 = v32;
          v44 = 2112;
          v45 = self;
          v46 = 2080;
          v47 = "-[FPDXPCServicer _test_retrieveItemWithName:completionHandler:]";
          v48 = 2112;
          v49 = v22;
          v50 = 2112;
          v51 = v23;
          _os_log_debug_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }

        (*((void (**)(id, void *, id))v9 + 2))(v9, v22, v23);
        __fp_pop_log();

        v21 = v23;
      }
      else
      {
        fpfs_adopt_log();
        v35 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          v31 = FPPopLogSectionForBlock();
          *(_DWORD *)buf = 134219010;
          v43 = v31;
          v44 = 2112;
          v45 = self;
          v46 = 2080;
          v47 = "-[FPDXPCServicer _test_retrieveItemWithName:completionHandler:]";
          v48 = 2112;
          v49 = 0;
          v50 = 2112;
          v51 = v21;
          _os_log_debug_impl(&dword_1CF55F000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
        }

        (*((void (**)(id, _QWORD, id))v9 + 2))(v9, 0, v21);
        __fp_pop_log();

      }
    }
    else
    {
      fpfs_adopt_log();
      v35 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v29 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v43 = v29;
        v44 = 2112;
        v45 = self;
        v46 = 2080;
        v47 = "-[FPDXPCServicer _test_retrieveItemWithName:completionHandler:]";
        v48 = 2112;
        v49 = 0;
        v50 = 2112;
        v51 = v30;
        _os_log_debug_impl(&dword_1CF55F000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPProviderNotFoundError();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v27);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38((uint64_t)v11, v25);

  }
}

void __63__FPDXPCServicer__test_retrieveItemWithName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_retrieveItemWithName:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_callFileProviderManagerAPIs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v23[2];
  void (*v24)(uint64_t, void *);
  void *v25;
  FPDXPCServicer *v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  FPDXPCServicer *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36[0] = *MEMORY[0x1E0CAAEF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v24 = __52__FPDXPCServicer__test_callFileProviderManagerAPIs___block_invoke;
  v25 = &unk_1E8C75530;
  v26 = self;
  v6 = v4;
  v27 = v6;
  v7 = v5;
  v8 = v23;
  -[FPDXPCServicer connection](self, "connection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fp_hasOneOfEntitlements:", v7);

  if ((v10 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "extensionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = 0;
    objc_msgSend(v12, "providerWithIdentifier:reason:", CFSTR("com.apple.FileProvider.TestingHarness.TestFileProvider"), &v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "asAppExtensionBackedProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_test_callFileProviderManagerAPIs:", v6);

    }
    else
    {
      fpfs_adopt_log();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v19 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v29 = v19;
        v30 = 2112;
        v31 = self;
        v32 = 2080;
        v33 = "-[FPDXPCServicer _test_callFileProviderManagerAPIs:]";
        v34 = 2112;
        v35 = v20;
        _os_log_debug_impl(&dword_1CF55F000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPProviderNotFoundError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v18);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24((uint64_t)v8, v16);

  }
}

void __52__FPDXPCServicer__test_callFileProviderManagerAPIs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_callFileProviderManagerAPIs:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_callRemoveTrashedItemsOlderThanDate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[2];
  void (*v26)(uint64_t, void *);
  void *v27;
  FPDXPCServicer *v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v30[0] = *MEMORY[0x1E0CAAEF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v26 = __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke;
  v27 = &unk_1E8C75530;
  v28 = self;
  v10 = v7;
  v29 = v10;
  v11 = v8;
  v12 = v25;
  -[FPDXPCServicer connection](self, "connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v11);

  if ((v14 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extensionManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "providerWithIdentifier:reason:", CFSTR("com.apple.FileProvider.LocalStorage"), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v17, "isAppExtensionReachable") & 1) != 0)
    {
      objc_msgSend(v17, "asAppExtensionBackedProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke_322;
      v22[3] = &unk_1E8C75698;
      v22[4] = self;
      v23 = v10;
      objc_msgSend(v18, "removeTrashedItemsOlderThanDate:request:completionHandler:", v6, v19, v22);

    }
    else
    {
      fpfs_adopt_log();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        FPPopLogSectionForBlock();
        -[FPDXPCServicer _test_callRemoveTrashedItemsOlderThanDate:completionHandler:].cold.1();
      }

      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
      __fp_pop_log();

    }
  }
  else
  {
    FPNotPermittedError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26((uint64_t)v12, v20);

  }
}

void __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_callRemoveTrashedItemsOlderThanDate:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke_322(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  fpfs_adopt_log();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock();
    __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke_322_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_simulateInstallOfBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  char v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[2];
  void (*v27)(uint64_t, void *);
  void *v28;
  FPDXPCServicer *v29;
  id v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v32[0] = *MEMORY[0x1E0CAAEF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v27 = __68__FPDXPCServicer__test_simulateInstallOfBundleID_completionHandler___block_invoke;
  v28 = &unk_1E8C75530;
  v29 = self;
  v9 = v7;
  v30 = v9;
  v10 = v8;
  v11 = v26;
  -[FPDXPCServicer connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if ((v13 & 1) != 0)
  {

    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    objc_msgSend(WeakRetained, "appMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "valueForKey:", CFSTR("defaultProviderByAppBundleID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAABF8]), "initWithAppProxy:providerDomainID:", v14, v19);
    objc_msgSend(v16, "appRegistry");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addApps:", v22);

    fpfs_adopt_log();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_simulateInstallOfBundleID:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27((uint64_t)v11, v24);

  }
}

void __68__FPDXPCServicer__test_simulateInstallOfBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_simulateInstallOfBundleID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_simulateUninstallOfBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  char v13;
  id WeakRetained;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD v21[2];
  void (*v22)(uint64_t, void *);
  void *v23;
  FPDXPCServicer *v24;
  id v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v27[0] = *MEMORY[0x1E0CAAEF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v22 = __70__FPDXPCServicer__test_simulateUninstallOfBundleID_completionHandler___block_invoke;
  v23 = &unk_1E8C75530;
  v24 = self;
  v9 = v7;
  v25 = v9;
  v10 = v8;
  v11 = v21;
  -[FPDXPCServicer connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fp_hasOneOfEntitlements:", v10);

  if ((v13 & 1) != 0)
  {

    WeakRetained = objc_loadWeakRetained((id *)&self->_server);
    objc_msgSend(WeakRetained, "appMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "appRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "removeAppsWithBundleIDs:", v17);

    fpfs_adopt_log();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_simulateUninstallOfBundleID:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
    __fp_pop_log();

  }
  else
  {
    FPNotPermittedError();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22((uint64_t)v11, v19);

  }
}

void __70__FPDXPCServicer__test_simulateUninstallOfBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_simulateUninstallOfBundleID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_getRootSupportDirURLForDomainURL:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[2];
  void (*v41)(uint64_t, void *);
  void *v42;
  FPDXPCServicer *v43;
  id v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  FPDXPCServicer *v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  _QWORD v54[4];

  v54[1] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v6 = a4;
  v54[0] = *MEMORY[0x1E0CAAEF8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v41 = __75__FPDXPCServicer__test_getRootSupportDirURLForDomainURL_completionHandler___block_invoke;
  v42 = &unk_1E8C75530;
  v43 = self;
  v8 = v6;
  v44 = v8;
  v9 = v7;
  v10 = v40;
  -[FPDXPCServicer connection](self, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fp_hasOneOfEntitlements:", v9);

  if ((v12 & 1) != 0)
  {

    -[FPDXPCServicer server](self, "server");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extensionManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "domainForURL:reason:", v33, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v32, "coordinationRootURLs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v37 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v18, "lastPathComponent", v31);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("delete"));

            if (v20)
            {
              fpfs_adopt_log();
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              fp_current_or_default_log();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              {
                v27 = FPPopLogSectionForBlock();
                objc_msgSend(v18, "URLByDeletingLastPathComponent");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "URLByDeletingLastPathComponent");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "URLByDeletingLastPathComponent");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 134218754;
                v46 = v27;
                v47 = 2112;
                v48 = self;
                v49 = 2080;
                v50 = "-[FPDXPCServicer _test_getRootSupportDirURLForDomainURL:completionHandler:]";
                v51 = 2112;
                v52 = v30;
                _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

              }
              objc_msgSend(v18, "URLByDeletingLastPathComponent");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "URLByDeletingLastPathComponent");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "URLByDeletingLastPathComponent");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, void *))v8 + 2))(v8, v26);

              __fp_pop_log();
              goto LABEL_19;
            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v53, 16);
          if (v15)
            continue;
          break;
        }
      }

    }
    fpfs_adopt_log();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_getRootSupportDirURLForDomainURL:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
    __fp_pop_log();

LABEL_19:
  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v41((uint64_t)v10, v22);

  }
}

void __75__FPDXPCServicer__test_getRootSupportDirURLForDomainURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  fpfs_adopt_log();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    FPPopLogSectionForBlock();
    __75__FPDXPCServicer__test_getRootSupportDirURLForDomainURL_completionHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_getCountersArray:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FPDXPCServicer server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainWithID:reason:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "defaultBackend");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__FPDXPCServicer__test_getCountersArray_completionHandler___block_invoke;
    v14[3] = &unk_1E8C75738;
    v14[4] = self;
    v15 = v7;
    objc_msgSend(v11, "getCountersArrayWithCompletionHandler:", v14);

  }
  else
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer _test_getCountersArray:completionHandler:].cold.2();

    fpfs_adopt_log();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_getCountersArray:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    __fp_pop_log();

  }
}

void __59__FPDXPCServicer__test_getCountersArray_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fpfs_adopt_log();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = FPPopLogSectionForBlock();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2080;
      v18 = "-[FPDXPCServicer _test_getCountersArray:completionHandler:]_block_invoke";
      v19 = 2112;
      v20 = 0;
      v21 = 2112;
      v22 = v6;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }
  else
  {
    fpfs_adopt_log();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2080;
      v18 = "-[FPDXPCServicer _test_getCountersArray:completionHandler:]_block_invoke";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_resetCounters:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FPDXPCServicer server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainWithID:reason:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "defaultBackend");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__FPDXPCServicer__test_resetCounters_completionHandler___block_invoke;
    v14[3] = &unk_1E8C75530;
    v14[4] = self;
    v15 = v7;
    objc_msgSend(v11, "resetCountersWithCompletionHandler:", v14);

  }
  else
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer _test_getCountersArray:completionHandler:].cold.2();

    fpfs_adopt_log();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_resetCounters:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    __fp_pop_log();

  }
}

void __56__FPDXPCServicer__test_resetCounters_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_resetCounters:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_queryDiskImportSchedulerLabel:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[FPDXPCServicer server](self, "server");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "extensionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domainWithID:reason:", v6, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "defaultBackend");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__FPDXPCServicer__test_queryDiskImportSchedulerLabel_completionHandler___block_invoke;
    v14[3] = &unk_1E8C78220;
    v14[4] = self;
    v15 = v7;
    objc_msgSend(v11, "queryDiskImportSchedulerLabelWithCompletionHandler:", v14);

  }
  else
  {
    fp_current_or_default_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[FPDXPCServicer _test_getCountersArray:completionHandler:].cold.2();

    fpfs_adopt_log();
    v16 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      -[FPDXPCServicer _test_queryDiskImportSchedulerLabel:completionHandler:].cold.1();
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
    __fp_pop_log();

  }
}

void __72__FPDXPCServicer__test_queryDiskImportSchedulerLabel_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer _test_queryDiskImportSchedulerLabel:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_importItemsPendingReconciliationProgressForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  FPDXPCServicer *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAED0];
  v50[0] = *MEMORY[0x1E0CAAE90];
  v50[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __98__FPDXPCServicer__test_importItemsPendingReconciliationProgressForDomainWithID_completionHandler___block_invoke;
  v37 = &unk_1E8C75530;
  v38 = self;
  v11 = v7;
  v39 = v11;
  v12 = v9;
  v13 = v35;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    v34 = 0;
    -[FPDXPCServicer server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v6, &v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        objc_msgSend(v18, "defaultBackend");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v10;
        v31[1] = 3221225472;
        v31[2] = __98__FPDXPCServicer__test_importItemsPendingReconciliationProgressForDomainWithID_completionHandler___block_invoke_331;
        v31[3] = &unk_1E8C77F38;
        v31[4] = self;
        v32 = v11;
        objc_msgSend(v21, "importProgressForItemsPendingReconciliationWithCompletionHandler:", v31);

      }
      else
      {
        fpfs_adopt_log();
        v33 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v29 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v41 = v29;
          v42 = 2112;
          v43 = self;
          v44 = 2080;
          v45 = "-[FPDXPCServicer _test_importItemsPendingReconciliationProgressForDomainWithID:completionHandler:]";
          v46 = 2112;
          v47 = 0;
          v48 = 2112;
          v49 = v30;
          _os_log_debug_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        FPNotSupportedError();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v26);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v27 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v41 = v27;
        v42 = 2112;
        v43 = self;
        v44 = 2080;
        v45 = "-[FPDXPCServicer _test_importItemsPendingReconciliationProgressForDomainWithID:completionHandler:]";
        v46 = 2112;
        v47 = 0;
        v48 = 2112;
        v49 = v28;
        _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPProviderNotFoundError();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v24);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36((uint64_t)v13, v22);

  }
}

void __98__FPDXPCServicer__test_importItemsPendingReconciliationProgressForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_importItemsPendingReconciliationProgressForDomainWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __98__FPDXPCServicer__test_importItemsPendingReconciliationProgressForDomainWithID_completionHandler___block_invoke_331(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer _test_importItemsPendingReconciliationProgressForDomainWithID:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_importItemsPendingScanningDiskProgressForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  FPDXPCServicer *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAED0];
  v50[0] = *MEMORY[0x1E0CAAE90];
  v50[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __96__FPDXPCServicer__test_importItemsPendingScanningDiskProgressForDomainWithID_completionHandler___block_invoke;
  v37 = &unk_1E8C75530;
  v38 = self;
  v11 = v7;
  v39 = v11;
  v12 = v9;
  v13 = v35;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    v34 = 0;
    -[FPDXPCServicer server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v6, &v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        objc_msgSend(v18, "defaultBackend");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v10;
        v31[1] = 3221225472;
        v31[2] = __96__FPDXPCServicer__test_importItemsPendingScanningDiskProgressForDomainWithID_completionHandler___block_invoke_334;
        v31[3] = &unk_1E8C77F38;
        v31[4] = self;
        v32 = v11;
        objc_msgSend(v21, "importProgressForItemsPendingScanningDiskWithCompletionHandler:", v31);

      }
      else
      {
        fpfs_adopt_log();
        v33 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v29 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v41 = v29;
          v42 = 2112;
          v43 = self;
          v44 = 2080;
          v45 = "-[FPDXPCServicer _test_importItemsPendingScanningDiskProgressForDomainWithID:completionHandler:]";
          v46 = 2112;
          v47 = 0;
          v48 = 2112;
          v49 = v30;
          _os_log_debug_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        FPNotSupportedError();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v26);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v27 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v41 = v27;
        v42 = 2112;
        v43 = self;
        v44 = 2080;
        v45 = "-[FPDXPCServicer _test_importItemsPendingScanningDiskProgressForDomainWithID:completionHandler:]";
        v46 = 2112;
        v47 = 0;
        v48 = 2112;
        v49 = v28;
        _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPProviderNotFoundError();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v24);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36((uint64_t)v13, v22);

  }
}

void __96__FPDXPCServicer__test_importItemsPendingScanningDiskProgressForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_importItemsPendingScanningDiskProgressForDomainWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __96__FPDXPCServicer__test_importItemsPendingScanningDiskProgressForDomainWithID_completionHandler___block_invoke_334(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer _test_importItemsPendingScanningDiskProgressForDomainWithID:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_importItemsPendingScanningProviderProgressForDomainWithID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];
  void (*v36)(uint64_t, void *);
  void *v37;
  FPDXPCServicer *v38;
  id v39;
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  FPDXPCServicer *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  void *v49;
  _QWORD v50[3];

  v50[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAED0];
  v50[0] = *MEMORY[0x1E0CAAE90];
  v50[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v36 = __100__FPDXPCServicer__test_importItemsPendingScanningProviderProgressForDomainWithID_completionHandler___block_invoke;
  v37 = &unk_1E8C75530;
  v38 = self;
  v11 = v7;
  v39 = v11;
  v12 = v9;
  v13 = v35;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    v34 = 0;
    -[FPDXPCServicer server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v6, &v34);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_opt_respondsToSelector();

      if ((v20 & 1) != 0)
      {
        objc_msgSend(v18, "defaultBackend");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v10;
        v31[1] = 3221225472;
        v31[2] = __100__FPDXPCServicer__test_importItemsPendingScanningProviderProgressForDomainWithID_completionHandler___block_invoke_337;
        v31[3] = &unk_1E8C77F38;
        v31[4] = self;
        v32 = v11;
        objc_msgSend(v21, "importProgressForItemsPendingScanningProviderWithCompletionHandler:", v31);

      }
      else
      {
        fpfs_adopt_log();
        v33 = (id)objc_claimAutoreleasedReturnValue();
        fp_current_or_default_log();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          v29 = FPPopLogSectionForBlock();
          FPNotSupportedError();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134219010;
          v41 = v29;
          v42 = 2112;
          v43 = self;
          v44 = 2080;
          v45 = "-[FPDXPCServicer _test_importItemsPendingScanningProviderProgressForDomainWithID:completionHandler:]";
          v46 = 2112;
          v47 = 0;
          v48 = 2112;
          v49 = v30;
          _os_log_debug_impl(&dword_1CF55F000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

        }
        FPNotSupportedError();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v26);

        __fp_pop_log();
      }
    }
    else
    {
      fpfs_adopt_log();
      v33 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v27 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v41 = v27;
        v42 = 2112;
        v43 = self;
        v44 = 2080;
        v45 = "-[FPDXPCServicer _test_importItemsPendingScanningProviderProgressForDomainWithID:completionHandler:]";
        v46 = 2112;
        v47 = 0;
        v48 = 2112;
        v49 = v28;
        _os_log_debug_impl(&dword_1CF55F000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPProviderNotFoundError();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v24);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v36((uint64_t)v13, v22);

  }
}

void __100__FPDXPCServicer__test_importItemsPendingScanningProviderProgressForDomainWithID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_importItemsPendingScanningProviderProgressForDomainWithID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __100__FPDXPCServicer__test_importItemsPendingScanningProviderProgressForDomainWithID_completionHandler___block_invoke_337(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  fpfs_adopt_log();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = FPPopLogSectionForBlock();
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2080;
    v16 = "-[FPDXPCServicer _test_importItemsPendingScanningProviderProgressForDomainWithID:completionHandler:]_block_invoke";
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_disableDBQueryStatistics:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];
  void (*v31)(uint64_t, void *);
  void *v32;
  FPDXPCServicer *v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  FPDXPCServicer *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAEF8];
  v43[0] = *MEMORY[0x1E0CAAE90];
  v43[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v31 = __67__FPDXPCServicer__test_disableDBQueryStatistics_completionHandler___block_invoke;
  v32 = &unk_1E8C75530;
  v33 = self;
  v11 = v7;
  v34 = v11;
  v12 = v9;
  v13 = v30;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    v29 = 0;
    -[FPDXPCServicer server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v6, &v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      v26[1] = 3221225472;
      v26[2] = __67__FPDXPCServicer__test_disableDBQueryStatistics_completionHandler___block_invoke_338;
      v26[3] = &unk_1E8C75530;
      v26[4] = self;
      v27 = v11;
      objc_msgSend(v19, "disableDBQueryStatisticsWithCompletionHandler:", v26);

    }
    else
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer _test_getCountersArray:completionHandler:].cold.2();

      fpfs_adopt_log();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v24 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v36 = v24;
        v37 = 2112;
        v38 = self;
        v39 = 2080;
        v40 = "-[FPDXPCServicer _test_disableDBQueryStatistics:completionHandler:]";
        v41 = 2112;
        v42 = v25;
        _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPProviderNotFoundError();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v11 + 2))(v11, v23);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31((uint64_t)v13, v20);

  }
}

void __67__FPDXPCServicer__test_disableDBQueryStatistics_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_disableDBQueryStatistics:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __67__FPDXPCServicer__test_disableDBQueryStatistics_completionHandler___block_invoke_338(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_disableDBQueryStatistics:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_resetDBQueryStatistics:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];
  void (*v31)(uint64_t, void *);
  void *v32;
  FPDXPCServicer *v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  FPDXPCServicer *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x1E0CAAEF8];
  v43[0] = *MEMORY[0x1E0CAAE90];
  v43[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v31 = __65__FPDXPCServicer__test_resetDBQueryStatistics_completionHandler___block_invoke;
  v32 = &unk_1E8C75530;
  v33 = self;
  v11 = v7;
  v34 = v11;
  v12 = v9;
  v13 = v30;
  -[FPDXPCServicer connection](self, "connection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fp_hasOneOfEntitlements:", v12);

  if ((v15 & 1) != 0)
  {

    v29 = 0;
    -[FPDXPCServicer server](self, "server");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extensionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "domainWithID:reason:", v6, &v29);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v18, "defaultBackend");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v10;
      v26[1] = 3221225472;
      v26[2] = __65__FPDXPCServicer__test_resetDBQueryStatistics_completionHandler___block_invoke_339;
      v26[3] = &unk_1E8C75530;
      v26[4] = self;
      v27 = v11;
      objc_msgSend(v19, "resetDBQueryStatisticsWithCompletionHandler:", v26);

    }
    else
    {
      fp_current_or_default_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer _test_getCountersArray:completionHandler:].cold.2();

      fpfs_adopt_log();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v24 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        v36 = v24;
        v37 = 2112;
        v38 = self;
        v39 = 2080;
        v40 = "-[FPDXPCServicer _test_resetDBQueryStatistics:completionHandler:]";
        v41 = 2112;
        v42 = v25;
        _os_log_debug_impl(&dword_1CF55F000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPProviderNotFoundError();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v11 + 2))(v11, v23);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31((uint64_t)v13, v20);

  }
}

void __65__FPDXPCServicer__test_resetDBQueryStatistics_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_resetDBQueryStatistics:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __65__FPDXPCServicer__test_resetDBQueryStatistics_completionHandler___block_invoke_339(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_resetDBQueryStatistics:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)_test_getDBQueryStatistics:(id)a3 queryPlan:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[2];
  void (*v33)(uint64_t, void *);
  void *v34;
  FPDXPCServicer *v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  FPDXPCServicer *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  _QWORD v47[3];

  v6 = a4;
  v47[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = *MEMORY[0x1E0CAAEF8];
  v47[0] = *MEMORY[0x1E0CAAE90];
  v47[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v33 = __73__FPDXPCServicer__test_getDBQueryStatistics_queryPlan_completionHandler___block_invoke;
  v34 = &unk_1E8C75530;
  v35 = self;
  v13 = v9;
  v36 = v13;
  v14 = v11;
  v15 = v32;
  -[FPDXPCServicer connection](self, "connection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "fp_hasOneOfEntitlements:", v14);

  if ((v17 & 1) != 0)
  {

    v31 = 0;
    -[FPDXPCServicer server](self, "server");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "extensionManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "domainWithID:reason:", v8, &v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v20, "defaultBackend");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v12;
      v28[1] = 3221225472;
      v28[2] = __73__FPDXPCServicer__test_getDBQueryStatistics_queryPlan_completionHandler___block_invoke_340;
      v28[3] = &unk_1E8C75760;
      v28[4] = self;
      v29 = v13;
      objc_msgSend(v21, "getDBQueryStatisticsWithQueryPlan:completionHandler:", v6, v28);

    }
    else
    {
      fp_current_or_default_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[FPDXPCServicer _test_getCountersArray:completionHandler:].cold.2();

      fpfs_adopt_log();
      v30 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v26 = FPPopLogSectionForBlock();
        FPProviderNotFoundError();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v38 = v26;
        v39 = 2112;
        v40 = self;
        v41 = 2080;
        v42 = "-[FPDXPCServicer _test_getDBQueryStatistics:queryPlan:completionHandler:]";
        v43 = 2112;
        v44 = 0;
        v45 = 2112;
        v46 = v27;
        _os_log_debug_impl(&dword_1CF55F000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);

      }
      FPProviderNotFoundError();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v13 + 2))(v13, 0, v25);

      __fp_pop_log();
    }

  }
  else
  {
    FPNotPermittedError();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33((uint64_t)v15, v22);

  }
}

void __73__FPDXPCServicer__test_getDBQueryStatistics_queryPlan_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer _test_getDBQueryStatistics:queryPlan:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __73__FPDXPCServicer__test_getDBQueryStatistics_queryPlan_completionHandler___block_invoke_340(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fpfs_adopt_log();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = FPPopLogSectionForBlock();
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      v17 = 2080;
      v18 = "-[FPDXPCServicer _test_getDBQueryStatistics:queryPlan:completionHandler:]_block_invoke";
      v19 = 2112;
      v20 = 0;
      v21 = 2112;
      v22 = v6;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }
  else
  {
    fpfs_adopt_log();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = FPPopLogSectionForBlock();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134219010;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2080;
      v18 = "-[FPDXPCServicer _test_getDBQueryStatistics:queryPlan:completionHandler:]_block_invoke";
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (id)getSyncPausedXattrForURL:(id)a3
{
  id v3;
  ssize_t v4;
  size_t v5;
  void *v6;
  ssize_t v7;
  void *v8;
  NSObject *v9;

  v3 = objc_retainAutorelease(a3);
  v4 = getxattr((const char *)objc_msgSend(v3, "fileSystemRepresentation"), "com.apple.file-provider-sync_paused_bundle_id#PX", 0, 0, 0, 1);
  if (v4 <= 0)
  {
    if (*__error() != 93)
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[FPDXPCServicer getSyncPausedXattrForURL:].cold.1((uint64_t)v3, v9);

    }
    v8 = 0;
  }
  else
  {
    v5 = v4;
    v6 = malloc_type_malloc(v4, 0x8D40F0ACuLL);
    v7 = getxattr((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), "com.apple.file-provider-sync_paused_bundle_id#PX", v6, v5, 0, 1);
    if (v7 < 1)
      v8 = 0;
    else
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v6, v7, 4);
    free(v6);
  }

  return v8;
}

- (void)pauseSyncForItemAtURL:(id)a3 behavior:(unint64_t)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  FPDXPCServicer *v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  id WeakRetained;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  FPDXPCServicer *v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[2];
  void (*v60)(uint64_t, void *);
  void *v61;
  FPDXPCServicer *v62;
  id v63;
  _BYTE buf[12];
  __int16 v65;
  FPDXPCServicer *v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  void *v70;
  uint64_t v71;
  _QWORD v72[4];

  v72[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v72[0] = *MEMORY[0x1E0CAAEC8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v60 = __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke;
  v61 = &unk_1E8C75530;
  v62 = self;
  v13 = v11;
  v63 = v13;
  v14 = self;
  v15 = v9;
  v16 = v12;
  v17 = v59;
  if (!v15)
  {
    FPInvalidParameterError();
    v37 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v38 = (void *)v37;
    v60((uint64_t)v17, (void *)v37);

    goto LABEL_24;
  }
  -[FPDXPCServicer connection](v14, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fp_hasSandboxAccessToFile:logLevel:", v15, 0);

  if ((v19 & 1) == 0)
  {
    -[FPDXPCServicer connection](v14, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "fp_hasOneOfEntitlements:logLevel:", v21, 0);

    if ((v22 & 1) == 0)
    {
      -[FPDXPCServicer connection](v14, "connection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

      if ((v24 & 1) == 0)
      {
        -[FPDXPCServicer connection](v14, "connection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "fp_isNonSandboxedConnection");

        if ((v26 & 1) == 0)
        {
          FPNotPermittedWriteError();
          v37 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&v14->_connection);
  objc_msgSend(WeakRetained, "fp_bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FPDXPCServicer connection](v14, "connection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = *MEMORY[0x1E0CAAE90];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "fp_hasOneOfEntitlements:", v30);

    if (v31)
    {
      v32 = v10;

      v28 = v32;
    }
  }
  -[FPDXPCServicer getSyncPausedXattrForURL:](v14, "getSyncPausedXattrForURL:", v15, a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    fp_current_or_default_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:].cold.1();

    fpfs_adopt_log();
    v58 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v47 = FPPopLogSectionForBlock();
      FPFileIsAlreadyPausedError();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v47;
      v65 = 2112;
      v66 = v14;
      v67 = 2080;
      v68 = "-[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]";
      v69 = 2112;
      v70 = v48;
      _os_log_debug_impl(&dword_1CF55F000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    FPFileIsAlreadyPausedError();
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v36);

    __fp_pop_log();
  }
  else
  {
    -[FPDXPCServicer server](v14, "server");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "extensionManager");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v40, "domainForURL:reason:", v15, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v41, "defaultBackend");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v40) = objc_opt_respondsToSelector();

    if ((v40 & 1) != 0)
    {
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v14, "pid"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "defaultBackend");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_344;
      v53[3] = &unk_1E8C77FD8;
      v54 = v41;
      v55 = v14;
      v57 = v13;
      v56 = v28;
      objc_msgSend(v44, "pauseSyncForItemAtURL:bundleID:behavior:request:completionHandler:", v15, v56, v52, v43, v53);

    }
    else
    {
      fpfs_adopt_log();
      v58 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        v49 = FPPopLogSectionForBlock();
        FPNotSupportedError();
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v49;
        v65 = 2112;
        v66 = v14;
        v67 = 2080;
        v68 = "-[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]";
        v69 = 2112;
        v70 = v50;
        _os_log_debug_impl(&dword_1CF55F000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPNotSupportedError();
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v13 + 2))(v13, v46);

      __fp_pop_log();
    }

  }
LABEL_24:

}

void __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_344(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2;
  block[3] = &unk_1E8C76C60;
  v8 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v8;
  v16 = *(id *)(a1 + 56);
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    fpfs_adopt_log();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v7 = FPPopLogSectionForBlock();
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2080;
      v18 = "-[FPDXPCServicer pauseSyncForItemAtURL:behavior:bundleID:completionHandler:]_block_invoke_2";
      v19 = 2112;
      v20 = v9;
      _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extensionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPausedSyncItemID:forBundleID:", v5, *(_QWORD *)(a1 + 56));

    fpfs_adopt_log();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log();

  }
}

- (void)resumeSyncForItemAtURL:(id)a3 behavior:(unint64_t)a4 bundleID:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  FPDXPCServicer *v14;
  id v15;
  id v16;
  _QWORD *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  char v26;
  id WeakRetained;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  FPDXPCServicer *v56;
  id v57;
  id v58;
  id v59;
  _QWORD v60[2];
  void (*v61)(uint64_t, void *);
  void *v62;
  FPDXPCServicer *v63;
  id v64;
  _BYTE buf[12];
  __int16 v66;
  FPDXPCServicer *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  void *v71;
  uint64_t v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v73[0] = *MEMORY[0x1E0CAAEC8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v61 = __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke;
  v62 = &unk_1E8C75530;
  v63 = self;
  v13 = v11;
  v64 = v13;
  v14 = self;
  v15 = v9;
  v16 = v12;
  v17 = v60;
  if (!v15)
  {
    FPInvalidParameterError();
    v44 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v45 = (void *)v44;
    v61((uint64_t)v17, (void *)v44);

    goto LABEL_25;
  }
  -[FPDXPCServicer connection](v14, "connection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fp_hasSandboxAccessToFile:accessType:logLevel:", v15, *MEMORY[0x1E0CAA660], 0);

  if ((v19 & 1) == 0)
  {
    -[FPDXPCServicer connection](v14, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "fp_hasOneOfEntitlements:logLevel:", v21, 0);

    if ((v22 & 1) == 0)
    {
      -[FPDXPCServicer connection](v14, "connection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "fp_hasOneOfEntitlements:logLevel:", v16, 0);

      if ((v24 & 1) == 0)
      {
        -[FPDXPCServicer connection](v14, "connection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "fp_isNonSandboxedConnection");

        if ((v26 & 1) == 0)
        {
          FPNotPermittedError();
          v44 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&v14->_connection);
  objc_msgSend(WeakRetained, "fp_bundleIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[FPDXPCServicer connection](v14, "connection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = *MEMORY[0x1E0CAAE90];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "fp_hasOneOfEntitlements:", v30);

    if (v31)
    {
      v32 = v10;

      v28 = v32;
    }
  }
  -[FPDXPCServicer getSyncPausedXattrForURL:](v14, "getSyncPausedXattrForURL:", v15, a4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33 && (objc_msgSend(v33, "isEqualToString:", v28) & 1) != 0)
  {
    -[FPDXPCServicer server](v14, "server");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "extensionManager");
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v36, "domainForURL:reason:", v15, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "defaultBackend");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v36) = objc_opt_respondsToSelector();

    if ((v36 & 1) != 0)
    {
      +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v14, "pid"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "defaultBackend");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_347;
      v54[3] = &unk_1E8C77FD8;
      v55 = v37;
      v56 = v14;
      v58 = v13;
      v57 = v28;
      objc_msgSend(v40, "resumeSyncForItemAtURL:bundleID:behavior:request:completionHandler:", v15, v57, v53, v39, v54);

    }
    else
    {
      fpfs_adopt_log();
      v59 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v50 = FPPopLogSectionForBlock();
        FPNotSupportedError();
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218754;
        *(_QWORD *)&buf[4] = v50;
        v66 = 2112;
        v67 = v14;
        v68 = 2080;
        v69 = "-[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]";
        v70 = 2112;
        v71 = v51;
        _os_log_debug_impl(&dword_1CF55F000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

      }
      FPNotSupportedError();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v13 + 2))(v13, v47);

      __fp_pop_log();
    }

  }
  else
  {
    fp_current_or_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:].cold.1();

    fpfs_adopt_log();
    v59 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v48 = FPPopLogSectionForBlock();
      FPFileNotPausedError();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v48;
      v66 = 2112;
      v67 = v14;
      v68 = 2080;
      v69 = "-[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]";
      v70 = 2112;
      v71 = v49;
      _os_log_debug_impl(&dword_1CF55F000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);

    }
    FPFileNotPausedError();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v13 + 2))(v13, v43);

    __fp_pop_log();
  }

LABEL_25:
}

void __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_347(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "serialQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2;
  block[3] = &unk_1E8C76C60;
  v8 = *(_QWORD *)(a1 + 40);
  v12 = v6;
  v13 = v8;
  v16 = *(id *)(a1 + 56);
  v14 = v5;
  v15 = *(id *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    fpfs_adopt_log();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      v7 = FPPopLogSectionForBlock();
      v9 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218754;
      v14 = v7;
      v15 = 2112;
      v16 = v8;
      v17 = 2080;
      v18 = "-[FPDXPCServicer resumeSyncForItemAtURL:behavior:bundleID:completionHandler:]_block_invoke_2";
      v19 = 2112;
      v20 = v9;
      _os_log_debug_impl(&dword_1CF55F000, v2, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", buf, 0x2Au);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "extensionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removePausedSyncItemID:forBundleID:", v5, *(_QWORD *)(a1 + 56));

    fpfs_adopt_log();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      FPPopLogSectionForBlock();
      __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2_cold_1();
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    __fp_pop_log();

  }
}

- (void)fetchLatestVersionForItemAtURL:(id)a3 bundleID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  FPDXPCServicer *v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  id WeakRetained;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  _QWORD v54[5];
  id v55;
  id v56;
  _QWORD v57[2];
  void (*v58)(uint64_t, void *);
  void *v59;
  FPDXPCServicer *v60;
  id v61;
  _BYTE buf[12];
  __int16 v63;
  FPDXPCServicer *v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v74[0] = *MEMORY[0x1E0CAAEC8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v58 = __76__FPDXPCServicer_fetchLatestVersionForItemAtURL_bundleID_completionHandler___block_invoke;
  v59 = &unk_1E8C75530;
  v60 = self;
  v12 = v10;
  v61 = v12;
  v13 = self;
  v14 = v8;
  v15 = v11;
  v16 = v57;
  if (!v14)
  {
    FPInvalidParameterError();
    v45 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v46 = (void *)v45;
    v58((uint64_t)v16, (void *)v45);

    goto LABEL_25;
  }
  -[FPDXPCServicer connection](v13, "connection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "fp_hasSandboxAccessToFile:accessType:logLevel:", v14, *MEMORY[0x1E0CAA660], 0);

  if ((v18 & 1) == 0)
  {
    -[FPDXPCServicer connection](v13, "connection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = *MEMORY[0x1E0CAAE98];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "fp_hasOneOfEntitlements:logLevel:", v20, 0);

    if ((v21 & 1) == 0)
    {
      -[FPDXPCServicer connection](v13, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "fp_hasOneOfEntitlements:logLevel:", v15, 0);

      if ((v23 & 1) == 0)
      {
        -[FPDXPCServicer connection](v13, "connection");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "fp_isNonSandboxedConnection");

        if ((v25 & 1) == 0)
        {
          FPNotPermittedError();
          v45 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
    }
  }

  WeakRetained = objc_loadWeakRetained((id *)&v13->_connection);
  objc_msgSend(WeakRetained, "fp_bundleIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FPDXPCServicer connection](v13, "connection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = *MEMORY[0x1E0CAAE90];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "fp_hasOneOfEntitlements:", v29);

    if (v30)
    {
      v31 = v9;

      v27 = v31;
    }
  }
  -[FPDXPCServicer getSyncPausedXattrForURL:](v13, "getSyncPausedXattrForURL:", v14);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32 && (objc_msgSend(v32, "isEqualToString:", v27) & 1) != 0)
  {
    -[FPDXPCServicer server](v13, "server");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "extensionManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "domainForURL:reason:", v14, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](v13, "pid"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "defaultBackend");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_opt_respondsToSelector();

    if ((v39 & 1) != 0)
    {
      objc_msgSend(v36, "defaultBackend");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __76__FPDXPCServicer_fetchLatestVersionForItemAtURL_bundleID_completionHandler___block_invoke_350;
      v54[3] = &unk_1E8C78248;
      v54[4] = v13;
      v55 = v12;
      objc_msgSend(v40, "fetchLatestVersionForURL:request:completionHandler:", v14, v37, v54);

    }
    else
    {
      fpfs_adopt_log();
      v56 = (id)objc_claimAutoreleasedReturnValue();
      fp_current_or_default_log();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      {
        v50 = FPPopLogSectionForBlock();
        FPNotSupportedError();
        v51 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219266;
        *(_QWORD *)&buf[4] = v50;
        v63 = 2112;
        v64 = v13;
        v65 = 2080;
        v66 = "-[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]";
        v67 = 2112;
        v68 = 0;
        v69 = 2112;
        v70 = 0;
        v71 = 2112;
        v72 = v51;
        v52 = (void *)v51;
        _os_log_debug_impl(&dword_1CF55F000, v47, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

      }
      FPNotSupportedError();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v48);

      __fp_pop_log();
    }

  }
  else
  {
    fp_current_or_default_log();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      -[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:].cold.1();

    fpfs_adopt_log();
    v56 = (id)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
    {
      v53 = FPPopLogSectionForBlock();
      v43 = *MEMORY[0x1E0CAAB88];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CAAB88], 16, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134219266;
      *(_QWORD *)&buf[4] = v53;
      v63 = 2112;
      v64 = v13;
      v65 = 2080;
      v66 = "-[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]";
      v67 = 2112;
      v68 = 0;
      v69 = 2112;
      v70 = 0;
      v71 = 2112;
      v72 = (uint64_t)v49;
      _os_log_debug_impl(&dword_1CF55F000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);

    }
    else
    {
      v43 = *MEMORY[0x1E0CAAB88];
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v43, 16, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v44);

    __fp_pop_log();
  }

LABEL_25:
}

void __76__FPDXPCServicer_fetchLatestVersionForItemAtURL_bundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = 0;
    v18 = 2112;
    v19 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __76__FPDXPCServicer_fetchLatestVersionForItemAtURL_bundleID_completionHandler___block_invoke_350(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  fpfs_adopt_log();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = FPPopLogSectionForBlock();
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219266;
    v15 = v11;
    v16 = 2112;
    v17 = v12;
    v18 = 2080;
    v19 = "-[FPDXPCServicer fetchLatestVersionForItemAtURL:bundleID:completionHandler:]_block_invoke";
    v20 = 2112;
    v21 = v7;
    v22 = 2112;
    v23 = v8;
    v24 = 2112;
    v25 = v9;
    _os_log_debug_impl(&dword_1CF55F000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@, %@", buf, 0x3Eu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

- (void)listPausedURLsWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  char v11;
  id WeakRetained;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id obj;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _QWORD v45[6];
  id v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  dispatch_group_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _QWORD v76[2];
  void (*v77)(uint64_t, void *);
  void *v78;
  FPDXPCServicer *v79;
  id v80;
  _BYTE buf[12];
  __int16 v82;
  FPDXPCServicer *v83;
  __int16 v84;
  const char *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;
  _QWORD v93[4];

  v93[1] = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v6 = a4;
  v93[0] = *MEMORY[0x1E0CAAEC8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v77 = __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke;
  v78 = &unk_1E8C75530;
  v79 = self;
  v36 = v6;
  v80 = v36;
  v8 = v7;
  v9 = v76;
  -[FPDXPCServicer connection](self, "connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fp_hasOneOfEntitlements:", v8);

  if ((v11 & 1) != 0)
  {

    WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    objc_msgSend(WeakRetained, "fp_bundleIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
    {
      -[FPDXPCServicer connection](self, "connection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = *MEMORY[0x1E0CAAE90];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "fp_hasOneOfEntitlements:", v14);

      if (v15)
      {
        v16 = v37;

        v43 = v16;
      }
    }
    -[FPDXPCServicer server](self, "server");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "extensionManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "syncPausedFilesForBundleID:", v43);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v70 = 0;
    v71 = &v70;
    v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__11;
    v74 = __Block_byref_object_dispose__11;
    v75 = 0;
    v75 = (id)objc_opt_new();
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__11;
    v68 = __Block_byref_object_dispose__11;
    v69 = 0;
    v69 = (id)objc_opt_new();
    v58 = 0;
    v59 = &v58;
    v60 = 0x3032000000;
    v61 = __Block_byref_object_copy__11;
    v62 = __Block_byref_object_dispose__11;
    v63 = 0;
    v63 = dispatch_group_create();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    objc_msgSend(v40, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v91, 16);
    if (v41)
    {
      v39 = *(_QWORD *)v55;
      do
      {
        v42 = 0;
        do
        {
          if (*(_QWORD *)v55 != v39)
            objc_enumerationMutation(obj);
          objc_msgSend(v40, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v42));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = 0u;
          v51 = 0u;
          v52 = 0u;
          v50 = 0u;
          v20 = v19;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v90, 16);
          if (v21)
          {
            v22 = *(_QWORD *)v51;
            do
            {
              v23 = 0;
              do
              {
                if (*(_QWORD *)v51 != v22)
                  objc_enumerationMutation(v20);
                v24 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v23);
                *(_QWORD *)buf = 0;
                -[FPDXPCServicer server](self, "server");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "extensionManager");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "domainFromItemID:checkInvalidation:reason:", v24, 1, buf);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                if (v27)
                {
                  dispatch_group_enter((dispatch_group_t)v59[5]);
                  objc_msgSend(v27, "defaultBackend");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  +[FPDRequest requestForPID:](FPDRequest, "requestForPID:", -[FPDXPCServicer pid](self, "pid"));
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v45[0] = MEMORY[0x1E0C809B0];
                  v45[1] = 3221225472;
                  v45[2] = __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_352;
                  v45[3] = &unk_1E8C78270;
                  v47 = &v64;
                  v48 = &v58;
                  v45[4] = v24;
                  v45[5] = self;
                  v46 = v43;
                  v49 = &v70;
                  objc_msgSend(v28, "URLForItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:forBookmarkResolution:request:completionHandler:", v24, 1, 1, 0, v29, v45);

                }
                else
                {
                  objc_msgSend((id)v65[5], "addObject:", v24);
                }

                ++v23;
              }
              while (v21 != v23);
              v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v50, v90, 16);
            }
            while (v21);
          }

          ++v42;
        }
        while (v42 != v41);
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v91, 16);
      }
      while (v41);
    }

    dispatch_group_wait((dispatch_group_t)v59[5], 0xFFFFFFFFFFFFFFFFLL);
    -[FPDXPCServicer server](self, "server");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "extensionManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "removePausedSyncItemID:forBundleID:", v65[5], v43);

    fpfs_adopt_log();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v34 = FPPopLogSectionForBlock();
      v35 = v71[5];
      *(_DWORD *)buf = 134219010;
      *(_QWORD *)&buf[4] = v34;
      v82 = 2112;
      v83 = self;
      v84 = 2080;
      v85 = "-[FPDXPCServicer listPausedURLsWithBundleID:completionHandler:]";
      v86 = 2112;
      v87 = v35;
      v88 = 2112;
      v89 = 0;
      _os_log_debug_impl(&dword_1CF55F000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
    }

    (*((void (**)(id, uint64_t, _QWORD))v36 + 2))(v36, v71[5], 0);
    __fp_pop_log();

    _Block_object_dispose(&v58, 8);
    _Block_object_dispose(&v64, 8);

    _Block_object_dispose(&v70, 8);
  }
  else
  {
    FPNotPermittedError();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v77((uint64_t)v9, v33);

  }
}

void __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  fpfs_adopt_log();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  fp_current_or_default_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = FPPopLogSectionForBlock();
    v6 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 134219010;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2080;
    v13 = "-[FPDXPCServicer listPausedURLsWithBundleID:completionHandler:]_block_invoke";
    v14 = 2112;
    v15 = 0;
    v16 = 2112;
    v17 = v3;
    _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", buf, 0x34u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  __fp_pop_log();

}

void __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_352(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_352_cold_1((uint64_t)a1, v5, v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", a1[4]);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[8] + 8) + 40));
  }
  else
  {
    v8 = (void *)a1[5];
    objc_msgSend(v6, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getSyncPausedXattrForURL:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && (objc_msgSend(v10, "isEqualToString:", a1[6]) & 1) != 0)
    {
      v11 = *(void **)(*(_QWORD *)(a1[9] + 8) + 40);
      v12 = v7;
    }
    else
    {
      fp_current_or_default_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_352_cold_2();

      v11 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
      v12 = (void *)a1[4];
    }
    objc_msgSend(v11, "addObject:", v12);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1[8] + 8) + 40));

  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_server);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_providerServicers, 0);
}

- (void)_providerForIdentifier:enumerateEntitlementRequired:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] can't find the provider for the calling bundle %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)_providerForIdentifier:enumerateEntitlementRequired:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] can't find the provider for identifier %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)_providerForIdentifier:enumerateEntitlementRequired:error:.cold.3()
{
  NSObject *v0;
  id *v1;
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_21();
  v6 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(v1);
  objc_msgSend(WeakRetained, "processIdentifier");
  FPExecutableNameForProcessIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v4, "[ERROR] %@ is missing enumerate entitlement to lookup %@", v5);

  OUTLINED_FUNCTION_2();
}

void __120__FPDXPCServicer_startAccessingServiceWithName_itemID_domain_connection_enumerateEntitlementRequired_completionHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] there should be an error specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)wakeUpForURL:(const char *)a1 completionHandler:.cold.1(const char *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] Serving: %@ for url %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)extendBookmarkForItemID:consumerID:completionHandler:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  _os_log_debug_impl(&dword_1CF55F000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully generated bookmarkable string “%@” from %@.", v1, 0x16u);
  OUTLINED_FUNCTION_8_0();
}

void __71__FPDXPCServicer_extendBookmarkForItemID_consumerID_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  id *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD v11[2];
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processIdentifier");
  objc_msgSend(*v4, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processIdentifier");
  FPExecutableNameForProcessIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0CAAE78];
  v10 = *(_QWORD *)(a1 + 40);
  v11[0] = 67109890;
  v11[1] = v6;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  v16 = 2112;
  v17 = v10;
  _os_log_debug_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] PID %d (%@) does not have %@ entitlement to extend bookmark for %@", (uint8_t *)v11, 0x26u);

}

void __74__FPDXPCServicer_extendBookmarkForFileURL_toConsumerID_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_33();
  objc_msgSend(*(id *)(v0 + 48), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] Successfully generated bookmarkable string “%@” from %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)extendSandboxForFileURL:(const char *)a1 fromProviderID:(NSObject *)a2 toConsumerID:completionHandler:.cold.1(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] Serving: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __62__FPDXPCServicer_startDownloadingItemAtURL_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_22_0(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)evictItemAtURL:(void *)a1 evenIfEnumeratingFP:(NSObject *)a2 andClearACLForConsumer:evictionReason:completionHandler:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] %@ is not associated with a provider", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", v5, v6);
}

- (void)evictItemAtURL:evenIfEnumeratingFP:andClearACLForConsumer:evictionReason:completionHandler:.cold.4()
{
  NSObject *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;

  OUTLINED_FUNCTION_37();
  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v3;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v6, "[ERROR] Not evicting item at %@ in provider %@ since it's an enumerating file provider", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

- (void)evictItemAtURL:(const char *)a1 evenIfEnumeratingFP:(NSObject *)a2 andClearACLForConsumer:evictionReason:completionHandler:.cold.5(const char *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] Serving: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_106_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_22_0(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s error: %@", v5, v6);
}

void __109__FPDXPCServicer_evictItemAtURL_evenIfEnumeratingFP_andClearACLForConsumer_evictionReason_completionHandler___block_invoke_106_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  __int16 v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_37();
  v3 = v2;
  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 32), "providerDomainID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v3 + 40), "fp_shortDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v4;
  OUTLINED_FUNCTION_4();
  v10 = v6;
  v11 = v1;
  OUTLINED_FUNCTION_9_1(&dword_1CF55F000, v0, v7, "[ERROR] Could not ask provider ID %@ to stop providing item at %@. Error: %@", (uint8_t *)&v8);

  OUTLINED_FUNCTION_4_2();
}

- (void)providerDomainsCompletionHandler:(const char *)a1 .cold.1(const char *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v4, v5, "[DEBUG] %@: returning %lu providers", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)providerDomainForURL:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_8_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_9_4(v3, v4);
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)providerDomainForURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] %@ is not associated with a provider", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)documentURLFromBookmarkableString:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] Getting URL from bookmarkable string: “%@”.", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)documentURLFromItemID:(void *)a1 creatingPlaceholderIfMissing:(NSObject *)a2 ignoreAlternateContentsURL:completionHandler:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v5, "[ERROR] Extension %{public}@ is not allowed to access userVisible URLs", v6);

  OUTLINED_FUNCTION_2();
}

- (void)documentURLFromItemID:creatingPlaceholderIfMissing:ignoreAlternateContentsURL:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] Getting URL from itemID: “%@”.", v2);
  OUTLINED_FUNCTION_8_0();
}

void __114__FPDXPCServicer_documentURLFromItemID_creatingPlaceholderIfMissing_ignoreAlternateContentsURL_completionHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  __int16 v6;
  uint64_t v7;
  uint8_t v8[22];
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "providerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  v9 = v6;
  v10 = a2;
  OUTLINED_FUNCTION_9_1(&dword_1CF55F000, a3, v7, "[ERROR] Provider ID %{public}@ is not allowed to provide item ID %@ to consumer ID %@", v8);

  OUTLINED_FUNCTION_4_2();
}

- (void)_forceIngestionForItemID:completionHandler:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend(v0, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] 🥄 Calling forceIngestion for itemID %@ on domain %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_145_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🆕✅ Item creating complete: new item %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __106__FPDXPCServicer_createItemBasedOnTemplate_fields_urlWrapper_options_bounceOnCollision_completionHandler___block_invoke_145_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  OUTLINED_FUNCTION_37();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "itemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = v3;
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v4, "[ERROR] 🆕❌ Create item with ID %@ failed with error %@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_2();
}

- (void)bookmarkableStringFromDocumentURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] Getting bookmarkable string for %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_1_2();
  *(_DWORD *)v0 = 134219010;
  *(_QWORD *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2112;
  *(_QWORD *)(v0 + 14) = v2;
  *(_WORD *)(v0 + 22) = 2080;
  *(_QWORD *)(v0 + 24) = "-[FPDXPCServicer bookmarkableStringFromDocumentURL:completionHandler:]_block_invoke";
  *(_WORD *)(v0 + 32) = 2112;
  *(_QWORD *)(v0 + 34) = 0;
  *(_WORD *)(v0 + 42) = 2112;
  *(_QWORD *)(v0 + 44) = 0;
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v3, v4);
}

void __70__FPDXPCServicer_bookmarkableStringFromDocumentURL_completionHandler___block_invoke_cold_2()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_33();
  objc_msgSend(*(id *)(v0 + 40), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] Successfully generated bookmarkable string “%@” from %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)itemForURL:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_8_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_9_4(v3, v4);
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)itemForURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no provider for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)providerItemIDForURL:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_8_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_9_4(v3, v4);
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)providerItemIDForURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no domain for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)providerItemIDForURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v5, "[DEBUG] caller does not have access to provider %{public}@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_8_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_9_4(v3, v4);
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)fetchFSItemsForItemIdentifiers:providerIdentifier:domainIdentifier:materializingIfNeeded:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] no domain for: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)trashItemAtURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no domain for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)putBackURLForTrashedItemAtURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] Error fetching put-back URL: no domain for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __66__FPDXPCServicer_putBackURLForTrashedItemAtURL_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_27(&dword_1CF55F000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@, nor the %@ entitlement", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_2();
}

- (void)setPutBackInfoOnItemAtURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] Error setting put-back: no domain for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] No provider found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] Provider %@ found via app fallback", v2);
  OUTLINED_FUNCTION_8_0();
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] Provider %@ found via direct fallback", v2);
  OUTLINED_FUNCTION_8_0();
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] Provider %@ found via universal link lookup", v2);
  OUTLINED_FUNCTION_8_0();
}

void __80__FPDXPCServicer_fetchProviderForShareURL_fallbackIdentifier_completionHandler___block_invoke_158_cold_5(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "targetApplicationRecord");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v8;
  _os_log_debug_impl(&dword_1CF55F000, a4, OS_LOG_TYPE_DEBUG, "[DEBUG] potential match %@", a1, 0xCu);

}

- (void)updateLastUsedDate:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)updateLastUsedDate:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no provider for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __55__FPDXPCServicer_updateLastUsedDate_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_27(&dword_1CF55F000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@, nor the %@ entitlement", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_2();
}

- (void)valuesForAttributes:forItemAtURL:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_8_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_9_4(v3, v4);
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)valuesForAttributes:(void *)a1 forItemAtURL:(NSObject *)a2 completionHandler:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no provider for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __69__FPDXPCServicer_valuesForAttributes_forItemAtURL_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 40), "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_27(&dword_1CF55F000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@, nor the %@ entitlement", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_2();
}

void __99__FPDXPCServicer_startOperation_toFetchIconsForAppBundleIDs_requestedSize_scale_completionHandler___block_invoke_178_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] cancelling operation because connection was closed: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke_cold_1()
{
  NSObject *v0;
  void *v1;
  id *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_21();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*v2, "path");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v3, "[ERROR] can't set xattr on %@: %@", v4);

  OUTLINED_FUNCTION_2();
}

void __44__FPDXPCServicer_writeMetadata_onURL_error___block_invoke_cold_2(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*a2, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v3, v4, "[DEBUG] wrote xattr %@ on %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)makeTopologicallySortedItemsOnDisk:(os_log_t)log completionHandler:.cold.1(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_1CF55F000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] faking an fsevent", buf, 2u);
}

- (void)makeTopologicallySortedItemsOnDisk:(_QWORD *)a3 completionHandler:(NSObject *)a4 .cold.2(void *a1, uint8_t *a2, _QWORD *a3, NSObject *a4)
{
  *(_DWORD *)a2 = 138412290;
  *a3 = a1;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a4, (uint64_t)a3, "[DEBUG] already exists at %@", a2);

}

void __71__FPDXPCServicer_makeTopologicallySortedItemsOnDisk_completionHandler___block_invoke_190_cold_1()
{
  NSObject *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_21();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v2, "path");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v3, "[ERROR] can't issue sandbox extension to %@: %@", v4);

  OUTLINED_FUNCTION_2();
}

- (void)updateBlockedProcessNamesForProvider:processNames:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)fetchPathComponentsForURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no provider for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)resolveConflictAtURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no provider for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] importing a domain with known folders is only supported on macOS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] fileproviderd requested to import a domain without sandbox access to the source", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] in-place import is only supported for iCloudDrive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] trying to import a domain with a non-fileURL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)addDomain:forProviderIdentifier:byImportingDirectoryAtURL:nonWrappedURL:userAllowedDBDrop:knownFolders:completionHandler:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] Failed to add domain %{public}@ , it has poisoned UUID - on domain init volume URL to volume UUID failed", v2);
  OUTLINED_FUNCTION_8_0();
}

void __74__FPDXPCServicer_removeAllDomainsForProviderIdentifier_completionHandler___block_invoke_218_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_22_0(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)setIndexingEnabled:forDomainIdentifier:providerIdentifier:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🧹 FPCK launched with unspecified launch type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🧹 FPCK launched with daemon flag", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)runFPCKForDomainWithID:domainRootURL:databaseBackupPath:options:reason:launchType:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] 🧹 FPCK launched with XPC flag", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_230_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, a2, v4, "[ERROR] 🧹 Failed to prepare FPCK session, got error %@", v5);

  OUTLINED_FUNCTION_1_0();
}

void __118__FPDXPCServicer_runFPCKForDomainWithID_domainRootURL_databaseBackupPath_options_reason_launchType_completionHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] 🧹 💔 FP XPC Servicer connection invalidated, forwarding to FPCKService connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)setAlternateContentsURL:onDocumentURL:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)setAlternateContentsURL:(void *)a1 onDocumentURL:(NSObject *)a2 completionHandler:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no provider for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)setAlternateContentsURL:(NSObject *)a1 onDocumentURL:(uint64_t)a2 completionHandler:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[FPDXPCServicer setAlternateContentsURL:onDocumentURL:completionHandler:]";
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a1, a3, "[DEBUG] %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_8_0();
}

- (void)setAlternateContentsURL:onDocumentURL:completionHandler:.cold.4()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_33();
  objc_msgSend(v0, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_22_0(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __74__FPDXPCServicer_setAlternateContentsURL_onDocumentURL_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  OUTLINED_FUNCTION_37();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v2), "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v3;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v5, "[ERROR] Cannot set alternate contents URL on document URL %@: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_2();
}

- (void)fetchAlternateContentsURLForDocumentURL:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_8_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_9_4(v3, v4);
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)fetchAlternateContentsURLForDocumentURL:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] no provider for url: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)fetchAlternateContentsURLForDocumentURL:completionHandler:.cold.3()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_33();
  objc_msgSend(v0, "fp_scopeDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)didUpdateAlternateContentsDocumentForDocumentAtURL:completionHandler:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_33();
  objc_msgSend(v0, "fp_shortDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v2, v3, "[DEBUG] %@ does not have sandbox access to %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __87__FPDXPCServicer_didUpdateAlternateContentsDocumentForDocumentAtURL_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "fp_shortDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "fp_obfuscatedProviderDomainID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412802;
  v13 = v6;
  OUTLINED_FUNCTION_32();
  v14 = v9;
  v15 = v10;
  OUTLINED_FUNCTION_9_1(&dword_1CF55F000, a3, v11, "[ERROR] Cannot alert provider that alternate contents document was updated for document URL %@ on provider %@: %@", (uint8_t *)&v12);

  OUTLINED_FUNCTION_4_2();
}

- (void)appHasNonUploadedFiles:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int16 v4;
  uint8_t *v5;
  os_log_t v6;

  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8524e-34);
  *(_QWORD *)(v3 + 24) = "-[FPDXPCServicer appHasNonUploadedFiles:completionHandler:]";
  *(_WORD *)(v3 + 32) = 1024;
  *(_DWORD *)(v3 + 34) = 0;
  *(_WORD *)(v3 + 38) = v4;
  *(_QWORD *)(v3 + 40) = 0;
  _os_log_debug_impl(&dword_1CF55F000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s %{BOOL}d, %@", v5, 0x30u);
}

- (void)dumpStateTo:limitNumberOfItems:providerFilter:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7_0(&dword_1CF55F000, v0, v1, "[ERROR] need a proper file handle to dump state", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)createDatabaseCopyOutputPathForDomain:completionHandler:.cold.1()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_21();
  objc_msgSend(v0, "providerDomainID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_obfuscatedProviderDomainID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v3, v4, "[DEBUG] FPCK - copything database for domain %@ to %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)createDatabaseCopyOutputPathForDomain:completionHandler:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, (uint64_t)v0, "[ERROR] FPCK - Unable to create output directory at %@ for database copy: %@", v1);
  OUTLINED_FUNCTION_8_0();
}

void __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend((id)OUTLINED_FUNCTION_14(a1), "providerDomainID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_obfuscatedProviderDomainID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v3, v4, "[DEBUG] FPCK - Database for domain %@ was copied at %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __74__FPDXPCServicer_createDatabaseCopyOutputPathForDomain_completionHandler___block_invoke_cold_2()
{
  NSObject *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v2), "providerDomainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_obfuscatedProviderDomainID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fp_prettyDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, v6, "[ERROR] FPCK - Couldn't copy database for domain %@: %@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

- (void)scheduleActionOperationWithInfo:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] starting move operation with info: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)fetchDaemonOperationIDsWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] fetching daemon operations IDs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)fetchDaemonOperationWithID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] fetching daemon operations with id %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)_performWithCheckedEnumerationAttributes:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] no provider associated with the caller, resolving the URL for the item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)_performWithCheckedEnumerationAttributes:(void *)a1 completionHandler:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "enumeratedURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v5, "[DEBUG] Caller does not have sandbox access to %@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)_performWithCheckedEnumerationAttributes:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1CF55F000, v0, v1, "[DEBUG] by-passing entitlement check", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

void __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_21();
  objc_msgSend((id)OUTLINED_FUNCTION_14(v1), "enumeratedItemID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1_5(&dword_1CF55F000, v4, v5, "[DEBUG] Could not find URL for item %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __77__FPDXPCServicer__performWithCheckedEnumerationAttributes_completionHandler___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fp_shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v5, "[DEBUG] Caller does not have sandbox access to %@", v6);

  OUTLINED_FUNCTION_2();
}

- (void)preventDiskImportSchedulerFromRunning:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)dumpIndexerInfoFor:withName:to:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)signalReindexCSIdentifiersByProviderDomainID:indexReason:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_315_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, a3, "[DEBUG] Did finish signaling reindex of items for domain: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void __93__FPDXPCServicer_signalReindexCSIdentifiersByProviderDomainID_indexReason_completionHandler___block_invoke_315_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, a2, v4, "[DEBUG] Found error while attempting to signal items: %@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_test_setDocIDResolutionPolicy:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint8_t *v3;
  os_log_t v4;

  OUTLINED_FUNCTION_14_0();
  *(_DWORD *)v0 = 134218498;
  *(_QWORD *)(v0 + 4) = v1;
  *(_WORD *)(v0 + 12) = 2112;
  *(_QWORD *)(v0 + 14) = v2;
  *(_WORD *)(v0 + 22) = 2080;
  *(_QWORD *)(v0 + 24) = "-[FPDXPCServicer _test_setDocIDResolutionPolicy:completionHandler:]";
  _os_log_debug_impl(&dword_1CF55F000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx ipc: %@, reply of %s @", v3, 0x20u);
}

- (void)_test_callRemoveTrashedItemsOlderThanDate:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __78__FPDXPCServicer__test_callRemoveTrashedItemsOlderThanDate_completionHandler___block_invoke_322_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_22_0(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_simulateInstallOfBundleID:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_simulateUninstallOfBundleID:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_getRootSupportDirURLForDomainURL:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

void __75__FPDXPCServicer__test_getRootSupportDirURLForDomainURL_completionHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_22_0(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_getCountersArray:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_8_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_9_4(v3, v4);
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)_test_getCountersArray:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_0(&dword_1CF55F000, v0, v1, "[DEBUG] no provider for id: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

- (void)_test_resetCounters:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_0_6(v0, v1, v2, 3.8523e-34);
  OUTLINED_FUNCTION_11_2(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)_test_queryDiskImportSchedulerLabel:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_14_0();
  v3 = OUTLINED_FUNCTION_8_4(v0, v1, v2, 3.8524e-34);
  OUTLINED_FUNCTION_9_4(v3, v4);
  OUTLINED_FUNCTION_12(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@, %@", v5, v6);
}

- (void)getSyncPausedXattrForURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 138543618;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] failed to get xattr for %{public}@: %d", (uint8_t *)&v5, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

- (void)pauseSyncForItemAtURL:behavior:bundleID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, v0, (uint64_t)v0, "[ERROR] item %{public}@ already paused by: %@", v1);
  OUTLINED_FUNCTION_8_0();
}

void __76__FPDXPCServicer_pauseSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_22_0(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)resumeSyncForItemAtURL:behavior:bundleID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] bundleID mismatch: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __77__FPDXPCServicer_resumeSyncForItemAtURL_behavior_bundleID_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_3(3.8523e-34, v0, v1, v2);
  OUTLINED_FUNCTION_22_0(v3, v4);
  OUTLINED_FUNCTION_3_6(&dword_1CF55F000, "[DEBUG] ┳%llx ipc: %@, reply of %s %@", v5, v6);
}

- (void)fetchLatestVersionForItemAtURL:bundleID:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] bad bundle id on xattr: %@", v2);
  OUTLINED_FUNCTION_8_0();
}

void __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_352_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_10(&dword_1CF55F000, a3, v5, "[ERROR] failed to get URL for %@: %@", v6);

  OUTLINED_FUNCTION_2();
}

void __63__FPDXPCServicer_listPausedURLsWithBundleID_completionHandler___block_invoke_352_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_23(&dword_1CF55F000, v0, v1, "[ERROR] bad bundleID on xattr: %@, removing from list", v2);
  OUTLINED_FUNCTION_8_0();
}

@end
