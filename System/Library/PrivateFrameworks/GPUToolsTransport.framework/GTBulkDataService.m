@implementation GTBulkDataService

- (GTBulkDataService)init
{
  return -[GTBulkDataService initWithDownloadHighWaterMark:](self, "initWithDownloadHighWaterMark:", 52428800);
}

- (GTBulkDataService)initWithDownloadHighWaterMark:(unint64_t)a3
{
  GTBulkDataService *v4;
  os_log_t v5;
  OS_os_log *log;
  uint64_t v7;
  NSMutableDictionary *dataDownloadStore;
  uint64_t v9;
  NSMutableDictionary *dataUploadingStore;
  uint64_t v11;
  NSMutableDictionary *dataUploadedStore;
  uint64_t v13;
  NSMutableDictionary *dataUploadCompressionAlgorithm;
  dispatch_group_t v15;
  OS_dispatch_group *downloadTransmitOff;
  dispatch_queue_t v17;
  OS_dispatch_queue *dataAccessQueue;
  dispatch_queue_t v19;
  OS_dispatch_queue *dataTransferQueue;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)GTBulkDataService;
  v4 = -[GTBulkDataService init](&v22, sel_init);
  if (v4)
  {
    v5 = os_log_create("com.apple.gputools.transport", "BulkData");
    log = v4->_log;
    v4->_log = (OS_os_log *)v5;

    v4->_nextDownloadHandle = 1;
    v4->_nextUploadHandle = 1;
    v7 = objc_opt_new();
    dataDownloadStore = v4->_dataDownloadStore;
    v4->_dataDownloadStore = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    dataUploadingStore = v4->_dataUploadingStore;
    v4->_dataUploadingStore = (NSMutableDictionary *)v9;

    v11 = objc_opt_new();
    dataUploadedStore = v4->_dataUploadedStore;
    v4->_dataUploadedStore = (NSMutableDictionary *)v11;

    v13 = objc_opt_new();
    dataUploadCompressionAlgorithm = v4->_dataUploadCompressionAlgorithm;
    v4->_dataUploadCompressionAlgorithm = (NSMutableDictionary *)v13;

    v4->_downloadHighWaterMarkBytes = a3;
    v4->_downloadStoreBytes = 0;
    v4->_downloadTransmitState = 1;
    v15 = dispatch_group_create();
    downloadTransmitOff = v4->_downloadTransmitOff;
    v4->_downloadTransmitOff = (OS_dispatch_group *)v15;

    v17 = dispatch_queue_create("com.apple.gputools.bulk-data.access", 0);
    dataAccessQueue = v4->_dataAccessQueue;
    v4->_dataAccessQueue = (OS_dispatch_queue *)v17;

    v19 = dispatch_queue_create("com.apple.gputools.bulk-data.transfer", 0);
    dataTransferQueue = v4->_dataTransferQueue;
    v4->_dataTransferQueue = (OS_dispatch_queue *)v19;

  }
  return v4;
}

- (void)waitUntilDownloadCapacity
{
  dispatch_group_wait((dispatch_group_t)self->_downloadTransmitOff, 0xFFFFFFFFFFFFFFFFLL);
}

- (id)takeDownloadDataForHandle:(unint64_t)a3
{
  NSObject *dataAccessQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  dataAccessQueue = self->_dataAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__GTBulkDataService_takeDownloadDataForHandle___block_invoke;
  block[3] = &unk_24F827880;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(dataAccessQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__GTBulkDataService_takeDownloadDataForHandle___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

  *(_QWORD *)(a1[4] + 40) -= objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "length");
  v9 = a1[4];
  if (!*(_BYTE *)(v9 + 48) && *(_QWORD *)(v9 + 40) <= *(_QWORD *)(v9 + 32))
  {
    *(_BYTE *)(v9 + 48) = 1;
    dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 56));
  }
}

- (void)downloadData:(unint64_t)a3 usingTransferOptions:(id)a4 chunkHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *dataTransferQueue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  GTBulkDataService *v15;
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  dataTransferQueue = self->_dataTransferQueue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke;
  v13[3] = &unk_24F8278A8;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(dataTransferQueue, v13);

}

void __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x22E30C9D4]();
  v3 = (id *)(a1 + 32);
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "chunkSize"))
  {

    goto LABEL_13;
  }
  v6 = objc_msgSend(v5, "compressionAlgorithm");

  if (v6 >= 5)
  {
LABEL_13:
    v19 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_1(a1 + 32, v19, v20, v21, v22, v23, v24, v25);
    v26 = (void *)MEMORY[0x24BDD1540];
    v51 = *MEMORY[0x24BDD0FC8];
    v27 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(*(id *)(a1 + 32), "debugDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Invalid options sent to downloadData: %@"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v52[0] = v29;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.bulkdataservice"), 0, v30);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  objc_msgSend(*(id *)(a1 + 40), "takeDownloadDataForHandle:", *(_QWORD *)(a1 + 56));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v31 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_2(a1 + 56, v31, v32, v33, v34, v35, v36, v37);
    v38 = (void *)MEMORY[0x24BDD1540];
    v49 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Handle (%lld) has no data associated to it"), *(_QWORD *)(a1 + 56));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v39;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.bulkdataservice"), 2, v40);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_17;
  }
  v8 = (void *)v7;
  objc_msgSend(*v3, "compressionAlgorithm");
  v9 = objc_msgSend(*v3, "compressionAlgorithm");
  v48 = 0;
  GTBulkDataCompress(v8, v9, &v48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v48;

  if (v10)
  {
    objc_msgSend(*v3, "compressionAlgorithm");
    if (objc_msgSend(v10, "length"))
    {
      v12 = 0;
      do
      {
        v13 = (void *)MEMORY[0x22E30C9D4]();
        v14 = objc_msgSend(*(id *)(a1 + 32), "chunkSize");
        v15 = objc_msgSend(v10, "length");
        if (v14 >= v15 - v12)
          v14 = v15 - v12;
        v16 = (void *)MEMORY[0x24BDBCE50];
        v17 = objc_retainAutorelease(v10);
        objc_msgSend(v16, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v17, "bytes") + v12, v14, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "length");
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

        objc_autoreleasePoolPop(v13);
        v12 += objc_msgSend(*(id *)(a1 + 32), "chunkSize");
      }
      while (v12 < objc_msgSend(v17, "length"));
    }
  }
  else
  {
    v41 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_3((uint64_t)v11, v41, v42, v43, v44, v45, v46, v47);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

LABEL_17:
  objc_autoreleasePoolPop(v2);
}

- (unint64_t)handoverDataForDownload:(id)a3
{
  id v4;
  NSObject *dataAccessQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  dataAccessQueue = self->_dataAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__GTBulkDataService_handoverDataForDownload___block_invoke;
  block[3] = &unk_24F8278D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(dataAccessQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __45__GTBulkDataService_handoverDataForDownload___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 16) = v3 + 1;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v3;
  v4 = a1[5];
  v5 = *(void **)(a1[4] + 24);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  *(_QWORD *)(a1[4] + 40) += objc_msgSend((id)a1[5], "length");
  v7 = a1[4];
  if (*(_BYTE *)(v7 + 48))
  {
    if (*(_QWORD *)(v7 + 40) > *(_QWORD *)(v7 + 32))
    {
      *(_BYTE *)(v7 + 48) = 0;
      dispatch_group_enter(*(dispatch_group_t *)(a1[4] + 56));
    }
  }
}

- (unint64_t)newUploadWithDescriptor:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *dataAccessQueue;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD block[5];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (v6 && (unint64_t)objc_msgSend(v6, "compressionAlgorithm") < 5)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    dataAccessQueue = self->_dataAccessQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__GTBulkDataService_newUploadWithDescriptor_error___block_invoke;
    block[3] = &unk_24F8278D0;
    v17 = &v18;
    block[4] = self;
    v16 = v7;
    dispatch_sync(dataAccessQueue, block);
    a4 = (id *)v19[3];

    _Block_object_dispose(&v18, 8);
  }
  else if (a4)
  {
    v9 = (void *)MEMORY[0x24BDD1540];
    v22 = *MEMORY[0x24BDD0FC8];
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v7, "debugDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Invalid upload descriptor: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.bulkdataservice"), 1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }

  return (unint64_t)a4;
}

void __51__GTBulkDataService_newUploadWithDescriptor_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 64) = v3 + 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  if (objc_msgSend(*(id *)(a1 + 40), "sizeHint"))
    v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "sizeHint"));
  else
    v4 = objc_opt_new();
  v5 = (void *)v4;
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(a1 + 40), "compressionAlgorithm"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, v9);

}

- (BOOL)uploadChunk:(id)a3 forHandle:(unint64_t)a4 isFinalChunk:(BOOL)a5 error:(id *)a6
{
  id v10;
  NSObject *dataAccessQueue;
  id v12;
  char v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  unint64_t v18;
  id *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v10 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  dataAccessQueue = self->_dataAccessQueue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__GTBulkDataService_uploadChunk_forHandle_isFinalChunk_error___block_invoke;
  v15[3] = &unk_24F8278F8;
  v18 = a4;
  v19 = a6;
  v15[4] = self;
  v16 = v10;
  v20 = a5;
  v17 = &v21;
  v12 = v10;
  dispatch_sync(dataAccessQueue, v15);
  v13 = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __62__GTBulkDataService_uploadChunk_forHandle_isFinalChunk_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 56;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "appendData:", *(_QWORD *)(a1 + 40));
    if (!*(_BYTE *)(a1 + 72))
    {
LABEL_5:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      goto LABEL_10;
    }
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v13);

    GTBulkDataDecompress(v5, v11, *(void **)(a1 + 64));
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v16 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 56));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v17);

      goto LABEL_5;
    }
  }
  else
  {
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __62__GTBulkDataService_uploadChunk_forHandle_isFinalChunk_error___block_invoke_cold_1(v2, v18, v19, v20, v21, v22, v23, v24);
    if (*(_QWORD *)(a1 + 64))
    {
      v25 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Handle (%lld) has no data associated to it"), *(_QWORD *)(a1 + 56), *MEMORY[0x24BDD0FC8]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.gputools.bulkdataservice"), 2, v27);
      **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

    }
  }
LABEL_10:

}

- (id)takeUploadedDataForHandle:(unint64_t)a3
{
  NSObject *dataAccessQueue;
  void *v6;
  NSObject *log;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  dataAccessQueue = self->_dataAccessQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__GTBulkDataService_takeUploadedDataForHandle___block_invoke;
  block[3] = &unk_24F827880;
  block[4] = self;
  block[5] = &v17;
  block[6] = a3;
  dispatch_sync(dataAccessQueue, block);
  v6 = (void *)v18[5];
  if (!v6)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[GTBulkDataService takeUploadedDataForHandle:].cold.1(a3, log, v8, v9, v10, v11, v12, v13);
    v6 = (void *)v18[5];
  }
  v14 = v6;
  _Block_object_dispose(&v17, 8);

  return v14;
}

void __47__GTBulkDataService_takeUploadedDataForHandle___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1[4] + 80);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(void **)(a1[4] + 80);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTransferQueue, 0);
  objc_storeStrong((id *)&self->_dataAccessQueue, 0);
  objc_storeStrong((id *)&self->_dataUploadCompressionAlgorithm, 0);
  objc_storeStrong((id *)&self->_dataUploadedStore, 0);
  objc_storeStrong((id *)&self->_dataUploadingStore, 0);
  objc_storeStrong((id *)&self->_downloadTransmitOff, 0);
  objc_storeStrong((id *)&self->_dataDownloadStore, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

void __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D095000, a2, a3, "downloadData Invalid Options:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D095000, a2, a3, "downloadData Invalid Handle:%llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __68__GTBulkDataService_downloadData_usingTransferOptions_chunkHandler___block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D095000, a2, a3, "downloadData Compression error:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __62__GTBulkDataService_uploadChunk_forHandle_isFinalChunk_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D095000, a2, a3, "uploadChunk Invalid Handle: %llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)takeUploadedDataForHandle:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_22D095000, a2, a3, "takeUploadedDataForHandle Invalid Handle: %llu", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
