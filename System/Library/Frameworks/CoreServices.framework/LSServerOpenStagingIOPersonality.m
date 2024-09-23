@implementation LSServerOpenStagingIOPersonality

- (id)mainUserContainerURL
{
  return (id)objc_msgSend((id)__LSDefaultsGetSharedInstance(), "userContainerURL");
}

- (id)mainSystemContainerURL
{
  return (id)objc_msgSend((id)__LSDefaultsGetSharedInstance(), "systemContainerURL");
}

- (id)makeStagingDirectoryNodeInContainer:(id)a3 error:(id *)a4
{
  void *v5;
  FSNode *v6;
  id v7;
  id v9;

  makeStagingDirectoryURLInContainer(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9 = 0;
    v6 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v5, 8, &v9);
    v7 = v9;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }

  if (a4 && !v6)
    *a4 = objc_retainAutorelease(v7);

  return v6;
}

- (optional<LaunchServices::StagingDirectoryInfo>)stagingDirectoryInfoForPersonaUniqueString:(SEL)a3 error:(id)a4
{
  id v7;
  uint64_t path;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  FSNode *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  optional<LaunchServices::StagingDirectoryInfo> *result;
  id v19;
  FSNode *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v22 = v7;
  retstr->var0.var0 = 0;
  retstr->var1 = 0;
  container_query_create();
  container_query_set_class();
  objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  container_query_set_persona_unique_string();
  container_query_operation_set_flags();
  if (!container_query_get_single_result())
  {
    container_query_get_last_error();
    v15 = (void *)container_error_copy_unlocalized_description();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v15);
    free(v15);
    LODWORD(v15) = container_error_get_posix_errno();
    v25 = CFSTR("ContainerErrorDescription");
    v26[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2F90], (int)v15, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]", 126, v11);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  path = container_get_path();
  if (path)
  {
    _LSDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:].cold.2(path, v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", path, 1, 0);
    makeStagingDirectoryURLInContainer(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v21 = -1;
      v12 = (void *)container_copy_sandbox_token();
      if (v12)
      {
        v21 = sandbox_extension_consume();
        if (v21 < 0)
        {
          v16 = *__error();
          _LSDefaultLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            -[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:].cold.1(v16, v17);

          _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], v16, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]", 142, 0);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          free(v12);
          goto LABEL_20;
        }
        free(v12);
      }
      v19 = 0;
      v13 = -[FSNode initWithURL:flags:error:]([FSNode alloc], "initWithURL:flags:error:", v11, 8, &v19);
      v14 = v19;
      v20 = v13;
      if (v13)
      {
        std::optional<LaunchServices::OpenStaging::StagingDirectoryInfo>::emplace[abi:nn180100]<NSString * {__strong}&,FSNode * {__strong}&,long long &,void>((LaunchServices::OpenStaging::StagingDirectoryInfo *)retstr, &v22, (void **)&v20, &v21);

      }
      if (!retstr->var1 && (v21 & 0x8000000000000000) == 0)
        sandbox_extension_release();
    }
    else
    {
      v14 = 0;
    }
LABEL_20:

    goto LABEL_21;
  }
  v23 = *MEMORY[0x1E0CB2938];
  v24 = CFSTR("No path in container");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], 96, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]", 158, v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_21:

  if (a5 && !retstr->var1)
    *a5 = objc_retainAutorelease(v14);

  return result;
}

- (optional<unsigned)stagingDirectoryKeyForNode:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  id v7;
  int *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $BEC950A715106DE229A2E4BA1089E24D v13;
  _BOOL8 v14;
  id v15;
  char v16[1024];
  statfs v17;
  uint64_t v18;
  optional<unsigned long long> result;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0;
  v6 = objc_msgSend(v5, "getFileSystemRepresentation:error:", v16, &v15);
  v7 = v15;
  if (v6)
  {
    if (!statfs(v16, &v17))
    {
      v10 = v17.f_fsid.val[0] & 0xFFFFFFFFFFFFFF00;
      v12 = LOBYTE(v17.f_fsid.val[0]);
      v11 = 1;
      goto LABEL_8;
    }
    v8 = __error();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], *v8, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryKeyForNode:error:]", 194, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v9;
  }
  if (a4)
  {
    v7 = objc_retainAutorelease(v7);
    v10 = 0;
    v11 = 0;
    v12 = 0;
    *a4 = v7;
  }
  else
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
  }
LABEL_8:

  v13.__val_ = v12 | v10;
  v14 = v11;
  result.__engaged_ = v14;
  result.var0 = v13;
  return result;
}

- (optional<unsigned)stagingDirectoryKeyForFileHandle:(id)a3 error:(id *)a4
{
  id v5;
  int *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  $BEC950A715106DE229A2E4BA1089E24D v11;
  _BOOL8 v12;
  statfs v13;
  uint64_t v14;
  optional<unsigned long long> result;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (fstatfs(objc_msgSend(v5, "fileDescriptor"), &v13))
  {
    v6 = __error();
    _LSMakeNSErrorImpl((void *)*MEMORY[0x1E0CB2FE0], *v6, (uint64_t)"-[LSServerOpenStagingIOPersonality stagingDirectoryKeyForFileHandle:error:]", 211, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v7 = objc_retainAutorelease(v7);
      v8 = 0;
      v9 = 0;
      v10 = 0;
      *a4 = v7;
    }
    else
    {
      v8 = 0;
      v9 = 0;
      v10 = 0;
    }
  }
  else
  {
    v7 = 0;
    v8 = v13.f_fsid.val[0] & 0xFFFFFFFFFFFFFF00;
    v10 = LOBYTE(v13.f_fsid.val[0]);
    v9 = 1;
  }

  v11.__val_ = v10 | v8;
  v12 = v9;
  result.__engaged_ = v12;
  result.var0 = v11;
  return result;
}

- (void)stagingDirectoryInfoForPersonaUniqueString:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446466;
  v3 = "-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]";
  v4 = 1024;
  v5 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Failed to consume container sandbox token, errno = %{darwin.errno}d", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)stagingDirectoryInfoForPersonaUniqueString:(uint64_t)a1 error:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136446467;
  v3 = "-[LSServerOpenStagingIOPersonality stagingDirectoryInfoForPersonaUniqueString:error:]";
  v4 = 2081;
  v5 = a1;
  _os_log_debug_impl(&dword_182882000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: got user container URL %{private}s from containermanagerd", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
