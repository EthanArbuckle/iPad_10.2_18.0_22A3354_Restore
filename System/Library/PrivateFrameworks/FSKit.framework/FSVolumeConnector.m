@implementation FSVolumeConnector

- (FSVolumeConnector)initWithModuleVolume:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  FSVolumeConnector *v9;
  FSVolumeConnector *v10;
  FSItemGetAttributesRequest *v11;
  FSItemGetAttributesRequest *standardGetAttrReq;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FSVolumeConnector;
  v9 = -[FSVolumeConnector init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ourVolume, a3);
    objc_storeWeak((id *)&v10->_ourConnection, v8);
    v11 = -[FSItemGetAttributesRequest initWithWantedLIAttributes:]([FSItemGetAttributesRequest alloc], "initWithWantedLIAttributes:", 81895);
    standardGetAttrReq = v10->_standardGetAttrReq;
    v10->_standardGetAttrReq = v11;

    atomic_store(0, &v10->_nextFreeSpaceSeqno);
    atomic_store(0, &v10->_nextAttributeSeqno);
  }

  return v10;
}

+ (id)volumeConnectorModuleVolume:(id)a3 connection:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModuleVolume:connection:", v7, v6);

  return v8;
}

+ (id)volumeWithName:(id)a3 resource:(id)a4 connection:(id)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a5;
  +[FSModuleVolume volumeWithName:resource:](FSModuleVolume, "volumeWithName:resource:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithModuleVolume:connection:", v9, v8);

  return v10;
}

- (id)getStandardItemAttributes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  FSItemGetAttributesRequest *standardGetAttrReq;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  NSObject *v12;
  uint64_t *v13;
  id v14;
  id location;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  v5 = dispatch_group_create();
  dispatch_group_enter(v5);
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__4;
  v20 = __Block_byref_object_dispose__4;
  v21 = 0;
  objc_initWeak(&location, self);
  -[FSModuleVolume volume](self->_ourVolume, "volume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  standardGetAttrReq = self->_standardGetAttrReq;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__FSVolumeConnector_getStandardItemAttributes___block_invoke;
  v11[3] = &unk_250C32AE0;
  objc_copyWeak(&v14, &location);
  v13 = &v16;
  v8 = v5;
  v12 = v8;
  objc_msgSend(v6, "getAttributes:ofItem:replyHandler:", standardGetAttrReq, v4, v11);

  dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v17[5];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v16, 8);

  return v9;
}

void __47__FSVolumeConnector_getStandardItemAttributes___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  unint64_t *WeakRetained;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fskit_std_log();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      __47__FSVolumeConnector_getStandardItemAttributes___block_invoke_cold_1(v6, v7);

  }
  WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    v10 = WeakRetained + 2;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 + 1, v10));
    objc_msgSend(v5, "setAttributeSeqno:");
  }
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v5;
  v14 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (id)getStandardItemAttributesData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[FSVolumeConnector getStandardItemAttributes:](self, "getStandardItemAttributes:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "attrsData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)getFreeSpaceInVolume
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t *p_nextFreeSpaceSeqno;
  unint64_t v11;
  uint64_t v13;
  unint64_t v14;

  v14 = 0;
  -[FSVolumeConnector ourVolume](self, "ourVolume");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "volume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "volumeStatistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "availableBlocks");
  -[FSVolumeConnector ourVolume](self, "ourVolume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volumeStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "blockSize") * v6;

  p_nextFreeSpaceSeqno = &self->_nextFreeSpaceSeqno;
  do
    v11 = __ldaxr(p_nextFreeSpaceSeqno);
  while (__stlxr(v11 + 1, p_nextFreeSpaceSeqno));
  v14 = v11;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v13, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)blockmapFile:(id)a3 range:(_NSRange)a4 startIO:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 replyHandler:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v13;
  id v14;
  NSObject *v15;
  FSModuleVolume *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  NSUInteger v31;
  id v32;
  _QWORD block[4];
  id v35;
  id v36;
  FSVolumeConnector *v37;
  id v38;
  NSUInteger v39;
  NSUInteger v40;
  unint64_t v41;
  unsigned int v42;
  int v43;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  NSUInteger v49;
  __int16 v50;
  NSUInteger v51;
  __int16 v52;
  int v53;
  __int16 v54;
  unsigned int v55;
  __int16 v56;
  unint64_t v57;
  uint64_t v58;

  length = a4.length;
  location = a4.location;
  v58 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a8;
  fskit_std_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    v45 = "-[FSVolumeConnector blockmapFile:range:startIO:flags:operationID:replyHandler:]";
    v46 = 2112;
    v47 = v13;
    v48 = 2048;
    v49 = location;
    v50 = 2048;
    v51 = length;
    v52 = 1024;
    v53 = a5;
    v54 = 1024;
    v55 = a6;
    v56 = 2048;
    v57 = a7;
    _os_log_debug_impl(&dword_23B2A6000, v15, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:theRangeLocation:%lu:theRangeLength:%lu:startIO:%d:flags:%d:operationID:%llu", buf, 0x40u);
  }

  v16 = self->_ourVolume;
  if (-[FSModuleVolume supportsKOIOOps](v16, "supportsKOIOOps"))
  {
    -[FSModuleVolume volume](v16, "volume");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v16, "getItemForFH:", v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[FSModuleVolume volume](v16, "volume");
      v31 = location;
      v32 = v13;
      v19 = a5;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "queueForItem:", v18);
      v21 = objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke;
      block[3] = &unk_250C32B30;
      v42 = a6;
      v35 = v17;
      v36 = v18;
      v39 = v31;
      v40 = length;
      v43 = v19;
      v13 = v32;
      v41 = a7;
      v37 = self;
      v38 = v14;
      dispatch_async(v21, block);

    }
    else
    {
      fskit_std_log();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector blockmapFile:range:startIO:flags:operationID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v14 + 2))(v14, 70, 0, 0);
    }

  }
  else
  {
    fskit_std_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector blockmapFile:range:startIO:flags:operationID:replyHandler:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v14 + 2))(v14, 45, 0, 0);
  }

}

void __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 24 * (*(_DWORD *)(a1 + 88) & 0x3F) + 24);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = objc_msgSend(v2, "mutableBytes");
  v4 = objc_msgSend(v2, "length");
  +[FSVolume extentPackerForBuffer:bufLen:extentCount:](FSVolume, "extentPackerForBuffer:bufLen:extentCount:", v3, v4, v19 + 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(unsigned int *)(a1 + 88);
  v9 = *(_DWORD *)(a1 + 92) != 0;
  v10 = *(_QWORD *)(a1 + 80);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke_2;
  v13[3] = &unk_250C32B08;
  v16 = *(id *)(a1 + 56);
  v17 = &v18;
  v11 = v2;
  v12 = *(_QWORD *)(a1 + 48);
  v14 = v11;
  v15 = v12;
  objc_msgSend(v6, "blockmapFile:range:startIO:flags:operationID:usingPacker:replyHandler:", v7, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v9, v8, v10, v5, v13);

  _Block_object_dispose(&v18, 8);
}

void __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    fskit_std_log();
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke_2_cold_1(v3, v4);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v3, "code"), 0, 0);
  }
  else
  {
    v5 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    if ((_DWORD)v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 0, 24 * v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 40), "getFreeSpaceInVolume");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v7 + 16))(v7, 0, v6, v8);

  }
}

- (void)checkAccessTo:(id)a3 requestedAccess:(unint64_t)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  FSModuleVolume *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  unint64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  fskit_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v33 = "-[FSVolumeConnector checkAccessTo:requestedAccess:requestID:replyHandler:]";
    v34 = 2112;
    v35 = v10;
    v36 = 2048;
    v37 = a4;
    v38 = 2048;
    v39 = a5;
    _os_log_debug_impl(&dword_23B2A6000, v12, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:access:%ld:reqID:%llu", buf, 0x2Au);
  }

  v13 = self->_ourVolume;
  if (-[FSModuleVolume supportsAccessOps](v13, "supportsAccessOps"))
  {
    -[FSModuleVolume volume](v13, "volume");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v13, "getItemForFH:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[FSModuleVolume volume](v13, "volume");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queueForItem:", v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke;
      v27[3] = &unk_250C32B58;
      v28 = v14;
      v29 = v15;
      v31 = a4;
      v30 = v11;
      dispatch_async(v17, v27);

    }
    else
    {
      fskit_std_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector checkAccessTo:requestedAccess:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t))v11 + 2))(v11, 70);
    }

  }
  else
  {
    fskit_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector checkAccessTo:requestedAccess:requestID:replyHandler:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 45);
  }

}

void __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke_2;
  v4[3] = &unk_250C31EF0;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "checkAccessToItem:requestedAccess:replyHandler:", v2, v3, v4);

}

void __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  char *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    fskit_std_log();
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke_2_cold_1(v5, v6);

    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v5, "code"));
  }
  else
  {
    if (a2)
      v7 = 0;
    else
      v7 = 13;
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7);
  }

}

- (void)endIO:(id)a3 range:(_NSRange)a4 status:(int)a5 flags:(unsigned int)a6 operationID:(unint64_t)a7 replyHandler:(id)a8
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  NSObject *v16;
  FSModuleVolume *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  unint64_t v32;
  unsigned int v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  NSUInteger v38;
  NSUInteger v39;
  unint64_t v40;
  int v41;
  unsigned int v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  id v46;
  __int16 v47;
  NSUInteger v48;
  __int16 v49;
  NSUInteger v50;
  __int16 v51;
  int v52;
  __int16 v53;
  unsigned int v54;
  __int16 v55;
  unint64_t v56;
  uint64_t v57;

  length = a4.length;
  location = a4.location;
  v57 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a8;
  fskit_std_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    v44 = "-[FSVolumeConnector endIO:range:status:flags:operationID:replyHandler:]";
    v45 = 2112;
    v46 = v14;
    v47 = 2048;
    v48 = location;
    v49 = 2048;
    v50 = length;
    v51 = 1024;
    v52 = a5;
    v53 = 1024;
    v54 = a6;
    v55 = 2048;
    v56 = a7;
    _os_log_debug_impl(&dword_23B2A6000, v16, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:originalRangeLocation:%lu:originalRangeLength:%lu:ioStatus:%d:flags:%d:operationID:%llu", buf, 0x40u);
  }

  v17 = self->_ourVolume;
  if (-[FSModuleVolume supportsKOIOOps](v17, "supportsKOIOOps"))
  {
    -[FSModuleVolume volume](v17, "volume");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v17, "getItemForFH:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[FSModuleVolume volume](v17, "volume");
      v33 = a6;
      v32 = a7;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "queueForItem:", v19);
      v21 = objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke;
      block[3] = &unk_250C32B80;
      v35 = v18;
      v36 = v19;
      v38 = location;
      v39 = length;
      v41 = a5;
      v42 = v33;
      v40 = v32;
      v37 = v15;
      dispatch_async(v21, block);

    }
    else
    {
      v30 = v18;
      fskit_std_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector endIO:range:status:flags:operationID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t))v15 + 2))(v15, 70);
      v18 = v30;
    }

  }
  else
  {
    fskit_std_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector endIO:range:status:flags:operationID:replyHandler:].cold.2(v22, v23, v24, v25, v26, v27, v28, v29);

    (*((void (**)(id, uint64_t))v15 + 2))(v15, 45);
  }

}

void __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_DWORD *)(a1 + 80);
  if (v4)
  {
    fs_errorForPOSIXError(*(_DWORD *)(a1 + 80));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = *(unsigned int *)(a1 + 84);
  v7 = *(_QWORD *)(a1 + 72);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke_2;
  v8[3] = &unk_250C31EC8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "endIO:range:status:flags:operationID:replyHandler:", v3, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v5, v6, v7, v8);
  if (v4)

}

void __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char *v4;

  v3 = a2;
  if (v3)
  {
    fskit_std_log();
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke_2_cold_1(v3, v4);

    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "code"));
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }

}

- (void)otherAttributeOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  FSModuleVolume *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t i;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t j;
  NSObject *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  const char *v87;
  void *v88;
  void *v89;
  void *v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint8_t v105[128];
  _BYTE buf[32];
  _QWORD v107[6];

  v107[3] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  v12 = self->_ourVolume;
  objc_msgSend(a4, "string");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  fskit_std_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FSVolumeConnector otherAttributeOf:named:requestID:replyHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v10;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v13;
    LOWORD(v107[0]) = 2048;
    *(_QWORD *)((char *)v107 + 2) = a5;
    _os_log_debug_impl(&dword_23B2A6000, v14, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:name:%@:reqID:%llu", buf, 0x2Au);
  }

  if (objc_msgSend(v13, "isEqual:", CFSTR("_S_f_location")))
  {
    -[FSModuleVolume resource](self->_ourVolume, "resource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[FSResource dynamicCast:](FSBlockDeviceResource, "dynamicCast:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v16, "BSDName");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/dev/%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[FSModuleVolume resource](self->_ourVolume, "resource");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[FSResource dynamicCast:](FSGenericURLResource, "dynamicCast:", v26);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v11[2](v11, 45, 0);
        goto LABEL_27;
      }
      objc_msgSend(v17, "URL");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "path");
      v28 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v28;
    }
    v29 = objc_retainAutorelease(v18);
    v30 = (const char *)objc_msgSend(v29, "UTF8String");
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v30, strlen(v30) + 1);
    v31 = objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_mntflags")))
  {
    if (-[FSModuleVolume reportAsLocal](v12, "reportAsLocal"))
      v19 = 0x10000000;
    else
      v19 = 0;
    if (!-[FSModuleVolume supportsOpenCloseOps](v12, "supportsOpenCloseOps"))
      v19 |= 2uLL;
    if (-[FSModuleVolume supportsKOIOOps](v12, "supportsKOIOOps"))
      v19 |= 0x40000000uLL;
    if (-[FSModuleVolume supportsOpenUnlink](v12, "supportsOpenUnlink"))
      v20 = v19 | 0x2000;
    else
      v20 = v19;
    v21 = (void *)MEMORY[0x24BDBCE50];
    goto LABEL_18;
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("_N_PC_LINK_MAX")))
  {
    v23 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "maxLinkCount");
LABEL_39:
    v33 = v25;
    goto LABEL_40;
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("_N_PC_NAME_MAX")))
  {
    v23 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "maxNameLength");
    goto LABEL_39;
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("_B_PC_NO_TRUNC")))
  {
    v23 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v24, "isLongNameTruncated") ^ 1;
LABEL_40:
    objc_msgSend(v23, "dataWithInteger:", v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v36);

LABEL_41:
    goto LABEL_42;
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("_N_PC_FILESIZEBITS")))
  {
    v23 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "maxFileSizeInBits");
    goto LABEL_39;
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("_N_PC_XATTR_SIZE_BITS")))
  {
    -[FSModuleVolume volume](v12, "volume");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_opt_respondsToSelector();

    if ((v35 & 1) != 0)
    {
      v23 = (void *)MEMORY[0x24BDBCE50];
      -[FSModuleVolume volume](v12, "volume");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "maxXattrSizeInBits");
      goto LABEL_39;
    }
    fskit_std_log();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector otherAttributeOf:named:requestID:replyHandler:].cold.1(v40, v41, v42, v43, v44, v45, v46, v47);

LABEL_48:
    v11[2](v11, 45, 0);
    goto LABEL_42;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_f_bsize")))
  {
    v37 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "volumeStatistics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "blockSize");
LABEL_57:
    v48 = v39;
LABEL_58:
    objc_msgSend(v37, "dataWithInteger:", v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v49);

    goto LABEL_41;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_f_iosize")))
  {
    v37 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "volumeStatistics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "ioSize");
    goto LABEL_57;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_f_blocks")))
  {
    v37 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "volumeStatistics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "totalBlocks");
    goto LABEL_57;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_f_bavail")))
  {
    v37 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "volumeStatistics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "availableBlocks");
    goto LABEL_57;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_f_bfree")))
  {
    v37 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "volumeStatistics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "freeBlocks");
    goto LABEL_57;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_f_bused")))
  {
    -[FSModuleVolume volume](v12, "volume");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "volumeStatistics");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "totalBlocks");
    -[FSModuleVolume volume](v12, "volume");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "volumeStatistics");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = v52 - objc_msgSend(v54, "freeBlocks");

    goto LABEL_61;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_f_subtype")))
  {
    v37 = (void *)MEMORY[0x24BDBCE50];
    -[FSModuleVolume volume](v12, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "volumeStatistics");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v38, "filesystemSubType");
    goto LABEL_58;
  }
  if ((objc_msgSend(v13, "isEqualToString:", CFSTR("_B_has_perm_enforcement")) & 1) != 0
    || objc_msgSend(v13, "isEqualToString:", CFSTR("_B_has_access_check")))
  {
    *(_QWORD *)buf = 0;
    v56 = (void *)MEMORY[0x24BDBCE50];
    v57 = 8;
LABEL_67:
    objc_msgSend(v56, "dataWithBytes:length:", buf, v57);
    v22 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("_O_vol_attributes_attr")))
  {
    *(_OWORD *)buf = xmmword_23B2E0168;
    *(_OWORD *)&buf[16] = unk_23B2E0178;
    v107[0] = 1574;
    v56 = (void *)MEMORY[0x24BDBCE50];
    v57 = 40;
    goto LABEL_67;
  }
  if (!objc_msgSend(v13, "isEqualToString:", CFSTR("_N_caps_format")))
  {
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_caps_interfaces")))
    {
      if (-[FSModuleVolume supportsVolumeRenameOps](v12, "supportsVolumeRenameOps"))
        v58 = 128;
      else
        v58 = 0;
      if (-[FSModuleVolume supportsPreallocateOps](v12, "supportsPreallocateOps"))
        v58 |= 0x40uLL;
      if (-[FSModuleVolume supportsXattrOps](v12, "supportsXattrOps")
        && !-[FSModuleVolume supportsLimitedXattrOps](v12, "supportsLimitedXattrOps"))
      {
        v58 |= 0x4000uLL;
      }
      v21 = (void *)MEMORY[0x24BDBCE50];
      v20 = v58;
      goto LABEL_18;
    }
    if (objc_msgSend(v13, "isEqualToString:", CFSTR("_S_f_type")))
    {
      -[FSModuleVolume volume](v12, "volume");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "volumeStatistics");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "filesystemTypeName");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v13, "isEqualToString:", CFSTR("_S_f_vol_name"))
        || (-[FSModuleVolume volume](v12, "volume"),
            v60 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v60, "name"),
            v61 = (void *)objc_claimAutoreleasedReturnValue(),
            v61,
            v60,
            !v61))
      {
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("_O_f_uuid")))
        {
          -[FSModuleVolume volume](v12, "volume");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "volumeID");
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          if (v63)
          {
            -[FSModuleVolume volume](v12, "volume");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "volumeID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "uuidData");
            v29 = (id)objc_claimAutoreleasedReturnValue();
            ((void (**)(id, uint64_t, id))v11)[2](v11, 0, v29);
            goto LABEL_26;
          }
        }
        if (objc_msgSend(v13, "isEqualToString:", CFSTR("_N_supported_xattr_namessize")))
        {
          if (!-[FSModuleVolume supportsLimitedXattrOps](v12, "supportsLimitedXattrOps"))
            goto LABEL_48;
          -[FSModuleVolume volume](v12, "volume");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSModuleVolume getItemForFH:](v12, "getItemForFH:", v10);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (v64)
          {
            objc_msgSend(v90, "supportedXattrNamesForItem:", v64);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v65;
            if (v65)
            {
              v101 = 0u;
              v102 = 0u;
              v99 = 0u;
              v100 = 0u;
              v67 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
              if (v67)
              {
                v68 = v67;
                v69 = 0;
                v70 = *(_QWORD *)v100;
                do
                {
                  for (i = 0; i != v68; ++i)
                  {
                    if (*(_QWORD *)v100 != v70)
                      objc_enumerationMutation(v66);
                    v69 += objc_msgSend(*(id *)(*((_QWORD *)&v99 + 1) + 8 * i), "lengthOfBytesUsingEncoding:", 4) + 1;
                  }
                  v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v99, v105, 16);
                }
                while (v68);
              }
              else
              {
                v69 = 0;
              }
              objc_msgSend(MEMORY[0x24BDBCE50], "dataWithInteger:", v69);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v80);

            }
            else
            {
              v11[2](v11, 45, 0);
            }

          }
          else
          {
            fskit_std_log();
            v78 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
              -[FSVolumeConnector otherAttributeOf:named:requestID:replyHandler:].cold.2();

            v11[2](v11, 70, 0);
          }

        }
        else
        {
          if (!objc_msgSend(v13, "isEqualToString:", CFSTR("_O_supported_xattr_names"))
            || !-[FSModuleVolume supportsLimitedXattrOps](v12, "supportsLimitedXattrOps"))
          {
            goto LABEL_48;
          }
          -[FSModuleVolume volume](v12, "volume");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          -[FSModuleVolume getItemForFH:](v12, "getItemForFH:", v10);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          if (v89)
          {
            objc_msgSend(v90, "supportedXattrNamesForItem:", v89);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            if (v88 && objc_msgSend(v88, "count"))
            {
              v97 = 0u;
              v98 = 0u;
              v95 = 0u;
              v96 = 0u;
              v72 = v88;
              v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
              if (v73)
              {
                v74 = v73;
                v75 = 0;
                v76 = *(_QWORD *)v96;
                do
                {
                  for (j = 0; j != v74; ++j)
                  {
                    if (*(_QWORD *)v96 != v76)
                      objc_enumerationMutation(v72);
                    v75 += objc_msgSend(*(id *)(*((_QWORD *)&v95 + 1) + 8 * j), "lengthOfBytesUsingEncoding:", 4) + 1;
                  }
                  v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v95, v104, 16);
                }
                while (v74);
              }
              else
              {
                v75 = 0;
              }

              objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", v75);
              v81 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = 0u;
              v92 = 0u;
              v93 = 0u;
              v94 = 0u;
              v82 = v72;
              v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
              if (v83)
              {
                v84 = v83;
                v85 = *(_QWORD *)v92;
                do
                {
                  for (k = 0; k != v84; ++k)
                  {
                    if (*(_QWORD *)v92 != v85)
                      objc_enumerationMutation(v82);
                    v87 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v91 + 1) + 8 * k)), "UTF8String");
                    objc_msgSend(v81, "appendBytes:length:", v87, strlen(v87) + 1);
                  }
                  v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v91, v103, 16);
                }
                while (v84);
              }

              ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v81);
            }
            else
            {
              v11[2](v11, 45, 0);
            }

          }
          else
          {
            fskit_std_log();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
              -[FSVolumeConnector otherAttributeOf:named:requestID:replyHandler:].cold.2();

            v11[2](v11, 70, 0);
          }

        }
        goto LABEL_42;
      }
      -[FSModuleVolume volume](v12, "volume");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "string");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v29 = v59;
    objc_msgSend(v59, "dataUsingEncoding:", 4);
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_25:
    v32 = (void *)v31;
    v11[2](v11, 0, v31);

LABEL_26:
LABEL_27:

    goto LABEL_28;
  }
  -[FSModuleVolume volume](v12, "volume");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "supportedVolumeCapabilities");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(v51, "capabilities");
LABEL_61:

  v21 = (void *)MEMORY[0x24BDBCE50];
  v20 = v55;
LABEL_18:
  objc_msgSend(v21, "dataWithInteger:", v20);
  v22 = objc_claimAutoreleasedReturnValue();
LABEL_19:
  v16 = (void *)v22;
  v11[2](v11, 0, v22);
LABEL_28:

LABEL_42:
}

- (void)setOtherAttributeOf:(id)a3 named:(id)a4 value:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  FSModuleVolume *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  _QWORD v25[4];
  FSModuleVolume *v26;
  id v27;
  FSVolumeConnector *v28;
  id v29;
  _QWORD block[4];
  FSModuleVolume *v31;
  id v32;
  id v33;
  FSVolumeConnector *v34;
  id v35;
  _QWORD v36[5];
  _BYTE buf[24];
  void *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  unint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_msgSend(v13, "string");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  fskit_std_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    *(_QWORD *)&buf[4] = "-[FSVolumeConnector setOtherAttributeOf:named:value:requestID:replyHandler:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v12;
    *(_WORD *)&buf[22] = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v14;
    v41 = 2048;
    v42 = a6;
    _os_log_debug_impl(&dword_23B2A6000, v17, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:name:%@:value:%@:reqID:%llu", buf, 0x34u);
  }

  v18 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v18, "getItemForFH:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (v16)
    {
      if (objc_msgSend(v16, "isEqual:", CFSTR("_N_SYNC")))
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        LODWORD(v38) = 0;
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke;
        v36[3] = &unk_250C32768;
        v36[4] = buf;
        -[FSVolumeConnector synchronize:](self, "synchronize:", v36);
        (*((void (**)(id, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, *(unsigned int *)(*(_QWORD *)&buf[8] + 24), 0, 0);
        _Block_object_dispose(buf, 8);
      }
      else if (objc_msgSend(v16, "isEqual:", CFSTR("_O_f_preallocate"))
             && -[FSModuleVolume supportsPreallocateOps](v18, "supportsPreallocateOps"))
      {
        -[FSModuleVolume volume](v18, "volume");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "queueForItem:", v19);
        v22 = objc_claimAutoreleasedReturnValue();

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_2;
        block[3] = &unk_250C32BD0;
        v31 = v18;
        v32 = v14;
        v35 = v15;
        v33 = v19;
        v34 = self;
        dispatch_async(v22, block);

      }
      else if (objc_msgSend(v16, "isEqual:", CFSTR("_S_f_vol_name"))
             && -[FSModuleVolume supportsVolumeRenameOps](v18, "supportsVolumeRenameOps"))
      {
        -[FSModuleVolume volume](self->_ourVolume, "volume");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "globalWorkQueue");
        v24 = objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_4;
        v25[3] = &unk_250C32C20;
        v26 = v18;
        v27 = v14;
        v28 = self;
        v29 = v15;
        dispatch_sync(v24, v25);

      }
      else
      {
        (*((void (**)(id, uint64_t, _QWORD, _QWORD))v15 + 2))(v15, 45, 0, 0);
      }
    }
    else
    {
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v15 + 2))(v15, 22, 0, 0);
    }
  }
  else
  {
    fskit_std_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector setOtherAttributeOf:named:value:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v15 + 2))(v15, 70, 0, 0);
  }

}

uint64_t __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke(uint64_t result, void *a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result;
    result = objc_msgSend(a2, "code");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v2 + 32) + 8) + 24) = result;
  }
  return result;
}

void __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void (*v3)(void);
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "length") <= 0xE7)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_7:
    v3();
    goto LABEL_10;
  }
  v4 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes");
  if ((*(_BYTE *)(v4 + 16) & 0x20) != 0)
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_7;
  }
  v5 = v4;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", *(_QWORD *)(a1 + 40));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "mutableBytes");
  +[FSVolume extentPackerForBuffer:bufLen:extentCount:](FSVolume, "extentPackerForBuffer:bufLen:extentCount:", v7 + 32, 192, v7 + 224);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)v5;
  v11 = *(_QWORD *)(v5 + 8);
  v12 = *(unsigned int *)(v5 + 16);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_3;
  v16[3] = &unk_250C32BA8;
  v16[4] = &v17;
  v16[5] = v7;
  objc_msgSend(v2, "preallocate:offset:length:flags:usingPacker:replyHandler:", v9, v10, v11, v12, v8, v16);
  v13 = (void *)v18[5];
  v14 = *(_QWORD *)(a1 + 64);
  if (v13)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v14 + 16))(v14, objc_msgSend(v13, "code"), 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "getFreeSpaceInVolume");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id, void *))(v14 + 16))(v14, 0, v6, v15);

  }
  _Block_object_dispose(&v17, 8);

LABEL_10:
}

void __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_3(uint64_t a1, uint64_t a2, id obj)
{
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  v6 = obj;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) = a2;

}

void __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__4;
  v21 = __Block_byref_object_dispose__4;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  +[FSFileName nameWithData:](FSFileName, "nameWithData:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_5;
  v10[3] = &unk_250C32BF8;
  v10[4] = &v11;
  v10[5] = &v17;
  objc_msgSend(v2, "setVolumeName:replyHandler:", v3, v10);

  v4 = (void *)v12[5];
  if (v4)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(v4, "code"), 0, 0);
  }
  else
  {
    v5 = v18[5];
    objc_msgSend(*(id *)(a1 + 48), "ourVolume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "volume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v5);

    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend((id)v18[5], "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, _QWORD))(v8 + 16))(v8, 0, v9, 0);

  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
}

void __76__FSVolumeConnector_setOtherAttributeOf_named_value_requestID_replyHandler___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  v8 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (void)volumeStatistics:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  FSModuleVolume *ourVolume;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  ourVolume = self->_ourVolume;
  v7 = (void (**)(id, _QWORD, void *))a5;
  -[FSModuleVolume volume](ourVolume, "volume");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volumeStatistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[FSModuleVolume volume](self->_ourVolume, "volume");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "volumeStatistics");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);

  }
  else
  {
    fskit_std_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FSVolumeConnector volumeStatistics:requestID:replyHandler:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    v7[2](v7, 45, 0);
  }
}

- (void)createIn:(id)a3 named:(id)a4 type:(int64_t)a5 attributes:(id)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  FSModuleVolume *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  FSModuleVolume *v26;
  id v27;
  id v28;
  FSVolumeConnector *v29;
  id v30;
  int64_t v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  fskit_std_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v33 = "-[FSVolumeConnector createIn:named:type:attributes:requestID:replyHandler:]";
    v34 = 2112;
    v35 = v14;
    v36 = 2112;
    v37 = v15;
    v38 = 2048;
    v39 = a7;
    _os_log_debug_impl(&dword_23B2A6000, v18, OS_LOG_TYPE_DEBUG, "%s:start:theDirectory:%@:named:%@:reqID:%llu", buf, 0x2Au);
  }

  v19 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v19, "getItemForFH:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[FSModuleVolume volume](v19, "volume");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "queueForItem:", v20);
    v22 = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke;
    block[3] = &unk_250C32C98;
    v25 = v16;
    v26 = v19;
    v27 = v15;
    v31 = a5;
    v28 = v20;
    v29 = self;
    v30 = v17;
    dispatch_async(v22, block);

  }
  else
  {
    fskit_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector createIn:named:type:attributes:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 70, 0, 0, 0, 0);
  }

}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  id v11;
  id v12;

  +[FSItemAttributes requestWithData:](FSItemSetAttributesRequest, "requestWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setType:", 1);
  objc_msgSend(*(id *)(a1 + 40), "volume");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2;
  v9[3] = &unk_250C32C70;
  v6 = *(_QWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 72);
  v8 = *(int8x16_t *)(a1 + 56);
  v7 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v11 = *(id *)(a1 + 40);
  objc_msgSend(v3, "createItemNamed:type:inDirectory:attributes:replyHandler:", v4, v6, v5, v2, v9);

}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "code");
    fskit_std_log();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v11 == 17)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2_cold_2(v10, v13);
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v39 = "-[FSVolumeConnector createIn:named:type:attributes:requestID:replyHandler:]_block_invoke_2";
      v40 = 2112;
      v41 = v22;
      _os_log_impl(&dword_23B2A6000, v13, OS_LOG_TYPE_INFO, "%s:error:%@", buf, 0x16u);

    }
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(v10, "code"), 0, 0, 0, 0);
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "insertIntoFHCache:", v7);
    objc_msgSend(*(id *)(a1 + 48), "volume");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queueForItem:", v7);
    v17 = objc_claimAutoreleasedReturnValue();

    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_311;
    v31[3] = &unk_250C32C48;
    v32 = *(id *)(a1 + 48);
    v33 = v14;
    v37 = *(id *)(a1 + 56);
    v34 = v15;
    v18 = v7;
    v19 = *(_QWORD *)(a1 + 32);
    v35 = v18;
    v36 = v19;
    v20 = v15;
    v21 = v14;
    dispatch_async(v17, v31);

  }
  else
  {
    fskit_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2_cold_1(v23, v24, v25, v26, v27, v28, v29, v30);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), 5, 0, 0, 0, 0);
  }

}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_311(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  if (objc_msgSend(*(id *)(a1 + 32), "spotlightIsEnabled") && *(_QWORD *)(a1 + 40))
  {
    fskit_std_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_311_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 56), "fileHandle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 64), "getFreeSpaceInVolume");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, uint64_t, void *, uint64_t, void *))(v10 + 16))(v10, 0, v11, v12, v13, v14);

}

- (void)lookupIn:(id)a3 name:(id)a4 flags:(unsigned int)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  id v11;
  id v12;
  FSModuleVolume *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[5];
  FSModuleVolume *v19;
  id v20;
  id v21;
  id v22;
  unsigned int v23;

  v11 = a4;
  v12 = a7;
  v13 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v13, "getItemForFH:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[FSModuleVolume volume](v13, "volume");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "queueForItem:", v14);
    v16 = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke;
    block[3] = &unk_250C32D38;
    v22 = v12;
    block[4] = self;
    v19 = v13;
    v23 = a5;
    v20 = v11;
    v21 = v14;
    dispatch_async(v16, block);

  }
  else
  {
    fskit_std_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector lookupIn:name:flags:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 70, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
  }

}

void __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *, void *);
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  int v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__4;
  v32 = __Block_byref_object_dispose__4;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_2;
  v15 = &unk_250C32D10;
  v2 = *(id *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v20 = v2;
  v16 = v3;
  v17 = v4;
  v21 = &v24;
  v22 = &v28;
  v23 = *(_DWORD *)(a1 + 72);
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v5 = _Block_copy(&v12);
  if ((*(_BYTE *)(a1 + 75) & 0x10) != 0
    && objc_msgSend(*(id *)(a1 + 40), "supportsKOIOOps", v12, v13, v14, v15, v16, v17, v18))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 48);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v29[5];
    v29[5] = v6;

    v8 = objc_msgSend(objc_retainAutorelease((id)v29[5]), "mutableBytes");
    v9 = objc_msgSend((id)v29[5], "length");
    +[FSVolume extentPackerForBuffer:bufLen:extentCount:](FSVolume, "extentPackerForBuffer:bufLen:extentCount:", v8, v9, v25 + 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "volume");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lookupItemNamed:inDirectory:usingPacker:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v10, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "volume", v12, v13, v14, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lookupItemNamed:inDirectory:replyHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5);
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

}

void __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  id v26;
  id v27;
  _QWORD block[4];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD v36[5];
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD v41[3];
  int v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), objc_msgSend(v9, "code"), 0xFFFFFFFFLL, 0, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "insertIntoFHCache:", v7);
    v12 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    if ((_DWORD)v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "subdataWithRange:", 0, 24 * v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy__4;
    v45[4] = __Block_byref_object_dispose__4;
    v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__4;
    v43[4] = __Block_byref_object_dispose__4;
    v44 = 0;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v42 = -1;
    v14 = "@(#)PROGRAM:FSKit  PROJECT:FSKit-1\n" + 16;
    v15 = MEMORY[0x24BDAC760];
    if ((*(_BYTE *)(a1 + 91) & 0x20) != 0)
    {
      v16 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(*(id *)(a1 + 48), "string");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("._%@"), v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "volume");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[FSFileName nameWithString:](FSFileName, "nameWithString:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2] = __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_3;
      v36[3] = &unk_250C32CC0;
      v39 = v45;
      v40 = v43;
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(a1 + 40);
      v38 = v41;
      v36[4] = v21;
      v23 = *(_QWORD *)(a1 + 56);
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v37 = v22;
      objc_msgSend(v19, "lookupItemNamed:inDirectory:replyHandler:", v20, v23, v36);

      v14 = "t  PROJECT:FSKit-1\n";
      v15 = MEMORY[0x24BDAC760];
    }
    objc_msgSend(*(id *)(a1 + 40), "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "queueForItem:", v7);
    v25 = objc_claimAutoreleasedReturnValue();

    block[0] = v15;
    block[1] = *((_QWORD *)v14 + 4);
    block[2] = __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_4;
    block[3] = &unk_250C32CE8;
    v32 = *(id *)(a1 + 64);
    v33 = v41;
    v29 = v7;
    v30 = v11;
    v34 = v45;
    v35 = v43;
    v31 = v13;
    v26 = v13;
    v27 = v11;
    dispatch_async(v25, block);

    _Block_object_dispose(v41, 8);
    _Block_object_dispose(v43, 8);

    _Block_object_dispose(v45, 8);
  }

}

void __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (a4)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(a4, "code");
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", v10);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(a1 + 40), "insertIntoFHCache:", v10);
  }

}

void __64__FSVolumeConnector_lookupIn_name_flags_requestID_replyHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "fileHandle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v6 = *(_QWORD *)(v5 + 40);
  if (v6)
  {
    objc_msgSend(*(id *)(v5 + 40), "fileHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  (*(void (**)(uint64_t, _QWORD, uint64_t, id, uint64_t, void *, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 16))(v2, 0, v3, v8, v4, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), 0, *(_QWORD *)(a1 + 48), 0);
  if (v6)

}

- (void)removeDirectory:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  FSModuleVolume *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD block[4];
  FSModuleVolume *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  FSVolumeConnector *v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  int v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  fskit_std_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v36 = "-[FSVolumeConnector removeDirectory:from:named:usingFlags:requestID:replyHandler:]";
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v14;
    v41 = 2112;
    v42 = v16;
    v43 = 1024;
    v44 = a6;
    v45 = 2048;
    v46 = a7;
    _os_log_debug_impl(&dword_23B2A6000, v18, OS_LOG_TYPE_DEBUG, "%s:start:parentDirectory:%@:theDirectory:%@:name:%@:flags:%d:reqID:%llu", buf, 0x3Au);
  }

  v19 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v19, "getItemForFH:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[FSModuleVolume getItemForFH:](v19, "getItemForFH:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[FSModuleVolume volume](v19, "volume");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "queueForItem:", v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke;
      block[3] = &unk_250C32DB0;
      v28 = v19;
      v29 = v20;
      v30 = v23;
      v34 = v17;
      v31 = v16;
      v32 = v21;
      v33 = self;
      v24 = v23;
      dispatch_async(v24, block);

    }
    else
    {
      fskit_std_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector removeDirectory:from:named:usingFlags:requestID:replyHandler:].cold.2();

      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v17 + 2))(v17, 70, 0, 0);
    }

  }
  else
  {
    fskit_std_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector removeDirectory:from:named:usingFlags:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v17 + 2))(v17, 70, 0, 0);
  }

}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueForItem:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3 == *(NSObject **)(a1 + 48))
  {
    fskit_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_315;
    v6[3] = &unk_250C32D88;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    v4 = *(id *)(a1 + 80);
    v11 = *(_QWORD *)(a1 + 72);
    v12 = v4;
    dispatch_sync(v3, v6);

  }
}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_315(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  int8x16_t v7;
  _QWORD v8[4];
  int8x16_t v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_2;
  v8[3] = &unk_250C32D60;
  v10 = *(id *)(a1 + 72);
  v7 = *(int8x16_t *)(a1 + 56);
  v6 = (id)v7.i64[0];
  v9 = vextq_s8(v7, v7, 8uLL);
  objc_msgSend(v2, "removeItem:named:fromDirectory:replyHandler:", v3, v4, v5, v8);

}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(v3);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v3, "code"), 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "getFreeSpaceInVolume");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v6 + 16))(v6, 0, v5, v7);

  }
}

- (void)removeItem:(id)a3 from:(id)a4 named:(id)a5 usingFlags:(int)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  FSModuleVolume *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD block[4];
  FSModuleVolume *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  FSVolumeConnector *v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  int v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  fskit_std_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v36 = "-[FSVolumeConnector removeItem:from:named:usingFlags:requestID:replyHandler:]";
    v37 = 2112;
    v38 = v14;
    v39 = 2112;
    v40 = v15;
    v41 = 2112;
    v42 = v16;
    v43 = 1024;
    v44 = a6;
    v45 = 2048;
    v46 = a7;
    _os_log_debug_impl(&dword_23B2A6000, v18, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:theDirectory:%@:name:%@:flags:%d:reqID:%llu", buf, 0x3Au);
  }

  v19 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v19, "getItemForFH:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    -[FSModuleVolume getItemForFH:](v19, "getItemForFH:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[FSModuleVolume volume](v19, "volume");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "queueForItem:", v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke;
      block[3] = &unk_250C32DB0;
      v28 = v19;
      v29 = v21;
      v30 = v23;
      v34 = v17;
      v31 = v16;
      v32 = v20;
      v33 = self;
      v24 = v23;
      dispatch_async(v24, block);

    }
    else
    {
      fskit_std_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector removeItem:from:named:usingFlags:requestID:replyHandler:].cold.2();

      (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 70, 0, 0, 0);
    }

  }
  else
  {
    fskit_std_log();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector removeItem:from:named:usingFlags:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v17 + 2))(v17, 70, 0, 0, 0);
  }

}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueForItem:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3 == *(NSObject **)(a1 + 48))
  {
    fskit_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_316;
    v6[3] = &unk_250C32D88;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    v9 = *(id *)(a1 + 56);
    v10 = *(id *)(a1 + 64);
    v4 = *(id *)(a1 + 80);
    v11 = *(_QWORD *)(a1 + 72);
    v12 = v4;
    dispatch_sync(v3, v6);

  }
}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_316(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_2;
  v8[3] = &unk_250C32DD8;
  v6 = *(id *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v8[4] = v7;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "removeItem:named:fromDirectory:replyHandler:", v3, v4, v5, v8);

}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    fskit_std_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(v3);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(v3, "code"), 0, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "getFreeSpaceInVolume");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *, void *))(v7 + 16))(v7, 0, v6, v5, v8);

  }
}

- (void)reclaim:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  FSModuleVolume *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  FSModuleVolume *v16;
  id v17;
  FSVolumeConnector *v18;
  id v19;

  v7 = a3;
  v8 = a5;
  fskit_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector reclaim:requestID:replyHandler:].cold.2();

  v10 = self->_ourVolume;
  -[FSModuleVolume getAndRemoveItemForFH:](v10, "getAndRemoveItemForFH:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[FSModuleVolume volume](v10, "volume");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queueForItem:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke;
    v15[3] = &unk_250C32C20;
    v16 = v10;
    v17 = v11;
    v18 = self;
    v19 = v8;
    dispatch_async(v13, v15);

  }
  else
  {
    fskit_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector reclaim:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 70, 0);
  }

}

void __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke_2;
  v5[3] = &unk_250C32E00;
  v4 = *(id *)(a1 + 56);
  v5[4] = *(_QWORD *)(a1 + 48);
  v6 = v4;
  objc_msgSend(v2, "reclaimItem:replyHandler:", v3, v5);

}

void __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    fskit_std_log();
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke_2_cold_1(v3, v4);

    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v3, "code"), 0);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "getFreeSpaceInVolume");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);

  }
}

- (void)open:(id)a3 withMode:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  FSModuleVolume *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  int v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  fskit_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v33 = "-[FSVolumeConnector open:withMode:requestID:replyHandler:]";
    v34 = 2112;
    v35 = v10;
    v36 = 1024;
    v37 = a4;
    v38 = 2048;
    v39 = a5;
    _os_log_debug_impl(&dword_23B2A6000, v12, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:mode:%d:reqID:%llu", buf, 0x26u);
  }

  v13 = self->_ourVolume;
  if (-[FSModuleVolume supportsOpenCloseOps](v13, "supportsOpenCloseOps"))
  {
    -[FSModuleVolume volume](v13, "volume");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v13, "getItemForFH:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[FSModuleVolume volume](v13, "volume");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queueForItem:", v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke;
      v27[3] = &unk_250C32E28;
      v28 = v14;
      v29 = v15;
      v31 = a4;
      v30 = v11;
      dispatch_async(v17, v27);

    }
    else
    {
      fskit_std_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector open:withMode:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t))v11 + 2))(v11, 70);
    }

  }
  else
  {
    fskit_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector open:withMode:requestID:replyHandler:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 45);
  }

}

void __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(int *)(a1 + 56);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2;
  v4[3] = &unk_250C31EC8;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "openItem:withModes:replyHandler:", v2, v3, v4);

}

void __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (char *)v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2_cold_2(v3, v5);

    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "code"));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }

}

- (void)close:(id)a3 keepingMode:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  FSModuleVolume *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  int v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  unint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  fskit_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v33 = "-[FSVolumeConnector close:keepingMode:requestID:replyHandler:]";
    v34 = 2112;
    v35 = v10;
    v36 = 1024;
    v37 = a4;
    v38 = 2048;
    v39 = a5;
    _os_log_debug_impl(&dword_23B2A6000, v12, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:mode:%d:reqID:%llu", buf, 0x26u);
  }

  v13 = self->_ourVolume;
  if (-[FSModuleVolume supportsOpenCloseOps](v13, "supportsOpenCloseOps"))
  {
    -[FSModuleVolume volume](v13, "volume");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v13, "getItemForFH:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[FSModuleVolume volume](v13, "volume");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "queueForItem:", v15);
      v17 = objc_claimAutoreleasedReturnValue();

      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke;
      v27[3] = &unk_250C32E28;
      v28 = v14;
      v29 = v15;
      v31 = a4;
      v30 = v11;
      dispatch_async(v17, v27);

    }
    else
    {
      fskit_std_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector close:keepingMode:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t))v11 + 2))(v11, 70);
    }

  }
  else
  {
    fskit_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector close:keepingMode:requestID:replyHandler:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);

    (*((void (**)(id, uint64_t))v11 + 2))(v11, 45);
  }

}

void __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(int *)(a1 + 56);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2;
  v4[3] = &unk_250C31EC8;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v1, "closeItem:keepingModes:replyHandler:", v2, v3, v4);

}

void __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  fskit_std_log();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (char *)v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2_cold_2(v3, v5);

    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "code"));
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }

}

- (void)writeTo:(id)a3 atOffset:(unint64_t)a4 fromBuffer:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  FSModuleVolume *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  FSVolumeConnector *v34;
  id v35;
  unint64_t v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  fskit_std_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v38 = "-[FSVolumeConnector writeTo:atOffset:fromBuffer:requestID:replyHandler:]";
    v39 = 2112;
    v40 = v12;
    v41 = 2048;
    v42 = a4;
    v43 = 2112;
    v44 = v13;
    v45 = 2048;
    v46 = a6;
    _os_log_debug_impl(&dword_23B2A6000, v15, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:atOffset:%llu:buffer:%@:reqID:%llu", buf, 0x34u);
  }

  v16 = self->_ourVolume;
  if (-[FSModuleVolume supportsReadWriteOps](v16, "supportsReadWriteOps"))
  {
    -[FSModuleVolume volume](v16, "volume");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v16, "getItemForFH:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      -[FSModuleVolume volume](v16, "volume");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "queueForItem:", v18);
      v20 = objc_claimAutoreleasedReturnValue();

      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke;
      v30[3] = &unk_250C32E78;
      v31 = v17;
      v32 = v13;
      v33 = v18;
      v36 = a4;
      v34 = self;
      v35 = v14;
      dispatch_async(v20, v30);

    }
    else
    {
      fskit_std_log();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector writeTo:atOffset:fromBuffer:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v14 + 2))(v14, 70, 0, 0);
    }

  }
  else
  {
    fskit_std_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector writeTo:atOffset:fromBuffer:requestID:replyHandler:].cold.2(v21, v22, v23, v24, v25, v26, v27, v28);

    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v14 + 2))(v14, 45, 0, 0);
  }

}

void __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2;
  v7[3] = &unk_250C32E50;
  v5 = *(_QWORD *)(a1 + 72);
  v6 = *(id *)(a1 + 64);
  v7[4] = *(_QWORD *)(a1 + 56);
  v8 = v6;
  objc_msgSend(v2, "writeContents:toFile:atOffset:replyHandler:", v3, v4, v5, v7);

}

void __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  char *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (char *)v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2_cold_2(v5, v7);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v5, "code"), 0, 0);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2_cold_1();

    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "getFreeSpaceInVolume");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, uint64_t, void *))(v8 + 16))(v8, 0, a2, v9);

  }
}

- (void)readFrom:(id)a3 atOffset:(unint64_t)a4 intoBuffer:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  FSModuleVolume *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  unint64_t v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  unint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  fskit_std_log();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v40 = "-[FSVolumeConnector readFrom:atOffset:intoBuffer:requestID:replyHandler:]";
    v41 = 2112;
    v42 = v12;
    v43 = 2048;
    v44 = a4;
    v45 = 2112;
    v46 = v13;
    v47 = 2048;
    v48 = a6;
    _os_log_debug_impl(&dword_23B2A6000, v15, OS_LOG_TYPE_DEBUG, "%s:start:theFile:%@:atOffset:%llu:buffer:%@:reqID:%llu", buf, 0x34u);
  }

  v16 = self->_ourVolume;
  if (-[FSModuleVolume supportsReadWriteOps](v16, "supportsReadWriteOps"))
  {
    -[FSModuleVolume volume](v16, "volume");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v16, "getItemForFH:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", objc_msgSend(v13, "length"));
      -[FSModuleVolume volume](v16, "volume");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "queueForItem:", v18);
      v21 = objc_claimAutoreleasedReturnValue();

      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke;
      v32[3] = &unk_250C32EC8;
      v33 = v17;
      v34 = v18;
      v38 = a4;
      v35 = v13;
      v36 = v19;
      v37 = v14;
      v22 = v19;
      dispatch_async(v21, v32);

    }
    else
    {
      fskit_std_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector readFrom:atOffset:intoBuffer:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t, _QWORD))v14 + 2))(v14, 70, 0);
    }

  }
  else
  {
    fskit_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector readFrom:atOffset:intoBuffer:requestID:replyHandler:].cold.2(v23, v24, v25, v26, v27, v28, v29, v30);

    (*((void (**)(id, uint64_t, _QWORD))v14 + 2))(v14, 45, 0);
  }

}

void __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 72);
  v5 = objc_msgSend(*(id *)(a1 + 48), "length");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2;
  v7[3] = &unk_250C32EA0;
  v6 = *(_QWORD *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "readFromFile:offset:length:intoBuffer:replyHandler:", v3, v4, v5, v6, v7);

}

void __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  char *v6;
  NSObject *v7;

  v5 = a3;
  if (v5)
  {
    fskit_std_log();
    v6 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
      __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2_cold_2(v5, v6);

    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v5, "code"), 0);
  }
  else
  {
    memcpy((void *)objc_msgSend(*(id *)(a1 + 32), "mutableBytes"), (const void *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "bytes"), objc_msgSend(*(id *)(a1 + 32), "length"));
    fskit_std_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2_cold_1();

    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, a2);
  }

}

- (void)setFileAttributesOf:(id)a3 to:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  FSModuleVolume *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  FSModuleVolume *v21;
  id v22;
  FSVolumeConnector *v23;
  id v24;
  id v25;
  _BYTE location[12];
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  fskit_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[FSVolumeConnector setFileAttributesOf:to:requestID:replyHandler:]";
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    v31 = 2048;
    v32 = a5;
    _os_log_debug_impl(&dword_23B2A6000, v13, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:setAttrs:%@:reqID:%llu", location, 0x2Au);
  }

  v14 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v14, "getItemForFH:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_initWeak((id *)location, self);
    -[FSModuleVolume volume](v14, "volume");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "queueForItem:", v15);
    v17 = objc_claimAutoreleasedReturnValue();

    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke;
    v19[3] = &unk_250C32F18;
    v20 = v11;
    v21 = v14;
    v22 = v15;
    v24 = v12;
    objc_copyWeak(&v25, (id *)location);
    v23 = self;
    dispatch_async(v17, v19);
    objc_destroyWeak(&v25);

    objc_destroyWeak((id *)location);
  }
  else
  {
    fskit_std_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector setFileAttributesOf:to:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v12 + 2))(v12, 70, 0, 0, 0);
  }

}

void __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  +[FSItemAttributes requestWithData:](FSItemSetAttributesRequest, "requestWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "volume");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke_2;
  v7[3] = &unk_250C32EF0;
  v10 = *(id *)(a1 + 64);
  objc_copyWeak(&v11, (id *)(a1 + 72));
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "setAttributes:onItem:replyHandler:", v2, v4, v7);

  objc_destroyWeak(&v11);
}

void __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  unint64_t *WeakRetained;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fskit_std_log();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke_2_cold_1(v6, v7);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v6, "code"), 0, 0, 0);
  }
  else
  {
    WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 56));
    v9 = WeakRetained;
    if (WeakRetained)
    {
      v10 = WeakRetained + 2;
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 + 1, v10));
      objc_msgSend(v5, "setAttributeSeqno:");
    }
    if ((*(_BYTE *)(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes") + 8) & 0x40) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "getFreeSpaceInVolume");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "attrsData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, uint64_t, void *))(v13 + 16))(v13, 0, v14, objc_msgSend(v5, "size"), v12);

  }
}

- (void)fileAttributes:(id)a3 requestedAttributes:(unint64_t)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v9;
  id v10;
  FSModuleVolume *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  FSModuleVolume *v17;
  id v18;
  id v19;
  id v20[2];
  id location;

  v9 = a3;
  v10 = a6;
  v11 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v11, "getItemForFH:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_initWeak(&location, self);
    -[FSModuleVolume volume](v11, "volume");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queueForItem:", v12);
    v14 = objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __79__FSVolumeConnector_fileAttributes_requestedAttributes_requestID_replyHandler___block_invoke;
    v16[3] = &unk_250C32F68;
    v20[1] = (id)a4;
    v17 = v11;
    v18 = v12;
    v19 = v10;
    objc_copyWeak(v20, &location);
    dispatch_async(v14, v16);
    objc_destroyWeak(v20);

    objc_destroyWeak(&location);
  }
  else
  {
    fskit_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector fileAttributes:requestedAttributes:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD))v10 + 2))(v10, 70, 0);
  }

}

void __79__FSVolumeConnector_fileAttributes_requestedAttributes_requestID_replyHandler___block_invoke(uint64_t a1)
{
  FSItemGetAttributesRequest *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = -[FSItemGetAttributesRequest initWithWantedLIAttributes:]([FSItemGetAttributesRequest alloc], "initWithWantedLIAttributes:", *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "volume");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __79__FSVolumeConnector_fileAttributes_requestedAttributes_requestID_replyHandler___block_invoke_2;
  v5[3] = &unk_250C32F40;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_copyWeak(&v7, (id *)(a1 + 56));
  objc_msgSend(v3, "getAttributes:ofItem:replyHandler:", v2, v4, v5);

  objc_destroyWeak(&v7);
}

void __79__FSVolumeConnector_fileAttributes_requestedAttributes_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  unint64_t *WeakRetained;
  unint64_t *v6;
  unint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a3, "code"), 0);
  }
  else
  {
    WeakRetained = (unint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
    v6 = WeakRetained;
    if (WeakRetained)
    {
      v7 = WeakRetained + 2;
      do
        v8 = __ldaxr(v7);
      while (__stlxr(v8 + 1, v7));
      objc_msgSend(v11, "setAttributeSeqno:");
    }
    v9 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "attrsData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v10);

  }
}

- (void)readDirectory:(id)a3 withAttr:(BOOL)a4 requestedAttributes:(unint64_t)a5 intoBuffer:(id)a6 cookie:(unint64_t)a7 verifier:(unint64_t)a8 requestID:(unint64_t)a9 replyHandler:(id)a10
{
  _BOOL4 v13;
  id v16;
  id v17;
  FSModuleVolume *v18;
  void *v19;
  FSItemGetAttributesRequest *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  FSItemGetAttributesRequest *v24;
  _QWORD v25[4];
  id v26;
  FSModuleVolume *v27;
  id v28;
  FSItemGetAttributesRequest *v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  BOOL v33;

  v13 = a4;
  v16 = a6;
  v17 = a10;
  v18 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v18, "getItemForFH:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    if (a7 == -1)
    {
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v17 + 2))(v17, 4294966295, 0, 0);
    }
    else
    {
      if (v13)
      {
        v20 = -[FSItemGetAttributesRequest initWithWantedLIAttributes:]([FSItemGetAttributesRequest alloc], "initWithWantedLIAttributes:", a5);
        -[FSItemGetAttributesRequest setWantedAttributes:](v20, "setWantedAttributes:", 8);
      }
      else
      {
        v20 = 0;
      }
      -[FSModuleVolume volume](v18, "volume");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "queueForItem:", v19);
      v23 = objc_claimAutoreleasedReturnValue();

      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke;
      v25[3] = &unk_250C32FB8;
      v26 = v16;
      v33 = v13;
      v27 = v18;
      v31 = a7;
      v32 = a8;
      v28 = v19;
      v29 = v20;
      v30 = v17;
      v24 = v20;
      dispatch_sync(v23, v25);

    }
  }
  else
  {
    fskit_std_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v17 + 2))(v17, 70, 0, 0);
  }

}

void __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;

  v17 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = &v17;
  v2 = objc_msgSend(*(id *)(a1 + 32), "mutableBytes");
  v3 = objc_msgSend(*(id *)(a1 + 32), "length");
  +[FSVolume newDirEntryPacker:bufLen:bytesPacked:withAttr:](FSVolume, "newDirEntryPacker:bufLen:bytesPacked:withAttr:", v2, v3, v14[3], *(unsigned __int8 *)(a1 + 88));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 80);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2;
  v10[3] = &unk_250C32F90;
  v11 = *(id *)(a1 + 64);
  v12 = &v13;
  objc_msgSend(v5, "enumerateDirectory:startingAtCookie:verifier:providingAttributes:usingBlock:replyHandler:", v8, v7, v6, v9, v4, v10);

  _Block_object_dispose(&v13, 8);
}

void __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "domain");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 == CFSTR("FSVolumeErrorDomain"))
    {
      v13 = objc_msgSend(v6, "code");

      if (v13 == 1)
      {
        fskit_std_log();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2_cold_1(v14, v15, v16);

        v9 = *(_QWORD *)(a1 + 32);
        v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
        v12 = 4294966294;
        goto LABEL_13;
      }
    }
    else
    {

    }
    fskit_std_log();
    v17 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2_cold_2(v6, v17);

    v18 = *(_QWORD *)(a1 + 32);
    v12 = objc_msgSend(v6, "code");
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16);
    v9 = v18;
LABEL_13:
    v10 = 0;
    v19 = 0;
    goto LABEL_16;
  }
  v9 = *(_QWORD *)(a1 + 32);
  v10 = **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 16);
  if (v10)
    v12 = 0;
  else
    v12 = 4294966295;
  v19 = a2;
LABEL_16:
  v11(v9, v12, v10, v19);

}

- (void)readDirectory:(id)a3 intoBuffer:(id)a4 cookie:(unint64_t)a5 verifier:(unint64_t)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v14 = a8;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __85__FSVolumeConnector_readDirectory_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke;
  v16[3] = &unk_250C32FE0;
  v17 = v14;
  v15 = v14;
  -[FSVolumeConnector readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:](self, "readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:", a3, 0, 0, a4, a5, a6, a7, v16);

}

uint64_t __85__FSVolumeConnector_readDirectory_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)readDirectory:(id)a3 requestedAttributes:(unint64_t)a4 intoBuffer:(id)a5 cookie:(unint64_t)a6 verifier:(unint64_t)a7 requestID:(unint64_t)a8 replyHandler:(id)a9
{
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;

  v16 = a9;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __105__FSVolumeConnector_readDirectory_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke;
  v18[3] = &unk_250C32FE0;
  v19 = v16;
  v17 = v16;
  -[FSVolumeConnector readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:](self, "readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:", a3, 1, a4, a5, a6, a7, a8, v18);

}

uint64_t __105__FSVolumeConnector_readDirectory_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)readSymbolicLinkOf:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  FSModuleVolume *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[4];
  FSModuleVolume *v16;
  id v17;
  FSVolumeConnector *v18;
  id v19;

  v7 = a3;
  v8 = a5;
  fskit_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector readSymbolicLinkOf:requestID:replyHandler:].cold.2();

  v10 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v10, "getItemForFH:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[FSModuleVolume volume](v10, "volume");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "queueForItem:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke;
    v15[3] = &unk_250C32C20;
    v16 = v10;
    v17 = v11;
    v18 = self;
    v19 = v8;
    dispatch_async(v13, v15);

  }
  else
  {
    fskit_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector readSymbolicLinkOf:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD))v8 + 2))(v8, 70, 0, 0);
  }

}

void __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int8x16_t v5;
  _QWORD v6[4];
  int8x16_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2;
  v6[3] = &unk_250C33008;
  v8 = *(id *)(a1 + 56);
  v5 = *(int8x16_t *)(a1 + 40);
  v4 = (id)v5.i64[0];
  v7 = vextq_s8(v5, v5, 8uLL);
  objc_msgSend(v2, "readSymbolicLink:replyHandler:", v3, v6);

}

void __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fskit_std_log();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2_cold_2(v6, v7);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(v6, "code"), 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    fskit_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2_cold_1();

    v10 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v5, "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *))(v10 + 16))(v10, 0, v11, v8);

  }
}

- (void)makeSymlinkIn:(id)a3 named:(id)a4 contents:(id)a5 attributes:(id)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  FSModuleVolume *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  id v27;
  FSModuleVolume *v28;
  id v29;
  id v30;
  FSVolumeConnector *v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  fskit_std_log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v34 = "-[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:]";
    v35 = 2112;
    v36 = v14;
    v37 = 2112;
    v38 = v15;
    v39 = 2112;
    v40 = v16;
    v41 = 2112;
    v42 = v17;
    v43 = 2048;
    v44 = a7;
    _os_log_debug_impl(&dword_23B2A6000, v19, OS_LOG_TYPE_DEBUG, "%s:start:theDirectory:%@:name:%@:contents:%@:setAttrs:%@:reqID:%llu", buf, 0x3Eu);
  }

  v20 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v20, "getItemForFH:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[FSModuleVolume volume](v20, "volume");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "queueForItem:", v21);
    v23 = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke;
    block[3] = &unk_250C33030;
    v26 = v17;
    v27 = v16;
    v28 = v20;
    v29 = v15;
    v30 = v21;
    v31 = self;
    v32 = v18;
    dispatch_async(v23, block);

  }
  else
  {
    fskit_std_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v18 + 2))(v18, 70, 0, 0, 0, 0);
  }

}

void __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  FSFileName *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  int8x16_t v8;
  _QWORD v9[4];
  int8x16_t v10;
  id v11;
  id v12;

  +[FSItemAttributes requestWithData:](FSItemSetAttributesRequest, "requestWithData:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[FSFileName initWithData:]([FSFileName alloc], "initWithData:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "volume");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke_2;
  v9[3] = &unk_250C32C70;
  v12 = *(id *)(a1 + 80);
  v8 = *(int8x16_t *)(a1 + 64);
  v7 = (id)v8.i64[0];
  v10 = vextq_s8(v8, v8, 8uLL);
  v11 = *(id *)(a1 + 48);
  objc_msgSend(v4, "createSymbolicLinkNamed:inDirectory:attributes:linkContents:replyHandler:", v5, v6, v2, v3, v9);

}

void __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "code");
    fskit_std_log();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (char *)v10;
    if (v9 == 17)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke_2_cold_1(v8, v11);
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v19 = 136315394;
      v20 = "-[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:]_block_invoke_2";
      v21 = 1024;
      LODWORD(v22) = objc_msgSend(v8, "code");
      _os_log_impl(&dword_23B2A6000, (os_log_t)v11, OS_LOG_TYPE_INFO, "%s:reply:error:%d", (uint8_t *)&v19, 0x12u);
    }

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(v8, "code"), 0, 0, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "insertIntoFHCache:", v6);
    fskit_std_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "fileHandle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315906;
      v20 = "-[FSVolumeConnector makeSymlinkIn:named:contents:attributes:requestID:replyHandler:]_block_invoke";
      v21 = 2112;
      v22 = v13;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v12;
      _os_log_debug_impl(&dword_23B2A6000, v14, OS_LOG_TYPE_DEBUG, "%s:reply:error:0:directoryAttrs:%@:theItem:%@:theAttrs:%@", (uint8_t *)&v19, 0x2Au);

    }
    v15 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v6, "fileHandle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getFreeSpaceInVolume");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *, void *, void *))(v15 + 16))(v15, 0, v13, v16, v12, v17);

  }
}

- (void)makeLinkOf:(id)a3 named:(id)a4 inDirectory:(id)a5 requestID:(unint64_t)a6 replyHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  FSModuleVolume *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  _QWORD block[4];
  FSModuleVolume *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  FSVolumeConnector *v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  unint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  fskit_std_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v34 = "-[FSVolumeConnector makeLinkOf:named:inDirectory:requestID:replyHandler:]";
    v35 = 2112;
    v36 = v12;
    v37 = 2112;
    v38 = v13;
    v39 = 2112;
    v40 = v14;
    v41 = 2048;
    v42 = a6;
    _os_log_debug_impl(&dword_23B2A6000, v16, OS_LOG_TYPE_DEBUG, "%s:start:targetFile:%@:name:%@:theDirectory:%@:reqID:%llu", buf, 0x34u);
  }

  v17 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v17, "getItemForFH:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    -[FSModuleVolume getItemForFH:](v17, "getItemForFH:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      -[FSModuleVolume volume](v17, "volume");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "queueForItem:", v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke;
      block[3] = &unk_250C32DB0;
      v26 = v17;
      v27 = v19;
      v28 = v21;
      v32 = v15;
      v29 = v18;
      v30 = v13;
      v31 = self;
      v22 = v21;
      dispatch_async(v22, block);

    }
    else
    {
      fskit_std_log();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector makeLinkOf:named:inDirectory:requestID:replyHandler:].cold.2();

      (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, 70, 0, 0, 0);
    }

  }
  else
  {
    fskit_std_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector makeLinkOf:named:inDirectory:requestID:replyHandler:].cold.1();

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v15 + 2))(v15, 70, 0, 0, 0);
  }

}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueForItem:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3 == *(NSObject **)(a1 + 48))
  {
    fskit_std_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  }
  else
  {
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_325;
    v6[3] = &unk_250C32D88;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 56);
    v9 = *(id *)(a1 + 64);
    v10 = *(id *)(a1 + 40);
    v4 = *(id *)(a1 + 80);
    v11 = *(_QWORD *)(a1 + 72);
    v12 = v4;
    dispatch_sync(v3, v6);

  }
}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_325(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_2;
  v8[3] = &unk_250C33058;
  v6 = *(id *)(a1 + 72);
  v7 = *(_QWORD *)(a1 + 64);
  v11 = v6;
  v8[4] = v7;
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "createLinkToItem:named:inDirectory:replyHandler:", v3, v4, v5, v8);

}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    fskit_std_log();
    v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
      __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_2_cold_1(v4, v5);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(v4, "code"), 0, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "getFreeSpaceInVolume");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *, void *))(v8 + 16))(v8, 0, v7, v6, v9);

  }
}

- (void)xattrOf:(id)a3 named:(id)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  FSModuleVolume *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  fskit_std_log();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v34 = "-[FSVolumeConnector xattrOf:named:requestID:replyHandler:]";
    v35 = 2112;
    v36 = v10;
    v37 = 2112;
    v38 = v11;
    v39 = 2048;
    v40 = a5;
    _os_log_debug_impl(&dword_23B2A6000, v13, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:name:%@:reqID:%llu", buf, 0x2Au);
  }

  v14 = self->_ourVolume;
  if (-[FSModuleVolume supportsXattrOps](v14, "supportsXattrOps"))
  {
    -[FSModuleVolume volume](v14, "volume");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v14, "getItemForFH:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[FSModuleVolume volume](v14, "volume");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "queueForItem:", v16);
      v18 = objc_claimAutoreleasedReturnValue();

      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke;
      v28[3] = &unk_250C330A8;
      v29 = v15;
      v30 = v11;
      v31 = v16;
      v32 = v12;
      dispatch_async(v18, v28);

    }
    else
    {
      fskit_std_log();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector xattrOf:named:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 70, 0);
    }

  }
  else
  {
    fskit_std_log();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector xattrOf:named:requestID:replyHandler:].cold.2(v19, v20, v21, v22, v23, v24, v25, v26);

    (*((void (**)(id, uint64_t, _QWORD))v12 + 2))(v12, 45, 0);
  }

}

void __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2;
  v4[3] = &unk_250C33080;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v1, "xattrNamed:ofItem:replyHandler:", v2, v3, v4);

}

void __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  char *v8;

  v5 = a2;
  v6 = a3;
  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (char *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2_cold_2(v6, v8);

    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "code"), 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2_cold_1();

    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v5);
  }

}

- (void)setXattrOf:(id)a3 named:(id)a4 value:(id)a5 how:(unint64_t)a6 requestID:(unint64_t)a7 replyHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  FSModuleVolume *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  unint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  unint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  fskit_std_log();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316162;
    v41 = "-[FSVolumeConnector setXattrOf:named:value:how:requestID:replyHandler:]";
    v42 = 2112;
    v43 = v14;
    v44 = 2112;
    v45 = v15;
    v46 = 2112;
    v47 = v16;
    v48 = 2048;
    v49 = a7;
    _os_log_debug_impl(&dword_23B2A6000, v18, OS_LOG_TYPE_DEBUG, "%s:start:theItem:%@:name:%@:value:%@:reqID:%llu", buf, 0x34u);
  }

  v19 = self->_ourVolume;
  if (-[FSModuleVolume supportsXattrOps](v19, "supportsXattrOps"))
  {
    -[FSModuleVolume volume](v19, "volume");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v19, "getItemForFH:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[FSModuleVolume volume](v19, "volume");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "queueForItem:", v21);
      v23 = objc_claimAutoreleasedReturnValue();

      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke;
      v33[3] = &unk_250C32EC8;
      v34 = v20;
      v35 = v15;
      v36 = v16;
      v37 = v21;
      v39 = a6;
      v38 = v17;
      dispatch_async(v23, v33);

    }
    else
    {
      fskit_std_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector setXattrOf:named:value:how:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t))v17 + 2))(v17, 70);
    }

  }
  else
  {
    fskit_std_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector setXattrOf:named:value:how:requestID:replyHandler:].cold.2(v24, v25, v26, v27, v28, v29, v30, v31);

    (*((void (**)(id, uint64_t))v17 + 2))(v17, 45);
  }

}

void __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke_2;
  v6[3] = &unk_250C31EC8;
  v5 = *(_QWORD *)(a1 + 72);
  v7 = *(id *)(a1 + 64);
  objc_msgSend(v1, "setXattrNamed:toData:onItem:policy:replyHandler:", v2, v3, v4, v5, v6);

}

void __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  char *v4;

  v3 = a2;
  if (v3)
  {
    fskit_std_log();
    v4 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke_2_cold_1(v3, v4);

    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v3, "code"));
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0);
  }

}

- (void)listXattrsOf:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  FSModuleVolume *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;

  v7 = a3;
  v8 = a5;
  fskit_std_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector listXattrsOf:requestID:replyHandler:].cold.3();

  v10 = self->_ourVolume;
  if (-[FSModuleVolume supportsXattrOps](v10, "supportsXattrOps"))
  {
    -[FSModuleVolume volume](v10, "volume");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v10, "getItemForFH:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      -[FSModuleVolume volume](v10, "volume");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "queueForItem:", v12);
      v14 = objc_claimAutoreleasedReturnValue();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke;
      block[3] = &unk_250C330D0;
      v25 = v11;
      v26 = v12;
      v27 = v8;
      dispatch_async(v14, block);

    }
    else
    {
      fskit_std_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector listXattrsOf:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 70, 0);
    }

  }
  else
  {
    fskit_std_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector listXattrsOf:requestID:replyHandler:].cold.2(v15, v16, v17, v18, v19, v20, v21, v22);

    (*((void (**)(id, uint64_t, _QWORD))v8 + 2))(v8, 45, 0);
  }

}

void __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2;
  v3[3] = &unk_250C328C0;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "listXattrsOfItem:replyHandler:", v2, v3);

}

void __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  char *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (char *)v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2_cold_2(v6, v8);

    (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(v6, "code"), 0);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2_cold_1();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v5;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v14), "string", (_QWORD)v16);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)getRootFileHandle:(id)a3
{
  FSModuleVolume *ourVolume;
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  uint64_t v7;
  id v8;

  ourVolume = self->_ourVolume;
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  -[FSModuleVolume rootFSItem](ourVolume, "rootFSItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FSModuleVolume rootFSItem](self->_ourVolume, "rootFSItem");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileHandle");
    v7 = objc_claimAutoreleasedReturnValue();
    v5[2](v5, v7, 0);

    v5 = (void (**)(id, uint64_t, _QWORD))v7;
  }
  else
  {
    fs_errorForPOSIXError(2);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    ((void (*)(void (**)(id, uint64_t, _QWORD), _QWORD))v5[2])(v5, 0);
  }

}

- (void)mount:(id)a3 replyHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  FSModuleVolume *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  FSModuleVolume *v14;
  _QWORD block[4];
  FSModuleVolume *v16;
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  fskit_std_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector mount:replyHandler:].cold.1();

  v9 = self->_ourVolume;
  -[FSModuleVolume volume](v9, "volume");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "globalWorkQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__FSVolumeConnector_mount_replyHandler___block_invoke;
  block[3] = &unk_250C330D0;
  v16 = v9;
  v17 = v6;
  v18 = v7;
  v12 = v7;
  v13 = v6;
  v14 = v9;
  dispatch_sync(v11, block);

}

void __40__FSVolumeConnector_mount_replyHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(a1[4], "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __40__FSVolumeConnector_mount_replyHandler___block_invoke_2;
  v4[3] = &unk_250C330F8;
  v6 = a1[6];
  v5 = a1[4];
  objc_msgSend(v2, "mountWithOptions:replyHandler:", v3, v4);

}

void __40__FSVolumeConnector_mount_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fskit_std_log();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      __40__FSVolumeConnector_mount_replyHandler___block_invoke_2_cold_2(v6, v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "insertIntoFHCache:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setRootFSItem:", v5);
    fskit_std_log();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEBUG))
      __40__FSVolumeConnector_mount_replyHandler___block_invoke_2_cold_1(v5, v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)synchronize:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[FSModuleVolume volume](self->_ourVolume, "volume");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "globalWorkQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__FSVolumeConnector_synchronize___block_invoke;
  block[3] = &unk_250C33120;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __33__FSVolumeConnector_synchronize___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __33__FSVolumeConnector_synchronize___block_invoke_2;
  v3[3] = &unk_250C31EC8;
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "synchronizeWithReplyHandler:", v3);

}

uint64_t __33__FSVolumeConnector_synchronize___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unmount:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  FSModuleVolume *v13;
  void *v14;
  NSObject *v15;
  id v16;
  FSModuleVolume *v17;
  _QWORD v18[4];
  FSModuleVolume *v19;
  id v20;

  v4 = a3;
  fskit_std_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector unmount:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  v13 = self->_ourVolume;
  -[FSModuleVolume volume](v13, "volume");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "globalWorkQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __29__FSVolumeConnector_unmount___block_invoke;
  v18[3] = &unk_250C33120;
  v19 = v13;
  v20 = v4;
  v16 = v4;
  v17 = v13;
  dispatch_sync(v15, v18);

}

void __29__FSVolumeConnector_unmount___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __29__FSVolumeConnector_unmount___block_invoke_2;
  v3[3] = &unk_250C33120;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "unmountWithReplyHandler:", v3);

}

uint64_t __29__FSVolumeConnector_unmount___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  fskit_std_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __29__FSVolumeConnector_unmount___block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "stopUsingVolume");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)makeCloneOf:(id)a3 named:(id)a4 inDirectory:(id)a5 attributes:(id)a6 usingFlags:(unsigned int)a7 requestID:(unint64_t)a8 replyHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  FSModuleVolume *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  void *v46;
  FSVolumeConnector *v47;
  void *v48;
  unsigned int v49;
  _QWORD block[4];
  FSModuleVolume *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  FSVolumeConnector *v58;
  id v59;
  unsigned int v60;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  id v68;
  __int16 v69;
  id v70;
  __int16 v71;
  unsigned int v72;
  __int16 v73;
  unint64_t v74;
  uint64_t v75;

  v75 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  fskit_std_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316674;
    v62 = "-[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:]";
    v63 = 2112;
    v64 = v15;
    v65 = 2112;
    v66 = v16;
    v67 = 2112;
    v68 = v17;
    v69 = 2112;
    v70 = v18;
    v71 = 1024;
    v72 = a7;
    v73 = 2048;
    v74 = a8;
    _os_log_debug_impl(&dword_23B2A6000, v20, OS_LOG_TYPE_DEBUG, "%s:start:sourceFile:%@:name:%@:theDirectory:%@:attributes:%@:flags:%d:reqID:%llu", buf, 0x44u);
  }

  v21 = self->_ourVolume;
  if (-[FSModuleVolume supportsCloneOps](v21, "supportsCloneOps"))
  {
    v49 = a7;
    -[FSModuleVolume volume](v21, "volume");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FSModuleVolume getItemForFH:](v21, "getItemForFH:", v17);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      -[FSModuleVolume getItemForFH:](v21, "getItemForFH:", v15);
      v24 = objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v47 = self;
        v48 = (void *)v24;
        v25 = v23;
        v26 = (void *)v24;
        -[FSModuleVolume volume](v21, "volume");
        v27 = v17;
        v28 = v22;
        v29 = v18;
        v30 = v15;
        v31 = v16;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "queueForItem:", v25);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = v31;
        v15 = v30;
        v18 = v29;
        v22 = v28;
        v17 = v27;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke;
        block[3] = &unk_250C33198;
        v51 = v21;
        v33 = v26;
        v23 = v25;
        v52 = v33;
        v53 = v46;
        v59 = v19;
        v54 = v18;
        v55 = v22;
        v56 = v25;
        v60 = v49;
        v57 = v16;
        v58 = v47;
        v34 = v46;
        dispatch_async(v34, block);

        v35 = v48;
      }
      else
      {
        v35 = 0;
        fskit_std_log();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          -[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:].cold.2();

        (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v19 + 2))(v19, 70, 0, 0, 0, 0);
      }

    }
    else
    {
      fskit_std_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:].cold.1();

      (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v19 + 2))(v19, 70, 0, 0, 0, 0);
    }

  }
  else
  {
    fskit_std_log();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:].cold.3(v36, v37, v38, v39, v40, v41, v42, v43);

    (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))v19 + 2))(v19, 45, 0, 0, 0, 0);
  }

}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  int v18;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queueForItem:", *(_QWORD *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();

  if (*(NSObject **)(a1 + 48) == v3)
  {
    fskit_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
  else
  {
    +[FSItemAttributes requestWithData:](FSItemSetAttributesRequest, "requestWithData:", *(_QWORD *)(a1 + 56));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_333;
    block[3] = &unk_250C33170;
    v10 = *(id *)(a1 + 64);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 72);
    v13 = *(id *)(a1 + 80);
    v14 = v4;
    v18 = *(_DWORD *)(a1 + 104);
    v5 = *(id *)(a1 + 96);
    v6 = *(_QWORD *)(a1 + 88);
    v17 = v5;
    v15 = v6;
    v16 = *(id *)(a1 + 32);
    v7 = v4;
    dispatch_sync(v3, block);

  }
}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_333(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(unsigned int *)(a1 + 96);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_2;
  v10[3] = &unk_250C33148;
  v8 = *(id *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 72);
  v13 = v8;
  v10[4] = v9;
  v11 = *(id *)(a1 + 48);
  v12 = *(id *)(a1 + 80);
  objc_msgSend(v2, "makeCloneOf:inDirectory:named:attributes:usingFlags:replyHandler:", v3, v4, v5, v6, v7, v10);

}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    fskit_std_log();
    v7 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR))
      __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(v6, v7);

    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), objc_msgSend(v6, "code"), 0, 0, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 40));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "insertIntoFHCache:", v5);
    v10 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "fileHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getFreeSpaceInVolume");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *, void *, void *, void *))(v10 + 16))(v10, 0, v9, v11, v8, v12);

  }
}

- (void)setUpdateInterest:(id)a3 interest:(BOOL)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  void (**v6)(id, void *);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v6 = (void (**)(id, void *))a6;
  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector setUpdateInterest:interest:requestID:replyHandler:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  fs_errorForPOSIXError(45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v15);

}

- (void)fetchVolumeMachPortLabeled:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v7 = (void (**)(id, _QWORD, void *))a5;
  if (objc_msgSend((id)*MEMORY[0x24BE60408], "isEqualToString:", a3))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_ourConnection);
    objc_msgSend(WeakRetained, "valueForEntitlement:", CFSTR("com.apple.private.LiveFS.setmachport"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
    {
      if (-[FSModuleVolume supportsKOIOOps](self->_ourVolume, "supportsKOIOOps"))
      {
        -[FSModuleVolume ourExtension](self->_ourVolume, "ourExtension");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "getFSMachPort");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v7[2](v7, 0, v11);
        }
        else
        {
          fskit_std_log();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            -[FSVolumeConnector fetchVolumeMachPortLabeled:requestID:replyHandler:].cold.2(v36, v37, v38, v39, v40, v41, v42, v43);

          v7[2](v7, 102, 0);
        }

      }
      else
      {
        fskit_std_log();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          -[FSVolumeConnector fetchVolumeMachPortLabeled:requestID:replyHandler:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);

        v7[2](v7, 45, 0);
      }
    }
    else
    {
      fskit_std_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector fetchVolumeMachPortLabeled:requestID:replyHandler:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

      v7[2](v7, 13, 0);
    }

  }
  else
  {
    fskit_std_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector fetchVolumeMachPortLabeled:requestID:replyHandler:].cold.4(v12, v13, v14, v15, v16, v17, v18, v19);

    v7[2](v7, 102, 0);
  }

}

- (void)parentsAndAttributesForItemsByID:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  void (**v5)(id, uint64_t, _QWORD);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void (**)(id, uint64_t, _QWORD))a5;
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector parentsAndAttributesForItemsByID:requestID:replyHandler:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  v5[2](v5, 45, 0);
}

- (void)pathConfigurationOf:(id)a3 propertyName:(int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a3;
  v9 = a6;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))v9;
  switch(a4)
  {
    case 4:
      -[FSModuleVolume volume](self->_ourVolume, "volume");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "maxNameLength");
      goto LABEL_12;
    case 5:
    case 6:
    case 9:
    case 10:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
      goto LABEL_5;
    case 7:
      -[FSModuleVolume volume](self->_ourVolume, "volume");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isChownRestricted");
      goto LABEL_12;
    case 8:
      -[FSModuleVolume volume](self->_ourVolume, "volume");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isLongNameTruncated") ^ 1;
      goto LABEL_13;
    case 11:
      -[FSModuleVolume volume](self->_ourVolume, "volume");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "supportedVolumeCapabilities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "supportsCaseSensitiveNames");
      goto LABEL_10;
    case 12:
      -[FSModuleVolume volume](self->_ourVolume, "volume");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "supportedVolumeCapabilities");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "supportsCasePreservingNames");
LABEL_10:
      v10[2](v10, 0, v15);

      goto LABEL_14;
    case 18:
      -[FSModuleVolume volume](self->_ourVolume, "volume");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "maxFileSizeInBits");
      goto LABEL_12;
    default:
      if (a4 == 1)
      {
        -[FSModuleVolume volume](self->_ourVolume, "volume");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "maxLinkCount");
LABEL_12:
        v13 = v12;
LABEL_13:
        v10[2](v10, 0, v13);
LABEL_14:

      }
      else
      {
LABEL_5:
        (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, 45, 0);
      }

      return;
  }
}

- (void)renameItemIn:(id)a3 item:(id)a4 oldName:(id)a5 toDirectory:(id)a6 overItem:(id)a7 newName:(id)a8 replyHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FSModuleVolume *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  FSModuleVolume *v30;
  NSObject *queue;
  id v32;
  _QWORD block[4];
  FSModuleVolume *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  FSVolumeConnector *v41;
  id v42;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = self->_ourVolume;
  -[FSModuleVolume volume](v22, "volume");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "queueForItem:", v16);
  queue = objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __89__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_overItem_newName_replyHandler___block_invoke;
  block[3] = &unk_250C331E8;
  v34 = v22;
  v35 = v16;
  v36 = v15;
  v37 = v17;
  v38 = v20;
  v39 = v18;
  v41 = self;
  v42 = v21;
  v40 = v19;
  v24 = v21;
  v25 = v19;
  v26 = v18;
  v27 = v20;
  v28 = v17;
  v29 = v15;
  v32 = v16;
  v30 = v22;
  dispatch_sync(queue, block);

}

void __89__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_overItem_newName_replyHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_QWORD *)(a1 + 80);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_overItem_newName_replyHandler___block_invoke_2;
  v11[3] = &unk_250C331C0;
  v9 = *(id *)(a1 + 96);
  v10 = *(_QWORD *)(a1 + 88);
  v16 = v9;
  v11[4] = v10;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 72);
  v15 = *(id *)(a1 + 80);
  objc_msgSend(v2, "renameItem:inDirectory:named:toNewName:inDirectory:overItem:replyHandler:", v3, v4, v5, v6, v7, v8, v11);

}

void __89__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_overItem_newName_replyHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (a3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), objc_msgSend(a3, "code"), 0, 0, 0, 0, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 40));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:", *(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "getStandardItemAttributesData:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    v7 = *(_QWORD *)(a1 + 72);
    v8 = objc_msgSend(0, "code");
    objc_msgSend(*(id *)(a1 + 32), "getFreeSpaceInVolume");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id, void *, void *, void *, void *))(v7 + 16))(v7, v8, v10, v4, v5, v6, v9);

  }
}

- (void)renameItemIn:(id)a3 item:(id)a4 oldName:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 replyHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  FSModuleVolume *v22;
  FSModuleVolume *v23;
  void *v24;
  NSObject *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v26 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a10;
  v22 = self->_ourVolume;
  v23 = v22;
  if (!v20 || v20 == v16)
  {
    -[FSVolumeConnector renameItemIn:item:oldName:toDirectory:overItem:newName:replyHandler:](self, "renameItemIn:item:oldName:toDirectory:overItem:newName:replyHandler:", v26, v16, v17, v18, v20, v19, v21);
  }
  else
  {
    -[FSModuleVolume volume](v22, "volume");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "queueForItem:", v20);
    v25 = objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __98__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_newName_toItem_usingFlags_replyHandler___block_invoke;
    block[3] = &unk_250C33210;
    block[4] = self;
    v28 = v26;
    v29 = v16;
    v30 = v17;
    v31 = v18;
    v32 = v20;
    v33 = v19;
    v34 = v21;
    dispatch_sync(v25, block);

    v23 = (FSModuleVolume *)v25;
  }

}

uint64_t __98__FSVolumeConnector_renameItemIn_item_oldName_toDirectory_newName_toItem_usingFlags_replyHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "renameItemIn:item:oldName:toDirectory:overItem:newName:replyHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
}

- (void)renameItemIn:(id)a3 named:(id)a4 item:(id)a5 toDirectory:(id)a6 newName:(id)a7 toItem:(id)a8 usingFlags:(unsigned int)a9 requestID:(unint64_t)a10 replyHandler:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  FSModuleVolume *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  unint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  _QWORD block[4];
  id v54;
  FSVolumeConnector *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  unsigned int v63;
  _QWORD v64[5];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  unsigned int v72;

  v17 = a3;
  v18 = a4;
  v52 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a11;
  v23 = self->_ourVolume;
  -[FSModuleVolume getItemForFH:](v23, "getItemForFH:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24)
  {
    v27 = v21;
    fskit_std_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:].cold.1();
    goto LABEL_8;
  }
  v51 = v18;
  if (v17 == v19)
  {
    v26 = v24;
LABEL_10:
    -[FSModuleVolume getItemForFH:](v23, "getItemForFH:", v52);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29)
    {
      v27 = v21;
      fskit_std_log();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:].cold.2();

      (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v22 + 2))(v22, 70, 0, 0, 0, 0, 0);
      goto LABEL_32;
    }
    v50 = v21;
    if (v21)
    {
      if (v52 == v21)
      {
        v49 = v29;
      }
      else
      {
        -[FSModuleVolume getItemForFH:](v23, "getItemForFH:", v21);
        v49 = (id)objc_claimAutoreleasedReturnValue();
        if (!v49)
        {
          fskit_std_log();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            -[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:].cold.3();

          (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v22 + 2))(v22, 70, 0, 0, 0, 0, 0);
LABEL_31:
          v27 = v50;
LABEL_32:

          v18 = v51;
          goto LABEL_33;
        }
      }
    }
    else
    {
      v49 = 0;
    }
    v47 = v19;
    -[FSModuleVolume volume](v23, "volume");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "queueForItem:", v25);
    v34 = objc_claimAutoreleasedReturnValue();

    -[FSModuleVolume volume](v23, "volume");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v26;
    objc_msgSend(v35, "queueForItem:", v26);
    v36 = objc_claimAutoreleasedReturnValue();

    v37 = v34;
    v46 = (void *)v36;
    if (v34 == v36)
    {
      v64[0] = MEMORY[0x24BDAC760];
      v64[1] = 3221225472;
      v64[2] = __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke;
      v64[3] = &unk_250C33238;
      v64[4] = self;
      v65 = v25;
      v66 = v30;
      v67 = v51;
      v26 = v48;
      v68 = v48;
      v41 = v49;
      v69 = v20;
      v70 = v49;
      v72 = a9;
      v71 = v22;
      v44 = v49;
      dispatch_async(v34, v64);

    }
    else
    {
      if ((unint64_t)v34 >= v36)
        v38 = (void *)v36;
      else
        v38 = v34;
      v45 = v34;
      if ((unint64_t)v34 < v36)
        v37 = (void *)v36;
      v39 = v38;
      v40 = v37;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke_2;
      block[3] = &unk_250C33260;
      v54 = v40;
      v55 = self;
      v56 = v25;
      v57 = v30;
      v58 = v51;
      v26 = v48;
      v59 = v48;
      v41 = v49;
      v60 = v20;
      v61 = v49;
      v63 = a9;
      v62 = v22;
      v42 = v49;
      v43 = v40;
      dispatch_async(v39, block);

      v37 = v45;
    }
    v19 = v47;

    goto LABEL_31;
  }
  -[FSModuleVolume getItemForFH:](v23, "getItemForFH:", v19);
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v26)
    goto LABEL_10;
  v27 = v21;
  fskit_std_log();
  v28 = objc_claimAutoreleasedReturnValue();
  v18 = v51;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[FSVolumeConnector renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:].cold.4();
LABEL_8:

  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v22 + 2))(v22, 70, 0, 0, 0, 0, 0);
LABEL_33:

}

uint64_t __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  LODWORD(v2) = *(_DWORD *)(a1 + 96);
  return objc_msgSend(*(id *)(a1 + 32), "renameItemIn:item:oldName:toDirectory:newName:toItem:usingFlags:replyHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v2, *(_QWORD *)(a1 + 88));
}

void __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  int v11;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke_3;
  block[3] = &unk_250C33238;
  v2 = *(NSObject **)(a1 + 32);
  block[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  v6 = *(id *)(a1 + 64);
  v7 = *(id *)(a1 + 72);
  v8 = *(id *)(a1 + 80);
  v9 = *(id *)(a1 + 88);
  v11 = *(_DWORD *)(a1 + 104);
  v10 = *(id *)(a1 + 96);
  dispatch_sync(v2, block);

}

uint64_t __106__FSVolumeConnector_renameItemIn_named_item_toDirectory_newName_toItem_usingFlags_requestID_replyHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;

  LODWORD(v2) = *(_DWORD *)(a1 + 96);
  return objc_msgSend(*(id *)(a1 + 32), "renameItemIn:item:oldName:toDirectory:newName:toItem:usingFlags:replyHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v2, *(_QWORD *)(a1 + 88));
}

- (void)replenishSearchCreditsFor:(id)a3 credits:(unsigned int)a4 requestID:(unint64_t)a5 replyHandler:(id)a6
{
  void (**v6)(id, uint64_t);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = (void (**)(id, uint64_t))a6;
  fskit_std_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector replenishSearchCreditsFor:credits:requestID:replyHandler:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  v6[2](v6, 45);
}

- (void)abortSearch:(id)a3 requestID:(unint64_t)a4 replyHandler:(id)a5
{
  void (**v5)(id, uint64_t);
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = (void (**)(id, uint64_t))a5;
  fskit_std_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector abortSearch:requestID:replyHandler:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

  v5[2](v5, 45);
}

- (void)search:(id)a3 token:(id)a4 criteria:(id)a5 resumeAt:(id)a6 maxData:(unsigned int)a7 maxDelay:(double)a8 initialCredits:(unsigned int)a9 requestID:(unint64_t)a10 replyHandler:(id)a11
{
  void (**v11)(id, uint64_t);
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v11 = (void (**)(id, uint64_t))a11;
  fskit_std_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[FSVolumeConnector search:token:criteria:resumeAt:maxData:maxDelay:initialCredits:requestID:replyHandler:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

  v11[2](v11, 45);
}

- (FSModuleVolume)ourVolume
{
  return (FSModuleVolume *)objc_getProperty(self, a2, 24, 1);
}

- (void)setOurVolume:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSXPCConnection)ourConnection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_ourConnection);
}

- (void)setOurConnection:(id)a3
{
  objc_storeWeak((id *)&self->_ourConnection, a3);
}

- (FSItemGetAttributesRequest)standardGetAttrReq
{
  return (FSItemGetAttributesRequest *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardGetAttrReq, 0);
  objc_destroyWeak((id *)&self->_ourConnection);
  objc_storeStrong((id *)&self->_ourVolume, 0);
}

void __47__FSVolumeConnector_getStandardItemAttributes___block_invoke_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)blockmapFile:range:startIO:flags:operationID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)blockmapFile:(uint64_t)a3 range:(uint64_t)a4 startIO:(uint64_t)a5 flags:(uint64_t)a6 operationID:(uint64_t)a7 replyHandler:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support KOIO operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __79__FSVolumeConnector_blockmapFile_range_startIO_flags_operationID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)checkAccessTo:requestedAccess:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)checkAccessTo:(uint64_t)a3 requestedAccess:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support KOIO operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __74__FSVolumeConnector_checkAccessTo_requestedAccess_requestID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)endIO:range:status:flags:operationID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)endIO:(uint64_t)a3 range:(uint64_t)a4 status:(uint64_t)a5 flags:(uint64_t)a6 operationID:(uint64_t)a7 replyHandler:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support KOIO operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __71__FSVolumeConnector_endIO_range_status_flags_operationID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)otherAttributeOf:(uint64_t)a3 named:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: Volume doesn't implement maxXattrBits", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)otherAttributeOf:named:requestID:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)setOtherAttributeOf:named:value:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)volumeStatistics:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:error(ENOTSUP)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)createIn:named:type:attributes:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: newItem is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:error:%@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

void __75__FSVolumeConnector_createIn_named_type_attributes_requestID_replyHandler___block_invoke_311_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:spotlightNotifier:FSE_CREATE_FILE", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)lookupIn:name:flags:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)removeDirectory:from:named:usingFlags:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:dir:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)removeDirectory:from:named:usingFlags:requestID:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:file:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15_0(&dword_23B2A6000, v0, v1, "%s:dirQ==parentQ:error:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __82__FSVolumeConnector_removeDirectory_from_named_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17_0(&dword_23B2A6000, v2, v3, "%s:remove:error:%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)removeItem:from:named:usingFlags:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:dir:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)removeItem:from:named:usingFlags:requestID:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:file:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15_0(&dword_23B2A6000, v0, v1, "%s:dirQ==fileQ:error:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __77__FSVolumeConnector_removeItem_from_named_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17_0(&dword_23B2A6000, v2, v3, "%s:remove:error:%@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)reclaim:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)reclaim:requestID:replyHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10(&dword_23B2A6000, v0, v1, "%s:start:theItem:%@:reqID:%llu", v2);
  OUTLINED_FUNCTION_8();
}

void __52__FSVolumeConnector_reclaim_requestID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)open:withMode:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)open:(uint64_t)a3 withMode:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support open close operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:reply:error:0", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __58__FSVolumeConnector_open_withMode_requestID_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)close:keepingMode:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)close:(uint64_t)a3 keepingMode:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support open close operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:reply:error:0", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__FSVolumeConnector_close_keepingMode_requestID_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)writeTo:atOffset:fromBuffer:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)writeTo:(uint64_t)a3 atOffset:(uint64_t)a4 fromBuffer:(uint64_t)a5 requestID:(uint64_t)a6 replyHandler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support read write operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:reply:error:0:actuallyWritten:%zu", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __72__FSVolumeConnector_writeTo_atOffset_fromBuffer_requestID_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)readFrom:atOffset:intoBuffer:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)readFrom:(uint64_t)a3 atOffset:(uint64_t)a4 intoBuffer:(uint64_t)a5 requestID:(uint64_t)a6 replyHandler:(uint64_t)a7 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support read write operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_19_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:reply:error:0:actuallyRead:%zu", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __73__FSVolumeConnector_readFrom_atOffset_intoBuffer_requestID_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)setFileAttributesOf:to:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

void __67__FSVolumeConnector_setFileAttributesOf_to_requestID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)fileAttributes:requestedAttributes:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

void __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[FSVolumeConnector readDirectory:withAttr:requestedAttributes:intoBuffer:cookie:verifier:requestID:replyHandler:"
       "]_block_invoke_2";
  v5 = 1024;
  v6 = -1002;
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a1, a3, "%s:reply:error:%d", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __114__FSVolumeConnector_readDirectory_withAttr_requestedAttributes_intoBuffer_cookie_verifier_requestID_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)readSymbolicLinkOf:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)readSymbolicLinkOf:requestID:replyHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10(&dword_23B2A6000, v0, v1, "%s:start:theDirectory:%@:reqID:%llu", v2);
  OUTLINED_FUNCTION_8();
}

void __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_10(&dword_23B2A6000, v0, v1, "%s:reply:error:0:linkData:%@:linkAttrs:%@", v2);
  OUTLINED_FUNCTION_8();
}

void __63__FSVolumeConnector_readSymbolicLinkOf_requestID_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)makeSymlinkIn:named:contents:attributes:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

void __84__FSVolumeConnector_makeSymlinkIn_named_contents_attributes_requestID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  int v3[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v3[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_23B2A6000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "%s:reply:error:%d", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_7();
}

- (void)makeLinkOf:named:inDirectory:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_18_0(&dword_23B2A6000, v0, v1, "%s:reply:targetFile:%@:error:%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8();
}

- (void)makeLinkOf:named:inDirectory:requestID:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_18_0(&dword_23B2A6000, v0, v1, "%s:reply:theDirectory:%@:error:%d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8();
}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15_0(&dword_23B2A6000, v0, v1, "%s:dirQ==fileQ:error:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__FSVolumeConnector_makeLinkOf_named_inDirectory_requestID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)xattrOf:named:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)xattrOf:(uint64_t)a3 named:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support xattr operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:reply:error:0:value:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __58__FSVolumeConnector_xattrOf_named_requestID_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)setXattrOf:named:value:how:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)setXattrOf:(uint64_t)a3 named:(uint64_t)a4 value:(uint64_t)a5 how:(uint64_t)a6 requestID:(uint64_t)a7 replyHandler:(uint64_t)a8 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support xattr operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __71__FSVolumeConnector_setXattrOf_named_value_how_requestID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)listXattrsOf:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)listXattrsOf:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support xattr operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)listXattrsOf:requestID:replyHandler:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_10(&dword_23B2A6000, v0, v1, "%s:start:theItem:%@:%llu", v2);
  OUTLINED_FUNCTION_8();
}

void __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:reply:error:0:value:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __57__FSVolumeConnector_listXattrsOf_requestID_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)mount:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, v0, v1, "%s:start:options:%@", (uint8_t *)v2);
  OUTLINED_FUNCTION_1();
}

void __40__FSVolumeConnector_mount_replyHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5[6];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "fileHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4(&dword_23B2A6000, a2, v4, "%s:error:0:rootItem:%@", (uint8_t *)v5);

  OUTLINED_FUNCTION_7();
}

void __40__FSVolumeConnector_mount_replyHandler___block_invoke_2_cold_2(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)unmount:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:start", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __29__FSVolumeConnector_unmount___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:end", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:reply:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)makeCloneOf:named:inDirectory:attributes:usingFlags:requestID:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:file:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)makeCloneOf:(uint64_t)a3 named:(uint64_t)a4 inDirectory:(uint64_t)a5 attributes:(uint64_t)a6 usingFlags:(uint64_t)a7 requestID:(uint64_t)a8 replyHandler:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: volume doesn't support clone operations.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_15_0(&dword_23B2A6000, v0, v1, "%s:dirQ==itemQ:error:%d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __96__FSVolumeConnector_makeCloneOf_named_inDirectory_attributes_usingFlags_requestID_replyHandler___block_invoke_2_cold_1(void *a1, char *a2)
{
  uint64_t v3;
  int v4[6];

  OUTLINED_FUNCTION_10_0(a1, a2);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, a2, v3, "%s:reply:error:%d", (uint8_t *)v4);
  OUTLINED_FUNCTION_7();
}

- (void)setUpdateInterest:(uint64_t)a3 interest:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:error(ENOTSUP)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchVolumeMachPortLabeled:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s:error(EACCES)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchVolumeMachPortLabeled:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: No fsMachPort!!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchVolumeMachPortLabeled:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s: Volume has KOIO disabled.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)fetchVolumeMachPortLabeled:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_23B2A6000, a1, a3, "%s:error(EOPNOTSUPP)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parentsAndAttributesForItemsByID:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:error(ENOTSUP)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:fromDir:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:fromItem:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:file:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)renameItemIn:named:item:toDirectory:newName:toItem:usingFlags:requestID:replyHandler:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_23B2A6000, v0, v1, "%s:toDir:error:%d", v2);
  OUTLINED_FUNCTION_1();
}

- (void)replenishSearchCreditsFor:(uint64_t)a3 credits:(uint64_t)a4 requestID:(uint64_t)a5 replyHandler:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:error(ENOTSUP)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)abortSearch:(uint64_t)a3 requestID:(uint64_t)a4 replyHandler:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:error(ENOTSUP)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)search:(uint64_t)a3 token:(uint64_t)a4 criteria:(uint64_t)a5 resumeAt:(uint64_t)a6 maxData:(uint64_t)a7 maxDelay:(uint64_t)a8 initialCredits:requestID:replyHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_23B2A6000, a1, a3, "%s:error(ENOTSUP)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
