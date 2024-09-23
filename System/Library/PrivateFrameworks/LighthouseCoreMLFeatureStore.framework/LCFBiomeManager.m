@implementation LCFBiomeManager

- (id)init:(id)a3
{
  id v5;
  LCFBiomeManager *v6;
  BMSource *biomeSource;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LCFBiomeManager;
  v6 = -[LCFBiomeManager init](&v9, sel_init);
  if (v6)
  {
    LCFLoggingUtilsInit();
    objc_storeStrong((id *)&v6->_biomeStream, a3);
    biomeSource = v6->_biomeSource;
    v6->_biomeSource = 0;

  }
  return v6;
}

- (BOOL)writeData:(id)a3
{
  id v4;
  BMSource *v5;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__LCFBiomeManager_writeData___block_invoke;
  block[3] = &unk_25109F240;
  block[4] = self;
  if (onceTokenBiomeSource != -1)
    dispatch_once(&onceTokenBiomeSource, block);
  v5 = self->_biomeSource;
  objc_sync_enter(v5);
  -[BMSource sendEvent:](self->_biomeSource, "sendEvent:", v4);
  objc_sync_exit(v5);

  return 1;
}

void __29__LCFBiomeManager_writeData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 16))
  {
    v3 = LCFLogContextBiomeManager;
    if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_ERROR))
      __29__LCFBiomeManager_writeData___block_invoke_cold_1(v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 8), "source");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v4;

}

- (id)readData:(id)a3 endDate:(id)a4 reversed:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(v8, "timeIntervalSince1970");
    v13 = v12;
    objc_msgSend(v9, "timeIntervalSince1970");
    *(_DWORD *)buf = 134218240;
    v25 = v13;
    v26 = 2048;
    v27 = v14;
    _os_log_impl(&dword_24032B000, v11, OS_LOG_TYPE_INFO, "Reading Biome events from %f to %f.", buf, 0x16u);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v8, v9, -1, -1, v5);
  -[BMStream publisherWithOptions:](self->_biomeStream, "publisherWithOptions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __45__LCFBiomeManager_readData_endDate_reversed___block_invoke_36;
  v22[3] = &unk_25109F2A8;
  v23 = v17;
  v18 = v17;
  v19 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_1, v22);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v18);

  return v20;
}

void __45__LCFBiomeManager_readData_endDate_reversed___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_24032B000, v0, OS_LOG_TYPE_INFO, "Completed.", v1, 2u);
  }
}

void __45__LCFBiomeManager_readData_endDate_reversed___block_invoke_36(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "eventBody");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)readTimeStamps:(id)a3 endDate:(id)a4 reversed:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v5 = a5;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(v8, "timeIntervalSince1970");
    v13 = v12;
    objc_msgSend(v9, "timeIntervalSince1970");
    *(_DWORD *)buf = 134218240;
    v25 = v13;
    v26 = 2048;
    v27 = v14;
    _os_log_impl(&dword_24032B000, v11, OS_LOG_TYPE_INFO, "Reading Biome events from %f to %f.", buf, 0x16u);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v8, v9, -1, -1, v5);
  -[BMStream publisherWithOptions:](self->_biomeStream, "publisherWithOptions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __51__LCFBiomeManager_readTimeStamps_endDate_reversed___block_invoke_40;
  v22[3] = &unk_25109F2A8;
  v23 = v17;
  v18 = v17;
  v19 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_39, v22);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", v18);

  return v20;
}

void __51__LCFBiomeManager_readTimeStamps_endDate_reversed___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_24032B000, v0, OS_LOG_TYPE_INFO, "Completed.", v1, 2u);
  }
}

void __51__LCFBiomeManager_readTimeStamps_endDate_reversed___block_invoke_40(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

- (id)readDataWithTimestamp:(id)a3 endDate:(id)a4 reversed:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v5 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    v11 = v10;
    objc_msgSend(v8, "timeIntervalSince1970");
    v13 = v12;
    objc_msgSend(v9, "timeIntervalSince1970");
    *(_DWORD *)buf = 134218240;
    v24 = v13;
    v25 = 2048;
    v26 = v14;
    _os_log_impl(&dword_24032B000, v11, OS_LOG_TYPE_INFO, "Reading Biome events from %f to %f.", buf, 0x16u);

  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v8, v9, -1, -1, v5);
  -[BMStream publisherWithOptions:](self->_biomeStream, "publisherWithOptions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __58__LCFBiomeManager_readDataWithTimestamp_endDate_reversed___block_invoke_43;
  v21[3] = &unk_25109F2A8;
  v18 = v17;
  v22 = v18;
  v19 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_42, v21);

  return v18;
}

void __58__LCFBiomeManager_readDataWithTimestamp_endDate_reversed___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = LCFLogContextBiomeManager;
  if (os_log_type_enabled((os_log_t)LCFLogContextBiomeManager, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_24032B000, v0, OS_LOG_TYPE_INFO, "Completed.", v1, 2u);
  }
}

void __58__LCFBiomeManager_readDataWithTimestamp_endDate_reversed___block_invoke_43(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a2;
  objc_msgSend(v4, "timestamp");
  objc_msgSend(v3, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(v4, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v7);

}

- (BMStream)biomeStream
{
  return self->_biomeStream;
}

- (BMSource)biomeSource
{
  return self->_biomeSource;
}

- (void)setBiomeSource:(id)a3
{
  objc_storeStrong((id *)&self->_biomeSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeSource, 0);
  objc_storeStrong((id *)&self->_biomeStream, 0);
}

void __29__LCFBiomeManager_writeData___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24032B000, log, OS_LOG_TYPE_ERROR, "_biomeSource already exists.", v1, 2u);
}

@end
