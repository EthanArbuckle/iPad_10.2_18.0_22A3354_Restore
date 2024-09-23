@implementation ABAssistantSyncInfoPersistence

+ (id)filePath
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

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByAppendingPathComponent_(v5, v6, (uint64_t)CFSTR("com.apple.assistant.Contacts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v10, v11, (uint64_t)v7, 1, 0, 0);
  objc_msgSend_stringByAppendingPathComponent_(v7, v12, (uint64_t)CFSTR("CNAssistantSyncInfo.plist"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)infoDictionary
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

  objc_msgSend_filePath(a1, a2, v2);
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

+ (BOOL)saveFileForDictionary:(id)a3
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
  void *v19;
  const char *v20;
  id v21;
  id v23;

  v4 = a3;
  objc_msgSend_filePath(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_fileExistsAtPath_(v10, v11, (uint64_t)v7) & 1) != 0)
  {
    objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    isWritableFileAtPath = objc_msgSend_isWritableFileAtPath_(v14, v15, (uint64_t)v7);

    if (!isWritableFileAtPath)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
        sub_216344DF4();
      v18 = 0;
      goto LABEL_11;
    }
  }
  else
  {

  }
  objc_msgSend_fileURLWithPath_(MEMORY[0x24BDBCF48], v17, (uint64_t)v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v18 = objc_msgSend_writeToURL_error_(v4, v20, (uint64_t)v19, &v23);
  v21 = v23;
  if (v21 && os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FE8], OS_LOG_TYPE_ERROR))
    sub_216344D84();

LABEL_11:
  return v18;
}

+ (void)saveString:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_infoDictionary(a1, v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v10, (uint64_t)v7, v6);

  objc_msgSend_saveFileForDictionary_(a1, v11, (uint64_t)v12);
}

+ (id)stringForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_infoDictionary(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (void)saveValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  const char *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend_infoDictionary(a1, v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v12, v10, (uint64_t)v7, v6);

  objc_msgSend_saveFileForDictionary_(a1, v11, (uint64_t)v12);
}

+ (id)valueForKey:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v4 = a3;
  objc_msgSend_infoDictionary(a1, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v8, (uint64_t)v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
