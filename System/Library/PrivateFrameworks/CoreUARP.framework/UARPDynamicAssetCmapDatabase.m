@implementation UARPDynamicAssetCmapDatabase

- (UARPDynamicAssetCmapDatabase)init
{
  -[UARPDynamicAssetCmapDatabase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)initCmapDatabase:(id)a3
{
  id v5;
  UARPDynamicAssetCmapDatabase *v6;
  os_log_t v7;
  OS_os_log *log;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableArray *v21;
  NSMutableArray *cmapDatabase;
  UARPDynamicAssetCmapDatabase *v23;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)UARPDynamicAssetCmapDatabase;
  v6 = -[UARPDynamicAssetCmapDatabase init](&v34, sel_init);
  v7 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
  log = v6->_log;
  v6->_log = (OS_os_log *)v7;

  if (!-[UARPDynamicAssetCmapDatabase cmapDatabaseFileExists](v6, "cmapDatabaseFileExists"))
  {
LABEL_7:
    if (!v6->_cmapDatabase)
    {
      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      cmapDatabase = v6->_cmapDatabase;
      v6->_cmapDatabase = v21;

    }
    if (v5)
      objc_storeStrong((id *)&v6->_url, a3);
    v6 = v6;
    v23 = v6;
    goto LABEL_12;
  }
  -[UARPDynamicAssetCmapDatabase findCmapDatabaseFileUrl](v6, "findCmapDatabaseFileUrl");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v33);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v33;

    if (!v12 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCmapDatabase initCmapDatabase:].cold.2((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);

    v6 = (UARPDynamicAssetCmapDatabase *)v12;
    goto LABEL_7;
  }
  v25 = v6->_log;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[UARPDynamicAssetCmapDatabase initCmapDatabase:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
  v23 = 0;
LABEL_12:

  return v23;
}

- (UARPDynamicAssetCmapDatabase)initWithCoder:(id)a3
{
  id v4;
  UARPDynamicAssetCmapDatabase *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *cmapDatabase;
  os_log_t v12;
  OS_os_log *log;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UARPDynamicAssetCmapDatabase;
  v5 = -[UARPDynamicAssetCmapDatabase init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("cmap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "mutableCopy");
    cmapDatabase = v5->_cmapDatabase;
    v5->_cmapDatabase = (NSMutableArray *)v10;

    v12 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v5->_log;
    v5->_log = (OS_os_log *)v12;

  }
  return v5;
}

- (BOOL)flushToDisk
{
  void *v3;
  void *v4;
  id v5;
  NSObject *log;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v15;

  -[UARPDynamicAssetCmapDatabase findCmapDatabaseFileUrl](self, "findCmapDatabaseFileUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v15);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (!v4)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[UARPDynamicAssetCmapDatabase flushToDisk].cold.1((uint64_t)v5, log, v7, v8, v9, v10, v11, v12);
    }
    v13 = objc_msgSend(v4, "writeToURL:atomically:", v3, 1);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_cmapDatabase, CFSTR("cmap"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)decomposeUARP
{
  UARPSuperBinaryAsset *v3;
  UARPSuperBinaryAsset *asset;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  BOOL v25;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0))
    return 0;
  +[UARPDynamicAssetCmapMapping tag](UARPDynamicAssetCmapMapping, "tag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v10, "payloadTag");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "tag");
        v13 = objc_msgSend(v5, "tag");

        if (v12 == v13)
        {
          objc_msgSend(v10, "rangePayload");
          -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v10, 0, v14, 0);
          v15 = objc_claimAutoreleasedReturnValue();
          if (!v15)
            goto LABEL_18;
          v16 = (void *)v15;
          v17 = (void *)MEMORY[0x24BDBCF20];
          v18 = objc_opt_class();
          v19 = objc_opt_class();
          v20 = objc_opt_class();
          objc_msgSend(v17, "setWithObjects:", v18, v19, v20, objc_opt_class(), 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v21, v16, 0);
          v22 = objc_claimAutoreleasedReturnValue();
          if (!v22)
          {

LABEL_18:
            v25 = 0;
            goto LABEL_19;
          }
          v23 = (void *)v22;
          v24 = -[UARPDynamicAssetCmapDatabase addCmapMapping:](self, "addCmapMapping:", v22);

          if (!v24)
            goto LABEL_18;
        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v7)
        continue;
      break;
    }
  }

  if (self->_cmapDatabase)
    -[UARPDynamicAssetCmapDatabase flushToDisk](self, "flushToDisk");
  v25 = 1;
LABEL_19:

  return v25;
}

- (BOOL)addCmapMapping:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  UARPDynamicAssetCmapMapping *v7;
  void *v8;
  UARPDynamicAssetCmapMapping *v9;
  BOOL v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  char v21;
  NSObject *log;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UARPDynamicAssetCmapDatabase findCmapforAppleModel:](self, "findCmapforAppleModel:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      if ((MGGetBoolAnswer() & 1) == 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sections"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v6, "appendCmapEvents:", v20);

        if ((v21 & 1) == 0)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetCmapDatabase addCmapMapping:].cold.1(log, v23, v24, v25, v26, v27, v28, v29);
          v10 = 0;
          goto LABEL_9;
        }
LABEL_8:
        v10 = 1;
LABEL_9:

        goto LABEL_13;
      }
      -[NSMutableArray removeObject:](self->_cmapDatabase, "removeObject:", v6);
    }
    v7 = [UARPDynamicAssetCmapMapping alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UARPDynamicAssetCmapMapping initWithEvents:appleModelNumber:](v7, "initWithEvents:appleModelNumber:", v8, v5);

    if (v9)
      -[NSMutableArray addObject:](self->_cmapDatabase, "addObject:", v9);

    goto LABEL_8;
  }
  v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[UARPDynamicAssetCmapDatabase addCmapMapping:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
  v10 = 0;
LABEL_13:

  return v10;
}

- (id)findCmapforAppleModel:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_cmapDatabase;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "isEqualAppleModel:", v4, (_QWORD)v11) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)expandCrshData:(id)a3 withAppleModelNumber:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *log;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = a4;
  -[UARPDynamicAssetCmapDatabase findCmapforAppleModel:](self, "findCmapforAppleModel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "expandCrshDictionary:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCmapDatabase expandCrshData:withAppleModelNumber:].cold.1((uint64_t)v7, log, v12, v13, v14, v15, v16, v17);
    v10 = 0;
  }

  return v10;
}

- (id)findCmapDatabaseFileUrl
{
  void *v3;
  void *v4;
  void *v5;

  if (-[UARPDynamicAssetCmapDatabase cmapDatabaseFileExists](self, "cmapDatabaseFileExists")
    || -[UARPDynamicAssetCmapDatabase createCmapDatabaseFile](self, "createCmapDatabaseFile"))
  {
    v3 = (void *)MEMORY[0x24BDBCF48];
    UARPStringCmapDatabaseFilePath();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (BOOL)createCmapDatabaseFile
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *log;

  v3 = (void *)MEMORY[0x24BDBCF48];
  UARPStringCmapDatabaseFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UARPDynamicAssetCmapDatabase cmapDatabaseFileExists](self, "cmapDatabaseFileExists"))
  {
    v6 = 1;
  }
  else
  {
    UARPStringCmapDirectoryPath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UARPUtilsCreateTemporaryFolder(v7);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UARPStringCmapDatabaseFilePath();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "createFileAtPath:contents:attributes:", v9, 0, 0);

    if ((v6 & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[UARPDynamicAssetCmapDatabase createCmapDatabaseFile].cold.1(log);
    }

  }
  return v6;
}

- (BOOL)cmapDatabaseFileExists
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringCmapDatabaseFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

- (BOOL)cleanUpCmapDatabaseFiles
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *log;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringCmapDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCmapDatabase cleanUpCmapDatabaseFiles].cold.1(log, (uint64_t)v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_cmapDatabase, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initCmapDatabase:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Cmap Database File exists on disk, but unable to find Cmap Database URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)initCmapDatabase:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Cmap Database unable to unarchive the data: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)flushToDisk
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Writing to CMAP Database failed: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addCmapMapping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Unable to append duplicate CMAP Events.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)addCmapMapping:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "CMAP Apple Model Number must be String.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandCrshData:(uint64_t)a3 withAppleModelNumber:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "No CMAP Mapping for this Apple Model Number: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createCmapDatabaseFile
{
  NSObject *v1;
  void *v2;
  int v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  UARPStringCmapDatabaseFilePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_212D08000, v1, OS_LOG_TYPE_ERROR, "%s: Unable to create file at %@", (uint8_t *)v3, 0x16u);

}

- (void)cleanUpCmapDatabaseFiles
{
  NSObject *v3;
  void *v4;
  __int16 v5;
  int v6[5];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  UARPStringCmapDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_2_2();
  v7 = v5;
  v8 = a2;
  _os_log_error_impl(&dword_212D08000, v3, OS_LOG_TYPE_ERROR, "%s: Unable to remove files at %@ (%@)", (uint8_t *)v6, 0x20u);

}

@end
