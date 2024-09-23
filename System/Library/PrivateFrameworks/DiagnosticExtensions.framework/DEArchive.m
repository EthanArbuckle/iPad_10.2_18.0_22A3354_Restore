@implementation DEArchive

- (DEArchive)initWithURL:(id)a3
{
  id v5;
  DEArchive *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSURL *tarGzUrl;
  DEArchive *v11;
  char v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DEArchive;
  v6 = -[DEArchive init](&v14, sel_init);
  if (v6)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v13);

    if (v13)
      +[DEUtils tarGzForDirectoryUrl:](DEUtils, "tarGzForDirectoryUrl:", v5);
    else
      objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("tar.gz"));
    v9 = objc_claimAutoreleasedReturnValue();
    tarGzUrl = v6->_tarGzUrl;
    v6->_tarGzUrl = (NSURL *)v9;

    objc_storeStrong((id *)&v6->_sourceDir, a3);
    v6->_hasClosedArchive = 0;
    if (!v6->_tarGzUrl)
    {
      v11 = 0;
      goto LABEL_9;
    }
    v6->_archive = -[DEArchive archiverForUrl:](v6, "archiverForUrl:");
  }
  v11 = v6;
LABEL_9:

  return v11;
}

- (BOOL)addFile:(id)a3 withPathName:(id)a4
{
  return -[DEArchive addFile:withPathName:progressHandler:](self, "addFile:withPathName:progressHandler:", a3, a4, 0);
}

- (BOOL)addFile:(id)a3 withPathName:(id)a4 progressHandler:(id)a5
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  uint64_t v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  const char *v22;
  BOOL v23;
  NSObject *v24;
  const char *v25;
  char v27;
  NSObject *v28;
  id v29;
  id v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  int v35;
  ssize_t v36;
  ssize_t v37;
  uint64_t v38;
  NSObject *v39;
  stat v40;
  id v41;
  id v42;
  id v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v5 = MEMORY[0x1E0C80A78](self, a2, a3, a4, a5);
  v7 = v6;
  v9 = v8;
  v10 = (_QWORD *)v5;
  v48 = *MEMORY[0x1E0C80C00];
  v12 = v11;
  v13 = v9;
  v14 = v7;
  if (!v10[1])
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v22 = "archive is nil";
LABEL_15:
    _os_log_impl(&dword_1A4EEE000, v18, OS_LOG_TYPE_INFO, v22, buf, 2u);
    goto LABEL_16;
  }
  if (!v10[3])
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    *(_WORD *)buf = 0;
    v22 = "tar.gz for archive is nil";
    goto LABEL_15;
  }
  if (v10[4])
  {
    v43 = 0;
    v15 = *MEMORY[0x1E0C999D0];
    v42 = 0;
    objc_msgSend(v12, "getResourceValue:forKey:error:", &v43, v15, &v42);
    v16 = v43;
    v17 = v42;
    if (v17)
    {
      v18 = v17;
      +[DELogging fwHandle](DELogging, "fwHandle");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
LABEL_8:

LABEL_22:
        v23 = 0;
LABEL_23:

        goto LABEL_24;
      }
      -[NSObject description](v18, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v20;
      v46 = 2112;
      v47 = v12;
      v21 = "Error [%@] getting NSURLIsDirectoryKey for url [%@]";
LABEL_7:
      _os_log_impl(&dword_1A4EEE000, v19, OS_LOG_TYPE_INFO, v21, buf, 0x16u);

      goto LABEL_8;
    }
    if (objc_msgSend(v16, "BOOLValue"))
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
LABEL_21:

        v18 = 0;
        goto LABEL_22;
      }
      *(_DWORD *)buf = 138412290;
      v45 = v12;
      v25 = "Archiver received a directory [%@]";
LABEL_20:
      _os_log_impl(&dword_1A4EEE000, v24, OS_LOG_TYPE_INFO, v25, buf, 0xCu);
      goto LABEL_21;
    }
    v41 = 0;
    v27 = objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", &v41);
    v28 = v41;
    if (v28)
    {
      v18 = v28;
      +[DELogging fwHandle](DELogging, "fwHandle");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        goto LABEL_8;
      -[NSObject description](v18, "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v45 = v20;
      v46 = 2112;
      v47 = v12;
      v21 = "Error [%@] getting checkResourceIsReachableAndReturnError for url [%@]";
      goto LABEL_7;
    }
    if ((v27 & 1) == 0)
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v24 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        goto LABEL_21;
      *(_DWORD *)buf = 138412290;
      v45 = v12;
      v25 = "Error, [%@] is not reachable";
      goto LABEL_20;
    }
    objc_msgSend(v12, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    stat((const char *)objc_msgSend(v29, "UTF8String"), &v40);
    if (archive_entry_new())
    {
      archive_entry_copy_stat();
      v30 = objc_retainAutorelease(v13);
      objc_msgSend(v30, "UTF8String");
      archive_entry_set_pathname();
      if (archive_write_header())
      {
        v31 = archive_errno();
        +[DELogging fwHandle](DELogging, "fwHandle");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          -[DEArchive addFile:withPathName:progressHandler:].cold.3(v30, v31, v32);

      }
      else
      {
        v34 = open((const char *)objc_msgSend(objc_retainAutorelease(v29), "UTF8String"), 0);
        if (v34 != -1)
        {
          v35 = v34;
          if (v14)
            v14[2](v14, 0);
          v36 = read(v35, buf, 0x2000uLL);
          if (v36 >= 1)
          {
            v37 = v36;
            v38 = 0;
            do
            {
              archive_write_data();
              v38 += v37;
              if (v14)
                v14[2](v14, v38);
              v37 = read(v35, buf, 0x2000uLL);
            }
            while (v37 > 0);
          }
          archive_entry_free();
          close(v35);
          v23 = 1;
          goto LABEL_41;
        }
        +[DELogging fwHandle](DELogging, "fwHandle");
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          -[DEArchive addFile:withPathName:progressHandler:].cold.2(v30, v39);

      }
      archive_entry_free();
    }
    else
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        -[DEArchive addFile:withPathName:progressHandler:].cold.1(v33);

    }
    v23 = 0;
LABEL_41:

    v18 = 0;
    goto LABEL_23;
  }
  +[DELogging fwHandle](DELogging, "fwHandle");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v22 = "sourceDir is nil";
    goto LABEL_15;
  }
LABEL_16:
  v23 = 0;
LABEL_24:

  return v23;
}

- (void)closeArchive
{
  self->_hasClosedArchive = 1;
  if (self->_archive)
  {
    archive_write_close();
    archive_write_free();
  }
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_hasClosedArchive)
    -[DEArchive closeArchive](self, "closeArchive");
  v3.receiver = self;
  v3.super_class = (Class)DEArchive;
  -[DEArchive dealloc](&v3, sel_dealloc);
}

- (archive)archiverForUrl:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  archive *v9;
  id v10;
  int v11;
  NSObject *v12;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "checkResourceIsReachableAndReturnError:", 0))
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[DEArchive archiverForUrl:].cold.3(v4);

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v6, "removeItemAtURL:error:", v4, &v14);
    v7 = v14;

    if (v7)
    {
      +[DELogging fwHandle](DELogging, "fwHandle");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[DEArchive archiverForUrl:].cold.2(v7);

    }
  }
  v9 = (archive *)archive_write_new();
  archive_write_add_filter_gzip();
  archive_write_set_format_pax();
  objc_msgSend(v4, "path");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v10, "UTF8String");
  v11 = archive_write_open_filename();

  if (v11)
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[DEArchive archiverForUrl:].cold.1();

    v9 = 0;
  }
  else
  {
    self->_hasClosedArchive = 0;
  }

  return v9;
}

- (NSURL)tarGzUrl
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTarGzUrl:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSURL)sourceDir
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSourceDir:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceDir, 0);
  objc_storeStrong((id *)&self->_tarGzUrl, 0);
}

- (void)addFile:(os_log_t)log withPathName:progressHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4EEE000, log, OS_LOG_TYPE_ERROR, "archive_entry_new() failed", v1, 2u);
}

- (void)addFile:(void *)a1 withPathName:(NSObject *)a2 progressHandler:.cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  v4 = *__error();
  v6 = 136315394;
  v7 = v3;
  v8 = 1024;
  v9 = v4;
  OUTLINED_FUNCTION_1_0(&dword_1A4EEE000, a2, v5, "Error opening file: %s  error: %{errno}d", (uint8_t *)&v6);
  OUTLINED_FUNCTION_0();
}

- (void)addFile:(void *)a1 withPathName:(int)a2 progressHandler:(NSObject *)a3 .cold.3(void *a1, int a2, NSObject *a3)
{
  uint64_t v5;
  uint8_t v6[14];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  OUTLINED_FUNCTION_3_0();
  v7 = a2;
  OUTLINED_FUNCTION_1_0(&dword_1A4EEE000, a3, v5, "Failed to write header for file for file: %s error: %{errno}d", v6);
  OUTLINED_FUNCTION_0();
}

- (void)archiverForUrl:.cold.1()
{
  int v0;
  NSObject *v1;
  uint8_t v2[14];
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v3 = v0;
  OUTLINED_FUNCTION_1_0(&dword_1A4EEE000, v1, (uint64_t)v1, "Error creating archive at path %{public}@ %d", v2);
}

- (void)archiverForUrl:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1A4EEE000, v2, v3, "Failed to delete existing tarGz with error: [%{public}@]", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0();
}

- (void)archiverForUrl:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "path");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1A4EEE000, v2, v3, "[%@] tar.gz already exists, will delete original and create new one", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_0();
}

@end
