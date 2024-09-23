@implementation FSModuleVolume

- (FSModuleVolume)initWithVolume:(id)a3 resource:(id)a4
{
  id v7;
  id v8;
  FSModuleVolume *v9;
  uint64_t v10;
  NSXPCListener *listener;
  NSObject *v12;
  NSXPCListener *v13;
  uint64_t v14;
  NSMutableDictionary *connections;
  uint64_t v16;
  NSMutableDictionary *fileHandleToItemTable;
  FSItem *rootFSItem;
  char v19;
  char v20;
  char v21;
  char v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *fileHandleQueue;
  objc_super v26;
  uint8_t buf[4];
  NSXPCListener *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)FSModuleVolume;
  v9 = -[FSModuleVolume init](&v26, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v10 = objc_claimAutoreleasedReturnValue();
    listener = v9->_listener;
    v9->_listener = (NSXPCListener *)v10;

    -[NSXPCListener setDelegate:](v9->_listener, "setDelegate:", v9);
    -[NSXPCListener resume](v9->_listener, "resume");
    fskit_std_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v9->_listener;
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl(&dword_23B2A6000, v12, OS_LOG_TYPE_DEFAULT, "Built listener %@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_volume, a3);
    objc_storeStrong((id *)&v9->_resource, a4);
    v14 = objc_opt_new();
    connections = v9->_connections;
    v9->_connections = (NSMutableDictionary *)v14;

    v16 = objc_opt_new();
    fileHandleToItemTable = v9->_fileHandleToItemTable;
    v9->_fileHandleToItemTable = (NSMutableDictionary *)v16;

    rootFSItem = v9->_rootFSItem;
    v9->_rootFSItem = 0;

    v9->connectionCount = 0;
    *(_WORD *)&v9->validConnections = 256;
    v9->_supportsKOIOOps = objc_msgSend(v7, "conformsToProtocol:", &unk_256A15FC8);
    v9->_supportsAccessOps = objc_msgSend(v7, "conformsToProtocol:", &unk_256A16028);
    v9->_supportsOpenCloseOps = objc_msgSend(v7, "conformsToProtocol:", &unk_256A16088);
    v9->_supportsReadWriteOps = objc_msgSend(v7, "conformsToProtocol:", &unk_256A160E8);
    if (objc_msgSend(v7, "conformsToProtocol:", &unk_256A16148))
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        v9->_supportsXattrOps = 1;
        goto LABEL_11;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v19 = objc_msgSend(v7, "xattrOperationsInhibited");
        v9->_supportsXattrOps = v19 ^ 1;
        if ((v19 & 1) != 0)
        {
          v20 = 0;
LABEL_12:
          v9->_supportsLimitedXattrOps = v20 & 1;
          v9->_supportsCloneOps = objc_msgSend(v7, "conformsToProtocol:", &unk_256A161A8);
          if (!objc_msgSend(v7, "conformsToProtocol:", &unk_256A16208))
            goto LABEL_16;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v21 = 1;
            goto LABEL_18;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v21 = objc_msgSend(v7, "volumeRenameOperationsInhibited") ^ 1;
          else
LABEL_16:
            v21 = 0;
LABEL_18:
          v9->_supportsVolumeRenameOps = v21;
          if (!objc_msgSend(v7, "conformsToProtocol:", &unk_256A16268))
            goto LABEL_22;
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {
            v22 = 1;
            goto LABEL_24;
          }
          if ((objc_opt_respondsToSelector() & 1) != 0)
            v22 = objc_msgSend(v7, "preallocateOperationsInhibited") ^ 1;
          else
LABEL_22:
            v22 = 0;
LABEL_24:
          v9->_supportsPreallocateOps = v22;
          v9->_supportsOpenUnlink = 1;
          v9->_reportAsLocal = objc_msgSend(v8, "kind") != 3;
          v23 = dispatch_queue_create("FSModuleVolumeFileHandleQueue", 0);
          fileHandleQueue = v9->_fileHandleQueue;
          v9->_fileHandleQueue = (OS_dispatch_queue *)v23;

          goto LABEL_25;
        }
LABEL_11:
        v20 = objc_opt_respondsToSelector();
        goto LABEL_12;
      }
    }
    v20 = 0;
    v9->_supportsXattrOps = 0;
    goto LABEL_12;
  }
LABEL_25:

  return v9;
}

+ (id)volumeWithName:(id)a3 resource:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithVolume:resource:", v7, v6);

  return v8;
}

- (void)updateRootItem:(id)a3
{
  FSItem *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  FSItem *rootFSItem;
  FSItem *v13;

  v4 = (FSItem *)a3;
  -[FSModuleVolume resource](self, "resource");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[FSModuleVolume resource](self, "resource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "kind");

    if (v8 == 1)
    {
      -[FSModuleVolume resource](self, "resource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[FSResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "startUsingResource:", CFSTR("activateVolume"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        self->_supportsKOIOOps = 0;

    }
  }
  rootFSItem = self->_rootFSItem;
  self->_rootFSItem = v4;
  v13 = v4;

  -[FSModuleVolume insertIntoFHCache:](self, "insertIntoFHCache:", self->_rootFSItem);
}

- (id)stopUsingVolume
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  -[FSModuleVolume resource](self, "resource");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[FSModuleVolume resource](self, "resource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "kind"),
        v5,
        v4,
        v6 == 1))
  {
    -[FSModuleVolume resource](self, "resource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FSResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stopUsingResource:", CFSTR("activateVolume"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unsigned)newConnectionID:(id)a3
{
  id v4;
  FSModuleVolume *v5;
  int connectionCount;
  int v7;
  int v8;
  int validConnections;
  BOOL v10;
  NSMutableDictionary *connections;
  void *v12;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  connectionCount = v5->connectionCount;
  if (connectionCount <= 7)
  {
    v8 = 0;
    v5->connectionCount = connectionCount + 1;
    validConnections = v5->validConnections;
    do
    {
      v7 = 1 << v8;
      v10 = ((1 << v8) & validConnections) == 0 || v8 == 7;
      ++v8;
    }
    while (!v10);
    v5->validConnections = validConnections | v7;
    connections = v5->_connections;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](connections, "setObject:forKey:", v4, v12);

  }
  else
  {
    LOBYTE(v7) = 0;
  }
  objc_sync_exit(v5);

  return v7;
}

- (void)removeConnectionByID:(unsigned __int8)a3
{
  unsigned int v3;
  NSMutableDictionary *connections;
  void *v5;
  FSModuleVolume *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  obj->validConnections &= ~(_BYTE)v3;
  connections = obj->_connections;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](connections, "removeObjectForKey:", v5);

  --obj->connectionCount;
  objc_sync_exit(obj);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v14[5];
  char v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[FSModuleVolume listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_23B2A6000, v6, OS_LOG_TYPE_DEFAULT, "%s:start", buf, 0xCu);
  }

  v7 = -[FSModuleVolume newConnectionID:](self, "newConnectionID:", v5);
  if (v7)
  {
    +[FSKitConstants FSVolumeXPCProtocol](FSKitConstants, "FSVolumeXPCProtocol");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedInterface:", v8);

    +[FSVolumeConnector volumeConnectorModuleVolume:connection:](FSVolumeConnector, "volumeConnectorModuleVolume:connection:", self, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExportedObject:", v9);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __53__FSModuleVolume_listener_shouldAcceptNewConnection___block_invoke;
    v14[3] = &unk_250C32A68;
    v14[4] = self;
    v15 = v7;
    v10 = _Block_copy(v14);
    objc_msgSend(v5, "setInvalidationHandler:", v10);
    objc_msgSend(v5, "setInterruptionHandler:", v10);
    objc_msgSend(v5, "resume");
    fskit_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[FSModuleVolume listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_23B2A6000, v11, OS_LOG_TYPE_DEFAULT, "%s:accepted", buf, 0xCu);
    }

  }
  else
  {
    fskit_std_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[FSModuleVolume listener:shouldAcceptNewConnection:].cold.1(v12);

    objc_msgSend(v5, "invalidate");
  }

  return v7 != 0;
}

uint64_t __53__FSModuleVolume_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeConnectionByID:", *(unsigned __int8 *)(a1 + 40));
}

- (id)getItemForFH:(id)a3
{
  id v4;
  NSObject *fileHandleQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  fileHandleQueue = self->_fileHandleQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__FSModuleVolume_getItemForFH___block_invoke;
  block[3] = &unk_250C32A90;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(fileHandleQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __31__FSModuleVolume_getItemForFH___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)insertIntoFHCache:(id)a3
{
  id v4;
  NSObject *fileHandleQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  fileHandleQueue = self->_fileHandleQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__FSModuleVolume_insertIntoFHCache___block_invoke;
  block[3] = &unk_250C32AB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(fileHandleQueue, block);

}

void __36__FSModuleVolume_insertIntoFHCache___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v1, "fileHandle");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

- (void)removeFromFHCache:(id)a3
{
  id v4;
  NSObject *fileHandleQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  fileHandleQueue = self->_fileHandleQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__FSModuleVolume_removeFromFHCache___block_invoke;
  block[3] = &unk_250C32AB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(fileHandleQueue, block);

}

void __36__FSModuleVolume_removeFromFHCache___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "fileHandle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeObjectForKey:", v2);

}

- (id)getAndRemoveItemForFH:(id)a3
{
  id v4;
  NSObject *fileHandleQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  fileHandleQueue = self->_fileHandleQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__FSModuleVolume_getAndRemoveItemForFH___block_invoke;
  block[3] = &unk_250C32A90;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(fileHandleQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __40__FSModuleVolume_getAndRemoveItemForFH___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 56), "removeObjectForKey:", a1[5]);
}

- (FSModuleExtension)ourExtension
{
  return (FSModuleExtension *)objc_getProperty(self, a2, 32, 1);
}

- (void)setOurExtension:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (FSVolumeOperations)volume
{
  return (FSVolumeOperations *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVolume:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (FSItem)rootFSItem
{
  return (FSItem *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRootFSItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)fileHandleToItemTable
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFileHandleToItemTable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_queue)fileHandleQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void)setFileHandleQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 72, 1);
}

- (FSResource)resource
{
  return (FSResource *)objc_getProperty(self, a2, 80, 1);
}

- (void)setResource:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)connections
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)spotlightIsEnabled
{
  return self->_spotlightIsEnabled;
}

- (BOOL)supportsKOIOOps
{
  return self->_supportsKOIOOps;
}

- (BOOL)supportsAccessOps
{
  return self->_supportsAccessOps;
}

- (BOOL)supportsOpenCloseOps
{
  return self->_supportsOpenCloseOps;
}

- (BOOL)supportsReadWriteOps
{
  return self->_supportsReadWriteOps;
}

- (BOOL)supportsXattrOps
{
  return self->_supportsXattrOps;
}

- (BOOL)supportsLimitedXattrOps
{
  return self->_supportsLimitedXattrOps;
}

- (BOOL)supportsCloneOps
{
  return self->_supportsCloneOps;
}

- (BOOL)supportsPreallocateOps
{
  return self->_supportsPreallocateOps;
}

- (BOOL)supportsVolumeRenameOps
{
  return self->_supportsVolumeRenameOps;
}

- (BOOL)supportsOpenUnlink
{
  return self->_supportsOpenUnlink;
}

- (BOOL)reportAsLocal
{
  return self->_reportAsLocal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_resource, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_fileHandleQueue, 0);
  objc_storeStrong((id *)&self->_fileHandleToItemTable, 0);
  objc_storeStrong((id *)&self->_rootFSItem, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_ourExtension, 0);
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[FSModuleVolume listener:shouldAcceptNewConnection:]";
  _os_log_fault_impl(&dword_23B2A6000, log, OS_LOG_TYPE_FAULT, "%s: rejected, can't add new connection to volume (too many clients)", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
