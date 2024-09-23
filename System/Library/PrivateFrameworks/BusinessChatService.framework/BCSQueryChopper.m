@implementation BCSQueryChopper

- (_QWORD)initWithMetricFactory:(_QWORD *)a1
{
  id v4;
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  objc_super v10;

  v4 = a2;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)BCSQueryChopper;
    v5 = objc_msgSendSuper2(&v10, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 2, a2);
      dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("com.apple.businesschatservice.querychopper.serialqueue"), "UTF8String"), v6);
      v8 = (void *)a1[1];
      a1[1] = v7;

    }
  }

  return a1;
}

- (void)queryChopperDelegate:(id)a3 fetchLinkItemModelWithURL:(id)a4 isBloomFilterCached:(BOOL)a5 forClientBundleID:(id)a6 metric:(id)a7 completion:(id)a8
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  dispatch_group_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *serialDispatchQueue;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  dispatch_group_t group;
  id v35;
  void *v36;
  id v37;
  id v38;
  _QWORD block[5];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 *v45;
  _QWORD v46[4];
  dispatch_group_t v47;
  BCSQueryChopper *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v59;
  char v60;
  uint64_t v61;

  v11 = a5;
  v61 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v37 = a6;
  v38 = a7;
  v16 = a8;
  ABSLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached"
                                    ":forClientBundleID:metric:completion:]";
    _os_log_impl(&dword_20ACAD000, v17, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (v16)
  {
    -[BCSQueryChopper _chopItemIdentifiersToFetchFromURL:isBloomFilterCached:]((uint64_t)self, v15, v11);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "count"))
    {
      v18 = dispatch_group_create();
      v19 = (void *)objc_opt_new();
      v20 = (void *)objc_opt_new();
      v21 = (void *)objc_opt_new();
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v59 = 0x2020000000;
      v60 = 0;
      v22 = MEMORY[0x24BDAC760];
      v46[0] = MEMORY[0x24BDAC760];
      v46[1] = 3221225472;
      v46[2] = __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke;
      v46[3] = &unk_24C39CE08;
      group = v18;
      v47 = group;
      v48 = self;
      v49 = v37;
      v35 = v14;
      v50 = v14;
      v23 = v36;
      v51 = v23;
      v33 = v19;
      v52 = v33;
      v24 = v20;
      v53 = v24;
      v25 = v21;
      v54 = v25;
      p_buf = &buf;
      v26 = v38;
      v55 = v26;
      v27 = v16;
      v56 = v27;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v46);
      v28 = v15;
      if (self)
        serialDispatchQueue = self->_serialDispatchQueue;
      else
        serialDispatchQueue = 0;
      block[0] = v22;
      block[1] = 3221225472;
      block[2] = __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_9;
      block[3] = &unk_24C39CE30;
      v45 = &buf;
      block[4] = self;
      v40 = v23;
      v41 = v24;
      v42 = v25;
      v43 = v26;
      v44 = v27;
      v30 = v25;
      v31 = v24;
      dispatch_group_notify(group, serialDispatchQueue, block);

      v14 = v35;
      v15 = v28;

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      ABSLogCommon();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCa"
                                        "ched:forClientBundleID:metric:completion:]";
        _os_log_impl(&dword_20ACAD000, v32, OS_LOG_TYPE_DEFAULT, "%s No items to fetch, bailing...", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v38, "setSuccessfulChop:", -1);
      (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);
    }

  }
}

- (id)_chopItemIdentifiersToFetchFromURL:(int)a3 isBloomFilterCached:
{
  void *v5;
  BCSChoppedItemIdentifierInfo *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  BCSChoppedItemIdentifierInfo *v12;
  BCSChoppedItemIdentifierInfo *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int64_t v18;
  BCSChoppedItemIdentifierInfo *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  int v25;
  int v26;
  id v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[6];
  _QWORD v43[5];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x24BDAC8D0];
  v41 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = (void *)objc_msgSend(v41, "copy");
    +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v6 = +[BCSChoppedItemIdentifierInfo newWithLinkItemIdentifier:chopID:]((uint64_t)BCSChoppedItemIdentifierInfo, v40, 1);
      objc_msgSend(v5, "addObject:", v6);

    }
    objc_msgSend(v39, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8 && a3)
    {
      -[NSURL URLByDeletingFragment](v41);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v37, 0);
      objc_msgSend(v35, "queryItems");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        v51[0] = v32;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "setQueryItems:", v10);

        v11 = v35;
      }
      else
      {
        v11 = v35;
        objc_msgSend(v35, "setQueryItems:", 0);
      }
      objc_msgSend(v11, "URL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v12 = +[BCSChoppedItemIdentifierInfo newWithLinkItemIdentifier:chopID:]((uint64_t)BCSChoppedItemIdentifierInfo, v34, 2);
        objc_msgSend(v5, "addObject:", v12, v30);

      }
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v37, 0);
      objc_msgSend(v36, "setQueryItems:", 0);
      objc_msgSend(v36, "URL");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v38);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v13 = +[BCSChoppedItemIdentifierInfo newWithLinkItemIdentifier:chopID:]((uint64_t)BCSChoppedItemIdentifierInfo, v33, 3);
        objc_msgSend(v5, "addObject:", v13);

      }
      objc_msgSend(v38, "lastPathComponent", v30);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "length"))
      {
        v15 = v38;
        do
        {
          objc_msgSend(v15, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("/")))
              v18 = 5;
            else
              v18 = 4;
            v19 = +[BCSChoppedItemIdentifierInfo newWithLinkItemIdentifier:chopID:]((uint64_t)BCSChoppedItemIdentifierInfo, v17, v18);
            objc_msgSend(v5, "addObject:", v19);

          }
          objc_msgSend(v15, "absoluteString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "length");

          objc_msgSend(v15, "URLByDeletingLastPathComponent");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "absoluteString");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "length");

          if (!objc_msgSend(v16, "length"))
            break;
          v25 = objc_msgSend(v16, "isEqualToString:", CFSTR("/"));
          v26 = v24 > v21 ? 1 : v25;
          v14 = v16;
          v15 = v22;
        }
        while (v26 != 1);

      }
      else
      {
        v16 = v14;
      }

    }
    v27 = v5;
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__4;
    v49 = __Block_byref_object_dispose__4;
    v50 = (id)objc_opt_new();
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy__4;
    v43[4] = __Block_byref_object_dispose__4;
    v44 = (id)objc_opt_new();
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __61__BCSQueryChopper__removeLinkItemDuplicatesInOrderFromArray___block_invoke;
    v42[3] = &unk_24C39CF70;
    v42[4] = v43;
    v42[5] = &v45;
    objc_msgSend(v27, "enumerateObjectsUsingBlock:", v42);
    v28 = (void *)objc_msgSend((id)v46[5], "copy");
    _Block_object_dispose(v43, 8);

    _Block_object_dispose(&v45, 8);
  }
  else
  {
    v28 = 0;
  }

  return v28;
}

void __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BCSQuery *v10;
  uint64_t v11;
  BCSQuery *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  v3 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = *(_QWORD **)(a1 + 40);
  if (v4)
    v4 = (_QWORD *)v4[2];
  v5 = v4;
  objc_msgSend(v5, "measurementFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v7 = (void *)v3[1];
  else
    v7 = 0;
  v8 = v7;
  objc_msgSend(v6, "businessLinkChoppedFetchTimingMeasurementForItemIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "begin");
  v10 = [BCSQuery alloc];
  if (v3)
    v11 = v3[1];
  else
    v11 = 0;
  v12 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:](v10, "initWithItemIdentifier:clientBundleId:shardType:", v11, *(_QWORD *)(a1 + 48), 2);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2;
  v19[3] = &unk_24C39CDE0;
  v13 = *(_QWORD *)(a1 + 40);
  v20 = v9;
  v21 = v13;
  v22 = v3;
  v14 = *(void **)(a1 + 56);
  v23 = *(id *)(a1 + 64);
  v24 = *(id *)(a1 + 72);
  v25 = *(id *)(a1 + 80);
  v15 = *(id *)(a1 + 88);
  v16 = *(_QWORD *)(a1 + 112);
  v26 = v15;
  v30 = v16;
  v27 = *(id *)(a1 + 96);
  v29 = *(id *)(a1 + 104);
  v28 = *(id *)(a1 + 32);
  v17 = v3;
  v18 = v9;
  objc_msgSend(v14, "fetchItemWithQuery:completion:", v12, v19);

}

void __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "end");
  v7 = -[BCSQueryChopper _indexOfItemIdentifierInfo:inItemIdentifierInfos:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56));
  ABSLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v32 = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached:forClientBundleID:metric:"
          "completion:]_block_invoke_2";
    v33 = 2114;
    v34 = v9;
    v35 = 2048;
    v36 = v7;
    v37 = 2112;
    v38 = v6;
    _os_log_impl(&dword_20ACAD000, v8, OS_LOG_TYPE_DEFAULT, "%s - chop attempt found item: %{public}@ - itemPriority:%ld - error:%@", buf, 0x2Au);

  }
  v10 = *(_QWORD *)(a1 + 40);
  if (v10)
    v11 = *(NSObject **)(v10 + 8);
  else
    v11 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_3;
  block[3] = &unk_24C39CDB8;
  v18 = v5;
  v19 = *(id *)(a1 + 64);
  v30 = v7;
  v20 = *(id *)(a1 + 72);
  v21 = v6;
  v12 = *(id *)(a1 + 80);
  v29 = *(_QWORD *)(a1 + 112);
  v13 = *(_QWORD *)(a1 + 40);
  v14 = *(void **)(a1 + 48);
  v22 = v12;
  v23 = v13;
  v24 = v14;
  v25 = *(id *)(a1 + 56);
  v26 = *(id *)(a1 + 88);
  v28 = *(id *)(a1 + 104);
  v27 = *(id *)(a1 + 96);
  v15 = v6;
  v16 = v5;
  dispatch_async(v11, block);

}

- (uint64_t)_indexOfItemIdentifierInfo:(void *)a3 inItemIdentifierInfos:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __68__BCSQueryChopper__indexOfItemIdentifierInfo_inItemIdentifierInfos___block_invoke;
    v9[3] = &unk_24C39CEF8;
    v10 = v5;
    v11 = &v12;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);
    a1 = v13[3];
    if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    {
      ABSLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v17 = "-[BCSQueryChopper _indexOfItemIdentifierInfo:inItemIdentifierInfos:]";
        _os_log_error_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_ERROR, "%s - Index of item identifier not found", buf, 0xCu);
      }

      a1 = 0;
    }

    _Block_object_dispose(&v12, 8);
  }

  return a1;
}

void __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  int v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 128));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v4);

    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v4);

    v5 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = *(void **)(a1 + 64);
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 64), "addObject:");
    if (!v3)
      goto LABEL_23;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    if (!v3)
      goto LABEL_23;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
    goto LABEL_23;
  v9 = *(_QWORD *)(a1 + 72);
  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(a1 + 88);
  v12 = *(id *)(a1 + 80);
  v13 = v10;
  v14 = v11;
  if (!v9)
    goto LABEL_17;
  v15 = -[BCSQueryChopper _indexOfItemIdentifierInfo:inItemIdentifierInfos:](v9, v12, v14);
  if (!v15)
  {

LABEL_20:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = 1;
    ABSLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315138;
      v25 = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached:forClientBundleID:metri"
            "c:completion:]_block_invoke";
      _os_log_impl(&dword_20ACAD000, v23, OS_LOG_TYPE_DEFAULT, "%s - all higher priority items queries have returned from server, return early", (uint8_t *)&v24, 0xCu);
    }

    -[BCSQueryChopper _returnHighestPriorityLinkItemWithItemIdentifiersToFetch:fetchedItems:fetchedErrors:metric:completion:](*(_QWORD *)(a1 + 72), *(void **)(a1 + 88), *(void **)(a1 + 48), *(void **)(a1 + 64), *(void **)(a1 + 96), *(void **)(a1 + 112));
    goto LABEL_23;
  }
  v16 = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
LABEL_17:

    goto LABEL_23;
  }
  v19 = 1;
  while (v16 != v19)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    ++v19;
    if (!v21)
    {
      v22 = v19 - 1;
      goto LABEL_19;
    }
  }
  v22 = v16;
LABEL_19:

  if (v22 >= v16)
    goto LABEL_20;
LABEL_23:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 104));
}

- (void)_returnHighestPriorityLinkItemWithItemIdentifiersToFetch:(void *)a3 fetchedItems:(void *)a4 fetchedErrors:(void *)a5 metric:(void *)a6 completion:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (a1)
  {
    if (objc_msgSend(v11, "count"))
    {
      v23[0] = 0;
      v23[1] = v23;
      v23[2] = 0x2020000000;
      v24 = 0;
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __121__BCSQueryChopper__returnHighestPriorityLinkItemWithItemIdentifiersToFetch_fetchedItems_fetchedErrors_metric_completion___block_invoke;
      v16[3] = &unk_24C39CF48;
      v17 = v12;
      v18 = v14;
      v21 = v15;
      v22 = v23;
      v19 = v11;
      v20 = v13;
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", v16);

      _Block_object_dispose(v23, 8);
    }
    else
    {
      objc_msgSend(v14, "setSuccessfulChop:", -1);
      (*((void (**)(id, _QWORD, _QWORD))v15 + 2))(v15, 0, 0);
    }
  }

}

void __122__BCSQueryChopper_queryChopperDelegate_fetchLinkItemModelWithURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_9(uint64_t a1)
{
  uint64_t v1;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    ABSLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BCSQueryChopper queryChopperDelegate:fetchLinkItemModelWithURL:isBloomFilterCached:forClientBundleID:metric"
           ":completion:]_block_invoke";
      _os_log_impl(&dword_20ACAD000, v3, OS_LOG_TYPE_DEFAULT, "%s - All remote queries have finished, return", (uint8_t *)&v4, 0xCu);
    }

    -[BCSQueryChopper _returnHighestPriorityLinkItemWithItemIdentifiersToFetch:fetchedItems:fetchedErrors:metric:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 64), *(void **)(a1 + 72));
  }
}

- (void)queryChopperDelegate:(id)a3 isBusinessRegisteredForURL:(id)a4 isBloomFilterCached:(BOOL)a5 forClientBundleID:(id)a6 metric:(id)a7 completion:(id)a8
{
  _BOOL4 v11;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  id v35;
  id v36;
  NSObject *v37;
  dispatch_group_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  _QWORD block[4];
  id v45;
  id v46;
  _QWORD *v47;
  uint64_t *v48;
  __int128 *v49;
  _QWORD v50[4];
  NSObject *v51;
  id v52;
  id v53;
  BCSQueryChopper *v54;
  id v55;
  id v56;
  _QWORD *v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t *v60;
  __int128 *p_buf;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t (*v69)(uint64_t, uint64_t);
  void (*v70)(uint64_t);
  id v71;
  uint64_t v72;
  uint64_t *v73;
  uint64_t v74;
  uint64_t (*v75)(uint64_t, uint64_t);
  void (*v76)(uint64_t);
  id v77;
  _QWORD v78[4];
  _QWORD v79[3];
  char v80;
  const __CFString *v81;
  uint64_t v82;
  uint8_t v83[128];
  __int128 buf;
  uint64_t v85;
  uint64_t (*v86)(uint64_t, uint64_t);
  void (*v87)(uint64_t);
  id v88;
  uint64_t v89;

  v11 = a5;
  v89 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v42 = a4;
  v40 = a6;
  v41 = a7;
  v14 = a8;
  ABSLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCache"
                                    "d:forClientBundleID:metric:completion:]";
    _os_log_impl(&dword_20ACAD000, v15, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  if (!v14)
    goto LABEL_27;
  -[BCSQueryChopper _chopItemIdentifiersToFetchFromURL:isBloomFilterCached:]((uint64_t)self, v42, v11);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v43, "count"))
  {
    ABSLogCommon();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCac"
                                      "hed:forClientBundleID:metric:completion:]";
      _os_log_impl(&dword_20ACAD000, v37, OS_LOG_TYPE_DEFAULT, "%s No items to check, bailing...", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(v41, "setSuccessfulChop:", -1);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v14 + 2))(v14, 0, 0, 0);
    goto LABEL_26;
  }
  v38 = dispatch_group_create();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v85 = 0x3032000000;
  v86 = __Block_byref_object_copy__4;
  v87 = __Block_byref_object_dispose__4;
  v88 = 0;
  v79[0] = 0;
  v79[1] = v79;
  v79[2] = 0x2020000000;
  v80 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x2020000000;
  v78[3] = 0;
  v72 = 0;
  v73 = &v72;
  v74 = 0x3032000000;
  v75 = __Block_byref_object_copy__4;
  v76 = __Block_byref_object_dispose__4;
  v77 = 0;
  v66 = 0;
  v67 = &v66;
  v68 = 0x3032000000;
  v69 = __Block_byref_object_copy__4;
  v70 = __Block_byref_object_dispose__4;
  v71 = 0;
  if (!MEMORY[0x20BD2FF14]("-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metric:completion:]"))goto LABEL_20;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v43, "count"));
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v73[5];
  v73[5] = v16;

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v18 = v43;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
  if (!v19)
    goto LABEL_19;
  v20 = *(_QWORD *)v63;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v63 != v20)
        objc_enumerationMutation(v18);
      v22 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * v21);
      v23 = (void *)v73[5];
      if (v22)
      {
        v24 = *(id *)(v22 + 8);
        v25 = v24;
        if (v24)
        {
          v26 = (void *)*((_QWORD *)v24 + 2);
          goto LABEL_14;
        }
      }
      else
      {
        v25 = 0;
      }
      v26 = 0;
LABEL_14:
      v27 = v26;
      objc_msgSend(v27, "absoluteString");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v28);

      ++v21;
    }
    while (v19 != v21);
    v29 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v83, 16);
    v19 = v29;
  }
  while (v29);
LABEL_19:

  v30 = v73[5];
  v81 = CFSTR("BCSBusinessQueryServiceChoppedURLs");
  v82 = v30;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v67[5];
  v67[5] = v31;

LABEL_20:
  v33 = MEMORY[0x24BDAC760];
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke;
  v50[3] = &unk_24C39CEA8;
  v34 = v38;
  v51 = v34;
  v52 = v40;
  v53 = v39;
  v54 = self;
  v57 = v78;
  v58 = v79;
  v35 = v41;
  v55 = v35;
  v59 = &v72;
  v36 = v14;
  v56 = v36;
  v60 = &v66;
  p_buf = &buf;
  objc_msgSend(v43, "enumerateObjectsUsingBlock:", v50);
  if (self)
    self = (BCSQueryChopper *)self->_serialDispatchQueue;
  block[0] = v33;
  block[1] = 3221225472;
  block[2] = __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2_16;
  block[3] = &unk_24C39CED0;
  v47 = v79;
  v45 = v35;
  v46 = v36;
  v48 = &v66;
  v49 = &buf;
  dispatch_group_notify(v34, &self->super, block);

  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v72, 8);

  _Block_object_dispose(v78, 8);
  _Block_object_dispose(v79, 8);
  _Block_object_dispose(&buf, 8);

LABEL_26:
LABEL_27:

}

void __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
  BCSQuery *v6;
  uint64_t v7;
  BCSQuery *v8;
  void *v9;
  _QWORD *v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;

  v5 = a2;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v6 = [BCSQuery alloc];
  if (v5)
    v7 = v5[1];
  else
    v7 = 0;
  v8 = -[BCSQuery initWithItemIdentifier:clientBundleId:shardType:](v6, "initWithItemIdentifier:clientBundleId:shardType:", v7, *(_QWORD *)(a1 + 40), 2);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2;
  v11[3] = &unk_24C39CE80;
  v9 = *(void **)(a1 + 48);
  v11[4] = *(_QWORD *)(a1 + 56);
  v16 = *(_OWORD *)(a1 + 80);
  v12 = *(id *)(a1 + 64);
  v13 = v5;
  v17 = *(_QWORD *)(a1 + 96);
  v19 = a3;
  v15 = *(id *)(a1 + 72);
  v18 = *(_OWORD *)(a1 + 104);
  v14 = *(id *)(a1 + 32);
  v10 = v5;
  objc_msgSend(v9, "fetchIsBusinessRegisteredWithQuery:completion:", v8, v11);

}

void __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_msgSend(a2, "hasBusiness");
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    *(_DWORD *)buf = 136315906;
    v27 = "-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metric"
          ":completion:]_block_invoke_2";
    v28 = 2114;
    v29 = v8;
    v30 = 2048;
    v31 = v9;
    v32 = 2112;
    v33 = v5;
    _os_log_impl(&dword_20ACAD000, v7, OS_LOG_TYPE_DEFAULT, "%s - chop attempt isBusinessRegistered: %{public}@ - attemptCount:%ld - error:%@", buf, 0x2Au);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    v11 = *(NSObject **)(v10 + 8);
  else
    v11 = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_11;
  block[3] = &unk_24C39CE58;
  v25 = v6;
  v21 = *(_QWORD *)(a1 + 80);
  v16 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 88);
  v17 = v12;
  v22 = v13;
  v24 = *(_QWORD *)(a1 + 112);
  v20 = *(id *)(a1 + 64);
  v18 = v5;
  v23 = *(_OWORD *)(a1 + 96);
  v19 = *(id *)(a1 + 56);
  v14 = v5;
  dispatch_async(v11, block);

}

void __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_11(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;

  if (*(_BYTE *)(a1 + 112))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
    v2 = *(_QWORD *)(a1 + 40);
    if (v2)
      v3 = *(_QWORD *)(v2 + 16);
    else
      v3 = 0;
    objc_msgSend(*(id *)(a1 + 32), "setSuccessfulChop:", v3);
    if (MEMORY[0x20BD2FF14]("-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metric:completion:]_block_invoke"))
    {
      v4 = (void *)MEMORY[0x24BDD17C8];
      v5 = *(_QWORD **)(a1 + 40);
      if (v5)
      {
        v5 = (_QWORD *)v5[1];
        if (v5)
          v5 = (_QWORD *)v5[2];
      }
      v6 = v5;
      objc_msgSend(v6, "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (REGISTERED)"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "replaceObjectAtIndex:withObject:", *(_QWORD *)(a1 + 104), v8);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v9 = *(void **)(a1 + 48);
    if (v9)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v9);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

uint64_t __123__BCSQueryChopper_queryChopperDelegate_isBusinessRegisteredForURL_isBloomFilterCached_forClientBundleID_metric_completion___block_invoke_2_16(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    ABSLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[BCSQueryChopper queryChopperDelegate:isBusinessRegisteredForURL:isBloomFilterCached:forClientBundleID:metri"
           "c:completion:]_block_invoke_2";
      _os_log_impl(&dword_20ACAD000, v3, OS_LOG_TYPE_DEFAULT, "%s - All queries have finished, return", (uint8_t *)&v4, 0xCu);
    }

    objc_msgSend(*(id *)(v2 + 32), "setSuccessfulChop:", -1);
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 40) + 16))();
  }
  return result;
}

void __68__BCSQueryChopper__indexOfItemIdentifierInfo_inItemIdentifierInfos___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  uint64_t *v12;

  v7 = a2;
  v8 = *(_QWORD **)(a1 + 32);
  if (v8)
    v8 = (_QWORD *)v8[1];
  v12 = v7;
  if (v7)
    v9 = v7[1];
  else
    v9 = 0;
  v10 = v8;
  v11 = objc_msgSend(v10, "matchesItemIdentifying:", v9);

  if (v11)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }

}

void __121__BCSQueryChopper__returnHighestPriorityLinkItemWithItemIdentifiersToFetch_fetchedItems_fetchedErrors_metric_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v7 = a2;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __121__BCSQueryChopper__returnHighestPriorityLinkItemWithItemIdentifiersToFetch_fetchedItems_fetchedErrors_metric_completion___block_invoke_2;
  v12[3] = &unk_24C39CF20;
  v13 = v7;
  v8 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 72);
  v18 = v9;
  v19 = v10;
  v20 = a4;
  v21 = a3;
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 32);
  v17 = *(id *)(a1 + 56);
  v11 = v7;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v12);

}

void __121__BCSQueryChopper__returnHighestPriorityLinkItemWithItemIdentifiersToFetch_fetchedItems_fetchedErrors_metric_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a2;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v20)
  {
    objc_msgSend(v20, "linkURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSLinkItemIdentifier identifierWithURL:]((uint64_t)BCSLinkItemIdentifier, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(void **)(v10 + 8);
    else
      v11 = 0;
    if (objc_msgSend(v11, "matchesItemIdentifying:", v9))
    {
      v12 = *(_QWORD *)(a1 + 32);
      if (v12)
        v13 = *(_QWORD *)(v12 + 16);
      else
        v13 = 0;
      objc_msgSend(*(id *)(a1 + 40), "setSuccessfulChop:", v13);
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      v14 = *(_BYTE **)(a1 + 88);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
      *a4 = 1;
      *v14 = 1;
    }

  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
  {
    v15 = *(_QWORD *)(a1 + 96);
    if (v15 == objc_msgSend(*(id *)(a1 + 48), "count") - 1 && objc_msgSend(*(id *)(a1 + 56), "count") - 1 == a3)
    {
      objc_msgSend(*(id *)(a1 + 64), "objectAtIndex:", a3);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setSuccessfulChop:", -1);
      v17 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 == v18)
        v19 = 0;
      else
        v19 = v16;
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v19);

      *a4 = 1;
      **(_BYTE **)(a1 + 88) = 1;

    }
  }

}

void __61__BCSQueryChopper__removeLinkItemDuplicatesInOrderFromArray___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  id *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  id *v11;
  void *v12;
  id *v13;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v13 = v3;
  if (v3)
  {
    v5 = (id *)v3[1];
    v6 = v5;
    if (v5)
    {
      v7 = (void *)objc_msgSend(v5[1], "copy");
      goto LABEL_4;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_4:
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v13);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (!v13)
  {
    v11 = 0;
    goto LABEL_13;
  }
  v10 = (id *)v13[1];
  v11 = v10;
  if (!v10)
  {
LABEL_13:
    v12 = 0;
    goto LABEL_9;
  }
  v12 = (void *)objc_msgSend(v10[1], "copy");
LABEL_9:
  objc_msgSend(v9, "setObject:forKey:", MEMORY[0x24BDBD1C8], v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_serialDispatchQueue, 0);
}

@end
