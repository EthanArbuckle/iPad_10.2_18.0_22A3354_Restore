@implementation NSURL(DESandboxExtension)

- (id)generateSandboxExtensionForProcess:()DESandboxExtension
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v17;

  Log_3();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:].cold.5(a1, a3, v5);

  v6 = objc_retainAutorelease(a1);
  v7 = objc_msgSend(v6, "fileSystemRepresentation");
  if (!v7)
  {
    Log_3();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:].cold.1(v6, v10);
    goto LABEL_17;
  }
  v8 = v7;
  v17 = 0;
  v9 = objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", &v17);
  v10 = v17;
  if ((v9 & 1) == 0)
  {
    Log_3();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:].cold.4(v8, v10);

    goto LABEL_17;
  }
  v11 = (void *)sandbox_extension_issue_file_to_process_by_pid();
  Log_3();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:].cold.2(v6, a3, v13);

LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:].cold.3(v6, a3, v13);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  free(v11);
LABEL_18:

  return v14;
}

- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:
{
  id v6;
  void (**v7)(id, void *);
  NSObject *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int *v16;
  char *v17;
  const char *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6 && objc_msgSend(v6, "length"))
  {
    objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    if (sandbox_extension_consume() == -1)
    {
      v14 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = __error();
      v17 = strerror(*v16);
      v18 = "Unknown";
      if (v17)
        v18 = v17;
      objc_msgSend(v14, "stringWithFormat:", CFSTR("Failed to consume extension token for [%@] due to error: %s"), v15, v18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), 0, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v7[2](v7, v21);
    }
    else
    {
      Log_3();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[NSURL(DESandboxExtension) accessWithSandboxExtension:inBlock:].cold.3(a1);

      v7[2](v7, 0);
      v9 = sandbox_extension_release();
      Log_3();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9 == -1)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[NSURL(DESandboxExtension) accessWithSandboxExtension:inBlock:].cold.1(a1);
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        -[NSURL(DESandboxExtension) accessWithSandboxExtension:inBlock:].cold.2(a1);
      }
    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25[0] = CFSTR("nil sandbox extension token. Do not try attempt to consume a token more than once.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("DEExtensionErrorDomain"), 0, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v7[2](v7, v11);
  }

}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3;
  v6 = CFSTR("-");
  if (v3)
    v6 = (const __CFString *)v3;
  v7 = 138543362;
  v8 = v6;
  OUTLINED_FUNCTION_0_1(&dword_1A4EEE000, a2, v4, "Failed to get file system representation for file with URL: %{public}@. This DiagnosticExtension may not have appropriate access to the specified item.", (uint8_t *)&v7);

  OUTLINED_FUNCTION_0();
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = __error();
  strerror(*v5);
  v7 = 138543874;
  v8 = v4;
  OUTLINED_FUNCTION_13();
  v9 = 2080;
  v10 = v6;
  _os_log_error_impl(&dword_1A4EEE000, a3, OS_LOG_TYPE_ERROR, "Failed to grant RW sandbox extension for attachment item [%{public}@] for PID: %d with error: %s. This DiagnosticExtension may not have appropriate access to the specified item.", (uint8_t *)&v7, 0x1Cu);

  OUTLINED_FUNCTION_10_0();
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.3(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_13();
  _os_log_debug_impl(&dword_1A4EEE000, a3, OS_LOG_TYPE_DEBUG, "Granted RW sandbox extension for [%{public}@] to process with PID: %d.", v5, 0x12u);

  OUTLINED_FUNCTION_3();
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_1(&dword_1A4EEE000, v3, v4, "Cannot grant sandbox extension for unreachable item with path '%s' due to error %@. This DiagnosticExtension may not have appropriate access to the specified item.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)generateSandboxExtensionForProcess:()DESandboxExtension .cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 136446722;
  v7 = "-[NSURL(DESandboxExtension) generateSandboxExtensionForProcess:]";
  OUTLINED_FUNCTION_13();
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_1A4EEE000, a3, OS_LOG_TYPE_DEBUG, "%{public}s with pid: [%d] url [%{public}@]", (uint8_t *)&v6, 0x1Cu);

  OUTLINED_FUNCTION_10_0();
}

- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:.cold.1(void *a1)
{
  void *v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_2_1(&dword_1A4EEE000, v3, v4, "Failed to release sandbox extension for file [%@] due to error: %s", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0();
}

- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v2, v3, "Released sandbox extension handle for file at path [%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

- (void)accessWithSandboxExtension:()DESandboxExtension inBlock:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1(&dword_1A4EEE000, v2, v3, "Extending sandbox for file at path [%@]", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

@end
