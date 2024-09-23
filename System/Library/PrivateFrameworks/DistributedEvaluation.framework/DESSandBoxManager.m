@implementation DESSandBoxManager

+ (id)sandboxExtensionsToXPCConnection:(id)a3 fileURLs:(id)a4 requireWrite:(BOOL)a5 outError:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  id v23;
  const char *v24;
  void *v25;
  void *v26;
  int *v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id *v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[2];
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (a3 && v8)
  {
    v37 = a6;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(a3, "auditToken");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[DESSandBoxManager sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:].cold.2((uint64_t)v9, v12, v13, v14, v15, v16, v17, v18);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v9;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v40 != v21)
            objc_enumerationMutation(obj);
          v23 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i));
          objc_msgSend(v23, "fileSystemRepresentation");
          v24 = (const char *)sandbox_extension_issue_file_to_process();
          v25 = (void *)MEMORY[0x1E0CB3940];
          if (!v24)
          {
            v27 = __error();
            objc_msgSend(v25, "stringWithFormat:", CFSTR("fileURL=%@: error=%s\n"), v23, strerror(*v27));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            +[DESLogging coreChannel](DESLogging, "coreChannel");
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              +[DESSandBoxManager sandboxExtensionsToXPCConnection:fileURLs:requireWrite:outError:].cold.1((uint64_t)v28, v29, v30);

            if (v37)
            {
              v31 = (void *)MEMORY[0x1E0CB35C8];
              v32 = *MEMORY[0x1E0CB2D50];
              v46[0] = v28;
              v33 = *MEMORY[0x1E0CB3388];
              v45[0] = v32;
              v45[1] = v33;
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v46[1] = v34;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 7001, v35);
              *v37 = (id)objc_claimAutoreleasedReturnValue();

            }
            v10 = 0;
            goto LABEL_19;
          }
          v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v24, strlen(v24), 4, 1);
          objc_msgSend(v11, "addObject:", v26);

        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
        if (v20)
          continue;
        break;
      }
    }

    v10 = v11;
LABEL_19:

  }
  return v10;
}

- (DESSandBoxManager)initWithExtensions:(id)a3
{
  id v4;
  DESSandBoxManager *v5;
  uint64_t v6;
  NSArray *extensions;
  NSMutableArray *v8;
  NSMutableArray *consumedSandboxExtensions;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DESSandBoxManager;
  v5 = -[DESSandBoxManager init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    extensions = v5->_extensions;
    v5->_extensions = (NSArray *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    consumedSandboxExtensions = v5->_consumedSandboxExtensions;
    v5->_consumedSandboxExtensions = v8;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[DESSandBoxManager releaseExtensions](self, "releaseExtensions");
  v3.receiver = self;
  v3.super_class = (Class)DESSandBoxManager;
  -[DESSandBoxManager dealloc](&v3, sel_dealloc);
}

- (BOOL)consumeExtensionsWithError:(id *)a3
{
  NSArray **p_extensions;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  NSMutableArray *consumedSandboxExtensions;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  int *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _QWORD v34[2];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  p_extensions = &self->_extensions;
  if (-[NSArray count](self->_extensions, "count"))
  {
    +[DESLogging coreChannel](DESLogging, "coreChannel");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[DESSandBoxManager consumeExtensionsWithError:].cold.2((uint64_t)p_extensions, v6, v7, v8, v9, v10, v11, v12);

  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = *p_extensions;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i)), "UTF8String");
        v18 = sandbox_extension_consume();
        if (v18 == -1)
        {
          +[DESLogging coreChannel](DESLogging, "coreChannel");
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            -[DESSandBoxManager consumeExtensionsWithError:].cold.1(v21);

          if (a3)
          {
            v22 = (void *)MEMORY[0x1E0CB35C8];
            v33[0] = *MEMORY[0x1E0CB2D50];
            v23 = (void *)MEMORY[0x1E0CB3940];
            v24 = __error();
            objc_msgSend(v23, "stringWithFormat:", CFSTR("Error consuming sandbox extension: %s"), strerror(*v24));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v34[0] = v25;
            v33[1] = *MEMORY[0x1E0CB3388];
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v34[1] = v26;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("kDESDistributedEvaluationErrorDomain"), 7000, v27);
            *a3 = (id)objc_claimAutoreleasedReturnValue();

            LOBYTE(a3) = 0;
          }
          goto LABEL_18;
        }
        consumedSandboxExtensions = self->_consumedSandboxExtensions;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](consumedSandboxExtensions, "addObject:", v20);

      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      if (v15)
        continue;
      break;
    }
  }
  LOBYTE(a3) = 1;
LABEL_18:

  return (char)a3;
}

- (void)releaseExtensions
{
  OUTLINED_FUNCTION_0_2(&dword_1B96E5000, a2, a3, "Releasing consumed sandbox extensions: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_consumedSandboxExtensions, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
}

+ (void)sandboxExtensionsToXPCConnection:(uint64_t)a3 fileURLs:requireWrite:outError:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a2, a3, "Failed to issue sandbox extension: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

+ (void)sandboxExtensionsToXPCConnection:(uint64_t)a3 fileURLs:(uint64_t)a4 requireWrite:(uint64_t)a5 outError:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B96E5000, a2, a3, "Issuing sandbox extension for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)consumeExtensionsWithError:(NSObject *)a1 .cold.1(NSObject *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  int v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  v3 = strerror(*v2);
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_3(&dword_1B96E5000, a1, v4, "Error consuming sandbox extension: %s", (uint8_t *)&v5);
}

- (void)consumeExtensionsWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B96E5000, a2, a3, "Consuming sandbox extensions: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
