@implementation DKReporterRegistry

- (DKReporterRegistry)init
{
  DKReporterRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *generatorLookup;
  uint64_t v5;
  NSMutableDictionary *componentDedup;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DKReporterRegistry;
  v2 = -[DKReporterRegistry init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    generatorLookup = v2->_generatorLookup;
    v2->_generatorLookup = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    componentDedup = v2->_componentDedup;
    v2->_componentDedup = (NSMutableDictionary *)v5;

  }
  return v2;
}

- (id)generatorForComponentIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[DKReporterRegistry generatorLookup](self, "generatorLookup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSSet)components
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[DKReporterRegistry componentDedup](self, "componentDedup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (NSSet)generators
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[DKReporterRegistry generatorLookup](self, "generatorLookup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (void)addExtensionAdapter:(id)a3
{
  id v4;
  DKReporterRegistry *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "extensionAttributes");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = self;
  objc_sync_enter(v5);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v18, "manifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        -[DKReporterRegistry componentDedup](v5, "componentDedup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          if (objc_msgSend(v10, "isNewerThan:", v12))
          {
            -[DKReporterRegistry componentDedup](v5, "componentDedup");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "removeObjectForKey:", v12);

            -[DKReporterRegistry generatorLookup](v5, "generatorLookup");
            v14 = objc_claimAutoreleasedReturnValue();
            -[NSObject removeObjectForKey:](v14, "removeObjectForKey:", v12);
          }
          else
          {
            DiagnosticsKitLogHandleForCategory(1);
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412802;
              v24 = v12;
              v25 = 2112;
              v26 = v10;
              v27 = 2112;
              v28 = v4;
              _os_log_impl(&dword_22DE4C000, v14, OS_LOG_TYPE_DEFAULT, "Replacing component [%@] with newer [%@] from [%@]", buf, 0x20u);
            }
          }

        }
        -[DKReporterRegistry componentDedup](v5, "componentDedup");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v10);

        -[DKReporterRegistry generatorLookup](v5, "generatorLookup");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v4, v10);

        DiagnosticsKitLogHandleForCategory(1);
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v24 = v10;
          v25 = 2112;
          v26 = v4;
          _os_log_impl(&dword_22DE4C000, v17, OS_LOG_TYPE_DEFAULT, "Registered component [%@] from [%@]", buf, 0x16u);
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)enumerateExtensionAdaptersWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[DKReporterRegistry generators](self, "generators", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
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

- (NSMutableDictionary)generatorLookup
{
  return self->_generatorLookup;
}

- (void)setGeneratorLookup:(id)a3
{
  objc_storeStrong((id *)&self->_generatorLookup, a3);
}

- (NSMutableDictionary)componentDedup
{
  return self->_componentDedup;
}

- (void)setComponentDedup:(id)a3
{
  objc_storeStrong((id *)&self->_componentDedup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentDedup, 0);
  objc_storeStrong((id *)&self->_generatorLookup, 0);
}

@end
