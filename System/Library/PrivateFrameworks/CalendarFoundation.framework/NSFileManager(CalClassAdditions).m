@implementation NSFileManager(CalClassAdditions)

+ (__CFString)mimeTypeForFile:()CalClassAdditions
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  int v8;

  objc_msgSend(a3, "pathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredMIMEType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.traditional-mac-plain-text"));

    if (v8)
      v6 = CFSTR("text/plain");
    else
      v6 = CFSTR("application/octet-stream");
  }

  return v6;
}

- (char)makeUniqueDirectoryWithPath:()CalClassAdditions
{
  id v4;
  char *v5;
  const void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  void *v14;
  void *v15;
  int v16;
  char __s[1053];
  char v19[16];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(a1, "fileExistsAtPath:", v4) & 1) != 0
    || !objc_msgSend(a1, "makeCompletePath:mode:", v4, 448)
    || (v5 = (char *)v4) == 0)
  {
    strcpy(v19, ".tmp.XXXXXX");
    v6 = (const void *)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-T%p"), v6);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = (const char *)objc_msgSend(v7, "UTF8String");
    if (strlen(v8) >= 0x11)
    {
      +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NSFileManager(CalClassAdditions) makeUniqueDirectoryWithPath:].cold.1(v9);

    }
    if (objc_msgSend(v4, "getFileSystemRepresentation:maxLength:", __s, 1053))
    {
      v10 = strlen(__s);
      v11 = 1024;
      if (v10 < 0x400)
        v11 = v10;
      v12 = &__s[v11];
      v13 = strlen(v8);
      snprintf(v12, v13, "-T%p", v6);
      __strlcat_chk();
      v5 = mkdtemp(__s);
      if (!v5
        && *__error() == 2
        && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v4, "stringByDeletingLastPathComponent"),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v16 = objc_msgSend(v14, "makeCompletePath:mode:", v15, 448),
            v15,
            v14,
            v16))
      {
        objc_msgSend(v4, "getFileSystemRepresentation:maxLength:", __s, 1053);
        __strlcat_chk();
        v5 = mkdtemp(__s);
      }
      else
      {
        *__error() = 2;
      }
      if (v5)
      {
        objc_msgSend(a1, "stringWithFileSystemRepresentation:length:", v5, strlen(v5));
        v5 = (char *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      NSLog(CFSTR("*** Warning: invalid path %@"), v4);

      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)makeCompletePath:()CalClassAdditions mode:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;

  v6 = a3;
  if ((_DWORD)a4)
  {
    v7 = objc_alloc(MEMORY[0x1E0C99D80]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v8, *MEMORY[0x1E0CB2AA8], 0);

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v6, "stringByStandardizingPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "pathComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  v13 = v10;
  v14 = v13;
  if (v12)
  {
    v15 = v12;
    v16 = v13;
    while ((objc_msgSend(a1, "fileExistsAtPath:", v16) & 1) == 0)
    {
      objc_msgSend(v16, "stringByDeletingLastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v17;
      if (!--v15)
        goto LABEL_11;
    }
    v17 = v16;
  }
  else
  {
    v15 = 0;
    v17 = v13;
  }
LABEL_11:
  if (v15 >= v12)
  {
LABEL_15:
    v18 = 1;
  }
  else
  {
    v18 = 0;
    while (1)
    {
      v19 = v17;
      objc_msgSend(v11, "objectAtIndex:", v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingPathComponent:", v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v17, 0, v9, 0) & 1) == 0)
        break;

      v18 = ++v15 >= v12;
      if (v12 == v15)
        goto LABEL_15;
    }
    NSLog(CFSTR("couldn't create partial directory path %@"), v17);

  }
  return v18;
}

- (id)archivedDataAtPath:()CalClassAdditions createPKZipArchive:error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  __CFWriteStream *v24;
  __CFWriteStream *v25;
  void *v26;
  void *v27;
  void *v28;
  CFDictionaryRef v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v34;
  id v35;
  void *values[6];
  void *keys[7];

  keys[6] = *(void **)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a1;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initWithURL:options:error:", v8, 0, a5);
  v11 = v10;
  if (v10)
  {
    v35 = v9;
    objc_msgSend(v10, "filename");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CalTemporaryDirectoryAppropriateForURL:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:", CFSTR("com.apple.iCal.SavedAttachment"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "makeUniqueDirectoryWithPath:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "stringByAppendingPathComponent:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v11, "writeToURL:options:originalContentsURL:error:", v19, 0, 0, a5);

      v21 = 0;
      if (!v20)
        goto LABEL_23;
      v22 = BOMCopierNew();
      if (a4)
        v23 = CFSTR("createPKZip");
      else
        v23 = CFSTR("createCPIO");
      v24 = CFWriteStreamCreateWithAllocatedBuffers(0, 0);
      if (v24)
      {
        v25 = v24;
        if (CFWriteStreamOpen(v24))
        {
          keys[0] = (void *)v23;
          keys[1] = CFSTR("sequesterResources");
          keys[2] = CFSTR("keepParent");
          keys[3] = CFSTR("copyResources");
          keys[4] = CFSTR("compress");
          keys[5] = CFSTR("outputStream");
          v26 = (void *)*MEMORY[0x1E0C9AE50];
          v27 = (void *)*MEMORY[0x1E0C9AE40];
          if (a4)
            v28 = (void *)*MEMORY[0x1E0C9AE50];
          else
            v28 = (void *)*MEMORY[0x1E0C9AE40];
          values[0] = *(void **)MEMORY[0x1E0C9AE50];
          values[1] = v28;
          values[2] = v26;
          values[3] = v26;
          if (a4)
            v26 = v27;
          values[4] = v26;
          values[5] = v25;
          v29 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 6, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v30 = v22;
          BOMCopierSetUserData();
          BOMCopierSetFatalErrorHandler();
          BOMCopierSetFatalFileErrorHandler();
          objc_msgSend(objc_retainAutorelease(v18), "fileSystemRepresentation");
          v21 = 0;
          if (!BOMCopierCopyWithOptions())
            v21 = (void *)CFWriteStreamCopyProperty(v25, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2A8]);
          if (v29)
            CFRelease(v29);
          if (v30)
            BOMCopierFree();
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData *_archiveForURL(__strong id, NSURL *__strong, BOOL, NSError *__autoreleasing *)");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("*** %@: Unable to open writeStream %@"), v34, v25);

          v21 = 0;
        }
        CFRelease(v25);
        if (!v17)
          goto LABEL_25;
        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData *_archiveForURL(__strong id, NSURL *__strong, BOOL, NSError *__autoreleasing *)");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("*** %@: Unable to create CFWriteStream"), v31);

    }
    v21 = 0;
LABEL_23:
    if (!v17)
    {
LABEL_25:

      v9 = v35;
      goto LABEL_26;
    }
LABEL_24:
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "removeItemAtPath:error:", v17, 0);

    goto LABEL_25;
  }
  v21 = 0;
LABEL_26:

  return v21;
}

- (uint64_t)archivedDataAtPath:()CalClassAdditions createPKZipArchive:
{
  return objc_msgSend(a1, "archivedDataAtPath:createPKZipArchive:error:", a3, a4, 0);
}

- (uint64_t)archiveURLToFile:()CalClassAdditions toFile:createPKZipArchive:error:
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v10 = a4;
  objc_msgSend(a1, "archivedDataAtPath:createPKZipArchive:", a3, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "writeToFile:options:error:", v12, 0, a6);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (uint64_t)archiveURLToFile:()CalClassAdditions toFile:createPKZipArchive:
{
  return objc_msgSend(a1, "archiveURLToFile:toFile:createPKZipArchive:error:", a3, a4, a5, 0);
}

- (uint64_t)archivePathToFile:()CalClassAdditions toFile:createPKZipArchive:error:
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v10 = (void *)MEMORY[0x1E0C99E98];
  v11 = a4;
  objc_msgSend(v10, "fileURLWithPath:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(a1, "archiveURLToFile:toFile:createPKZipArchive:error:", v12, v13, a5, a6);
  return v14;
}

- (uint64_t)archivePathToFile:()CalClassAdditions toFile:createPKZipArchive:
{
  return objc_msgSend(a1, "archivePathToFile:toFile:createPKZipArchive:error:", a3, a4, a5, 0);
}

- (id)CalTemporaryDirectoryAppropriateForURL:()CalClassAdditions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v6 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fileURLWithPath:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = 0;
  objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v5, 1, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  if (!v8)
  {
    +[CalFoundationLogSubsystem defaultCategory](CalFoundationLogSubsystem, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[NSFileManager(CalClassAdditions) CalTemporaryDirectoryAppropriateForURL:].cold.1((uint64_t)v4, (uint64_t)v9, v10);

  }
  return v8;
}

- (void)makeUniqueDirectoryWithPath:()CalClassAdditions .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "Unexpected pointer size or string formatting.", v1, 2u);
}

- (void)CalTemporaryDirectoryAppropriateForURL:()CalClassAdditions .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_18FC12000, log, OS_LOG_TYPE_ERROR, "Error finding temporary directory appropriate for %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
