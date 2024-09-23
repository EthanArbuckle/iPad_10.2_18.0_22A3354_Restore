@implementation NRNewsDaemonBloomFilterInfoService

- (NRNewsDaemonBloomFilterInfoService)init
{
  NRNewsDaemonBloomFilterInfoService *v2;
  id v3;
  NRNewsDaemonBloomFilterInfoService *v4;
  uint64_t v5;
  FCAsyncOnceOperation *fetchOnceOperation;
  _QWORD v8[4];
  NRNewsDaemonBloomFilterInfoService *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NRNewsDaemonBloomFilterInfoService;
  v2 = -[NRNewsDaemonBloomFilterInfoService init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BE6CAD8]);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__NRNewsDaemonBloomFilterInfoService_init__block_invoke;
    v8[3] = &unk_24DA3A1A8;
    v4 = v2;
    v9 = v4;
    v5 = objc_msgSend(v3, "initWithBlock:", v8);
    fetchOnceOperation = v4->_fetchOnceOperation;
    v4->_fetchOnceOperation = (FCAsyncOnceOperation *)v5;

  }
  return v2;
}

uint64_t __42__NRNewsDaemonBloomFilterInfoService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__NRNewsDaemonBloomFilterInfoService_init__block_invoke_2;
  v7[3] = &unk_24DA3A180;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v8, "_fetchBloomFilterInfoWithCompletion:", v7);

  return 0;
}

void __42__NRNewsDaemonBloomFilterInfoService_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id obj;

  obj = a2;
  v5 = a3;
  v6 = obj;
  if (!obj)
  {
    objc_msgSend(MEMORY[0x24BE6D228], "fc_fullBloomFilterInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 8), v6);
  if (!obj)

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)fetchWebURLBloomFilterInfoWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[NRNewsDaemonBloomFilterInfoService fetchOnceOperation](self, "fetchOnceOperation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __79__NRNewsDaemonBloomFilterInfoService_fetchWebURLBloomFilterInfoWithCompletion___block_invoke;
  v8[3] = &unk_24DA3A1D0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  v7 = (id)objc_msgSend(v5, "executeWithCompletionHandler:", v8);

}

void __79__NRNewsDaemonBloomFilterInfoService_fetchWebURLBloomFilterInfoWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bloomFilterInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)_fetchBloomFilterInfoWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v3 = a3;
  if (!v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[NRNewsDaemonBloomFilterInfoService _fetchBloomFilterInfoWithCompletion:].cold.1();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.newsd.url-resolution"), 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255035BC0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_fetchWebURLBloomFilterInfoWithCompletion_, 0, 1);

  objc_msgSend(v4, "setRemoteObjectInterface:", v5);
  objc_msgSend(v4, "resume");
  v7 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __74__NRNewsDaemonBloomFilterInfoService__fetchBloomFilterInfoWithCompletion___block_invoke;
  v16[3] = &unk_24DA3A1F8;
  v8 = v3;
  v18 = v8;
  v9 = v4;
  v17 = v9;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __74__NRNewsDaemonBloomFilterInfoService__fetchBloomFilterInfoWithCompletion___block_invoke_2;
  v13[3] = &unk_24DA3A220;
  v14 = v9;
  v15 = v8;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "fetchWebURLBloomFilterInfoWithCompletion:", v13);

}

uint64_t __74__NRNewsDaemonBloomFilterInfoService__fetchBloomFilterInfoWithCompletion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __74__NRNewsDaemonBloomFilterInfoService__fetchBloomFilterInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (NTPBBloomFilterInfo)bloomFilterInfo
{
  return self->_bloomFilterInfo;
}

- (void)setBloomFilterInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (FCAsyncOnceOperation)fetchOnceOperation
{
  return self->_fetchOnceOperation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchOnceOperation, 0);
  objc_storeStrong((id *)&self->_bloomFilterInfo, 0);
}

- (void)_fetchBloomFilterInfoWithCompletion:.cold.1()
{
  void *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "completion");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NRNewsDaemonBloomFilterInfoService _fetchBloomFilterInfoWithCompletion:]";
  v3 = 2080;
  v4 = "NRNewsDaemonBloomFilterInfoService.m";
  v5 = 1024;
  v6 = 55;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_218F22000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

@end
