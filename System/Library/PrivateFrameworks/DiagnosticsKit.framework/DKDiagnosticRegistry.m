@implementation DKDiagnosticRegistry

- (DKDiagnosticRegistry)init
{
  DKDiagnosticRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *diagnosticLookup;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DKDiagnosticRegistry;
  v2 = -[DKDiagnosticRegistry init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    diagnosticLookup = v2->_diagnosticLookup;
    v2->_diagnosticLookup = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (id)adapterForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DKDiagnosticRegistry diagnosticLookup](self, "diagnosticLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)diagnosticForIdentifier:(id)a3
{
  void *v3;
  void *v4;

  -[DKDiagnosticRegistry adapterForIdentifier:](self, "adapterForIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSArray)diagnostics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  -[DKDiagnosticRegistry diagnosticLookup](self, "diagnosticLookup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[DKDiagnosticRegistry diagnosticLookup](self, "diagnosticLookup", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "extensionAttributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return (NSArray *)v5;
}

- (void)addExtensionAdapter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  char *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  char *v25;
  _BYTE v26[22];
  __int16 v27;
  const char *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "extensionAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DKDiagnosticRegistry diagnosticLookup](self, "diagnosticLookup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v6);
  -[DKDiagnosticRegistry diagnosticLookup](self, "diagnosticLookup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_9;
  objc_msgSend(v9, "extensionAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DiagnosticsKitLogHandleForCategory(1);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "version");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v13 = (char *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "version");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138413314;
    *(_QWORD *)&v26[4] = v5;
    *(_WORD *)&v26[12] = 2112;
    *(_QWORD *)&v26[14] = v12;
    v27 = 2112;
    v28 = v13;
    v29 = 2112;
    v30 = v10;
    v31 = 2112;
    v32 = v14;
    _os_log_impl(&dword_22DE4C000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to register a diagnostic [%@] with version [%@], but the identifier [%@] is already in use by [%@] with version [%@].", v26, 0x34u);

  }
  objc_msgSend(v10, "version");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "version");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "compare:options:", v16, 64);

  DiagnosticsKitLogHandleForCategory(1);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = "not ";
    *(_DWORD *)v26 = 138412802;
    *(_QWORD *)&v26[4] = v19;
    *(_WORD *)&v26[12] = 2080;
    if (v17 == -1)
      v20 = "";
    *(_QWORD *)&v26[14] = v20;
    v27 = 2080;
    v28 = v20;
    _os_log_impl(&dword_22DE4C000, v18, OS_LOG_TYPE_DEFAULT, "New extension for ID [%@] will %sreplace the existing extension because its version is %shigher", v26, 0x20u);

  }
  if (v17 == -1)
  {
LABEL_9:
    -[DKDiagnosticRegistry diagnosticLookup](self, "diagnosticLookup", *(_OWORD *)v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v4, v22);

    DiagnosticsKitLogHandleForCategory(1);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "version");
      v25 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v26 = 138412802;
      *(_QWORD *)&v26[4] = v5;
      *(_WORD *)&v26[12] = 2112;
      *(_QWORD *)&v26[14] = v24;
      v27 = 2112;
      v28 = v25;
      _os_log_impl(&dword_22DE4C000, v23, OS_LOG_TYPE_DEFAULT, "Registered diagnostic [%@] with Test ID [%@] and Version [%@]", v26, 0x20u);

    }
  }

  objc_sync_exit(v6);
}

- (void)enumerateExtensionAdaptersWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[DKDiagnosticRegistry diagnosticLookup](self, "diagnosticLookup", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (Class)extensionClass
{
  return (Class)objc_opt_class();
}

- (Class)responseObjectClass
{
  return (Class)objc_opt_class();
}

- (NSMutableDictionary)diagnosticLookup
{
  return self->_diagnosticLookup;
}

- (void)setDiagnosticLookup:(id)a3
{
  objc_storeStrong((id *)&self->_diagnosticLookup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_diagnosticLookup, 0);
}

@end
