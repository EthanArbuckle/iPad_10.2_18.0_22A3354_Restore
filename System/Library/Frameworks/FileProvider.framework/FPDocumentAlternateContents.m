@implementation FPDocumentAlternateContents

- (id)getAlternateContentsURLWrapperForItemID:(id)a3
{
  id v4;
  FPDocumentAlternateContents *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[NSMutableDictionary objectForKeyedSubscript:](v5->_alternateContentsURLDictionary, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v5);

  return v6;
}

- (FPDocumentAlternateContents)initWithAlternateContentsDictionary:(id)a3
{
  id v4;
  FPDocumentAlternateContents *v5;
  uint64_t v6;
  NSMutableDictionary *alternateContentsURLDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPDocumentAlternateContents;
  v5 = -[FPDocumentAlternateContents init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    alternateContentsURLDictionary = v5->_alternateContentsURLDictionary;
    v5->_alternateContentsURLDictionary = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (void)updateWithManagerAlternateContentsDictionary:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  __int128 v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 138412546;
    v15 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v10, v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0;
        +[FPSandboxingURLWrapper wrapperWithURL:extensionClass:error:](FPSandboxingURLWrapper, "wrapperWithURL:extensionClass:error:", v11, "com.apple.fileprovider.read-write", &v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v18;
        if (v12)
        {
          -[FPDocumentAlternateContents setAlternateContentsURLWrapper:forDocumentWithItemID:](self, "setAlternateContentsURLWrapper:forDocumentWithItemID:", v12, v10);
        }
        else
        {
          fp_current_or_default_log();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "fp_shortDescription");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "fp_prettyDescription");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v15;
            v24 = v17;
            v25 = 2112;
            v26 = v16;
            _os_log_error_impl(&dword_1A0A34000, v14, OS_LOG_TYPE_ERROR, "[ERROR] couldn't create a URL wrapper for URL %@: %@ - this means iWork forgot to remove the alternate URL", buf, 0x16u);

          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v7);
  }

}

- (void)setAlternateContentsURLWrapper:(id)a3 forDocumentWithItemID:(id)a4
{
  id v6;
  FPDocumentAlternateContents *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7->_alternateContentsURLDictionary, "setObject:forKeyedSubscript:", v8, v6);
  objc_sync_exit(v7);

}

- (void)removeAlternateContentsURLForDocumentWithItemID:(id)a3
{
  FPDocumentAlternateContents *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_alternateContentsURLDictionary, "setObject:forKeyedSubscript:", 0, v5);
  objc_sync_exit(v4);

}

- (void)dumpToDumper:(id)a3
{
  FPDocumentAlternateContents *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)-[NSMutableDictionary copy](v4->_alternateContentsURLDictionary, "copy");
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v6, "put:", CFSTR(" + alternate contents\n"));
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__FPDocumentAlternateContents_dumpToDumper___block_invoke;
    v7[3] = &unk_1E444F7E8;
    v8 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

  }
  objc_sync_exit(v4);

}

void __44__FPDocumentAlternateContents_dumpToDumper___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "put:", CFSTR("     "));
  objc_msgSend(v15, "domainIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("NSFileProviderDomainDefaultIdentifier"));

  if ((v8 & 1) == 0)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v15, "domainIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "write:", CFSTR("%@"), v10);

  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v15, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "fp_shortDescription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "write:", CFSTR("%@ - %@\n"), v12, v14);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateContentsURLDictionary, 0);
}

@end
