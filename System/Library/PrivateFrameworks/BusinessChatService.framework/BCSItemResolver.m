@implementation BCSItemResolver

- (id)initWithItemCache:(void *)a3 cacheSkipper:(void *)a4 remoteFetcher:(void *)a5 metricFactory:
{
  id v10;
  id v11;
  id v12;
  id v13;
  id *v14;
  objc_super v16;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)BCSItemResolver;
    v14 = (id *)objc_msgSendSuper2(&v16, sel_init);
    a1 = v14;
    if (v14)
    {
      objc_storeStrong(v14 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
      objc_storeStrong(a1 + 4, a5);
    }
  }

  return a1;
}

- (id)cachedItemMatching:(id)a3
{
  id v4;
  BCSItemCacheSkipping *itemCacheSkipper;
  BCSItemCacheSkipping *v6;
  char v7;
  void *v8;
  BCSItemCaching *itemCache;
  NSObject *v10;
  void *v11;
  BCSItemCaching *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self)
    itemCacheSkipper = self->_itemCacheSkipper;
  else
    itemCacheSkipper = 0;
  v6 = itemCacheSkipper;
  v7 = -[BCSItemCacheSkipping shouldSkipCacheForItemOfType:](v6, "shouldSkipCacheForItemOfType:", objc_msgSend(v4, "type"));

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    if (self)
      itemCache = self->_itemCache;
    else
      itemCache = 0;
    -[BCSItemCaching itemMatching:](itemCache, "itemMatching:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v8, "isExpired") && objc_msgSend(v8, "type") != 1)
  {
    ABSLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBCSType(objc_msgSend(v4, "type"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "-[BCSItemResolver cachedItemMatching:]";
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%s - Cached item found but expired - type: %@ --> deleting", (uint8_t *)&v14, 0x16u);

    }
    if (self)
      v12 = self->_itemCache;
    else
      v12 = 0;
    -[BCSItemCaching deleteItemMatching:](v12, "deleteItemMatching:", v4);

    v8 = 0;
  }

  return v8;
}

- (void)itemMatching:(id)a3 metric:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  signed int v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  BCSMetricFactoryProtocol *metricFactory;
  BCSMetricFactoryProtocol *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "itemIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "config");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "buckets");
  if (self)
  {
    if (0x7FFFFFFFFFFFFFFFLL / v13 <= 25)
      v14 = 25;
    else
      v14 = 0x7FFFFFFFFFFFFFFFLL / v13;
    v15 = vcvtmd_s64_f64((double)objc_msgSend(v11, "truncatedHash") / (double)v14);
    v16 = v14 * v15;
    v17 = v14 * (v15 + 1);
  }
  else
  {
    v17 = 0;
    v16 = 0;
  }

  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __50__BCSItemResolver_itemMatching_metric_completion___block_invoke;
  v35[3] = &unk_24C39BF68;
  v35[4] = self;
  v38 = v16;
  v39 = v17;
  v18 = v8;
  v36 = v18;
  v19 = v9;
  v37 = v19;
  v20 = (void (**)(_QWORD))MEMORY[0x20BD30274](v35);
  objc_msgSend(v18, "itemIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCSItemResolver cachedItemMatching:](self, "cachedItemMatching:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    metricFactory = self->_metricFactory;
  else
    metricFactory = 0;
  v24 = metricFactory;
  -[BCSMetricFactoryProtocol measurementFactory](v24, "measurementFactory");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "itemIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "itemCacheHitMeasurementForItemIdentifier:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCacheHitMeasurement:", v27);

  objc_msgSend(v10, "cacheHitMeasurement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setFlag:", v22 != 0);
  ABSLogCommon();
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
  if (v22)
  {
    if (v30)
    {
      objc_msgSend(v18, "itemIdentifier");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v31, "type"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v41 = "-[BCSItemResolver itemMatching:metric:completion:]";
      v42 = 2112;
      v43 = v32;
      _os_log_impl(&dword_20ACAD000, v29, OS_LOG_TYPE_DEFAULT, "%s - Item found in cache for - type: %@", buf, 0x16u);

    }
    (*((void (**)(id, void *, _QWORD))v19 + 2))(v19, v22, 0);
  }
  else
  {
    if (v30)
    {
      objc_msgSend(v18, "itemIdentifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v33, "type"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v41 = "-[BCSItemResolver itemMatching:metric:completion:]";
      v42 = 2112;
      v43 = v34;
      _os_log_impl(&dword_20ACAD000, v29, OS_LOG_TYPE_DEFAULT, "%s - Item not found in cache for - type: %@", buf, 0x16u);

    }
    v20[2](v20);
  }

}

void __50__BCSItemResolver_itemMatching_metric_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
    v2 = (_QWORD *)v2[3];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(void **)(a1 + 40);
  v6 = v2;
  objc_msgSend(v5, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "type");
  objc_msgSend(*(id *)(a1 + 40), "clientBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__BCSItemResolver_itemMatching_metric_completion___block_invoke_2;
  v11[3] = &unk_24C39BF40;
  v10 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v10;
  v13 = *(id *)(a1 + 48);
  objc_msgSend(v6, "fetchItemsWithBucketStartIndex:endIndex:type:forClientBundleID:completion:", v3, v4, v8, v9, v11);

}

void __50__BCSItemResolver_itemMatching_metric_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  _QWORD *v31;
  void *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, void *, uint64_t, _BYTE *);
  void *v41;
  id v42;
  _BYTE *v43;
  _BYTE buf[24];
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v8, "type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      *(_QWORD *)&buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v9;
      *(_WORD *)&buf[22] = 2112;
      v45 = v6;
      _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - Error remote fetching buckets for - type: %@ - %@", buf, 0x20u);

    }
LABEL_4:
    v10 = 0;
    goto LABEL_5;
  }
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  v14 = v12;
  v15 = v14;
  if (v11)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v45 = __Block_byref_object_copy_;
    v46 = __Block_byref_object_dispose_;
    v47 = 0;
    v38 = MEMORY[0x24BDAC760];
    v39 = 3221225472;
    v40 = __47__BCSItemResolver__firstItemInBucket_matching___block_invoke;
    v41 = &unk_24C39BF90;
    v42 = v14;
    v43 = buf;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v38);
    v10 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v10 = 0;
  }

  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v34, "type"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v35;
      _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - Failed to find matching item in bucket - type: %@", buf, 0x16u);

    }
    goto LABEL_4;
  }
  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBCSType(objc_msgSend(v17, "type"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke_2";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v18;
    _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - Successfully found matching item in bucket - type: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "config");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "itemTTL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_14;
  objc_msgSend(*(id *)(a1 + 40), "config");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "itemTTL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  v24 = v23 > 0.0;

  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(*(id *)(a1 + 40), "config");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "itemTTL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    objc_msgSend(v25, "dateWithTimeIntervalSinceNow:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setExpirationDate:", v19);
LABEL_14:

  }
  if (objc_msgSend(v10, "isExpired", v38, v39, v40, v41) && objc_msgSend(v10, "type") != 1)
  {
    ABSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v36, "type"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v37;
      _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - Not caching matching item because it is already expired - type: %@", buf, 0x16u);

    }
  }
  else
  {
    ABSLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "itemIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBCSType(objc_msgSend(v29, "type"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[BCSItemResolver itemMatching:metric:completion:]_block_invoke";
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v30;
      _os_log_impl(&dword_20ACAD000, v28, OS_LOG_TYPE_DEFAULT, "%s - Caching matching item - type: %@", buf, 0x16u);

    }
    v31 = *(_QWORD **)(a1 + 32);
    if (v31)
      v31 = (_QWORD *)v31[1];
    v32 = *(void **)(a1 + 40);
    v33 = v31;
    objc_msgSend(v32, "itemIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "updateItem:withItemIdentifier:", v10, v7);

  }
LABEL_5:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __47__BCSItemResolver__firstItemInBucket_matching___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "matchesItemIdentifying:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_itemRemoteFetcher, 0);
  objc_storeStrong((id *)&self->_itemCacheSkipper, 0);
  objc_storeStrong((id *)&self->_itemCache, 0);
}

@end
