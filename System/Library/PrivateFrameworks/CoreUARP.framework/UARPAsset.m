@implementation UARPAsset

- (UARPAsset)initWithID:(id)a3
{
  id v5;
  UARPAsset *v6;
  UARPAsset *v7;
  os_log_t v8;
  OS_os_log *log;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPAsset;
  v6 = -[UARPAsset init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_id, a3);
    v8 = os_log_create("com.apple.accessoryupdater.uarp", "assetID");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

  }
  return v7;
}

- (UARPAsset)initWithID:(id)a3 withBuffer:(id)a4
{

  return 0;
}

- (UARPAsset)initWithID:(id)a3 sandboxToken:(id)a4
{
  id v6;
  UARPAsset *v7;
  UARPSandboxExtension *v8;
  UARPSandboxExtension *sandboxExtension;
  UARPAsset *v10;

  v6 = a4;
  v7 = -[UARPAsset initWithID:](self, "initWithID:", a3);
  if (v7
    && (v8 = -[UARPSandboxExtension initWithTokenString:]([UARPSandboxExtension alloc], "initWithTokenString:", v6), sandboxExtension = v7->_sandboxExtension, v7->_sandboxExtension = v8, sandboxExtension, !v7->_sandboxExtension))
  {
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (id)getDataInRange:(_NSRange)a3 error:(id *)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v8;

  length = a3.length;
  location = a3.location;
  if (-[UARPAsset prepareLocalFileForUse:](self, "prepareLocalFileForUse:", a4)
    && -[NSFileHandle uarpSeekToOffset:error:](self->_filehandle, "uarpSeekToOffset:error:", location, a4))
  {
    -[NSFileHandle uarpReadDataUpToLength:error:](self->_filehandle, "uarpReadDataUpToLength:error:", length, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)setData:(id)a3 atOffset:(unint64_t)a4 error:(id *)a5
{
  id v8;
  BOOL v9;

  v8 = a3;
  v9 = -[UARPAsset prepareLocalFileForUse:](self, "prepareLocalFileForUse:", a5)
    && -[NSFileHandle uarpSeekToOffset:error:](self->_filehandle, "uarpSeekToOffset:error:", a4, a5)
    && -[NSFileHandle uarpWriteData:error:](self->_filehandle, "uarpWriteData:error:", v8, a5);

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAssetID rawDescription](self->_id, "rawDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  UARPAsset *v4;
  BOOL v5;

  v4 = (UARPAsset *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = self == v4 || -[UARPAssetID isEqual:](self->_id, "isEqual:", v4->_id);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)fileLength
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  unint64_t v7;
  id v9;

  -[UARPAsset prepareLocalFileForUse:](self, "prepareLocalFileForUse:", 0);
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_url, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = objc_msgSend(v5, "fileSize");

  if (v6)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPAsset fileLength].cold.1();
    v7 = 0;
  }

  return v7;
}

- (BOOL)prepareLocalFileForUse:(id *)a3
{
  int64_t *p_onceToken;
  int64_t onceToken;
  NSObject *log;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v11 = 0;
  v12[0] = &v11;
  v12[1] = 0x3032000000;
  v12[2] = __Block_byref_object_copy_;
  v12[3] = __Block_byref_object_dispose_;
  v13 = 0;
  onceToken = self->_onceToken;
  p_onceToken = &self->_onceToken;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36__UARPAsset_prepareLocalFileForUse___block_invoke;
  v10[3] = &unk_24CEA3800;
  v10[4] = self;
  v10[5] = &v11;
  if (onceToken != -1)
  {
    dispatch_once(p_onceToken, v10);
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease(*(id *)(v12[0] + 40));
LABEL_4:
  if (*(_QWORD *)(v12[0] + 40))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPAsset prepareLocalFileForUse:].cold.1((uint64_t)self, (uint64_t)v12, log);
  }
  v8 = self->_filehandle != 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __36__UARPAsset_prepareLocalFileForUse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id obj;

  v2 = a1 + 32;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "localURL");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(*(_QWORD *)v2 + 8);
  *(_QWORD *)(*(_QWORD *)v2 + 8) = v3;

  if (objc_msgSend(*(id *)(*(_QWORD *)v2 + 48), "type") == 10)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)v2 + 48), "localURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "createFileAtPath:contents:attributes:", v7, 0, 0);

    if ((v8 & 1) == 0 && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)v2 + 24), OS_LOG_TYPE_ERROR))
      __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_2();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v10 + 40);
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v9, &obj);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v10 + 40), obj);
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 16);
    *(_QWORD *)(v12 + 16) = v11;

    if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 24), OS_LOG_TYPE_DEBUG))
      __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_1();
  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v19 = *(id *)(v15 + 40);
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForReadingFromURL:error:", v14, &v19);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v15 + 40), v19);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 16);
    *(_QWORD *)(v17 + 16) = v16;

    if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 24), OS_LOG_TYPE_DEBUG))
      __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_3();
  }
}

- (void)concludeLocalFileAccess
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: Error closing file %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (UARPAssetID)id
{
  return (UARPAssetID *)objc_getProperty(self, a2, 48, 1);
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_id, 0);
  objc_storeStrong((id *)&self->_sandboxExtension, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_filehandle, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)fileLength
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_1_2(&dword_212D08000, v0, v1, "%s: Failed to get file size attribute for %@ with error %@", v2);
}

- (void)prepareLocalFileForUse:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[UARPAsset prepareLocalFileForUse:]";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a1 + 8);
  *(_WORD *)&v3[22] = 2112;
  OUTLINED_FUNCTION_1_2(&dword_212D08000, a2, a3, "%s: Failed to Write/Read to url(%@) with Error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(*(_QWORD *)a2 + 40));
}

void __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_212D08000, v0, v1, "%s: Opened Asset for writing at %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2_1(&dword_212D08000, v0, v1, "%s: Failed to createFileAtPath for use %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __36__UARPAsset_prepareLocalFileForUse___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_212D08000, v0, v1, "%s: Opened Asset for reading at %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

@end
