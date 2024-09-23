@implementation ASTConnectionSession

- (ASTConnectionSession)initWithIdentities:(id)a3 ticket:(id)a4 requestQueuedSuiteInfo:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  ASTConnectionSession *v10;
  ASTConnectionSession *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  ASTConnectionSession *v24;
  id v25;
  id obj;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v32.receiver = self;
  v32.super_class = (Class)ASTConnectionSession;
  v10 = -[ASTMaterializedConnection init](&v32, sel_init);
  v11 = v10;
  if (v10)
  {
    v24 = v10;
    v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v8;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", v24);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "json");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("identifiers"));

          if (v9 && (objc_msgSend(v9, "isEqualToString:", CFSTR("IN_CURRENT_SESSION")) & 1) == 0)
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, CFSTR("ticketNumber"));
          if (v5)
            objc_msgSend(v18, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("queuedSuiteInfo"));
          objc_msgSend(v12, "addObject:", v18);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v14);
    }

    v27 = 0;
    +[ASTEncodingUtilities jsonSerializeObject:error:](ASTEncodingUtilities, "jsonSerializeObject:error:", v12, &v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;
    if (v20)
    {
      v11 = v24;
      -[ASTMaterializedConnection addBody:gzip:](v24, "addBody:gzip:", v20, +[ASTConnectionUtilities isGzipEnabled](ASTConnectionUtilities, "isGzipEnabled"));
    }
    else
    {
      ASTLogHandleForCategory(0);
      v22 = objc_claimAutoreleasedReturnValue();
      v11 = v24;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[ASTConnectionSession initWithIdentities:ticket:requestQueuedSuiteInfo:].cold.1((uint64_t)v21, v22);

    }
    v8 = v25;
    -[ASTConnectionSession _addTokenToHeaderField](v11, "_addTokenToHeaderField", v24);

  }
  return v11;
}

- (void)_addTokenToHeaderField
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(MEMORY[0x24BE15A68], "isCheckerBoardActive"))
  {
    objc_msgSend(MEMORY[0x24BE15A68], "proxyServer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "server");
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (void *)v5;
        objc_msgSend(v4, "port");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = (void *)v7;
          objc_msgSend(v4, "token");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            ASTLogHandleForCategory(0);
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v4, "token");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = 138412290;
              v15 = v11;
              _os_log_impl(&dword_22D91B000, v10, OS_LOG_TYPE_DEFAULT, "Set token for session's header: %@", (uint8_t *)&v14, 0xCu);

            }
            -[ASTMaterializedConnection request](self, "request");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "token");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setValue:forHTTPHeaderField:", v13, CFSTR("Token"));

          }
        }
        else
        {

        }
      }
    }

  }
}

- (void)initWithIdentities:(uint64_t)a1 ticket:(NSObject *)a2 requestQueuedSuiteInfo:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22D91B000, a2, OS_LOG_TYPE_ERROR, "JSON serialization failed with error: %@", (uint8_t *)&v2, 0xCu);
}

@end
