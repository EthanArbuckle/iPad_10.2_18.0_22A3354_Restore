@implementation GTBulkDataServiceXPCProxy

- (GTBulkDataServiceXPCProxy)initWithConnection:(id)a3 remoteProperties:(id)a4
{
  id v6;
  id v7;
  GTBulkDataServiceXPCProxy *v8;
  os_log_t v9;
  OS_os_log *log;
  dispatch_queue_t v11;
  OS_dispatch_queue *serialQueue;
  GTServiceConnection *v13;
  void *v14;
  uint64_t v15;
  GTServiceConnection *connection;
  uint64_t v17;
  GTBulkDataTransferOptions *defaultTransferOptions;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSSet *ignoreMethods;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)GTBulkDataServiceXPCProxy;
  v8 = -[GTBulkDataServiceXPCProxy init](&v25, sel_init);
  if (v8)
  {
    v9 = os_log_create("com.apple.gputools.transport", "BulkDataProxy");
    log = v8->_log;
    v8->_log = (OS_os_log *)v9;

    v11 = dispatch_queue_create("com.apple.gputools.bulk-data-proxy", 0);
    serialQueue = v8->_serialQueue;
    v8->_serialQueue = (OS_dispatch_queue *)v11;

    v13 = [GTServiceConnection alloc];
    objc_msgSend(v7, "deviceUDID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[GTServiceConnection initWithConnection:device:port:](v13, "initWithConnection:device:port:", v6, v14, objc_msgSend(v7, "servicePort"));
    connection = v8->_connection;
    v8->_connection = (GTServiceConnection *)v15;

    v17 = objc_opt_new();
    defaultTransferOptions = v8->_defaultTransferOptions;
    v8->_defaultTransferOptions = (GTBulkDataTransferOptions *)v17;

    objc_msgSend(v7, "deviceUDID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GTBulkDataTransferOptions setChunkSize:](v8->_defaultTransferOptions, "setChunkSize:", 0x400000);

    -[GTBulkDataTransferOptions setCompressionAlgorithm:](v8->_defaultTransferOptions, "setCompressionAlgorithm:", 0);
    +[GTServiceProperties protocolMethods:](GTServiceProperties, "protocolMethods:", &unk_255D61D90);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "protocolMethods");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    newSetWithArrayMinusArray(v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    ignoreMethods = v8->_ignoreMethods;
    v8->_ignoreMethods = (NSSet *)v22;

  }
  return v8;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  NSSet *ignoreMethods;
  void *v6;
  BOOL v7;
  objc_super v9;

  ignoreMethods = self->_ignoreMethods;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSSet containsObject:](ignoreMethods, "containsObject:", v6))
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GTBulkDataServiceXPCProxy;
    v7 = -[GTBulkDataServiceXPCProxy respondsToSelector:](&v9, sel_respondsToSelector_, a3);
  }

  return v7;
}

- (id)transferOptions
{
  return (id)-[GTBulkDataTransferOptions copy](self->_defaultTransferOptions, "copy");
}

- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 chunkHandler:(id)a5
{
  id v9;
  id v10;
  const char *Name;
  GTBulkDataReplyStream *v12;
  unint64_t v13;
  xpc_object_t xdict;

  v9 = a5;
  v10 = a4;
  xdict = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(xdict, "_cmd", Name);
  xpc_dictionary_set_uint64(xdict, "handle", a3);
  xpc_dictionary_set_nsobject(xdict, "transferOptions", (uint64_t)v10);

  v12 = -[GTBulkDataReplyStream initWithCallback:]([GTBulkDataReplyStream alloc], "initWithCallback:", v9);
  v13 = -[GTServiceConnection registerDispatcher:](self->_connection, "registerDispatcher:", v12);
  -[GTBulkDataReplyStream setDispatcherId:](v12, "setDispatcherId:", v13);
  -[GTServiceConnection sendMessage:withReplyStreamId:](self->_connection, "sendMessage:withReplyStreamId:", xdict, v13);

}

- (void)downloadData:(unint64_t)a3 completionHandler:(id)a4
{
  -[GTBulkDataServiceXPCProxy downloadData:usingTransferOptions:completionHandler:](self, "downloadData:usingTransferOptions:completionHandler:", a3, self->_defaultTransferOptions, a4);
}

- (id)downloadData:(unint64_t)a3 error:(id *)a4
{
  return -[GTBulkDataServiceXPCProxy downloadData:usingTransferOptions:error:](self, "downloadData:usingTransferOptions:error:", a3, self->_defaultTransferOptions, a4);
}

- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v8 = a4;
  v9 = a5;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy_;
  v16[4] = __Block_byref_object_dispose_;
  v17 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__GTBulkDataServiceXPCProxy_downloadData_usingTransferOptions_completionHandler___block_invoke;
  v12[3] = &unk_24F827920;
  v14 = v9;
  v15 = v16;
  v13 = v8;
  v10 = v9;
  v11 = v8;
  -[GTBulkDataServiceXPCProxy downloadData:usingTransferOptions:chunkHandler:](self, "downloadData:usingTransferOptions:chunkHandler:", a3, v11, v12);

  _Block_object_dispose(v16, 8);
}

void __81__GTBulkDataServiceXPCProxy_downloadData_usingTransferOptions_completionHandler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v7 = a2;
  v8 = a4;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  if (v7)
  {
    objc_msgSend(v10, "appendData:", v7);
    if (!v8 && !a3)
      goto LABEL_9;
  }
  else
  {
    *(_QWORD *)(v9 + 40) = 0;

  }
  v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v11)
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "compressionAlgorithm");
    v14 = v8;
    GTBulkDataDecompress(v11, v12, &v14);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;

    v8 = v13;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_9:
}

- (id)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 error:(id *)a5
{
  id v8;
  dispatch_semaphore_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v9 = dispatch_semaphore_create(0);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __69__GTBulkDataServiceXPCProxy_downloadData_usingTransferOptions_error___block_invoke;
  v14[3] = &unk_24F827948;
  v16 = &v24;
  v17 = &v18;
  v10 = v9;
  v15 = v10;
  -[GTBulkDataServiceXPCProxy downloadData:usingTransferOptions:chunkHandler:](self, "downloadData:usingTransferOptions:chunkHandler:", a3, v8, v14);
  dispatch_semaphore_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
  if (a5)
    *a5 = objc_retainAutorelease((id)v19[5]);
  v11 = (void *)v25[5];
  if (v11)
  {
    GTBulkDataDecompress(v11, objc_msgSend(v8, "compressionAlgorithm"), a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __69__GTBulkDataServiceXPCProxy_downloadData_usingTransferOptions_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  v7 = a4;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  if (!v10)
  {
    *(_QWORD *)(v8 + 40) = 0;

LABEL_6:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_7;
  }
  objc_msgSend(v9, "appendData:");
  if (v7 || a3)
    goto LABEL_6;
LABEL_7:

}

- (unint64_t)newUploadWithDescriptor:(id)a3 error:(id *)a4
{
  id v7;
  xpc_object_t empty;
  const char *Name;
  void *v10;
  void *v11;
  uint64_t uint64;

  v7 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsobject(empty, "descriptor", (uint64_t)v7);

  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    uint64 = xpc_dictionary_get_uint64(v10, "result");
    if (a4)
      *a4 = (id)xpc_dictionary_get_nserror(v11, "error");
  }
  else
  {
    uint64 = 0;
  }

  return uint64;
}

- (BOOL)uploadChunk:(id)a3 forHandle:(unint64_t)a4 isFinalChunk:(BOOL)a5 error:(id *)a6
{
  id v11;
  xpc_object_t empty;
  const char *Name;
  void *v14;
  void *v15;
  BOOL v16;

  v11 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  xpc_dictionary_set_nsdata(empty, "chunk", v11);

  xpc_dictionary_set_uint64(empty, "handle", a4);
  xpc_dictionary_set_BOOL(empty, "isFinalChunk", a5);
  -[GTServiceConnection sendMessageWithReplySync:error:](self->_connection, "sendMessageWithReplySync:error:", empty, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = xpc_dictionary_get_BOOL(v14, "result");
    if (a6)
      *a6 = (id)xpc_dictionary_get_nserror(v15, "error");
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)uploadData:(id)a3 completionHandler:(id)a4
{
  -[GTBulkDataServiceXPCProxy uploadData:usingTransferOptions:completionHandler:](self, "uploadData:usingTransferOptions:completionHandler:", a3, self->_defaultTransferOptions, a4);
}

- (unint64_t)uploadData:(id)a3 error:(id *)a4
{
  return -[GTBulkDataServiceXPCProxy uploadData:usingTransferOptions:error:](self, "uploadData:usingTransferOptions:error:", a3, self->_defaultTransferOptions, a4);
}

- (void)uploadData:(id)a3 usingTransferOptions:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *serialQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  serialQueue = self->_serialQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __79__GTBulkDataServiceXPCProxy_uploadData_usingTransferOptions_completionHandler___block_invoke;
  v15[3] = &unk_24F827970;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(serialQueue, v15);

}

void __79__GTBulkDataServiceXPCProxy_uploadData_usingTransferOptions_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = (void *)a1[4];
  v1 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  v7 = 0;
  v5 = objc_msgSend(v2, "uploadData:usingTransferOptions:error:", v1, v3, &v7);
  v6 = v7;
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v5);

}

- (unint64_t)uploadData:(id)a3 usingTransferOptions:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *log;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v46;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setSizeHint:", objc_msgSend(v8, "length"));
  objc_msgSend(v10, "setCompressionAlgorithm:", objc_msgSend(v9, "compressionAlgorithm"));
  v11 = -[GTBulkDataServiceXPCProxy newUploadWithDescriptor:error:](self, "newUploadWithDescriptor:error:", v10, a5);
  if (v11)
  {
    v12 = v11;
    GTBulkDataCompress(v8, objc_msgSend(v9, "compressionAlgorithm"), a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      if (objc_msgSend(v13, "length"))
      {
        v46 = v8;
        v15 = 0;
        while (1)
        {
          v16 = objc_msgSend(v9, "chunkSize");
          v17 = objc_msgSend(v14, "length");
          v18 = v16 >= v17 - v15 ? v17 - v15 : v16;
          v19 = (void *)MEMORY[0x24BDBCE50];
          v20 = objc_retainAutorelease(v14);
          objc_msgSend(v19, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v20, "bytes") + v15, v18, 0);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[GTBulkDataServiceXPCProxy uploadChunk:forHandle:isFinalChunk:error:](self, "uploadChunk:forHandle:isFinalChunk:error:", v21, v12, objc_msgSend(v9, "chunkSize") + v15 >= objc_msgSend(v20, "length"), a5))break;

          v15 += objc_msgSend(v9, "chunkSize");
          if (v15 >= objc_msgSend(v20, "length"))
            goto LABEL_20;
        }
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          -[GTBulkDataServiceXPCProxy uploadData:usingTransferOptions:error:].cold.3(v12, log, v39, v40, v41, v42, v43, v44);

        v12 = 0;
LABEL_20:
        v8 = v46;
      }
    }
    else
    {
      v30 = self->_log;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[GTBulkDataServiceXPCProxy uploadData:usingTransferOptions:error:].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
      v12 = 0;
    }

  }
  else
  {
    v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[GTBulkDataServiceXPCProxy uploadData:usingTransferOptions:error:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    v12 = 0;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ignoreMethods, 0);
  objc_storeStrong((id *)&self->_defaultTransferOptions, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)uploadData:(uint64_t)a3 usingTransferOptions:(uint64_t)a4 error:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22D095000, a1, a3, "uploadData failed to start upload", a5, a6, a7, a8, 0);
}

- (void)uploadData:(uint64_t)a3 usingTransferOptions:(uint64_t)a4 error:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_22D095000, a1, a3, "uploadData compression failed", a5, a6, a7, a8, 0);
}

- (void)uploadData:(uint64_t)a3 usingTransferOptions:(uint64_t)a4 error:(uint64_t)a5 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D095000, a2, a3, "uploadData Failed handle:%llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
