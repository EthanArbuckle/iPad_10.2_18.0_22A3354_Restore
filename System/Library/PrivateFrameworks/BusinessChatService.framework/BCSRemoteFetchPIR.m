@implementation BCSRemoteFetchPIR

- (id)initWithEnvironment:(void *)a3 metricFactory:
{
  id v6;
  id v7;
  id *v8;
  uint64_t v9;
  __CFString *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  dispatch_queue_t v16;
  id v17;
  NSObject *v18;
  void *v19;
  int v20;
  objc_super v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)BCSRemoteFetchPIR;
    v8 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_msgSend(v6, "secondaryIdentifier");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = (__CFString *)v9;
      else
        v10 = CFSTR("com.apple.businessservicesd");
      v11 = objc_alloc(MEMORY[0x24BE16DD8]);
      objc_msgSend(a1[1], "pirUseCase");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithUseCase:sourceApplicationBundleIdentifier:", v12, v10);

      v14 = objc_msgSend(objc_alloc(MEMORY[0x24BE16DE8]), "initWithClientConfig:", v13);
      v15 = a1[3];
      a1[3] = (id)v14;

      v16 = dispatch_queue_create("com.apple.businesschat.calleridresolver.pir", 0);
      v17 = a1[4];
      a1[4] = v16;

      ABSLogCommon();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "pirUseCase");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v6, "pirUsesCompression");
        *(_DWORD *)buf = 138412546;
        v24 = v19;
        v25 = 1024;
        v26 = v20;
        _os_log_impl(&dword_20ACAD000, v18, OS_LOG_TYPE_DEFAULT, "Fetch from PIR configured for use case '%@', compressed: %d", buf, 0x12u);

      }
    }
  }

  return a1;
}

- (void)fetchDataMatching:(id)a3 timeout:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  BCSRemoteFetchPIR *v33;
  id v34;
  __int128 *v35;
  _QWORD block[4];
  id v37;
  id v38;
  __int128 *p_buf;
  uint8_t v40[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int128 buf;
  uint64_t v45;
  char v46;
  uint64_t v47;
  _QWORD v48[4];

  v48[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[BCSRemoteFetchPIR fetchDataMatching:timeout:completion:]";
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v9)
  {
    objc_msgSend(v8, "itemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_25462B838);

    if ((v12 & 1) != 0)
    {
      objc_msgSend(v8, "itemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x24BDD1648]);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v45 = 0x2020000000;
      v46 = 0;
      -[BCSRemoteFetchPIR metricFactory](self, "metricFactory");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "measurementFactory");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "pirFetchTimingMeasurementForItemIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "begin");
      v19 = dispatch_time(0, a4);
      -[BCSRemoteFetchPIR pirQueue](self, "pirQueue");
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke;
      block[3] = &unk_24C39D4A8;
      v21 = v14;
      v37 = v21;
      p_buf = &buf;
      v22 = v9;
      v38 = v22;
      dispatch_after(v19, v20, block);

      objc_msgSend(v13, "pirKey");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      ABSLogCommon();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v40 = 136315394;
        v41 = "-[BCSRemoteFetchPIR fetchDataMatching:timeout:completion:]";
        v42 = 2112;
        v43 = v23;
        _os_log_impl(&dword_20ACAD000, v24, OS_LOG_TYPE_DEFAULT, "%s - fetching data from PIR for key '%@'", v40, 0x16u);
      }

      -[BCSRemoteFetchPIR pirClient](self, "pirClient");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke_60;
      v30[3] = &unk_24C39D4D0;
      v26 = v18;
      v31 = v26;
      v27 = v21;
      v35 = &buf;
      v32 = v27;
      v33 = self;
      v34 = v22;
      objc_msgSend(v25, "requestDataByStringKeyword:completionHandler:", v23, v30);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      ABSLogCommon();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[BCSRemoteFetchPIR fetchDataMatching:timeout:completion:]";
        _os_log_impl(&dword_20ACAD000, v28, OS_LOG_TYPE_DEFAULT, "%s - Invalid item identifier (non-PIR identifying)", (uint8_t *)&buf, 0xCu);
      }

      v47 = *MEMORY[0x24BDD0FC8];
      v48[0] = CFSTR("Invalid item identifier (non-PIR identifying)");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 1000, v29);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
    }

  }
}

void __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "lock");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    objc_msgSend(*(id *)(a1 + 32), "unlock");
  }
  else
  {
    *(_BYTE *)(v2 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 32), "unlock");
    v5 = *MEMORY[0x24BDD0FC8];
    v6[0] = CFSTR("Timeout waiting for response from PIR");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 43, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __58__BCSRemoteFetchPIR_fetchDataMatching_timeout_completion___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  objc_msgSend(*(id *)(a1 + 40), "lock");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_msgSend(*(id *)(a1 + 40), "unlock");
  }
  else
  {
    *(_BYTE *)(v6 + 24) = 1;
    objc_msgSend(*(id *)(a1 + 40), "unlock");
    v7 = v11;
    objc_msgSend(*(id *)(a1 + 48), "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "pirUsesCompression");

    if ((v9 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 48), "decompressData:", v7);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v10;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (id)decompressData:(id)a3
{
  void *v3;
  id v4;
  id v5;
  uint8_t *v6;
  size_t v7;
  id v8;
  const uint8_t *v9;
  size_t v10;
  size_t v11;
  void *v12;
  NSObject *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDBCEC8];
  v4 = a3;
  objc_msgSend(v3, "dataWithLength:", 0x4000);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = (uint8_t *)objc_msgSend(v5, "mutableBytes");
  v7 = objc_msgSend(v5, "length");
  v8 = objc_retainAutorelease(v4);
  v9 = (const uint8_t *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v11 = compression_decode_buffer(v6, v7, v9, v10, 0, COMPRESSION_LZ4_RAW);
  if (v11)
  {
    objc_msgSend(v5, "subdataWithRange:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    ABSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[BCSRemoteFetchPIR decompressData:]";
      _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "%s - Failed to unzip", (uint8_t *)&v15, 0xCu);
    }

    v12 = 0;
  }

  return v12;
}

- (BCSPIRServerEnvironmentProtocol)environment
{
  return self->_environment;
}

- (BCSMetricFactoryProtocol)metricFactory
{
  return self->_metricFactory;
}

- (void)setMetricFactory:(id)a3
{
  objc_storeStrong((id *)&self->_metricFactory, a3);
}

- (CMLKeywordPIRClient)pirClient
{
  return self->_pirClient;
}

- (void)setPirClient:(id)a3
{
  objc_storeStrong((id *)&self->_pirClient, a3);
}

- (OS_dispatch_queue)pirQueue
{
  return self->_pirQueue;
}

- (void)setPirQueue:(id)a3
{
  objc_storeStrong((id *)&self->_pirQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pirQueue, 0);
  objc_storeStrong((id *)&self->_pirClient, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
