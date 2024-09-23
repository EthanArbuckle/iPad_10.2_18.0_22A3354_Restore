@implementation NSURL(LNSandboxExtension)

- (id)ln_sandboxExtendedURLWithAuditToken:()LNSandboxExtension
{
  id v5;
  __int128 v6;
  const char *v7;
  void *v8;
  void *v9;
  NSObject *v11;
  int *v12;
  char *v13;
  _BYTE v14[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v5, "fileSystemRepresentation");
  v6 = a3[1];
  *(_OWORD *)v14 = *a3;
  *(_OWORD *)&v14[16] = v6;
  v7 = (const char *)sandbox_extension_issue_file_to_process();

  if (v7)
  {
    v8 = (void *)objc_msgSend(a1, "copy", *(_OWORD *)v14, *(_OWORD *)&v14[16]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v7, strlen(v7) + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1A1B0F0D4](v8, v9);

    return v8;
  }
  else
  {
    getLNLogCategoryGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)v14 = 138412546;
      *(_QWORD *)&v14[4] = a1;
      *(_WORD *)&v14[12] = 2080;
      *(_QWORD *)&v14[14] = v13;
      _os_log_impl(&dword_1A18F6000, v11, OS_LOG_TYPE_ERROR, "Could not create sandbox read extension for file URL %@, error: %s", v14, 0x16u);
    }

    return a1;
  }
}

@end
