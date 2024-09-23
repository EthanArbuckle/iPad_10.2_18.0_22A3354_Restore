@implementation DSMutableArchive

+ (id)archive
{
  return objc_alloc_init(DSMutableArchive);
}

- (DSMutableArchive)init
{
  DSMutableArchive *v2;
  uint64_t v3;
  NSMutableArray *tableOfContents;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DSMutableArchive;
  v2 = -[DSMutableArchive init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    tableOfContents = v2->_tableOfContents;
    v2->_tableOfContents = (NSMutableArray *)v3;

    v2->_format = 0;
  }
  return v2;
}

- (BOOL)addURL:(id)a3 error:(id *)a4
{
  return -[DSMutableArchive addURL:prefix:error:](self, "addURL:prefix:error:", a3, 0, a4);
}

- (BOOL)addURL:(id)a3 prefix:(id)a4 error:(id *)a5
{
  return -[DSMutableArchive addURL:prefix:flatten:error:](self, "addURL:prefix:flatten:error:", a3, a4, 0, a5);
}

- (BOOL)addURL:(id)a3 prefix:(id)a4 flatten:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;

  v7 = a5;
  v10 = a3;
  v11 = (__CFString *)a4;
  if (v11)
    v12 = v11;
  else
    v12 = &stru_18E68;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[DSArchivePath archivePathWithSource:prefix:root:](DSArchivePath, "archivePathWithSource:prefix:root:", v10, v12, 1));
  objc_msgSend(v13, "addObject:", v14);

  do
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", 0));
    objc_msgSend(v13, "removeObjectAtIndex:", 0);
    v16 = -[DSMutableArchive _addPathToContents:searchQueue:flatten:error:](self, "_addPathToContents:searchQueue:flatten:error:", v15, v13, v7, a6);

  }
  while (v16 && objc_msgSend(v13, "count"));

  return v16;
}

- (BOOL)_addPathToContents:(id)a3 searchQueue:(id)a4 flatten:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  void *v19;
  char v21;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v21 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sourceUrl"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  v15 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v14, &v21);

  if (v15)
  {
    if (v21)
    {
      v16 = -[DSMutableArchive _addDirectoryToContents:searchQueue:flatten:error:](self, "_addDirectoryToContents:searchQueue:flatten:error:", v10, v11, v7, a6);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DSMutableArchive tableOfContents](self, "tableOfContents"));
      objc_msgSend(v19, "addObject:", v10);

      v16 = 1;
    }
  }
  else
  {
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 6, 0));
    v17 = DiagnosticLogHandleForCategory(3);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addPathToContents:searchQueue:flatten:error:].cold.1(v10);

    v16 = 0;
  }

  return v16;
}

- (BOOL)_addDirectoryToContents:(id)a3 searchQueue:(id)a4 flatten:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceUrl"));
  v32 = 0;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, 0, 0, &v32));
  v14 = v32;

  if (v13)
  {
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "prefix"));
    v27 = v14;
    if ((objc_msgSend(v9, "root") & 1) == 0 && !a5)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceUrl"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastPathComponent"));
      v18 = objc_claimAutoreleasedReturnValue(-[NSObject stringByAppendingPathComponent:](v15, "stringByAppendingPathComponent:", v17));

      v15 = v18;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v19);
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[DSArchivePath archivePathWithSource:prefix:root:](DSArchivePath, "archivePathWithSource:prefix:root:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v23), v15, 0));
          objc_msgSend(v10, "addObject:", v24);

          v23 = (char *)v23 + 1;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v21);
    }

    v14 = v27;
  }
  else
  {
    if (a6)
      *a6 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 5, 0));
    v25 = DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addDirectoryToContents:searchQueue:flatten:error:].cold.1(v9);
  }

  return v13 != 0;
}

- (BOOL)_addFile:(id)a3 archive:(archive *)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  id v27;
  NSObject *v28;
  ssize_t v29;
  ssize_t i;
  id v31;
  NSObject *v32;
  stat v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceUrl", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                   0,
                   0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "prefix"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "sourceUrl"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v12));

  v14 = DiagnosticLogHandleForCategory(3);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v36 = v9;
    v37 = 2112;
    v38 = v13;
    _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, "Archiving [%@] as [%@]", buf, 0x16u);
  }

  v16 = objc_retainAutorelease(v9);
  v17 = open((const char *)objc_msgSend(v16, "UTF8String"), 0);
  if (v17 == -1)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 3, 0));
    v27 = DiagnosticLogHandleForCategory(3);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addFile:archive:error:].cold.4();

    if (v18)
    {
      v26 = 0;
      goto LABEL_30;
    }
  }
  if (fstat(v17, &v34))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 2, 0));
    v19 = DiagnosticLogHandleForCategory(3);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addFile:archive:error:].cold.3();

    if (v18)
      goto LABEL_27;
  }
  v21 = archive_entry_new();
  if (!v21)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 8, 0));
    v31 = DiagnosticLogHandleForCategory(3);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addFile:archive:error:].cold.2(v32);

    if (v18)
    {
LABEL_27:
      v26 = 0;
      goto LABEL_28;
    }
  }
  archive_entry_copy_stat(v21, &v34);
  archive_entry_set_pathname(v21, objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  if (!archive_write_header(a4, v21))
    goto LABEL_19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 9, 0));
  v22 = DiagnosticLogHandleForCategory(3);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    -[DSMutableArchive _addFile:archive:error:].cold.1((uint64_t)a4, (uint64_t)v23, v24, v25);

  if (!v18)
  {
LABEL_19:
    bzero(buf, 0x2000uLL);
    v29 = read(v17, buf, 0x2000uLL);
    if (v29 >= 1)
    {
      for (i = v29; i > 0; i = read(v17, buf, 0x2000uLL))
        archive_write_data(a4, buf, i);
    }
    v18 = 0;
    v26 = 1;
    if (!v21)
      goto LABEL_28;
    goto LABEL_23;
  }
  v26 = 0;
  if (v21)
LABEL_23:
    archive_entry_free(v21);
LABEL_28:
  if ((v17 & 0x80000000) == 0)
    close(v17);
LABEL_30:
  if (a5)
    *a5 = objc_retainAutorelease(v18);

  return v26;
}

- (void)_setFormatOnArchive:(archive *)a3
{
  int64_t v4;

  v4 = -[DSMutableArchive format](self, "format");
  if (v4 == 2)
  {
    archive_write_add_filter_gzip(a3);
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    archive_write_add_filter_compress(a3);
LABEL_5:
    archive_write_set_format_cpio(a3);
    return;
  }
  archive_write_add_filter_gzip(a3);
  archive_write_set_format_ustar(a3);
}

- (BOOL)_writeArchive:(archive *)a3 error:(id *)a4
{
  NSObject *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  int v13;
  int v14;
  id v15;
  id v16;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_claimAutoreleasedReturnValue(-[DSMutableArchive tableOfContents](self, "tableOfContents", 0));
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if (!-[DSMutableArchive _addFile:archive:error:](self, "_addFile:archive:error:", v12, a3, a4))
        {
          v16 = DiagnosticLogHandleForCategory(3);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
            -[DSMutableArchive _writeArchive:error:].cold.2(v12, v17);

          goto LABEL_17;
        }
      }
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  v13 = archive_write_free(a3);
  if (!v13)
    return 1;
  v14 = v13;
  if (a4)
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 10, 0));
  v15 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[DSMutableArchive _writeArchive:error:].cold.1(v14, v7);
LABEL_17:

  return 0;
}

- (id)archiveAsDataWithError:(id *)a3
{
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;

  v5 = archive_write_new(self, a2);
  -[DSMutableArchive _setFormatOnArchive:](self, "_setFormatOnArchive:", v5);
  if (!archive_write_open(v5, self, DSArchiveOpen, DSArchiveWrite, DSArchiveClose))
  {
    if (-[DSMutableArchive _writeArchive:error:](self, "_writeArchive:error:", v5, a3))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[DSMutableArchive dataBuffer](self, "dataBuffer"));
      return v11;
    }
LABEL_8:
    v11 = 0;
    return v11;
  }
  v6 = DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[DSMutableArchive archiveAsDataWithError:].cold.1(v5, (uint64_t)v7, v8, v9);

  if (!a3)
    goto LABEL_8;
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 1, 0));
  v11 = 0;
  *a3 = v10;
  return v11;
}

- (id)archiveAsTempDirectoryWithName:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  unsigned __int8 v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v40;
  NSMutableArray *obj;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];

  v6 = a3;
  v7 = DiagnosticLogHandleForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Archiving as temp directory with name %@", buf, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = NSTemporaryDirectory();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", v6));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "path"));
  v15 = objc_msgSend(v9, "fileExistsAtPath:", v14);

  if (!v15)
    goto LABEL_10;
  v16 = DiagnosticLogHandleForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v13;
    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Cleaning up prior temp directory archive at [%@]", buf, 0xCu);
  }

  objc_msgSend(v9, "removeItemAtURL:error:", v13, a4);
  if (*a4)
  {
    v18 = DiagnosticLogHandleForCategory(0);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive archiveAsTempDirectoryWithName:error:].cold.1((uint64_t)v13, a4);

    v20 = 0;
  }
  else
  {
LABEL_10:
    objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, a4);
    if (!*a4)
    {
      v43 = v9;
      v40 = v6;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      obj = self->_tableOfContents;
      v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
      if (v21)
      {
        v22 = v21;
        v42 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v42)
              objc_enumerationMutation(obj);
            v24 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "prefix"));
            v26 = v13;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", v25));
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sourceUrl"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "lastPathComponent"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "URLByAppendingPathComponent:", v29));

            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "URLByDeletingLastPathComponent"));
            objc_msgSend(v43, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v31, 1, 0, a4);

            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sourceUrl"));
            if (*a4)
              v33 = 0;
            else
              v33 = a4;
            v34 = objc_msgSend(v43, "copyItemAtURL:toURL:error:", v32, v30, v33);

            if ((v34 & 1) == 0)
            {
              v35 = DiagnosticLogHandleForCategory(0);
              v36 = objc_claimAutoreleasedReturnValue(v35);
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sourceUrl"));
                v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a4, "description"));
                *(_DWORD *)buf = 138412802;
                v49 = v37;
                v50 = 2112;
                v51 = v30;
                v52 = 2112;
                v53 = v38;
                _os_log_error_impl(&dword_0, v36, OS_LOG_TYPE_ERROR, "Failed to copy file in archive to temp directory from [%@] to [%@]. Error: [%@]", buf, 0x20u);

              }
            }

            v13 = v26;
          }
          v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
        }
        while (v22);
      }

      v6 = v40;
      v9 = v43;
    }
    v20 = v13;
  }

  return v20;
}

- (id)archiveAsTempFileWithTemplate:(id)a3 error:(id *)a4
{
  return -[DSMutableArchive archiveAsTempFileWithTemplate:suffix:error:](self, "archiveAsTempFileWithTemplate:suffix:error:", a3, 0, a4);
}

- (id)archiveAsTempFileWithTemplate:(id)a3 suffix:(id)a4 error:(id *)a5
{
  return -[DSMutableArchive archiveAsTempFileWithTemplate:directory:suffix:error:](self, "archiveAsTempFileWithTemplate:directory:suffix:error:", a3, 0, a4, a5);
}

- (id)archiveAsTempFileWithTemplate:(id)a3 directory:(id)a4 suffix:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  id v19;
  const char *v20;
  size_t v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  id v32;
  id v33;
  NSObject *v34;
  uint64_t v35;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    v13 = NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLByAppendingPathComponent:", v10));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "path"));

  if (v12)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingString:", v12));

    v18 = objc_msgSend(v12, "length");
    v16 = (void *)v17;
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_retainAutorelease(v16);
  v20 = (const char *)objc_msgSend(v19, "fileSystemRepresentation");
  v21 = strlen(v20);
  v22 = (char *)malloc_type_malloc(v21 + 1, 0x1BDC3ABBuLL);
  if (v22)
  {
    v23 = v22;
    v24 = strcpy(v22, v20);
    v25 = mkstemps(v24, v18);
    if ((v25 & 0x80000000) == 0)
      goto LABEL_27;
    v33 = DiagnosticLogHandleForCategory(3);
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive archiveAsTempFileWithTemplate:directory:suffix:error:].cold.2();

    v35 = objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 4, 0));
    if (!v35)
    {
LABEL_27:
      if (-[DSMutableArchive archiveAsFileUsingDescriptor:error:](self, "archiveAsFileUsingDescriptor:error:", v25, a6))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v27 = objc_msgSend(v26, "stringWithFileSystemRepresentation:length:", v23, strlen(v23));
        v28 = (void *)objc_claimAutoreleasedReturnValue(v27);

        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v28));
      }
      else
      {
        v29 = 0;
      }
      free(v23);
      if ((v25 & 0x80000000) == 0)
        close(v25);
      v32 = 0;
      goto LABEL_24;
    }
    v32 = (id)v35;
    free(v23);
  }
  else
  {
    v30 = DiagnosticLogHandleForCategory(3);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive archiveAsTempFileWithTemplate:directory:suffix:error:].cold.1();

    v32 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 7, 0));
  }
  v29 = 0;
  if (a6 && v32)
  {
    v32 = objc_retainAutorelease(v32);
    v29 = 0;
    *a6 = v32;
  }
LABEL_24:

  return v29;
}

- (BOOL)archiveAsFile:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  int v20;
  void *v21;

  v6 = a3;
  v8 = archive_write_new(v6, v7);
  -[DSMutableArchive _setFormatOnArchive:](self, "_setFormatOnArchive:", v8);
  v9 = DiagnosticLogHandleForCategory(3);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path"));
    v20 = 138412290;
    v21 = v11;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Attempting to write archive to [%@]", (uint8_t *)&v20, 0xCu);

  }
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")));
  v13 = archive_write_open_filename(v8, objc_msgSend(v12, "UTF8String"));

  if (v13)
  {
    v14 = DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive archiveAsDataWithError:].cold.1(v8, (uint64_t)v15, v16, v17);

    v18 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 1, 0));
  }
  else
  {
    v18 = -[DSMutableArchive _writeArchive:error:](self, "_writeArchive:error:", v8, a4);
  }

  return v18;
}

- (BOOL)archiveAsFileUsingDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  BOOL result;
  uint8_t v16[16];

  v5 = *(_QWORD *)&a3;
  v7 = archive_write_new(self, a2);
  -[DSMutableArchive _setFormatOnArchive:](self, "_setFormatOnArchive:", v7);
  v8 = DiagnosticLogHandleForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Attempting to write archive to file descriptor.", v16, 2u);
  }

  if (!archive_write_open_fd(v7, v5))
    return -[DSMutableArchive _writeArchive:error:](self, "_writeArchive:error:", v7, a4);
  v10 = DiagnosticLogHandleForCategory(3);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[DSMutableArchive archiveAsDataWithError:].cold.1(v7, (uint64_t)v11, v12, v13);

  if (!a4)
    return 0;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 1, 0));
  result = 0;
  *a4 = v14;
  return result;
}

+ (BOOL)extractEntry:(archive *)a3 toArchive:(archive *)a4
{
  int v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  v8 = 0;
  while (1)
  {
    v6 = archive_read_data_block(a3, &v10, &v9, &v8);
    if (v6)
      break;
    if (archive_write_data_block(a4, v10, v9, v8) < 0)
      return 0;
  }
  return v6 == 1;
}

+ (BOOL)extractArchive:(id)a3 toDirectory:(id)a4
{
  char *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  size_t v13;
  char *v14;
  id v15;
  NSObject *v16;
  char v17;
  id v18;
  NSObject *v19;
  int v21;
  const char *v22;
  size_t v23;
  id v24;
  NSObject *v25;
  unsigned int v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint8_t v43[4];
  uint64_t v44;
  uint8_t buf[4];
  char *v46;

  v5 = (char *)a3;
  v6 = a4;
  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46 = v5;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Opening archive for extraction: %@", buf, 0xCu);
  }

  v42 = 0;
  v9 = archive_read_new();
  v10 = archive_write_disk_new();
  archive_write_disk_set_options(v10, 4);
  archive_write_disk_set_standard_lookup(v10);
  archive_read_support_format_all(v9);
  archive_read_support_filter_all(v9);
  v11 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  objc_msgSend(v5, "getFileSystemRepresentation:maxLength:", v11, 1024);
  v12 = (const char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", v12, 1024);
  v13 = strlen(v12);
  if (v13 + 1 <= 0x3FF)
  {
    v12[v13] = 47;
    v12[v13 + 1] = 0;
    v14 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
    __strcpy_chk(v14, v12, 1024);
    if (archive_read_open_filename(v9, v11, 10240))
    {
      v15 = DiagnosticLogHandleForCategory(3);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[DSMutableArchive extractArchive:toDirectory:].cold.6();
    }
    else
    {
      v17 = 1;
      while (1)
      {
        v21 = archive_read_next_header(v9, &v42);
        if (v21)
          break;
        v22 = (const char *)archive_entry_pathname(v42);
        v23 = strlen(v12);
        strcpy(&v14[v23], v22);
        archive_entry_set_pathname(v42, v14);
        v24 = DiagnosticLogHandleForCategory(3);
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v46 = v14;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "Extracting %s", buf, 0xCu);
        }

        if ((archive_write_header(v10, v42) & 0x80000000) != 0)
        {
          v37 = DiagnosticLogHandleForCategory(3);
          v38 = objc_claimAutoreleasedReturnValue(v37);
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            +[DSMutableArchive extractArchive:toDirectory:].cold.4();

          v39 = DiagnosticLogHandleForCategory(3);
          v16 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            +[DSMutableArchive extractArchive:toDirectory:].cold.1(v10, (uint64_t)v16, v40, v41);
          goto LABEL_7;
        }
        v26 = +[DSMutableArchive extractEntry:toArchive:](DSMutableArchive, "extractEntry:toArchive:", v9, v10);
        v17 = v26;
        if (!v26 || archive_write_finish_entry(v10))
        {
          v27 = DiagnosticLogHandleForCategory(3);
          v28 = objc_claimAutoreleasedReturnValue(v27);
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v46 = v5;
            _os_log_error_impl(&dword_0, v28, OS_LOG_TYPE_ERROR, "Failed to extract %@", buf, 0xCu);
          }

          v29 = DiagnosticLogHandleForCategory(3);
          v30 = objc_claimAutoreleasedReturnValue(v29);
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            +[DSMutableArchive extractArchive:toDirectory:].cold.5(v43, v9, &v44, v30);

        }
      }
      if (v21 == 1)
      {
        v31 = DiagnosticLogHandleForCategory(3);
        v16 = objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v46 = v5;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Finished extracting %@", buf, 0xCu);
        }
        goto LABEL_8;
      }
      v32 = DiagnosticLogHandleForCategory(3);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        +[DSMutableArchive extractArchive:toDirectory:].cold.2();

      v34 = DiagnosticLogHandleForCategory(3);
      v16 = objc_claimAutoreleasedReturnValue(v34);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[DSMutableArchive extractArchive:toDirectory:].cold.1(v9, (uint64_t)v16, v35, v36);
    }
LABEL_7:
    v17 = 0;
LABEL_8:

    archive_read_close(v9);
    archive_read_free(v9);
    archive_write_close(v10);
    archive_write_free(v10);
    free(v11);
    v11 = (void *)v12;
    goto LABEL_12;
  }
  v18 = DiagnosticLogHandleForCategory(3);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    +[DSMutableArchive extractArchive:toDirectory:].cold.7();

  v17 = 0;
  v14 = (char *)v12;
LABEL_12:
  free(v11);
  free(v14);

  return v17 & 1;
}

- (int64_t)format
{
  return self->_format;
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (NSMutableData)dataBuffer
{
  return self->_dataBuffer;
}

- (void)setDataBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_dataBuffer, a3);
}

- (NSMutableArray)tableOfContents
{
  return self->_tableOfContents;
}

- (void)setTableOfContents:(id)a3
{
  objc_storeStrong((id *)&self->_tableOfContents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableOfContents, 0);
  objc_storeStrong((id *)&self->_dataBuffer, 0);
}

- (void)_addPathToContents:(void *)a1 searchQueue:flatten:error:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sourceUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "path"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_0, v3, v4, "File or directory does not exist: [%@]", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

- (void)_addDirectoryToContents:(void *)a1 searchQueue:flatten:error:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sourceUrl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "path"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_0, v3, v4, "Could not enumerate directory: [%@]: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

- (void)_addFile:(uint64_t)a3 archive:(uint64_t)a4 error:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_0, v4, v5, "Error writing header: %s", v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_2_0();
}

- (void)_addFile:(os_log_t)log archive:error:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error creating entry.", v1, 2u);
}

- (void)_addFile:archive:error:.cold.3()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_0, v1, v2, "Error during stat of file %@: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)_addFile:archive:error:.cold.4()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_0(&dword_0, v1, v2, "Error opening file %@: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)_writeArchive:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Failed to write completed archive to storage with archive status: %d", (uint8_t *)v2, 8u);
}

- (void)_writeArchive:(void *)a1 error:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sourceUrl"));
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Failed to add file to archive: %@", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (void)archiveAsDataWithError:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_0, v4, v5, "Error creating archive: %s", v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_2_0();
}

- (void)archiveAsTempDirectoryWithName:(uint64_t)a1 error:(id *)a2 .cold.1(uint64_t a1, id *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "description"));
  OUTLINED_FUNCTION_4_0(&dword_0, v2, v3, "Failed to clean up up prior temp directory archive at [%@]. Error: [%@]", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)archiveAsTempFileWithTemplate:directory:suffix:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_0, v0, v1, "Could not allocate %lu bytes.", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)archiveAsTempFileWithTemplate:directory:suffix:error:.cold.2()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  v0 = OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(v0);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_0, v1, v2, "Could not create temp file: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

+ (void)extractArchive:(uint64_t)a3 toDirectory:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6(a1, a2, a3, a4);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_0, v4, v5, "Extract error: %s", v6, v7, v8, v9, v10);
  OUTLINED_FUNCTION_2_0();
}

+ (void)extractArchive:toDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_0, v0, v1, "Failed to extract %@", v2);
  OUTLINED_FUNCTION_3_0();
}

+ (void)extractArchive:toDirectory:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_0, v0, v1, "Failed to extract from %@", v2);
  OUTLINED_FUNCTION_3_0();
}

+ (void)extractArchive:(uint64_t *)a3 toDirectory:(NSObject *)a4 .cold.5(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = archive_error_string(a2, a2, a3, a4);
  *(_DWORD *)a1 = 136315138;
  *a3 = v7;
  _os_log_error_impl(&dword_0, a4, OS_LOG_TYPE_ERROR, "Extract error: %s", a1, 0xCu);
}

+ (void)extractArchive:toDirectory:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_0, v0, v1, "Failed to open archive for extraction: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

+ (void)extractArchive:toDirectory:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_0, v0, v1, "The extract destination path %@ is too long to use as the extraction destination!", v2);
  OUTLINED_FUNCTION_3_0();
}

@end
