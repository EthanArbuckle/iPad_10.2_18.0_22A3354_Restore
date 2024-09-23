@implementation FSTaskProgressConnector

- (FSTaskProgressConnector)initWithProgress:(id)a3 description:(id)a4
{
  id v7;
  id v8;
  FSTaskProgressConnector *v9;
  FSTaskProgressConnector *v10;
  uint64_t v11;
  NSMutableSet *pendingReplyBlocks;
  uint64_t v13;
  NSXPCListener *listener;
  NSObject *v15;
  NSXPCListener *v16;
  NSXPCListener *v17;
  uint64_t v18;
  NSXPCListenerEndpoint *endpoint;
  NSObject *v20;
  NSXPCListener *v21;
  void *v22;
  FSTaskProgressConnector *v23;
  objc_super v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  NSXPCListener *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)FSTaskProgressConnector;
  v9 = -[FSTaskProgressConnector init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_progress, a3);
    objc_storeStrong((id *)&v10->_taskDesc, a4);
    v11 = objc_opt_new();
    pendingReplyBlocks = v10->_pendingReplyBlocks;
    v10->_pendingReplyBlocks = (NSMutableSet *)v11;

    objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
    v13 = objc_claimAutoreleasedReturnValue();
    listener = v10->_listener;
    v10->_listener = (NSXPCListener *)v13;

    fskit_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v10->_listener;
      *(_DWORD *)buf = 136315394;
      v27 = "-[FSTaskProgressConnector initWithProgress:description:]";
      v28 = 2112;
      v29 = v16;
      _os_log_impl(&dword_23B2A6000, v15, OS_LOG_TYPE_DEFAULT, "%s got listener %@", buf, 0x16u);
    }

    v17 = v10->_listener;
    if (!v17)
    {
      v23 = 0;
      goto LABEL_10;
    }
    -[NSXPCListener setDelegate:](v17, "setDelegate:", v10);
    -[NSXPCListener endpoint](v10->_listener, "endpoint");
    v18 = objc_claimAutoreleasedReturnValue();
    endpoint = v10->_endpoint;
    v10->_endpoint = (NSXPCListenerEndpoint *)v18;

    -[NSXPCListener resume](v10->_listener, "resume");
    fskit_std_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = v10->_listener;
      -[NSXPCListener endpoint](v21, "endpoint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "-[FSTaskProgressConnector initWithProgress:description:]";
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v22;
      _os_log_impl(&dword_23B2A6000, v20, OS_LOG_TYPE_DEFAULT, "%s got listener %@ endpoint %@", buf, 0x20u);

    }
  }
  v23 = v10;
LABEL_10:

  return v23;
}

+ (id)newForProgress:(id)a3 description:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProgress:description:", v7, v6);

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FSTaskProgressConnector;
  -[FSTaskProgressConnector dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315650;
    v12 = "-[FSTaskProgressConnector listener:shouldAcceptNewConnection:]";
    v13 = 2112;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_23B2A6000, v8, OS_LOG_TYPE_DEFAULT, "%s given listener %@, connection %@", (uint8_t *)&v11, 0x20u);
  }

  +[FSKitConstants FSTaskProgressXPCProtocol](FSKitConstants, "FSTaskProgressXPCProtocol");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v9);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_msgSend(v7, "resume");

  return 1;
}

- (id)getProgress:(id)a3
{
  NSMutableSet *pendingReplyBlocks;
  void *v5;
  void *v6;
  NSObject *v7;
  int v8;
  int v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pendingReplyBlocks = self->_pendingReplyBlocks;
  v5 = (void *)objc_msgSend(a3, "copy");
  v6 = _Block_copy(v5);
  -[NSMutableSet addObject:](pendingReplyBlocks, "addObject:", v6);

  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = -[NSProgress completedUnitCount](self->_progress, "completedUnitCount");
    v9 = -[NSProgress totalUnitCount](self->_progress, "totalUnitCount");
    v11[0] = 67109376;
    v11[1] = v8;
    v12 = 1024;
    v13 = v9;
    _os_log_impl(&dword_23B2A6000, v7, OS_LOG_TYPE_DEFAULT, "getProgress returning progress with %u of %u units done", (uint8_t *)v11, 0xEu);
  }

  return self->_progress;
}

- (NSXPCListenerEndpoint)endpoint
{
  return (NSXPCListenerEndpoint *)objc_getProperty(self, a2, 8, 1);
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProgress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (FSTaskDescription)taskDesc
{
  return (FSTaskDescription *)objc_getProperty(self, a2, 32, 1);
}

- (void)setTaskDesc:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSMutableSet)pendingReplyBlocks
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPendingReplyBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingReplyBlocks, 0);
  objc_storeStrong((id *)&self->_taskDesc, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
}

@end
