@implementation FBKFileManager

+ (void)deleteAllDraftDirectories
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "draftDirectoryForFilerType:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "draftDirectoryForFilerType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeItemAtURL:error:", v6, 0);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtURL:error:", v3, 0);

}

+ (id)containerURL
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", *MEMORY[0x24BE312C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      +[FBKFileManager containerURL].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  }
  return v3;
}

+ (id)libraryDirectory
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  objc_msgSend(a1, "containerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Library"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[FBKFileManager containerURL].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    v13 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:", v14);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

+ (id)draftsDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "libraryDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Drafts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)applicationSupportDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!FBKIsInternalInstall(a1, a2))
  {
    v5 = 0;
LABEL_12:
    objc_msgSend(a1, "libraryDirectory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("Application Support"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FBK_ALT_APP_SUPPORT_DIR"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_12;
  v6 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v5, "stringByExpandingTildeInPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_12;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "INTERNAL, using alternate app support directory [%@]", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "fileExistsAtPath:", v5);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v17);
    v13 = v17;

    if (v13)
    {

      +[FBKLog appHandle](FBKLog, "appHandle");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        +[FBKFileManager applicationSupportDirectory].cold.1((uint64_t)v13, v14);

      goto LABEL_12;
    }
  }
LABEL_13:

  return v8;
}

+ (id)draftDirectoryForFilerForm:(id)a3 isTemporary:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "filerFormID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "filerFormType");
  +[FBKFileManager draftDirectoryForFilerType:isTemporary:](FBKFileManager, "draftDirectoryForFilerType:isTemporary:", v8, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)draftDirectoryForFilerForm:(id)a3
{
  return (id)objc_msgSend(a1, "draftDirectoryForFilerForm:isTemporary:", a3, 0);
}

+ (id)temporaryDraftDirectoryForFilerForm:(id)a3
{
  return (id)objc_msgSend(a1, "draftDirectoryForFilerForm:isTemporary:", a3, 1);
}

+ (id)draftDirectoryForFilerType:(int64_t)a3
{
  return (id)objc_msgSend(a1, "draftDirectoryForFilerType:isTemporary:", a3, 0);
}

+ (id)draftDirectoryForFilerType:(int64_t)a3 isTemporary:(BOOL)a4
{
  const __CFString *v4;
  const __CFString *v5;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v4 = CFSTR("TEST");
  if (!a3)
    v4 = CFSTR("FB");
  if (a3 == 1)
    v5 = CFSTR("FFU");
  else
    v5 = v4;
  if (a4)
  {
    v12[0] = CFSTR("Drafts");
    v12[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "temporaryDirectoryWithPathComponents:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    +[FBKFileManager draftsDirectory](FBKFileManager, "draftsDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    return v11;
  }
}

+ (id)getUniqueDestinationURLForURL:(id)a3 alwaysIndex:(BOOL)a4 forSourceURL:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(void *, _QWORD);
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(uint64_t, uint64_t);
  void *v21;
  id v22;
  id v23;

  v7 = a3;
  v8 = a5;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __73__FBKFileManager_getUniqueDestinationURLForURL_alwaysIndex_forSourceURL___block_invoke;
  v21 = &unk_24E1596E0;
  v9 = v8;
  v22 = v9;
  v10 = v7;
  v23 = v10;
  v11 = (void (**)(void *, _QWORD))_Block_copy(&v18);
  v11[2](v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (a4 || objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0, v18, v19, v20, v21, v22))
  {
    v14 = 1;
    do
    {
      v11[2](v11, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (v14 + 1);
      v13 = v15;
    }
    while ((objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0);
  }
  else
  {
    v15 = v13;
  }
  v16 = v15;

  return v16;
}

id __73__FBKFileManager_getUniqueDestinationURLForURL_alwaysIndex_forSourceURL___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((_DWORD)a2)
  {
    objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("_%.2d"), a2);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  objc_msgSend(*(id *)(a1 + 40), "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getUniqueDestinationURLForURL:(id)a3 alwaysIndex:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a3;
  v6 = v5;
  if (a4 || objc_msgSend(v5, "checkResourceIsReachableAndReturnError:", 0))
  {
    v7 = 0;
    v8 = 1;
    do
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v6, "URLByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%.2d"), v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathExtension:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v14, 0);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      v8 = (v8 + 1);
      v7 = v15;
    }
    while ((objc_msgSend(v15, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0);
  }
  else
  {
    v15 = v6;
  }

  return v15;
}

+ (BOOL)isDirectory:(id)a3
{
  int v3;
  id v5;

  v5 = 0;
  v3 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v5, *MEMORY[0x24BDBCC60], 0);
  if (v3)
    LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return v3;
}

+ (BOOL)humansCanReadFile:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (humansCanReadFile__onceToken != -1)
    dispatch_once(&humansCanReadFile__onceToken, &__block_literal_global_35);
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (id)humansCanReadFile___notInspectableFileExtensions;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(v4, "hasSuffix:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12) & 1) != 0)
        {
          v10 = 0;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_13:

  return v10;
}

void __36__FBKFileManager_humansCanReadFile___block_invoke()
{
  void *v0;

  v0 = (void *)humansCanReadFile___notInspectableFileExtensions;
  humansCanReadFile___notInspectableFileExtensions = (uint64_t)&unk_24E18D6A0;

}

+ (NSURL)cachedTemporaryDirectory
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553999F0);
  MEMORY[0x24BDAC7A8](v2, v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_255398CB0 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_25539CAB0);
  swift_beginAccess();
  sub_21DA5C280(v6, (uint64_t)v5);
  v7 = sub_21DAC3E44();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_21DAC3DFC();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

+ (void)setCachedTemporaryDirectory:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553999F0);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_21DAC3E20();
    v8 = sub_21DAC3E44();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = sub_21DAC3E44();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  if (qword_255398CB0 != -1)
    swift_once();
  v10 = __swift_project_value_buffer(v4, (uint64_t)qword_25539CAB0);
  swift_beginAccess();
  sub_21DA5C468((uint64_t)v7, v10);
  swift_endAccess();
  sub_21DA5C2C8((uint64_t)v7);
}

+ (id)temporaryDirectoryWithPathComponents:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553999F0);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21DAC496C();
  static FBKFileManager.temporaryDirectory(pathComponents:)(v7, (uint64_t)v6);
  swift_bridgeObjectRelease();
  v8 = sub_21DAC3E44();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_21DAC3DFC();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

+ (void)containerURL
{
  OUTLINED_FUNCTION_0(&dword_21D9A9000, a1, a3, "Could not find group container.", a5, a6, a7, a8, 0);
}

+ (void)applicationSupportDirectory
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = 0;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "INTERNAL, failed to create alternate app support dir [%@] with error %@", (uint8_t *)&v2, 0x16u);
}

@end
