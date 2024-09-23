@implementation JFXMediaURLManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_60);
  return (id)sharedInstance_fileManager;
}

void __36__JFXMediaURLManager_sharedInstance__block_invoke()
{
  JFXMediaURLManager *v0;
  void *v1;

  v0 = objc_alloc_init(JFXMediaURLManager);
  v1 = (void *)sharedInstance_fileManager;
  sharedInstance_fileManager = (uint64_t)v0;

}

+ (id)videoRecordingFolderURL:(id *)a3
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_tempFileURLWithDirectory:file:error:", CFSTR("VideoRecordings"), CFSTR("foo.bar"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByDeletingLastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !*a3 && (!objc_msgSend(a1, "_createDirectoryAtURL:error:", v6, a3) || *a3))
  {

    v6 = 0;
  }
  return v6;
}

+ (id)videoExportURL:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a1, "_videoExportURL:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!*a3)
    {
      objc_msgSend(v5, "URLByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "_createDirectoryAtURL:error:", v7, a3);

      if (!v8 || *a3)
      {

        v6 = 0;
      }
    }
  }
  return v6;
}

+ (id)capturedPhotoURL:(id *)a3 isHEIF:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a1, "_capturedPhotoURL:isHEIF:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (!*a3)
    {
      objc_msgSend(v6, "URLByDeletingLastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(a1, "_createDirectoryAtURL:error:", v8, a3);

      if (!v9 || *a3)
      {

        v7 = 0;
      }
    }
  }
  return v7;
}

+ (id)photoExportURL:(id *)a3 isHEIF:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a1, "_photoExportURL:isHEIF:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (!*a3)
    {
      objc_msgSend(v6, "URLByDeletingLastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(a1, "_createDirectoryAtURL:error:", v8, a3);

      if (!v9 || *a3)
      {

        v7 = 0;
      }
    }
  }
  return v7;
}

+ (id)temporaryPhotoURL:(id *)a3 fileName:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a1, "_temporaryPhotoURL:fileName:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (!*a3)
    {
      objc_msgSend(v6, "URLByDeletingLastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(a1, "_createDirectoryAtURL:error:", v8, a3);

      if (!v9 || *a3)
      {

        v7 = 0;
      }
    }
  }
  return v7;
}

+ (id)audioRecordingURL:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a1, "_audioRecordingURL:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (!*a3)
    {
      objc_msgSend(v5, "URLByDeletingLastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(a1, "_createDirectoryAtURL:error:", v7, a3);

      if (!v8 || *a3)
      {

        v6 = 0;
      }
    }
  }
  return v6;
}

+ (id)cachedExportFileURLWithError:(id *)a3
{
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v20;

  +[JFXMediaURLManager sharedInstance](JFXMediaURLManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "urlSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    +[JFXMediaURLManager sharedInstance](JFXMediaURLManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "urlSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cachedExportFileURLWithError:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_12:
      v18 = 0;
      goto LABEL_13;
    }
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, &v20);

    if (v13 && v20)
      goto LABEL_11;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    if (!v10 || a3 && *a3)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v16, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("Exports"), 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(a1, "_createDirectoryAtURL:error:", v10, a3))
    goto LABEL_12;
LABEL_11:
  v10 = v10;
  v18 = v10;
LABEL_13:

  return v18;
}

+ (void)jfx_cleanupOldProjects
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        v19 = 0;
        objc_msgSend(a1, "cachedExportFileURLWithError:", &v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v19;
        objc_msgSend(v12, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "isEqualToString:", v14) & 1) == 0)
        {
          v15 = (void *)MEMORY[0x24BDBCF48];
          NSTemporaryDirectory();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "stringByAppendingPathComponent:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "fileURLWithPath:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_cleanupDirectory:", v18);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

+ (void)cleanupTemporaryDirectories
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  objc_msgSend(a1, "jfx_cleanupOldProjects");
  v10 = 0;
  objc_msgSend(a1, "videoRecordingFolderURL:", &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(a1, "_cleanupDirectory:", v3);
  objc_msgSend(a1, "_capturedPhotoURL:isHEIF:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "URLByDeletingLastPathComponent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_cleanupDirectory:", v6);

  }
  objc_msgSend(a1, "_audioRecordingURL:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "URLByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_cleanupDirectory:", v9);

  }
}

+ (id)_videoExportURL:(id *)a3
{
  return (id)objc_msgSend(a1, "_tempFileURLWithDirectory:file:error:", CFSTR("Exports"), CFSTR("video.mov"), a3);
}

+ (id)_temporaryPhotoURL:(id *)a3 fileName:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  v6 = (__CFString *)a4;
  v7 = v6;
  v8 = CFSTR("photo");
  if (v6 && -[__CFString length](v6, "length"))
    v8 = v7;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.png"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_tempFileURLWithDirectory:file:error:", CFSTR("TemporaryPhotos"), v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)_capturedPhotoURL:(id *)a3 isHEIF:(BOOL)a4
{
  const __CFString *v6;
  void *v7;
  void *v8;

  v6 = CFSTR("jpg");
  if (a4)
    v6 = CFSTR("heic");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("photo.%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_tempFileURLWithDirectory:file:error:", CFSTR("CapturedPhotos"), v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_photoExportURL:(id *)a3 isHEIF:(BOOL)a4
{
  const __CFString *v6;
  void *v7;
  void *v8;

  v6 = CFSTR("jpg");
  if (a4)
    v6 = CFSTR("heic");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("photo.%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_tempFileURLWithDirectory:file:error:", CFSTR("Exports"), v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_audioRecordingURL:(id *)a3
{
  return (id)objc_msgSend(a1, "_tempFileURLWithDirectory:file:error:", CFSTR("AudioRecordings"), CFSTR("audio.caf"), a3);
}

+ (void)_cleanupDirectory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 0, &v29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v29;

  if (v6)
  {
    objc_msgSend(v6, "domain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", *MEMORY[0x24BDD0B88]))
    {
      v8 = objc_msgSend(v6, "code");

      if (v8 == 260)
        goto LABEL_26;
    }
    else
    {

    }
    JFXLog_file();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      +[JFXMediaURLManager _cleanupDirectory:].cold.1((uint64_t)v5, (uint64_t)v6, v12);
  }
  else
  {
    if (objc_msgSend(v5, "count"))
    {
      JFXLog_modelAssetManagement();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "lastPathComponent");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v5, "count");
        *(_DWORD *)buf = 138412546;
        v31 = v10;
        v32 = 1024;
        LODWORD(v33) = v11;
        _os_log_impl(&dword_2269A9000, v9, OS_LOG_TYPE_DEFAULT, "clean up directory %@: %u items", buf, 0x12u);

      }
    }
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v5;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v13)
    {
      v14 = v13;
      v22 = v5;
      v23 = v3;
      v6 = 0;
      v15 = *(_QWORD *)v26;
      do
      {
        v16 = 0;
        v17 = v6;
        do
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager", v22, v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v17;
          v20 = objc_msgSend(v19, "removeItemAtURL:error:", v18, &v24);
          v6 = v24;

          if ((v20 & 1) == 0)
          {
            JFXLog_file();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v31 = v18;
              v32 = 2112;
              v33 = v6;
              _os_log_debug_impl(&dword_2269A9000, v21, OS_LOG_TYPE_DEBUG, "Error removing %@ %@", buf, 0x16u);
            }

          }
          ++v16;
          v17 = v6;
        }
        while (v14 != v16);
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v14);
      v5 = v22;
      v3 = v23;
    }
    else
    {
      v6 = 0;
    }
  }

LABEL_26:
}

+ (id)_tempFileURLWithDirectory:(id)a3 file:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10 || a5 && *a5)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v13, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v7, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v17, "fileExistsAtPath:", v18);

    if (v19)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "removeItemAtURL:error:", v16, 0);

    }
    v10 = v16;

    v11 = v10;
  }

  return v11;
}

+ (BOOL)_createDirectoryAtURL:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, a4);

  return (char)a4;
}

+ (BOOL)ODRAssetsAreEmbedded
{
  if (ODRAssetsAreEmbedded_onceToken != -1)
    dispatch_once(&ODRAssetsAreEmbedded_onceToken, &__block_literal_global_30);
  return ODRAssetsAreEmbedded_isEmbedded;
}

void __42__JFXMediaURLManager_ODRAssetsAreEmbedded__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  BOOL v4;
  char v5;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundlePath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("OnDemandResources"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v1) = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v2, &v5);

  if ((_DWORD)v1)
    v4 = v5 == 0;
  else
    v4 = 1;
  if (!v4)
    ODRAssetsAreEmbedded_isEmbedded = 1;

}

- (JTFileURLSource)urlSource
{
  return (JTFileURLSource *)objc_loadWeakRetained((id *)&self->_urlSource);
}

- (void)setUrlSource:(id)a3
{
  objc_storeWeak((id *)&self->_urlSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_urlSource);
}

+ (void)_cleanupDirectory:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_2269A9000, log, OS_LOG_TYPE_DEBUG, "Error getting temporary directory contents %@ %@", (uint8_t *)&v3, 0x16u);
}

@end
