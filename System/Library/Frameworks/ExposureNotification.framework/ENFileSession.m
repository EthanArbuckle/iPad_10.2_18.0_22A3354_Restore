@implementation ENFileSession

- (ENFileSession)initWithServiceClient:(id)a3
{
  id v5;
  ENFileSession *v6;
  ENFileSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENFileSession;
  v6 = -[ENFileSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceClient, a3);
    v7->_batchSize = 256;
  }

  return v7;
}

- (void)dealloc
{
  ENFileSession *v2;
  SEL v3;
  objc_super v4;

  if (self->_activateSucceeded && !self->_invalidated)
  {
    v2 = (ENFileSession *)FatalErrorF();
    -[ENFileSession startDate](v2, v3);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)ENFileSession;
    -[ENFileSession dealloc](&v4, sel_dealloc);
  }
}

- (NSDate)startDate
{
  void *v2;
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("startTS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v2, "unsignedLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (NSDate)endDate
{
  void *v2;
  void *v3;
  void *v4;

  -[NSDictionary objectForKeyedSubscript:](self->_metadata, "objectForKeyedSubscript:", CFSTR("endTS"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v2, "unsignedLongValue"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (void)invalidate
{
  uint64_t v3;
  void (**v4)(_QWORD, _QWORD);
  ENXPCServiceClient *serviceClient;
  _xpc_connection_s *v6;
  id v7;
  xpc_object_t v8;
  NSObject *v9;
  _QWORD handler[5];
  id v11;
  _QWORD v12[5];

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    if (self->_activateCalled)
    {
      v3 = MEMORY[0x24BDAC760];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __27__ENFileSession_invalidate__block_invoke;
      v12[3] = &unk_24C38AFF0;
      v12[4] = self;
      v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD2F464](v12, a2);
      serviceClient = self->_serviceClient;
      v11 = 0;
      -[ENXPCServiceClient getXPCConnectionAndReturnError:](serviceClient, "getXPCConnectionAndReturnError:", &v11);
      v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      if (v6)
      {
        v8 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_int64(v8, "smTyp", 12);
        -[ENXPCServiceClient dispatchQueue](self->_serviceClient, "dispatchQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        handler[0] = v3;
        handler[1] = 3221225472;
        handler[2] = __27__ENFileSession_invalidate__block_invoke_2;
        handler[3] = &unk_24C38B500;
        handler[4] = v4;
        xpc_connection_send_message_with_reply(v6, v8, v9, handler);

      }
      else
      {
        ((void (**)(_QWORD, id))v4)[2](v4, v7);
      }

    }
  }
}

void __27__ENFileSession_invalidate__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  v2 = a2;
  v3 = v2;
  if (v2)
  {
    if (gLogCategory__ENFileSession <= 90)
    {
      v8 = v2;
      if (gLogCategory__ENFileSession != -1 || (v6 = _LogCategory_Initialize(), v3 = v8, v6))
      {
        v4 = (objc_class *)objc_opt_class();
        NSStringFromClass(v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

        v3 = v8;
      }
    }
  }

}

void __27__ENFileSession_invalidate__block_invoke_2(uint64_t a1)
{
  id v2;

  CUXPCDecodeNSErrorIfNeeded();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (BOOL)activateWithArchivePath:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;

  -[ENFileSession _activateCreateXPCRequestWithPath:archive:signatureData:error:](self, "_activateCreateXPCRequestWithPath:archive:signatureData:error:", a3, 1, 0, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = -[ENFileSession _activateSyncWithRequest:error:](self, "_activateSyncWithRequest:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)activateWithFD:(int)a3 signatureData:(id)a4 error:(id *)a5
{
  void *v7;
  BOOL v8;

  -[ENFileSession _activateCreateXPCRequestWithFD:archive:signatureData:error:](self, "_activateCreateXPCRequestWithFD:archive:signatureData:error:", *(_QWORD *)&a3, 0, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = -[ENFileSession _activateSyncWithRequest:error:](self, "_activateSyncWithRequest:error:", v7, a5);
  else
    v8 = 0;

  return v8;
}

- (BOOL)activateWithFilePath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  id v17;

  v6 = a3;
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("sig"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "fileExistsAtPath:", v8);

  if (v10)
  {
    v17 = 0;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:options:error:", v8, 0, &v17);
    v12 = v17;
    v13 = v12;
    if (!v11)
    {
      if (a4)
      {
        ENNestedErrorF(v12, 1);
        v15 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_8;
    }

    v13 = (void *)v11;
  }
  else
  {
    v13 = 0;
  }
  -[ENFileSession _activateCreateXPCRequestWithPath:archive:signatureData:error:](self, "_activateCreateXPCRequestWithPath:archive:signatureData:error:", v6, 0, v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = -[ENFileSession _activateSyncWithRequest:error:](self, "_activateSyncWithRequest:error:", v14, a4);
  else
    v15 = 0;

LABEL_8:
  return v15;
}

- (id)_activateCreateXPCRequestWithPath:(id)a3 archive:(BOOL)a4 signatureData:(id)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  id v12;
  char *v13;
  const char *v14;
  void (**v15)(_QWORD);
  uint64_t v16;
  void *v17;
  _QWORD v19[5];

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = objc_retainAutorelease(v10);
  v13 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v12, "fileSystemRepresentation"), 0);
  if (v13)
  {
    v14 = v13;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __79__ENFileSession__activateCreateXPCRequestWithPath_archive_signatureData_error___block_invoke;
    v19[3] = &__block_descriptor_40_e5_v8__0l;
    v19[4] = v13;
    v15 = (void (**)(_QWORD))MEMORY[0x20BD2F464](v19);
    v16 = open(v14, 0);
    if ((v16 & 0x80000000) != 0 && (!*__error() || *__error()))
    {
      if (a6)
      {
        ENErrorF(2);
        v17 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
    }
    else
    {
      -[ENFileSession _activateCreateXPCRequestWithFD:archive:signatureData:error:](self, "_activateCreateXPCRequestWithFD:archive:signatureData:error:", v16, v8, v11, a6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
        close(v16);
    }
    v15[2](v15);

  }
  else if (a6)
  {
    ENErrorF(2);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __79__ENFileSession__activateCreateXPCRequestWithPath_archive_signatureData_error___block_invoke(uint64_t a1)
{
  free(*(void **)(a1 + 32));
}

- (id)_activateCreateXPCRequestWithFD:(int)a3 archive:(BOOL)a4 signatureData:(id)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v10;
  xpc_object_t v11;
  xpc_object_t v12;
  void *v13;
  int64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  const char *v19;
  size_t v20;

  v7 = a4;
  v10 = a5;
  v11 = xpc_fd_create(a3);
  if (v11)
  {
    v12 = xpc_dictionary_create(0, 0, 0);
    v13 = v12;
    if (v7)
      v14 = 10;
    else
      v14 = 11;
    xpc_dictionary_set_int64(v12, "smTyp", v14);
    xpc_dictionary_set_uint64(v13, "btSz", self->_batchSize);
    xpc_dictionary_set_value(v13, "fd", v11);
    xpc_dictionary_set_uint64(v13, "fileSF", self->_flags);
    if (v10)
    {
      v15 = objc_retainAutorelease(v10);
      v16 = v13;
      v17 = v15;
      v18 = objc_msgSend(v17, "bytes");
      if (v18)
        v19 = (const char *)v18;
      else
        v19 = "";
      v20 = objc_msgSend(v17, "length");

      xpc_dictionary_set_data(v16, "sigD", v19, v20);
    }
    if ((a3 & 0x80000000) == 0)
      close(a3);
  }
  else if (a6)
  {
    ENErrorF(1);
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_activateSyncWithRequest:(id)a3 error:(id *)a4
{
  id v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  BOOL v10;

  v6 = a3;
  if (self->_activateCalled)
  {
    if (a4)
      goto LABEL_10;
    goto LABEL_12;
  }
  if (self->_invalidated)
  {
    if (a4)
    {
LABEL_10:
      ENErrorF(10);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_12:
    v10 = 0;
    goto LABEL_6;
  }
  -[ENXPCServiceClient getXPCConnectionAndReturnError:](self->_serviceClient, "getXPCConnectionAndReturnError:", a4);
  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    self->_activateCalled = 1;
    v9 = xpc_connection_send_message_with_reply_sync(v7, v6);
    v10 = -[ENFileSession _activateHandleReply:error:](self, "_activateHandleReply:error:", v9, a4);

  }
  else
  {
    v10 = 0;
  }

LABEL_6:
  return v10;
}

- (BOOL)_activateHandleReply:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v5 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__3;
  v13 = __Block_byref_object_dispose__3;
  v14 = 0;
  CUXPCDecodeNSErrorIfNeeded();
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)v10[5];
  if (v6)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v6);
  }
  else
  {
    xpc_dictionary_get_value(v5, "meta");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if ((CUXPCDecodeNSData() & 1) != 0 && a4)
      {
        ENErrorF(16);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

    }
    else if (a4)
    {
      ENErrorF(16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  _Block_object_dispose(&v9, 8);

  return 0;
}

BOOL __44__ENFileSession__activateHandleReply_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENSignature *v5;
  uint64_t v6;
  ENSignature *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENSignature alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENSignature initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENNestedErrorF(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 2);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (id)readTEKBatchAndReturnError:(id *)a3
{
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t v7;
  void *v8;

  if (!self->_activateSucceeded)
  {
    if (a3)
      goto LABEL_10;
    goto LABEL_12;
  }
  if (self->_invalidated)
  {
    if (a3)
    {
LABEL_10:
      ENErrorF(10);
      v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v8;
    }
LABEL_12:
    v8 = 0;
    return v8;
  }
  -[ENXPCServiceClient getXPCConnectionAndReturnError:](self->_serviceClient, "getXPCConnectionAndReturnError:", a3);
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v6, "smTyp", 13);
    v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    -[ENFileSession _readTEKBatchHandleReply:error:](self, "_readTEKBatchHandleReply:error:", v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_readTEKBatchHandleReply:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  _QWORD applier[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  unint64_t v22;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__3;
  v20 = __Block_byref_object_dispose__3;
  v21 = 0;
  CUXPCDecodeNSErrorIfNeeded();
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v17[5];
  if (!v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    xpc_dictionary_get_array(v6, "tekA");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      applier[0] = MEMORY[0x24BDAC760];
      applier[1] = 3221225472;
      applier[2] = __48__ENFileSession__readTEKBatchHandleReply_error___block_invoke;
      applier[3] = &unk_24C38AFC8;
      applier[4] = v8;
      applier[5] = &v16;
      xpc_array_apply(v9, applier);
    }

    v11 = (void *)v17[5];
    if (v11)
    {
      if (a4)
      {
        v13 = 0;
        *a4 = objc_retainAutorelease(v11);
        goto LABEL_9;
      }
    }
    else
    {
      v22 = 0;
      v12 = CUXPCDecodeUInt64RangedEx();
      if (v12 == 6)
      {
        self->_invalidKeyCount = v22;
LABEL_8:
        v13 = v8;
LABEL_9:

        goto LABEL_10;
      }
      if (v12 != 5)
        goto LABEL_8;
    }
    v13 = 0;
    goto LABEL_9;
  }
  v13 = 0;
  if (a4)
    *a4 = objc_retainAutorelease(v7);
LABEL_10:
  _Block_object_dispose(&v16, 8);

  return v13;
}

BOOL __48__ENFileSession__readTEKBatchHandleReply_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENTemporaryExposureKey *v5;
  uint64_t v6;
  ENTemporaryExposureKey *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENTemporaryExposureKey alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENTemporaryExposureKey initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENNestedErrorF(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), 2);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (id)verifySignatureWithPublicKey:(__SecKey *)a3 error:(id *)a4
{
  NSData *sha256Data;
  NSArray *v7;
  NSArray *v8;
  void *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CFErrorRef v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  int v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  const __CFString *v29;
  int v30;
  id v31;
  uint64_t v33;
  void *v34;
  const __CFString *v35;
  id *v36;
  NSArray *v37;
  uint64_t v38;
  CFErrorRef error;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (!self->_activateSucceeded)
  {
    if (!a4)
      return 0;
LABEL_46:
    v33 = 10;
LABEL_49:
    ENErrorF(v33);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return 0;
  }
  if (self->_invalidated)
  {
    if (!a4)
      return 0;
    goto LABEL_46;
  }
  sha256Data = self->_sha256Data;
  if (!sha256Data)
  {
    if (a4)
    {
      v33 = 2;
      goto LABEL_49;
    }
    return 0;
  }
  v7 = self->_signatures;
  v8 = v7;
  if (v7)
  {
    -[NSArray firstObject](v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v36 = a4;
      v37 = v8;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v10 = v8;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v11)
      {
        v12 = v11;
        v13 = (const __CFString *)*MEMORY[0x24BDE9298];
        v14 = *(_QWORD *)v41;
        v38 = *MEMORY[0x24BDD1100];
        v15 = &OBJC_IVAR___ENExposureDetectionClientSession__manager;
LABEL_8:
        v16 = 0;
        while (1)
        {
          if (*(_QWORD *)v41 != v14)
            objc_enumerationMutation(v10);
          v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
          objc_msgSend(v17, "signatureData", v34, v35);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            v23 = v15[580];
            if (v23 <= 90 && (v23 != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(v17, "keyID");
              v24 = objc_claimAutoreleasedReturnValue();
              v25 = (void *)v24;
              if (v24)
                v26 = (const __CFString *)v24;
              else
                v26 = CFSTR("<no key ID>");
              objc_msgSend(v17, "keyVersion");
              v27 = objc_claimAutoreleasedReturnValue();
              v28 = (void *)v27;
              v29 = CFSTR("<no key version>");
              if (v27)
                v29 = (const __CFString *)v27;
              v34 = (void *)v26;
              v35 = v29;
              v15 = &OBJC_IVAR___ENExposureDetectionClientSession__manager;
              LogPrintF_safe();

            }
            goto LABEL_34;
          }
          error = 0;
          if (SecKeyVerifySignature(a3, v13, (CFDataRef)sha256Data, (CFDataRef)v18, &error))
          {
            v31 = v17;

            goto LABEL_40;
          }
          v19 = error;
          if (!error)
            goto LABEL_34;
          -[__CFError domain](error, "domain");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v20, "isEqualToString:", v38))
            break;
          v21 = -[__CFError code](v19, "code");

          v22 = v21 == -67808;
          v15 = &OBJC_IVAR___ENExposureDetectionClientSession__manager;
          if (!v22)
            goto LABEL_27;
LABEL_33:

LABEL_34:
          if (v12 == ++v16)
          {
            v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
            if (v12)
              goto LABEL_8;
            goto LABEL_36;
          }
        }

LABEL_27:
        v30 = v15[580];
        if (v30 <= 90 && (v30 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

        }
        goto LABEL_33;
      }
LABEL_36:

      if (v36)
      {
        ENErrorF(2);
        v31 = 0;
        *v36 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v31 = 0;
      }
LABEL_40:
      v8 = v37;
      goto LABEL_41;
    }
    if (a4)
      goto LABEL_54;
LABEL_55:
    v31 = 0;
    goto LABEL_41;
  }
  if (!a4)
    goto LABEL_55;
LABEL_54:
  ENErrorF(2);
  v31 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:

  return v31;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (unint64_t)invalidKeyCount
{
  return self->_invalidKeyCount;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (NSData)sha256Data
{
  return self->_sha256Data;
}

- (NSArray)signatures
{
  return self->_signatures;
}

- (ENXPCServiceClient)serviceClient
{
  return self->_serviceClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceClient, 0);
  objc_storeStrong((id *)&self->_signatures, 0);
  objc_storeStrong((id *)&self->_sha256Data, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
