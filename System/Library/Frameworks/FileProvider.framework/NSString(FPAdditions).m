@implementation NSString(FPAdditions)

- (id)fp_realpath
{
  id v1;
  void *v2;
  char v3;
  __CFString *v4;
  void *v5;
  id v6;
  char *v7;
  unsigned int v8;
  char *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  char *v16;
  void *v17;
  id v18;
  NSObject *v19;
  char *v21;
  __int128 v22;
  uint64_t v23;
  stat v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    v6 = 0;
    v4 = &stru_1E4450B40;
    goto LABEL_34;
  }
  v3 = 0;
  v4 = &stru_1E4450B40;
  v5 = v1;
  while (1)
  {
    if (!objc_msgSend(v5, "length"))
    {
      v6 = v5;
      goto LABEL_34;
    }
    v6 = objc_retainAutorelease(v5);
    v7 = (char *)objc_msgSend(v6, "fileSystemRepresentation");
    if (!v7)
      goto LABEL_34;
    bzero(&v24, 0x40CuLL);
    v22 = xmmword_1A0B53C28;
    v23 = 0;
    if ((v3 & 1) != 0)
      v8 = 32;
    else
      v8 = 33;
    if (getattrlist(v7, &v22, &v24, 0x40CuLL, v8) < 0)
    {
      v21 = 0;
      goto LABEL_12;
    }
    v9 = strdup((const char *)&v24.st_mode + *(int *)&v24.st_mode);
    v21 = v9;
    if (v9)
      break;
LABEL_12:
    if (*__error() == 63 && fpfs_supports_long_paths())
    {
      v10 = (v3 & 1) != 0 ? 0 : 0x200000;
      v11 = fpfs_open_longpath(v7, v10, 0);
      v12 = v11;
      if ((v11 & 0x80000000) == 0)
      {
        memset(&v24, 0, sizeof(v24));
        if (fstat(v11, &v24) < 0 || (fpfs_fsgetpath(v24.st_dev, v24.st_ino, &v21, 0) & 0x80000000) != 0)
          v21 = 0;
        v13 = *__error();
        close(v12);
        *__error() = v13;
        v16 = v21;
        if (v21)
          goto LABEL_28;
      }
    }
    if (*__error() != 2 && *__error() != 70)
    {
      fp_current_or_default_log();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[NSString(FPAdditions) fp_realpath].cold.1((uint64_t)v6, v19);

      goto LABEL_34;
    }
    objc_msgSend(v6, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringByAppendingPathComponent:", v4);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v3 = 1;
    v4 = (__CFString *)v15;
    if (!v5)
    {
      v6 = 0;
      v4 = (__CFString *)v15;
      goto LABEL_34;
    }
  }
  v16 = v9;
LABEL_28:
  if (-[__CFString length](v4, "length") || strcmp(v7, v16))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "_fpd_pathWithFileSystemRepresentation:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringByAppendingPathComponent:", v4);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    free(v16);
    goto LABEL_35;
  }
  free(v16);
LABEL_34:
  v18 = v2;
LABEL_35:

  return v18;
}

- (__CFString)fp_relativePathWithRealpath:()FPAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_10;
  if (!objc_msgSend(v4, "hasPrefix:", a1))
  {
    if (objc_msgSend(a1, "hasPrefix:", v5))
    {
      objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v5, "length"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = &stru_1E4450B40;
      if (objc_msgSend(v8, "length") && !objc_msgSend(v8, "isEqualToString:", CFSTR("/")))
        v7 = 0;
      goto LABEL_14;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_15;
  }
  v6 = objc_msgSend(v5, "length");
  if (v6 != objc_msgSend(a1, "length"))
  {
    objc_msgSend(v5, "substringFromIndex:", objc_msgSend(a1, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length") && (objc_msgSend(v8, "isEqualToString:", CFSTR("/")) & 1) == 0)
    {
      if (objc_msgSend(v8, "hasPrefix:", CFSTR("/")))
      {
        objc_msgSend(v8, "substringFromIndex:", 1);
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }
    }
    else
    {
      v7 = &stru_1E4450B40;
    }
LABEL_14:

    goto LABEL_15;
  }
  v7 = &stru_1E4450B40;
LABEL_15:

  return v7;
}

+ (char)_fpd_pathWithFileSystemRepresentation:()FPAdditions
{
  char *v3;
  void *v4;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFileSystemRepresentation:length:", v3, strlen(v3));
    v3 = (char *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (uint64_t)fp_isiCloudDriveOrCloudDocsIdentifier
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")) & 1) != 0
    || (objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));
  }
}

- (uint64_t)fp_prettyPath
{
  if (fp_shouldObfuscateFilenames_onceToken != -1)
    dispatch_once(&fp_shouldObfuscateFilenames_onceToken, &__block_literal_global_21);
  return objc_msgSend(a1, "fp_prettyPathWithObfuscation:", fp_shouldObfuscateFilenames_shouldObfuscate);
}

- (id)fp_prettyPathWithObfuscation:()FPAdditions
{
  id v5;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  unsigned int v21;

  if ((objc_msgSend(a1, "hasPrefix:", CFSTR("/Applications/")) & 1) != 0
    || (objc_msgSend(a1, "hasPrefix:", CFSTR("/System/Library/")) & 1) != 0
    || objc_msgSend(a1, "hasPrefix:", CFSTR("/AppleInternal/")))
  {
    v5 = a1;
  }
  else
  {
    v7 = (void *)objc_msgSend(a1, "mutableCopy");
    if (fp_prettyPathWithObfuscation__onceToken != -1)
      dispatch_once(&fp_prettyPathWithObfuscation__onceToken, &__block_literal_global_87);
    v21 = replacePrefix(v7, (void *)fp_prettyPathWithObfuscation__temporaryDirectory, CFSTR("<Temp>/"));
    v8 = replacePrefix(v7, CFSTR("/private/var/mobile/"), CFSTR("~/"));
    v9 = replacePrefix(v7, CFSTR("/var/mobile/"), CFSTR("~/"));
    v10 = replacePrefix(v7, CFSTR("~/Containers/Shared/AppGroup/"), CFSTR("<GroupContainers>/"));
    v11 = replacePrefix(v7, CFSTR("~/Library/Group Containers/"), CFSTR("<GroupContainers>/"));
    v12 = replacePrefix(v7, CFSTR("~/Library/Application Support/"), CFSTR("<AppSupport>/"));
    v13 = replacePrefix(v7, CFSTR("~/Library/Mobile Documents/"), CFSTR("~LMD/"));
    v14 = replacePrefix(v7, CFSTR("~/Containers/Data/Application/"), CFSTR("<AppContainers>/"));
    v15 = replacePrefix(v7, CFSTR("~/Library/CloudStorage/"), CFSTR("<FPFS>/"));
    v16 = replacePrefix(v7, CFSTR("~/Library/Group Containers/group.com.apple.FileProvider.LocalStorage/File Provider Storage"), CFSTR("<LocalStorage>"));
    if ((a3 & 1) != 0)
    {
      v17 = v9 | v8 | v21;
      if (v12 | v11 | v10)
        v17 = 2;
      if (v14 | v13)
        v18 = 1;
      else
        v18 = v17;
      if (v15)
        v18 = 2;
      if (v16)
        v19 = 1;
      else
        v19 = v18;
      obfuscatePath(v7, v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = v7;
    }
    v5 = v20;

  }
  return v5;
}

- (id)fp_obfuscatedProviderDomainID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (fp_shouldObfuscateFilenames_onceToken != -1)
    dispatch_once(&fp_shouldObfuscateFilenames_onceToken, &__block_literal_global_21);
  if (fp_shouldObfuscateFilenames_shouldObfuscate)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a1, "fp_toProviderID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fp_toDomainIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fp_obfuscatedFilename");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@/%@"), v3, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = a1;
  }
  return v6;
}

- (id)fp_obfuscatedFilename
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "fp_alwaysObfuscatedFilename");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (fp_shouldObfuscateFilenames_onceToken != -1)
    dispatch_once(&fp_shouldObfuscateFilenames_onceToken, &__block_literal_global_21);
  if (fp_shouldObfuscateFilenames_shouldObfuscate)
    v3 = v2;
  else
    v3 = a1;
  v4 = v3;

  return v4;
}

+ (id)fp_fromParsedDiskIdentifier:()FPAdditions
{
  void *v3;
  void *v4;
  void *v5;

  if (a3 == 0xFFFFFFFF80000000)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@trash"), CFSTR("__fp/fs/"));
    goto LABEL_5;
  }
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@root"), CFSTR("__fp/fs/"));
LABEL_5:
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%@)"), CFSTR("__fp/fs/"), CFSTR("docID("), v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%@)"), CFSTR("__fp/fs/"), CFSTR("fileID("), v5);
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fp_displayNameFromFilenameWithHiddenPathExtension:()FPAdditions isFolder:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = a1;
  v7 = v6;
  if (a3 && (a4 & 1) == 0)
  {
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("/"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)fp_alwaysObfuscatedFilename
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v16 = 0;
  v17 = 0;
  objc_msgSend(a1, "fp_stringByDeletingPathBounceNo:andPathExtension:", &v17, &v16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v17;
  v4 = v16;
  if ((unint64_t)objc_msgSend(v2, "length") > 2)
  {
    obfuscateString(v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v4 && v3)
    {
      v9 = (void *)MEMORY[0x1E0CB3940];
      v14 = objc_msgSend(v3, "intValue");
      v15 = v4;
      v13 = v8;
      v10 = CFSTR("%@ %u.%@");
    }
    else
    {
      if (v4)
      {
        v11 = (void *)MEMORY[0x1E0CB3940];
        v13 = v8;
        v14 = (uint64_t)v4;
        v10 = CFSTR("%@.%@");
        goto LABEL_11;
      }
      if (!v3)
      {
        v12 = v7;
        goto LABEL_12;
      }
      v9 = (void *)MEMORY[0x1E0CB3940];
      v13 = v7;
      v14 = objc_msgSend(v3, "intValue");
      v10 = CFSTR("%@ %u");
    }
    v11 = v9;
LABEL_11:
    objc_msgSend(v11, "stringWithFormat:", v10, v13, v14, v15);
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v5 = v12;

    goto LABEL_13;
  }
  v5 = a1;
LABEL_13:

  return v5;
}

- (id)fp_stringByDeletingPathBounceNo:()FPAdditions andPathExtension:isFolder:
{
  id v8;
  char *v9;
  char *v10;
  const char *v11;
  const char *v12;
  char v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  BOOL v18;
  int64_t v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  BOOL v23;
  char v24;
  int v25;
  char v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  char *v34;

  v8 = objc_retainAutorelease(a1);
  v9 = (char *)objc_msgSend(v8, "fileSystemRepresentation");
  v10 = v9;
  if ((a5 & 1) != 0 || (v11 = _extensionInFilename(v9, 0)) == 0)
  {
    if (a4)
      *a4 = 0;
    v14 = strlen(v10);
    v12 = 0;
    v13 = 1;
  }
  else
  {
    v12 = v11;
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "fp_pathWithFileSystemRepresentation:", v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = 0;
    v14 = (size_t)&v12[~(unint64_t)v10];
  }
  v15 = strrchr(v10, 32);
  if (v15)
  {
    v16 = v15;
    if (v15 != v10 && v15 != &v10[v14])
    {
      v17 = v15 + 1;
      if (v15[1] != 48)
      {
        v33 = v17 - v10;
        if (v14 == v17 - v10)
          goto LABEL_21;
        v31 = a3;
        v32 = v8;
        v18 = 0;
        v19 = &v10[v14] - v15;
        v20 = 1;
        do
        {
          v21 = v16[v20];
          if ((v21 & 0x80000000) != 0)
          {
            if (!__maskrune(v21, 0x400uLL))
              break;
          }
          else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v21 + 60) & 0x400) == 0)
          {
            break;
          }
          v18 = v20++ >= v14 - (v17 - v10);
        }
        while (v19 != v20);
        a3 = v31;
        v8 = v32;
        if (v18)
        {
LABEL_21:
          *__error() = 0;
          v22 = strtoll(v16 + 1, 0, 10);
          if (*__error())
            v23 = 1;
          else
            v23 = v22 <= 1;
          v24 = !v23;
          v25 = v24 & (v22 < 500);
          if (v25)
            v14 = v33 - 1;
          if (a3 && (v25 & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
      }
    }
  }
  if (a4)
    v26 = 1;
  else
    v26 = v13;
  if ((v26 & 1) != 0)
  {
    if (v10[v14])
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "stringWithFileSystemRepresentation:length:", v10, v14);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      return v28;
    }
    else
    {
      return v8;
    }
  }
  else
  {
    v34 = 0;
    asprintf(&v34, "%.*s.%s", v14, v10, v12);
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_pathWithFileSystemRepresentation:", v34);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    free(v34);
    return v30;
  }
}

- (uint64_t)fp_stringByDeletingPathBounceNo:()FPAdditions andPathExtension:
{
  return objc_msgSend(a1, "fp_stringByDeletingPathBounceNo:andPathExtension:isFolder:", a3, a4, 0);
}

- (uint64_t)fp_isiCloudDriveIdentifier
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
}

- (uint64_t)fp_libnotifyPerUserNotificationName
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("user.uid.%d.%@"), getuid(), a1);
}

- (__CFString)fp_fpIdentifier
{
  __CFString *v2;

  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0)
  {
    v2 = CFSTR("icloud");
  }
  else if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")) & 1) != 0)
  {
    v2 = CFSTR("icloudmanaged");
  }
  else if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0)
  {
    v2 = CFSTR("clouddocs");
  }
  else if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged")) & 1) != 0)
  {
    v2 = CFSTR("clouddocsmanaged");
  }
  else if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.FileProvider.LocalStorage")) & 1) != 0)
  {
    v2 = CFSTR("localstorage");
  }
  else if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.filesystems.UserFS.FileProvider")) & 1) != 0)
  {
    v2 = CFSTR("userfs");
  }
  else if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.SMBClientProvider.FileProvider")) & 1) != 0)
  {
    v2 = CFSTR("smbfs");
  }
  else if ((objc_msgSend(a1, "hasPrefix:", CFSTR("com.getdropbox.Dropbox.FileProvider")) & 1) != 0)
  {
    v2 = CFSTR("dropbox");
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

+ (char)fp_pathWithFileSystemRepresentation:()FPAdditions
{
  char *v3;
  void *v4;

  v3 = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFileSystemRepresentation:length:", v3, strlen(v3));
    v3 = (char *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (uint64_t)fp_coordinatorReadingOptions:()FPAdditions
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = 109;
  v4 = 45;
  if ((a3 & 0x40000000) == 0)
    v3 = 45;
  v18 = v3;
  v5 = 112;
  if ((a3 & 0x20000000) == 0)
    v5 = 45;
  v6 = 99;
  if ((a3 & 0x80000) == 0)
    v6 = 45;
  v16 = v6;
  v17 = v5;
  v7 = 98;
  if ((a3 & 0x40000) == 0)
    v7 = 45;
  v8 = 114;
  if ((a3 & 0x20000) == 0)
    v8 = 45;
  v14 = v8;
  v15 = v7;
  v9 = 117;
  if ((a3 & 8) == 0)
    v9 = 45;
  v10 = 105;
  if ((a3 & 4) == 0)
    v10 = 45;
  v13 = v9;
  v11 = 115;
  if ((a3 & 2) == 0)
    v11 = 45;
  if ((a3 & 1) != 0)
    v4 = 119;
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%c%c%c%c%c%c%c%c (0x%lx)"), v4, v11, v10, v13, v14, v15, v16, v17, v18, a3);
}

- (uint64_t)fp_isLegacyCloudDocsIdentifier
{
  if ((objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider")) & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "isEqualToString:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProviderManaged"));
}

- (uint64_t)fp_getParsedDiskIdentifier:()FPAdditions
{
  void *v5;
  uint64_t v6;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("__fp/fs/")))
  {
    objc_msgSend(a1, "substringFromIndex:", 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("root")))
    {
      *a3 = 0;
LABEL_7:
      v6 = 1;
LABEL_8:

      return v6;
    }
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("trash")))
    {
      *a3 = 0xFFFFFFFF80000000;
      goto LABEL_7;
    }
    if (objc_msgSend(v5, "hasSuffix:", CFSTR(")")))
    {
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("docID(")))
      {
        objc_msgSend(v5, "substringWithRange:", 6, objc_msgSend(v5, "length") - 7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "integerValue");
        if (v9 >= 1)
        {
          *a3 = -v9;
LABEL_17:

          goto LABEL_7;
        }
LABEL_18:

        goto LABEL_19;
      }
      if (objc_msgSend(v5, "hasPrefix:", CFSTR("fileID(")))
      {
        objc_msgSend(v5, "substringWithRange:", 7, objc_msgSend(v5, "length") - 8);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "integerValue");
        if (v10 >= 1)
        {
          *a3 = v10;
          goto LABEL_17;
        }
        goto LABEL_18;
      }
    }
LABEL_19:
    v6 = 0;
    goto LABEL_8;
  }
  return 0;
}

- (id)fp_filenameFromDisplayNameWithExtension:()FPAdditions
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "stringByAppendingPathExtension:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  return v5;
}

+ (id)fp_commonParentPathForItemURLs:()FPAdditions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, unint64_t, _BYTE *);
  void *v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (*v18)(uint64_t, void *, unint64_t, _BYTE *);
  uint64_t v19;
  void *v20;
  uint64_t *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__12;
    v43 = __Block_byref_object_dispose__12;
    v44 = 0;
    v26 = v3;
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathComponents");
    v44 = (id)objc_claimAutoreleasedReturnValue();

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v36;
      v9 = MEMORY[0x1E0C809B0];
      v10 = __56__NSString_FPAdditions__fp_commonParentPathForItemURLs___block_invoke;
      v11 = &unk_1E444C8B0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v36 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "pathComponents");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0;
          v32 = &v31;
          v33 = 0x2020000000;
          v34 = 0;
          v27[0] = v9;
          v27[1] = 3221225472;
          v27[2] = v10;
          v27[3] = v11;
          v29 = &v39;
          v30 = &v31;
          v14 = v13;
          v28 = v14;
          objc_msgSend(v14, "enumerateObjectsUsingBlock:", v27);
          if (!*((_BYTE *)v32 + 24))
          {
            if (objc_msgSend(v14, "count"))
            {
              objc_msgSend(v14, "subarrayWithRange:", 0, objc_msgSend(v14, "count") - 1);
              v15 = objc_claimAutoreleasedReturnValue();
              v16 = (void *)v40[5];
              v40[5] = v15;
            }
            else
            {
              v17 = v11;
              v18 = v10;
              v19 = v9;
              v20 = v6;
              v21 = v40;
              v22 = v14;
              v16 = (void *)v21[5];
              v21[5] = (uint64_t)v22;
              v6 = v20;
              v9 = v19;
              v10 = v18;
              v11 = v17;
            }

          }
          _Block_object_dispose(&v31, 8);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v7);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v40[5]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v23, "hasSuffix:", CFSTR("/")) & 1) == 0)
    {
      objc_msgSend(v23, "stringByAppendingString:", CFSTR("/"));
      v24 = objc_claimAutoreleasedReturnValue();

      v23 = (void *)v24;
    }
    _Block_object_dispose(&v39, 8);

    v3 = v26;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (uint64_t)fp_maximumBounceLevel
{
  return 500;
}

- (id)fp_obfuscatedDotSeparatedComponents
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "fp_alwaysObfuscatedDotSeparatedComponents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (fp_shouldObfuscateFilenames_onceToken != -1)
    dispatch_once(&fp_shouldObfuscateFilenames_onceToken, &__block_literal_global_21);
  if (fp_shouldObfuscateFilenames_shouldObfuscate)
    v3 = v2;
  else
    v3 = a1;
  v4 = v3;

  return v4;
}

- (id)fp_alwaysObfuscatedDotSeparatedComponents
{
  void *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(a1, "length"))
  {
    objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("."));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    if (objc_msgSend(v3, "count"))
    {
      v4 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        obfuscateString(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:atIndexedSubscript:", v6, v4);

        ++v4;
      }
      while (v4 < objc_msgSend(v3, "count"));
    }
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("."));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = a1;
  }
  return v7;
}

- (id)fp_obfuscatedExtendedAttributeName
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "fp_alwaysObfuscatedExtendedAttributeName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (fp_shouldObfuscateFilenames_onceToken != -1)
    dispatch_once(&fp_shouldObfuscateFilenames_onceToken, &__block_literal_global_21);
  if (fp_shouldObfuscateFilenames_shouldObfuscate)
    v3 = v2;
  else
    v3 = a1;
  v4 = v3;

  return v4;
}

- (id)fp_alwaysObfuscatedExtendedAttributeName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  if (!objc_msgSend(a1, "length"))
    return a1;
  v2 = objc_msgSend(a1, "rangeOfString:options:", CFSTR("#"), 5);
  v4 = v3;
  v5 = objc_msgSend(a1, "length");
  v6 = &stru_1E4450B40;
  if (v4)
  {
    if (v2)
    {
      objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v2);
      v8 = v7 + v2;
      if (v7 + v2 < (unint64_t)objc_msgSend(a1, "length"))
      {
        v9 = 0;
        while (1)
        {
          v10 = objc_msgSend(a1, "characterAtIndex:", v8);
          if (v10 > 97)
          {
            if (v10 <= 109)
            {
              if (v10 != 98)
              {
                v11 = 2;
                if (v10 != 99)
                  break;
                goto LABEL_26;
              }
LABEL_25:
              v11 = 16;
              goto LABEL_26;
            }
            if (v10 == 110)
            {
LABEL_23:
              v11 = 4;
              goto LABEL_26;
            }
            if (v10 == 115)
              goto LABEL_24;
            if (v10 != 112)
              break;
          }
          else
          {
            if (v10 <= 77)
            {
              if (v10 != 66)
              {
                v11 = 2;
                if (v10 != 67)
                  break;
                goto LABEL_26;
              }
              goto LABEL_25;
            }
            if (v10 == 78)
              goto LABEL_23;
            if (v10 != 80)
            {
              if (v10 != 83)
                break;
LABEL_24:
              v11 = 8;
              goto LABEL_26;
            }
          }
          v11 = 1;
LABEL_26:
          if ((v11 & v9) != 0)
            break;
          v9 |= v11;
          if (++v8 >= (unint64_t)objc_msgSend(a1, "length"))
          {
            objc_msgSend(a1, "substringWithRange:", v2, objc_msgSend(a1, "length") - v2);
            v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v5 = v2;
            break;
          }
        }
      }
    }
  }
  v12 = objc_msgSend(a1, "rangeOfString:options:range:", CFSTR(":"), 5, 0, v5);
  if (v13 && (v14 = v12) != 0)
  {
    v15 = objc_msgSend(a1, "rangeOfComposedCharacterSequenceAtIndex:", v12);
    if (v5 == v15 + v16)
    {
      v17 = 0;
    }
    else
    {
      objc_msgSend(a1, "substringWithRange:", v15 + v16, v5 - (v15 + v16));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fp_alwaysObfuscatedDotSeparatedComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v14;
    }
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(a1, "substringWithRange:", 0, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fp_alwaysObfuscatedDotSeparatedComponents");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%@%@"), v21, v17, v6);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v21, v6, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)fp_alwaysObfuscatedPath
{
  return obfuscatePath(a1, 0);
}

- (id)fp_obfuscatedPath
{
  id v2;

  if (fp_shouldObfuscateFilenames_onceToken != -1)
    dispatch_once(&fp_shouldObfuscateFilenames_onceToken, &__block_literal_global_21);
  if (fp_shouldObfuscateFilenames_shouldObfuscate)
  {
    objc_msgSend(a1, "fp_alwaysObfuscatedPath");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)fp_bouncedNameWithIndex:()FPAdditions isDir:
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  if ((_DWORD)a4)
  {
    objc_msgSend(a1, "lastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "fp_stringByDeletingPathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "fp_pathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("icloud")))
  {
    objc_msgSend(v7, "fp_pathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fp_stringByDeletingPathExtension");
    v10 = objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "stringByAppendingPathExtension:", v8);
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }

    v7 = (void *)v10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fp_representableHFSFileNameWithNumber:addedExtension:makeDotFile:isDir:", v12, v8, 0, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (uint64_t)fp_bouncedNameWithIndex:()FPAdditions
{
  return objc_msgSend(a1, "fp_bouncedNameWithIndex:isDir:", a3, 0);
}

- (const)fp_fileSystemRepresentation
{
  if (objc_msgSend(a1, "length"))
    return (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  else
    return ".";
}

+ (id)fp_representableHFSFileNameWithBase:()FPAdditions suffix:extension:makeDotFile:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v28;
  uint64_t v30;
  _OWORD v31[16];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v10, "length");
  v13 = objc_msgSend(v11, "lengthOfBytesUsingEncoding:", 4);
  if (v13 < 0x33)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(v9, "stringByAppendingPathExtension:", v11);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = 0;
    v11 = 0;
    v9 = (id)v14;
  }
  v16 = 0;
  memset(&v31[2], 0, 223);
  v17 = 254 - v12;
  if (v15)
    v18 = ~v15;
  else
    v18 = 0;
  memset(v31, 0, 32);
  if (a6)
  {
    LOBYTE(v31[0]) = 46;
    v16 = 1;
  }
  v30 = 0;
  if (!v12)
    v17 = 255;
  v19 = objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (unint64_t)v31 | v16, v17 + v18 - v16, &v30, 4, 0, 0, objc_msgSend(v9, "length"), 0);
  v20 = v30;
  if (!v19)
    v20 = 0;
  v21 = v20 + v16;
  if (!v12)
  {
LABEL_16:
    if (!v15)
      goto LABEL_23;
    goto LABEL_21;
  }
  v22 = v21 + 1;
  *((_BYTE *)v31 + v21) = 32;
  if (objc_msgSend(v10, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)v31 + v21 + 1, v12, &v30, 4, 0, 0, objc_msgSend(v10, "length"), 0))
  {
    v21 = v30 + v22;
    goto LABEL_16;
  }
  fp_current_or_default_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    +[NSString(FPAdditions) fp_representableHFSFileNameWithBase:suffix:extension:makeDotFile:].cold.1((uint64_t)v9, v23);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "UUIDString");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v21 = v22
      + snprintf((char *)v31 + v21 + 1, 254 - v21, "com-apple-bird-recovered-%s", (const char *)objc_msgSend(v25, "UTF8String"));

  if (v15)
  {
LABEL_21:
    v26 = v21 + 1;
    *((_BYTE *)v31 + v21) = 46;
    if (objc_msgSend(v11, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", (char *)v31 + ++v21, v15, &v30, 4, 0, 0, objc_msgSend(v11, "length"), 0))v21 = v30 + v26;
  }
LABEL_23:
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v31, v21, 4);

  return v28;
}

- (id)fp_representableHFSFileNameWithSuffix:()FPAdditions addedExtension:makeDotFile:isDir:
{
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v10, "length");
  v13 = objc_msgSend(v11, "length");
  if ((a5 & 1) != 0 || v12 || v13 || (unint64_t)objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4) >= 0x100)
  {
    if (v11 || a6)
    {
      v14 = v11;
      v15 = a1;
    }
    else
    {
      objc_msgSend(a1, "fp_pathExtension");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "fp_stringByDeletingPathExtension");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0CB3940], "fp_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v15, v10, v14, a5);
    v17 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = a1;
  }

  return v17;
}

- (id)fp_representableHFSFileNameWithNumber:()FPAdditions addedExtension:makeDotFile:isDir:
{
  id v10;
  void *v11;
  void *v12;

  v10 = a4;
  objc_msgSend(a3, "stringValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fp_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:isDir:", v11, v10, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)fp_representableHFSFileNameWithNumber:()FPAdditions addedExtension:makeDotFile:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a3, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fp_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:isDir:", v9, v8, a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fp_pathExtension
{
  const char *v1;
  void *v2;
  size_t v3;
  size_t v4;
  void *v5;

  v1 = _extensionInFilename((char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"), 0);
  v2 = (void *)v1;
  if (v1)
  {
    v3 = strlen(v1);
    if (v3)
    {
      v4 = v3;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFileSystemRepresentation:length:", v2, v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }
  }
  return v2;
}

- (id)fp_stringByDeletingPathExtension
{
  id v1;
  char *v2;
  const char *v3;
  const char *v4;
  void *v5;
  id v6;

  v1 = objc_retainAutorelease(a1);
  v2 = (char *)objc_msgSend(v1, "fileSystemRepresentation");
  v3 = _extensionInFilename(v2, 0);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFileSystemRepresentation:length:", v2, &v4[~(unint64_t)v2]);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = v1;
  }
  return v6;
}

+ (uint64_t)fp_wordTokenizer
{
  if (fp_wordTokenizer_onceToken != -1)
    dispatch_once(&fp_wordTokenizer_onceToken, &__block_literal_global_127);
  return fp_wordTokenizer_tokenizerRef;
}

- (void)fp_enumerateTokensInRange:()FPAdditions tokenizer:usingBlock:
{
  void (**v11)(id, void *, CFIndex, CFIndex, _BYTE *);
  void *v12;
  CFRange CurrentTokenRange;
  void *v14;
  int v15;
  void *v16;
  unsigned __int8 v17;
  CFRange v18;

  v11 = a6;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSString+FPAdditions.m"), 947, CFSTR("tokenizerRef may not be null."));

  }
  v18.location = a3;
  v18.length = a4;
  CFStringTokenizerSetString(a5, a1, v18);
  do
  {
    if (!CFStringTokenizerAdvanceToNextToken(a5))
      break;
    v12 = (void *)MEMORY[0x1A1B00664]();
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(a5);
    -[__CFString substringWithRange:](a1, "substringWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v11[2](v11, v14, CurrentTokenRange.location, CurrentTokenRange.length, &v17);
    v15 = v17;

    objc_autoreleasePoolPop(v12);
  }
  while (!v15);

}

- (uint64_t)fp_isCJKLanguageIdentifier
{
  if (fp_isCJKLanguageIdentifier_onceToken != -1)
    dispatch_once(&fp_isCJKLanguageIdentifier_onceToken, &__block_literal_global_133);
  return objc_msgSend((id)fp_isCJKLanguageIdentifier_cjkLanguages, "containsObject:", a1);
}

+ (id)fp_hashForToken:()FPAdditions
{
  id v3;
  id v4;
  const void *v5;
  CC_LONG v6;
  void *v7;
  void *v8;
  void *v9;
  CC_SHA1_CTX v11;
  unsigned __int8 md[8];
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  memset(&v11, 0, sizeof(v11));
  v3 = a3;
  CC_SHA1_Init(&v11);
  v4 = objc_retainAutorelease(v3);
  v5 = (const void *)objc_msgSend(v4, "bytes", *(_OWORD *)&v11.h0, *(_OWORD *)&v11.h4, *(_OWORD *)&v11.data[1], *(_OWORD *)&v11.data[5], *(_OWORD *)&v11.data[9], *(_OWORD *)&v11.data[13]);
  v6 = objc_msgSend(v4, "length");

  CC_SHA1_Update(&v11, v5, v6);
  *(_QWORD *)md = 0;
  v13 = 0;
  v14 = 0;
  CC_SHA1_Final(md, &v11);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", md, 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "base64EncodedDataWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 1);

  return v9;
}

- (uint64_t)fp_splitKeyPathInProperty:()FPAdditions remainder:
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v8 = result;
    result = objc_msgSend(a1, "rangeOfString:", CFSTR("."));
    if (result)
    {
      v9 = result;
      if (result == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = objc_retainAutorelease(a1);
        v11 = 0;
        *a3 = v10;
      }
      else
      {
        if (result == v8 - 1)
          return 0;
        objc_msgSend(a1, "substringWithRange:", 0, result);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "substringWithRange:", v9 + 1, v8 + ~v9);
        v11 = (id)objc_claimAutoreleasedReturnValue();
      }
      *a4 = v11;
      return 1;
    }
  }
  return result;
}

- (id)fp_valueForKeyPath:()FPAdditions
{
  void *v4;

  if (objc_msgSend(a3, "isEqual:", CFSTR("pathExtension")))
  {
    objc_msgSend(a1, "pathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)fp_realpath
{
  int v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *__error();
  v5 = 138412546;
  v6 = a1;
  v7 = 1024;
  v8 = v4;
  _os_log_debug_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] realpath(%@) failed: %{errno}d", (uint8_t *)&v5, 0x12u);
}

+ (void)fp_representableHFSFileNameWithBase:()FPAdditions suffix:extension:makeDotFile:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
}

@end
