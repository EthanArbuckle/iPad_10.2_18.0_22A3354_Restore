@implementation DTLeaksService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.remoteleaks"), 9, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.remoteleaks.immediate"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.remoteleaks.deferred"), 1, a1);

}

- (DTLeaksService)initWithChannel:(id)a3
{
  DTLeaksService *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *coordinationQueue;
  dispatch_queue_t v6;
  OS_dispatch_queue *preservationQueue;
  uint64_t v8;
  NSMutableDictionary *helperConnectionByTargetPid;
  uint64_t v10;
  NSMutableDictionary *helperPidByTargetPid;
  uint64_t v12;
  NSMutableDictionary *fileByPid;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DTLeaksService;
  v3 = -[DTXService initWithChannel:](&v15, sel_initWithChannel_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("Leaks service helper queue", 0);
    coordinationQueue = v3->_coordinationQueue;
    v3->_coordinationQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_create("Leaks service file preservation queue", 0);
    preservationQueue = v3->_preservationQueue;
    v3->_preservationQueue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new();
    helperConnectionByTargetPid = v3->_helperConnectionByTargetPid;
    v3->_helperConnectionByTargetPid = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    helperPidByTargetPid = v3->_helperPidByTargetPid;
    v3->_helperPidByTargetPid = (NSMutableDictionary *)v10;

    v12 = objc_opt_new();
    fileByPid = v3->_fileByPid;
    v3->_fileByPid = (NSMutableDictionary *)v12;

  }
  return v3;
}

- (void)messageReceived:(id)a3
{
  if (objc_msgSend(a3, "errorStatus") == 2)
    MEMORY[0x24BEDD108](self, sel_cancelAllRequests);
}

- (void)_internalRequestForPid:(int)a3 message:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *coordinationQueue;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  int v16;

  v8 = a4;
  v9 = a5;
  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTLeaksServiceNoPidException"), CFSTR("No pid was provided to DTLeaksService for leaks analysis"));
  coordinationQueue = self->_coordinationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B6C460;
  block[3] = &unk_24EB2A178;
  v16 = a3;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(coordinationQueue, block);

}

- (id)_preserveDict:(id)a3 forPid:(int)a4
{
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  NSObject *preservationQueue;
  _QWORD block[4];
  id v17;
  id v18;
  DTLeaksService *v19;
  unint64_t v20;
  int v21;

  v6 = DTLeaksServiceSerializedGraphKey;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v9, "removeObjectForKey:", DTLeaksServiceSerializedGraphKey);
  if (objc_msgSend(v8, "length"))
  {
    do
    {
      v10 = __ldxr(&dword_25576FB28);
      v11 = v10 + 1;
    }
    while (__stxr(v11, &dword_25576FB28));
    v12 = a4 | (unint64_t)(v11 << 32);
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, DTLeaksServiceGraphLookupTokenKey);

  if (v12)
  {
    preservationQueue = self->_preservationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B6CAE0;
    block[3] = &unk_24EB2A1A0;
    v21 = a4;
    v20 = v12;
    v17 = v8;
    v18 = v9;
    v19 = self;
    dispatch_async(preservationQueue, block);

  }
  return v9;
}

- (void)_lookupGraphByToken:(unint64_t)a3 response:(id)a4
{
  id v6;
  NSObject *preservationQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  preservationQueue = self->_preservationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B6CD70;
  block[3] = &unk_24EB29990;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(preservationQueue, block);

}

- (id)requestGraph:(unint64_t)a3 options:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  DTLeaksService *v17;
  id v18;
  int v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (a3)
  {
    if (HIDWORD(a3))
    {
      -[DTLeaksService _lookupGraphByToken:response:](self, "_lookupGraphByToken:response:", a3, v7);
    }
    else
    {
      if (v6)
        v12 = v6;
      else
        v12 = (id)MEMORY[0x24BDBD1B8];
      objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_serializedGraphWithOptions_, v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = sub_222B6D258;
      v15[3] = &unk_24EB2A1C8;
      v16 = v6;
      v17 = self;
      v19 = a3;
      v18 = v7;
      -[DTLeaksService _internalRequestForPid:message:completion:](self, "_internalRequestForPid:message:completion:", a3, v13, v15);

    }
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("invalid target specified (%llx)"), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("DTLeaksService"), -1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invokeCompletionWithReturnValue:error:", 0, v11);

  }
  return v7;
}

- (id)requestMallocStackLog:(int)a3 forAddress:(unint64_t *)a4 size:(unint64_t)a5 isLiteZone:(unsigned int)a6
{
  uint64_t v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v9 = *(_QWORD *)&a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a6 != 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_mallocStackLogForAddress_size_isLiteZone_, v12, v13, v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = sub_222B6D454;
  v18[3] = &unk_24EB2A1F0;
  v16 = v11;
  v19 = v16;
  -[DTLeaksService _internalRequestForPid:message:completion:](self, "_internalRequestForPid:message:completion:", v9, v15, v18);

  return v16;
}

- (id)requestVMregionStackLog:(int)a3 forAddress:(unint64_t *)a4 size:(unint64_t)a5
{
  uint64_t v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;

  v7 = *(_QWORD *)&a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithSelector:objectArguments:", sel_vmRegionStackLogForAddress_size_, v10, v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = sub_222B6D5E4;
  v15[3] = &unk_24EB2A1F0;
  v13 = v9;
  v16 = v13;
  -[DTLeaksService _internalRequestForPid:message:completion:](self, "_internalRequestForPid:message:completion:", v7, v12, v15);

  return v13;
}

- (int)setMallocStackLoggingMode:(int)a3 forPid:(int)a4
{
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a4;
    _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Received request to disable MSL for pid [%d]", (uint8_t *)v6, 8u);
  }
  return msl_set_mode_for_pid();
}

- (void)cancelAllRequests
{
  NSObject *coordinationQueue;
  _QWORD block[5];

  coordinationQueue = self->_coordinationQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B6D77C;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  dispatch_async(coordinationQueue, block);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileByPid, 0);
  objc_storeStrong((id *)&self->_helperPidByTargetPid, 0);
  objc_storeStrong((id *)&self->_helperConnectionByTargetPid, 0);
  objc_storeStrong((id *)&self->_preservationQueue, 0);
  objc_storeStrong((id *)&self->_coordinationQueue, 0);
}

@end
