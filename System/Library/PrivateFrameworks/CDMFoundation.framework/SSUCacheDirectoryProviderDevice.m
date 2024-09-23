@implementation SSUCacheDirectoryProviderDevice

+ (id)getUserCacheDirectoriesList
{
  return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
}

+ (id)createDirectoryAttributes
{
  return 0;
}

- (id)lookupOrCreateCacheDirectory:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;
  char v30;
  _QWORD v31[2];
  _QWORD v32[2];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "getUserCacheDirectoriesList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("ssu"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v10, &v30);

    if (v11)
      v12 = v30 == 0;
    else
      v12 = 0;
    if (v12)
    {
      if (a3)
      {
        v22 = *MEMORY[0x24BDD0FD8];
        v37[0] = *MEMORY[0x24BDD0FC8];
        v37[1] = v22;
        v38[0] = CFSTR("Could not lookup/create cache directory.");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("There is already a non-directory file at path: %@."), v8);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v23;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SSUCacheDirectoryProviderErrorDomain"), 1, v24);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if ((v11 & 1) != 0)
      {
LABEL_11:
        v18 = v8;
LABEL_21:

        goto LABEL_22;
      }
      CDMOSLoggerForCategory(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v34 = "-[SSUCacheDirectoryProviderDevice lookupOrCreateCacheDirectory:]";
        v35 = 2112;
        v36 = v8;
        _os_log_debug_impl(&dword_21A2A0000, v13, OS_LOG_TYPE_DEBUG, "%s SSU cache directory does not already exist. Creating it at path: %@", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "createDirectoryAttributes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      v16 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, v15, &v29);
      v17 = v29;

      if ((v16 & 1) != 0)
      {

        goto LABEL_11;
      }
      if (a3)
      {
        v25 = *MEMORY[0x24BDD0FD8];
        v31[0] = *MEMORY[0x24BDD0FC8];
        v31[1] = v25;
        v32[0] = CFSTR("Could not lookup/create cache directory.");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Error creating directory at path: %@. Error: %@."), v8, v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32[1] = v26;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SSUCacheDirectoryProviderErrorDomain"), 2, v27);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    v18 = 0;
    goto LABEL_21;
  }
  if (a3)
  {
    v19 = *MEMORY[0x24BDD0FC8];
    v40[0] = CFSTR("Could not lookup/create cache directory.");
    v20 = *MEMORY[0x24BDD0FD8];
    v39[0] = v19;
    v39[1] = v20;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Expected a unique user cache directory, but received: %@."), v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("SSUCacheDirectoryProviderErrorDomain"), 0, v7);
    v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:

  return v18;
}

@end
