@implementation BCSBusinessEmailResolver

- (id)initWithMetadataEnvironment:(void *)a3 logoEnvironment:(void *)a4 itemCache:(void *)a5 cacheSkipper:(void *)a6 metricFactory:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  id *v17;
  id v18;
  id *v19;
  id v20;
  objc_super v22;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    v22.receiver = a1;
    v22.super_class = (Class)BCSBusinessEmailResolver;
    v16 = (id *)objc_msgSendSuper2(&v22, sel_init);
    a1 = v16;
    if (v16)
    {
      objc_storeStrong(v16 + 1, a4);
      objc_storeStrong(a1 + 2, a5);
      objc_storeStrong(a1 + 3, a6);
      v17 = -[BCSRemoteFetchPIR initWithEnvironment:metricFactory:]((id *)[BCSRemoteFetchPIR alloc], v11, v15);
      v18 = a1[4];
      a1[4] = v17;

      v19 = -[BCSRemoteFetchPIR initWithEnvironment:metricFactory:]((id *)[BCSRemoteFetchPIR alloc], v12, v15);
      v20 = a1[5];
      a1[5] = v19;

    }
  }

  return a1;
}

- (id)cachedItemMatching:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "type") != 4)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  -[BCSBusinessEmailResolver itemCacheSkipper](self, "itemCacheSkipper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSkipCacheForItemOfType:", objc_msgSend(v4, "type"));

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[BCSBusinessEmailResolver itemCache](self, "itemCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemMatching:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "isExpired") && objc_msgSend(v7, "type") != 4)
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBCSType(objc_msgSend(v4, "type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[BCSBusinessEmailResolver cachedItemMatching:]";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "%s - Cached item found but expired - type: %@ --> deleting", (uint8_t *)&v13, 0x16u);

    }
    -[BCSBusinessEmailResolver itemCache](self, "itemCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "deleteItemMatching:", v4);

    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

- (void)itemMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *, _QWORD);
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char isKindOfClass;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  uint64_t v34;
  const __CFString *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  ABSLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[BCSBusinessEmailResolver itemMatching:metric:completion:]";
    _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  objc_msgSend(v8, "itemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 == 4)
  {
    objc_msgSend(v8, "itemIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSBusinessEmailResolver cachedItemMatching:](self, "cachedItemMatching:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[BCSBusinessEmailResolver metricFactory](self, "metricFactory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "measurementFactory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "itemCacheHitMeasurementForItemIdentifier:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCacheHitMeasurement:", v19);

    objc_msgSend(v9, "cacheHitMeasurement");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFlag:", v15 != 0);

    ABSLogCommon();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v22)
      {
        objc_msgSend(v8, "itemIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBCSType(objc_msgSend(v23, "type"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v37 = "-[BCSBusinessEmailResolver itemMatching:metric:completion:]";
        v38 = 2112;
        v39 = v24;
        _os_log_impl(&dword_20ACAD000, v21, OS_LOG_TYPE_DEFAULT, "%s - Item found in cache for - type: %@", buf, 0x16u);

      }
      v10[2](v10, v15, 0);
    }
    else
    {
      if (v22)
      {
        objc_msgSend(v8, "itemIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBCSType(objc_msgSend(v26, "type"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v37 = "-[BCSBusinessEmailResolver itemMatching:metric:completion:]";
        v38 = 2112;
        v39 = v27;
        _os_log_impl(&dword_20ACAD000, v21, OS_LOG_TYPE_DEFAULT, "%s - Item not found in cache for - type: %@", buf, 0x16u);

      }
      objc_msgSend(v8, "itemIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[BCSBusinessEmailResolver _metadataMatching:metric:completion:](self, "_metadataMatching:metric:completion:", v8, v9, v10);
      }
      else
      {
        objc_msgSend(v8, "itemIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v31 = objc_opt_isKindOfClass();

        if ((v31 & 1) != 0)
        {
          -[BCSBusinessEmailResolver _logoMatching:metric:completion:](self, "_logoMatching:metric:completion:", v8, v9, v10);
        }
        else
        {
          v34 = *MEMORY[0x24BDD0FC8];
          v35 = CFSTR("Invalid identifier type");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          ((void (**)(id, void *, void *))v10)[2](v10, 0, v33);
        }
      }
      v15 = 0;
    }
  }
  else
  {
    v40 = *MEMORY[0x24BDD0FC8];
    v41[0] = CFSTR("Invalid type");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v10)[2](v10, 0, v15);
  }

}

- (void)_metadataMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BCSBusinessEmailResolver *v20;
  id v21;

  v7 = a3;
  v8 = a5;
  -[BCSBusinessEmailResolver metricFactory](self, "metricFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "measurementFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "businessEmailFetchTimingMeasurementForItemIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "begin");
  -[BCSBusinessEmailResolver pirFetchMetadata](self, "pirFetchMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __64__BCSBusinessEmailResolver__metadataMatching_metric_completion___block_invoke;
  v17[3] = &unk_24C39CC00;
  v18 = v12;
  v19 = v7;
  v20 = self;
  v21 = v8;
  v14 = v8;
  v15 = v7;
  v16 = v12;
  objc_msgSend(v13, "fetchDataMatching:timeout:completion:", v15, 30000000000, v17);

}

void __64__BCSBusinessEmailResolver__metadataMatching_metric_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BCSBusinessEmailItem *v5;
  BCSBusinessEmailItem *v6;
  NSObject *v7;
  void *v8;
  char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  BCSEmailMetadataParquetMessage *v13;
  BCSBusinessEmailItem *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char *v19;
  void (*v20)(void);
  void *v21;
  NSObject *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  BCSBusinessEmailItem *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  if (!v5)
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v8, "type"));
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      v10 = "No match found in PIR for metadata of type: %@";
      v11 = v7;
      v12 = 12;
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_17;
  }
  if (v6)
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v8, "type"));
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSBusinessEmailResolver _metadataMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v6;
      v10 = "%s - Error fetching from PIR for metadata - type: %@, error: %@";
      v11 = v7;
      v12 = 32;
LABEL_7:
      _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v13 = -[BCSEmailMetadataParquetMessage initWithData:]([BCSEmailMetadataParquetMessage alloc], "initWithData:", v5);
  if (v13)
  {
    v14 = -[BCSBusinessEmailItem initWithEmailMessage:]([BCSBusinessEmailItem alloc], "initWithEmailMessage:", v13);
    objc_msgSend(*(id *)(a1 + 48), "itemCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateItem:withItemIdentifier:", v14, v16);

    ABSLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v18, "type"));
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSBusinessEmailResolver _metadataMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEFAULT, "%s - Item fetched from PIR for metadata - type: %@, item: %@", buf, 0x20u);

    }
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v25 = *MEMORY[0x24BDD0FC8];
    v26 = CFSTR("Failed to decode PIR record");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v21);
    v14 = (BCSBusinessEmailItem *)objc_claimAutoreleasedReturnValue();

    ABSLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v23, "type"));
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSBusinessEmailResolver _metadataMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_20ACAD000, v22, OS_LOG_TYPE_DEFAULT, "%s - Invalid message from PIR for metadata - type: %@, data: %@", buf, 0x20u);

    }
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v20();

LABEL_17:
}

- (void)_logoMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  BCSBusinessEmailResolver *v20;
  id v21;

  v7 = a3;
  v8 = a5;
  -[BCSBusinessEmailResolver metricFactory](self, "metricFactory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "measurementFactory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "itemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "businessEmailFetchTimingMeasurementForItemIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "begin");
  -[BCSBusinessEmailResolver pirFetchLogo](self, "pirFetchLogo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __60__BCSBusinessEmailResolver__logoMatching_metric_completion___block_invoke;
  v17[3] = &unk_24C39CC00;
  v18 = v12;
  v19 = v7;
  v20 = self;
  v21 = v8;
  v14 = v8;
  v15 = v7;
  v16 = v12;
  objc_msgSend(v13, "fetchDataMatching:timeout:completion:", v15, 30000000000, v17);

}

void __60__BCSBusinessEmailResolver__logoMatching_metric_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BCSBusinessLogo *v5;
  BCSBusinessLogo *v6;
  NSObject *v7;
  void *v8;
  char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  BCSEmailLogoParquetMessage *v13;
  BCSBusinessLogo *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char *v19;
  void (*v20)(void);
  void *v21;
  NSObject *v22;
  void *v23;
  char *v24;
  uint64_t v25;
  const __CFString *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  BCSBusinessLogo *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  if (!v5)
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v8, "type"));
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      v10 = "No match found in PIR for logo of type: %@";
      v11 = v7;
      v12 = 12;
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_17;
  }
  if (v6)
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v8, "type"));
      v9 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSBusinessEmailResolver _logoMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v6;
      v10 = "%s - Error fetching from PIR for logo - type: %@, error: %@";
      v11 = v7;
      v12 = 32;
LABEL_7:
      _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v13 = -[BCSEmailLogoParquetMessage initWithData:]([BCSEmailLogoParquetMessage alloc], "initWithData:", v5);
  if (v13)
  {
    v14 = -[BCSBusinessLogo initWithMessage:logoURL:]([BCSBusinessLogo alloc], "initWithMessage:logoURL:", v13, 0);
    objc_msgSend(*(id *)(a1 + 48), "itemCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateItem:withItemIdentifier:", v14, v16);

    ABSLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v18, "type"));
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSBusinessEmailResolver _logoMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEFAULT, "%s - Item fetched from PIR for logo - type: %@, item: %@", buf, 0x20u);

    }
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    v25 = *MEMORY[0x24BDD0FC8];
    v26 = CFSTR("Failed to decode PIR record");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v21);
    v14 = (BCSBusinessLogo *)objc_claimAutoreleasedReturnValue();

    ABSLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v23, "type"));
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSBusinessEmailResolver _logoMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_20ACAD000, v22, OS_LOG_TYPE_DEFAULT, "%s - Invalid message from PIR for logo - type: %@, data: %@", buf, 0x20u);

    }
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v20();

LABEL_17:
}

- (BCSItemCaching)itemCache
{
  return self->_itemCache;
}

- (BCSItemCacheSkipping)itemCacheSkipper
{
  return self->_itemCacheSkipper;
}

- (BCSMetricFactoryProtocol)metricFactory
{
  return self->_metricFactory;
}

- (void)setMetricFactory:(id)a3
{
  objc_storeStrong((id *)&self->_metricFactory, a3);
}

- (BCSRemoteFetchPIR)pirFetchMetadata
{
  return self->_pirFetchMetadata;
}

- (void)setPirFetchMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_pirFetchMetadata, a3);
}

- (BCSRemoteFetchPIR)pirFetchLogo
{
  return self->_pirFetchLogo;
}

- (void)setPirFetchLogo:(id)a3
{
  objc_storeStrong((id *)&self->_pirFetchLogo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pirFetchLogo, 0);
  objc_storeStrong((id *)&self->_pirFetchMetadata, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_itemCacheSkipper, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
}

@end
