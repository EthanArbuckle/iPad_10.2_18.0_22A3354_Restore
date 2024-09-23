@implementation NSURL(IC)

- (uint64_t)ic_isReachable
{
  return objc_msgSend(a1, "checkResourceIsReachableAndReturnError:", 0);
}

- (id)ic_dedupedURLWithProhibitedNames:()IC
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v4 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 1;
  v11 = 0x1E0CB3000uLL;
  v12 = CFSTR("%@-%lu");
  v26 = v7;
  while (1)
  {
    if ((objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
      goto LABEL_6;
    objc_msgSend(v4, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "fileExistsAtPath:", v13))
    {

      goto LABEL_6;
    }
    objc_msgSend(v4, "lastPathComponent");
    v14 = v9;
    v15 = v8;
    v16 = v12;
    v17 = v11;
    v18 = v5;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v27, "containsObject:", v19);

    v5 = v18;
    v11 = v17;
    v12 = v16;
    v8 = v15;
    v9 = v14;
    v7 = v26;

    if (!v20)
      break;
LABEL_6:
    objc_msgSend(*(id *)(v11 + 2368), "stringWithFormat:", v12, v8, v10);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v21, "stringByAppendingPathExtension:", v7);
      v22 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v22;
    }
    objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v21, 0);
    v23 = objc_claimAutoreleasedReturnValue();

    ++v10;
    v4 = (id)v23;
  }

  return v4;
}

- (void)ic_updateFlagToExcludeFromBackup:()IC
{
  _QWORD v5[5];
  char v6;

  if (ic_updateFlagToExcludeFromBackup__token != -1)
    dispatch_once(&ic_updateFlagToExcludeFromBackup__token, &__block_literal_global_26);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__NSURL_IC__ic_updateFlagToExcludeFromBackup___block_invoke_2;
  v5[3] = &unk_1EA8250B0;
  v5[4] = a1;
  v6 = a3;
  dispatch_async((dispatch_queue_t)ic_updateFlagToExcludeFromBackup__excludeFromBackupQueue, v5);
}

- (uint64_t)ic_isExcludedFromBackups
{
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = *MEMORY[0x1E0C999D8];
  v9 = 0;
  v3 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v10, v2, &v9);
  v4 = v10;
  v5 = v9;
  if ((v3 & 1) == 0)
  {
    v6 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v12 = v2;
      v13 = 2112;
      v14 = a1;
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_1DDAA5000, v6, OS_LOG_TYPE_ERROR, "Error checking backup exclusion flag %@ for %@: %@", buf, 0x20u);
    }

  }
  v7 = objc_msgSend(v4, "BOOLValue");

  return v7;
}

- (uint64_t)ic_isExcludedFromCloudBackups
{
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v2 = *MEMORY[0x1E0C9AC90];
  v9 = 0;
  v3 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v10, v2, &v9);
  v4 = v10;
  v5 = v9;
  if ((v3 & 1) == 0)
  {
    v6 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v12 = v2;
      v13 = 2112;
      v14 = a1;
      v15 = 2112;
      v16 = v5;
      _os_log_error_impl(&dword_1DDAA5000, v6, OS_LOG_TYPE_ERROR, "Error checking backup exclusion flag %@ for %@: %@", buf, 0x20u);
    }

  }
  v7 = objc_msgSend(v4, "BOOLValue");

  return v7;
}

- (id)ic_uniquedURL
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v1 = a1;
  if (objc_msgSend(v1, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(v1, "lastPathComponent");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathExtension");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByDeletingPathExtension");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%lu"), v4, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "length"))
      {
        objc_msgSend(v7, "stringByAppendingPathExtension:", v3);
        v8 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v8;
      }
      objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      ++v6;
      v1 = v9;
    }
    while ((objc_msgSend(v9, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0);

  }
  else
  {
    v9 = v1;
  }
  return v9;
}

- (uint64_t)ic_isBooksURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("books.apple.com"));

  return v2;
}

- (uint64_t)ic_isMapURL
{
  return objc_msgSend(MEMORY[0x1E0D27230], "isValidMapURL:", a1);
}

- (uint64_t)ic_isNewsURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("apple.news")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqual:", CFSTR("news.apple.com"));

  return v2;
}

- (uint64_t)ic_isiTunesURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqual:", CFSTR("itunes.apple.com")) & 1) != 0
    || (objc_msgSend(v1, "isEqual:", CFSTR("itunes.com")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqual:", CFSTR("itun.es"));
  }

  return v2;
}

- (uint64_t)ic_isAppStoreURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqual:", CFSTR("appsto.re"));

  return v2;
}

- (uint64_t)ic_isPodcastsURL
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "host");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqual:", CFSTR("podcasts.apple.com"));

  return v2;
}

- (uint64_t)ic_isWebURL
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "scheme");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("http")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "scheme");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", CFSTR("https"));

  }
  return v3;
}

- (uint64_t)ic_isSupportedAsAttachment
{
  if ((objc_msgSend(a1, "ic_isWebURL") & 1) != 0 || (objc_msgSend(a1, "ic_isMapURL") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "ic_isSafeFileURLForAttachment");
}

- (uint64_t)ic_isSafeFileURLForAttachment
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isFileURL"))
    return 0;
  objc_msgSend(a1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByStandardizingPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)ic_isSafeFileURLForAttachment_unsafePathPrefixes;
  if (!ic_isSafeFileURLForAttachment_unsafePathPrefixes)
  {
    ic_isSafeFileURLForAttachment_unsafePathPrefixes = (uint64_t)&unk_1EA8325A0;

    v4 = &unk_1EA8325A0;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9)) & 1) != 0)
        {

          goto LABEL_18;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v7)
        continue;
      break;
    }
  }

  v10 = (void *)ic_isSafeFileURLForAttachment_unsafeFilenames;
  if (!ic_isSafeFileURLForAttachment_unsafeFilenames)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("notes.sqlite"), CFSTR("notes.sqlite-shm"), CFSTR("notes.sqlite-wal"), CFSTR("NoteStore.sqlite"), CFSTR("NoteStore.sqlite-shm"), CFSTR("NoteStore.sqlite-wal"), 0, (_QWORD)v19);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)ic_isSafeFileURLForAttachment_unsafeFilenames;
    ic_isSafeFileURLForAttachment_unsafeFilenames = v11;

    v10 = (void *)ic_isSafeFileURLForAttachment_unsafeFilenames;
  }
  objc_msgSend(v3, "lastPathComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v10, "containsObject:", v13);

  if ((v14 & 1) != 0)
  {
LABEL_18:
    v17 = 0;
  }
  else
  {
    objc_msgSend(a1, "pathComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "containsObject:", CFSTR(".."));

    v17 = v16 ^ 1u;
  }

  return v17;
}

- (id)ic_UTI
{
  int v2;
  id v3;
  void *v4;
  id v5;
  id v7;

  if (objc_msgSend(a1, "isFileURL"))
  {
    v7 = 0;
    v2 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v7, *MEMORY[0x1E0C99AD0], 0);
    v3 = v7;
    v4 = v3;
    v5 = 0;
    if (v2)
      v5 = v3;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)ic_fileSize
{
  int v2;
  uint64_t result;
  id v4;

  if (!objc_msgSend(a1, "isFileURL"))
    return 0;
  v4 = 0;
  v2 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v4, *MEMORY[0x1E0C99998], 0);
  result = 0;
  if (v2)
    return objc_msgSend(v4, "integerValue");
  return result;
}

- (uint64_t)ic_fileOrDirectorySize
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1, "isFileURL"))
    return 0;
  if (!objc_msgSend(a1, "hasDirectoryPath"))
    return objc_msgSend(a1, "ic_fileSize");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", a1, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v4);
        v7 += objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "ic_fileOrDirectorySize", (_QWORD)v11);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)ic_isURLAnInternetLocator
{
  return 0;
}

+ (uint64_t)ic_urlFromWeblocFileAtURL:()IC
{
  return 0;
}

@end
