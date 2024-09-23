@implementation ACCMediaLibraryFeaturePlugin

- (NSString)pluginName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[ACCMediaLibraryFeaturePlugin pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = obfuscatedPointer((uint64_t)self);
  v6 = -[ACCMediaLibraryFeaturePlugin isRunning](self, "isRunning");
  v7 = "NO";
  if (v6)
    v7 = "YES";
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> isRunning: %s"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (void)initPlugin
{
  ACCMediaLibraryProvider *mediaLibraryProvider;

  init_logging();
  mediaLibraryProvider = self->_mediaLibraryProvider;
  self->_mediaLibraryProvider = 0;

  -[ACCMediaLibraryFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
}

- (void)startPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *mediaLibraryCBProcessQ;
  ACCMediaLibraryProvider *v8;
  ACCMediaLibraryProvider *mediaLibraryProvider;
  NSMutableDictionary *v10;
  NSMutableDictionary *mediaLibraryShimList;
  uint8_t v12[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "Starting Media Library feature plugin...", v12, 2u);
  }

  v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.mlPlugin.mediaLibraryCBProcessQ", 0);
  mediaLibraryCBProcessQ = self->_mediaLibraryCBProcessQ;
  self->_mediaLibraryCBProcessQ = v6;

  v8 = (ACCMediaLibraryProvider *)objc_msgSend(objc_alloc(MEMORY[0x24BE00B78]), "initWithDelegate:queue:", self, self->_mediaLibraryCBProcessQ);
  mediaLibraryProvider = self->_mediaLibraryProvider;
  self->_mediaLibraryProvider = v8;

  v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  mediaLibraryShimList = self->_mediaLibraryShimList;
  self->_mediaLibraryShimList = v10;

  -[ACCMediaLibraryFeaturePlugin setIsRunning:](self, "setIsRunning:", 1);
}

- (void)stopPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  void *v8;
  ACCMediaLibraryProvider *mediaLibraryProvider;
  NSMutableDictionary *mediaLibraryShimList;
  OS_dispatch_queue *mediaLibraryCBProcessQ;
  uint8_t v12[16];
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21A7E0000, v5, OS_LOG_TYPE_DEFAULT, "Stopping Media Library feature plugin...", buf, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_INFO, "Removing all observers...", v12, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  mediaLibraryProvider = self->_mediaLibraryProvider;
  self->_mediaLibraryProvider = 0;

  mediaLibraryShimList = self->_mediaLibraryShimList;
  self->_mediaLibraryShimList = 0;

  mediaLibraryCBProcessQ = self->_mediaLibraryCBProcessQ;
  self->_mediaLibraryCBProcessQ = 0;

}

- (ACCMediaLibraryProvider)provider
{
  return self->_mediaLibraryProvider;
}

- (void)notifyAvailableLibraries:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21A7E0000, v7, OS_LOG_TYPE_INFO, "notifyAvailableLibraries: %@", (uint8_t *)&v8, 0xCu);
  }

  -[ACCMediaLibraryProvider notifyAvailableLibraries:](self->_mediaLibraryProvider, "notifyAvailableLibraries:", v4);
}

- (void)notify:(id)a3 stateChange:(int)a4 enabled:(BOOL)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;
  uint64_t v18;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 1024;
    v15 = v6;
    v16 = 1024;
    v17 = v5;
    _os_log_impl(&dword_21A7E0000, v11, OS_LOG_TYPE_INFO, "notifyStateChange: %@  type=%d enabled=%d", (uint8_t *)&v12, 0x18u);
  }

  -[ACCMediaLibraryProvider notify:stateChange:enabled:](self->_mediaLibraryProvider, "notify:stateChange:enabled:", v8, v6, v5);
}

- (void)mediaLibrary:(id)a3 accessoryArrived:(id)a4 windowPerLibrary:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  NSMutableDictionary *mediaLibraryShimList;
  void *v9;
  ACCMediaLibraryShim *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  NSMutableDictionary *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  ACCMediaLibraryShim *v21;
  uint64_t v22;

  v5 = *(_QWORD *)&a5;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v7, "accessoryUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v9);
  v10 = (ACCMediaLibraryShim *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v16 = 138412802;
    v17 = v7;
    v18 = 1024;
    v19 = v5;
    v20 = 2112;
    v21 = v10;
    _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_INFO, "mediaLibraryAccessoryArrived: accessory=%@  windowPerLibrary=%d, shim=%@", (uint8_t *)&v16, 0x1Cu);
  }

  if (!v10)
  {
    v10 = -[ACCMediaLibraryShim initWithAccessory:windowPerLibrary:delegate:]([ACCMediaLibraryShim alloc], "initWithAccessory:windowPerLibrary:delegate:", v7, v5, self);
    v14 = self->_mediaLibraryShimList;
    objc_msgSend(v7, "accessoryUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v10, v15);

    -[ACCMediaLibraryShim startShimForAccessoryAttach:](v10, "startShimForAccessoryAttach:", v7);
    -[ACCMediaLibraryShim startSendingMediaLibraryInfomationUpdates](v10, "startSendingMediaLibraryInfomationUpdates");
  }

}

- (void)mediaLibrary:(id)a3 accessoryLeft:(id)a4
{
  id v5;
  NSMutableDictionary *mediaLibraryShimList;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  NSMutableDictionary *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v5, "accessoryUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v14 = 138412546;
    v15 = v5;
    v16 = 2112;
    v17 = v8;
    _os_log_impl(&dword_21A7E0000, v11, OS_LOG_TYPE_INFO, "mediaLibraryAccessoryLeft: %@  shim=%@", (uint8_t *)&v14, 0x16u);
  }

  if (v8)
  {
    objc_msgSend(v8, "shuttingDown");
    v12 = self->_mediaLibraryShimList;
    objc_msgSend(v5, "accessoryUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v12, "removeObjectForKey:", v13);

  }
}

- (void)mediaLibrary:(id)a3 accessoryUpdate:(id)a4 windowPerLibrary:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  NSMutableDictionary *mediaLibraryShimList;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v5 = *(_QWORD *)&a5;
  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v7, "accessoryUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = 138412802;
    v15 = v7;
    v16 = 1024;
    v17 = v5;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_21A7E0000, v13, OS_LOG_TYPE_INFO, "mediaLibraryAccessoryUpdate: %@  windowPerLibrary=%d, shim=%@", (uint8_t *)&v14, 0x1Cu);
  }

  if (v10)
    objc_msgSend(v10, "setWindowPerLibrary:", v5);

}

- (void)mediaLibrary:(id)a3 startUpdate:(id)a4 lastRevision:(id)a5 requestedInfo:(id)a6 accessory:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSMutableDictionary *mediaLibraryShimList;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v14, "accessoryUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    ACCMediaLibraryFeatureRequestedInfoDesc(v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138413314;
    v22 = v14;
    v23 = 2112;
    v24 = v11;
    v25 = 2112;
    v26 = v12;
    v27 = 2112;
    v28 = v20;
    v29 = 2112;
    v30 = v17;
    _os_log_impl(&dword_21A7E0000, v18, OS_LOG_TYPE_INFO, "mediaLibraryStartUpdate: %@ libUID=%@ lastRevision=%@ requestedInfo=%@ shim=%@", (uint8_t *)&v21, 0x34u);

  }
  if (v17)
    objc_msgSend(v17, "startMediaLibraryUpdate:lastRevision:requestedInfo:", v11, v12, v13);

}

- (void)mediaLibrary:(id)a3 confirmUpdate:(id)a4 lastRevision:(id)a5 updateCount:(unsigned int)a6 accessory:(id)a7
{
  uint64_t v8;
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *mediaLibraryShimList;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v8 = *(_QWORD *)&a6;
  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a7;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v13, "accessoryUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v17 = gNumLogObjects < 1;
  else
    v17 = 1;
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v19 = MEMORY[0x24BDACB70];
    v18 = MEMORY[0x24BDACB70];
  }
  else
  {
    v19 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = 138413314;
    v21 = v13;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    v26 = 1024;
    v27 = v8;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_21A7E0000, v19, OS_LOG_TYPE_INFO, "mediaLibraryConfirmUpdate: %@ libUID=%@ lastRevision=%@ count=%d shim=%@", (uint8_t *)&v20, 0x30u);
  }

  if (v16)
    objc_msgSend(v16, "confirmMediaLibraryUpdate:lastRevision:updateCount:", v11, v12, v8);

}

- (void)mediaLibrary:(id)a3 confirmPlaylistContentUpdate:(id)a4 lastRevision:(id)a5 accessory:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSMutableDictionary *mediaLibraryShimList;
  void *v13;
  void *v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v11, "accessoryUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = 138413058;
    v19 = v11;
    v20 = 2112;
    v21 = v9;
    v22 = 2112;
    v23 = v10;
    v24 = 2112;
    v25 = v14;
    _os_log_impl(&dword_21A7E0000, v17, OS_LOG_TYPE_INFO, "mediaLibraryConfirmUpdate: %@ libUID=%@ lastRevision=%@ shim=%@", (uint8_t *)&v18, 0x2Au);
  }

  if (v14)
    objc_msgSend(v14, "confirmMediaLibraryPlaylistContentUpdate:lastRevision:", v9, v10);

}

- (void)mediaLibrary:(id)a3 stopUpdate:(id)a4 accessory:(id)a5
{
  id v7;
  id v8;
  NSMutableDictionary *mediaLibraryShimList;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v8, "accessoryUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_21A7E0000, v14, OS_LOG_TYPE_INFO, "mediaLibraryStopUpdate: %@ libUID=%@ shim=%@", (uint8_t *)&v15, 0x20u);
  }

  if (v11)
    objc_msgSend(v11, "stopMediaLibraryUpdate:", v7);

}

- (void)mediaLibrary:(id)a3 stopAllUpdate:(id)a4
{
  id v5;
  NSMutableDictionary *mediaLibraryShimList;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v5, "accessoryUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v9 = gNumLogObjects < 1;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v10 = MEMORY[0x24BDACB70];
  }
  else
  {
    v11 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = 138412546;
    v13 = v5;
    v14 = 2112;
    v15 = v8;
    _os_log_impl(&dword_21A7E0000, v11, OS_LOG_TYPE_INFO, "mediaLibraryStopAllUpdate: %@ shim=%@", (uint8_t *)&v12, 0x16u);
  }

  if (v8)
    objc_msgSend(v8, "stopAllMediaLibraryUpdate");

}

- (void)mediaLibrary:(id)a3 play:(id)a4 itemList:(id)a5 firstItemIndex:(unint64_t)a6 accessory:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSMutableDictionary *mediaLibraryShimList;
  void *v15;
  void *v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a7;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v13, "accessoryUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v17 = gNumLogObjects < 1;
  else
    v17 = 1;
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v19 = MEMORY[0x24BDACB70];
    v18 = MEMORY[0x24BDACB70];
  }
  else
  {
    v19 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = 138413314;
    v21 = v13;
    v22 = 2112;
    v23 = v11;
    v24 = 2048;
    v25 = a6;
    v26 = 2112;
    v27 = v12;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_21A7E0000, v19, OS_LOG_TYPE_INFO, "mediaLibraryStopUpdate: %@ libUID=%@ firstItemIndex=%lu itemList=%@ shim=%@", (uint8_t *)&v20, 0x34u);
  }

  if (v16)
    objc_msgSend(v16, "playMediaLibraryItems:itemList:firstItemIndex:", v11, v12, a6);

}

- (void)mediaLibrary:(id)a3 play:(id)a4 collection:(unint64_t)a5 type:(int)a6 firstItemIndex:(unint64_t)a7 accessory:(id)a8
{
  uint64_t v10;
  id v13;
  id v14;
  NSMutableDictionary *mediaLibraryShimList;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v10 = *(_QWORD *)&a6;
  v33 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a8;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v14, "accessoryUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v18 = gNumLogObjects < 1;
  else
    v18 = 1;
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v20 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  else
  {
    v20 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = 138413570;
    v22 = v14;
    v23 = 2112;
    v24 = v13;
    v25 = 2048;
    v26 = a5;
    v27 = 1024;
    v28 = v10;
    v29 = 2048;
    v30 = a7;
    v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_21A7E0000, v20, OS_LOG_TYPE_INFO, "mediaLibraryStopUpdate: %@ libUID=%@ collection=%llu type=%d firstItemIndex=%lu shim=%@", (uint8_t *)&v21, 0x3Au);
  }

  if (v17)
    objc_msgSend(v17, "playMediaLibraryCollection:collection:type:firstItemIndex:", v13, a5, v10, a7);

}

- (void)mediaLibrary:(id)a3 play:(id)a4 collection:(unint64_t)a5 type:(int)a6 firstItemPersistentID:(unint64_t)a7 accessory:(id)a8
{
  uint64_t v10;
  id v13;
  id v14;
  NSMutableDictionary *mediaLibraryShimList;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  unint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v10 = *(_QWORD *)&a6;
  v33 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a8;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v14, "accessoryUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v18 = gNumLogObjects < 1;
  else
    v18 = 1;
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v20 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  else
  {
    v20 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = 138413570;
    v22 = v14;
    v23 = 2112;
    v24 = v13;
    v25 = 2048;
    v26 = a5;
    v27 = 1024;
    v28 = v10;
    v29 = 2048;
    v30 = a7;
    v31 = 2112;
    v32 = v17;
    _os_log_impl(&dword_21A7E0000, v20, OS_LOG_TYPE_INFO, "mediaLibraryStopUpdate: %@ libUID=%@ collection=%llu type=%d firstItemPersistentID=%llu shim=%@", (uint8_t *)&v21, 0x3Au);
  }

  if (v17)
    objc_msgSend(v17, "playMediaLibraryCollection:collection:type:firstItemPersistentID:", v13, a5, v10, a7);

}

- (void)mediaLibrary:(id)a3 playCurrentSelection:(id)a4 accessory:(id)a5
{
  id v7;
  id v8;
  NSMutableDictionary *mediaLibraryShimList;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v8, "accessoryUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_21A7E0000, v14, OS_LOG_TYPE_INFO, "mediaLibraryplayCurrentSelection: %@ libUID=%@ shim=%@", (uint8_t *)&v15, 0x20u);
  }

  if (v11)
    objc_msgSend(v11, "playMediaLibraryCurrentSelection:", v7);

}

- (void)mediaLibrary:(id)a3 playAllSongs:(id)a4 accessory:(id)a5
{
  id v7;
  id v8;
  NSMutableDictionary *mediaLibraryShimList;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v8, "accessoryUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v12 = gNumLogObjects < 1;
  else
    v12 = 1;
  if (v12)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v14 = MEMORY[0x24BDACB70];
    v13 = MEMORY[0x24BDACB70];
  }
  else
  {
    v14 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = 138412802;
    v16 = v8;
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_21A7E0000, v14, OS_LOG_TYPE_INFO, "mediaLibraryplayAllSongs: %@ libUID=%@ shim=%@", (uint8_t *)&v15, 0x20u);
  }

  if (v11)
    objc_msgSend(v11, "playAllSongs:", v7);

}

- (void)mediaLibrary:(id)a3 playAllSongs:(id)a4 firstItemPersistentID:(unint64_t)a5 accessory:(id)a6
{
  id v9;
  id v10;
  NSMutableDictionary *mediaLibraryShimList;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  v10 = a6;
  mediaLibraryShimList = self->_mediaLibraryShimList;
  objc_msgSend(v10, "accessoryUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](mediaLibraryShimList, "objectForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCMediaLibraryShimInfo _getUIDString].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = 138413058;
    v18 = v10;
    v19 = 2112;
    v20 = v9;
    v21 = 2048;
    v22 = a5;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_21A7E0000, v16, OS_LOG_TYPE_INFO, "mediaLibraryplayAllSongs: %@ libUID=%@ firstItemPersistentID=%llu shim=%@", (uint8_t *)&v17, 0x2Au);
  }

  if (v13)
    objc_msgSend(v13, "playAllSongs:firstItemPersistentID:", v9, a5);

}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

- (ACCMediaLibraryProvider)mediaLibraryProvider
{
  return (ACCMediaLibraryProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMediaLibraryProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)mediaLibraryShimList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setMediaLibraryShimList:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)mediaLibraryCBProcessQ
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMediaLibraryCBProcessQ:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaLibraryCBProcessQ, 0);
  objc_storeStrong((id *)&self->_mediaLibraryShimList, 0);
  objc_storeStrong((id *)&self->_mediaLibraryProvider, 0);
}

@end
