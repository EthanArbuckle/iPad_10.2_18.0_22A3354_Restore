@implementation NTKResourceDirectoryScrubber

- (NTKResourceDirectoryScrubber)initWithOperations:(id)a3
{
  id v4;
  NTKResourceDirectoryScrubber *v5;
  NTKResourceDirectoryScrubber *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSObject *v19;
  NSDictionary *operationsMaps;
  NTKResourceDirectoryScrubber *v22;
  id v23;
  id obj;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  uint8_t buf[4];
  NSDictionary *v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)NTKResourceDirectoryScrubber;
  v5 = -[NTKResourceDirectoryScrubber init](&v33, sel_init);
  v6 = v5;
  if (v5)
  {
    v22 = v5;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v23 = v4;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v30 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v12, "supportedExtensions");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v26;
            do
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v26 != v16)
                  objc_enumerationMutation(v13);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * j), "lowercaseString");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v18);

              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
            }
            while (v15);
          }

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v9);
    }

    v6 = v22;
    objc_storeStrong((id *)&v22->_operationsMaps, v7);
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      operationsMaps = v22->_operationsMaps;
      *(_DWORD *)buf = 138412290;
      v35 = operationsMaps;
      _os_log_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_INFO, "[Resource Scrubber]: initialized with operations: %@", buf, 0xCu);
    }

    v4 = v23;
  }

  return v6;
}

- (BOOL)scrubDirectoryAtPath:(id)a3 toDestinationPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v10;
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 0, 0, a5);

    v15 = 0;
    if (v14)
    {
      _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Created directory for sharing. Now traversing the original directory to see if anything needs scrubbing.", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "enumeratorAtPath:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "skipDescendants");
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v19 = v18;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v20)
      {
        v21 = v20;
        v30 = v8;
        v22 = *(_QWORD *)v33;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v11, "URLByAppendingPathComponent:", v24, v30);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "URLByAppendingPathComponent:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[NTKResourceDirectoryScrubber _scrubAssetAtURL:toDestinationURL:error:](self, "_scrubAssetAtURL:toDestinationURL:error:", v25, v26, a5))
            {
              _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                -[NTKResourceDirectoryScrubber scrubDirectoryAtPath:toDestinationPath:error:].cold.2((uint64_t *)a5, v28);

              v15 = 0;
              goto LABEL_23;
            }

          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
          if (v21)
            continue;
          break;
        }
        v15 = 1;
LABEL_23:
        v8 = v30;
      }
      else
      {
        v15 = 1;
      }

    }
    v10 = v31;
  }
  else
  {
    _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[NTKResourceDirectoryScrubber scrubDirectoryAtPath:toDestinationPath:error:].cold.1((uint64_t)v8, (uint64_t)v10, v27);

    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.resourceDirectory"), 2002, 0);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (BOOL)_scrubAssetAtURL:(id)a3 toDestinationURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSDictionary *operationsMaps;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_INFO, "[Resource Scrubber]: Checking if asset at: '%@' needs scrubbing", (uint8_t *)&v19, 0xCu);
  }

  operationsMaps = self->_operationsMaps;
  objc_msgSend(v8, "pathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](operationsMaps, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = objc_msgSend(v14, "scrubAssetAtURL:toDestinationURL:error:", v8, v9, a5);
    if (!a5)
      goto LABEL_12;
    goto LABEL_9;
  }
  _NTKLoggingObjectForDomain(43, (uint64_t)"NTKLoggingDomainGreenfield");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = v8;
    _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_INFO, "[Resource Scrubber]: No scrubbing operations for this asset: '%@'. Passing through.", (uint8_t *)&v19, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v8, v9, a5);

  if (a5)
  {
LABEL_9:
    if ((v15 & 1) == 0 && !*a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.resourceDirectory"), 2001, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_12:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationsMaps, 0);
}

- (void)scrubDirectoryAtPath:(uint64_t)a1 toDestinationPath:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "[Resource Scrubber]: Unable to prepare resource directory for sharing. Original directory: %@. Directory for sharing: %@", (uint8_t *)&v3, 0x16u);
}

- (void)scrubDirectoryAtPath:(uint64_t *)a1 toDestinationPath:(NSObject *)a2 error:.cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a1)
    v2 = *a1;
  else
    v2 = 0;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_ERROR, "[Resource Scrubber]: Scrubbing failed: %@", (uint8_t *)&v3, 0xCu);
}

@end
