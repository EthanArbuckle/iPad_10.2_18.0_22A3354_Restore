@implementation NSString(BRPathAdditions)

- (id)br_pathExtension
{
  const char *v2;
  void *v3;
  size_t v4;
  size_t v5;
  void *v6;

  if (!objc_msgSend(a1, "length"))
    goto LABEL_5;
  v2 = extensionInFilename((char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"));
  v3 = (void *)v2;
  if (v2)
  {
    v4 = strlen(v2);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFileSystemRepresentation:length:", v3, v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    }
LABEL_5:
    v3 = 0;
  }
  return v3;
}

- (id)brc_stringByDeletingPathExtension
{
  char *v2;
  const char *v3;
  const char *v4;
  void *v5;
  id v6;

  v2 = (char *)objc_msgSend(a1, "br_safeFileSystemRepresentation");
  v3 = extensionInFilename(v2);
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
    v6 = a1;
  }
  return v6;
}

- (id)br_displayFilenameWithExtensionHidden:()BRPathAdditions
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a1;
  v5 = v4;
  if (a3)
  {
    objc_msgSend(v4, "brc_stringByDeletingPathExtension");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("/"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)br_isDocumentTooLargeForUpload:()BRPathAdditions maxUploadDocumentSize:
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int v19;
  id v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  _BYTE v52[128];
  _QWORD v53[6];

  v4 = a4;
  v53[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a1;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0C99998];
    v53[0] = *MEMORY[0x1E0C999D0];
    v53[1] = v9;
    v35 = v9;
    v10 = *MEMORY[0x1E0C99A18];
    v53[2] = *MEMORY[0x1E0C99A18];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __fileSystemSizeForDirectoryAtPath_block_invoke;
    v44[3] = &unk_1E3DA56B8;
    v31 = v6;
    v32 = v7;
    v45 = v31;
    objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v8, v11, 0, v44);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    if (v14)
    {
      v15 = v14;
      v36 = 0;
      v16 = *(_QWORD *)v41;
      v34 = v10;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v41 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v39 = 0;
          v19 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v39, v10, 0);
          v20 = v39;
          v21 = v20;
          if (v19 && objc_msgSend(v20, "BOOLValue"))
          {
            v37 = 0;
            v38 = 0;
            v22 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v38, v35, &v37);
            v23 = v38;
            v24 = v37;
            if ((v22 & 1) == 0)
            {
              brc_bread_crumbs((uint64_t)"fileSystemSizeForDirectoryAtPath", 240);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              brc_default_log(0);
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 138412802;
                v47 = v18;
                v48 = 2112;
                v49 = v24;
                v50 = 2112;
                v51 = v25;
                _os_log_error_impl(&dword_19CBF0000, v26, (os_log_type_t)0x90u, "[ERROR] couldn't get fileSize for url %@: %@%@", buf, 0x20u);
              }

              v10 = v34;
            }
            v36 += objc_msgSend(v23, "integerValue");

          }
          else
          {
            v23 = 0;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      }
      while (v15);
    }
    else
    {
      v36 = 0;
    }

    v4 = a4;
    v29 = v36;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "attributesOfItemAtPath:error:", a1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "fileSize");

  }
  return v29 > v4;
}

- (uint64_t)br_isExcludedButPreservedAtLogOutWithFilenames:()BRPathAdditions extensions:
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "lastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v14 = 1;
        if (!objc_msgSend(v8, "compare:options:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), 1))
        {
          v15 = v9;
          goto LABEL_23;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(v8, "br_pathExtension");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v16 = v7;
    v14 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v14)
    {
      v17 = *(_QWORD *)v21;
      while (2)
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v16);
          if (!objc_msgSend(v15, "compare:options:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * j), 1, (_QWORD)v20))
          {
            v14 = 1;
            goto LABEL_21;
          }
        }
        v14 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_21:

  }
  else
  {
    v14 = 0;
  }
LABEL_23:

  return v14;
}

- (uint64_t)br_isExcludedFromSyncInFPFSIsFile:()BRPathAdditions
{
  return objc_msgSend(a1, "_br_isExcludedWithMaximumDepth:inFPFS:isFile:", 1, 1, a3);
}

- (uint64_t)br_isExcludedWithMaximumDepth:()BRPathAdditions
{
  return objc_msgSend(a1, "_br_isExcludedWithMaximumDepth:inFPFS:isFile:", a3, 0, 0);
}

- (BOOL)_br_isExcludedWithMaximumDepth:()BRPathAdditions inFPFS:isFile:
{
  void *v9;
  const char *v10;
  char *v11;
  _BOOL8 v12;
  int v13;
  const char *v14;
  const char *v15;
  char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  size_t v22;
  unint64_t v23;
  int v24;
  BOOL v25;
  int v26;
  int v28;
  void *v29;
  char *__stringp;
  _BYTE v31[1024];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1A1AD841C]();
  if (objc_msgSend(a1, "length"))
  {
    v10 = (const char *)objc_msgSend(a1, "_br_safeFileSystemRepresentationWithDefaultValue:", a1);
    v11 = v31;
    if ((unint64_t)__strlcpy_chk() <= 0x3FF)
    {
      __stringp = v31;
LABEL_6:
      v13 = 0;
      v14 = ".DS_Store";
      v15 = "(A Document Being Saved";
      while (1)
      {
        v16 = strsep(&__stringp, "/");
        if (!_CFURLCStringIsPromiseName())
        {
          if (!strcmp(v16, v14))
            goto LABEL_55;
          if (!strncmp(v16, v15, 0x17uLL))
            goto LABEL_55;
          if (strcasestr(v16, ".nosync"))
            goto LABEL_55;
          if (!strcmp(v16, ".ubd"))
            goto LABEL_55;
          if (strstr(v16, ".weakpkg"))
            goto LABEL_55;
          if (!strcasecmp(v16, "tmp"))
            goto LABEL_55;
          if (!strcasecmp(v16, ".tmp"))
            goto LABEL_55;
          if (++v13 > a3
            || !strcasecmp(v16, "Thumbs.db")
            || !strcasecmp(v16, "desktop.ini")
            || !strncmp(v16, "~$", 2uLL)
            || !strncmp(v16, ".~", 2uLL)
            || !strcasecmp(v16, "Microsoft User Data")
            || !strcasecmp(v16, "$RECYCLE.BIN")
            || !strcasecmp(v16, "iPhoto Library")
            || !strcasecmp(v16, "Dropbox")
            || !strcasecmp(v16, "OneDrive")
            || !strcasecmp(v16, "IDrive-Sync")
            || !strcasecmp(v16, ".dropbox")
            || !strcasecmp(v16, ".dropbox.attr")
            || !strcasecmp(v16, "icon\r"))
          {
            goto LABEL_55;
          }
          v29 = v9;
          v17 = v15;
          v18 = extensionInFilename(v16);
          if (!v18)
            goto LABEL_47;
          v19 = v18;
          v28 = a4;
          v20 = a5;
          v21 = v14;
          v22 = strlen(v18);
          if (!v22)
          {
            a5 = v20;
            a4 = v28;
LABEL_47:
            v15 = v17;
            v9 = v29;
            goto LABEL_8;
          }
          v23 = v22;
          if (!strcasecmp(v19, "tmp")
            || !strcasecmp(v19, "photoslibrary")
            || !strcasecmp(v19, "photolibrary")
            || !strcasecmp(v19, "aplibrary")
            || !strcasecmp(v19, "migratedaplibrary")
            || !strcasecmp(v19, "migratedphotolibrary")
            || !strcasecmp(v19, "migratedaperturelibrary")
            || v23 >= 2 && !strcmp(&v19[v23 - 1], "~"))
          {
LABEL_61:
            a4 = v28;
            v9 = v29;
            goto LABEL_55;
          }
          v24 = strncmp(v19, "sb-", 3uLL);
          if (v23 != 18 || v24)
          {
            v25 = v23 == 3;
            v14 = v21;
            if (v25 && *v16 == 46 && *(_WORD *)v19 == 30579 && v19[2] >= 112)
            {
              v12 = 1;
              v9 = v29;
              goto LABEL_58;
            }
          }
          else
          {
            v14 = v21;
            if (v19[11] == 45)
              goto LABEL_61;
          }
          v26 = strcasecmp(v19, "pkpass");
          a5 = v20;
          a4 = v28;
          v15 = v17;
          v9 = v29;
          if (!v26)
            goto LABEL_54;
        }
LABEL_8:
        if (!__stringp)
          goto LABEL_54;
      }
    }
    v11 = strdup(v10);
    __stringp = v11;
    if (v11)
      goto LABEL_6;
LABEL_54:
    v16 = 0;
LABEL_55:
    v12 = v16 != 0;
    if (!v16 && a4)
      v12 = fpfs_path_is_safe_save_temp_file_ext() != 0;
LABEL_58:
    if (v11 != v31)
      free(v11);
  }
  else
  {
    v12 = 0;
  }
  objc_autoreleasePoolPop(v9);
  return v12;
}

- (BOOL)br_isInPackage
{
  uint64_t v2;
  unsigned __int8 *v3;
  int v4;
  int v5;

  v2 = offsetOfPackageRootFilenameInPath(a1, 0);
  if (v2 < 0)
    return 0;
  v3 = (unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation") + v2);
  do
  {
    v5 = *v3++;
    v4 = v5;
  }
  while (v5 == 47);
  return v4 != 0;
}

- (BOOL)br_isPackageRoot
{
  uint64_t v2;
  unsigned __int8 *v3;
  int v4;
  int v5;

  v2 = offsetOfPackageRootFilenameInPath(a1, 0);
  if (v2 < 0)
    return 0;
  v3 = (unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation") + v2);
  do
  {
    v5 = *v3++;
    v4 = v5;
  }
  while (v5 == 47);
  return v4 == 0;
}

- (id)br_pathOfPackageRoot
{
  id v2;

  v2 = 0;
  offsetOfPackageRootFilenameInPath(a1, &v2);
  return v2;
}

- (id)br_pathRelativeToPackageRoot
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = offsetOfPackageRootFilenameInPath(a1, 0);
  if (v2 < 0)
  {
    v5 = 0;
  }
  else
  {
    v3 = v2;
    v4 = objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v4 + v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)removingROSPPrefix
{
  id v2;

  if (objc_msgSend(a1, "hasPrefix:", CFSTR("/System/Volumes/Data")))
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(CFSTR("/System/Volumes/Data"), "length"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (__CFString)br_pathRelativeToPath:()BRPathAdditions
{
  void *v5;
  void *v6;
  void *v7;
  const char *v8;
  size_t v9;
  size_t v10;
  const char *v11;
  __CFString *v12;
  __CFString *v13;

  v5 = (void *)MEMORY[0x1A1AD841C]();
  objc_msgSend(a3, "removingROSPPrefix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "removingROSPPrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    if (!objc_msgSend(v6, "length"))
    {
      v13 = v7;
LABEL_9:
      v12 = v13;
      goto LABEL_15;
    }
    v8 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
    v9 = strlen(v8);
    if (v8[v9 - 1] == 47)
      v10 = v9 - 1;
    else
      v10 = v9;
    v11 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
    if (strncmp(v11, v8, v10))
      goto LABEL_7;
    if (!v11[v10])
    {
LABEL_14:
      v12 = &stru_1E3DA8AC8;
      goto LABEL_15;
    }
    if (v11[v10] == 47)
    {
      if (v11[v10 + 1])
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", &v11[v10 + 1]);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      goto LABEL_14;
    }
  }
LABEL_7:
  v12 = 0;
LABEL_15:

  objc_autoreleasePoolPop(v5);
  return v12;
}

- (uint64_t)br_isAbsolutePath
{
  uint64_t result;

  result = objc_msgSend(a1, "length");
  if (result)
    return objc_msgSend(a1, "characterAtIndex:", 0) == 47;
  return result;
}

- (const)br_fileSystemRepresentation
{
  if (objc_msgSend(a1, "length"))
    return (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  else
    return ".";
}

- (uint64_t)br_safeFileSystemRepresentation
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_badFilenameAlternativeName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_br_safeFileSystemRepresentationWithDefaultValue:", v2);

  return v3;
}

- (uint64_t)_br_safeFileSystemRepresentationWithDefaultValue:()BRPathAdditions
{
  id v4;
  uint64_t v5;

  v4 = a3;
  v5 = objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");

  return v5;
}

- (id)br_realpathKeepingLastSymlink
{
  id v1;
  const char *v2;
  const char *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  __int128 v12;
  uint64_t v13;
  _OWORD v14[65];
  uint64_t v15;

  v1 = a1;
  v15 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "length"))
    goto LABEL_10;
  memset(v14, 0, 512);
  v1 = objc_retainAutorelease(v1);
  v2 = (const char *)objc_msgSend(v1, "fileSystemRepresentation");
  v12 = xmmword_19CC7DA20;
  v13 = 0;
  if ((getattrlist(v2, &v12, v14, 0x40CuLL, 0x21u) & 0x80000000) == 0)
  {
    v3 = (char *)v14 + SDWORD1(v14[0]) + 4;
    if (strcmp(v2, v3))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v3);
      v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
      v8 = v4;
      return v8;
    }
LABEL_10:
    v4 = v1;
    goto LABEL_11;
  }
  if (*__error() != 2)
  {
    brc_bread_crumbs((uint64_t)"-[NSString(BRPathAdditions) br_realpathKeepingLastSymlink]", 641);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[NSString(BRPathAdditions) br_realpathKeepingLastSymlink].cold.1();

    goto LABEL_10;
  }
  objc_msgSend(v1, "stringByDeletingLastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "br_realpath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)br_realpath
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  id v8;
  const char *v9;
  void *v10;
  const __CFString *v11;
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[65];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (BRIsFPFSEnabled(a1, a2))
  {
    objc_msgSend(a1, "fp_realpath");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1;
    v5 = v4;
    memset(v19, 0, 512);
    if (v4)
    {
      v6 = &stru_1E3DA8AC8;
      v7 = v4;
      while (1)
      {
        if (!objc_msgSend(v7, "length"))
        {
          v11 = v6;
          goto LABEL_12;
        }
        v8 = objc_retainAutorelease(v7);
        v9 = (const char *)objc_msgSend(v8, "fileSystemRepresentation");
        v17 = xmmword_19CC7DA20;
        v18 = 0;
        if ((getattrlist(v9, &v17, v19, 0x40CuLL, 0x20u) & 0x80000000) == 0)
          break;
        if (*__error() != 2)
        {
          brc_bread_crumbs((uint64_t)"-[NSString(BRPathAdditions) br_realpath]", 671);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            -[NSString(BRPathAdditions) br_realpath].cold.1();

          v12 = v5;
          goto LABEL_13;
        }
        objc_msgSend(v8, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", v6);
        v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "stringByDeletingLastPathComponent");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v6 = (__CFString *)v11;
        if (!v7)
          goto LABEL_12;
      }
      v13 = (char *)v19 + SDWORD1(v19[0]) + 4;
      if (-[__CFString length](v6, "length") || strcmp(v9, v13))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringByAppendingPathComponent:", v6);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_13;
      }
      v11 = v6;
      v7 = v8;
    }
    else
    {
      v7 = 0;
      v11 = &stru_1E3DA8AC8;
    }
LABEL_12:
    v12 = v5;
    v6 = (__CFString *)v11;
    v8 = v7;
LABEL_13:

    return v12;
  }
}

+ (id)br_pathWithDeviceID:()BRPathAdditions fileID:
{
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  fsid_t v11;
  char v12[1024];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    if ((_DWORD)a3)
      goto LABEL_3;
    goto LABEL_10;
  }
  brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathWithDeviceID:fileID:]", 690);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    +[NSString(BRPathAdditions) br_pathWithDeviceID:fileID:].cold.2();

  if (!(_DWORD)a3)
  {
LABEL_10:
    brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathWithDeviceID:fileID:]", 691);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      +[NSString(BRPathAdditions) br_pathWithDeviceID:fileID:].cold.1();

  }
LABEL_3:
  v11.val[1] = 0;
  v11.val[0] = a3;
  if (fsgetpath(v12, 0x400uLL, &v11, a4) < 1)
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("/.vol/%d/%lld"), a3, a4);
  else
    objc_msgSend(MEMORY[0x1E0CB3940], "br_pathWithFileSystemRepresentation:", v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)br_emptyFilenameAlternativeName
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR(".com-apple-bird-noname-"), "stringByAppendingString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)br_badFilenameAlternativeName
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("tmp-bad-filename-"), "stringByAppendingString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)br_nameIsRepresentableOnHFS
{
  return (unint64_t)(objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4) - 1) < 0xFF;
}

+ (id)br_representableHFSFileNameWithBase:()BRPathAdditions suffix:extension:makeDotFile:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint64_t v27;
  int v29;
  BOOL v30;
  uint64_t v31;
  void *v32;
  int v34;
  uint64_t v35;
  _BYTE v36[255];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
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
  v35 = 0;
  if (v15)
    v17 = ~v15;
  else
    v17 = 0;
  if (a6)
  {
    v36[0] = 46;
    if (*(_BYTE *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String") == 95)
    {
      v36[1] = 46;
      v16 = 2;
    }
    else
    {
      v16 = 1;
    }
  }
  v34 = a6;
  v18 = 255;
  if (v12)
    v18 = 254 - v12;
  v19 = objc_msgSend(v9, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v36[v16], v18 + v17 - v16, &v35, 4, 0, 0, objc_msgSend(v9, "length"), 0);
  v20 = v35;
  if (!v19)
    v20 = 0;
  v21 = v20 + v16;
  if (v12)
  {
    v22 = v21 + 1;
    v36[v21] = 32;
    if (objc_msgSend(v10, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v36[v21 + 1], v12, &v35, 4, 0, 0, objc_msgSend(v10, "length"), 0))
    {
      v21 = v35 + v22;
    }
    else
    {
      brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:]", 768);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
        +[NSString(BRPathAdditions) br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:].cold.1();

      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "UUIDString");
      v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v21 = v22
          + snprintf(&v36[v21 + 1], 254 - v21, "com-apple-bird-recovered-%s", (const char *)objc_msgSend(v26, "UTF8String"));

    }
  }
  if (v15)
  {
    v27 = v21 + 1;
    v36[v21] = 46;
    if (objc_msgSend(v11, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v36[++v21], v15, &v35, 4, 0, 0, objc_msgSend(v11, "length"), 0))v21 = v35 + v27;
  }
  if (v21 == 1)
    v29 = v34;
  else
    v29 = 0;
  if (v21)
    v30 = v29 == 0;
  else
    v30 = 0;
  if (v30)
  {
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v36, v21, 4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "br_emptyFilenameAlternativeName");
    v31 = objc_claimAutoreleasedReturnValue();
  }
  v32 = (void *)v31;

  return v32;
}

- (id)brc_representableHFSFileNameWithSuffix:()BRPathAdditions addedExtension:makeDotFile:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v8, "length");
  v11 = objc_msgSend(v9, "length");
  if ((a5 & 1) != 0 || v10 || v11 || (unint64_t)objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4) >= 0x100)
  {
    objc_msgSend(a1, "br_pathExtension");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "brc_stringByDeletingPathExtension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v12)
      {
        objc_msgSend(v12, "stringByAppendingPathExtension:", v9);
        v14 = objc_claimAutoreleasedReturnValue();

        v12 = (id)v14;
      }
      else
      {
        v12 = v9;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "br_representableHFSFileNameWithBase:suffix:extension:makeDotFile:", v13, v8, v12, a5);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = a1;
  }

  return v15;
}

- (id)br_representableHFSFileNameWithNumber:()BRPathAdditions addedExtension:makeDotFile:
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a3, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)br_sideFaultPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "stringByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "br_sideFaultName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_br_nameWithAddedExtension:()BRPathAdditions makeDotFile:
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  uint64_t v16;

  v6 = a3;
  v7 = objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
  if (v7 + (unint64_t)a4 + objc_msgSend(v6, "length") < 0x100)
  {
    objc_msgSend(a1, "brc_representableHFSFileNameWithSuffix:addedExtension:makeDotFile:", 0, v6, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
    v16 = 0;
    objc_msgSend(a1, "br_stringByDeletingPathBounceNo:andPathExtension:", &v16, &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v9, "stringByAppendingPathExtension:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = v6;
    }
    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", v13, v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v8, "br_representableHFSFileNameWithNumber:addedExtension:makeDotFile:", 0, v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v12;
}

- (uint64_t)br_sideFaultName
{
  return objc_msgSend(a1, "_br_nameWithAddedExtension:makeDotFile:", CFSTR("icloud"), 1);
}

- (uint64_t)br_representableDirectoryName
{
  return objc_msgSend(a1, "_br_nameWithAddedExtension:makeDotFile:", CFSTR("folder"), 0);
}

- (uint64_t)br_compareToStringForHFS:()BRPathAdditions isCaseSensitive:
{
  return _CFStringCompareForHFS();
}

- (BOOL)br_isEqualToStringForHFS:()BRPathAdditions isCaseSensitive:
{
  return _CFStringCompareForHFS() == 0;
}

- (BOOL)br_isSideFaultName
{
  return _CFURLIsPromiseName() != 0;
}

+ (id)br_pathForDirectory:()BRPathAdditions
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;

  if (getuid())
  {
    if (!a3)
    {
      brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathForDirectory:]", 897);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        +[NSString(BRPathAdditions) br_pathForDirectory:].cold.3();

    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLsForDirectory:inDomains:", a3, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") != 1)
    {
      brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathForDirectory:]", 899);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        +[NSString(BRPathAdditions) br_pathForDirectory:].cold.2();

    }
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "br_realpath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (a3 == 14)
    {
      v9 = CFSTR("Application Support");
    }
    else if (a3 == 5)
    {
      v9 = CFSTR("Library");
    }
    else
    {
      brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_pathForDirectory:]", 889);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        +[NSString(BRPathAdditions) br_pathForDirectory:].cold.1();

      v9 = 0;
    }
    objc_msgSend(CFSTR("/var/mobile"), "stringByAppendingPathComponent:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)br_pathRelativeToDirectory:()BRPathAdditions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_pathForDirectory:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)br_currentPersonaIDWithIsDataSeparated:()BRPathAdditions
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentPersona");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "br_currentPersonaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    *a3 = objc_msgSend(v5, "isDataSeparatedPersona");

  return v6;
}

+ (id)br_supportDirForPersona:()BRPathAdditions dataSeparated:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (br_supportDirForPersona_dataSeparated__once != -1)
    dispatch_once(&br_supportDirForPersona_dataSeparated__once, &__block_literal_global_9);
  v7 = (id)br_supportDirForPersona_dataSeparated__pathByPersonaID;
  objc_sync_enter(v7);
  objc_msgSend((id)br_supportDirForPersona_dataSeparated__pathByPersonaID, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (a4)
    {
      objc_msgSend(a1, "br_currentHomeDir");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("Library/Application Support/CloudDocs"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("CloudDocs"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      if (v8)
      {
        brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_supportDirForPersona:dataSeparated:]", 949);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v19 = 138412802;
          v20 = v8;
          v21 = 2112;
          v22 = v6;
          v23 = 2112;
          v24 = v13;
          _os_log_debug_impl(&dword_19CBF0000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Caching directory path %@ for persona %@%@", (uint8_t *)&v19, 0x20u);
        }

        objc_msgSend(v8, "br_realpath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)br_supportDirForPersona_dataSeparated__pathByPersonaID, "setObject:forKeyedSubscript:", v15, v6);
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {

    }
    brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_supportDirForPersona:dataSeparated:]", 952);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 138412290;
      v20 = v15;
      _os_log_impl(&dword_19CBF0000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] No path for support directory%@", (uint8_t *)&v19, 0xCu);
    }

    v8 = 0;
    goto LABEL_16;
  }
LABEL_17:
  v17 = v8;

  objc_sync_exit(v7);
  return v17;
}

+ (id)br_currentSupportDir
{
  void *v1;
  void *v2;
  unsigned __int8 v4;

  v4 = 0;
  objc_msgSend(a1, "br_currentPersonaIDWithIsDataSeparated:", &v4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "br_supportDirForPersona:dataSeparated:", v1, v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)br_personaGroupDir
{
  return objc_msgSend(a1, "br_personaGroupDirForFPFS:", BRIsFPFSEnabled(a1, a2));
}

+ (id)br_personaGroupDirForFPFS:()BRPathAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t);
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if ((BRCurrentProcessHasAccessToCloudDocsGroupContainers() & 1) != 0)
    goto LABEL_3;
  v4 = -[BRDaemonConnection initUsingUserLocalDaemonTokenService]([BRDaemonConnection alloc], "initUsingUserLocalDaemonTokenService");
  v5 = (void *)objc_msgSend(v4, "newSyncTokenProxy");
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __55__NSString_BRPathAdditions__br_personaGroupDirForFPFS___block_invoke;
  v22 = &unk_1E3DA4D38;
  v23 = v5;
  v6 = v5;
  objc_msgSend(v6, "fetchGroupContainerPathForCurrentPersonaForFPFS:withReply:", a3, &v19);
  objc_msgSend(v6, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
LABEL_3:
    if ((_DWORD)a3)
      v8 = CFSTR("group.com.apple.iCloudDrive");
    else
      v8 = CFSTR("group.com.apple.CloudDocs");
    -[__CFString UTF8String](v8, "UTF8String", 1, v19, v20, v21, v22);
    v9 = container_create_or_lookup_path_for_current_user();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      free(v10);
      if (v7)
        return v7;
    }
    else
    {
      brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_personaGroupDirForFPFS:]", 996);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v25 = v18;
        v26 = 2112;
        v27 = v11;
        _os_log_impl(&dword_19CBF0000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] container_create_or_lookup_path_for_current_user() failed with %llu%@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "currentPersona");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_personaGroupDirForFPFS:]", 1004);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      +[NSString(BRPathAdditions) br_personaGroupDirForFPFS:].cold.1();

    v7 = 0;
  }
  return v7;
}

+ (id)br_corruptedDBInfoPath
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentSupportDir");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("corrupted_db_info"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)br_accountSessionOpenErrorInfoPath
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3940], "br_currentSupportDir");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("account_session_open_error_info"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)_br_containerPathForDataSeparatedPersona
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  void *v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (+[BRContainerCache hasDaemonicParts](BRContainerCache, "hasDaemonicParts"))
    goto LABEL_3;
  v0 = -[BRDaemonConnection initUsingUserLocalDaemonTokenService]([BRDaemonConnection alloc], "initUsingUserLocalDaemonTokenService");
  v1 = (void *)objc_msgSend(v0, "newSyncTokenProxy");
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __69__NSString_BRPathAdditions___br_containerPathForDataSeparatedPersona__block_invoke;
  v16 = &unk_1E3DA4D38;
  v17 = v1;
  v2 = v1;
  objc_msgSend(v2, "fetchContainerPathForCurrentPersonaWithReply:", &v13);
  objc_msgSend(v2, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
LABEL_3:
    v4 = container_create_or_lookup_path_for_current_user();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      free(v5);
      if (v3)
        return v3;
    }
    else
    {
      brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) _br_containerPathForDataSeparatedPersona]", 1038);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log(1);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v19 = 1;
        v20 = 2112;
        v21 = v6;
        _os_log_impl(&dword_19CBF0000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] container_create_or_lookup_path_for_current_user() failed with %llu%@", buf, 0x16u);
      }

    }
    objc_msgSend(MEMORY[0x1E0DC5EE8], "sharedManager", 1, v13, v14, v15, v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "currentPersona");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) _br_containerPathForDataSeparatedPersona]", 1046);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      +[NSString(BRPathAdditions) br_personaGroupDirForFPFS:].cold.1();

    v3 = 0;
  }
  return v3;
}

+ (id)br_currentHomeDir
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uid_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  char v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (br_currentHomeDir_once != -1)
    dispatch_once(&br_currentHomeDir_once, &__block_literal_global_48);
  v2 = (id)br_currentHomeDir_pathByPersonaID;
  objc_sync_enter(v2);
  v11 = 0;
  objc_msgSend(a1, "br_currentPersonaIDWithIsDataSeparated:", &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)br_currentHomeDir_pathByPersonaID, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (v11)
    {
      objc_msgSend(a1, "_br_containerPathForDataSeparatedPersona");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
        goto LABEL_11;
    }
    else
    {
      v6 = geteuid();
      getHomeDirectoryForUser(v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v5)
      {
        if (!v6)
        {
          brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_currentHomeDir]", 1119);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          brc_default_log(1);
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            +[NSString(BRPathAdditions) br_currentHomeDir].cold.1();
          goto LABEL_13;
        }
LABEL_11:
        brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_currentHomeDir]", 1121);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        brc_default_log(1);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v13 = v7;
          _os_log_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] No path for home directory%@", buf, 0xCu);
        }
LABEL_13:
        v4 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    objc_msgSend(v5, "br_realpath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)br_currentHomeDir_pathByPersonaID, "setObject:forKeyedSubscript:", v4, v3);
    brc_bread_crumbs((uint64_t)"+[NSString(BRPathAdditions) br_currentHomeDir]", 1117);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log(1);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      v13 = v3;
      v14 = 2112;
      v15 = v4;
      v16 = 2112;
      v17 = v7;
      _os_log_debug_impl(&dword_19CBF0000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Base path for persona %@ is %@%@", buf, 0x20u);
    }
    goto LABEL_14;
  }
LABEL_15:
  v9 = v4;

  objc_sync_exit(v2);
  return v9;
}

- (void)_br_safeFileSystemRepresentationWithDefaultValue:()BRPathAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_19CBF0000, v0, v1, "[DEBUG] Got unexpected exception %@. rethrow%@");
  OUTLINED_FUNCTION_1();
}

- (void)br_realpathKeepingLastSymlink
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_9_1(&dword_19CBF0000, v0, v1, "[DEBUG] realpath(%s) failed %{errno}d%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)br_realpath
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  __error();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_9_1(&dword_19CBF0000, v0, v1, "[DEBUG] realpath(%@) failed %{errno}d%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

+ (void)br_pathWithDeviceID:()BRPathAdditions fileID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: deviceID != 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)br_pathWithDeviceID:()BRPathAdditions fileID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: fileID != 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)br_representableHFSFileNameWithBase:()BRPathAdditions suffix:extension:makeDotFile:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1();
}

+ (void)br_pathForDirectory:()BRPathAdditions .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: unknown directory%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)br_pathForDirectory:()BRPathAdditions .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: urls.count == 1%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)br_pathForDirectory:()BRPathAdditions .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_19CBF0000, v0, v1, "[CRIT] Assertion failed: directory > 0%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)br_personaGroupDirForFPFS:()BRPathAdditions .cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_7_1(&dword_19CBF0000, v0, v1, "[CRIT] UNREACHABLE: Unable to retrieve base path for current persona : %@%@");
  OUTLINED_FUNCTION_1();
}

+ (void)br_currentHomeDir
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_6();
  _os_log_debug_impl(&dword_19CBF0000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] No path for home directory because we're running as root%@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
