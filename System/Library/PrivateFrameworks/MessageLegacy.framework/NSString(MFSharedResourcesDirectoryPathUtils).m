@implementation NSString(MFSharedResourcesDirectoryPathUtils)

- (uint64_t)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath
{
  void *v1;
  void *v2;

  v1 = (void *)objc_msgSend(a1, "mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath");
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("~")) & 1) != 0)
    return (uint64_t)v1;
  if (!mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir)
  {
    v2 = (void *)objc_msgSend((id)objc_msgSend(CFSTR("~"), "mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath"), "mf_betterStringByResolvingSymlinksInPath");
    _MFLockGlobalLock();
    if (!mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir)
      mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir = v2;
    _MFUnlockGlobalLock();
  }
  if (!objc_msgSend(v1, "hasPrefix:"))
    return (uint64_t)v1;
  else
    return objc_msgSend(CFSTR("~"), "stringByAppendingString:", objc_msgSend(v1, "substringFromIndex:", objc_msgSend((id)mf_stringByReallyAbbreviatingSharedResourcesDirectoryWithTildeInPath_homeDir, "length")));
}

- (uint64_t)mf_betterStringByResolvingSymlinksInPath
{
  id v2;
  uint64_t v3;

  _MFLockGlobalLock();
  v2 = (id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths;
  if (!mf_betterStringByResolvingSymlinksInPath_resolvedPaths)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    mf_betterStringByResolvingSymlinksInPath_resolvedPaths = (uint64_t)v2;
  }
  v3 = objc_msgSend(v2, "objectForKey:", a1);
  _MFUnlockGlobalLock();
  if (!v3)
  {
    v3 = objc_msgSend(a1, "stringByResolvingSymlinksInPath");
    if (v3)
    {
      _MFLockGlobalLock();
      objc_msgSend((id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths, "setObject:forKey:", v3, a1);
      objc_msgSend((id)mf_betterStringByResolvingSymlinksInPath_resolvedPaths, "setObject:forKey:", v3, v3);
      _MFUnlockGlobalLock();
    }
  }
  return v3;
}

- (uint64_t)mf_canonicalizedAbsolutePath
{
  const char *v1;
  char *v2;
  uint64_t v3;

  v1 = (const char *)objc_msgSend(a1, "fileSystemRepresentation");
  v2 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  realpath_DARWIN_EXTSN(v1, v2);
  if (*v2)
    v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "stringWithFileSystemRepresentation:length:", v2, strlen(v2));
  else
    v3 = 0;
  free(v2);
  return v3;
}

- (uint64_t)mf_stringByExpandingTildeWithSharedResourcesDirectoryInPath
{
  unint64_t v2;
  unint64_t v3;
  _WORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

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
        goto LABEL_16;
      }
    }
  }
  if ((uint64_t)v3 >= 1 && *v4 == 126)
  {
    if (v3 >= 2)
    {
      if (v4[1] != 47)
        goto LABEL_16;
    }
    else
    {
      v3 = 1;
    }
LABEL_14:
    v5 = (void *)CPSharedResourcesDirectory();
    v6 = objc_msgSend(v5, "length");
    v7 = v6 + v3 - 1;
    if (v7 <= 1024)
    {
      v8 = v6;
      memmove(&v4[v6], v4 + 1, 2 * (v3 - 1));
      objc_msgSend(v5, "getCharacters:range:", v4, 0, v8);
      v3 = v7;
    }
  }
LABEL_16:
  v9 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v4, v3);
  free(v4);
  return v9;
}

- (void)mf_stringByAbbreviatingSharedResourcesDirectoryWithTildeInPath
{
  void *v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _WORD *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _WORD *v17;
  _QWORD v19[2];

  v1 = a1;
  v19[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  if (v2 < 1)
    return v1;
  v3 = v2;
  v4 = MEMORY[0x1E0C80A78]();
  v6 = (_WORD *)((char *)v19 - v5);
  if (v4 >= 0x101)
  {
    v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
    objc_msgSend(v1, "getCharacters:range:", v6, 0, v3);
LABEL_6:
    v7 = v3;
    while (v6[v7 - 1] == 47)
    {
      if (v7-- <= 2)
        goto LABEL_9;
    }
    goto LABEL_10;
  }
  bzero((char *)v19 - v5, 2 * v4);
  objc_msgSend(v1, "getCharacters:range:", v6, 0, v3);
  if (v3 >= 2)
    goto LABEL_6;
LABEL_9:
  v7 = 1;
  if (*v6 != 47)
  {
LABEL_10:
    v8 = (void *)CPSharedResourcesDirectory();
    v9 = objc_msgSend(v8, "length");
    v10 = v7 - v9;
    if ((uint64_t)v7 >= v9)
    {
      v11 = v9;
      v12 = MEMORY[0x1E0C80A78]();
      v15 = (char *)v19 - v14;
      if (v12 > 0x100)
        v15 = (char *)malloc_type_malloc(2 * v13, 0x1000040BDFB0063uLL);
      else
        bzero((char *)v19 - v14, 2 * v13);
      objc_msgSend(v8, "getCharacters:range:", v15, 0, v11);
      if (v11 < 1)
      {
        v16 = 0;
      }
      else
      {
        v16 = 0;
        while (v6[v16] == *(_WORD *)&v15[2 * v16])
        {
          if (v11 == ++v16)
          {
            v16 = v11;
            break;
          }
        }
      }
      if ((unint64_t)v11 >= 0x101)
        free(v15);
      if (v16 == v7)
      {
        *v6 = 126;
        v7 = 1;
      }
      else if (v16 == v11)
      {
        v17 = &v6[v11];
        if (*v17 == 47)
        {
          memmove(v6 + 1, v17, 2 * v10);
          *v6 = 126;
          v7 = v10 + 1;
        }
      }
    }
  }
  v1 = (void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v6, v7);
  if (v3 >= 0x101)
    free(v6);
  return v1;
}

@end
