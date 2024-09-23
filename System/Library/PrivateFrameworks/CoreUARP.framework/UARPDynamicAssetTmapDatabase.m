@implementation UARPDynamicAssetTmapDatabase

- (UARPDynamicAssetTmapDatabase)init
{
  -[UARPDynamicAssetTmapDatabase doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)initTmapDatabase:(id)a3
{
  unint64_t v5;
  UARPDynamicAssetTmapDatabase *v6;
  os_log_t v7;
  OS_os_log *log;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *tmapDatabase;
  NSMutableArray *v14;
  NSMutableArray *v15;
  UARPDynamicAssetTmapDatabase *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  objc_super v26;

  v5 = (unint64_t)a3;
  v26.receiver = self;
  v26.super_class = (Class)UARPDynamicAssetTmapDatabase;
  v6 = -[UARPDynamicAssetTmapDatabase init](&v26, sel_init);
  v7 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
  log = v6->_log;
  v6->_log = (OS_os_log *)v7;

  if (-[UARPDynamicAssetTmapDatabase tmapDatabaseFileExists](v6, "tmapDatabaseFileExists"))
  {
    -[UARPDynamicAssetTmapDatabase findTmapDatabaseFileUrl](v6, "findTmapDatabaseFileUrl");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v17 = v6->_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[UARPDynamicAssetTmapDatabase initTmapDatabase:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);
      goto LABEL_12;
    }
    v10 = (void *)v9;
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfURL:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v6 = (UARPDynamicAssetTmapDatabase *)v12;
  }
  tmapDatabase = v6->_tmapDatabase;
  if (!(v5 | (unint64_t)tmapDatabase))
  {
LABEL_12:
    v16 = 0;
    goto LABEL_13;
  }
  if (!tmapDatabase)
  {
    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v15 = v6->_tmapDatabase;
    v6->_tmapDatabase = v14;

  }
  if (v5)
    objc_storeStrong((id *)&v6->_url, a3);
  v6 = v6;
  v16 = v6;
LABEL_13:

  return v16;
}

- (UARPDynamicAssetTmapDatabase)initWithCoder:(id)a3
{
  id v4;
  UARPDynamicAssetTmapDatabase *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableArray *tmapDatabase;
  os_log_t v12;
  OS_os_log *log;
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UARPDynamicAssetTmapDatabase;
  v5 = -[UARPDynamicAssetTmapDatabase init](&v15, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("tmap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "mutableCopy");
    tmapDatabase = v5->_tmapDatabase;
    v5->_tmapDatabase = (NSMutableArray *)v10;

    v12 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v5->_log;
    v5->_log = (OS_os_log *)v12;

  }
  return v5;
}

- (BOOL)flushToDisk
{
  void *v3;
  void *v4;
  char v5;

  -[UARPDynamicAssetTmapDatabase findTmapDatabaseFileUrl](self, "findTmapDatabaseFileUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "writeToURL:atomically:", v3, 1);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_tmapDatabase, CFSTR("tmap"));
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
  +[UARPDynamicAssetTmapMapping tag](UARPDynamicAssetTmapMapping, "tag");
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
          v24 = -[UARPDynamicAssetTmapDatabase addTmapMapping:](self, "addTmapMapping:", v22);

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

  if (self->_tmapDatabase)
    -[UARPDynamicAssetTmapDatabase flushToDisk](self, "flushToDisk");
  v25 = 1;
LABEL_19:

  return v25;
}

- (BOOL)addTmapMapping:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  __CFString *v7;
  void *v8;
  UARPDynamicAssetTmapMapping *v9;
  void *v10;
  UARPDynamicAssetTmapMapping *v11;
  NSObject *v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v23;
  char v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    LOWORD(v33) = 0;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Adding TMAP Mapping", (uint8_t *)&v33, 2u);
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Endian"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v7)
      v7 = CFSTR("BigEndian");
    -[UARPDynamicAssetTmapDatabase findTmapforAppleModel:](self, "findTmapforAppleModel:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if ((MGGetBoolAnswer() & 1) == 0)
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Events"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v8, "appendTmapEvents:endian:", v23, v7);

        if ((v24 & 1) == 0)
        {
          v25 = self->_log;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetTmapDatabase addTmapMapping:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);
          v13 = 0;
          goto LABEL_15;
        }
LABEL_14:
        v13 = 1;
LABEL_15:

        goto LABEL_19;
      }
      -[NSMutableArray removeObject:](self->_tmapDatabase, "removeObject:", v8);
    }
    v9 = [UARPDynamicAssetTmapMapping alloc];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Events"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[UARPDynamicAssetTmapMapping initWithEvents:appleModelNumber:endian:](v9, "initWithEvents:appleModelNumber:endian:", v10, v6, v7);

    if (v11)
    {
      v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v33 = 138412290;
        v34 = v6;
        _os_log_impl(&dword_212D08000, v12, OS_LOG_TYPE_INFO, "Adding TMAP for Apple Model Number: %@", (uint8_t *)&v33, 0xCu);
      }
      -[NSMutableArray addObject:](self->_tmapDatabase, "addObject:", v11);
    }

    goto LABEL_14;
  }
  v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[UARPDynamicAssetTmapDatabase addTmapMapping:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
  v13 = 0;
LABEL_19:

  return v13;
}

- (id)findTmapforAppleModel:(id)a3
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
  v5 = self->_tmapDatabase;
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

- (id)expandMticData:(id)a3 withEventID:(unsigned int)a4 appleModelNumber:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  -[UARPDynamicAssetTmapDatabase findTmapforAppleModel:](self, "findTmapforAppleModel:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "expandMticData:withEventID:", v8, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      -[UARPDynamicAssetTmapDatabase expandMticData:withEventID:appleModelNumber:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    v11 = 0;
  }

  return v11;
}

- (id)findTmapDatabaseFileUrl
{
  void *v3;
  void *v4;
  void *v5;

  if (-[UARPDynamicAssetTmapDatabase tmapDatabaseFileExists](self, "tmapDatabaseFileExists")
    || -[UARPDynamicAssetTmapDatabase createTmapDatabaseFile](self, "createTmapDatabaseFile"))
  {
    v3 = (void *)MEMORY[0x24BDBCF48];
    UARPStringTmapDatabaseFilePath();
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

- (BOOL)createTmapDatabaseFile
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
  UARPStringTmapDatabaseFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[UARPDynamicAssetTmapDatabase tmapDatabaseFileExists](self, "tmapDatabaseFileExists"))
  {
    v6 = 1;
  }
  else
  {
    UARPStringTmapDirectoryPath();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UARPUtilsCreateTemporaryFolder(v7);

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UARPStringTmapDatabaseFilePath();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "createFileAtPath:contents:attributes:", v9, 0, 0);

    if ((v6 & 1) == 0)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[UARPDynamicAssetTmapDatabase createTmapDatabaseFile].cold.1(log);
    }

  }
  return v6;
}

- (BOOL)tmapDatabaseFileExists
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringTmapDatabaseFilePath();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

- (BOOL)cleanUpTmapDatabaseFiles
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  NSObject *log;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringTmapDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v5 = objc_msgSend(v3, "removeItemAtPath:error:", v4, &v9);
  v6 = v9;

  if ((v5 & 1) == 0)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetTmapDatabase cleanUpTmapDatabaseFiles].cold.1(log, (uint64_t)v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_tmapDatabase, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)initTmapDatabase:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Tmap Database File exists on disk, but unable to find Tmap Database URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)addTmapMapping:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Unable to append TMAP Events to TMAP Mapping.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)addTmapMapping:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "TMAP Field Name must be String.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandMticData:(uint64_t)a3 withEventID:(uint64_t)a4 appleModelNumber:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "No TMAP Mapping to match Apple Model Number.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)createTmapDatabaseFile
{
  NSObject *v1;
  void *v2;
  int v3[6];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  UARPStringTmapDatabaseFilePath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = 136315394;
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_212D08000, v1, OS_LOG_TYPE_ERROR, "%s: Unable to create file at %@", (uint8_t *)v3, 0x16u);

}

- (void)cleanUpTmapDatabaseFiles
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
  UARPStringTmapDirectoryPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_2_2();
  v7 = v5;
  v8 = a2;
  _os_log_error_impl(&dword_212D08000, v3, OS_LOG_TYPE_ERROR, "%s: Unable to remove files at %@ (%@)", (uint8_t *)v6, 0x20u);

}

@end
