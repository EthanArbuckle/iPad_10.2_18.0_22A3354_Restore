@implementation FPFileManagerFixPermDelegate

- (BOOL)fileManager:(id)a3 shouldRemoveItemAtURL:(id)a4
{
  id v4;
  int v5;
  int v6;
  uint64_t v7;
  char v8;
  id v9;
  id v10;
  NSObject *v11;
  __CFFileSecurity *v12;
  NSObject *v13;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  id v22;
  id v23;
  stat v24;

  v4 = objc_retainAutorelease(a4);
  v5 = open((const char *)objc_msgSend(v4, "fileSystemRepresentation"), 260);
  if ((v5 & 0x80000000) == 0)
  {
    v6 = v5;
    memset(&v24, 0, sizeof(v24));
    if (fstat(v5, &v24) < 0)
    {
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.2();
    }
    else
    {
      if ((v24.st_flags & 2) == 0 || (fchflags(v6, v24.st_flags & 0xFFFFFFFD) & 0x80000000) == 0)
      {
        v23 = 0;
        v7 = *MEMORY[0x1E0C99990];
        v22 = 0;
        v8 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v23, v7, &v22);
        v9 = v23;
        v10 = v22;
        if ((v8 & 1) == 0)
        {
          fp_current_or_default_log();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.6();

        }
        if (v9)
        {
          v12 = (__CFFileSecurity *)objc_alloc_init(MEMORY[0x1E0C99DA8]);
          if (!CFFileSecuritySetAccessControlList(v12, (acl_t)1))
          {
            fp_current_or_default_log();
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              -[NSURL(FPFSHelpers) fp_withReadWriteAccess:].cold.9();

          }
          v21 = v10;
          v14 = objc_msgSend(v4, "setResourceValue:forKey:error:", v12, v7, &v21);
          v15 = v21;

          if ((v14 & 1) == 0)
          {
            fp_current_or_default_log();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.4();

            close(v6);
            goto LABEL_31;
          }

        }
        else
        {
          v15 = v10;
        }
        if ((v24.st_mode & 0x80) == 0 && fchmod(v6, v24.st_mode | 0x80) < 0)
        {
          fp_current_or_default_log();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.3();

        }
        close(v6);
LABEL_31:

        goto LABEL_35;
      }
      fp_current_or_default_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.7();
    }

    close(v6);
    goto LABEL_35;
  }
  fp_current_or_default_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[FPFileManagerFixPermDelegate fileManager:shouldRemoveItemAtURL:].cold.1();

LABEL_35:
  return 1;
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12_1();
  v0 = OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8_1(&dword_1A0A34000, v1, v2, "[ERROR] can't open file at \"%s\" : %s %{errno}d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_11_1();
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12_1();
  v0 = OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8_1(&dword_1A0A34000, v1, v2, "[ERROR] can't stat file at \"%s\" : %s %{errno}d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_11_1();
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12_1();
  v0 = OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8_1(&dword_1A0A34000, v1, v2, "[ERROR] can't fixup permissions of \"%s\" for write operation : %s %{errno}d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_11_1();
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_21_0();
  objc_msgSend((id)OUTLINED_FUNCTION_24_0(v0, v1), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] can't remove ACL from \"%s\" : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.6()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_21_0();
  objc_msgSend((id)OUTLINED_FUNCTION_24_0(v0, v1), "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] can't fetch file security info from \"%s\" : %@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)fileManager:shouldRemoveItemAtURL:.cold.7()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_12_1();
  v0 = OUTLINED_FUNCTION_19_1();
  OUTLINED_FUNCTION_3_1(v0);
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_8_1(&dword_1A0A34000, v1, v2, "[ERROR] can't fixup UF_IMMUTABLE flag of \"%s\" for write operation : %s %{errno}d", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_11_1();
}

@end
