@implementation DTFileTransferService

+ (void)registerCapabilities:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.filetransfer"), 1, a1);
  objc_msgSend(v4, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.filetransfer.debuginbox"), 1, a1);

}

- (DTFileTransferService)initWithChannel:(id)a3
{
  DTFileTransferService *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *coordinationQueue;
  uint64_t v6;
  NSMutableArray *activeFileTransfers;
  void *v8;
  _QWORD v10[4];
  DTFileTransferService *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)DTFileTransferService;
  v3 = -[DTXService initWithChannel:](&v12, sel_initWithChannel_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("File transfer service coordination queue", 0);
    coordinationQueue = v3->_coordinationQueue;
    v3->_coordinationQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    activeFileTransfers = v3->_activeFileTransfers;
    v3->_activeFileTransfers = (NSMutableArray *)v6;

    -[DTXService channel](v3, "channel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_222B81350;
    v10[3] = &unk_24EB27E30;
    v11 = v3;
    objc_msgSend(v8, "registerDisconnectHandler:", v10);

  }
  return v3;
}

- (id)transferFile:(id)a3 toDebugInboxOfApplicationWithBundleIdentifier:(id)a4 destinationFilename:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *coordinationQueue;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  if (v9 && (v12 = objc_msgSend(v9, "length"), v10) && v8 && v12 && objc_msgSend(v10, "length"))
  {
    v27 = 0;
    -[DTFileTransferService _beginTransferOfFileNamed:outError:](self, "_beginTransferOfFileNamed:outError:", v10, &v27);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v27;
    if (v13)
    {
      objc_msgSend(v13, "writeHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "writeData:", v8);

      objc_msgSend(v13, "closeFileTransfer");
      coordinationQueue = self->_coordinationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_222B81A84;
      block[3] = &unk_24EB29968;
      block[4] = self;
      v24 = v13;
      v17 = v11;
      v25 = v17;
      v26 = v9;
      dispatch_async(coordinationQueue, block);
      v18 = v17;

    }
    else
    {
      objc_msgSend(v11, "invokeCompletionWithReturnValue:error:", v14, v14);
      v22 = v11;
    }

  }
  else
  {
    sub_222B81694(1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invokeCompletionWithReturnValue:error:", 0, v19);
    v20 = v11;

  }
  return v11;
}

- (id)openFileInDocumentDebugInbox:(id)a3 forApplicationWithBundleIdentifier:(id)a4 withAnnotation:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  int v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[4];
  id v45;
  stat v46;
  id v47;
  _QWORD v48[3];
  _QWORD v49[6];

  v49[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  if (v7 && (v11 = objc_msgSend(v7, "length"), v8) && v11 && objc_msgSend(v8, "length"))
  {
    if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Playgrounds")) & 1) != 0)
    {
      v47 = 0;
      objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v8, 1, &v47);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v47;
      if (!v12)
      {
        objc_msgSend(v10, "invokeCompletionWithReturnValue:error:", v13, v13);
        v27 = v10;
LABEL_26:

        goto LABEL_14;
      }
      sub_222B81F50(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = sub_222B81FA0(v14);
      objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("Debug"), 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = sub_222B81FA0(v16);
      if (!v16 || !v15 || !v17)
      {
        sub_222B81694(5);
        v28 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "invokeCompletionWithReturnValue:error:", v28, v28);
        v29 = v10;
        v13 = (id)v28;
LABEL_25:

        goto LABEL_26;
      }
      sub_222B82018(v7);
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "URLByAppendingPathComponent:isDirectory:", v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      memset(&v46, 0, sizeof(v46));
      objc_msgSend(v19, "path");
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if (lstat((const char *)objc_msgSend(v20, "fileSystemRepresentation"), &v46))
      {

      }
      else
      {
        v30 = v46.st_mode & 0xF000;

        if (v30 == 0x4000 || v30 == 0x8000)
        {
          v43 = v18;
          if (v9)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v9);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v31 = (void *)objc_opt_new();
          }
          v32 = MEMORY[0x24BDBD1C8];
          v33 = v31;
          v42 = v31;
          objc_msgSend(v31, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("DTFileTransferServiceOriginatedKey"));
          v34 = *MEMORY[0x24BE382F8];
          v48[0] = *MEMORY[0x24BE38310];
          v48[1] = v34;
          v49[0] = v32;
          v49[1] = v19;
          v48[2] = *MEMORY[0x24BE382E8];
          v49[2] = v33;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 3);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE38490], "serviceWithDefaultShellEndpoint");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleIdentifier");
          v40 = v19;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BE38478], "optionsWithDictionary:", v41);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = sub_222B82098;
          v44[3] = &unk_24EB2A7E0;
          v38 = v10;
          v45 = v38;
          objc_msgSend(v35, "openApplication:withOptions:completion:", v36, v37, v44);

          v19 = v40;
          v39 = v38;

          v18 = v43;
          goto LABEL_24;
        }
      }
      sub_222B81694(7);
      v21 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "invokeCompletionWithReturnValue:error:", v21, v21);
      v22 = v10;
      v13 = (id)v21;
LABEL_24:

      v7 = (id)v18;
      goto LABEL_25;
    }
    objc_msgSend(v10, "invokeCompletionWithReturnValue:error:", 0, 0);
    v26 = v10;
  }
  else
  {
    sub_222B81694(1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invokeCompletionWithReturnValue:error:", v23, v23);
    v24 = v10;

  }
LABEL_14:

  return v10;
}

- (id)transferData:(id)a3 intoAppContainerForBundleIdentifier:(id)a4 filename:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  NSObject *coordinationQueue;
  id v28;
  id v29;
  NSObject *v30;
  id v31;
  id v33;
  _QWORD block[5];
  id v35;
  id v36;
  id v37;
  _BYTE *v38;
  id v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_opt_new();
  sub_222B824A0();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = v8;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    *(_WORD *)&buf[22] = 2080;
    v41 = (uint64_t (*)(uint64_t, uint64_t))objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _os_log_impl(&dword_222B17000, v12, OS_LOG_TYPE_INFO, "transferData:%p intoAppContainerForBundleIdentifier:%s withFileName: %s", buf, 0x20u);
  }

  if (!v9)
    goto LABEL_16;
  v13 = objc_msgSend(v9, "length");
  if (!v10 || !v8 || !v13 || !objc_msgSend(v10, "length"))
    goto LABEL_16;
  if (objc_msgSend(v10, "rangeOfString:", CFSTR("/")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    sub_222B824A0();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      sub_222BC7194(v10);

LABEL_16:
    sub_222B81694(1);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invokeCompletionWithReturnValue:error:", 0, v19);
    v31 = v11;
    goto LABEL_17;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "UUIDString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@-%@"), v16, v10);
  v17 = objc_claimAutoreleasedReturnValue();

  v39 = 0;
  -[DTFileTransferService _beginTransferOfFileNamed:outError:](self, "_beginTransferOfFileNamed:outError:", v17, &v39);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v39;
  if (v18)
  {
    objc_msgSend(v18, "writeHandle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "writeData:", v8);

    objc_msgSend(v18, "closeFileTransfer");
    sub_222B824A0();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v18, "destinationDirectoryURLToRemoveOnDealloc");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "absoluteString");
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = objc_msgSend(v23, "UTF8String");
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v24;
      _os_log_impl(&dword_222B17000, v21, OS_LOG_TYPE_INFO, "File transfer successfully staged. %s", buf, 0xCu);

    }
    objc_msgSend(v18, "destinationURL");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "path");
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    sub_222B824E0((const char *)objc_msgSend(v26, "fileSystemRepresentation"));

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v41 = sub_222B82520;
    v42 = sub_222B82530;
    v43 = 0;
    coordinationQueue = self->_coordinationQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_222B82538;
    block[3] = &unk_24EB2A808;
    v38 = buf;
    block[4] = self;
    v35 = v18;
    v36 = v9;
    v28 = v11;
    v37 = v28;
    dispatch_sync(coordinationQueue, block);
    v29 = v28;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(v11, "invokeCompletionWithReturnValue:error:", 0, v19);
    v33 = v11;
  }

  v10 = (id)v17;
LABEL_17:

  return v11;
}

- (BOOL)_fileTransfer:(id)a3 isValidForApplication:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (void *)MEMORY[0x24BDC1570];
  objc_msgSend(a3, "destinationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentProxyForURL:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("DTFileTransferServiceNoDefaultApplicationException"), CFSTR("Unable to resolve default application for file in DTFileTransferService"));
  objc_msgSend(v8, "availableClaimBindingsReturningError:", 0);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "bundleRecord", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqual:", v5);

        if ((v14 & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_13;
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_13:

  return v10;
}

- (id)_beginTransferOfFileNamed:(id)a3 outError:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  id v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  stat v24;

  v5 = (void *)MEMORY[0x24BDD1580];
  v6 = a3;
  objc_msgSend(v5, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/tmp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  sub_222B82AA4(v10, (uint64_t)CFSTR("DTFileTransferService"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  sub_222B82AA4(v11, (uint64_t)v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v12;
  sub_222B82018(v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "URLByAppendingPathComponent:isDirectory:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "path", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = lstat((const char *)objc_msgSend(v16, "fileSystemRepresentation"), &v24);

  if (v17)
    v18 = v15;
  else
    v18 = 0;

  if (v13
    && v18
    && (objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, 0) & 1) != 0
    && (objc_msgSend(v18, "path"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v20 = objc_msgSend(v7, "createFileAtPath:contents:attributes:", v19, 0, 0),
        v19,
        (v20 & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingToURL:error:", v18, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = (void *)objc_opt_new();
      objc_msgSend(v22, "setDestinationURL:", v18);
      objc_msgSend(v22, "setDestinationDirectoryURLToRemoveOnDealloc:", v13);
      objc_msgSend(v22, "setWriteHandle:", v21);
    }
    else if (a4)
    {
      sub_222B81694(2);
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

  }
  else if (a4)
  {
    sub_222B81694(2);
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)_moveFileTransfer:(id)a3 toDebugInboxOfApplicationWithBundleIdentifier:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v24;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.Playgrounds")) & 1) != 0)
  {
    v24 = 0;
    objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v9, 1, &v24);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v24;
    v12 = v11;
    if (v10)
    {
      if (-[DTFileTransferService _fileTransfer:isValidForApplication:](self, "_fileTransfer:isValidForApplication:", v8, v10))
      {
        sub_222B81F50(v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = v13;
          if (!sub_222B82DD0(v13, 1))
          {
            if (a5)
            {
              sub_222B81694(6);
              v20 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v20 = 0;
            }
            v15 = v14;
            goto LABEL_33;
          }
          objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", CFSTR("Debug"), 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (sub_222B82DD0(v15, 1))
          {
            objc_msgSend(v8, "destinationURL");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "lastPathComponent");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v17, 0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            sub_222B82E84(v8, v18, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v20 = v18;
            }
            else if (a5)
            {
              sub_222B81694(6);
              v20 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v20 = 0;
            }

            goto LABEL_33;
          }
          if (a5)
          {
            sub_222B81694(6);
            v22 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_24;
          }
        }
        else
        {
          if (a5)
          {
            sub_222B81694(6);
            v22 = (id)objc_claimAutoreleasedReturnValue();
            v15 = 0;
LABEL_24:
            v20 = 0;
            *a5 = v22;
LABEL_33:

            goto LABEL_34;
          }
          v15 = 0;
        }
        v20 = 0;
        goto LABEL_33;
      }
      if (a5)
      {
        sub_222B81694(5);
        v21 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
    else if (a5)
    {
      v21 = objc_retainAutorelease(v11);
LABEL_16:
      v20 = 0;
      *a5 = v21;
LABEL_34:

      goto LABEL_35;
    }
    v20 = 0;
    goto LABEL_34;
  }
  if (a5)
  {
    sub_222B81694(5);
    v20 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = 0;
  }
LABEL_35:

  return v20;
}

- (id)_moveFileTransfer:(id)a3 inDataContainerOfApplicationBundleIdentifier:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v50;
  id v51;
  uint8_t buf[4];
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v51 = 0;
  objc_msgSend(MEMORY[0x24BDC1540], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v8, 1, &v51);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v51;
  v11 = v10;
  if (v9)
  {
    v12 = v10;
  }
  else
  {
    v50 = v10;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1528]), "initWithBundleIdentifier:error:", v8, &v50);
    v12 = v50;

    if (!v9)
    {
      sub_222B824A0();
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        sub_222BC7280(v8);

      if (a5)
      {
        v32 = objc_retainAutorelease(v12);
        v12 = v32;
        v9 = 0;
        goto LABEL_27;
      }
      v9 = 0;
LABEL_34:
      v23 = 0;
      goto LABEL_35;
    }
  }
  objc_msgSend(v9, "dataContainerURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  sub_222B824A0();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_222BC72EC(v8);

    if (a5)
    {
      sub_222B81694(6);
      v32 = (id)objc_claimAutoreleasedReturnValue();
LABEL_27:
      v23 = 0;
LABEL_30:
      v31 = 0;
      *a5 = v32;
      goto LABEL_42;
    }
    goto LABEL_34;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v13, "path");
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = objc_msgSend(v16, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v53 = v17;
    _os_log_impl(&dword_222B17000, v15, OS_LOG_TYPE_INFO, "Checking for container at: %s", buf, 0xCu);

  }
  v18 = sub_222B82DD0(v13, 0);
  sub_222B824A0();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "path");
      v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v22 = objc_msgSend(v21, "UTF8String");
      *(_DWORD *)buf = 136315138;
      v53 = v22;
      _os_log_impl(&dword_222B17000, v20, OS_LOG_TYPE_INFO, "Data container exists at: %s", buf, 0xCu);

    }
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("/tmp"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (sub_222B82DD0(v23, 0))
    {
      sub_222B824A0();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v23, "path");
        v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v26 = objc_msgSend(v25, "UTF8String");
        *(_DWORD *)buf = 136315138;
        v53 = v26;
        _os_log_impl(&dword_222B17000, v24, OS_LOG_TYPE_INFO, "Temp directory exists: %s", buf, 0xCu);

      }
      objc_msgSend(v7, "destinationURL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "URLByAppendingPathComponent:isDirectory:", v28, 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      sub_222B82E84(v7, v29, 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v31 = v29;
      }
      else
      {
        sub_222B824A0();
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          sub_222BC7358(v41, v42, v43, v44, v45, v46, v47, v48);

        if (a5)
        {
          sub_222B81694(6);
          v31 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v31 = 0;
        }
      }

      goto LABEL_42;
    }
    if (a5)
    {
      sub_222B81694(6);
      v32 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
LABEL_35:
    v31 = 0;
    goto LABEL_42;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_222BC738C(v20, v33, v34, v35, v36, v37, v38, v39);

  if (a5)
  {
    sub_222B81694(6);
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }
  v23 = v13;
LABEL_42:

  return v31;
}

- (BOOL)_unarchivePackageIfNecessary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t i;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  id v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "destinationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "pathExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("zip"));

  if (!v8)
  {
    LOBYTE(v21) = 1;
    goto LABEL_28;
  }
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {

    goto LABEL_10;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, "length");

  if (!v12)
  {
LABEL_10:
    LOBYTE(v21) = 0;
    goto LABEL_28;
  }
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "destinationDirectoryURLToRemoveOnDealloc");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v14, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v18 = objc_msgSend(v17, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 1, 0, &v49);
  v19 = v49;
  v20 = v19;
  LOBYTE(v21) = 0;
  if (v18 && !v19)
  {
    v22 = (void *)MEMORY[0x24BE2A9C0];
    objc_msgSend(v3, "destinationURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v24 = (id)objc_msgSend(v22, "flatUnarchiveFileAtURL:toURL:error:", v23, v16, &v48);
    v25 = v48;

    if (v25)
    {
      v20 = 0;
      LOBYTE(v21) = 0;
    }
    else
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "pathExtension");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      objc_msgSend(v17, "subpathsOfDirectoryAtPath:error:", v27, &v47);
      v28 = (id)objc_claimAutoreleasedReturnValue();
      v20 = v47;

      LOBYTE(v21) = 0;
      if (v28 && !v20)
      {
        objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("NOT (SELF beginswith[c] '__MACOSX' OR SELF contains '/.' OR SELF beginswith '.')"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "filteredArrayUsingPredicate:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v28 = v30;
        v21 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        if (v21)
        {
          v40 = v14;
          v41 = v16;
          v39 = v17;
          v31 = *(_QWORD *)v44;
          while (2)
          {
            v32 = v28;
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v44 != v31)
                objc_enumerationMutation(v32);
              v34 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
              objc_msgSend(v34, "pathExtension");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = objc_msgSend(v35, "caseInsensitiveCompare:", v42);

              if (!v36)
              {
                objc_msgSend(v41, "URLByAppendingPathComponent:", v34);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "setDestinationURL:", v37);

                LOBYTE(v21) = 1;
                v17 = v39;
                v14 = v40;
                v25 = 0;
                v28 = v32;
                goto LABEL_23;
              }
            }
            v28 = v32;
            v21 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
            if (v21)
              continue;
            break;
          }
          v17 = v39;
          v14 = v40;
          v25 = 0;
LABEL_23:
          v16 = v41;
        }

      }
    }

  }
LABEL_28:

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFileTransfers, 0);
  objc_storeStrong((id *)&self->_coordinationQueue, 0);
}

@end
