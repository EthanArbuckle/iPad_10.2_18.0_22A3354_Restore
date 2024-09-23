@implementation FSBlockDeviceResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  int fileDescriptor;
  xpc_object_t v6;
  int v7;
  NSObject *v8;
  id v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FSBlockDeviceResource;
  -[FSResource encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be encoded by an NSXPCCoder."), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  fileDescriptor = self->_fileDescriptor;
  if ((fileDescriptor & 0x80000000) == 0)
  {
    v6 = xpc_fd_create(fileDescriptor);
    if (v6)
    {
      objc_msgSend(v4, "encodeXPCObject:forKey:", v6, CFSTR("FSResource.fd"));
    }
    else
    {
      v7 = *__error();
      fskit_std_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[FSBlockDeviceResource encodeWithCoder:].cold.1(&self->_fileDescriptor, v7, v8);

    }
  }
  objc_msgSend(v4, "encodeObject:forKey:", self->_BSDName, CFSTR("FSResource.bsdName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_devicePath, CFSTR("FSResource.path"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_writable, CFSTR("FSResource.writable"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsBarrier, CFSTR("FSResource.supportsBarrier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsPriority, CFSTR("FSResource.supportsPriority"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsUnmap, CFSTR("FSResource.supportsUnmap"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_blockSize, CFSTR("FSResource.blockSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_blockCount, CFSTR("FSResource.blockCount"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_physicalBlockSize, CFSTR("FSResource.physicalBlockSize"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_queueDepth, CFSTR("FSResource.queueDepth"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_partitionBase, CFSTR("FSResource.partitionBase"));

}

- (FSBlockDeviceResource)initWithCoder:(id)a3
{
  id v4;
  FSBlockDeviceResource *v5;
  uint64_t v6;
  NSString *BSDName;
  uint64_t v8;
  NSString *devicePath;
  void *v10;
  void *v11;
  int v12;
  FSWorkQueue *v13;
  void *v14;
  uint64_t v15;
  FSWorkQueue *fsExecQueue;
  id v18;
  objc_super v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], CFSTR("This object may only be decoded by an NSXPCCoder."), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  v19.receiver = self;
  v19.super_class = (Class)FSBlockDeviceResource;
  v5 = -[FSResource initWithCoder:](&v19, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSResource.bsdName"));
    v6 = objc_claimAutoreleasedReturnValue();
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("FSResource.path"));
    v8 = objc_claimAutoreleasedReturnValue();
    devicePath = v5->_devicePath;
    v5->_devicePath = (NSString *)v8;

    v5->_writable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FSResource.writable"));
    v5->_supportsBarrier = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FSResource.supportsBarrier"));
    v5->_supportsPriority = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FSResource.supportsPriority"));
    v5->_supportsUnmap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("FSResource.supportsUnmap"));
    v5->_blockSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSResource.blockSize"));
    v5->_blockCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSResource.blockCount"));
    v5->_physicalBlockSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSResource.physicalBlockSize"));
    v5->_queueDepth = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSResource.queueDepth"));
    v5->_partitionBase = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("FSResource.partitionBase"));
    objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFC0], CFSTR("FSResource.fd"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
      v12 = xpc_fd_dup(v10);
    else
      v12 = -1;
    v5->_fileDescriptor = v12;
    v5->_terminated = 0;
    v13 = [FSWorkQueue alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fsblockdevice.%@"), v5->_BSDName);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[FSWorkQueue initQueueWithDomain:concurrency:](v13, "initQueueWithDomain:concurrency:", v14, 16);
    fsExecQueue = v5->_fsExecQueue;
    v5->_fsExecQueue = (FSWorkQueue *)v15;

  }
  return v5;
}

- (int64_t)kind
{
  return 1;
}

- (id)makeProxy
{
  void *v3;
  id v4;

  -[FSBlockDeviceResource BSDName](self, "BSDName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[FSBlockDeviceResource newProxyForBSDName:isWritable:](FSBlockDeviceResource, "newProxyForBSDName:isWritable:", v3, -[FSBlockDeviceResource isWritable](self, "isWritable"));

  return v4;
}

+ (id)proxyResourceForBSDName:(id)a3
{
  return (id)objc_msgSend(a1, "proxyResourceForBSDName:isWritable:", a3, 0);
}

+ (id)proxyResourceForBSDName:(id)a3 isWritable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("/dev/")))
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("/dev/"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/dev/r%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resourceWithBSDName:devicePath:fileDescriptor:writable:", v7, v8, 0xFFFFFFFFLL, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)newProxyForBSDName:(id)a3 isWritable:(BOOL)a4
{
  objc_msgSend(a1, "proxyResourceForBSDName:isWritable:", a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)terminated
{
  FSBlockDeviceResource *v2;
  BOOL terminated;

  v2 = self;
  objc_sync_enter(v2);
  terminated = v2->_terminated;
  objc_sync_exit(v2);

  return terminated;
}

- (void)terminate
{
  FSBlockDeviceResource *v2;
  int fileDescriptor;
  IONotificationPort *notifyPort;
  FSBlockDeviceResource *obj;

  obj = self;
  objc_sync_enter(obj);
  -[FSBlockDeviceResource releaseNotification](obj, "releaseNotification");
  v2 = obj;
  if (!obj->_terminated)
  {
    fileDescriptor = obj->_fileDescriptor;
    if ((fileDescriptor & 0x80000000) == 0)
    {
      close(fileDescriptor);
      obj->_fileDescriptor = -1;
    }
    v2 = obj;
    obj->_terminated = 1;
  }
  notifyPort = v2->_notifyPort;
  if (notifyPort)
  {
    IONotificationPortDestroy(notifyPort);
    obj->_notifyPort = 0;
  }
  objc_sync_exit(obj);

}

- (void)dealloc
{
  objc_super v3;

  -[FSBlockDeviceResource terminate](self, "terminate");
  v3.receiver = self;
  v3.super_class = (Class)FSBlockDeviceResource;
  -[FSBlockDeviceResource dealloc](&v3, sel_dealloc);
}

- (void)revoke
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "getResourceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:start:(%@)", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

void __31__FSBlockDeviceResource_revoke__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  fskit_std_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __31__FSBlockDeviceResource_revoke__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __31__FSBlockDeviceResource_revoke__block_invoke_52(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __31__FSBlockDeviceResource_revoke__block_invoke_52_cold_1(v3, v4);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "code");
}

- (void)readInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  void (**v10)(id, _QWORD, void *);
  FSBlockDeviceResource *v11;
  void *v12;
  FSWorkQueue *fsExecQueue;
  _QWORD v14[4];
  void (**v15)(id, _QWORD, void *);
  id v16[4];
  id location;

  v10 = (void (**)(id, _QWORD, void *))a6;
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_terminated)
  {
    fs_errorForPOSIXError(5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);

    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    if (a3)
    {
      objc_initWeak(&location, v11);
      fsExecQueue = v11->_fsExecQueue;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __65__FSBlockDeviceResource_readInto_startingAt_length_replyHandler___block_invoke;
      v14[3] = &unk_250C32790;
      objc_copyWeak(v16, &location);
      v16[1] = a3;
      v16[2] = (id)a5;
      v16[3] = (id)a4;
      v15 = v10;
      -[FSWorkQueue enqueue:](fsExecQueue, "enqueue:", v14);

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    fs_errorForPOSIXError(14);
    v11 = (FSBlockDeviceResource *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);
  }

LABEL_6:
}

void __65__FSBlockDeviceResource_readInto_startingAt_length_replyHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v3 = pread(objc_msgSend(WeakRetained, "fileDescriptor"), *(void **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    if ((v3 & 0x8000000000000000) != 0)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = __error();
      fs_errorForPOSIXError(*v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v10);

    }
    else
    {
      v4 = v3;
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(_QWORD *)(a1 + 32);
      if (v3 >= v5)
      {
        (*(void (**)(uint64_t, unint64_t, _QWORD))(v6 + 16))(v6, v3, 0);
      }
      else
      {
        fs_errorForPOSIXError(5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, unint64_t, void *))(v6 + 16))(v6, v4, v7);

      }
    }
    WeakRetained = v11;
  }

}

- (void)synchronousReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  FSBlockDeviceResource *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int *v15;
  void (**v16)(id, _QWORD, void *);

  v16 = (void (**)(id, _QWORD, void *))a6;
  v10 = self;
  objc_sync_enter(v10);
  if (v10->_terminated)
  {
    fs_errorForPOSIXError(5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v11);

    objc_sync_exit(v10);
LABEL_3:

    goto LABEL_4;
  }
  objc_sync_exit(v10);

  v12 = pread(-[FSBlockDeviceResource fileDescriptor](v10, "fileDescriptor"), a3, a5, a4);
  if ((v12 & 0x8000000000000000) != 0)
  {
    v15 = __error();
    fs_errorForPOSIXError(*v15);
    v10 = (FSBlockDeviceResource *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v10);
    goto LABEL_3;
  }
  v13 = v12;
  if (v12 >= a5)
  {
    v16[2](v16, v12, 0);
  }
  else
  {
    fs_errorForPOSIXError(5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v13, v14);

  }
LABEL_4:

}

- (void)writeFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  void (**v10)(id, _QWORD, void *);
  FSBlockDeviceResource *v11;
  void *v12;
  FSWorkQueue *fsExecQueue;
  _QWORD v14[4];
  void (**v15)(id, _QWORD, void *);
  id v16[4];
  id location;

  v10 = (void (**)(id, _QWORD, void *))a6;
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_terminated)
  {
    fs_errorForPOSIXError(5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);

    objc_sync_exit(v11);
  }
  else
  {
    objc_sync_exit(v11);

    if (a3)
    {
      objc_initWeak(&location, v11);
      fsExecQueue = v11->_fsExecQueue;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __66__FSBlockDeviceResource_writeFrom_startingAt_length_replyHandler___block_invoke;
      v14[3] = &unk_250C32790;
      objc_copyWeak(v16, &location);
      v16[1] = a3;
      v16[2] = (id)a5;
      v16[3] = (id)a4;
      v15 = v10;
      -[FSWorkQueue enqueue:](fsExecQueue, "enqueue:", v14);

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
      goto LABEL_6;
    }
    fs_errorForPOSIXError(14);
    v11 = (FSBlockDeviceResource *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);
  }

LABEL_6:
}

void __66__FSBlockDeviceResource_writeFrom_startingAt_length_replyHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int *v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    v3 = pwrite(objc_msgSend(WeakRetained, "fileDescriptor"), *(const void **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    if ((v3 & 0x8000000000000000) != 0)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = __error();
      fs_errorForPOSIXError(*v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v8 + 16))(v8, 0, v10);

    }
    else
    {
      v4 = v3;
      v5 = *(_QWORD *)(a1 + 56);
      v6 = *(_QWORD *)(a1 + 32);
      if (v3 >= v5)
      {
        (*(void (**)(uint64_t, unint64_t, _QWORD))(v6 + 16))(v6, v3, 0);
      }
      else
      {
        fs_errorForPOSIXError(45);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, unint64_t, void *))(v6 + 16))(v6, v4, v7);

      }
    }
    WeakRetained = v11;
  }

}

- (void)synchronousWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  FSBlockDeviceResource *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  int *v15;
  void (**v16)(id, _QWORD, void *);

  v16 = (void (**)(id, _QWORD, void *))a6;
  v10 = self;
  objc_sync_enter(v10);
  if (v10->_terminated)
  {
    fs_errorForPOSIXError(5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v11);

    objc_sync_exit(v10);
LABEL_3:

    goto LABEL_4;
  }
  objc_sync_exit(v10);

  v12 = pwrite(-[FSBlockDeviceResource fileDescriptor](v10, "fileDescriptor"), a3, a5, a4);
  if ((v12 & 0x8000000000000000) != 0)
  {
    v15 = __error();
    fs_errorForPOSIXError(*v15);
    v10 = (FSBlockDeviceResource *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, 0, v10);
    goto LABEL_3;
  }
  v13 = v12;
  if (v12 >= a5)
  {
    v16[2](v16, v12, 0);
  }
  else
  {
    fs_errorForPOSIXError(45);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, v13, v14);

  }
LABEL_4:

}

- (void)synchronousMetadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "readMeta:buffer:offset:length:", self->_fileDescriptor, a3, a4, a5))
  {
    fs_errorForPOSIXError(5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);

  }
  else
  {
    v12[2](v12, 0);
  }

}

- (void)synchronousMetadataReadInto:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 readAheadExtents:(id *)a6 readAheadCount:(int64_t)a7 replyHandler:(id)a8
{
  void (**v14)(id, void *);
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v14 = (void (**)(id, void *))a8;
  if (a7)
  {
    objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "readMetaWithRA:buffer:offset:length:raList:raListCount:", self->_fileDescriptor, a3, a4, a5, a6, a7))
    {
      fs_errorForPOSIXError(5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14[2](v14, v16);

    }
    else
    {
      v14[2](v14, 0);
    }
  }
  else
  {
    fskit_std_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FSBlockDeviceResource synchronousMetadataReadInto:startingAt:length:readAheadExtents:readAheadCount:replyHandler:].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

    fs_errorForPOSIXError(22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v15);
  }

}

- (void)metadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "writeMetaAsync:buffer:offset:length:", self->_fileDescriptor, a3, a4, a5))
  {
    fs_errorForPOSIXError(5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);

  }
  else
  {
    v12[2](v12, 0);
  }

}

- (void)synchronousMetadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "writeMeta:buffer:offset:length:", self->_fileDescriptor, a3, a4, a5))
  {
    fs_errorForPOSIXError(5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);

  }
  else
  {
    v12[2](v12, 0);
  }

}

- (void)delayedMetadataWriteFrom:(void *)a3 startingAt:(int64_t)a4 length:(unint64_t)a5 replyHandler:(id)a6
{
  void *v10;
  void *v11;
  void (**v12)(id, void *);

  v12 = (void (**)(id, void *))a6;
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "writeMetaDelayed:buffer:offset:length:", self->_fileDescriptor, a3, a4, a5))
  {
    fs_errorForPOSIXError(5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v11);

  }
  else
  {
    v12[2](v12, 0);
  }

}

- (void)synchronousMetadataFlushWithReplyHandler:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = (void (**)(id, void *))a3;
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "flushMeta:wait:", self->_fileDescriptor, 1))
  {
    fskit_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FSBlockDeviceResource synchronousMetadataFlushWithReplyHandler:].cold.1();

    fs_errorForPOSIXError(5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

  }
  else
  {
    v4[2](v4, 0);
  }

}

- (void)synchronousMetadataClear:(id)a3 wait:(BOOL)a4 replyHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  _DWORD *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  FSBlockDeviceResource *v31;
  _BOOL4 v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _OWORD v39[8];
  uint64_t v40;

  v6 = a4;
  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 9)
  {
    v31 = self;
    v32 = v6;
    v33 = v10;
    memset(v39, 0, sizeof(v39));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v20 = v8;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v35;
      do
      {
        v25 = 0;
        v26 = v23;
        v27 = (_DWORD *)(((unint64_t)v39 | 0xC) + 16 * v23);
        do
        {
          if (*(_QWORD *)v35 != v24)
            objc_enumerationMutation(v20);
          v28 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v25);
          *(_QWORD *)(v27 - 3) = objc_msgSend(v28, "startBlockOffset");
          *(v27 - 1) = objc_msgSend(v28, "blockLength");
          *v27 = objc_msgSend(v28, "numberOfBlocks");
          v27 += 4;
          ++v25;
        }
        while (v22 != v25);
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v23 = v26 + v25;
      }
      while (v22);
    }

    v10 = v33;
    if (!objc_msgSend(v33, "clearMetaBlocks:ranges:rangesCount:wait:", v31->_fileDescriptor, v39, objc_msgSend(v20, "count"), v32))
    {
      v9[2](v9, 0);
      goto LABEL_17;
    }
    fskit_std_log();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[FSBlockDeviceResource synchronousMetadataClear:wait:replyHandler:].cold.2();

    v19 = 5;
  }
  else
  {
    fskit_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FSBlockDeviceResource synchronousMetadataClear:wait:replyHandler:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v19 = 22;
  }
  fs_errorForPOSIXError(v19);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v9)[2](v9, v30);

LABEL_17:
}

- (void)synchronousMetadataPurge:(id)a3 replyHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  _DWORD *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  FSBlockDeviceResource *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _OWORD v36[8];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v6, "count") < 9)
  {
    v29 = self;
    v30 = v8;
    memset(v36, 0, sizeof(v36));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = 0;
      v22 = *(_QWORD *)v32;
      do
      {
        v23 = 0;
        v24 = v21;
        v25 = (_DWORD *)(((unint64_t)v36 | 0xC) + 16 * v21);
        do
        {
          if (*(_QWORD *)v32 != v22)
            objc_enumerationMutation(v18);
          v26 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v23);
          *(_QWORD *)(v25 - 3) = objc_msgSend(v26, "startBlockOffset", v29);
          *(v25 - 1) = objc_msgSend(v26, "blockLength");
          *v25 = objc_msgSend(v26, "numberOfBlocks");
          v25 += 4;
          ++v23;
        }
        while (v20 != v23);
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        v21 = v24 + v23;
      }
      while (v20);
    }

    v8 = v30;
    if (!objc_msgSend(v30, "purgeMetaBlocks:ranges:rangesCount:", v29->_fileDescriptor, v36, objc_msgSend(v18, "count")))
    {
      v7[2](v7, 0);
      goto LABEL_17;
    }
    fskit_std_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[FSBlockDeviceResource synchronousMetadataPurge:replyHandler:].cold.2();

    v17 = 5;
  }
  else
  {
    fskit_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FSBlockDeviceResource synchronousMetadataPurge:replyHandler:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

    v17 = 22;
  }
  fs_errorForPOSIXError(v17);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *))v7)[2](v7, v28);

LABEL_17:
}

- (void)releaseNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s:release:error:%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (BOOL)isEqual:(id)a3
{
  void *v4;
  void *v5;
  NSString *BSDName;
  void *v7;
  char v8;

  +[FSResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    BSDName = self->_BSDName;
    objc_msgSend(v4, "BSDName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NSString isEqual:](BSDName, "isEqual:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)getResourceID
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("FSBlockDeviceResource:%@"), self->_BSDName);
}

- (NSString)BSDName
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)isWritable
{
  return self->_writable;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (unint64_t)blockCount
{
  return self->_blockCount;
}

- (unint64_t)physicalBlockSize
{
  return self->_physicalBlockSize;
}

- (BOOL)isTerminated
{
  return self->_terminated;
}

- (FSWorkQueue)fsExecQueue
{
  return (FSWorkQueue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFsExecQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)devicePath
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (int)fileDescriptor
{
  return self->_fileDescriptor;
}

- (unint64_t)partitionBase
{
  return self->_partitionBase;
}

- (unsigned)notification
{
  return self->_notification;
}

- (void)setNotification:(unsigned int)a3
{
  self->_notification = a3;
}

- (IONotificationPort)notifyPort
{
  return self->_notifyPort;
}

- (void)setNotifyPort:(IONotificationPort *)a3
{
  self->_notifyPort = a3;
}

- (OS_dispatch_queue)ioKitQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (void)setIoKitQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSString)usingResourcePurpose
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUsingResourcePurpose:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usingResourcePurpose, 0);
  objc_storeStrong((id *)&self->_ioKitQueue, 0);
  objc_storeStrong((id *)&self->_devicePath, 0);
  objc_storeStrong((id *)&self->_fsExecQueue, 0);
  objc_storeStrong((id *)&self->_BSDName, 0);
}

- (id)initProxyForBSDName:(id)a3
{
  return -[FSBlockDeviceResource initProxyForBSDName:isWritable:](self, "initProxyForBSDName:isWritable:", a3, 0);
}

- (id)initProxyForBSDName:(id)a3 isWritable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  FSBlockDeviceResource *v9;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (objc_msgSend(v6, "hasPrefix:", CFSTR("/dev/")))
  {
    objc_msgSend(v6, "substringFromIndex:", objc_msgSend(CFSTR("/dev/"), "length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/dev/r%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[FSBlockDeviceResource initWithBSDName:devicePath:fileDescriptor:writable:](self, "initWithBSDName:devicePath:fileDescriptor:writable:", v7, v8, 0xFFFFFFFFLL, v4);

  return v9;
}

- (FSBlockDeviceResource)initWithBSDName:(id)a3 devicePath:(id)a4 fileDescriptor:(int)a5 writable:(BOOL)a6
{
  id v11;
  id v12;
  FSBlockDeviceResource *v13;
  FSBlockDeviceResource *v14;
  NSString **p_BSDName;
  uint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t blockSize;
  unint64_t v20;
  char v21;
  int v22;
  unint64_t v23;
  FSWorkQueue *v24;
  void *v25;
  uint64_t v26;
  FSWorkQueue *fsExecQueue;
  unint64_t v29;
  unsigned int v30;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v31.receiver = self;
  v31.super_class = (Class)FSBlockDeviceResource;
  v13 = -[FSBlockDeviceResource init](&v31, sel_init);
  v14 = v13;
  if (v13)
  {
    p_BSDName = &v13->_BSDName;
    objc_storeStrong((id *)&v13->_BSDName, a3);
    objc_storeStrong((id *)&v14->_devicePath, a4);
    v14->_fileDescriptor = a5;
    v14->_writable = a6;
    v30 = 0;
    v29 = 0;
    if (ioctl(a5, 0x40046418uLL, &v30))
      v16 = 512;
    else
      v16 = v30;
    v14->_blockSize = v16;
    v17 = ioctl(v14->_fileDescriptor, 0x40086419uLL, &v29);
    v18 = v29;
    if (v17)
      v18 = 0;
    v14->_blockCount = v18;
    if (ioctl(v14->_fileDescriptor, 0x4004644DuLL, &v30))
      blockSize = v14->_blockSize;
    else
      blockSize = v30;
    v14->_physicalBlockSize = blockSize;
    if (ioctl(v14->_fileDescriptor, 0x4004644EuLL, &v30))
      v20 = 0;
    else
      v20 = v30;
    v14->_queueDepth = v20;
    if (ioctl(v14->_fileDescriptor, 0x4004644CuLL, &v30))
    {
      v14->_supportsUnmap = 0;
      v14->_supportsPriority = 0;
      v14->_supportsBarrier = 0;
    }
    else
    {
      v21 = v30;
      v14->_supportsBarrier = (v30 & 2) != 0;
      v14->_supportsPriority = (v21 & 4) != 0;
      v14->_supportsUnmap = (v21 & 0x10) != 0;
    }
    v22 = ioctl(v14->_fileDescriptor, 0x40086449uLL, &v29);
    v23 = v29;
    if (v22)
      v23 = 0;
    v14->_partitionBase = v23;
    v14->_notification = 0;
    v14->_terminated = 0;
    v24 = [FSWorkQueue alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fsblockdevice.%@"), *p_BSDName);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[FSWorkQueue initQueueWithDomain:concurrency:](v24, "initQueueWithDomain:concurrency:", v25, 16);
    fsExecQueue = v14->_fsExecQueue;
    v14->_fsExecQueue = (FSWorkQueue *)v26;

  }
  return v14;
}

- (FSBlockDeviceResource)initWithResource:(id)a3
{
  id v4;
  FSBlockDeviceResource *v5;
  uint64_t v6;
  NSString *BSDName;
  uint64_t v8;
  NSString *devicePath;
  FSWorkQueue *v10;
  void *v11;
  uint64_t v12;
  FSWorkQueue *fsExecQueue;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSBlockDeviceResource;
  v5 = -[FSBlockDeviceResource init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "BSDName");
    v6 = objc_claimAutoreleasedReturnValue();
    BSDName = v5->_BSDName;
    v5->_BSDName = (NSString *)v6;

    objc_msgSend(v4, "devicePath");
    v8 = objc_claimAutoreleasedReturnValue();
    devicePath = v5->_devicePath;
    v5->_devicePath = (NSString *)v8;

    v5->_fileDescriptor = objc_msgSend(v4, "fileDescriptor");
    v5->_writable = objc_msgSend(v4, "isWritable");
    v5->_blockSize = objc_msgSend(v4, "blockSize");
    v5->_blockCount = objc_msgSend(v4, "blockCount");
    v5->_physicalBlockSize = objc_msgSend(v4, "physicalBlockSize");
    v5->_queueDepth = *((_QWORD *)v4 + 3);
    v5->_supportsBarrier = *((_BYTE *)v4 + 17);
    v5->_supportsUnmap = *((_BYTE *)v4 + 19);
    v5->_supportsPriority = *((_BYTE *)v4 + 18);
    v5->_partitionBase = objc_msgSend(v4, "partitionBase");
    v5->_notification = 0;
    v5->_terminated = objc_msgSend(v4, "isTerminated");
    v10 = [FSWorkQueue alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("fsblockdevice.%@"), v5->_BSDName);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[FSWorkQueue initQueueWithDomain:concurrency:](v10, "initQueueWithDomain:concurrency:", v11, 16);
    fsExecQueue = v5->_fsExecQueue;
    v5->_fsExecQueue = (FSWorkQueue *)v12;

  }
  return v5;
}

+ (id)resourceWithBSDName:(id)a3 devicePath:(id)a4 fileDescriptor:(int)a5 writable:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBSDName:devicePath:fileDescriptor:writable:", v11, v10, v7, v6);

  return v12;
}

+ (void)openWithBSDName:(id)a3 writable:(BOOL)a4 auditToken:(id)a5 replyHandler:(id)a6
{
  _BOOL4 v8;
  id v9;
  void (**v10)(id, uint64_t, uint64_t);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  void *v25;
  IONotificationPort *v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  const __CFDictionary *v30;
  io_service_t MatchingService;
  void *v32;
  IONotificationPort *v33;
  id v34;
  kern_return_t v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  id v70;
  _QWORD v71[6];
  _QWORD v72[5];
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  void (*v77)(uint64_t);
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  io_object_t notification;
  const char *v86;
  __int16 v87;
  id v88;
  __int16 v89;
  uint64_t v90;
  uint64_t v91;

  v8 = a4;
  v91 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v70 = a5;
  v10 = (void (**)(id, uint64_t, uint64_t))a6;
  fskit_std_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.7();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/dev/r%@"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.fskit.fskit_helper"), 4096);
  +[FSKitConstants FSKitHelperProtocol](FSKitConstants, "FSKitHelperProtocol");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRemoteObjectInterface:", v14);

  objc_msgSend(v13, "resume");
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__1;
  v83 = __Block_byref_object_dispose__1;
  v84 = 0;
  v73 = 0;
  v74 = &v73;
  v75 = 0x3032000000;
  v76 = __Block_byref_object_copy__1;
  v77 = __Block_byref_object_dispose__1;
  v15 = MEMORY[0x24BDAC760];
  v78 = 0;
  v72[0] = MEMORY[0x24BDAC760];
  v72[1] = 3221225472;
  v72[2] = __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke;
  v72[3] = &unk_250C32768;
  v72[4] = &v79;
  objc_msgSend(v13, "synchronousRemoteObjectProxyWithErrorHandler:", v72);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v8)
    v18 = 2;
  else
    v18 = 0;
  v71[0] = v15;
  v71[1] = 3221225472;
  v71[2] = __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke_178;
  v71[3] = &unk_250C327B8;
  v71[4] = &v73;
  v71[5] = &v79;
  objc_msgSend(v16, "openDevice:devicePath:flags:auditToken:replyHandler:", v9, v12, v18, v70, v71);
  v19 = (void *)v74[5];
  if (!v19 || (objc_msgSend(v19, "fileDescriptor") & 0x80000000) != 0)
  {
    fskit_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v40 = v80[5];
      notification = 136315650;
      v86 = "+[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:]";
      v87 = 2112;
      v88 = v9;
      v89 = 2112;
      v90 = v40;
      _os_log_impl(&dword_23B2A6000, v23, OS_LOG_TYPE_INFO, "%s: failed to open device %@, %@", (uint8_t *)&notification, 0x20u);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend((id)v74[5], "BSDName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", CFSTR("com.apple.fskit.iokit.queue.%@.%d"), v21, objc_msgSend((id)v74[5], "fileDescriptor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_retainAutorelease(v22);
    v24 = dispatch_queue_create((const char *)-[NSObject UTF8String](v23, "UTF8String"), 0);
    objc_msgSend((id)v74[5], "setIoKitQueue:", v24);

    objc_msgSend((id)v74[5], "ioKitQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      v26 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
      fskit_std_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.6();

      objc_msgSend((id)v74[5], "ioKitQueue");
      v28 = objc_claimAutoreleasedReturnValue();
      IONotificationPortSetDispatchQueue(v26, v28);

      objc_msgSend((id)v74[5], "setNotifyPort:", v26);
      v29 = (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      LODWORD(v28) = *MEMORY[0x24BDD8B20];
      v30 = IOBSDNameMatching(*MEMORY[0x24BDD8B20], 0, v29);
      MatchingService = IOServiceGetMatchingService((mach_port_t)v28, v30);
      notification = 0;
      if (MatchingService)
      {
        v32 = (void *)objc_opt_new();
        objc_msgSend(v32, "setResource:", v74[5]);
        v33 = (IONotificationPort *)objc_msgSend((id)v74[5], "notifyPort");
        v34 = v32;
        v35 = IOServiceAddInterestNotification(v33, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)deviceNotificationCallback, v34, &notification);
        IOObjectRelease(MatchingService);
        if (v35)
        {
          fskit_std_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.5();

          objc_msgSend(v34, "setResource:", 0);
          objc_msgSend((id)v74[5], "terminate");
          v37 = (void *)v74[5];
          v74[5] = 0;

          fs_errorForMachError(v35);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v80[5];
          v80[5] = v38;
        }
        else
        {
          objc_msgSend((id)v74[5], "setNotification:", notification);
          fskit_std_log();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.4(v39, v55, v56, v57, v58, v59, v60, v61);
        }

      }
      else
      {
        fskit_std_log();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.3();

        objc_msgSend((id)v74[5], "terminate");
        v53 = (void *)v74[5];
        v74[5] = 0;

        fs_errorForPOSIXError(2);
        v54 = objc_claimAutoreleasedReturnValue();
        v34 = (id)v80[5];
        v80[5] = v54;
      }

    }
    else
    {
      fskit_std_log();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.2(v41, v42, v43, v44, v45, v46, v47, v48);

      objc_msgSend((id)v74[5], "terminate");
      v49 = (void *)v74[5];
      v74[5] = 0;

      fs_errorForPOSIXError(12);
      v50 = objc_claimAutoreleasedReturnValue();
      v51 = (void *)v80[5];
      v80[5] = v50;

    }
  }

  fskit_std_log();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
    +[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:].cold.1(v62, v63, v64, v65, v66, v67, v68, v69);

  v10[2](v10, v74[5], v80[5]);
  _Block_object_dispose(&v73, 8);

  _Block_object_dispose(&v79, 8);
}

void __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __31__FSBlockDeviceResource_revoke__block_invoke_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v3;

}

void __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    fskit_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke_178_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    fskit_std_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 136315394;
      v20 = "+[FSBlockDeviceResource(Project) openWithBSDName:writable:auditToken:replyHandler:]_block_invoke";
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_23B2A6000, v16, OS_LOG_TYPE_DEFAULT, "%s: Open device returned error %@", (uint8_t *)&v19, 0x16u);
    }

    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = v7;
    v8 = *(NSObject **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v18;
  }

}

- (id)startUsingResource:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  int v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v24;

  v5 = a3;
  if (self->_usingResourcePurpose)
  {
    fskit_std_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FSBlockDeviceResource(Project) startUsingResource:].cold.4();

    v7 = 16;
LABEL_13:
    fs_errorForPOSIXError(v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    fskit_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FSBlockDeviceResource(Project) startUsingResource:].cold.3(v15, v16, v17, v18, v19, v20, v21, v22);

    v7 = 22;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "openFileDescriptorForKernel:flags:", self->_fileDescriptor, 2 * self->_writable);
  if (v11)
  {
    v12 = v11;
    fskit_std_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FSBlockDeviceResource(Project) startUsingResource:].cold.2();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v12, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_storeStrong((id *)&self->_usingResourcePurpose, a3);
    fskit_std_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[FSBlockDeviceResource(Project) startUsingResource:].cold.1(self, (uint64_t *)&self->_usingResourcePurpose, v24);

    v14 = 0;
  }

LABEL_14:
  return v14;
}

- (id)stopUsingResource:(id)a3
{
  id v4;
  NSString *usingResourcePurpose;
  void *v6;
  char isKindOfClass;
  void *v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = a3;
  usingResourcePurpose = self->_usingResourcePurpose;
  if (usingResourcePurpose && -[NSString length](usingResourcePurpose, "length"))
  {
    if (-[NSString isEqualToString:](self->_usingResourcePurpose, "isEqualToString:", v4)
      || (objc_msgSend(v4, "isEqualToString:", CFSTR("serviceTerminated")) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(MEMORY[0x24BE60460], "defaultClient");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "closeFileDescriptorForKernel:", self->_fileDescriptor);
        fskit_std_log();
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[FSBlockDeviceResource(Project) stopUsingResource:].cold.3();

          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v9, 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            -[FSBlockDeviceResource(Project) stopUsingResource:].cold.2(self, v11);

          v12 = 0;
        }

        goto LABEL_22;
      }
      fskit_std_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[FSBlockDeviceResource(Project) stopUsingResource:].cold.4(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      fskit_std_log();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[FSBlockDeviceResource(Project) stopUsingResource:].cold.5();
    }

    fs_errorForPOSIXError(22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  fskit_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[FSBlockDeviceResource(Project) stopUsingResource:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  v12 = 0;
LABEL_22:

  return v12;
}

- (void)readFirstSectorAndLog
{
  void *v3;
  unint64_t blockSize;
  _QWORD v5[6];

  v3 = malloc_type_malloc(self->_blockSize, 0xF9E1E642uLL);
  blockSize = self->_blockSize;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__FSBlockDeviceResource_Private__readFirstSectorAndLog__block_invoke;
  v5[3] = &unk_250C327E0;
  v5[4] = self;
  v5[5] = v3;
  -[FSBlockDeviceResource synchronousReadInto:startingAt:length:replyHandler:](self, "synchronousReadInto:startingAt:length:replyHandler:", v3, 0, blockSize, v5);
  if (v3)
    free(v3);
}

void __55__FSBlockDeviceResource_Private__readFirstSectorAndLog__block_invoke(uint64_t a1, unint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  __int16 v15;
  _BYTE v16[10];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
    v13 = 67109634;
    v14 = v7;
    v15 = 2048;
    *(_QWORD *)v16 = a2;
    *(_WORD *)&v16[8] = 2112;
    v17 = v5;
    _os_log_impl(&dword_23B2A6000, v6, OS_LOG_TYPE_DEFAULT, "readFirstSectorAndLog reading from %d got rv %zu error %@", (uint8_t *)&v13, 0x1Cu);
  }

  if (a2 >= 5)
  {
    fskit_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(unsigned __int8 **)(a1 + 40);
      v10 = *v9;
      v11 = v9[1];
      v12 = v9[2];
      LODWORD(v9) = v9[3];
      v13 = 67109888;
      v14 = v10;
      v15 = 1024;
      *(_DWORD *)v16 = v11;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = v12;
      LOWORD(v17) = 1024;
      *(_DWORD *)((char *)&v17 + 2) = (_DWORD)v9;
      _os_log_impl(&dword_23B2A6000, v8, OS_LOG_TYPE_DEFAULT, "Successful read, first characters %02x%02x:%02x%02x", (uint8_t *)&v13, 0x1Au);
    }

  }
}

- (NSString)bsdName
{
  return (NSString *)(id)-[NSString copy](self->_BSDName, "copy");
}

- (void)encodeWithCoder:(os_log_t)log .cold.1(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_fault_impl(&dword_23B2A6000, log, OS_LOG_TYPE_FAULT, "error creating fdWrapper for fd %d, maybe error: %d", (uint8_t *)v4, 0xEu);
  OUTLINED_FUNCTION_1();
}

void __31__FSBlockDeviceResource_revoke__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __31__FSBlockDeviceResource_revoke__block_invoke_52_cold_1(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 136315394;
  v5 = "-[FSBlockDeviceResource revoke]_block_invoke";
  v6 = 2048;
  v7 = objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v3, "%s:replyHandler:block:error:%lu", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7();
}

- (void)synchronousMetadataReadInto:(uint64_t)a3 startingAt:(uint64_t)a4 length:(uint64_t)a5 readAheadExtents:(uint64_t)a6 readAheadCount:(uint64_t)a7 replyHandler:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s:reply:EINVAL: readAheadExtentsCount is 0, returning EINVAL", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)synchronousMetadataFlushWithReplyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s: flushMeta failed, status: %d, returning EIO", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)synchronousMetadataClear:(uint64_t)a3 wait:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: rangesToClear array cannot hold more than FSKIT_META_MAX_BLOCK_RANGES ranges.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)synchronousMetadataClear:wait:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s: clearMetaBlocks failed, status: %d, returning EIO", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)synchronousMetadataPurge:(uint64_t)a3 replyHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: rangesToPurge array cannot hold more than FSKIT_META_MAX_BLOCK_RANGES ranges.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)synchronousMetadataPurge:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_1(&dword_23B2A6000, v0, v1, "%s: purgeMetaBlocks failed, status: %d, returning EIO", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void __83__FSBlockDeviceResource_Project__openWithBSDName_writable_auditToken_replyHandler___block_invoke_178_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s: created a block device resource sucessfully", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
