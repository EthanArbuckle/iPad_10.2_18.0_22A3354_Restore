@implementation BCChatAction

+ (void)openTranscript:(NSString *)businessIdentifier intentParameters:(NSDictionary *)intentParameters
{
  NSDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = intentParameters;
  objc_msgSend(CFSTR("https://bcrw.apple.com/urn:biz:"), "stringByAppendingString:", businessIdentifier);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v6, 0);
  v8 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v5;
  v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        -[NSDictionary objectForKey:](v9, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", v14, v15);
        objc_msgSend(v8, "addObject:", v16);

      }
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "setQueryItems:", v8);
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __48__BCChatAction_openTranscript_intentParameters___block_invoke;
  v22[3] = &unk_24E064F48;
  v23 = v7;
  v20 = v7;
  objc_msgSend(v17, "openURL:configuration:completionHandler:", v18, v19, v22);

}

void __48__BCChatAction_openTranscript_intentParameters___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "URL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v7;
      v10 = 2112;
      v11 = v4;
      _os_log_error_impl(&dword_21C655000, v6, OS_LOG_TYPE_ERROR, "BCChatAction: Failed to open chat url: %@. Error %@", (uint8_t *)&v8, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_21C655000, v6, OS_LOG_TYPE_DEFAULT, "BCChatAction: Success opening chat url: %@", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }

}

@end
