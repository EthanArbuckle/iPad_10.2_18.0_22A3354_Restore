@implementation AVTArchiverBasedStorePersistence

+ (id)dbLocationForStoreLocation:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("avatars.db"));
}

+ (id)currentVersion
{
  return +[AVTBackendVersion currentVersion](AVTBackendVersion, "currentVersion");
}

+ (BOOL)contentExistsAtLocation:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (objc_class *)MEMORY[0x24BDD1580];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(a1, "dbLocationForStoreLocation:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "fileExistsAtPath:", v8);

  return v9;
}

+ (BOOL)removeFilesAtLocation:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  BOOL v15;

  v6 = (objc_class *)MEMORY[0x24BDD1580];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(a1, "dbLocationForStoreLocation:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTBackendVersion versionFileLocationForStoreLocation:](AVTBackendVersion, "versionFileLocationForStoreLocation:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "fileExistsAtPath:", v11);

  v15 = 0;
  if (!v12 || objc_msgSend(v8, "removeItemAtURL:error:", v9, a4))
  {
    objc_msgSend(v10, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "fileExistsAtPath:", v13);

    if (!v14 || objc_msgSend(v8, "removeItemAtURL:error:", v10, a4))
      v15 = 1;
  }

  return v15;
}

+ (id)readVersionForStoreAtLocation:(id)a3 error:(id *)a4
{
  return +[AVTBackendVersion versionFromDiskAtLocation:error:](AVTBackendVersion, "versionFromDiskAtLocation:error:", a3, a4);
}

+ (BOOL)writeVersion:(id)a3 toDiskAtLocation:(id)a4 error:(id *)a5
{
  return objc_msgSend(a3, "saveToDiskAtLocation:error:", a4, a5);
}

+ (BOOL)isFileNotFoundError:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", *MEMORY[0x24BDD0B88]))
    v5 = objc_msgSend(v3, "code") == 260 || objc_msgSend(v3, "code") == 4;
  else
    v5 = 0;

  return v5;
}

+ (id)readContentFromDiskAtLocation:(id)a3 logger:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v8 = a3;
  v9 = a4;
  v15 = 0;
  v10 = objc_msgSend(a1, "_createStoreIfNeededAtLocation:logger:error:", v8, v9, &v15);
  v11 = v15;
  v12 = v11;
  if ((v10 & 1) != 0)
  {
    objc_msgSend(a1, "_readContentFromDiskAtLocation:logger:error:", v8, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }

  return v13;
}

+ (id)_readContentFromDiskAtLocation:(id)a3 logger:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  AVTArchiverBasedStoreRoot *v14;
  id v15;
  void *v16;
  AVTArchiverBasedStoreRoot *v17;
  void *v18;
  id v20;
  id v21;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "logReadingBackendAtPath:", v10);

  objc_msgSend(a1, "dbLocationForStoreLocation:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:options:error:", v11, 0, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  if (v12 || (objc_msgSend(a1, "isFileNotFoundError:", v13) & 1) != 0)
  {
    if (objc_msgSend(v12, "length"))
    {
      v20 = v13;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v20);
      v14 = (AVTArchiverBasedStoreRoot *)objc_claimAutoreleasedReturnValue();
      v15 = v20;

      if (!v14)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v15);
        objc_msgSend(v15, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logReadingError:", v16);

        v14 = 0;
      }
      v13 = v15;
    }
    else
    {
      v17 = [AVTArchiverBasedStoreRoot alloc];
      v14 = -[AVTArchiverBasedStoreRoot initWithDomains:records:](v17, "initWithDomains:records:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1A8]);
    }
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(v13);
    objc_msgSend(v13, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logReadingError:", v18);

    v14 = 0;
  }

  return v14;
}

+ (BOOL)writeContent:(id)a3 toDiskAtLocation:(id)a4 logger:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  char v20;
  BOOL v21;
  void *v22;
  id v24;
  id v25;
  id v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "logSavingBackend");
  v13 = objc_alloc_init(MEMORY[0x24BDD1580]);
  v26 = 0;
  v14 = objc_msgSend(a1, "_createStoreFolderIfNeededAtLocation:logger:fileManager:error:", v11, v12, v13, &v26);
  v15 = v26;
  v16 = v15;
  if ((v14 & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v15);
    objc_msgSend(v16, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logSavingError:", v22);
    goto LABEL_8;
  }
  v25 = v15;
  v17 = objc_msgSend(a1, "_writeContent:toDiskAtLocation:logger:error:", v10, v11, v12, &v25);
  v18 = v25;

  if (!v17)
  {
    v21 = 0;
    goto LABEL_11;
  }
  objc_msgSend(a1, "currentVersion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  v20 = objc_msgSend(a1, "writeVersion:toDiskAtLocation:error:", v19, v11, &v24);
  v16 = v24;

  if ((v20 & 1) == 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v16);
    objc_msgSend(v16, "description");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logErrorUpdatingVersion:", v22);
LABEL_8:

    v21 = 0;
    goto LABEL_9;
  }
  v21 = 1;
LABEL_9:
  v18 = v16;
LABEL_11:

  return v21;
}

+ (BOOL)_writeContent:(id)a3 toDiskAtLocation:(id)a4 logger:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  id v20;
  id v21;

  v10 = a4;
  v11 = a5;
  v21 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v21);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v21;
  v14 = v13;
  if (v12)
  {
    objc_msgSend(a1, "dbLocationForStoreLocation:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    v16 = objc_msgSend(v12, "writeToURL:options:error:", v15, AVTDefaultFileProtectionDataWritingOptions() | 1, &v20);
    v17 = v20;

    if ((v16 & 1) == 0)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v17);
      objc_msgSend(v17, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logSavingError:", v18);

    }
    v14 = v17;
  }
  else
  {
    if (a6)
      *a6 = objc_retainAutorelease(v13);
    objc_msgSend(v14, "description");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logSavingError:", v15);
    v16 = 0;
  }

  return v16;
}

+ (BOOL)_createStoreIfNeededAtLocation:(id)a3 logger:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;

  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x24BDD1580]);
  if (objc_msgSend(a1, "_performMigrationIfNeededForStoreAtLocation:logger:fileManager:error:", v8, v9, v10, a5)&& objc_msgSend(a1, "_createStoreFolderIfNeededAtLocation:logger:fileManager:error:", v8, v9, v10, a5))
  {
    objc_msgSend(a1, "dbLocationForStoreLocation:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(a1, "_createStoreEmptyFileIfNeededAtLocation:logger:fileManager:error:", v11, v9, v10, a5);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_performMigrationIfNeededForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  char v16;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  uint64_t v26;
  void *v27;
  double v28;
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29 = 0;
  objc_msgSend(a1, "readVersionForStoreAtLocation:error:", v10, &v29);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v29;
  if (v13 || (objc_msgSend(a1, "isFileNotFoundError:", v14) & 1) != 0)
  {
    objc_msgSend(a1, "currentVersion");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!(v13 | v15) || (objc_msgSend((id)v13, "isEqual:", v15) & 1) != 0)
    {
      v16 = 1;
LABEL_6:

      goto LABEL_7;
    }
    objc_msgSend((id)v13, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v15, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logBackendVersionMismatch:actual:", v18, v19);

    if (v13
      && (objc_msgSend((id)v13, "backendVersion"), v20 >= 0.5)
      && (objc_msgSend((id)v13, "backendVersion"), v22 = v21, objc_msgSend((id)v15, "backendVersion"), v22 <= v23))
    {
      objc_msgSend((id)v13, "backendVersion");
      if (v28 >= 0.6
        || objc_msgSend(a1, "_migrateFromPre0_6ToCurrentForStoreAtLocation:logger:fileManager:error:", v10, v11, v12, a6))
      {
LABEL_12:
        objc_msgSend(a1, "_readContentFromDiskAtLocation:logger:error:", v10, v11, a6);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v24)
          goto LABEL_20;
        objc_msgSend((id)v13, "avatarKitVersion");
        if (v25 < 12.0)
        {
          objc_msgSend(a1, "_migrateDifferentAvatarKitVersionsForContent:logger:", v24, v11);
          v26 = objc_claimAutoreleasedReturnValue();

          v24 = (void *)v26;
        }
        if (objc_msgSend(a1, "_createStoreFolderIfNeededAtLocation:logger:fileManager:error:", v10, v11, v12, a6)&& objc_msgSend(a1, "_writeContent:toDiskAtLocation:logger:error:", v24, v10, v11, a6))
        {
          objc_msgSend(a1, "currentVersion");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(a1, "writeVersion:toDiskAtLocation:error:", v27, v10, a6);

        }
        else
        {
LABEL_20:
          v16 = 0;
        }

        goto LABEL_6;
      }
    }
    else if ((objc_msgSend(a1, "_migrateFromPre0_5ToCurrentForStoreAtLocation:logger:fileManager:error:", v10, v11, v12, a6) & 1) != 0)
    {
      goto LABEL_12;
    }
    v16 = 0;
    goto LABEL_6;
  }
  v16 = 0;
  if (a6)
    *a6 = objc_retainAutorelease(v14);
LABEL_7:

  return v16;
}

+ (BOOL)_migrateFromPre0_5ToCurrentForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  int v11;
  char v12;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
    v12 = objc_msgSend(v9, "removeItemAtURL:error:", v8, a6);
  else
    v12 = 1;

  return v12;
}

+ (BOOL)_migrateFromPre0_6ToCurrentForStoreAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  void *v21;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if (v11)
  {
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "attributesOfItemAtPath:error:", v12, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    if (v14)
    {
      v15 = *MEMORY[0x24BDD0CF0];
      objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BDD0CF0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      AVTDefaultFileProtectionType();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if ((v18 & 1) != 0)
      {
        v19 = 1;
      }
      else
      {
        AVTDefaultFileProtectionType();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, v15);

        objc_msgSend(v8, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v9, "setAttributes:ofItemAtPath:error:", v14, v21, a6);

      }
    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

+ (id)_migrateDifferentAvatarKitVersionsForContent:(id)a3 logger:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  AVTArchiverBasedStoreRoot *v16;
  void *v17;
  AVTArchiverBasedStoreRoot *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v5, "records", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v13, "avatarData");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (+[AVTAvatarRecord canLoadAvatarWithData:](AVTAvatarRecord, "canLoadAvatarWithData:", v14))
        {
          objc_msgSend(v7, "addObject:", v13);
        }
        else
        {
          objc_msgSend(v13, "description");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "logDroppingUnsupportedAvatarRecord:", v15);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  v16 = [AVTArchiverBasedStoreRoot alloc];
  objc_msgSend(v5, "domains");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[AVTArchiverBasedStoreRoot initWithDomains:records:](v16, "initWithDomains:records:", v17, v7);

  return v18;
}

+ (BOOL)_createStoreFolderIfNeededAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v9, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logCreatingBackendFolderAtPath:", v15);

    v14 = 1;
    if ((objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, a6) & 1) == 0)
    {
      objc_msgSend(*a6, "description");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logErrorCreatingBackendContent:", v16);

      v14 = 0;
    }
  }

  return v14;
}

+ (BOOL)_createStoreEmptyFileIfNeededAtLocation:(id)a3 logger:(id)a4 fileManager:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  BOOL v14;
  void *v15;
  id v16;
  char v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v9, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logCreatingBackendDBAtPath:", v15);

    v16 = objc_alloc_init(MEMORY[0x24BDBCE50]);
    v14 = 1;
    v17 = objc_msgSend(v16, "writeToURL:options:error:", v9, 1, a6);

    if ((v17 & 1) == 0)
    {
      objc_msgSend(*a6, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logErrorCreatingBackendContent:", v18);

      v14 = 0;
    }
  }

  return v14;
}

@end
