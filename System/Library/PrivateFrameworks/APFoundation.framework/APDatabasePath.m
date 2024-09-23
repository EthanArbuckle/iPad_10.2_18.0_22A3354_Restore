@implementation APDatabasePath

+ (id)pathForName:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;

  v4 = a3;
  objc_msgSend_lockForPath(APDatabasePath, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v8, v9, v10, v11);
  objc_msgSend_pathToNameDictionary(a1, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v15, v16, (uint64_t)v4, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v22 = objc_alloc((Class)objc_msgSend_instanceClass(a1, v19, v20, v21));
    v18 = (void *)objc_msgSend_initWithDatabaseName_(v22, v23, (uint64_t)v4, v24);
    objc_msgSend_pathToNameDictionary(a1, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v28, v29, (uint64_t)v18, (uint64_t)v4);

  }
  objc_msgSend_unlock(v8, v19, v20, v21);

  return v18;
}

+ (id)pathToNameDictionary
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)qword_1ED2BC6E8;
  if (!qword_1ED2BC6E8)
  {
    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], a2, v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)qword_1ED2BC6E8;
    qword_1ED2BC6E8 = v5;

    v4 = (void *)qword_1ED2BC6E8;
  }
  return v4;
}

+ (id)lockForPath
{
  if (qword_1ED2BC618 != -1)
    dispatch_once(&qword_1ED2BC618, &unk_1E8C47F70);
  return (id)qword_1ED2BC6F8;
}

+ (Class)instanceClass
{
  void *v2;

  v2 = (void *)qword_1ED2BC6E0;
  if (!qword_1ED2BC6E0)
  {
    v2 = (void *)objc_opt_class();
    qword_1ED2BC6E0 = (uint64_t)v2;
  }
  return (Class)v2;
}

+ (id)_databaseBundleDirectory
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;

  NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lastObject(v2, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v6, v15, (uint64_t)v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v17, v18, (uint64_t)CFSTR("APDB"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (APDatabasePath)initWithDatabaseName:(id)a3
{
  id v5;
  APDatabasePath *v6;
  APDatabasePath *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APDatabasePath;
  v6 = -[APDatabasePath init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_databaseName, a3);

  return v7;
}

- (id)databaseDirectory
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;

  objc_msgSend__databaseBundleDirectory(APDatabasePath, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseName(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingPathComponent_(v5, v10, (uint64_t)v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)databaseFilePath
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  char v11;
  id v12;
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_databaseDirectory(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  v11 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v5, v10, (uint64_t)v9, 1, 0, &v40);
  v12 = v40;
  if ((v11 & 1) != 0)
  {
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend_databaseName(self, v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathExtension_(v17, v18, (uint64_t)CFSTR("sql3"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByAppendingPathComponent_(v9, v21, (uint64_t)v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend_initWithString_(v13, v24, (uint64_t)v23, v25);

  }
  else
  {
    APLogForCategory(0xBuLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_databaseName(self, v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_debugDescription(v12, v31, v32, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_userInfo(v12, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v30;
      v43 = 2114;
      v44 = v34;
      v45 = 2114;
      v46 = v38;
      _os_log_impl(&dword_1CF251000, v17, OS_LOG_TYPE_ERROR, "Failed to create Database subdirectories for %{public}@, error: %{public}@, userInfo: %{public}@", buf, 0x20u);

    }
    v26 = 0;
  }

  return v26;
}

- (id)migrationScriptsPath
{
  uint64_t v2;
  void *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  objc_msgSend_bundleWithIdentifier_(MEMORY[0x1E0CB34D0], a2, (uint64_t)CFSTR("com.apple.ap.APFoundation"), v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v4)
  {
    objc_msgSend_pathForResource_ofType_(v4, v5, (uint64_t)CFSTR("DatabaseMigrationScritps"), (uint64_t)&stru_1E8C4E328);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend_databaseName(self, v7, v8, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByAppendingPathComponent_(v10, v12, (uint64_t)v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (void)_clearCachedPaths
{
  uint64_t v2;
  uint64_t v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  objc_msgSend_lockForPath(APDatabasePath, a2, v2, v3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v11, v4, v5, v6);
  v7 = (void *)qword_1ED2BC6E8;
  qword_1ED2BC6E8 = 0;

  objc_msgSend_unlock(v11, v8, v9, v10);
}

+ (void)_setInstanceClass:(Class)a3
{
  qword_1ED2BC6E0 = (uint64_t)a3;
}

- (NSString)databaseName
{
  return self->_databaseName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseName, 0);
}

@end
