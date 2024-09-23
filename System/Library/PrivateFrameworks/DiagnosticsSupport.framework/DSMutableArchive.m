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
  v2 = -[DSMutableArchive init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
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
    v12 = &stru_24E44AA48;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[DSArchivePath archivePathWithSource:prefix:root:](DSArchivePath, "archivePathWithSource:prefix:root:", v10, v12, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  do
  {
    objc_msgSend(v13, "objectAtIndex:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
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
  int v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  char v20;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sourceUrl");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v14, &v20);

  if (v15)
  {
    if (v20)
    {
      v16 = -[DSMutableArchive _addDirectoryToContents:searchQueue:flatten:error:](self, "_addDirectoryToContents:searchQueue:flatten:error:", v10, v11, v7, a6);
    }
    else
    {
      -[DSMutableArchive tableOfContents](self, "tableOfContents");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v10);

      v16 = 1;
    }
  }
  else
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 6, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    DiagnosticLogHandleForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sourceUrl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v11, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v12, 0, 0, &v31);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v31;

  if (v13)
  {
    objc_msgSend(v9, "prefix");
    v15 = objc_claimAutoreleasedReturnValue();
    v26 = v14;
    if ((objc_msgSend(v9, "root") & 1) == 0 && !a5)
    {
      objc_msgSend(v9, "sourceUrl");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject stringByAppendingPathComponent:](v15, "stringByAppendingPathComponent:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v15 = v18;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v13;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          +[DSArchivePath archivePathWithSource:prefix:root:](DSArchivePath, "archivePathWithSource:prefix:root:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v23), v15, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v21);
    }

    v14 = v26;
  }
  else
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 5, 0);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addDirectoryToContents:searchQueue:flatten:error:].cold.1(v9);
  }

  return v13 != 0;
}

- (BOOL)_addFile:(id)a3 archive:(archive *)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  stat v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "sourceUrl", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
    0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "prefix");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceUrl");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  DiagnosticLogHandleForCategory(3);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v8;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_21F54F000, v13, OS_LOG_TYPE_DEFAULT, "Archiving [%@] as [%@]", buf, 0x16u);
  }

  v14 = objc_retainAutorelease(v8);
  v15 = open((const char *)objc_msgSend(v14, "UTF8String"), 0);
  if (v15 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 3, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    DiagnosticLogHandleForCategory(3);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addFile:archive:error:].cold.4();

    if (v16)
    {
      v20 = 0;
      goto LABEL_29;
    }
  }
  if (fstat(v15, &v24))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 2, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    DiagnosticLogHandleForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addFile:archive:error:].cold.3();

    if (v16)
      goto LABEL_26;
  }
  v18 = archive_entry_new();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    DiagnosticLogHandleForCategory(3);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive _addFile:archive:error:].cold.2(v22);

    if (v16)
    {
LABEL_26:
      v20 = 0;
      goto LABEL_27;
    }
  }
  archive_entry_copy_stat();
  objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
  archive_entry_set_pathname();
  if (!archive_write_header())
    goto LABEL_19;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 9, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  DiagnosticLogHandleForCategory(3);
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    -[DSMutableArchive _addFile:archive:error:].cold.1();

  if (!v16)
  {
LABEL_19:
    bzero(buf, 0x2000uLL);
    if (read(v15, buf, 0x2000uLL) >= 1)
    {
      do
        archive_write_data();
      while (read(v15, buf, 0x2000uLL) > 0);
    }
    v16 = 0;
    v20 = 1;
    if (!v18)
      goto LABEL_27;
    goto LABEL_22;
  }
  v20 = 0;
  if (v18)
LABEL_22:
    archive_entry_free();
LABEL_27:
  if ((v15 & 0x80000000) == 0)
    close(v15);
LABEL_29:
  if (a5)
    *a5 = objc_retainAutorelease(v16);

  return v20;
}

- (void)_setFormatOnArchive:(archive *)a3
{
  int64_t v3;

  v3 = -[DSMutableArchive format](self, "format");
  if (v3 == 2)
  {
    archive_write_add_filter_gzip();
LABEL_6:
    JUMPOUT(0x2207CA394);
  }
  if (v3 == 1)
  {
    archive_write_add_filter_compress();
    goto LABEL_6;
  }
  archive_write_add_filter_gzip();
  archive_write_set_format_ustar();
}

- (BOOL)_writeArchive:(archive *)a3 error:(id *)a4
{
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[DSMutableArchive tableOfContents](self, "tableOfContents", 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!-[DSMutableArchive _addFile:archive:error:](self, "_addFile:archive:error:", v12, a3, a4))
        {
          DiagnosticLogHandleForCategory(3);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
            -[DSMutableArchive _writeArchive:error:].cold.2(v12, v15);

          goto LABEL_17;
        }
      }
      v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }

  v13 = archive_write_free();
  if (!v13)
    return 1;
  v14 = v13;
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 10, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    -[DSMutableArchive _writeArchive:error:].cold.1(v14, v7);
LABEL_17:

  return 0;
}

- (id)archiveAsDataWithError:(id *)a3
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;

  v5 = archive_write_new();
  -[DSMutableArchive _setFormatOnArchive:](self, "_setFormatOnArchive:", v5);
  if (!archive_write_open())
  {
    if (-[DSMutableArchive _writeArchive:error:](self, "_writeArchive:error:", v5, a3))
    {
      -[DSMutableArchive dataBuffer](self, "dataBuffer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
LABEL_8:
    v8 = 0;
    return v8;
  }
  DiagnosticLogHandleForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[DSMutableArchive archiveAsDataWithError:].cold.1();

  if (!a3)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 1, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  *a3 = v7;
  return v8;
}

- (id)archiveAsTempDirectoryWithName:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id *v30;
  char v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v36;
  NSMutableArray *obj;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  DiagnosticLogHandleForCategory(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v6;
    _os_log_impl(&dword_21F54F000, v7, OS_LOG_TYPE_DEFAULT, "Archiving as temp directory with name %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURLWithPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "URLByAppendingPathComponent:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v8, "fileExistsAtPath:", v13);

  if (!v14)
    goto LABEL_10;
  DiagnosticLogHandleForCategory(0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v45 = v12;
    _os_log_impl(&dword_21F54F000, v15, OS_LOG_TYPE_DEFAULT, "Cleaning up prior temp directory archive at [%@]", buf, 0xCu);
  }

  objc_msgSend(v8, "removeItemAtURL:error:", v12, a4);
  if (*a4)
  {
    DiagnosticLogHandleForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive archiveAsTempDirectoryWithName:error:].cold.1((uint64_t)v12, a4);

    v17 = 0;
  }
  else
  {
LABEL_10:
    objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v12, 1, 0, a4);
    if (!*a4)
    {
      v39 = v8;
      v36 = v6;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      obj = self->_tableOfContents;
      v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v18)
      {
        v19 = v18;
        v38 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v41 != v38)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
            objc_msgSend(v21, "prefix");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v12;
            objc_msgSend(v12, "URLByAppendingPathComponent:", v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "sourceUrl");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "lastPathComponent");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "URLByAppendingPathComponent:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "URLByDeletingLastPathComponent");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v28, 1, 0, a4);

            objc_msgSend(v21, "sourceUrl");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (*a4)
              v30 = 0;
            else
              v30 = a4;
            v31 = objc_msgSend(v39, "copyItemAtURL:toURL:error:", v29, v27, v30);

            if ((v31 & 1) == 0)
            {
              DiagnosticLogHandleForCategory(0);
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v21, "sourceUrl");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*a4, "description");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v45 = v33;
                v46 = 2112;
                v47 = v27;
                v48 = 2112;
                v49 = v34;
                _os_log_error_impl(&dword_21F54F000, v32, OS_LOG_TYPE_ERROR, "Failed to copy file in archive to temp directory from [%@] to [%@]. Error: [%@]", buf, 0x20u);

              }
            }

            v12 = v23;
          }
          v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v19);
      }

      v6 = v36;
      v8 = v39;
    }
    v17 = v12;
  }

  return v17;
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
  void *v13;
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
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v11)
  {
    v13 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:", v14);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v11, "URLByAppendingPathComponent:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v16, "stringByAppendingString:", v12);
    v17 = objc_claimAutoreleasedReturnValue();

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
    DiagnosticLogHandleForCategory(3);
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive archiveAsTempFileWithTemplate:directory:suffix:error:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 4, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (!v32)
    {
LABEL_27:
      if (-[DSMutableArchive archiveAsFileUsingDescriptor:error:](self, "archiveAsFileUsingDescriptor:error:", v25, a6))
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringWithFileSystemRepresentation:length:", v23, strlen(v23));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = 0;
      }
      free(v23);
      if ((v25 & 0x80000000) == 0)
        close(v25);
      v30 = 0;
      goto LABEL_24;
    }
    v30 = (id)v32;
    free(v23);
  }
  else
  {
    DiagnosticLogHandleForCategory(3);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive archiveAsTempFileWithTemplate:directory:suffix:error:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 7, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = 0;
  if (a6 && v30)
  {
    v30 = objc_retainAutorelease(v30);
    v28 = 0;
    *a6 = v30;
  }
LABEL_24:

  return v28;
}

- (BOOL)archiveAsFile:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = archive_write_new();
  -[DSMutableArchive _setFormatOnArchive:](self, "_setFormatOnArchive:", v7);
  DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412290;
    v16 = v9;
    _os_log_impl(&dword_21F54F000, v8, OS_LOG_TYPE_DEFAULT, "Attempting to write archive to [%@]", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(v6, "path");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v11 = archive_write_open_filename();

  if (v11)
  {
    DiagnosticLogHandleForCategory(3);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DSMutableArchive archiveAsDataWithError:].cold.1();

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 1, 0);
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = -[DSMutableArchive _writeArchive:error:](self, "_writeArchive:error:", v7, a4);
  }

  return v13;
}

- (BOOL)archiveAsFileUsingDescriptor:(int)a3 error:(id *)a4
{
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  BOOL result;
  uint8_t v11[16];

  v6 = archive_write_new();
  -[DSMutableArchive _setFormatOnArchive:](self, "_setFormatOnArchive:", v6);
  DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21F54F000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to write archive to file descriptor.", v11, 2u);
  }

  if (!archive_write_open_fd())
    return -[DSMutableArchive _writeArchive:error:](self, "_writeArchive:error:", v6, a4);
  DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[DSMutableArchive archiveAsDataWithError:].cold.1();

  if (!a4)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.Diagnostics.DSMutableArchive"), 1, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a4 = v9;
  return result;
}

+ (BOOL)extractEntry:(archive *)a3 toArchive:(archive *)a4
{
  int data_block;

  while (1)
  {
    data_block = archive_read_data_block();
    if (data_block)
      break;
    if (archive_write_data_block() < 0)
      return 0;
  }
  return data_block == 1;
}

+ (BOOL)extractArchive:(id)a3 toDirectory:(id)a4
{
  char *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  size_t v12;
  char *v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  int next_header;
  const char *v19;
  size_t v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  uint8_t v27[4];
  uint64_t v28;
  uint8_t buf[4];
  char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (char *)a3;
  v6 = a4;
  DiagnosticLogHandleForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v5;
    _os_log_impl(&dword_21F54F000, v7, OS_LOG_TYPE_DEFAULT, "Opening archive for extraction: %@", buf, 0xCu);
  }

  v8 = archive_read_new();
  v9 = archive_write_disk_new();
  archive_write_disk_set_options();
  archive_write_disk_set_standard_lookup();
  archive_read_support_format_all();
  archive_read_support_filter_all();
  v10 = malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  objc_msgSend(v5, "getFileSystemRepresentation:maxLength:", v10, 1024);
  v11 = (const char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
  objc_msgSend(v6, "getFileSystemRepresentation:maxLength:", v11, 1024);
  v12 = strlen(v11);
  if (v12 + 1 > 0x3FF)
  {
    DiagnosticLogHandleForCategory(3);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      +[DSMutableArchive extractArchive:toDirectory:].cold.7();

    v15 = 0;
    v13 = (char *)v11;
  }
  else
  {
    v11[v12] = 47;
    v11[v12 + 1] = 0;
    v13 = (char *)malloc_type_malloc(0x400uLL, 0x100004077774924uLL);
    __strcpy_chk();
    if (archive_read_open_filename())
    {
      DiagnosticLogHandleForCategory(3);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[DSMutableArchive extractArchive:toDirectory:].cold.6();
    }
    else
    {
      v15 = 1;
      while (1)
      {
        next_header = archive_read_next_header();
        if (next_header)
          break;
        v19 = (const char *)archive_entry_pathname();
        v20 = strlen(v11);
        strcpy(&v13[v20], v19);
        archive_entry_set_pathname();
        DiagnosticLogHandleForCategory(3);
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v30 = v13;
          _os_log_impl(&dword_21F54F000, v21, OS_LOG_TYPE_DEFAULT, "Extracting %s", buf, 0xCu);
        }

        if ((archive_write_header() & 0x80000000) != 0)
        {
          DiagnosticLogHandleForCategory(3);
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            +[DSMutableArchive extractArchive:toDirectory:].cold.4();

          DiagnosticLogHandleForCategory(3);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
LABEL_31:
            +[DSMutableArchive extractArchive:toDirectory:].cold.1();
            goto LABEL_7;
          }
          goto LABEL_7;
        }
        v22 = +[DSMutableArchive extractEntry:toArchive:](DSMutableArchive, "extractEntry:toArchive:", v8, v9);
        v15 = v22;
        if (!v22 || archive_write_finish_entry())
        {
          DiagnosticLogHandleForCategory(3);
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v5;
            _os_log_error_impl(&dword_21F54F000, v23, OS_LOG_TYPE_ERROR, "Failed to extract %@", buf, 0xCu);
          }

          DiagnosticLogHandleForCategory(3);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            +[DSMutableArchive extractArchive:toDirectory:].cold.5(v27, v8, &v28, v24);

        }
      }
      if (next_header == 1)
      {
        DiagnosticLogHandleForCategory(3);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v5;
          _os_log_impl(&dword_21F54F000, v14, OS_LOG_TYPE_DEFAULT, "Finished extracting %@", buf, 0xCu);
        }
        goto LABEL_8;
      }
      DiagnosticLogHandleForCategory(3);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        +[DSMutableArchive extractArchive:toDirectory:].cold.2();

      DiagnosticLogHandleForCategory(3);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        goto LABEL_31;
    }
LABEL_7:
    v15 = 0;
LABEL_8:

    archive_read_close();
    archive_read_free();
    archive_write_close();
    archive_write_free();
    free(v10);
    v10 = (void *)v11;
  }
  free(v10);
  free(v13);

  return v15 & 1;
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

  objc_msgSend(a1, "sourceUrl");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_21F54F000, v3, v4, "File or directory does not exist: [%@]", v5, v6, v7, v8, v9);

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

  objc_msgSend(a1, "sourceUrl");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4_0(&dword_21F54F000, v3, v4, "Could not enumerate directory: [%@]: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_5_0();
}

- (void)_addFile:archive:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_21F54F000, v0, v1, "Error writing header: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_addFile:(os_log_t)log archive:error:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21F54F000, log, OS_LOG_TYPE_ERROR, "Error creating entry.", v1, 2u);
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
  OUTLINED_FUNCTION_4_0(&dword_21F54F000, v1, v2, "Error during stat of file %@: %s", v3, v4, v5, v6, v7);
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
  OUTLINED_FUNCTION_4_0(&dword_21F54F000, v1, v2, "Error opening file %@: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)_writeArchive:(int)a1 error:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_21F54F000, a2, OS_LOG_TYPE_FAULT, "Failed to write completed archive to storage with archive status: %d", (uint8_t *)v2, 8u);
}

- (void)_writeArchive:(void *)a1 error:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sourceUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_21F54F000, a2, OS_LOG_TYPE_FAULT, "Failed to add file to archive: %@", v4, 0xCu);

  OUTLINED_FUNCTION_2_0();
}

- (void)archiveAsDataWithError:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_21F54F000, v0, v1, "Error creating archive: %s", v2, v3, v4, v5, v6);
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

  objc_msgSend(*a2, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0(&dword_21F54F000, v2, v3, "Failed to clean up up prior temp directory archive at [%@]. Error: [%@]", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)archiveAsTempFileWithTemplate:directory:suffix:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21F54F000, v0, v1, "Could not allocate %lu bytes.", v2);
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
  OUTLINED_FUNCTION_0_0(&dword_21F54F000, v1, v2, "Could not create temp file: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

+ (void)extractArchive:toDirectory:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_21F54F000, v0, v1, "Extract error: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

+ (void)extractArchive:toDirectory:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21F54F000, v0, v1, "Failed to extract %@", v2);
  OUTLINED_FUNCTION_3_0();
}

+ (void)extractArchive:toDirectory:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21F54F000, v0, v1, "Failed to extract from %@", v2);
  OUTLINED_FUNCTION_3_0();
}

+ (void)extractArchive:(uint64_t *)a3 toDirectory:(NSObject *)a4 .cold.5(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = archive_error_string();
  *(_DWORD *)a1 = 136315138;
  *a3 = v7;
  _os_log_error_impl(&dword_21F54F000, a4, OS_LOG_TYPE_ERROR, "Extract error: %s", a1, 0xCu);
}

+ (void)extractArchive:toDirectory:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21F54F000, v0, v1, "Failed to open archive for extraction: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

+ (void)extractArchive:toDirectory:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21F54F000, v0, v1, "The extract destination path %@ is too long to use as the extraction destination!", v2);
  OUTLINED_FUNCTION_3_0();
}

@end
