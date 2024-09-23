@implementation NSString(MFSharedResourcesDirectoryPathUtils)

- (id)mf_betterStringByResolvingSymlinksInPath
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  _MFLockGlobalLock();
  v2 = (void *)mf_betterStringByResolvingSymlinksInPath_resolvedPaths;
  if (!mf_betterStringByResolvingSymlinksInPath_resolvedPaths)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = (void *)mf_betterStringByResolvingSymlinksInPath_resolvedPaths;
    mf_betterStringByResolvingSymlinksInPath_resolvedPaths = (uint64_t)v3;

    v2 = (void *)mf_betterStringByResolvingSymlinksInPath_resolvedPaths;
  }
  objc_msgSend(v2, "objectForKey:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _MFUnlockGlobalLock();
  if (!v5)
  {
    objc_msgSend(a1, "stringByResolvingSymlinksInPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      _MFLockGlobalLock();
      objc_msgSend((id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths, "setObject:forKey:", v5, a1);
      objc_msgSend((id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths, "setObject:forKey:", v5, v5);
      _MFUnlockGlobalLock();
    }
  }
  return v5;
}

- (id)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("~")) & 1) == 0)
  {
    if (mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir)
    {
      v2 = 0;
    }
    else
    {
      objc_msgSend(CFSTR("~"), "mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mf_betterStringByResolvingSymlinksInPath");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      _MFLockGlobalLock();
      if (!mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir)
        objc_storeStrong((id *)&mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir, v2);
      _MFUnlockGlobalLock();
    }
    if (objc_msgSend(v1, "hasPrefix:"))
    {
      objc_msgSend(v1, "substringFromIndex:", objc_msgSend((id)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir, "length"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("~"), "stringByAppendingString:", v4);
      v5 = objc_claimAutoreleasedReturnValue();

      v1 = (void *)v5;
    }

  }
  return v1;
}

- (id)mf_canonicalizedAbsolutePath
{
  const char *v1;
  char *v2;
  void *v3;
  void *v4;

  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation");
  v2 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  realpath_DARWIN_EXTSN(v1, v2);
  if (*v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", v2, strlen(v2));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  free(v2);
  return v4;
}

- (id)mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath
{
  unint64_t v2;
  unint64_t v3;
  _WORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = objc_msgSend(a1, "length");
  if (v2 >= 0x400)
    v3 = 1024;
  else
    v3 = v2;
  v4 = malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
  objc_msgSend(a1, "getCharacters:range:", v4, 0, v3);
  if (v3 >= 2)
  {
    while (v4[v3 - 1] == 47)
    {
      if (v3-- <= 2)
      {
        v3 = 1;
        if (*v4 == 126)
          goto LABEL_14;
        goto LABEL_17;
      }
    }
  }
  if ((uint64_t)v3 >= 1 && *v4 == 126)
  {
    if (v3 >= 2)
    {
      if (v4[1] != 47)
        goto LABEL_17;
    }
    else
    {
      v3 = 1;
    }
LABEL_14:
    CPSharedResourcesDirectory();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    v7 = v6;
    v8 = v6 + v3 - 1;
    if (v8 <= 1024)
    {
      memmove(&v4[v6], v4 + 1, 2 * (v3 - 1));
      objc_msgSend(v5, "getCharacters:range:", v4, 0, v7);
      v3 = v8;
    }

  }
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v4, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  free(v4);
  return v9;
}

- (id)mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  _WORD *v5;
  size_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  uint64_t v16;
  _WORD *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "length");
  v3 = v2;
  if (v2 < 1)
    return v1;
  MEMORY[0x1E0C80A78](v2);
  v5 = (_WORD *)((char *)&v20 - v4);
  memset((char *)&v20 - v4, 170, v6);
  if (v3 >= 0x101)
    v5 = malloc_type_malloc(2 * v3, 0x1000040BDFB0063uLL);
  else
    bzero(v5, 2 * v3);
  objc_msgSend(v1, "getCharacters:range:", v5, 0, v3);
  if (v3 >= 2)
  {
    v7 = v3;
    while (v5[v7 - 1] == 47)
    {
      if (v7-- <= 2)
        goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_9:
  v7 = 1;
  if (*v5 != 47)
  {
LABEL_10:
    CPSharedResourcesDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    v10 = v9;
    v11 = v7 - v9;
    if ((uint64_t)v7 >= v9)
    {
      v20 = (uint64_t)&v20;
      if ((unint64_t)v9 <= 1)
        v12 = 1;
      else
        v12 = v9;
      MEMORY[0x1E0C80A78](v9);
      v14 = (char *)&v20 - v13;
      memset((char *)&v20 - v13, 170, v15);
      if ((unint64_t)v10 >= 0x101)
        v14 = (char *)malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
      else
        bzero(v14, 2 * v12);
      objc_msgSend(v8, "getCharacters:range:", v14, 0, v10, v20, v21);
      if (v10 < 1)
      {
        v16 = 0;
      }
      else
      {
        v16 = 0;
        while (v5[v16] == *(_WORD *)&v14[2 * v16])
        {
          if (v10 == ++v16)
          {
            v16 = v10;
            break;
          }
        }
      }
      if ((unint64_t)v10 >= 0x101)
        free(v14);
      if (v16 == v7)
      {
        *v5 = 126;
        v7 = 1;
      }
      else if (v16 == v10)
      {
        v17 = &v5[v10];
        if (*v17 == 47)
        {
          memmove(v5 + 1, v17, 2 * v11);
          *v5 = 126;
          v7 = v11 + 1;
        }
      }
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v5, v7);
  v18 = objc_claimAutoreleasedReturnValue();

  if (v3 >= 0x101)
    free(v5);
  v1 = (id)v18;
  return v1;
}

@end
