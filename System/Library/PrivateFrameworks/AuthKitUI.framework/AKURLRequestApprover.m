@implementation AKURLRequestApprover

- (AKURLRequestApprover)initWithWhitelistedPaths:(id)a3
{
  id v4;
  AKURLRequestApprover *v5;
  uint64_t v6;
  NSArray *whiteListedPaths;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKURLRequestApprover;
  v5 = -[AKURLRequestApprover init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    whiteListedPaths = v5->_whiteListedPaths;
    v5->_whiteListedPaths = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)shouldAllowRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSObject *v11;

  if (!self->_whiteListedPaths)
    return 1;
  v4 = (void *)MEMORY[0x1E0CB3998];
  objc_msgSend(a3, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsWithURL:resolvingAgainstBaseURL:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[AKURLRequestApprover _matchInputAgainstPaths:](self, "_matchInputAgainstPaths:", v9);
  _AKLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[AKURLRequestApprover shouldAllowRequest:].cold.1(v10, (uint64_t)v9, v11);

  return v10;
}

- (BOOL)_matchInputAgainstPaths:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = self->_whiteListedPaths;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v6)
  {
    v8 = *(_QWORD *)v15;
    *(_QWORD *)&v7 = 138412546;
    v13 = v7;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v4, "hasPrefix:", v10, v13, (_QWORD)v14) & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_13;
        }
        _AKLogSystem();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v13;
          v19 = v10;
          v20 = 2112;
          v21 = v4;
          _os_log_debug_impl(&dword_1BD795000, v11, OS_LOG_TYPE_DEBUG, "Failed to match path: %@ > %@", buf, 0x16u);
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_13:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whiteListedPaths, 0);
}

- (void)shouldAllowRequest:(NSObject *)a3 .cold.1(char a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a1 & 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_debug_impl(&dword_1BD795000, a3, OS_LOG_TYPE_DEBUG, "Made redirection decision (%@) for <%@>", (uint8_t *)&v6, 0x16u);

}

@end
