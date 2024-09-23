@implementation _LSDRebuildClient

- (_LSDRebuildClient)initWithXPCConnection:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  int v8;
  _LSDRebuildClient *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[8];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("application-identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.DataMigrator"));

    if ((v6 & 1) != 0)
      goto LABEL_6;
  }
  else
  {

  }
  objc_msgSend(v4, "_xpcConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _LSCheckEntitlementForXPCConnection(v7, CFSTR("com.apple.private.coreservices.can-perform-rebuild-registration"));

  if (v8)
  {
LABEL_6:
    v12.receiver = self;
    v12.super_class = (Class)_LSDRebuildClient;
    v9 = -[_LSDClient initWithXPCConnection:](&v12, sel_initWithXPCConnection_, v4);
    goto LABEL_10;
  }
  _LSDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[_LSDRebuildClient initWithXPCConnection:].cold.1(buf, objc_msgSend(v4, "processIdentifier"), v10);

  v9 = 0;
LABEL_10:

  return v9;
}

- (void)performRebuildRegistration:(id)a3 personaUniqueStrings:(id)a4 reply:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void (**v26)(id, id);
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v25 = v8;
  v26 = (void (**)(id, id))a5;
  if (!v8)
    goto LABEL_14;
  v28 = 0;
  v9 = v7;
  v24 = v8;
  +[_LSPersonaDatabase sharedInstance]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_LSPersonaDatabase personasWithAttributesForPersonaUniqueStrings:error:]((uint64_t)v10, v11, &v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v9;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v13);
          v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v16), "mutableCopy");
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, CFSTR("LSPersonaUniqueStrings"));
          v18 = (void *)objc_msgSend(v17, "copy");
          objc_msgSend(v7, "addObject:", v18);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }

  }
  else
  {
    v7 = 0;
  }

  v19 = v28;
  if (v7)
  {

LABEL_14:
    v27 = 0;
    v20 = _LSServer_PerformExternalRebuildRegistration(v7, &v27);
    v21 = v27;
    if (!v20)
    {
      _LSInstallLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[_LSDRebuildClient performRebuildRegistration:personaUniqueStrings:reply:].cold.1((uint64_t)v21, v22);

    }
    v26[2](v26, v21);

    goto LABEL_22;
  }
  _LSDefaultLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[_LSDRebuildClient performRebuildRegistration:personaUniqueStrings:reply:].cold.2((uint64_t)v24, (uint64_t)v19, v23);

  v26[2](v26, v19);
  v7 = v19;
LABEL_22:

}

- (void)noteMigratorRunningWithReply:(id)a3
{
  void (**v3)(id, _QWORD);
  NSObject *v4;
  uint8_t v5[16];

  v3 = (void (**)(id, _QWORD))a3;
  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Noting migrator running.", v5, 2u);
  }

  _LSServer_NoteMigratorRunningInMigration();
  v3[2](v3, 0);

}

- (void)initWithXPCConnection:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *((_DWORD *)buf + 1) = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Connecting pid %d is not entitled to perform rebuild registrations.", buf, 8u);
}

- (void)performRebuildRegistration:(uint64_t)a1 personaUniqueStrings:(NSObject *)a2 reply:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "could not perform rebuild registration: %@", (uint8_t *)&v2, 0xCu);
}

- (void)performRebuildRegistration:(uint64_t)a1 personaUniqueStrings:(uint64_t)a2 reply:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_182882000, log, OS_LOG_TYPE_ERROR, "Could not look up personas given unique strings %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
