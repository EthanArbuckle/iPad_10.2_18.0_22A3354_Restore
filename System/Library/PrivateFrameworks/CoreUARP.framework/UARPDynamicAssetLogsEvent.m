@implementation UARPDynamicAssetLogsEvent

- (UARPDynamicAssetLogsEvent)init
{
  -[UARPDynamicAssetLogsEvent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetLogsEvent)initWithURL:(id)a3
{
  id v5;
  UARPDynamicAssetLogsEvent *v6;
  UARPDynamicAssetLogsEvent *v7;
  os_log_t v8;
  OS_os_log *log;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPDynamicAssetLogsEvent;
  v6 = -[UARPDynamicAssetLogsEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = os_log_create("com.apple.accessoryupdater.uarp", "logs");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

  }
  return v7;
}

- (BOOL)decomposeUARP
{
  UARPSuperBinaryAsset *v3;
  UARPSuperBinaryAsset *asset;
  BOOL v5;
  NSObject *log;

  v3 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  v5 = -[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0);
  if (!v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetLogsEvent decomposeUARP].cold.1(log);
  }
  return v5;
}

- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4
{
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  NSObject *log;
  __int128 v28;
  id obj;
  uint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v31 = a4;
  if (!-[UARPDynamicAssetLogsEvent decomposeUARP](self, "decomposeUARP"))
  {
    v25 = 0;
    goto LABEL_23;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (!v7)
  {
    v25 = 1;
    goto LABEL_22;
  }
  v9 = v7;
  v30 = *(_QWORD *)v33;
  *(_QWORD *)&v8 = 136315394;
  v28 = v8;
  while (2)
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v33 != v30)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
      -[UARPDynamicAssetLogsEvent createLogsFilepath:forRemoteEndpoint:](self, "createLogsFilepath:forRemoteEndpoint:", v11, v31, v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v12);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "createFileAtPath:contents:attributes:", v15, 0, 0);

      if ((v16 & 1) == 0)
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          -[UARPDynamicAssetLogsEvent expandToDirectory:forRemoteEndpoint:].cold.1(log, v13);
        goto LABEL_21;
      }
      objc_msgSend(v11, "rangePayload");
      -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v11, 0, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!UARPWriteFile(v18, v13))
      {

LABEL_21:
        v25 = 0;
        goto LABEL_22;
      }
      v19 = self->_log;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = v19;
        objc_msgSend(v13, "path");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v28;
        v37 = "-[UARPDynamicAssetLogsEvent expandToDirectory:forRemoteEndpoint:]";
        v38 = 2112;
        v39 = v21;
        _os_log_impl(&dword_212D08000, v20, OS_LOG_TYPE_INFO, "%s: Successfully Expanded LOGS to File: %@", buf, 0x16u);

      }
      if (v6)
      {
        UARPStringLogsDirectoryFilePath();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastPathComponent");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        UARPCopyFile((uint64_t)v22, v23, v24);

      }
    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    v25 = 1;
    if (v9)
      continue;
    break;
  }
LABEL_22:

LABEL_23:
  return v25;
}

+ (id)tag
{
  char *v2;

  v2 = (char *)uarpAssetTagStructAnalytics();
  return -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v2, v2[1], v2[2], v2[3]);
}

- (id)createLogsFilepath:(id)a3 forRemoteEndpoint:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  objc_msgSend(a3, "tlvs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347665, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "valueAsString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("-%@"), v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_24CEA45E8;
  }
  -[__CFString stringByAppendingPathExtension:](v10, "stringByAppendingPathExtension:", CFSTR("txt"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appleModelNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "serialNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  UARPStringLogsDirectoryFilePath();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UARPUniqueFilename(v12, v13, v14, CFSTR("LOGS"), v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)decomposeUARP
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_212D08000, log, OS_LOG_TYPE_ERROR, "Unable to expand LOGS SuperBinary Asset", v1, 2u);
}

- (void)expandToDirectory:(void *)a1 forRemoteEndpoint:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_212D08000, v3, OS_LOG_TYPE_ERROR, "Failed to create filepath for radar LOGS at %@", (uint8_t *)&v5, 0xCu);

}

@end
