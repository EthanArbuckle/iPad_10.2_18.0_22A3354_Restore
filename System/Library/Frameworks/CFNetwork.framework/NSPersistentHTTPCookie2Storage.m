@implementation NSPersistentHTTPCookie2Storage

- (NSPersistentHTTPCookie2Storage)init
{
  NSPersistentHTTPCookie2Storage *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NSPersistentHTTPCookie2Storage;
  v2 = -[NSPersistentHTTPCookie2Storage init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", *(_QWORD *)_CFGetProgname(), 4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLsForDirectory:inDomains:", 5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("HTTPStorages"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = -[NSPersistentHTTPCookie2Storage initWithPath:andFileName:]((char *)v2, v9, CFSTR("httpstorages.sqlite"));
  }
  return v2;
}

- (NSPersistentHTTPCookie2Storage)initWithPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;

  v4 = a3;
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", CFSTR("sqlite"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSPersistentHTTPCookie2Storage initWithPath:andFileName:]((char *)self, v7, v6);

  return (NSPersistentHTTPCookie2Storage *)v8;
}

- (void)deleteAllCookies
{
  int v2;
  int v3;
  NSObject *v4;
  char *errmsg;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  errmsg = 0;
  v2 = sqlite3_exec(self->persistentDb, "DELETE FROM cookies;", 0, 0, &errmsg);
  if (v2)
  {
    v3 = v2;
    getCookieLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v7 = v3;
      _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "Failed to delete all cookies. return value = %d", buf, 8u);
    }

  }
}

- (void)deleteCookie:(id)a3
{
  id v4;
  sqlite3_stmt *deleteCookiesStmt;
  id v6;
  const char *v7;
  void *v8;
  int v9;
  NSObject *v10;
  sqlite3_stmt *v11;
  id v12;
  const char *v13;
  void *v14;
  NSObject *v15;
  sqlite3_stmt *v16;
  id v17;
  const char *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  sqlite3_stmt *v25;
  __CFString *v26;
  NSObject *v27;
  NSObject *v28;
  int v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  deleteCookiesStmt = self->deleteCookiesStmt;
  objc_msgSend(v4, "name");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = sqlite3_bind_text(deleteCookiesStmt, 1, v7, objc_msgSend(v8, "length"), 0);

  if (v9)
  {
    getCookieLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v29 = 67109120;
      LODWORD(v30) = v9;
      _os_log_error_impl(&dword_183ECA000, v10, OS_LOG_TYPE_ERROR, "Failed to bind cookie name to the deleteStmt. r = %d", (uint8_t *)&v29, 8u);
    }

  }
  v11 = self->deleteCookiesStmt;
  objc_msgSend(v4, "domain");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  objc_msgSend(v4, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = sqlite3_bind_text(v11, 2, v13, objc_msgSend(v14, "length"), 0) == 0;

  if ((v11 & 1) == 0)
  {
    getCookieLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_183ECA000, v15, OS_LOG_TYPE_ERROR, "Failed to bind cookie domain to the deleteStmt", (uint8_t *)&v29, 2u);
    }

  }
  v16 = self->deleteCookiesStmt;
  objc_msgSend(v4, "path");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (const char *)objc_msgSend(v17, "UTF8String");
  objc_msgSend(v4, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = sqlite3_bind_text(v16, 3, v18, objc_msgSend(v19, "length"), 0) == 0;

  if ((v16 & 1) == 0)
  {
    getCookieLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_183ECA000, v20, OS_LOG_TYPE_ERROR, "Failed to bind cookie path to the deleteStmt", (uint8_t *)&v29, 2u);
    }

  }
  objc_msgSend(v4, "partition");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  v23 = CFSTR("none");
  if (v21)
    v23 = (__CFString *)v21;
  v24 = v23;

  v25 = self->deleteCookiesStmt;
  v26 = objc_retainAutorelease(v24);
  if (sqlite3_bind_text(v25, 4, (const char *)-[__CFString UTF8String](v26, "UTF8String"), -[__CFString length](v26, "length"), 0))
  {
    getCookieLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v29) = 0;
      _os_log_error_impl(&dword_183ECA000, v27, OS_LOG_TYPE_ERROR, "Failed to bind cookie partition to the deleteStmt", (uint8_t *)&v29, 2u);
    }

  }
  if (sqlite3_step(self->deleteCookiesStmt) != 101)
  {
    getCookieLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = 138412290;
      v30 = v4;
      _os_log_error_impl(&dword_183ECA000, v28, OS_LOG_TYPE_ERROR, "Failed to delete cookie = %@", (uint8_t *)&v29, 0xCu);
    }

  }
  sqlite3_reset(self->deleteCookiesStmt);

}

- (void)deleteCookies:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[NSPersistentHTTPCookie2Storage deleteCookie:](self, "deleteCookie:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)deleteCookiesWithFilter:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSPersistentHTTPCookie2Storage getCookiesWithFilter:](self, "getCookiesWithFilter:", v4);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v4, "matchCookie:", v9, (_QWORD)v10))
          -[NSPersistentHTTPCookie2Storage deleteCookie:](self, "deleteCookie:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (id)getAllCookies
{
  NSHTTPCookie2LookupFilter *v3;
  void *v4;

  v3 = objc_alloc_init(NSHTTPCookie2LookupFilter);
  -[NSPersistentHTTPCookie2Storage getCookiesWithFilter:](self, "getCookiesWithFilter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getCookiesWithFilter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  sqlite3_stmt *selectDomainCookiesStmt;
  id v10;
  NSObject *v11;
  sqlite3_stmt *selectAllCookiesStmt;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableHTTPCookie2 *v17;
  void *v18;
  const unsigned __int8 *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  NSObject *v30;
  __int128 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    v13 = 0;
    goto LABEL_36;
  }
  v33 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(CFSTR("%"), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    selectDomainCookiesStmt = self->selectDomainCookiesStmt;
    v10 = objc_retainAutorelease(v8);
    if (sqlite3_bind_text(selectDomainCookiesStmt, 1, (const char *)objc_msgSend(v10, "UTF8String"), objc_msgSend(v10, "length"), 0))
    {
      getCookieLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v10;
        _os_log_error_impl(&dword_183ECA000, v11, OS_LOG_TYPE_ERROR, "Failed to bind cookie domain (%@) to the select statement", buf, 0xCu);
      }

    }
    selectAllCookiesStmt = self->selectDomainCookiesStmt;

    if (!selectAllCookiesStmt)
      goto LABEL_20;
    goto LABEL_11;
  }
  selectAllCookiesStmt = self->selectAllCookiesStmt;
  if (selectAllCookiesStmt)
  {
LABEL_11:
    while (sqlite3_step(selectAllCookiesStmt) == 100)
    {
      if (self)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(selectAllCookiesStmt, 0));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(selectAllCookiesStmt, 1));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(selectAllCookiesStmt, 2));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[NSMutableHTTPCookie2 initWithName:value:domain:]([NSMutableHTTPCookie2 alloc], "initWithName:value:domain:", v14, v15, v16);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(selectAllCookiesStmt, 3));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setPath:](v17, "setPath:", v18);

        v19 = sqlite3_column_text(selectAllCookiesStmt, 4);
        if (!strcmp((const char *)v19, "none"))
        {
          -[NSMutableHTTPCookie2 setPartition:](v17, "setPartition:", CFSTR("none"));
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableHTTPCookie2 setPartition:](v17, "setPartition:", v20);

        }
        -[NSMutableHTTPCookie2 setSecure:](v17, "setSecure:", sqlite3_column_int(selectAllCookiesStmt, 5) != 0);
        -[NSMutableHTTPCookie2 setHostOnly:](v17, "setHostOnly:", sqlite3_column_int(selectAllCookiesStmt, 6) != 0);
        -[NSMutableHTTPCookie2 setHttpOnly:](v17, "setHttpOnly:", sqlite3_column_int(selectAllCookiesStmt, 7) != 0);
        -[NSMutableHTTPCookie2 setSameSite:](v17, "setSameSite:", sqlite3_column_int(selectAllCookiesStmt, 8));
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(selectAllCookiesStmt, 9));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 _setCreationDate:](v17, "_setCreationDate:", v21);

        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(selectAllCookiesStmt, 10));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 setExpirationDate:](v17, "setExpirationDate:", v22);

        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)sqlite3_column_int64(selectAllCookiesStmt, 11));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableHTTPCookie2 _setLastAccessTime:](v17, "_setLastAccessTime:", v23);

      }
      else
      {
        v17 = 0;
      }
      objc_msgSend(v33, "addObject:", v17);

    }
    sqlite3_reset(selectAllCookiesStmt);
  }
LABEL_20:
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v4, "_flags"))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v24 = v33;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v25)
    {
      v27 = *(_QWORD *)v35;
      *(_QWORD *)&v26 = 138412290;
      v32 = v26;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v35 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v4, "matchCookie:", v29, v32))
          {
            objc_msgSend(v13, "addObject:", v29);
          }
          else
          {
            getCookieLogHandle();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v32;
              v40 = v29;
              _os_log_debug_impl(&dword_183ECA000, v30, OS_LOG_TYPE_DEBUG, "[PersistentCookieStore]: Cookie dropped since filters don't match. Cookie = %@", buf, 0xCu);
            }

          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v25);
    }
  }
  else
  {
    v24 = v13;
    v13 = v33;
  }

LABEL_36:
  return v13;
}

- (void)setCookie:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSPersistentHTTPCookie2Storage setCookies:](self, "setCookies:", v5);

}

- (void)setCookies:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  __int128 v7;
  NSObject *v8;
  uint64_t i;
  void *v10;
  sqlite3_stmt *insertCookiesStmt;
  id v12;
  const char *v13;
  void *v14;
  BOOL v15;
  sqlite3_stmt *v16;
  id v17;
  const char *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  sqlite3_stmt *v24;
  NSObject *v25;
  sqlite3_stmt *v26;
  id v27;
  const char *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  sqlite3_stmt *v32;
  NSObject *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  NSObject *v43;
  void *v44;
  const char *v45;
  const char *v46;
  NSObject *v47;
  const char *v48;
  __int128 v49;
  id v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->insertCookiesStmt)
    goto LABEL_64;
  v50 = v4;
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v5 = (id)objc_msgSend(v4, "copy");
  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
  v8 = v5;
  if (!v6)
    goto LABEL_63;
  v51 = *(_QWORD *)v53;
  *(_QWORD *)&v7 = 138412290;
  v49 = v7;
  while (2)
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v53 != v51)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
      insertCookiesStmt = self->insertCookiesStmt;
      objc_msgSend(v10, "name", v49);
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v13 = (const char *)objc_msgSend(v12, "UTF8String");
      objc_msgSend(v10, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = sqlite3_bind_text(insertCookiesStmt, 1, v13, objc_msgSend(v14, "length"), 0) == 0;

      if (!v15)
      {
        getCookieLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          goto LABEL_61;
        *(_WORD *)buf = 0;
        v45 = "Failed to bind cookie name";
LABEL_36:
        _os_log_error_impl(&dword_183ECA000, v25, OS_LOG_TYPE_ERROR, v45, buf, 2u);
        goto LABEL_61;
      }
      v16 = self->insertCookiesStmt;
      objc_msgSend(v10, "value");
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = (const char *)objc_msgSend(v17, "UTF8String");
      objc_msgSend(v10, "value");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = sqlite3_bind_text(v16, 2, v18, objc_msgSend(v19, "length"), 0) == 0;

      if (!v20)
      {
        getCookieLogHandle();
        v25 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          goto LABEL_61;
        *(_WORD *)buf = 0;
        v45 = "Failed to bind cookie value";
        goto LABEL_36;
      }
      objc_msgSend(v10, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "hasPrefix:", CFSTR(".")))
      {
        objc_msgSend(v10, "domain");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v10, "domain");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("."), "stringByAppendingString:", v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v24 = self->insertCookiesStmt;
      v25 = objc_retainAutorelease(v22);
      if (sqlite3_bind_text(v24, 3, (const char *)-[NSObject UTF8String](v25, "UTF8String"), -[NSObject length](v25, "length"), 0))
      {
        getCookieLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v46 = "Failed to bind cookie domain";
LABEL_41:
          _os_log_error_impl(&dword_183ECA000, v33, OS_LOG_TYPE_ERROR, v46, buf, 2u);
        }
LABEL_60:

LABEL_61:
        getCookieLogHandle();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_183ECA000, v8, OS_LOG_TYPE_ERROR, "Failed to set cookies", buf, 2u);
        }
        goto LABEL_63;
      }
      v26 = self->insertCookiesStmt;
      objc_msgSend(v10, "path");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v28 = (const char *)objc_msgSend(v27, "UTF8String");
      objc_msgSend(v10, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v28) = sqlite3_bind_text(v26, 4, v28, objc_msgSend(v29, "length"), 0) == 0;

      if ((v28 & 1) == 0)
      {
        getCookieLogHandle();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v46 = "Failed to bind cookie path";
          goto LABEL_41;
        }
        goto LABEL_60;
      }
      objc_msgSend(v10, "partition");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        objc_msgSend(v10, "partition");
        v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = CFSTR("none");
      }

      v32 = self->insertCookiesStmt;
      v33 = objc_retainAutorelease(v31);
      if (sqlite3_bind_text(v32, 5, (const char *)-[NSObject UTF8String](v33, "UTF8String"), -[NSObject length](v33, "length"), 0))
      {
        getCookieLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie partition";
LABEL_58:
        _os_log_error_impl(&dword_183ECA000, v47, OS_LOG_TYPE_ERROR, v48, buf, 2u);
        goto LABEL_59;
      }
      if (sqlite3_bind_int(self->insertCookiesStmt, 6, objc_msgSend(v10, "secure")))
      {
        getCookieLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie secure flag";
        goto LABEL_58;
      }
      if (sqlite3_bind_int(self->insertCookiesStmt, 7, objc_msgSend(v10, "hostOnly")))
      {
        getCookieLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie host only flag";
        goto LABEL_58;
      }
      if (sqlite3_bind_int(self->insertCookiesStmt, 8, objc_msgSend(v10, "httpOnly")))
      {
        getCookieLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie HTTPOnly flag";
        goto LABEL_58;
      }
      if (sqlite3_bind_int(self->insertCookiesStmt, 9, objc_msgSend(v10, "sameSite")))
      {
        getCookieLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie sameSite";
        goto LABEL_58;
      }
      objc_msgSend(v10, "creationDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "timeIntervalSince1970");
      v36 = v35;

      if (sqlite3_bind_int64(self->insertCookiesStmt, 10, vcvtmd_u64_f64(v36)))
      {
        getCookieLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie expiration";
        goto LABEL_58;
      }
      objc_msgSend(v10, "expirationDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSince1970");
      v39 = v38;

      if (sqlite3_bind_int64(self->insertCookiesStmt, 11, vcvtmd_u64_f64(v39)))
      {
        getCookieLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
          goto LABEL_59;
        *(_WORD *)buf = 0;
        v48 = "Failed to bind cookie expiration";
        goto LABEL_58;
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "timeIntervalSince1970");
      v42 = v41;

      if (sqlite3_bind_int64(self->insertCookiesStmt, 12, vcvtmd_u64_f64(v42)))
      {
        getCookieLogHandle();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v48 = "Failed to bind cookie last access time";
          goto LABEL_58;
        }
LABEL_59:

        goto LABEL_60;
      }
      if (sqlite3_step(self->insertCookiesStmt) != 101)
      {
        getCookieLogHandle();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "name");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v49;
          v57 = v44;
          _os_log_error_impl(&dword_183ECA000, v43, OS_LOG_TYPE_ERROR, "Failed to insert cookie %@ into db", buf, 0xCu);

        }
      }
      sqlite3_reset(self->insertCookiesStmt);

    }
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (v6)
      continue;
    break;
  }
  v8 = v5;
LABEL_63:

  v4 = v50;
LABEL_64:

}

- (void)beginTransaction
{
  NSObject *v2;
  char *errmsg;
  uint8_t buf[4];
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  errmsg = 0;
  if (sqlite3_exec(self->persistentDb, "BEGIN TRANSACTION", 0, 0, &errmsg))
  {
    getCookieLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = errmsg;
      _os_log_error_impl(&dword_183ECA000, v2, OS_LOG_TYPE_ERROR, "Error begining SQL transaction %s", buf, 0xCu);
    }

  }
}

- (void)commitTransaction
{
  NSObject *v2;
  char *errmsg;
  uint8_t buf[4];
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  errmsg = 0;
  if (sqlite3_exec(self->persistentDb, "COMMIT TRANSACTION", 0, 0, &errmsg))
  {
    getCookieLogHandle();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v5 = errmsg;
      _os_log_error_impl(&dword_183ECA000, v2, OS_LOG_TYPE_ERROR, "Error commmitting SQL transaction %s", buf, 0xCu);
    }

  }
}

- (NSURL)path
{
  return (NSURL *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

- (char)initWithPath:(void *)a3 andFileName:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  const char *v12;
  int v13;
  sqlite3 **v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  objc_super v24;
  uint8_t v25[16];
  _BYTE buf[18];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v24.receiver = a1;
    v24.super_class = (Class)NSPersistentHTTPCookie2Storage;
    a1 = (char *)objc_msgSendSuper2(&v24, sel_init);
    if (a1)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, 0);

      objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C999D8], 0);
      objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)a1 + 7, v8);
      v9 = v8;
      getCookieLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v9;
        _os_log_impl(&dword_183ECA000, v10, OS_LOG_TYPE_DEFAULT, "*** Persistant cookie storage at path %@", buf, 0xCu);
      }

      v11 = objc_retainAutorelease(v9);
      v12 = (const char *)objc_msgSend(v11, "fileSystemRepresentation");
      if (volumeSupportsFileProtection(v12))
        v13 = 3145734;
      else
        v13 = 6;
      v14 = (sqlite3 **)(a1 + 8);
      v15 = sqlite3_open_v2(v12, (sqlite3 **)a1 + 1, v13, 0);
      if (v15)
      {
        getCookieLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = v15;
          *(_WORD *)&buf[8] = 2112;
          *(_QWORD *)&buf[10] = v11;
          _os_log_fault_impl(&dword_183ECA000, v16, OS_LOG_TYPE_FAULT, "Failed to open sql file. Error = %d. Path of the cookie file = %@", buf, 0x12u);
        }
      }
      else
      {
        *(_QWORD *)buf = 0;
        sqlite3_busy_timeout(*v14, 1000);
        if (!sqlite3_exec(*v14, "CREATE TABLE IF NOT EXISTS cookies(       name text NOT NULL,        value text NOT NULL,        domain text NOT NULL,        path text NOT NULL,        partition text NOT NULL,        is_secure int NOT NULL,        is_hostOnly int NOT NULL,        is_httponly int NOT NULL,        same_site int NOT NULL,        creation_time int NOT NULL,        expires_time int NOT NULL,        last_access_time int NOT NULL,        UNIQUE(domain, path, name, partition)       );",
                0,
                0,
                (char **)buf))
        {
          if (sqlite3_prepare(*((sqlite3 **)a1 + 1), "INSERT OR REPLACE INTO cookies(name, value, domain, path, partition,is_secure,     is_hostOnly, is_httpOnly, same_site, creation_time, expires_time, last_access_time)     values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 214, (sqlite3_stmt **)a1 + 2, 0))
          {
            getCookieLogHandle();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v25 = 0;
              _os_log_error_impl(&dword_183ECA000, v20, OS_LOG_TYPE_ERROR, "Failed to init the insert statement", v25, 2u);
            }

          }
          if (sqlite3_prepare(*((sqlite3 **)a1 + 1), "SELECT * from cookies WHERE domain like ? AND expires_time > strftime('%s','now')", 81, (sqlite3_stmt **)a1 + 3, 0))
          {
            getCookieLogHandle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v25 = 0;
              _os_log_error_impl(&dword_183ECA000, v21, OS_LOG_TYPE_ERROR, "Failed to init the selectDomainCookiesStmt statement", v25, 2u);
            }

          }
          if (sqlite3_prepare(*((sqlite3 **)a1 + 1), "SELECT * from cookies", 21, (sqlite3_stmt **)a1 + 4, 0))
          {
            getCookieLogHandle();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v25 = 0;
              _os_log_error_impl(&dword_183ECA000, v22, OS_LOG_TYPE_ERROR, "Failed to init the selectAllCookiesStmt statement", v25, 2u);
            }

          }
          if (sqlite3_prepare(*((sqlite3 **)a1 + 1), "DELETE FROM cookies WHERE name = ? AND domain = ? AND path = ? AND partition = ?", 80, (sqlite3_stmt **)a1 + 5, 0))
          {
            getCookieLogHandle();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v25 = 0;
              _os_log_error_impl(&dword_183ECA000, v23, OS_LOG_TYPE_ERROR, "Failed to init the deleteCookiesStmt statement", v25, 2u);
            }

          }
          v18 = v11;
          goto LABEL_18;
        }
        getCookieLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v25 = 0;
          _os_log_error_impl(&dword_183ECA000, v16, OS_LOG_TYPE_ERROR, "Failed to create schema", v25, 2u);
        }
      }

      getCookieLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v11;
        _os_log_error_impl(&dword_183ECA000, v17, OS_LOG_TYPE_ERROR, "Failed to open the schema at %@", buf, 0xCu);
      }

      v18 = a1;
      a1 = 0;
LABEL_18:

    }
  }

  return a1;
}

@end
