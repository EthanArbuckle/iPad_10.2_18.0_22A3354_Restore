@implementation BMStreamMigrations

+ (id)libraryPathForStreamIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  +[BMPublicStreamUtilities libraryPublicStreamMigrationPaths](BMPublicStreamUtilities, "libraryPublicStreamMigrationPaths");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[BMStreamMigrations libraryRestrictedStreamMigrationPaths](BMStreamMigrations, "libraryRestrictedStreamMigrationPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)libraryRestrictedStreamMigrationPaths
{
  return &unk_1E5E4A428;
}

+ (id)legacyClassNameForLibraryStream:(id)a3
{
  return (id)objc_msgSend(&unk_1E5E4A450, "objectForKeyedSubscript:", a3);
}

+ (id)pathToVersionFile
{
  void *v2;
  void *v3;

  +[BMPaths biomeDirectoryForDomain:](BMPaths, "biomeDirectoryForDomain:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("databaseVersion.json"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)handleFloatReturnValue:(id)a3
{
  id v3;
  double v4;
  int64_t v5;

  v3 = a3;
  objc_msgSend(v3, "doubleValue");
  if (v4 <= 0.0 || v4 >= 0.99)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 1;

  return v5;
}

+ (int64_t)readCurrentDatabaseVersion
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  int64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  uint8_t buf[8];
  id v27;

  +[BMStreamMigrations pathToVersionFile](BMStreamMigrations, "pathToVersionFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v2, 0, &v27);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v27;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v2);

    __biome_log_for_category(0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AEB31000, v9, OS_LOG_TYPE_DEFAULT, "Unable to read existing database version file. Using 1 as the default version", buf, 2u);
      }
      v10 = 1;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[BMStreamMigrations readCurrentDatabaseVersion].cold.2((uint64_t)v5, v9, v18, v19, v20, v21, v22, v23);
      v10 = 0;
    }
  }
  else
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v25);
    v9 = objc_claimAutoreleasedReturnValue();
    v5 = v25;
    if (v5)
    {
      __biome_log_for_category(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[BMStreamMigrations readCurrentDatabaseVersion].cold.1((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
      v10 = 0;
    }
    else
    {
      -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Version"));
      v11 = objc_claimAutoreleasedReturnValue();
      v10 = +[BMStreamMigrations handleFloatReturnValue:](BMStreamMigrations, "handleFloatReturnValue:", v11);
    }

  }
  return v10;
}

+ (void)setDatabaseVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[BMStreamMigrations pathToVersionFile](BMStreamMigrations, "pathToVersionFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CFSTR("Version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v22);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v22;
  objc_msgSend(v5, "stringByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v9;
  objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v21);
  v11 = v21;

  v20 = v11;
  objc_msgSend(v8, "writeToFile:options:error:", v5, 268435457, &v20);
  v12 = v20;

  if (v12)
  {
    __biome_log_for_category(0);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[BMStreamMigrations setDatabaseVersion:].cold.1((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);

  }
}

- (void)migrate
{
  -[BMStreamMigrations migrateFromVersion:](self, "migrateFromVersion:", +[BMStreamMigrations readCurrentDatabaseVersion](BMStreamMigrations, "readCurrentDatabaseVersion"));
}

- (void)migrateFromVersion:(int64_t)a3
{
  int64_t v3;
  NSObject *v5;
  void *v6;
  BMStreamMigrations *v7;
  void *v8;
  void *v9;
  void *v10;
  BMStreamMigrations *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3 != 9)
  {
    v3 = a3;
    __biome_log_for_category(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v6;
      v15 = 2112;
      v16 = &unk_1E5E48A50;
      _os_log_impl(&dword_1AEB31000, v5, OS_LOG_TYPE_DEFAULT, "Initiating Biome migration from version %@ to version %@.", (uint8_t *)&v13, 0x16u);

    }
    if (v3 <= 8)
    {
      do
      {
        switch(v3)
        {
          case 0:
            -[BMStreamMigrations _removeStreamPaths:](self, "_removeStreamPaths:", &unk_1E5E49E98);
            v7 = self;
            v8 = &unk_1E5E4A360;
            goto LABEL_16;
          case 1:
            +[BMPublicStreamUtilities libraryPublicStreamMigrationPaths](BMPublicStreamUtilities, "libraryPublicStreamMigrationPaths");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMStreamMigrations _migrateStreamsToLibrary:streamType:](self, "_migrateStreamsToLibrary:streamType:", v9, 1);

            +[BMStreamMigrations libraryRestrictedStreamMigrationPaths](BMStreamMigrations, "libraryRestrictedStreamMigrationPaths");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            -[BMStreamMigrations _migrateStreamsToLibrary:streamType:](self, "_migrateStreamsToLibrary:streamType:", v10, 2);

            break;
          case 2:
            -[BMStreamMigrations _moveStreamsWithPathMapping:](self, "_moveStreamsWithPathMapping:", &unk_1E5E4A388);
            v11 = self;
            v12 = &unk_1E5E49EB0;
            goto LABEL_13;
          case 3:
            v7 = self;
            v8 = &unk_1E5E4A3B0;
            goto LABEL_16;
          case 4:
            v11 = self;
            v12 = &unk_1E5E49EC8;
            goto LABEL_13;
          case 5:
            if (!objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
              break;
            v11 = self;
            v12 = &unk_1E5E49EE0;
LABEL_13:
            -[BMStreamMigrations _removeStreamPaths:](v11, "_removeStreamPaths:", v12);
            break;
          case 6:
            v7 = self;
            v8 = &unk_1E5E4A3D8;
            goto LABEL_16;
          case 7:
            v7 = self;
            v8 = &unk_1E5E4A400;
LABEL_16:
            -[BMStreamMigrations _moveStreamsWithPathMapping:](v7, "_moveStreamsWithPathMapping:", v8);
            break;
          default:
            break;
        }
        +[BMStreamMigrations setDatabaseVersion:](BMStreamMigrations, "setDatabaseVersion:", ++v3);
      }
      while (v3 != 9);
    }
  }
}

- (void)_moveStreamsWithPathMapping:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  uint64_t v18;
  char v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  __int128 v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v29;
    v25 = *MEMORY[0x1E0CB28A8];
    *(_QWORD *)&v7 = 138543874;
    v24 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v11, v24);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v4, "fileExistsAtPath:", v12) & 1) != 0)
        {
          __biome_log_for_category(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v11;
            v34 = 2114;
            v35 = v12;
            _os_log_impl(&dword_1AEB31000, v13, OS_LOG_TYPE_INFO, "Skipping migration of %{public}@ to %{public}@ because destination already exists", buf, 0x16u);
          }
          v14 = 0;
        }
        else
        {
          v27 = 0;
          v15 = objc_msgSend(v4, "moveItemAtPath:toPath:error:", v11, v12, &v27);
          v16 = v27;
          v14 = v16;
          if ((v15 & 1) != 0)
            goto LABEL_21;
          objc_msgSend(v16, "domain");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v17, "isEqualToString:", v25))
          {

LABEL_18:
            __biome_log_for_category(0);
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v24;
              v33 = v11;
              v34 = 2114;
              v35 = v12;
              v36 = 2114;
              v37 = v14;
              _os_log_error_impl(&dword_1AEB31000, v13, OS_LOG_TYPE_ERROR, "Failed to migrate %{public}@ to %{public}@ with error %{public}@", buf, 0x20u);
            }
            goto LABEL_20;
          }
          if (objc_msgSend(v14, "code") == 260)
          {

          }
          else
          {
            v18 = objc_msgSend(v14, "code");

            if (v18 != 4)
              goto LABEL_18;
          }
          __biome_log_for_category(0);
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543618;
            v33 = v11;
            v34 = 2114;
            v35 = v12;
            _os_log_impl(&dword_1AEB31000, v13, OS_LOG_TYPE_INFO, "Skipping migration of %{public}@ to %{public}@ because source does not exist", buf, 0x16u);
          }
        }
LABEL_20:

LABEL_21:
        v26 = v14;
        v19 = objc_msgSend(v4, "removeItemAtPath:error:", v11, &v26);
        v20 = v26;

        if ((v19 & 1) != 0)
          goto LABEL_29;
        objc_msgSend(v20, "domain");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v21, "isEqualToString:", v25))
        {
          v22 = objc_msgSend(v20, "code");

          if (v22 == 4)
            goto LABEL_29;
        }
        else
        {

        }
        __biome_log_for_category(0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v33 = v11;
          v34 = 2114;
          v35 = v20;
          _os_log_error_impl(&dword_1AEB31000, v23, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@ with error %{public}@", buf, 0x16u);
        }

LABEL_29:
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v38, 16);
    }
    while (v8);
  }

}

- (void)_removeStreamPaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v22;
    v10 = *MEMORY[0x1E0CB28A8];
    *(_QWORD *)&v7 = 138543618;
    v19 = v7;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v20 = 0;
        v13 = objc_msgSend(v4, "removeItemAtPath:error:", v12, &v20, v19);
        v14 = v20;
        v15 = v14;
        if ((v13 & 1) == 0)
        {
          objc_msgSend(v14, "domain");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "isEqualToString:", v10))
          {
            v17 = objc_msgSend(v15, "code");

            if (v17 == 4)
              goto LABEL_14;
          }
          else
          {

          }
          __biome_log_for_category(0);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v19;
            v26 = v12;
            v27 = 2114;
            v28 = v15;
            _os_log_error_impl(&dword_1AEB31000, v18, OS_LOG_TYPE_ERROR, "Failed to remove %{public}@ with error %{public}@", buf, 0x16u);
          }

        }
LABEL_14:

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }

}

- (void)_migrateStreamsToLibrary:(id)a3 streamType:(unint64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  NSObject *v25;
  char v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  char v32;
  NSObject *v33;
  __int128 v34;
  uint64_t v35;
  unint64_t v36;
  id obj;
  id v38;
  id v39;
  id v40;
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v43;
    v35 = *MEMORY[0x1E0CB28A8];
    v11 = 0x1E5E3B000uLL;
    *(_QWORD *)&v8 = 138412290;
    v34 = v8;
    v36 = a4;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v43 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(*(id *)(v11 + 3280), "pathForStreamIdentifier:streamType:", v13, a4, v34);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "fileExistsAtPath:", v14))
        {
          __biome_log_for_category(0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v34;
            v47 = v13;
            _os_log_debug_impl(&dword_1AEB31000, v15, OS_LOG_TYPE_DEBUG, "Migrating stream %@ to BMLibrary.", buf, 0xCu);
          }

          v16 = v11;
          v17 = *(void **)(v11 + 3280);
          objc_msgSend(obj, "valueForKey:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "pathForStreamIdentifier:streamType:", v18, 2);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          __biome_log_for_category(0);
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v34;
            v47 = v19;
            _os_log_debug_impl(&dword_1AEB31000, v20, OS_LOG_TYPE_DEBUG, "New path: %@", buf, 0xCu);
          }

          v41 = 1;
          objc_msgSend(v19, "stringByDeletingLastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v6, "fileExistsAtPath:isDirectory:", v21, &v41);

          if ((v22 & 1) != 0)
          {
            v23 = 0;
          }
          else
          {
            objc_msgSend(v19, "stringByDeletingLastPathComponent");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = 0;
            objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v24, 1, 0, &v40);
            v23 = v40;

            if (v23)
            {
              __biome_log_for_category(0);
              v25 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v34;
                v47 = v23;
                _os_log_error_impl(&dword_1AEB31000, v25, OS_LOG_TYPE_ERROR, "Error creating migrated path: %@", buf, 0xCu);
              }

            }
          }
          v39 = v23;
          v26 = objc_msgSend(v6, "moveItemAtPath:toPath:error:", v14, v19, &v39);
          v27 = v39;

          if ((v26 & 1) != 0)
          {
            v28 = v27;
LABEL_30:
            a4 = v36;

            v11 = v16;
            goto LABEL_31;
          }
          objc_msgSend(v27, "domain");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v29, "isEqual:", v35))
          {
            v30 = objc_msgSend(v27, "code");

            if (v30 == 516)
            {
              __biome_log_for_category(0);
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = v34;
                v47 = v19;
                _os_log_impl(&dword_1AEB31000, v31, OS_LOG_TYPE_DEFAULT, "Skip migrating stream since the new path already exists: %@", buf, 0xCu);
              }
LABEL_26:

              v38 = v27;
              v32 = objc_msgSend(v6, "removeItemAtPath:error:", v14, &v38);
              v28 = v38;

              if ((v32 & 1) == 0)
              {
                __biome_log_for_category(0);
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v34;
                  v47 = v28;
                  _os_log_error_impl(&dword_1AEB31000, v33, OS_LOG_TYPE_ERROR, "Error removing old stream, %@", buf, 0xCu);
                }

              }
              goto LABEL_30;
            }
          }
          else
          {

          }
          __biome_log_for_category(0);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v34;
            v47 = v27;
            _os_log_error_impl(&dword_1AEB31000, v31, OS_LOG_TYPE_ERROR, "Error moving stream to library location, %@", buf, 0xCu);
          }
          goto LABEL_26;
        }
LABEL_31:

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v9);
  }

}

+ (Class)legacyClassForLibraryStream:(id)a3
{
  NSString *v3;
  NSString *v4;
  void *v5;

  objc_msgSend(a1, "legacyClassNameForLibraryStream:", a3);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    NSClassFromString(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (Class)v5;
}

+ (void)readCurrentDatabaseVersion
{
  OUTLINED_FUNCTION_0(&dword_1AEB31000, a2, a3, "Error reading migration version file, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

+ (void)setDatabaseVersion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1AEB31000, a2, a3, "Error writing migration version file, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
