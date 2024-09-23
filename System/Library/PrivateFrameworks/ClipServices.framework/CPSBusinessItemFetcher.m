@implementation CPSBusinessItemFetcher

- (void)fetchBusinessMetadataForURL:(id)a3 completion:(id)a4
{
  -[CPSBusinessItemFetcher fetchBusinessMetadataForURL:availabilityHandler:completion:](self, "fetchBusinessMetadataForURL:availabilityHandler:completion:", a3, 0, a4);
}

- (void)fetchBusinessMetadataForURL:(id)a3 availabilityHandler:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  BCSBusinessQueryService *v11;
  BCSBusinessQueryService *businessQueryService;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  BCSBusinessQueryService *v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  CPSBusinessItemFetcher *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!self->_businessQueryService)
  {
    v11 = (BCSBusinessQueryService *)objc_alloc_init(MEMORY[0x24BE0FF00]);
    businessQueryService = self->_businessQueryService;
    self->_businessQueryService = v11;

  }
  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke;
  v22[3] = &unk_24C3B91B0;
  v14 = v8;
  v23 = v14;
  v15 = v9;
  v25 = v15;
  v16 = v10;
  v26 = v16;
  v24 = self;
  v17 = (void *)MEMORY[0x20BD30A54](v22);
  v18 = objc_opt_respondsToSelector();
  v19 = self->_businessQueryService;
  if ((v18 & 1) != 0)
  {
    -[BCSBusinessQueryService isBusinessRegisteredForURL:chopURL:completion:](v19, "isBusinessRegisteredForURL:chopURL:completion:", v14, 1, v17);
  }
  else
  {
    v20[0] = v13;
    v20[1] = 3221225472;
    v20[2] = __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_7;
    v20[3] = &unk_24C3B91D8;
    v21 = v17;
    -[BCSBusinessQueryService isBusinessRegisteredForURL:completion:](v19, "isBusinessRegisteredForURL:completion:", v14, v20);

  }
}

void __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = CPS_LOG_CHANNEL_PREFIXClipServices();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = CFSTR("NO");
    v11 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)a2)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138740227;
    v26 = v11;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_20AD44000, v9, OS_LOG_TYPE_INFO, "Remote Client: Has ABR entry for %{sensitive}@, %@", buf, 0x16u);
  }
  if (v8)
  {
    v12 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_cold_1((uint64_t)v8, v12, v13, v14, v15, v16, v17, v18);
  }
  v19 = *(_QWORD *)(a1 + 48);
  if (v19)
    (*(void (**)(uint64_t, uint64_t, id))(v19 + 16))(v19, a2, v7);
  if ((a2 & 1) != 0)
  {
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_3;
    v22[3] = &unk_24C3B9188;
    v24 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v21, "fetchLinkItemWithURL:completion:", v20, v22);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CPSClipMetadata *v14;
  void *v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = CPS_LOG_CHANNEL_PREFIXClipServices();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_3_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
      if (v5)
        goto LABEL_4;
LABEL_10:
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      goto LABEL_11;
    }
  }
  if (!v5)
    goto LABEL_10;
LABEL_4:
  v14 = -[CPSClipMetadata initWithBusinessItem:]([CPSClipMetadata alloc], "initWithBusinessItem:", v5);
  -[CPSClipMetadata clipURL](v14, "clipURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    -[CPSClipMetadata setClipURL:](v14, "setClipURL:", *(_QWORD *)(a1 + 32));
  -[CPSClipMetadata clipRequestURL](v14, "clipRequestURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
    -[CPSClipMetadata setClipRequestURL:](v14, "setClipRequestURL:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

LABEL_11:
}

uint64_t __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchBusinessMetadataForURLHash:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  BCSBusinessQueryService *businessQueryService;
  BCSBusinessQueryService *v9;
  BCSBusinessQueryService *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  businessQueryService = self->_businessQueryService;
  if (!businessQueryService)
  {
    v9 = (BCSBusinessQueryService *)objc_alloc_init(MEMORY[0x24BE0FF00]);
    v10 = self->_businessQueryService;
    self->_businessQueryService = v9;

    businessQueryService = self->_businessQueryService;
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__CPSBusinessItemFetcher_fetchBusinessMetadataForURLHash_completion___block_invoke;
  v12[3] = &unk_24C3B9200;
  v13 = v7;
  v11 = v7;
  -[BCSBusinessQueryService fetchLinkItemWithHash:completion:](businessQueryService, "fetchLinkItemWithHash:completion:", v6, v12);

}

void __69__CPSBusinessItemFetcher_fetchBusinessMetadataForURLHash_completion___block_invoke(uint64_t a1, void *a2)
{
  CPSClipMetadata *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[CPSClipMetadata initWithBusinessItem:]([CPSClipMetadata alloc], "initWithBusinessItem:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessQueryService, 0);
}

void __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AD44000, a2, a3, "fetchBusinessMetadataForURL: Error calling -isBusinessRegisteredForURL: %@", a5, a6, a7, a8, 2u);
}

void __85__CPSBusinessItemFetcher_fetchBusinessMetadataForURL_availabilityHandler_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20AD44000, a2, a3, "fetchBusinessMetadataForURL: Error calling -fetchLinkItemWithURL: %@", a5, a6, a7, a8, 2u);
}

@end
