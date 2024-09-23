@implementation CNAssistantCache

+ (id)cachePath
{
  void *v2;
  const char *v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  void *v13;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v5, v6, (uint64_t)CFSTR("com.apple.AssistantServices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v10, v11, (uint64_t)v7, 1, 0, 0);
  objc_msgSend_stringByAppendingPathComponent_(v7, v12, (uint64_t)CFSTR("CNAssistantUpdatesCache.plist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)cacheDictionary
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  int isReadableFileAtPath;
  const char *v13;
  uint64_t v14;
  void *v15;

  objc_msgSend_cachePath(a1, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_fileExistsAtPath_(v6, v7, (uint64_t)v3) & 1) == 0)
  {

LABEL_6:
    objc_msgSend_dictionary(MEMORY[0x24BDBCED8], v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isReadableFileAtPath = objc_msgSend_isReadableFileAtPath_(v10, v11, (uint64_t)v3);

  if (!isReadableFileAtPath)
    goto LABEL_6;
  objc_msgSend_dictionaryWithContentsOfFile_(MEMORY[0x24BDBCED8], v13, (uint64_t)v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_6;
LABEL_7:

  return v15;
}

+ (BOOL)saveCache:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int isWritableFileAtPath;
  const char *v17;
  char v18;

  v4 = a3;
  objc_msgSend_cachePath(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v7) & 1) == 0)
  {

    goto LABEL_5;
  }
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isWritableFileAtPath = objc_msgSend_isWritableFileAtPath_(v14, v15, (uint64_t)v7);

  if (isWritableFileAtPath)
  {
LABEL_5:
    v18 = objc_msgSend_writeToFile_atomically_(v4, v17, (uint64_t)v7, 1);
    goto LABEL_6;
  }
  v18 = 0;
LABEL_6:

  return v18;
}

+ (BOOL)addUpdate:(id)a3 forAssistantUrl:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  char v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  id v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  const char *v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend_cacheDictionary(a1, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v7, v11, v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v13;
  v16 = 0;
  if (v10 && v13)
  {
    objc_msgSend_objectForKeyedSubscript_(v10, v14, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend_mutableCopy(v17, v18, v19);

    if (!v20)
    {
      v22 = objc_alloc(MEMORY[0x24BDBCEB8]);
      v20 = (void *)objc_msgSend_initWithCapacity_(v22, v23, 1);
    }
    objc_msgSend_addObject_(v20, v21, (uint64_t)v6);
    objc_msgSend_absoluteString(v7, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v10, v27, (uint64_t)v20, v26);

    v16 = objc_msgSend_saveCache_(a1, v28, (uint64_t)v10);
  }

  return v16;
}

+ (BOOL)removeUpdatesForAssistantUrl:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;
  const char *v13;

  v4 = a3;
  objc_msgSend_cacheDictionary(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v7 && v10)
  {
    objc_msgSend_removeObjectForKey_(v7, v11, (uint64_t)v10);
    v12 = objc_msgSend_saveCache_(a1, v13, (uint64_t)v7);
  }

  return v12;
}

+ (BOOL)removeAllUpdates
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  char v13;

  objc_msgSend_cachePath(a1, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v3 && objc_msgSend_fileExistsAtPath_(v6, v7, (uint64_t)v3))
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend_removeItemAtPath_error_(v11, v12, (uint64_t)v3, 0);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)updatesForAssistantUrl:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;

  v4 = a3;
  objc_msgSend_cacheDictionary(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_absoluteString(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  if (v7 && v10)
  {
    objc_msgSend_objectForKeyedSubscript_(v7, v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
