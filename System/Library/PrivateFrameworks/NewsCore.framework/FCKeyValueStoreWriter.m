@implementation FCKeyValueStoreWriter

void __55__FCKeyValueStoreWriter_writeKVS_codables_toFile_size___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "dataWriter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterPlaceMark();

    objc_msgSend(*(id *)(a1 + 32), "dataWriter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteStringField();

    objc_msgSend(*(id *)(a1 + 32), "dataWriter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "keyValuePairType");
    PBDataWriterWriteInt32Field();

    objc_msgSend(*(id *)(a1 + 32), "dataWriter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "writeValueToDataWriter:", v10);

    objc_msgSend(*(id *)(a1 + 32), "dataWriter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterRecallMark();

  }
  else
  {
    v12 = (void *)MEMORY[0x1A8580B64]();
    v13 = objc_alloc_init(MEMORY[0x1E0D62700]);
    objc_msgSend(v13, "setKey:", v5);
    objc_msgSend(v6, "writeToKeyValuePair:", v13);
    objc_msgSend(*(id *)(a1 + 32), "dataWriter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    objc_autoreleasePoolPop(v12);
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(*(id *)(a1 + 32), "_flushToDiskIfNeeded");

}

- (unint64_t)_flushToDiskIfNeeded
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;

  -[FCKeyValueStoreWriter dataWriter](self, "dataWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");
  if (qword_1ED0F86A0 != -1)
    dispatch_once(&qword_1ED0F86A0, &__block_literal_global_35_1);
  v6 = qword_1ED0F8698;

  if (v5 >= v6)
    return -[FCKeyValueStoreWriter _flushToDisk](self, "_flushToDisk");
  else
    return 0;
}

- (BOOL)writeKVS:(id)a3 codables:(id)a4 toFile:(id)a5 size:(unint64_t *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  BOOL v22;
  char v23;
  _QWORD v25[6];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  FCPersistenceQueue();
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[FCKeyValueStoreWriter tempFileOutputStream](self, "tempFileOutputStream");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "open");

  -[FCKeyValueStoreWriter dataWriter](self, "dataWriter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "version");
  PBDataWriterWriteInt64Field();

  -[FCKeyValueStoreWriter dataWriter](self, "dataWriter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientVersion");
  PBDataWriterWriteInt64Field();

  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __55__FCKeyValueStoreWriter_writeKVS_codables_toFile_size___block_invoke;
  v25[3] = &unk_1E4648408;
  v25[4] = self;
  v25[5] = &v26;
  objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v25);
  objc_msgSend(v10, "plistSidecar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[FCKeyValueStoreWriter dataWriter](self, "dataWriter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "plistSidecar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteDataField();

  }
  v20 = -[FCKeyValueStoreWriter _flushToDisk](self, "_flushToDisk");
  v27[3] += v20;
  -[FCKeyValueStoreWriter tempFileOutputStream](self, "tempFileOutputStream");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "close");

  v22 = -[FCKeyValueStoreWriter _moveTempFileToPath:](self, "_moveTempFileToPath:", v12);
  v23 = !v22;
  if (!a6)
    v23 = 1;
  if ((v23 & 1) == 0)
    *a6 = v27[3];
  _Block_object_dispose(&v26, 8);

  return v22;
}

- (PBDataWriter)dataWriter
{
  return self->_dataWriter;
}

- (NSOutputStream)tempFileOutputStream
{
  return self->_tempFileOutputStream;
}

- (unint64_t)_flushToDisk
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  -[FCKeyValueStoreWriter dataWriter](self, "dataWriter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "length");
  -[FCKeyValueStoreWriter tempFileOutputStream](self, "tempFileOutputStream");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "write:maxLength:", objc_msgSend(v7, "bytes"), v5);

  -[FCKeyValueStoreWriter dataWriter](self, "dataWriter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLength:", 0);

  return v5;
}

- (BOOL)_moveTempFileToPath:(id)a3
{
  id v4;
  id v5;
  const std::__fs::filesystem::path *v6;
  id v7;
  const std::__fs::filesystem::path *v8;
  std::error_code *v9;
  int v10;

  v4 = a3;
  -[FCKeyValueStoreWriter tempFilePath](self, "tempFilePath");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (const std::__fs::filesystem::path *)objc_msgSend(v5, "fileSystemRepresentation");
  v7 = objc_retainAutorelease(v4);
  v8 = (const std::__fs::filesystem::path *)objc_msgSend(v7, "fileSystemRepresentation");

  rename(v6, v8, v9);
  LODWORD(v7) = v10;

  return (_DWORD)v7 == 0;
}

- (NSString)tempFilePath
{
  return self->_tempFilePath;
}

- (FCKeyValueStoreWriter)init
{
  FCKeyValueStoreWriter *v2;
  uint64_t v3;
  NSOutputStream *tempFileOutputStream;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FCKeyValueStoreWriter;
  v2 = -[FCKeyValueStoreWriter init](&v6, sel_init);
  if (v2)
  {
    if (qword_1ED0F8690 != -1)
      dispatch_once(&qword_1ED0F8690, &__block_literal_global_141);
    objc_storeStrong((id *)&v2->_dataWriter, (id)_MergedGlobals_195);
    objc_storeStrong((id *)&v2->_tempFilePath, (id)qword_1ED0F8688);
    objc_msgSend(MEMORY[0x1E0C99E48], "outputStreamToFileAtPath:append:", qword_1ED0F8688, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    tempFileOutputStream = v2->_tempFileOutputStream;
    v2->_tempFileOutputStream = (NSOutputStream *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tempFileOutputStream, 0);
  objc_storeStrong((id *)&self->_tempFilePath, 0);
  objc_storeStrong((id *)&self->_dataWriter, 0);
}

void __29__FCKeyValueStoreWriter_init__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v0 = objc_alloc_init(MEMORY[0x1E0D82B98]);
  v1 = (void *)_MergedGlobals_195;
  _MergedGlobals_195 = (uint64_t)v0;

  NSTemporaryDirectory();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("kvs-%@.tmp"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)qword_1ED0F8688;
  qword_1ED0F8688 = v6;

}

@end
