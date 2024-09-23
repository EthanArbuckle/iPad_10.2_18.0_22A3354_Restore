@implementation GTFileWriterService

- (GTFileWriterService)initWithConnectionProvider:(id)a3 deviceUDID:(id)a4 urlAccessProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  GTFileWriterService *v12;
  void *v13;
  void *v14;
  os_log_t v15;
  OS_os_log *log;
  NSMutableDictionary *v17;
  NSMutableDictionary *sessions;
  dispatch_queue_t v19;
  OS_dispatch_queue *fileTransferQueue;
  dispatch_semaphore_t v21;
  OS_dispatch_semaphore *writeSem;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v24.receiver = self;
  v24.super_class = (Class)GTFileWriterService;
  v12 = -[GTFileWriterService init](&v24, sel_init);
  if (v12)
  {
    NSTemporaryDirectory();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    DeleteAllArchives(v13);

    GTTransportArchiveDirectory();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    DeleteAllArchives(v14);

    v15 = os_log_create("com.apple.gputools.transport", "FileWriterService");
    log = v12->_log;
    v12->_log = (OS_os_log *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    sessions = v12->_sessions;
    v12->_sessions = v17;

    objc_storeStrong((id *)&v12->_connectionProvider, a3);
    objc_storeStrong((id *)&v12->_deviceUDID, a4);
    objc_storeStrong((id *)&v12->_urlAccessProvider, a5);
    v19 = dispatch_queue_create("com.apple.gputools.filetransfer", 0);
    fileTransferQueue = v12->_fileTransferQueue;
    v12->_fileTransferQueue = (OS_dispatch_queue *)v19;

    v21 = dispatch_semaphore_create(1);
    writeSem = v12->_writeSem;
    v12->_writeSem = (OS_dispatch_semaphore *)v21;

  }
  return v12;
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  v12 = (void *)MEMORY[0x24BDBCF48];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  GTTransportArchiveDirectory();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringByAppendingPathComponent:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fileURLWithPath:isDirectory:", v19, 1);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  -[GTFileWriterService initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:](self, "initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:", v17, v16, v15, v20, v14, v13);
}

- (void)startTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  id v30;

  v11 = a4;
  v12 = a7;
  v26 = (void *)MEMORY[0x24BDBCF48];
  ++LocalArchivePath_downloadNumber;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v11, "lastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByDeletingPathExtension");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pathExtension");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("-%04u"), LocalArchivePath_downloadNumber);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingPathExtension:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  NSTemporaryDirectory();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingPathComponent:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "fileURLWithPath:isDirectory:", v22, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __83__GTFileWriterService_startTransfer_basePath_fromDevice_options_completionHandler___block_invoke;
  v28[3] = &unk_24F827C40;
  v29 = v23;
  v30 = v12;
  v28[4] = self;
  v24 = v23;
  v25 = v12;
  -[GTFileWriterService initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:](self, "initiateTransfer:basePath:fromDevice:toURL:options:completionHandler:", v15, v11, v14, v24, v13, v28);

}

void __83__GTFileWriterService_startTransfer_basePath_fromDevice_options_completionHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  id v3;

  if (a2)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1[4] + 56), "makeURL:", a1[5]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

  }
}

- (void)initiateTransfer:(id)a3 basePath:(id)a4 fromDevice:(id)a5 toURL:(id)a6 options:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *log;
  void *v20;
  id v21;
  unint64_t v22;
  NSMutableDictionary *sessions;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  GTFileWriterServiceXPCProxy *v28;
  void *v29;
  GTFileWriterServiceXPCProxy *v30;
  NSString *deviceUDID;
  void *v32;
  NSString *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  unint64_t v45;
  const char *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  _QWORD v52[5];
  id v53;
  unint64_t v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  const char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v51 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    v43 = log;
    v44 = objc_msgSend(v17, "chunkSize");
    v45 = objc_msgSend(v17, "compressionAlgorithm");
    if (v45 > 5)
      v46 = "<UNKNOWN>";
    else
      v46 = off_24F827D68[v45];
    *(_DWORD *)buf = 138413314;
    v63 = v51;
    v64 = 2112;
    v65 = v15;
    v66 = 2112;
    v67 = v16;
    v68 = 2048;
    v69 = v44;
    v70 = 2080;
    v71 = v46;
    _os_log_debug_impl(&dword_22D095000, v43, OS_LOG_TYPE_DEBUG, "Initiate transfer basePath:%@ device:%@ toURL:%@ chunkSize:%lu compression:%s", buf, 0x34u);

  }
  if (GTFileTransferOptionsValidate(v17))
  {
    v55 = 0;
    +[GTFileWriterSession sessionWithFileEntries:relativeToURL:options:error:](GTFileWriterSession, "sessionWithFileEntries:relativeToURL:options:error:", v14, v16, v17, &v55);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v55;
    if (v20)
    {
      v49 = v16;
      v50 = v14;
      v22 = self->_sessionCounts + 1;
      self->_sessionCounts = v22;
      sessions = self->_sessions;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v20, v24);

      -[GTConnectionProvider connectionForDeviceUDID:](self->_connectionProvider, "connectionForDeviceUDID:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        FindRemoteGTFileWriterService(v25, v15, self->_connectionProvider);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          v28 = [GTFileWriterServiceXPCProxy alloc];
          objc_msgSend(v27, "serviceProperties");
          v47 = v15;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:](v28, "initWithConnection:remoteProperties:", v26, v29);

          deviceUDID = self->_deviceUDID;
          v52[0] = MEMORY[0x24BDAC760];
          v52[1] = 3221225472;
          v52[2] = __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke;
          v52[3] = &unk_24F827C68;
          v52[4] = self;
          v54 = v22;
          v53 = v18;
          v32 = v51;
          v33 = deviceUDID;
          v15 = v47;
          -[GTFileWriterServiceXPCProxy beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:](v30, "beginTransferSessionWithFileEntries:basePath:toDevice:options:sessionID:completionHandler:", v50, v51, v33, v17, v22, v52);

        }
        else
        {
          v48 = (void *)MEMORY[0x24BDD1540];
          v56 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Service is unavailable: \"%@\"), CFSTR("GTFileWriterService"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v41;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 1, v42);
          v30 = (GTFileWriterServiceXPCProxy *)objc_claimAutoreleasedReturnValue();

          (*((void (**)(id, GTFileWriterServiceXPCProxy *))v18 + 2))(v18, v30);
          v32 = v51;
        }

      }
      else
      {
        v38 = (void *)MEMORY[0x24BDD1540];
        v58 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to find remote connection"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v39;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 5, v40);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void *))v18 + 2))(v18, v27);
        v32 = v51;
      }

      v16 = v49;
      v14 = v50;
    }
    else
    {
      (*((void (**)(id, id))v18 + 2))(v18, v21);
      v32 = v51;
    }

  }
  else
  {
    v34 = (void *)MEMORY[0x24BDD1540];
    v60 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterService"), CFSTR("options sent to initiateTransfer are invalid."));
    v35 = v16;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = v36;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v37);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v35;
    (*((void (**)(id, id))v18 + 2))(v18, v21);
    v32 = v51;
  }

}

void __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(void);
  id v17;

  v3 = a2;
  v4 = a1[6];
  v5 = (void *)a1[4];
  v17 = 0;
  v6 = objc_msgSend(v5, "_finishSession:error:", v4, &v17);
  v7 = v17;
  v8 = *(NSObject **)(a1[4] + 8);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v9)
      __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_2((uint64_t)(a1 + 6), v8, v3);
    v16 = *(void (**)(void))(a1[5] + 16);
  }
  else if ((v6 & 1) != 0)
  {
    if (v9)
      __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_1((uint64_t)(a1 + 6), v8, v10, v11, v12, v13, v14, v15);
    v16 = *(void (**)(void))(a1[5] + 16);
  }
  else
  {
    if (v9)
      __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_2((uint64_t)(a1 + 6), v8, v7);
    v16 = *(void (**)(void))(a1[5] + 16);
  }
  v16();

}

- (void)beginTransferSessionWithFileEntries:(id)a3 basePath:(id)a4 toDevice:(id)a5 options:(id)a6 sessionID:(unint64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  GTFileWriterServiceXPCProxy *v24;
  void *v25;
  GTFileWriterServiceXPCProxy *v26;
  void *v27;
  NSObject *fileTransferQueue;
  GTFileWriterServiceXPCProxy *v29;
  id v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD block[4];
  id v49;
  id v50;
  id v51;
  GTFileWriterService *v52;
  GTFileWriterServiceXPCProxy *v53;
  id v54;
  id v55;
  unint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  _QWORD v64[3];

  v64[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  -[GTURLAccessProvider urlForPath:](self->_urlAccessProvider, "urlForPath:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    if (GTFileTransferOptionsValidate(v17))
    {
      -[GTConnectionProvider connectionForDeviceUDID:](self->_connectionProvider, "connectionForDeviceUDID:", v16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v44 = v16;
        FindRemoteGTFileWriterService(v20, v16, self->_connectionProvider);
        v22 = objc_claimAutoreleasedReturnValue();
        v45 = (void *)v22;
        if (v22)
        {
          v23 = (void *)v22;
          v24 = [GTFileWriterServiceXPCProxy alloc];
          objc_msgSend(v23, "serviceProperties");
          v46 = v19;
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[GTFileWriterServiceXPCProxy initWithConnection:remoteProperties:](v24, "initWithConnection:remoteProperties:", v21, v25);

          objc_msgSend(v46, "startAccessingSecurityScopedResource");
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v15, 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          fileTransferQueue = self->_fileTransferQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke;
          block[3] = &unk_24F827CE0;
          v49 = v14;
          v50 = v27;
          v51 = v17;
          v52 = self;
          v53 = v26;
          v56 = a7;
          v54 = v46;
          v55 = v18;
          v29 = v26;
          v30 = v27;
          v19 = v46;
          v31 = v30;
          dispatch_async(fileTransferQueue, block);

        }
        else
        {
          v41 = (void *)MEMORY[0x24BDD1540];
          v57 = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Service is unavailable: \"%@\"), CFSTR("GTFileWriterService"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v42;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 1, v43);
          v31 = (id)objc_claimAutoreleasedReturnValue();

          (*((void (**)(id, id))v18 + 2))(v18, v31);
        }

        v16 = v44;
        v40 = v45;
      }
      else
      {
        v47 = (void *)MEMORY[0x24BDD1540];
        v59 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to find remote connection"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = v38;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 5, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        (*((void (**)(id, void *))v18 + 2))(v18, v40);
      }

    }
    else
    {
      v35 = (void *)MEMORY[0x24BDD1540];
      v61 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid argument sent to service \"%@\": %@"), CFSTR("GTFileWriterService"), CFSTR("options sent to beginTransferSessionWithFileEntries is invalid"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v36;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 4, v37);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, void *))v18 + 2))(v18, v21);
    }
  }
  else
  {
    v32 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD1128];
    v63 = *MEMORY[0x24BDD0FC8];
    v64[0] = CFSTR("No files specified");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v64, &v63, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "errorWithDomain:code:userInfo:", v33, 2, v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v18 + 2))(v18, v34);

  }
}

void __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (*v13)(void);
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(_QWORD *, uint64_t, uint64_t, _QWORD *);
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v22 = 0;
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke_293;
  v17 = &unk_24F827CB8;
  v4 = *(void **)(a1 + 48);
  v18 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 64);
  v6 = *(_QWORD *)(a1 + 88);
  v20 = &v23;
  v21 = v6;
  v19 = v5;
  LOBYTE(v3) = GTFileWriterTransferFileEntries(v2, v3, v4, &v22, &v14);
  v7 = v22;
  if ((v3 & 1) == 0)
    goto LABEL_4;
  v8 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  if (!dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 56) + 64), v8))
  {
    if (!v24[5])
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 56) + 64));
      objc_msgSend(*(id *)(a1 + 72), "stopAccessingSecurityScopedResource");
      v13 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
      goto LABEL_5;
    }
LABEL_4:
    objc_msgSend(*(id *)(a1 + 72), "stopAccessingSecurityScopedResource");
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_5:
    v13();
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x24BDD1540];
  v29 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ hit a timeout: %@"), CFSTR("GTFileWriterService"), CFSTR("beginTransferSessionWithFileEntires timed out waiting for final write to complete"), v14, v15, v16, v17, v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "stopAccessingSecurityScopedResource");
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

LABEL_6:
  _Block_object_dispose(&v23, 8);

}

BOOL __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke_293(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  void *v6;
  dispatch_time_t v7;
  intptr_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[6];
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", a2, a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = dispatch_time(0xFFFFFFFFFFFFFFFELL, 2000000000);
  v8 = dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1[4] + 64), v7);
  if (v8)
  {
    if (a4)
    {
      v9 = (void *)MEMORY[0x24BDD1540];
      v18 = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ hit a timeout: %@"), CFSTR("GTFileWriterService"), CFSTR("beginTransferSessionWithFileEntires timed out waiting for transfer to complete"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.transport"), 6, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x22E30C9D4]();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke_2;
    v17[3] = &unk_24F827C90;
    v14 = a1[6];
    v13 = a1[7];
    v15 = (void *)a1[5];
    v17[4] = a1[4];
    v17[5] = v14;
    objc_msgSend(v15, "writeFileData:sessionID:completionHandler:", v6, v13, v17);
    objc_autoreleasePoolPop(v12);
  }

  return v8 == 0;
}

void __113__GTFileWriterService_beginTransferSessionWithFileEntries_basePath_toDevice_options_sessionID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4;
  id *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(_QWORD *)(v4 + 40);
  v5 = (id *)(v4 + 40);
  if (!v6)
    objc_storeStrong(v5, a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 64));

}

- (void)writeFileData:(id)a3 sessionID:(unint64_t)a4 completionHandler:(id)a5
{
  NSMutableDictionary *sessions;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  sessions = self->_sessions;
  v8 = (void *)MEMORY[0x24BDD16E0];
  v9 = a5;
  v10 = a3;
  objc_msgSend(v8, "numberWithUnsignedLongLong:", a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "writeFileData:completionHandler:", v10, v9);

}

- (BOOL)_finishSession:(unint64_t)a3 error:(id *)a4
{
  NSMutableDictionary *sessions;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;

  sessions = self->_sessions;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](sessions, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self->_sessions;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v11);

  LOBYTE(a4) = objc_msgSend(v9, "finish:", a4);
  return (char)a4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeSem, 0);
  objc_storeStrong((id *)&self->_urlAccessProvider, 0);
  objc_storeStrong((id *)&self->_fileTransferQueue, 0);
  objc_storeStrong((id *)&self->_deviceUDID, 0);
  objc_storeStrong((id *)&self->_connectionProvider, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22D095000, a2, a3, "Transfer session %llu completed successfully", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __92__GTFileWriterService_initiateTransfer_basePath_fromDevice_toURL_options_completionHandler___block_invoke_cold_2(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];

  v4 = OUTLINED_FUNCTION_9(a1, a2);
  objc_msgSend(a3, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5(&dword_22D095000, v4, v6, "Transfer session %llu failed with error \"%@\", v7);

  OUTLINED_FUNCTION_6();
}

@end
