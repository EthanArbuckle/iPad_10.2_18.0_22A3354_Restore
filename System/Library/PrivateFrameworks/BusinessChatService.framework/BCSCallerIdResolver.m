@implementation BCSCallerIdResolver

- (id)initWithEnvironment:(void *)a3 itemCache:(void *)a4 cacheSkipper:(void *)a5 metricFactory:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  id *v15;
  id v16;
  objc_super v18;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v18.receiver = a1;
    v18.super_class = (Class)BCSCallerIdResolver;
    v14 = (id *)objc_msgSendSuper2(&v18, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
      v15 = -[BCSRemoteFetchPIR initWithEnvironment:metricFactory:]((id *)[BCSRemoteFetchPIR alloc], v10, v13);
      v16 = a1[5];
      a1[5] = v15;

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
  if (objc_msgSend(v4, "type") != 3)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  -[BCSCallerIdResolver itemCacheSkipper](self, "itemCacheSkipper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldSkipCacheForItemOfType:", objc_msgSend(v4, "type"));

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[BCSCallerIdResolver itemCache](self, "itemCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemMatching:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v7, "isExpired") && objc_msgSend(v7, "type") != 3)
  {
    ABSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBCSType(objc_msgSend(v4, "type"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[BCSCallerIdResolver cachedItemMatching:]";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_20ACAD000, v9, OS_LOG_TYPE_DEFAULT, "%s - Cached item found but expired - type: %@ --> deleting", (uint8_t *)&v13, 0x16u);

    }
    -[BCSCallerIdResolver itemCache](self, "itemCache");
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
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  BCSCallerIdResolver *v36;
  void (**v37)(id, void *, _QWORD);
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *, _QWORD))a5;
  objc_msgSend(v8, "itemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  if (v12 == 3)
  {
    objc_msgSend(v8, "itemIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCSCallerIdResolver cachedItemMatching:](self, "cachedItemMatching:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[BCSCallerIdResolver metricFactory](self, "metricFactory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "measurementFactory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "itemCacheHitMeasurementForItemIdentifier:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCacheHitMeasurement:", v18);

    objc_msgSend(v9, "cacheHitMeasurement");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFlag:", v14 != 0);

    ABSLogCommon();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v21)
      {
        objc_msgSend(v8, "itemIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBCSType(objc_msgSend(v22, "type"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v39 = "-[BCSCallerIdResolver itemMatching:metric:completion:]";
        v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_DEFAULT, "%s - Item found in cache for - type: %@", buf, 0x16u);

      }
      v10[2](v10, v14, 0);
    }
    else
    {
      if (v21)
      {
        objc_msgSend(v8, "itemIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromBCSType(objc_msgSend(v25, "type"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315394;
        v39 = "-[BCSCallerIdResolver itemMatching:metric:completion:]";
        v40 = 2112;
        v41 = v26;
        _os_log_impl(&dword_20ACAD000, v20, OS_LOG_TYPE_DEFAULT, "%s - Item not found in cache for - type: %@", buf, 0x16u);

      }
      -[BCSCallerIdResolver metricFactory](self, "metricFactory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "measurementFactory");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "itemIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "businessCallerFetchTimingMeasurementForItemIdentifier:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "begin");
      -[BCSCallerIdResolver pirFetch](self, "pirFetch");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __54__BCSCallerIdResolver_itemMatching_metric_completion___block_invoke;
      v33[3] = &unk_24C39CC00;
      v34 = v30;
      v35 = v8;
      v36 = self;
      v37 = v10;
      v32 = v30;
      objc_msgSend(v31, "fetchDataMatching:timeout:completion:", v35, 30000000000, v33);

      v14 = 0;
    }
  }
  else
  {
    v42 = *MEMORY[0x24BDD0FC8];
    v43[0] = CFSTR("Invalid type");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, &v42, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v24);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(id, void *, void *))v10)[2](v10, 0, v14);
  }

}

void __54__BCSCallerIdResolver_itemMatching_metric_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  BCSBusinessCallerItem *v5;
  BCSBusinessCallerItem *v6;
  NSObject *v7;
  void *v8;
  char *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  BCSCallerIdParquetMessage *v13;
  BCSBusinessCallerItem *v14;
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
  BCSBusinessCallerItem *v32;
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
      v10 = "No match found in PIR for type: %@";
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
      v28 = "-[BCSCallerIdResolver itemMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v9;
      v31 = 2112;
      v32 = v6;
      v10 = "%s - Error fetching from PIR for - type: %@, error: %@";
      v11 = v7;
      v12 = 32;
LABEL_7:
      _os_log_impl(&dword_20ACAD000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v13 = -[BCSCallerIdParquetMessage initWithData:]([BCSCallerIdParquetMessage alloc], "initWithData:", v5);
  if (v13)
  {
    v14 = -[BCSBusinessCallerItem initWithParquetMessage:]([BCSBusinessCallerItem alloc], "initWithParquetMessage:", v13);
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
      v28 = "-[BCSCallerIdResolver itemMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v14;
      _os_log_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEFAULT, "%s - Item fetched from PIR for - type: %@, item: %@", buf, 0x20u);

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
    v14 = (BCSBusinessCallerItem *)objc_claimAutoreleasedReturnValue();

    ABSLogCommon();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v23, "type"));
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v28 = "-[BCSCallerIdResolver itemMatching:metric:completion:]_block_invoke";
      v29 = 2112;
      v30 = v24;
      v31 = 2112;
      v32 = v5;
      _os_log_impl(&dword_20ACAD000, v22, OS_LOG_TYPE_DEFAULT, "%s - Invalid message from PIR for - type: %@, data: %@", buf, 0x20u);

    }
    v20 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v20();

LABEL_17:
}

- (BCSPIRServerEnvironmentProtocol)environment
{
  return self->_environment;
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

- (BCSRemoteFetchPIR)pirFetch
{
  return self->_pirFetch;
}

- (void)setPirFetch:(id)a3
{
  objc_storeStrong((id *)&self->_pirFetch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pirFetch, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_itemCacheSkipper, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
  objc_storeStrong((id *)&self->_environment, 0);
}

@end
