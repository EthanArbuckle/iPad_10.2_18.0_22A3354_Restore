@implementation DTInstrumentServer

+ (BOOL)isAppleInternal
{
  return objc_msgSend(MEMORY[0x24BDD1760], "isAppleInternal");
}

- (DTInstrumentServer)initWithTransport:(id)a3
{
  id v4;
  DTInstrumentServer *v5;
  DTInstrumentServer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  DTXConnection *connection;
  id v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  objc_super v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)DTInstrumentServer;
  v5 = -[DTInstrumentServer init](&v33, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2A948]), "initWithTransport:", v4);
      objc_msgSend(v7, "setMaximumEnqueueSize:", 0x800000);
      objc_msgSend(v7, "setDispatchTarget:", v6);
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x3032000000;
      v31[3] = sub_222B5D354;
      v31[4] = sub_222B5D364;
      v32 = (id)os_transaction_create();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = sub_222B5D36C;
      v30[3] = &unk_24EB28BF8;
      v30[4] = v31;
      objc_msgSend(v7, "registerDisconnectHandler:", v30);
      objc_msgSend(v7, "setChannelHandler:", &unk_24EB27810);
      v8 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9
        && (objc_msgSend(v9, "executablePath"), v11 = (void *)objc_claimAutoreleasedReturnValue(), (v27 = v11) != 0))
      {
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v8, "addObject:", v27);
      }
      else
      {
        v27 = 0;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "executablePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 && objc_msgSend(v13, "length"))
        objc_msgSend(v8, "addObject:", v13);
      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundlePath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundlePath");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqualToString:", v16);

        if (v17)
        {
          objc_msgSend(v10, "bundleURL");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "URLByDeletingPathExtension");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastPathComponent");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (v20)
          {
            objc_msgSend(v10, "bundlePath");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "stringByAppendingPathComponent:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (v22 && objc_msgSend(v22, "length"))
              objc_msgSend(v8, "addObject:", v22);

          }
          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v10;
            _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "failed to construct base name for DTInstrumentServer bundle '%@'", buf, 0xCu);
          }

        }
      }
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = sub_222B5D3E4;
      v28[3] = &unk_24EB29C20;
      v23 = v7;
      v29 = v23;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v28);
      if (!objc_msgSend(v8, "count") && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "no services to publish - this DTXConnection is likely to be useless", buf, 2u);
      }
      objc_msgSend(v23, "publishCapability:withVersion:forClass:", CFSTR("com.apple.dt.Instruments.inlineCapabilities"), 1, 0);
      connection = v6->_connection;
      v6->_connection = (DTXConnection *)v23;
      v25 = v23;

      _Block_object_dispose(v31, 8);
    }
    else
    {

      v6 = 0;
    }
  }

  return v6;
}

- (void)resume
{
  -[DTXConnection resume](self->_connection, "resume");
}

- (void)cancel
{
  -[DTXConnection cancel](self->_connection, "cancel");
}

- (void)setMaxConnectionEnqueue:(unint64_t)a3
{
  -[DTXConnection setMaximumEnqueueSize:](self->_connection, "setMaximumEnqueueSize:", a3);
}

- (void)loadServicesAtPath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  DTXConnection *connection;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  DVTIUCurrentDylibRootPath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", v3);
  v5 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v34 = 0;
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v5;
  objc_msgSend(v25, "contentsOfDirectoryAtPath:error:", v5, &v34);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v34;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v12, "pathExtension", v24);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("bundle"));

        if (v14)
        {
          objc_msgSend(v28, "stringByAppendingPathComponent:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "isLoaded") & 1) != 0)
          {
            v17 = 0;
          }
          else
          {
            v29 = 0;
            v18 = objc_msgSend(v16, "loadAndReturnError:", &v29);
            v17 = v29;
            if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v16, "bundlePath");
              v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v21 = objc_msgSend(v26, "UTF8String");
              objc_msgSend(v17, "localizedDescription");
              v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v23 = objc_msgSend(v22, "UTF8String");
              *(_DWORD *)buf = 136446466;
              v36 = v21;
              v37 = 2082;
              v38 = v23;
              _os_log_error_impl(&dword_222B17000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Unable to register services in bundle \"%{public}s\" - bundle could not be loaded: %{public}s", buf, 0x16u);

            }
          }
          connection = self->_connection;
          objc_msgSend(v16, "executablePath");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[DTXConnection publishServicesInImagePath:](connection, "publishServicesInImagePath:", v20);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v9);
  }

}

+ (void)takeOwnershipOfSharedAuthorization:(void *)a3
{
  id obj;

  if (a3)
  {
    obj = a1;
    objc_sync_enter(obj);
    qword_25576FAE0 = (uint64_t)a3;
    objc_sync_exit(obj);

  }
}

+ (unsigned)taskForPid:(int)a3
{
  uint64_t v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uintptr_t v12;
  NSObject *v13;
  dispatch_source_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  mach_port_name_t v21;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  void *v26;
  NSObject *v27;
  uint64_t *v28;
  id v29;
  int v30;
  mach_port_name_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v3 = *(_QWORD *)&a3;
  if (qword_25576FAE8 != -1)
    dispatch_once(&qword_25576FAE8, &unk_24EB29C40);
  v5 = a1;
  objc_sync_enter(v5);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = sub_222B5D354;
  v36 = sub_222B5D364;
  v6 = (void *)qword_25576FAF0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (void *)v33[5];
  if (!v8)
  {
    v31 = 0;
    if (task_for_pid(*MEMORY[0x24BDAEC58], v3, &v31))
      v9 = 0;
    else
      v9 = v31;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v33[5];
    v33[5] = v10;

    v12 = (int)objc_msgSend((id)v33[5], "intValue");
    dispatch_get_global_queue(0, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_source_create(MEMORY[0x24BDAC9E8], v12, 0, v13);

    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = sub_222B5DAF4;
    v26 = &unk_24EB29C68;
    v28 = &v32;
    v29 = v5;
    v30 = v3;
    v15 = v14;
    v27 = v15;
    dispatch_source_set_event_handler(v15, &v23);
    dispatch_resume(v15);
    v16 = v33[5];
    v17 = (void *)qword_25576FAF0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3, v23, v24, v25, v26);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v18);

    v19 = (void *)qword_25576FAF8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v15, v20);

    v8 = (void *)v33[5];
  }
  v21 = objc_msgSend(v8, "unsignedIntValue");
  if (v21 - 1 > 0xFFFFFFFD || mach_port_mod_refs(*MEMORY[0x24BDAEC58], v21, 0, 1))
    v21 = 0;
  _Block_object_dispose(&v32, 8);

  objc_sync_exit(v5);
  return v21;
}

+ (void)_taskInvalid:(unsigned int)a3 forPid:(int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;

  v4 = *(_QWORD *)&a4;
  obj = a1;
  objc_sync_enter(obj);
  v6 = (void *)qword_25576FAF0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "intValue");

  if (v9 == a3)
  {
    v10 = (void *)qword_25576FAF0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v11);

    v12 = (void *)qword_25576FAF8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);

  }
  if (a3 - 1 <= 0xFFFFFFFD)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], a3);
  objc_sync_exit(obj);

}

+ (void)_tfpPortReceived:(unsigned int)a3
{
  id obj;

  obj = a1;
  objc_sync_enter(obj);
  if ((dword_25576FB00 - 1) <= 0xFFFFFFFD)
    mach_port_deallocate(*MEMORY[0x24BDAEC58], dword_25576FB00);
  dword_25576FB00 = a3;
  objc_sync_exit(obj);

}

- (void)_notifyOfTFPCommunicationsPort:(unsigned int)a3
{
  MEMORY[0x24BEDD108](DTInstrumentServer, sel__tfpPortReceived_);
}

- (id)_blessSimulatorHub:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x24BDD1540];
  v8 = *MEMORY[0x24BDD0FC8];
  v9[0] = CFSTR("Simulated hub authorization not available on this platform");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DTInstrumentServer"), -11, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invokeCompletionWithReturnValue:error:", 0, v6);

  return v3;
}

- (DTXConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
