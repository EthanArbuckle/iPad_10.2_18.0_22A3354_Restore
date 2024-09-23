@implementation CCRapportFileTransferManager

- (CCRapportFileTransferManager)init
{
  CCRapportFileTransferManager *v2;
  void *v3;
  void *v4;
  void *v5;
  NSURL *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSURL *temporaryDirectoryURL;
  NSURL *v11;
  uint64_t v12;
  NSMutableDictionary *fileTransferSessions;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *fileTransferQueue;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  NSURL *v21;
  __int16 v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)CCRapportFileTransferManager;
  v2 = -[CCRapportFileTransferManager init](&v19, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x24BDBCF48];
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    v24[1] = CFSTR("CloudKitDistributedSync");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPathComponents:", v5);
    v6 = (NSURL *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v18);
    v8 = v18;

    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v6;
      v22 = 2112;
      v23 = v8;
      _os_log_impl(&dword_237B02000, v9, OS_LOG_TYPE_DEFAULT, "CCRapportFileTransferManager: created directory at path %@ with error %@", buf, 0x16u);
    }

    temporaryDirectoryURL = v2->_temporaryDirectoryURL;
    v2->_temporaryDirectoryURL = v6;
    v11 = v6;

    v12 = objc_opt_new();
    fileTransferSessions = v2->_fileTransferSessions;
    v2->_fileTransferSessions = (NSMutableDictionary *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.biomesyncd.fileTransferSessionManager", v14);
    fileTransferQueue = v2->_fileTransferQueue;
    v2->_fileTransferQueue = (OS_dispatch_queue *)v15;

  }
  return v2;
}

- (id)buildFileTransferSessionWithTargetDeviceIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  char v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v14;

  v4 = a3;
  __biome_log_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:].cold.3();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_fileTransferSessions, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    v8 = (id)objc_opt_new();
    objc_msgSend(v8, "setDispatchQueue:", self->_fileTransferQueue);
    objc_msgSend(v8, "setTargetID:", v4);
    objc_msgSend(v8, "setFlags:", 257);
    objc_msgSend(v8, "setTemporaryDirectoryURL:", self->_temporaryDirectoryURL);
    v14 = 0;
    v9 = objc_msgSend(v8, "prepareTemplateAndReturnError:", &v14);
    v10 = v14;
    __biome_log_for_category();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if ((v9 & 1) != 0)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:].cold.1();
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:].cold.2();
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fileTransferSessions, "setObject:forKeyedSubscript:", v8, v4);
  }

  return v8;
}

- (id)initiateFileTransferSesionBackToTargetDeviceWithIdentifier:(id)a3 withExchangedPeerPublicKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v17;

  v6 = a3;
  v7 = a4;
  __biome_log_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[CCRapportFileTransferManager initiateFileTransferSesionBackToTargetDeviceWithIdentifier:withExchangedPeerPublicKey:].cold.3();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_fileTransferSessions, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v11 = (id)objc_opt_new();
    objc_msgSend(v11, "setDispatchQueue:", self->_fileTransferQueue);
    objc_msgSend(v11, "setTargetID:", v6);
    objc_msgSend(v11, "setFlags:", 256);
    objc_msgSend(v11, "setPeerPublicKey:", v7);
    objc_msgSend(v11, "setTemporaryDirectoryURL:", self->_temporaryDirectoryURL);
    objc_msgSend(v11, "setProgressHandler:", &__block_literal_global_1);
    v17 = 0;
    v12 = objc_msgSend(v11, "prepareTemplateAndReturnError:", &v17);
    v13 = v17;
    __biome_log_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if ((v12 & 1) != 0)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:].cold.1();
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      -[CCRapportFileTransferManager buildFileTransferSessionWithTargetDeviceIdentifier:].cold.2();
    }

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_fileTransferSessions, "setObject:forKeyedSubscript:", v11, v6);
  }

  return v11;
}

void __118__CCRapportFileTransferManager_initiateFileTransferSesionBackToTargetDeviceWithIdentifier_withExchangedPeerPublicKey___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  __biome_log_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __118__CCRapportFileTransferManager_initiateFileTransferSesionBackToTargetDeviceWithIdentifier_withExchangedPeerPublicKey___block_invoke_cold_1();

}

- (void)closeFileTransferSessionWithDeviceIdentifier:(id)a3
{
  NSMutableDictionary *fileTransferSessions;
  id v5;
  id v6;

  fileTransferSessions = self->_fileTransferSessions;
  v5 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](fileTransferSessions, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "finish");
  -[NSMutableDictionary removeObjectForKey:](self->_fileTransferSessions, "removeObjectForKey:", v5);

}

- (void)closeAllFileTransferSessions
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_fileTransferSessions, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_fileTransferSessions, "removeAllObjects");
}

- (OS_dispatch_queue)fileTransferQueue
{
  return self->_fileTransferQueue;
}

- (NSURL)temporaryDirectoryURL
{
  return self->_temporaryDirectoryURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryDirectoryURL, 0);
  objc_storeStrong((id *)&self->_fileTransferQueue, 0);
  objc_storeStrong((id *)&self->_fileTransferSessions, 0);
}

- (void)buildFileTransferSessionWithTargetDeviceIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_237B02000, v0, v1, "CCRapportFileTransferManager: prepareTemplateAndReturnError %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)buildFileTransferSessionWithTargetDeviceIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_10(&dword_237B02000, v0, v1, "CCRapportFileTransferManager: failed to prepare file transfer template %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)buildFileTransferSessionWithTargetDeviceIdentifier:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_237B02000, v0, v1, "CCRapportFileTransferManager: buildFileTransferSessionWithTargetDeviceIdentifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initiateFileTransferSesionBackToTargetDeviceWithIdentifier:withExchangedPeerPublicKey:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_237B02000, v0, v1, "CCRapportFileTransferManager: initiateFileTransferSesionBackToTargetDeviceWithIdentifier %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __118__CCRapportFileTransferManager_initiateFileTransferSesionBackToTargetDeviceWithIdentifier_withExchangedPeerPublicKey___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0_2(&dword_237B02000, v0, v1, "CCRapportFileTransferManager: progress %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
