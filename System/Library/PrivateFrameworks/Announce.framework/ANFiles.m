@implementation ANFiles

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __17__ANFiles_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (id)shared_shared;
}

void __17__ANFiles_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)shared_shared;
  shared_shared = v0;

}

+ (id)createTemporaryFileWithData:(id)a3 extension:(id)a4 directory:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[ANFiles shared](ANFiles, "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "createTemporaryFileWithData:extension:directory:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)createTemporaryURLWithFileExtension:(id)a3 directory:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = a3;
  +[ANFiles shared](ANFiles, "shared");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createTemporaryURLWithExtension:directory:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)purgeTemporarySubDirectory:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ANFiles shared](ANFiles, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "purgeTemporarySubDirectory:", v3);

}

+ (void)removeItem:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ANFiles shared](ANFiles, "shared");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItem:", v3);

}

+ (id)temporaryDirectoryUrl
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF48];
  NSTemporaryDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)createTemporaryFileWithData:(id)a3 extension:(id)a4 directory:(id)a5
{
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[ANFiles createDirectory:andFileURLWithExtension:](self, "createDirectory:andFileURLWithExtension:", a5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
    goto LABEL_4;
  v16 = 0;
  v10 = objc_msgSend(v8, "writeToURL:options:error:", v9, 1, &v16);
  v11 = v16;
  v12 = v11;
  if ((v10 & 1) != 0)
  {

LABEL_4:
    v13 = v9;
    goto LABEL_8;
  }
  ANLogHandleFiles();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v18 = &stru_24D370F00;
    v19 = 2112;
    v20 = v12;
    _os_log_impl(&dword_2156FF000, v14, OS_LOG_TYPE_ERROR, "%@ANFiles: failed to write to temporary file: %@", buf, 0x16u);
  }

  v13 = 0;
LABEL_8:

  return v13;
}

- (id)createTemporaryURLWithExtension:(id)a3 directory:(id)a4
{
  return -[ANFiles createDirectory:andFileURLWithExtension:](self, "createDirectory:andFileURLWithExtension:", a4, a3);
}

- (void)purgeTemporarySubDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  const std::__fs::filesystem::path *v11;
  id v12;
  const std::__fs::filesystem::path *v13;
  std::error_code *v14;
  int v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint32_t v22;
  void *v23;
  NSObject *v24;
  int v25;
  id v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[ANFiles temporaryDirectoryUrl](ANFiles, "temporaryDirectoryUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[ANFiles temporaryDirectoryUrl](ANFiles, "temporaryDirectoryUrl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_retainAutorelease(v5);
  v11 = (const std::__fs::filesystem::path *)objc_msgSend(v10, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v9);
  v13 = (const std::__fs::filesystem::path *)objc_msgSend(v12, "fileSystemRepresentation");
  rename(v11, v13, v14);
  if (v15)
  {
    v16 = *__error();
    ANLogHandleFiles();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v16 == 2)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = &stru_24D370F00;
        v19 = "%@ANFiles: skipping purge, directory does not exist";
        v20 = v18;
        v21 = OS_LOG_TYPE_DEFAULT;
        v22 = 12;
LABEL_11:
        _os_log_impl(&dword_2156FF000, v20, v21, v19, buf, v22);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v25 = *__error();
      *(_DWORD *)buf = 138412546;
      v28 = &stru_24D370F00;
      v29 = 1024;
      LODWORD(v30) = v25;
      v19 = "%@ANFiles: failed to rename directory before safely purging: %d";
      v20 = v18;
      v21 = OS_LOG_TYPE_ERROR;
      v22 = 18;
      goto LABEL_11;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v23, "removeItemAtURL:error:", v12, &v26);
    v18 = v26;

    if (v18)
    {
      ANLogHandleFiles();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v28 = &stru_24D370F00;
        v29 = 2112;
        v30 = v12;
        v31 = 2112;
        v32 = v18;
        _os_log_impl(&dword_2156FF000, v24, OS_LOG_TYPE_ERROR, "%@ANFiles: failed to remove temporary sub directory at %@: %@", buf, 0x20u);
      }

    }
  }

}

- (void)removeItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "removeItemAtURL:error:", v4, &v8);
  v6 = v8;

  if (v6)
  {
    ANLogHandleFiles();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v10 = &stru_24D370F00;
      v11 = 2112;
      v12 = v4;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_ERROR, "%@ANFiles: failed to remove item at %@: %@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v7 = objc_claimAutoreleasedReturnValue();
    -[ANFiles removeDirectoryIfEmpty:](self, "removeDirectoryIfEmpty:", v7);
  }

}

- (id)createDirectory:(id)a3 andFileURLWithExtension:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = a3;
  +[ANFiles temporaryDirectoryUrl](ANFiles, "temporaryDirectoryUrl");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  ANLogHandleFiles();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v23 = &stru_24D370F00;
    v24 = 2112;
    v25 = v8;
    _os_log_impl(&dword_2156FF000, v9, OS_LOG_TYPE_DEFAULT, "%@ANFiles: creating directory at: %@", buf, 0x16u);
  }

  v10 = objc_retainAutorelease(v8);
  if (mkdir((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0x1EDu) && *__error() != 17)
  {
    ANLogHandleFiles();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v20 = *__error();
      *(_DWORD *)buf = 138412546;
      v23 = &stru_24D370F00;
      v24 = 1024;
      LODWORD(v25) = v20;
      _os_log_impl(&dword_2156FF000, v17, OS_LOG_TYPE_ERROR, "%@ANFiles: failed to create directory: %d", buf, 0x12u);
    }
    v18 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ANUtils an_dateFormatterForFilename](ANUtils, "an_dateFormatterForFilename");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringFromDate:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("%@--%@"), v13, v16);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v18, "URLByAppendingPathExtension:", v5);
      v19 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v19;
    }
  }

  return v18;
}

- (void)removeDirectoryIfEmpty:(id)a3
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  NSObject *v10;
  int v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(a3);
  if (rmdir((const char *)objc_msgSend(v3, "fileSystemRepresentation")))
  {
    if (*__error() == 66)
    {
      ANLogHandleFiles();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138412290;
        v13 = &stru_24D370F00;
        v5 = "%@ANFiles: failed to remove directory because it is not empty";
        v6 = v4;
        v7 = OS_LOG_TYPE_DEFAULT;
        v8 = 12;
LABEL_10:
        _os_log_impl(&dword_2156FF000, v6, v7, v5, (uint8_t *)&v12, v8);
      }
    }
    else
    {
      v9 = *__error();
      ANLogHandleFiles();
      v10 = objc_claimAutoreleasedReturnValue();
      v4 = v10;
      if (v9 == 20)
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 138412546;
          v13 = &stru_24D370F00;
          v14 = 2112;
          v15 = v3;
          v5 = "%@ANFiles: failed to remove item. %@ is not a directory";
          v6 = v4;
          v7 = OS_LOG_TYPE_DEFAULT;
          v8 = 22;
          goto LABEL_10;
        }
      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *__error();
        v12 = 138412546;
        v13 = &stru_24D370F00;
        v14 = 1024;
        LODWORD(v15) = v11;
        v5 = "%@ANFiles: failed to remove directory: %d";
        v6 = v4;
        v7 = OS_LOG_TYPE_ERROR;
        v8 = 18;
        goto LABEL_10;
      }
    }

  }
}

@end
