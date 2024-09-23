@implementation BMPaths

+ (id)privacyPathname:(id)a3
{
  return a3;
}

+ (id)setsDirectoryForDomain:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "biomeDirectoryForDomain:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory sets](BMStoreDirectory, "sets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pathForStreamType:(unint64_t)a3 domain:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[BMPaths biomeDirectoryForDomain:](BMPaths, "biomeDirectoryForDomain:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory streams](BMStoreDirectory, "streams");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[BMPaths pathComponentForStreamType:](BMPaths, "pathComponentForStreamType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)biomeTemporaryDirectoryForDomain:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "biomeDirectoryForDomain:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory tmp](BMStoreDirectory, "tmp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)computeDirectoryForDomain:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "biomeDirectoryForDomain:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory compute](BMStoreDirectory, "compute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_biomeDirectoryForDomain:(unint64_t)a3 options:(unint64_t)a4
{
  void *v4;

  if (a3 == 1)
  {
    objc_msgSend(a1, "_biomeSystemDataDirectory", 1, a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "_biomeUserDataDirectory:", a4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)_biomeUserDataDirectory:(unint64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(a1, "_pathForTesting", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "_userHome");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("/Library/Biome"));
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

+ (id)_pathForTesting
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "basePathForTesting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

+ (NSString)basePathForTesting
{
  return (NSString *)(id)_bmBasePathForTesting;
}

+ (id)_userHome
{
  return CFSTR("/private/var/mobile");
}

+ (id)biomeDirectoryForDomain:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "_biomeDirectoryForDomain:options:", a3, 1);
}

+ (BOOL)getServiceDomain:(unint64_t *)a3 subpath:(id *)a4 forPath:(id)a5
{
  id v7;
  unint64_t v8;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v7 = a5;
  v8 = 0;
  v9 = 1;
  while (1)
  {
    v10 = v9;
    +[BMPaths _biomeDirectoryForDomain:options:](BMPaths, "_biomeDirectoryForDomain:options:", v8, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "hasSuffix:", CFSTR("/")))
    {
      objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 1);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    if (objc_msgSend(v11, "length"))
    {
      if (objc_msgSend(v7, "hasPrefix:", v11))
      {
        v13 = objc_msgSend(v7, "length");
        if (v13 == objc_msgSend(v11, "length")
          || objc_msgSend(v7, "characterAtIndex:", objc_msgSend(v11, "length")) == 47)
        {
          break;
        }
      }
    }

    v9 = 0;
    v14 = 0;
    v8 = 1;
    if ((v10 & 1) == 0)
      goto LABEL_18;
  }
  if (a3)
    *a3 = v8;
  if (a4)
  {
    v15 = objc_msgSend(v7, "length");
    v16 = objc_msgSend(v11, "length");
    if (v15 >= v16 + 1)
      v17 = v16 + 1;
    else
      v17 = v15;
    objc_msgSend(v7, "substringFromIndex:", v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  v14 = 1;
LABEL_18:

  return v14;
}

+ (id)_pathForLibraryStreamWithDomain:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[BMPaths _biomeDirectoryForDomain:options:](BMPaths, "_biomeDirectoryForDomain:options:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[BMStoreDirectory streams](BMStoreDirectory, "streams");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[BMPaths pathComponentForStreamType:](BMPaths, "pathComponentForStreamType:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)pathComponentForStreamType:(unint64_t)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  switch(a3)
  {
    case 0uLL:
      __biome_log_for_category(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[BMPaths pathComponentForStreamType:].cold.3(v4, v5, v6, v7, v8, v9, v10, v11);
      goto LABEL_11;
    case 1uLL:
      +[BMStoreDirectory public](BMStoreDirectory, "public");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      return v19;
    case 2uLL:
      +[BMStoreDirectory restricted](BMStoreDirectory, "restricted");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      return v19;
    case 3uLL:
      __biome_log_for_category(0);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[BMPaths pathComponentForStreamType:].cold.2(v4, v20, v21, v22, v23, v24, v25, v26);
LABEL_11:

      goto LABEL_12;
    case 4uLL:
      +[BMStoreDirectory private](BMStoreDirectory, "private");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      return v19;
    default:
      __biome_log_for_category(0);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[BMPaths pathComponentForStreamType:].cold.1(a3, v12, v13, v14, v15, v16, v17, v18);

LABEL_12:
      v19 = 0;
      return v19;
  }
}

+ (id)_biomeSystemDataDirectory
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "_pathForTesting");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "_systemRoot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("/private/var/db/biome"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)_systemRoot
{
  return CFSTR("/");
}

+ (id)pathForResource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  int v17;

  v4 = a3;
  v5 = 0;
  switch(objc_msgSend(v4, "type"))
  {
    case 1:
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "pathForStreamIdentifier:streamType:", v6, 2);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 3:
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "pathForDatabase:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_4:
      v5 = (void *)v7;
      goto LABEL_6;
    case 4:
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "descriptors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "pathForSetIdentifier:descriptors:", v6, v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
      goto LABEL_16;
    case 5:
      objc_msgSend(v4, "name");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqual:", CFSTR("BMSyncResource"));

      if (v10)
      {
        objc_msgSend(a1, "syncDirectory");
        v11 = objc_claimAutoreleasedReturnValue();
LABEL_15:
        v5 = (void *)v11;
        goto LABEL_16;
      }
      objc_msgSend(v4, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", CFSTR("BMSharedSyncResource"));

      if (v13)
      {
        objc_msgSend(a1, "sharedSyncDirectoryForDomain:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_msgSend(v4, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", CFSTR("BMFlexibleStorageResource"));

      if (v15)
      {
        objc_msgSend(a1, "localFlexibleStorageDirectory");
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      objc_msgSend(v4, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqual:", CFSTR("BMSetsResource"));

      if (v17)
      {
        objc_msgSend(a1, "setsDirectoryForDomain:", 0);
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_15;
      }
      v5 = 0;
LABEL_16:

      return v5;
    default:
      goto LABEL_16;
  }
}

+ (BOOL)pathIsManaged:(id)a3 domain:(unint64_t *)a4
{
  id v6;
  void *v7;
  BOOL v8;

  v6 = a3;
  if (objc_msgSend(a1, "getServiceDomain:subpath:forPath:", a4, 0, v6))
  {
    +[BMPaths _pathForTesting](BMPaths, "_pathForTesting");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = !v7 || (objc_msgSend(v6, "hasPrefix:", v7) & 1) == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)isTestPathOverridden
{
  return _bmBasePathForTesting != 0;
}

+ (id)optionalBiomeDirectoryForDomainUser
{
  return (id)objc_msgSend(a1, "_biomeDirectoryForDomain:options:", 0, 2);
}

+ (NSString)localComputeDirectory
{
  return (NSString *)objc_msgSend(a1, "computeDirectoryForDomain:", 0);
}

+ (NSString)localFlexibleStorageDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "biomeDirectoryForDomain:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory flexibleStorage](BMStoreDirectory, "flexibleStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (NSString)syncDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "biomeDirectoryForDomain:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory sync](BMStoreDirectory, "sync");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)pathForSharedSyncWithAccount:(id)a3 domain:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  objc_msgSend(a3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BMIdentifierIsPathSafe(v7) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BMPaths.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("BMIdentifierIsPathSafe(identifier)"));

  }
  +[BMPaths sharedSyncDirectoryForDomain:](BMPaths, "sharedSyncDirectoryForDomain:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)pathForSharedSyncWithAccount:(id)a3 streamType:(unint64_t)a4 domain:(unint64_t)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "pathForSharedSyncWithAccount:domain:", a3, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory streams](BMStoreDirectory, "streams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[BMPaths pathComponentForStreamType:](BMPaths, "pathComponentForStreamType:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)sharedSyncDirectoryForDomain:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[BMPaths biomeDirectoryForDomain:](BMPaths, "biomeDirectoryForDomain:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory sharedSync](BMStoreDirectory, "sharedSync");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pathForStreamIdentifier:(id)a3 streamType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  if (BMIdentifierIsPathSafe(v6))
  {
    objc_msgSend(a1, "pathForStreamType:domain:", a4, BMServiceDomainForStream(a4, v6));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)databaseDirectoryForDomain:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "biomeDirectoryForDomain:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStoreDirectory databases](BMStoreDirectory, "databases");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)pathForDatabase:(id)a3
{
  id v4;
  BMResourceSpecifier *v5;
  BMResourceSpecifier *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v5 = -[BMResourceSpecifier initWithType:name:]([BMResourceSpecifier alloc], "initWithType:name:", 3, v4);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(a1, "databaseDirectoryForDomain:", BMServiceDomainForResource(v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    __biome_log_for_category(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[BMPaths pathForDatabase:].cold.1((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

    v8 = 0;
  }

  return v8;
}

+ (id)pathForSetIdentifier:(id)a3 descriptors:(id)a4
{
  id v6;
  id v7;
  BMResourceSpecifier *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = a4;
  v8 = -[BMResourceSpecifier initWithType:name:descriptors:]([BMResourceSpecifier alloc], "initWithType:name:descriptors:", 4, v6, v7);

  if (v8)
  {
    objc_msgSend(a1, "setsDirectoryForDomain:", BMServiceDomainForResource(v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", BMSetsDefaultDataSiteName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "dataResourcePathComponentFromResource:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v12;
    }

  }
  else
  {
    __biome_log_for_category(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[BMPaths pathForDatabase:].cold.1((uint64_t)v6, v13, v14, v15, v16, v17, v18, v19);

    v10 = 0;
  }

  return v10;
}

+ (id)privacyURLToString:(id)a3
{
  return (id)objc_msgSend(a3, "absoluteString");
}

+ (void)setBasePathForTestingWithPath:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    bzero(v7, 0x400uLL);
    realpath_DARWIN_EXTSN((const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation"), v7);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_bmBasePathForTesting;
    _bmBasePathForTesting = v4;

  }
  else
  {
    v6 = (void *)_bmBasePathForTesting;
    _bmBasePathForTesting = 0;

  }
}

+ (void)unsetBasePathForTesting
{
  void *v2;

  v2 = (void *)_bmBasePathForTesting;
  _bmBasePathForTesting = 0;

}

+ (id)dataResourcePathComponentFromResource:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&stru_1E5E40E10, "stringByAppendingPathComponent:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "descriptors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  +[BMResourceDescriptor sortedDescriptorsDetectingDuplicates:error:](BMResourceDescriptor, "sortedDescriptorsDetectingDuplicates:error:", v6, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        v15 = 0;
        v16 = v5;
        do
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15), "encodedString", (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByAppendingPathComponent:", v17);
          v5 = (id)objc_claimAutoreleasedReturnValue();

          ++v15;
          v16 = v5;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v13);
    }

    v5 = v5;
    v10 = v5;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)resourceFromDataResourcePath:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  BMResourceSpecifier *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  BMResourceDescriptor *v26;
  BMResourceDescriptor *v27;
  BOOL v28;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  if (v3)
  {
    v5 = (void *)objc_opt_new();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v3, "pathComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v36;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        if ((objc_msgSend(v12, "isEqualToString:", CFSTR("/")) & 1) == 0)
          objc_msgSend(v5, "addObject:", v12);
        if ((objc_msgSend(v12, "isEqualToString:", BMSetsDefaultDataSiteName) & 1) != 0)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

    objc_msgSend(v5, "reverseObjectEnumerator");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "objectAtIndex:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", BMSetsDefaultDataSiteName);

      v18 = 0;
      if (!v17)
      {
LABEL_31:

        goto LABEL_32;
      }
      objc_msgSend(v15, "removeObjectAtIndex:", 0);
      if (objc_msgSend(v15, "count"))
      {
        objc_msgSend(v15, "objectAtIndex:", 0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "removeObjectAtIndex:", 0);
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v20 = v15;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v32;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v32 != v23)
                objc_enumerationMutation(v20);
              v25 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
              v26 = [BMResourceDescriptor alloc];
              v30 = 0;
              v27 = -[BMResourceDescriptor initWithEncodedString:error:](v26, "initWithEncodedString:error:", v25, &v30);
              if (v27)
                v28 = v30 == 0;
              else
                v28 = 0;
              if (v28)
                objc_msgSend(v4, "addObject:", v27);

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v22);
        }

        v18 = -[BMResourceSpecifier initWithType:name:descriptors:]([BMResourceSpecifier alloc], "initWithType:name:descriptors:", 4, v19, v4);
        goto LABEL_31;
      }
    }
    v18 = 0;
    goto LABEL_31;
  }
  v18 = 0;
LABEL_32:

  return v18;
}

+ (void)pathComponentForStreamType:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEB31000, a2, a3, "Attempt to look up stream path for unknown stream type %lu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

+ (void)pathComponentForStreamType:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, a1, a3, "Attempt to look up stream path through access client for private stream", a5, a6, a7, a8, 0);
}

+ (void)pathComponentForStreamType:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1AEB31000, a1, a3, "Attempt to look up stream path for unsupported stream type BMStreamTypeUnknown", a5, a6, a7, a8, 0);
}

+ (void)pathForDatabase:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEB31000, a2, a3, "Failed to create resource specifier for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
