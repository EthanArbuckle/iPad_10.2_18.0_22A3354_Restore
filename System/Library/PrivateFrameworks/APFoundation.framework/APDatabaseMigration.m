@implementation APDatabaseMigration

- (APDatabaseMigration)initWithDatabasePath:(id)a3
{
  id v5;
  APDatabaseMigration *v6;
  APDatabaseMigration *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSArray *sortedScriptsURLs;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)APDatabaseMigration;
  v6 = -[APDatabaseMigration init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_databasePath, a3);
    objc_msgSend__buildSortedURLs(v7, v8, v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    sortedScriptsURLs = v7->_sortedScriptsURLs;
    v7->_sortedScriptsURLs = (NSArray *)v11;

  }
  return v7;
}

- (int64_t)lastVersion
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  int64_t VersionFromFileAtURL;
  NSObject *v22;
  id v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_sortedScriptsURLs(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (v9)
  {
    objc_msgSend_sortedScriptsURLs(self, v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lastObject(v13, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    VersionFromFileAtURL = objc_msgSend__getVersionFromFileAtURL_(self, v18, (uint64_t)v17, v19);
    return VersionFromFileAtURL;
  }
  else
  {
    APLogForCategory(0xBuLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v24 = 138477827;
      v25 = (id)objc_opt_class();
      v23 = v25;
      _os_log_impl(&dword_1CF251000, v22, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: No migration files found.", (uint8_t *)&v24, 0xCu);

    }
    return 0;
  }
}

- (id)getMigrationQueriesFromVersion:(int)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend_lastVersion(self, a2, *(uint64_t *)&a3, v3) == a3)
    return MEMORY[0x1E0C9AA60];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend_sortedScriptsURLs(self, v11, v12, v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v36, (uint64_t)v44, 16);
  if (v16)
  {
    v19 = v16;
    v20 = a3;
    v21 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v37 != v21)
          objc_enumerationMutation(v14);
        v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        if (objc_msgSend__getVersionFromFileAtURL_(self, v17, (uint64_t)v23, v18) > v20)
        {
          objc_msgSend__getQueriesForFileAtURL_(self, v17, (uint64_t)v23, v18);
          v24 = objc_claimAutoreleasedReturnValue();
          if (!v24)
          {
            APLogForCategory(0xBuLL);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v30 = (void *)objc_opt_class();
              v31 = v30;
              objc_msgSend_absoluteString(v23, v32, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138478083;
              v41 = v30;
              v42 = 2113;
              v43 = v35;
              _os_log_impl(&dword_1CF251000, v29, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: No migration queries found at path: %{private}@.", buf, 0x16u);

            }
            v28 = 0;
            goto LABEL_17;
          }
          v27 = (void *)v24;
          objc_msgSend_addObjectsFromArray_(v10, v25, v24, v26);

        }
      }
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v36, (uint64_t)v44, 16);
      if (v19)
        continue;
      break;
    }
  }

  v28 = v10;
LABEL_17:

  return v28;
}

- (id)_getQueriesForFileAtURL:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend_dataWithContentsOfURL_(MEMORY[0x1E0C99D50], v4, (uint64_t)v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v27 = 0;
    objc_msgSend_propertyListWithData_options_format_error_(MEMORY[0x1E0CB38B0], v6, (uint64_t)v7, 0, 0, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v27;
    if (v11)
    {
      APLogForCategory(0xBuLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (void *)objc_opt_class();
        v14 = v13;
        objc_msgSend_localizedDescription(v11, v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v29 = v13;
        v30 = 2114;
        v31 = v18;
        _os_log_impl(&dword_1CF251000, v12, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: Could not create dictionary from data: %{public}@.", buf, 0x16u);

      }
      v19 = 0;
    }
    else
    {
      objc_msgSend_objectForKey_(v8, v9, (uint64_t)CFSTR("Queries"), v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    APLogForCategory(0xBuLL);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v20 = (void *)objc_opt_class();
      v21 = v20;
      objc_msgSend_absoluteString(v3, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478083;
      v29 = v20;
      v30 = 2113;
      v31 = v25;
      _os_log_impl(&dword_1CF251000, v11, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: No data found at path: %{private}@.", buf, 0x16u);

    }
    v19 = 0;
  }

  return v19;
}

- (id)_buildSortedURLs
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  id v20;
  const char *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend_databasePath(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_migrationScriptsPath(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v9, (uint64_t)v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_defaultManager(MEMORY[0x1E0CB3620], v12, v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = *MEMORY[0x1E0C99A90];
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v37, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend_contentsOfDirectoryAtURL_includingPropertiesForKeys_options_error_(v15, v18, (uint64_t)v11, (uint64_t)v17, 4, &v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v32;

    if (v20)
    {
      APLogForCategory(0xBuLL);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_opt_class();
        v25 = v24;
        objc_msgSend_localizedDescription(v20, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138478083;
        v34 = v24;
        v35 = 2114;
        v36 = v29;
        _os_log_impl(&dword_1CF251000, v23, OS_LOG_TYPE_ERROR, "[%{private}@]: Error: Could not get contents of directory: %{public}@.", buf, 0x16u);

      }
      v30 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      objc_msgSend_sortedArrayUsingComparator_(v19, v21, (uint64_t)&unk_1E8C47F50, v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

- (int64_t)_getVersionFromFileAtURL:(id)a3
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;

  objc_msgSend_lastPathComponent(a3, a2, (uint64_t)a3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByDeletingPathExtension(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_integerValue(v8, v9, v10, v11);

  return v12;
}

- (APDatabasePath)databasePath
{
  return self->_databasePath;
}

- (NSArray)sortedScriptsURLs
{
  return self->_sortedScriptsURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedScriptsURLs, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

@end
