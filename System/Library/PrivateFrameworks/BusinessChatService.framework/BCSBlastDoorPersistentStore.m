@implementation BCSBlastDoorPersistentStore

- (id)initWithCacheURL:(id *)a1
{
  id v4;
  id *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  objc_super v26;
  id v27;
  id v28;
  char v29;
  uint64_t v30;
  uint8_t buf[24];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  if (a1)
  {
    v26.receiver = a1;
    v26.super_class = (Class)BCSBlastDoorPersistentStore;
    v5 = (id *)objc_msgSendSuper2(&v26, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong(v5 + 1, a2);
      ABSLogCommon();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(a1, "cacheURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v25;
        _os_log_debug_impl(&dword_20ACAD000, v6, OS_LOG_TYPE_DEBUG, "Creating BlastDoor image cache at: %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(a1, "cacheURL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v9, &v29);

      v11 = 0;
      if (!v10 || v29)
        goto LABEL_10;
      ABSLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20ACAD000, v12, OS_LOG_TYPE_ERROR, "Error creating BlastDoor cache store: unexpected state (found file instead of directory)", buf, 2u);
      }

      objc_msgSend(a1, "cacheURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v14 = objc_msgSend(v7, "removeItemAtURL:error:", v13, &v28);
      v11 = v28;

      if ((v14 & 1) != 0)
      {
LABEL_10:
        v15 = v11;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "cacheURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v11;
        v18 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v17, 1, 0, &v27);
        v11 = v27;

        if ((v18 & 1) == 0)
        {
          ABSLogCommon();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v11;
            _os_log_error_impl(&dword_20ACAD000, v19, OS_LOG_TYPE_ERROR, "Error creating BlastDoor cache store: %@", buf, 0xCu);
          }

        }
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v20 = objc_claimAutoreleasedReturnValue();
        v30 = *MEMORY[0x24BDD0CF0];
        *(_QWORD *)buf = *MEMORY[0x24BDD0CD8];
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", buf, &v30, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "cacheURL");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setAttributes:ofItemAtPath:error:](v20, "setAttributes:ofItemAtPath:error:", v21, v23, 0);

      }
      else
      {
        ABSLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v11;
          _os_log_error_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_ERROR, "Error removing unexpected file (instead of directory): %@", buf, 0xCu);
        }
      }

    }
  }

  return a1;
}

- (id)fileURLForImageWithName:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[BCSBlastDoorPersistentStore cacheURL](self, "cacheURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)updateImageWithName:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  -[BCSBlastDoorPersistentStore fileURLForImageWithName:error:](self, "fileURLForImageWithName:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v15);

    if (v7)
      v8 = v15 == 0;
    else
      v8 = 0;
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = *MEMORY[0x24BDD0C98];
      objc_msgSend(MEMORY[0x24BDBCE60], "now");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[1] = *MEMORY[0x24BDD0CF0];
      v17[0] = v11;
      v17[1] = *MEMORY[0x24BDD0CD8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setAttributes:ofItemAtPath:error:", v12, v13, 0);

      v9 = v4;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)deleteImageWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ABSLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_debug_impl(&dword_20ACAD000, v5, OS_LOG_TYPE_DEBUG, "Deleting image named: %@", (uint8_t *)&v8, 0xCu);
  }

  -[BCSBlastDoorPersistentStore fileURLForImageWithName:error:](self, "fileURLForImageWithName:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject removeItemAtURL:error:](v7, "removeItemAtURL:error:", v6, 0);
  }
  else
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v8) = 0;
      _os_log_debug_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEBUG, "Asked to delete image but unable to construct file URL", (uint8_t *)&v8, 2u);
    }
  }

}

- (void)deleteExpiredImages
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  __int128 v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  _BYTE v29[128];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x24BDAC8D0];
  ABSLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_20ACAD000, v3, OS_LOG_TYPE_DEBUG, "Deleting expired images", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSBlastDoorPersistentStore cacheURL](self, "cacheURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBCBE0];
  v30[0] = *MEMORY[0x24BDBCCD0];
  v30[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v7, 5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v24;
    *(_QWORD *)&v11 = 138412290;
    v20 = v11;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
        v22 = 0;
        objc_msgSend(v15, "getResourceValue:forKey:error:", &v22, v6, 0, v20);
        v16 = v22;
        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDBCE60], "now");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "dateByAddingTimeInterval:", 2592000.0);
          v18 = objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v16, "compare:", v18) == 1)
          {
            ABSLogCommon();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v20;
              v28 = v15;
              _os_log_debug_impl(&dword_20ACAD000, v19, OS_LOG_TYPE_DEBUG, "Removing expired file: %@", buf, 0xCu);
            }

            objc_msgSend(v21, "removeItemAtURL:error:", v15, 0);
          }
        }
        else
        {
          ABSLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v20;
            v28 = v15;
            _os_log_debug_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_DEBUG, "Failed to determine modification date for file: %@", buf, 0xCu);
          }
        }

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v12);
  }

}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void)setCacheURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
}

@end
