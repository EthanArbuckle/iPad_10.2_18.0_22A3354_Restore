@implementation NSURL(BRCPathAdditions)

+ (id)brc_fileURLWithFileDescriptor:()BRCPathAdditions
{
  char *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  int *v10;
  __int128 v12;
  uint64_t v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  _OWORD v20[65];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12 = xmmword_19CC7D9B0;
  v13 = 0;
  memset(v20, 0, 512);
  if (fgetattrlist(a3, &v12, v20, 0x410uLL, 0x20u) < 0)
  {
    v7 = *__error();
    brc_bread_crumbs((uint64_t)"+[NSURL(BRCPathAdditions) brc_fileURLWithFileDescriptor:]", 39);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 67109634;
      v15 = a3;
      v16 = 1024;
      v17 = v7;
      v18 = 2112;
      v19 = v8;
      _os_log_error_impl(&dword_19CBF0000, v9, (os_log_type_t)0x90u, "[ERROR] fgetattrlist(%d) failed %{errno}d%@", buf, 0x18u);
    }

    v10 = __error();
    v6 = 0;
    *v10 = v7;
  }
  else
  {
    v4 = (char *)v20 + SDWORD2(v20[0]) + 8;
    v5 = objc_alloc(MEMORY[0x1E0C99E98]);
    v6 = (void *)objc_msgSend(v5, "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v4, (WORD2(v20[0]) & 0xF000) == 0x4000, 0);
  }
  return v6;
}

+ (id)brc_fileURLWithVolumeDeviceID:()BRCPathAdditions fileID:isDirectory:withError:
{
  id v9;
  uint64_t v10;
  void *v11;
  fsid_t v13;
  char v14[1024];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = objc_msgSend(v9, "unsignedLongLongValue", objc_msgSend(a3, "unsignedIntValue"));

  if (fsgetpath(v14, 0x400uLL, &v13, v10) < 0)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v14, a5, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

+ (uint64_t)brc_fileURLWithVolumeDeviceID:()BRCPathAdditions fileID:isDirectory:
{
  return objc_msgSend(a1, "brc_fileURLWithVolumeDeviceID:fileID:isDirectory:withError:", a3, a4, a5, 0);
}

- (id)brc_issueSandboxExtensionOfClass:()BRCPathAdditions error:
{
  id v7;
  const char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  const char *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "path");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "fileSystemRepresentation");
  v8 = (const char *)sandbox_extension_issue_file();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v8, strlen(v8) + 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *__error();
    objc_msgSend(a1, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = __error();
    objc_msgSend(v10, "br_errorWithPOSIXCode:description:", v11, CFSTR("couldn't issue sandbox extension %s for '%@': %s"), a3, v12, strerror(*v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      brc_bread_crumbs((uint64_t)"-[NSURL(BRCPathAdditions) brc_issueSandboxExtensionOfClass:error:]", 81);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
      {
        v18 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        v20 = "-[NSURL(BRCPathAdditions) brc_issueSandboxExtensionOfClass:error:]";
        v21 = 2080;
        if (!a4)
          v18 = "(ignored by caller)";
        v22 = v18;
        v23 = 2112;
        v24 = v14;
        v25 = 2112;
        v26 = v15;
        _os_log_error_impl(&dword_19CBF0000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

    }
    if (a4)
      *a4 = objc_retainAutorelease(v14);

    v9 = 0;
  }
  return v9;
}

+ (id)brc_ciconiaWorkDirForCurrentPersona
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentPersona");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "br_personaID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("__defaultPersonaID__"));

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.iCloudDrive"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(CFSTR("group.com.apple.iCloudDrive"), "UTF8String");
      v8 = container_create_or_lookup_path_for_current_user();
      if (!v8)
      {
        brc_bread_crumbs((uint64_t)"+[NSURL(BRCPathAdditions) brc_ciconiaWorkDirForCurrentPersona]", 116);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v17 = 1;
          v18 = 2112;
          v19 = v10;
          _os_log_impl(&dword_19CBF0000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] container_create_or_lookup_path_for_current_user() failed with %llu%@", buf, 0x16u);
        }

        goto LABEL_10;
      }
      v9 = (void *)v8;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      free(v9);
      if (!v4)
      {
LABEL_10:
        brc_bread_crumbs((uint64_t)"+[NSURL(BRCPathAdditions) brc_ciconiaWorkDirForCurrentPersona]", 124);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
          +[NSURL(BRCPathAdditions) brc_ciconiaWorkDirForCurrentPersona].cold.1((uint64_t)v1, (uint64_t)v12, v13);

        v4 = 0;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("ciconia"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_14;
  }
  _getCloudDocsAppSupportURL();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("ciconia"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v5;
}

+ (id)brc_ciconiaDumpDirForCurrentPersona
{
  void *v0;
  void *v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentPersona");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "br_personaID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("__defaultPersonaID__"));

  if (v3)
  {
    _getCloudDocsAppSupportURL();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("session/ciconia_diagnose"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.CloudDocs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(CFSTR("group.com.apple.CloudDocs"), "UTF8String");
      v9 = container_create_or_lookup_path_for_current_user();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        free(v10);
      }
      else
      {
        brc_bread_crumbs((uint64_t)"+[NSURL(BRCPathAdditions) brc_ciconiaDumpDirForCurrentPersona]", 146);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218242;
          v16 = 1;
          v17 = 2112;
          v18 = v11;
          _os_log_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] container_create_or_lookup_path_for_current_user() failed with %llu%@", buf, 0x16u);
        }

        v8 = 0;
      }
    }
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Library/Application Support/CloudDocs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("session/ciconia_diagnose"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (uint64_t)brc_isDirectory:()BRCPathAdditions isExists:withError:
{
  id v8;
  int v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v15;
  stat v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  objc_msgSend(a1, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = fstatat(-1, (const char *)objc_msgSend(v8, "fileSystemRepresentation"), &v16, 32);

  if (v9 < 0)
  {
    if (*__error() == 2)
    {
      return 1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "br_errorFromErrno");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v11 == 0;
      if (v11)
      {
        brc_bread_crumbs((uint64_t)"-[NSURL(BRCPathAdditions) brc_isDirectory:isExists:withError:]", 169);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(0);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
        {
          v15 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          v18 = "-[NSURL(BRCPathAdditions) brc_isDirectory:isExists:withError:]";
          v19 = 2080;
          if (!a5)
            v15 = "(ignored by caller)";
          v20 = v15;
          v21 = 2112;
          v22 = v11;
          v23 = 2112;
          v24 = v12;
          _os_log_error_impl(&dword_19CBF0000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }

      }
      if (a5)
        *a5 = objc_retainAutorelease(v11);

    }
  }
  else
  {
    if (a3)
      *a3 = (v16.st_mode & 0xF000) == 0x4000;
    v10 = 1;
    if (a4)
      *a4 = 1;
  }
  return v10;
}

+ (void)brc_ciconiaWorkDirForCurrentPersona
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
  _os_log_fault_impl(&dword_19CBF0000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Unable to retrieve base path for current persona : %@%@", (uint8_t *)&v3, 0x16u);
}

@end
