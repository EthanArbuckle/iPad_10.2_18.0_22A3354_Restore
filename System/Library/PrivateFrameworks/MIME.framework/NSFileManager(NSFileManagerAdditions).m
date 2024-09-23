@implementation NSFileManager(NSFileManagerAdditions)

+ (const)mf_defaultVolumeMountPoint
{
  return CFSTR("/private/var/mobile");
}

- (id)mf_makeUniqueFileInDirectory:()NSFileManagerAdditions
{
  id v4;
  char v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  void *v12;
  NSObject *v13;
  char v15;
  uint8_t buf[4];
  void *v17;
  char __b[1025];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = -86;
  v5 = objc_msgSend(a1, "fileExistsAtPath:isDirectory:", v4, &v15);
  if (v15)
    v6 = v5;
  else
    v6 = 0;
  if ((v6 & 1) != 0)
  {
    memset(__b, 170, sizeof(__b));
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("Mail-T%p.tmp.XXXXXX"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "getFileSystemRepresentation:maxLength:", __b, 1025) & 1) != 0)
    {
      v11 = mktemp(__b);
      if (v11)
      {
        objc_msgSend(a1, "stringWithFileSystemRepresentation:length:", v11, strlen(v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      MFLogGeneral();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v10;
        _os_log_impl(&dword_1ABB13000, v13, OS_LOG_TYPE_DEFAULT, "#Warning *** Warning: invalid path %@", buf, 0xCu);
      }

    }
    v12 = 0;
    goto LABEL_13;
  }
  v12 = 0;
LABEL_14:

  return v12;
}

- (uint64_t)mf_makeCompletePath:()NSFileManagerAdditions mode:
{
  return CPFileBuildDirectoriesToPath();
}

- (uint64_t)mf_canWriteToDirectoryAtPath:()NSFileManagerAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  char v8;

  v4 = a3;
  v8 = 0;
  if (objc_msgSend(a1, "fileExistsAtPath:isDirectory:", v4, &v8))
  {
    if (v8)
      v5 = objc_msgSend(a1, "isWritableFileAtPath:", v4);
    else
      v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(a1, "mf_canWriteToDirectoryAtPath:", v6);

  }
  return v5;
}

- (id)mf_copyFileAtURLToContainer:()NSFileManagerAdditions securityScoped:preferredFileName:error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;

  v9 = a3;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, a6) & 1) != 0)
  {
    if (v10)
    {
      v18 = v10;
    }
    else
    {
      objc_msgSend(v9, "lastPathComponent");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v18;
    objc_msgSend(v16, "URLByAppendingPathComponent:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
      objc_msgSend(v9, "startAccessingSecurityScopedResource");
    v22 = objc_msgSend(v17, "copyItemAtURL:toURL:error:", v9, v20, a6);
    if (a4)
      objc_msgSend(v9, "stopAccessingSecurityScopedResource");
    if (v22)
      v23 = v20;
    else
      v23 = 0;
    v19 = v23;

  }
  else
  {
    v19 = 0;
    v20 = v16;
  }

  return v19;
}

- (id)mf_fileModificationDateAtPath:()NSFileManagerAdditions traverseLink:
{
  id v5;
  timespec v6;
  id v7;
  const char *v8;
  int v9;
  void *v10;
  stat v12;

  v5 = a3;
  v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  *(timespec *)&v12.st_blksize = v6;
  *(timespec *)v12.st_qspare = v6;
  v12.st_birthtimespec = v6;
  *(timespec *)&v12.st_size = v6;
  v12.st_mtimespec = v6;
  v12.st_ctimespec = v6;
  *(timespec *)&v12.st_uid = v6;
  v12.st_atimespec = v6;
  *(timespec *)&v12.st_dev = v6;
  v7 = objc_retainAutorelease(v5);
  v8 = (const char *)objc_msgSend(v7, "fileSystemRepresentation", *(_OWORD *)&v12.st_dev, *(_OWORD *)&v12.st_uid, *(_OWORD *)&v12.st_atimespec);
  if (a4)
    v9 = stat(v8, &v12);
  else
    v9 = lstat(v8, &v12);
  if (v9)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v12.st_mtimespec.tv_sec);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (uint64_t)mf_sizeForDirectoryAtPath:()NSFileManagerAdditions error:
{
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "mf_sizeForDirectoryAtURL:error:", v6, a4);

  return v7;
}

- (uint64_t)mf_sizeForDirectoryAtURL:()NSFileManagerAdditions error:
{
  id v5;
  uint64_t v6;
  void *v7;
  int *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "fileSystemRepresentation");
  if ((dirstat_np() & 0x80000000) != 0)
  {
    if (a4)
    {
      v12[0] = *MEMORY[0x1E0CB2D50];
      v7 = (void *)MEMORY[0x1E0CB3940];
      v8 = __error();
      objc_msgSend(v7, "stringWithUTF8String:", strerror(*v8));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[1] = *MEMORY[0x1E0CB3308];
      v13[0] = v9;
      v13[1] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v6 = -1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mf_pathsAtDirectory:()NSFileManagerAdditions beginningWithString:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "contentsOfDirectoryAtPath:error:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (objc_msgSend(v14, "hasPrefix:", v7, (_QWORD)v17))
        {
          objc_msgSend(v6, "stringByAppendingPathComponent:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  return v9;
}

- (void)mf_deleteFilesInSortedArray:()NSFileManagerAdditions matchingPrefix:fromDirectory:
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a5;
  objc_msgSend(v12, "ef_indicesOfStringsWithPrefix:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend(v8, "firstIndex");
    while (v9 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "objectAtIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      unlink((const char *)objc_msgSend(v11, "fileSystemRepresentation"));
      v9 = objc_msgSend(v8, "indexGreaterThanIndex:", v9);

    }
  }

}

- (uint64_t)mf_protectFileAtPath:()NSFileManagerAdditions withClass:error:
{
  id v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (v8)
  {
    switch(a4)
    {
      case 3:
        v16 = *MEMORY[0x1E0CB2AD8];
        v17 = *MEMORY[0x1E0CB2AC0];
        v9 = &v16;
        v10 = &v17;
        break;
      case 2:
        v18 = *MEMORY[0x1E0CB2AD8];
        v19 = *MEMORY[0x1E0CB2AB8];
        v9 = &v18;
        v10 = &v19;
        break;
      case 1:
        v20 = *MEMORY[0x1E0CB2AD8];
        v21[0] = *MEMORY[0x1E0CB2AB0];
        v9 = &v20;
        v10 = v21;
        break;
      default:
        v14 = *MEMORY[0x1E0CB2AD8];
        v15 = *MEMORY[0x1E0CB2AE0];
        v9 = &v14;
        v10 = &v15;
        break;
    }
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(a1, "setAttributes:ofItemAtPath:error:", v12, v8, a5);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)mf_setValue:()NSFileManagerAdditions forExtendedAttribute:ofItemAtPath:error:
{
  id v9;
  id v10;
  __CFString *v11;
  __CFString *v12;
  const char *v13;
  const char *v14;
  id v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = objc_retainAutorelease(a5);
  v12 = v11;
  if (v9)
  {
    v13 = (const char *)-[__CFString fileSystemRepresentation](v11, "fileSystemRepresentation");
    v14 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    v15 = objc_retainAutorelease(v9);
    v16 = setxattr(v13, v14, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 0, 0);
  }
  else
  {
    v16 = removexattr((const char *)-[__CFString fileSystemRepresentation](v11, "fileSystemRepresentation"), (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), 0);
  }
  v17 = v16;
  if (a6 && v16)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *__error();
    if (v12)
      v20 = v12;
    else
      v20 = &stru_1E5AA1FC8;
    v23 = *MEMORY[0x1E0CB2AA0];
    v24[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v19, v21);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v17 == 0;
}

- (id)mf_valueForExtendedAttribute:()NSFileManagerAdditions ofItemAtPath:error:
{
  id v7;
  __CFString *v8;
  const char *v9;
  id v10;
  const char *v11;
  ssize_t v12;
  id v13;
  ssize_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = objc_retainAutorelease(a4);
  v9 = (const char *)-[__CFString fileSystemRepresentation](v8, "fileSystemRepresentation");
  v10 = objc_retainAutorelease(v7);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");
  v12 = getxattr(v9, v11, 0, 0, 0, 0);
  if (v12 < 0)
  {
    if (!a5)
    {
      v13 = 0;
      goto LABEL_15;
    }
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *__error();
    if (v8)
      v21 = v8;
    else
      v21 = &stru_1E5AA1FC8;
    v23 = *MEMORY[0x1E0CB2AA0];
    v24 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v20, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    goto LABEL_13;
  }
  +[MFMutableData dataWithCapacity:](MFMutableData, "dataWithCapacity:", v12);
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v14 = getxattr(v9, v11, (void *)objc_msgSend(v13, "mutableBytes"), v12, 0, 0);
  if (a5 && v14 != v12)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    if (v8)
      v16 = v8;
    else
      v16 = &stru_1E5AA1FC8;
    v25 = *MEMORY[0x1E0CB2AA0];
    v26[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    *a5 = v18;

  }
LABEL_15:

  return v13;
}

- (id)mf_verifyProtectionClassesForFilesInDirectory:()NSFileManagerAdditions usingBlock:
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  id obj;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v6 = a4;
  v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v25 = *MEMORY[0x1E0C99938];
  v32[0] = *MEMORY[0x1E0C99938];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v22, v7, 0, &__block_literal_global_10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v28;
    v11 = (void *)*MEMORY[0x1E0C99940];
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v6[2](v6, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v11;
        v16 = v15;
        if (v14)
        {
          v26 = 0;
          v17 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v26, v25, 0);
          v18 = v26;

          if (v17 && (objc_msgSend(v18, "isEqualToString:", v14) & 1) == 0)
          {
            objc_msgSend(v13, "URLByStandardizingPath");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "standardizedURL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, v20);

          }
        }
        else
        {
          v18 = v15;
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v9);
  }

  return v23;
}

@end
