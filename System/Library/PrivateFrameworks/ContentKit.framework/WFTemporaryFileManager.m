@implementation WFTemporaryFileManager

uint64_t __42__WFTemporaryFileManager_setUpDirectories__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "configureTemporaryDirectoryProtectionIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "configureBackupFlagIfNecessary");
}

void __45__WFTemporaryFileManager_clearTemporaryFiles__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "removeItemAtURL:error:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), 0, (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

+ (void)configureBackupFlagIfNecessary
{
  id v3;

  objc_msgSend(a1, "sharedTemporaryDirectoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureBackupFlagAtURL:", v3);

}

+ (void)configureBackupFlagAtURL:(id)a3
{
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint32_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 206, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));

  }
  v21 = 0;
  v6 = *MEMORY[0x24BDBCC68];
  v20 = 0;
  v7 = objc_msgSend(v5, "getResourceValue:forKey:error:", &v21, v6, &v20);
  v8 = v21;
  v9 = v20;
  if ((v7 & 1) == 0)
  {
    getWFTemporaryFileManagerLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[WFTemporaryFileManager configureBackupFlagAtURL:]";
      v24 = 2112;
      v25 = v5;
      v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Error checking backup flag at %@: %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  if ((objc_msgSend(v8, "BOOLValue") & 1) == 0)
  {
    v19 = v9;
    v10 = objc_msgSend(v5, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v6, &v19);
    v11 = v19;

    getWFTemporaryFileManagerLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v23 = "+[WFTemporaryFileManager configureBackupFlagAtURL:]";
        v24 = 2112;
        v25 = v5;
        v14 = "%s Set backup flag at %@";
        v15 = v13;
        v16 = OS_LOG_TYPE_INFO;
        v17 = 22;
LABEL_12:
        _os_log_impl(&dword_20BBAD000, v15, v16, v14, buf, v17);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[WFTemporaryFileManager configureBackupFlagAtURL:]";
      v24 = 2112;
      v25 = v5;
      v26 = 2112;
      v27 = v11;
      v14 = "%s Error setting backup flag at %@: %@";
      v15 = v13;
      v16 = OS_LOG_TYPE_ERROR;
      v17 = 32;
      goto LABEL_12;
    }
    v9 = v11;
LABEL_14:

  }
}

+ (void)setUpDirectories
{
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(a1, "createSharedDirectoryIfNecessary");
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__WFTemporaryFileManager_setUpDirectories__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_async(v3, block);

}

+ (void)createSharedDirectoryIfNecessary
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sharedTemporaryDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

}

+ (void)clearTemporaryFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(a1, "temporaryDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend(a1, "sharedTemporaryDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v7, 0, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_BACKGROUND, 0);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = dispatch_queue_create("WFInitializeProcessWithDatabase temporary file clearing", v10);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__WFTemporaryFileManager_clearTemporaryFiles__block_invoke;
  v14[3] = &unk_24C4E05E0;
  v15 = v4;
  v16 = v3;
  v12 = v3;
  v13 = v4;
  dispatch_async(v11, v14);

}

+ (id)temporaryDirectoryURL
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (temporaryDirectoryURL_onceToken != -1)
    dispatch_once(&temporaryDirectoryURL_onceToken, &__block_literal_global_12);
  if ((temporaryDirectoryURL_hasCheckedDirectoryExists & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)temporaryDirectoryURL_URL, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, 0);

    if (v5)
    {
      temporaryDirectoryURL_hasCheckedDirectoryExists = 1;
      getWFFilesLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)temporaryDirectoryURL_URL, "path");
        v7 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v18 = "+[WFTemporaryFileManager temporaryDirectoryURL]";
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_DEFAULT, "%s Found an existing temporary directory at %@", buf, 0x16u);

      }
    }
    else
    {
      getWFFilesLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)temporaryDirectoryURL_URL, "path");
        v9 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v18 = "+[WFTemporaryFileManager temporaryDirectoryURL]";
        v19 = 2112;
        v20 = v9;
        _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_DEFAULT, "%s Creating a new temporary directory at %@", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v11 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", temporaryDirectoryURL_URL, 1, 0, &v16);
      v6 = v16;

      if (v11)
      {
        temporaryDirectoryURL_hasCheckedDirectoryExists = 1;
        getWFFilesLogObject();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v18 = "+[WFTemporaryFileManager temporaryDirectoryURL]";
          _os_log_impl(&dword_20BBAD000, v12, OS_LOG_TYPE_DEFAULT, "%s Successfully created process temporary directory, I will set it up.", buf, 0xCu);
        }

        dispatch_get_global_queue(0, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = __47__WFTemporaryFileManager_temporaryDirectoryURL__block_invoke_16;
        v15[3] = &__block_descriptor_40_e5_v8__0l;
        v15[4] = a1;
        dispatch_async(v13, v15);
      }
      else
      {
        getWFFilesLogObject();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v18 = "+[WFTemporaryFileManager temporaryDirectoryURL]";
          v19 = 2112;
          v20 = v6;
          _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create process temporary directory with error: %@", buf, 0x16u);
        }
      }

    }
  }
  return (id)temporaryDirectoryURL_URL;
}

+ (void)configureTemporaryDirectoryProtectionIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "temporaryDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureFileProtectionAtPath:", v4);

  objc_msgSend(a1, "sharedTemporaryDirectoryURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configureFileProtectionAtPath:", v5);

}

+ (void)configureFileProtectionAtPath:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  getWFFilesLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "+[WFTemporaryFileManager configureFileProtectionAtPath:]";
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_DEBUG, "%s Configuring file protection at path: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v5, &v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  if (v9)
  {
    v10 = v9;
    getWFFilesLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v23 = "+[WFTemporaryFileManager configureFileProtectionAtPath:]";
      v24 = 2112;
      v25 = v5;
      v26 = 2112;
      v27 = v10;
      _os_log_impl(&dword_20BBAD000, v11, OS_LOG_TYPE_ERROR, "%s Failed to read attributes of path %@: %@", buf, 0x20u);
    }
  }
  else
  {
    v12 = *MEMORY[0x24BDD0CF0];
    objc_msgSend(v8, "objectForKey:", *MEMORY[0x24BDD0CF0]);
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = v13;
    if (v13
      && (v14 = *MEMORY[0x24BDD0CE0],
          (-[NSObject isEqualToString:](v13, "isEqualToString:", *MEMORY[0x24BDD0CE0]) & 1) == 0))
    {
      v20 = v12;
      v21 = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0;
      objc_msgSend(v7, "setAttributes:ofItemAtPath:error:", v15, v5, &v18);
      v10 = v18;

      if (v10)
      {
        getWFFilesLogObject();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v23 = "+[WFTemporaryFileManager configureFileProtectionAtPath:]";
          v24 = 2112;
          v25 = v10;
          _os_log_impl(&dword_20BBAD000, v16, OS_LOG_TYPE_ERROR, "%s Failed to set file protection attributes: %@", buf, 0x16u);
        }

      }
    }
    else
    {
      v10 = 0;
    }
  }

}

+ (id)sharedTemporaryDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "sharedAppGroupDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Temporary"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    getWFTemporaryFileManagerLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "+[WFTemporaryFileManager sharedTemporaryDirectoryURL]";
      _os_log_impl(&dword_20BBAD000, v7, OS_LOG_TYPE_ERROR, "%s sharedTemporaryDirectoryURL should not be nil", (uint8_t *)&v9, 0xCu);
    }

  }
  return v6;
}

+ (id)sharedAppGroupDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appGroupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(a1, "appGroupIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(a1, "wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:error:", v7, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;

    if (!v5)
    {
      getWFTemporaryFileManagerLogObject();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v12 = "+[WFTemporaryFileManager sharedAppGroupDirectoryURL]";
        v13 = 2114;
        v14 = v6;
        _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_ERROR, "%s sharedAppGroupDirectoryURL should not be nil: %{public}@", buf, 0x16u);
      }

      v5 = 0;
    }
  }

  return v5;
}

+ (id)appGroupIdentifier
{
  __CFString *v2;

  v2 = CFSTR("group.com.apple.shortcuts");
  return CFSTR("group.com.apple.shortcuts");
}

+ (id)wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v12;

  v6 = a3;
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("groupIdentifier.length"));

  }
  v7 = objc_retainAutorelease(v6);
  objc_msgSend(v7, "UTF8String");
  v8 = container_create_or_lookup_path_for_current_user();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", v8, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    free(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)sharedShortcutsAppGroupDirectoryURL
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.is.workflow.shortcuts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    v8 = 0;
    objc_msgSend(a1, "wf_uncachedContainerURLForSecurityApplicationGroupIdentifier:error:", CFSTR("group.is.workflow.shortcuts"), &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (!v4)
    {
      getWFTemporaryFileManagerLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v10 = "+[WFTemporaryFileManager sharedShortcutsAppGroupDirectoryURL]";
        v11 = 2114;
        v12 = v5;
        _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_ERROR, "%s sharedShortcutsAppGroupDirectoryURL should not be nil: %{public}@", buf, 0x16u);
      }

      v4 = 0;
    }
  }

  return v4;
}

+ (void)markDirectoryAsPurgeableAtURL:(id)a3
{
  const char *v3;
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int *v9;
  char *v10;
  const char *v11;
  int *v12;
  char *v13;
  uint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "fileSystemRepresentation");
  v14 = 73733;
  v4 = open(v3, 0);
  if (v4 < 0)
  {
    getWFFilesLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v12 = __error();
      v13 = strerror(*v12);
      *(_DWORD *)buf = 136315650;
      v16 = "+[WFTemporaryFileManager markDirectoryAsPurgeableAtURL:]";
      v17 = 2080;
      v18 = v3;
      v19 = 2080;
      v20 = v13;
      v11 = "%s Could not get file descriptor to %s with error: %s";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  v5 = v4;
  v6 = ffsctl(v4, 0xC0084A44uLL, &v14, 0);
  getWFFilesLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = __error();
      v10 = strerror(*v9);
      *(_DWORD *)buf = 136315650;
      v16 = "+[WFTemporaryFileManager markDirectoryAsPurgeableAtURL:]";
      v17 = 2080;
      v18 = v3;
      v19 = 2080;
      v20 = v10;
      v11 = "%s Failed to mark %s as purgeable with error: %s";
LABEL_7:
      _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_ERROR, v11, buf, 0x20u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "+[WFTemporaryFileManager markDirectoryAsPurgeableAtURL:]";
    v17 = 2080;
    v18 = v3;
    _os_log_impl(&dword_20BBAD000, v8, OS_LOG_TYPE_DEBUG, "%s Marked shared temp directory %s as purgeable", buf, 0x16u);
  }

  close(v5);
}

+ (id)createUniqueDirectoryInDirectory:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v15;
  id v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 0, 0, &v16);
  v11 = v16;

  if ((v10 & 1) != 0)
  {
    v12 = v8;
  }
  else
  {
    getWFTemporaryFileManagerLogObject();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v18 = "+[WFTemporaryFileManager createUniqueDirectoryInDirectory:]";
      v19 = 2112;
      v20 = v8;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_20BBAD000, v13, OS_LOG_TYPE_ERROR, "%s Failed to create unique directory (%@): %@", buf, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

+ (id)proposedFileURLForFilename:(id)a3 inDirectory:(id)a4 isDirectory:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v19;
  void *v20;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 307, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

    goto LABEL_3;
  }
  if (!v10)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v9, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "fileExistsAtPath:", v14);

    if (v15)
    {
      objc_msgSend(a1, "createUniqueDirectoryInDirectory:", v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v9, v5);
      v17 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v17;
    }
  }

  return v12;
}

+ (id)proposedFileURLForFilename:(id)a3 atTheRootOfDirectory:(id)a4 isDirectory:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  SEL v31;
  id v32;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 320, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 321, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

LABEL_3:
  v31 = a2;
  v32 = a1;
  objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v9, v5);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = 2;
    do
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v15, "fileExistsAtPath:", v16);

      if (!v17)
        goto LABEL_13;
      v18 = v11;
      v19 = v9;
      if (v11)
      {
        if (!v9)
          goto LABEL_11;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSURL * _Nonnull WFFileURLByAppendingIterationCount(NSURL * _Nonnull __strong, NSString * _Nonnull __strong, BOOL, NSUInteger)");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("WFTemporaryFileManager.m"), 281, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

        if (!v9)
        {
LABEL_11:
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSURL * _Nonnull WFFileURLByAppendingIterationCount(NSURL * _Nonnull __strong, NSString * _Nonnull __strong, BOOL, NSUInteger)");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("WFTemporaryFileManager.m"), 282, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

        }
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-%lu"), v14);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "wf_filenameTruncatedToMaximumLengthWithSuffix:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v21, v5);
      v22 = objc_claimAutoreleasedReturnValue();

      ++v14;
      v13 = (void *)v22;
    }
    while (v22);
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", v31, v32, CFSTR("WFTemporaryFileManager.m"), 331, CFSTR("fileURL should not be nil"));

  v13 = 0;
LABEL_13:

  return v13;
}

+ (id)proposedTemporaryFileURLForFilename:(id)a3 isDirectory:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "temporaryDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "proposedFileURLForFilename:inDirectory:isDirectory:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)proposedSharedTemporaryFileURLForFilename:(id)a3 isDirectory:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  objc_msgSend(a1, "sharedTemporaryDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "proposedFileURLForFilename:inDirectory:isDirectory:", v6, v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)proposedTemporaryFileURLForFilename:(id)a3
{
  return (id)objc_msgSend(a1, "proposedTemporaryFileURLForFilename:isDirectory:", a3, 0);
}

+ (id)proposedSharedTemporaryFileURLForFilename:(id)a3
{
  return (id)objc_msgSend(a1, "proposedSharedTemporaryFileURLForFilename:isDirectory:", a3, 0);
}

+ (id)proposedFileURLForFilename:(id)a3 inDirectory:(id)a4
{
  return (id)objc_msgSend(a1, "proposedFileURLForFilename:inDirectory:isDirectory:", a3, a4, 0);
}

+ (id)proposedFileURLForFilename:(id)a3 atTheRootOfDirectory:(id)a4
{
  return (id)objc_msgSend(a1, "proposedFileURLForFilename:atTheRootOfDirectory:isDirectory:", a3, a4, 0);
}

+ (id)createTemporaryDirectoryWithFilename:(id)a3 inDirectory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 365, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

LABEL_3:
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v12 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 0, 0, &v21);
  v13 = v21;

  if ((v12 & 1) != 0)
  {
LABEL_9:
    v17 = v10;
    goto LABEL_12;
  }
  objc_msgSend(v13, "domain");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD0B88]))
  {

    goto LABEL_11;
  }
  v15 = objc_msgSend(v13, "code");

  if (v15 != 516)
  {
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  objc_msgSend(a1, "createUniqueDirectoryInDirectory:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createTemporaryDirectoryWithFilename:inDirectory:", v7, v16);
  v17 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v17;
}

+ (id)createSharedTemporaryDirectoryWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedTemporaryDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createTemporaryDirectoryWithFilename:inDirectory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)createTemporaryDirectoryWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "temporaryDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createTemporaryDirectoryWithFilename:inDirectory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)createTemporaryFileWithFilename:(id)a3 inDirectory:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 390, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("filename"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFTemporaryFileManager.m"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

LABEL_3:
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_11;
  v12 = objc_retainAutorelease(v10);
  v13 = open((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 2562, 420);
  if (v13 == -1)
  {
    if (*__error() == 17)
    {
      objc_msgSend(a1, "createUniqueDirectoryInDirectory:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "createTemporaryFileWithFilename:inDirectory:", v7, v15);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    getWFTemporaryFileManagerLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *__error();
      *(_DWORD *)buf = 136315394;
      v22 = "+[WFTemporaryFileManager createTemporaryFileWithFilename:inDirectory:]";
      v23 = 1026;
      v24 = v17;
      _os_log_impl(&dword_20BBAD000, v16, OS_LOG_TYPE_ERROR, "%s Failed to create temporary file, errno=%{public}d", buf, 0x12u);
    }

LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  close(v13);
  v14 = v12;
LABEL_12:

  return v14;
}

+ (id)createTemporaryFileWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "temporaryDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createTemporaryFileWithFilename:inDirectory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)createSharedTemporaryFileWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedTemporaryDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "createTemporaryFileWithFilename:inDirectory:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isTemporaryFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  +[WFTemporaryFileManager temporaryDirectoryURL](WFTemporaryFileManager, "temporaryDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFTemporaryFileManager sharedTemporaryDirectoryURL](WFTemporaryFileManager, "sharedTemporaryDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "wf_proposedFileIsContainedByDirectoryAtURL:", v4) & 1) != 0)
    v6 = 1;
  else
    v6 = objc_msgSend(v3, "wf_proposedFileIsContainedByDirectoryAtURL:", v5);

  return v6;
}

uint64_t __47__WFTemporaryFileManager_temporaryDirectoryURL__block_invoke_16(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend((id)temporaryDirectoryURL_URL, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configureFileProtectionAtPath:", v3);

  objc_msgSend(*(id *)(a1 + 32), "configureBackupFlagAtURL:", temporaryDirectoryURL_URL);
  return objc_msgSend(*(id *)(a1 + 32), "markDirectoryAsPurgeableAtURL:", temporaryDirectoryURL_URL);
}

void __47__WFTemporaryFileManager_temporaryDirectoryURL__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  __CFString *v3;
  __CFString *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  v3 = CFSTR("com.apple.shortcuts.unknown");
  if (v1)
    v3 = (__CFString *)v1;
  v4 = v3;

  v5 = _sandbox_in_a_container();
  getWFFilesLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v15 = 136315138;
      v16 = "+[WFTemporaryFileManager temporaryDirectoryURL]_block_invoke";
      _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_DEFAULT, "%s No access to Shortcuts Temporary Data Vault, but containerized, using container's NSTemporaryDirectory()", (uint8_t *)&v15, 0xCu);
    }

    v8 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:isDirectory:", v9, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)temporaryDirectoryURL_URL;
    temporaryDirectoryURL_URL = v10;
  }
  else
  {
    if (v7)
    {
      v15 = 136315138;
      v16 = "+[WFTemporaryFileManager temporaryDirectoryURL]_block_invoke";
      _os_log_impl(&dword_20BBAD000, v6, OS_LOG_TYPE_DEFAULT, "%s No access to Shortcuts Temporary Data Vault, and not containerized, using system NSTemporaryDirectory() with suffix", (uint8_t *)&v15, 0xCu);
    }

    v12 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPath:isDirectory:", v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", v4, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)temporaryDirectoryURL_URL;
    temporaryDirectoryURL_URL = v13;

  }
}

@end
