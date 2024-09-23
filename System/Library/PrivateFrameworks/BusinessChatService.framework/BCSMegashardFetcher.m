@implementation BCSMegashardFetcher

- (BCSMegashardFetcher)initWithShardType:(int64_t)a3 configCache:(id)a4 shardCache:(id)a5 shardCacheSkipper:(id)a6 shardInstantiator:(id)a7 megashardRemoteFetcher:(id)a8 userDefaults:(id)a9 metricFactory:(id)a10
{
  id v17;
  BCSMegashardFetcher *v18;
  BCSMegashardFetcher *v19;
  uint64_t v20;
  uint64_t v21;
  NSMutableSet *triggers;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;

  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v17 = a10;
  v30.receiver = self;
  v30.super_class = (Class)BCSMegashardFetcher;
  v18 = -[BCSMegashardFetcher init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_shardType = a3;
    if ((unint64_t)(a3 - 2) > 3)
      v20 = 1;
    else
      v20 = qword_20AD1B420[a3 - 2];
    v18->_type = v20;
    objc_storeStrong((id *)&v18->_configCache, a4);
    objc_storeStrong((id *)&v19->_shardCache, a5);
    objc_storeStrong((id *)&v19->_shardCacheSkipper, a6);
    objc_storeStrong((id *)&v19->_megashardRemoteFetcher, a8);
    objc_storeStrong((id *)&v19->_shardInstantiator, a7);
    objc_storeStrong((id *)&v19->_userDefaults, a9);
    objc_storeStrong((id *)&v19->_metricFactory, a10);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set", v24, v25, v26, v27, v28, v29);
    v21 = objc_claimAutoreleasedReturnValue();
    triggers = v19->_triggers;
    v19->_triggers = (NSMutableSet *)v21;

  }
  return v19;
}

- (void)addFetchTrigger:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSMutableSet *triggers;
  NSMutableSet *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, unint64_t, void *);
  void *v12;
  id v13;
  BCSMegashardFetcher *v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __39__BCSMegashardFetcher_addFetchTrigger___block_invoke;
  v12 = &unk_24C39BDF0;
  objc_copyWeak(&v15, &location);
  v6 = v5;
  v13 = v6;
  v14 = self;
  objc_msgSend(v4, "scheduleFetchBlock:", &v9);
  if (self)
    triggers = self->_triggers;
  else
    triggers = 0;
  v8 = triggers;
  -[NSMutableSet addObject:](v8, "addObject:", v4, v9, v10, v11, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __39__BCSMegashardFetcher_addFetchTrigger___block_invoke(uint64_t a1, void *a2, unint64_t a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  unint64_t v28;
  double v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  _QWORD *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  double v42;
  double v43;
  id v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  NSObject *v49;
  uint64_t v50;
  id v51;
  _QWORD v52[4];
  id v53;
  _QWORD v54[5];
  id v55;
  uint64_t v56;
  _BYTE buf[24];
  void *v58;
  id v59;
  id v60;
  _QWORD *v61;
  unint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  ABSLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (WeakRetained)
      v12 = *((_QWORD *)WeakRetained + 2);
    else
      v12 = 0;
    NSStringFromBCSShardType(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBCSFetchReason(a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2114;
    v58 = v14;
    _os_log_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_DEFAULT, "%@ triggered a fetch of the megashard for type %{public}@ - %{public}@", buf, 0x20u);

  }
  v15 = *(_QWORD *)(a1 + 40);
  if (!v15)
    goto LABEL_31;
  v16 = *(_QWORD *)(v15 + 16);
  v17 = *(id *)(v15 + 40);
  v18 = v17;
  v19 = v16 - 2;
  v20 = (unint64_t)(v16 - 2) > 3 ? 1 : qword_20AD1B420[v19];
  v21 = objc_msgSend(v17, "shouldSkipCacheForShardItemOfType:", v20);

  if (a3 != 6
    || (v21 & 1) != 0
    || !objc_msgSend(*(id *)(v15 + 32), "countOfShardsOfType:", v16)
    || objc_msgSend(*(id *)(v15 + 32), "countOfExpiredShardsOfType:", v16) > 0)
  {
    goto LABEL_15;
  }
  v44 = *(id *)(v15 + 24);
  v45 = v44;
  v46 = v19 > 3 ? 1 : qword_20AD1B420[v19];
  objc_msgSend(v44, "configItemForType:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47 || (v48 = objc_msgSend(v47, "isExpired"), v47, v48))
  {
LABEL_15:
    v22 = MEMORY[0x24BDAC760];
    v52[0] = MEMORY[0x24BDAC760];
    v52[1] = 3221225472;
    v52[2] = __39__BCSMegashardFetcher_addFetchTrigger___block_invoke_7;
    v52[3] = &unk_24C39BDC8;
    v53 = v8;
    v23 = v52;
    if (WeakRetained)
    {
      v24 = *((_QWORD *)WeakRetained + 1);
      v25 = *((id *)WeakRetained + 9);
      v26 = v7;
      objc_msgSend(v25, "megashardFetchMetricForType:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = *((_QWORD *)WeakRetained + 1) - 1;
      if (v28 > 3 || (objc_msgSend(*((id *)WeakRetained + 8), "doubleForKey:", off_24C39BEB0[v28]), v29 == 0.0))
      {
        v30 = -1;
      }
      else
      {
        v42 = v29;
        objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
        v30 = (uint64_t)((v43 - v42) / 60.0 / 60.0);
      }
      objc_msgSend(v27, "setHoursSinceLastSuccessfulFetch:", v30);
      *(_QWORD *)buf = v22;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke;
      v58 = &unk_24C39BE18;
      v59 = WeakRetained;
      v60 = v27;
      v62 = a3;
      v61 = v23;
      v51 = v27;
      v31 = (void *)MEMORY[0x20BD30274](buf);
      v32 = *((_QWORD *)WeakRetained + 2) - 2;
      v33 = v23;
      v34 = v8;
      v35 = v7;
      if (v32 > 3)
        v36 = 1;
      else
        v36 = qword_20AD1B420[v32];
      v37 = (void *)MEMORY[0x24BDD1488];
      v38 = *((id *)WeakRetained + 6);
      objc_msgSend(v37, "mainBundle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "bundleIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = MEMORY[0x24BDAC760];
      v54[1] = 3221225472;
      v54[2] = __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_2;
      v54[3] = &unk_24C39BE90;
      v55 = v31;
      v56 = v36;
      v54[4] = WeakRetained;
      v41 = v31;
      objc_msgSend(v38, "fetchMegashardItemWithType:clientBundleID:systemTask:completion:", v36, v40, v26, v54);

      v7 = v35;
      v8 = v34;
      v23 = v33;
    }

  }
  else
  {
LABEL_31:
    ABSLogCommon();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v50;
      _os_log_impl(&dword_20ACAD000, v49, OS_LOG_TYPE_DEFAULT, "%@ Megashard fetch not required. Bailing.", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

uint64_t __39__BCSMegashardFetcher_addFetchTrigger___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v4;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = *(_QWORD *)(v4 + 8);
    v7 = a3;
    switch(v6)
    {
      case 1:
        if (a2)
        {
          v8 = *(void **)(v4 + 64);
          v9 = (void *)MEMORY[0x24BDBCE60];
          v10 = v8;
          objc_msgSend(v9, "timeIntervalSinceReferenceDate");
          v11 = CFSTR("BCSMegashardPrefetchLastSuccessfulFetchChatSuggest");
          goto LABEL_11;
        }
        break;
      case 2:
        if (a2)
        {
          v12 = *(void **)(v4 + 64);
          v13 = (void *)MEMORY[0x24BDBCE60];
          v10 = v12;
          objc_msgSend(v13, "timeIntervalSinceReferenceDate");
          v11 = CFSTR("BCSMegashardPrefetchLastSuccessfulFetchBusinessLink");
          goto LABEL_11;
        }
        break;
      case 3:
        if (a2)
        {
          v14 = *(void **)(v4 + 64);
          v15 = (void *)MEMORY[0x24BDBCE60];
          v10 = v14;
          objc_msgSend(v15, "timeIntervalSinceReferenceDate");
          v11 = CFSTR("BCSMegashardPrefetchLastSuccessfulFetchBusinessCaller");
          goto LABEL_11;
        }
        break;
      case 4:
        if (a2)
        {
          v16 = *(void **)(v4 + 64);
          v17 = (void *)MEMORY[0x24BDBCE60];
          v10 = v16;
          objc_msgSend(v17, "timeIntervalSinceReferenceDate");
          v11 = CFSTR("BCSMegashardPrefetchLastSuccessfulFetchBusinessEmail");
LABEL_11:
          objc_msgSend(v10, "setDouble:forKey:", v11);

        }
        break;
      default:
        break;
    }
  }
  else
  {
    v18 = a3;
  }
  objc_msgSend(*(id *)(a1 + 40), "setReason:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "setErrorCode:", objc_msgSend(a3, "code"));
  objc_msgSend(*(id *)(a1 + 40), "submitForPostProcessing");
  (*(void (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), a3 == 0);

}

void __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  _QWORD v37[6];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  ABSLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = (void *)a1[6];
      *(_DWORD *)buf = 136315650;
      v39 = "-[BCSMegashardFetcher _fetchMegashardForReason:withBGSystemTask:completion:]_block_invoke";
      v40 = 2048;
      v41 = v15;
      v42 = 2112;
      v43 = v12;
      _os_log_error_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_ERROR, "%s failed to prefetch bloom filter + config item for type:%ld error: %@", buf, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBCSType(a1[6]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v39 = "-[BCSMegashardFetcher _fetchMegashardForReason:withBGSystemTask:completion:]_block_invoke_2";
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "%s successfully prefetched bloom filter + config item for type: %@", buf, 0x16u);

    }
    v17 = a1[4];
    if (v17)
      v18 = *(void **)(v17 + 24);
    else
      v18 = 0;
    objc_msgSend(v18, "updateConfigItem:withType:", v11, a1[6]);
    v19 = objc_msgSend(v9, "count");
    v20 = MEMORY[0x24BDAC760];
    if (v19)
    {
      v21 = a1[6] - 2;
      if (v21 > 2)
        v22 = 1;
      else
        v22 = qword_20AD1B440[v21];
      v23 = a1[4];
      if (v23)
        v24 = *(void **)(v23 + 32);
      else
        v24 = 0;
      objc_msgSend(v24, "deleteShardItemsOfType:", v22);
      v25 = a1[4];
      if (v25)
        v26 = *(void **)(v25 + 32);
      else
        v26 = 0;
      objc_msgSend(v26, "beginBatch");
      v37[0] = v20;
      v37[1] = 3221225472;
      v37[2] = __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_11;
      v37[3] = &unk_24C39BE40;
      v37[4] = a1[4];
      v37[5] = v22;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v37);
      v27 = a1[4];
      if (v27)
        v28 = *(void **)(v27 + 32);
      else
        v28 = 0;
      objc_msgSend(v28, "endBatch");
    }
    if (objc_msgSend(v10, "count"))
    {
      v29 = a1[4];
      if (v29)
        v30 = *(void **)(v29 + 32);
      else
        v30 = 0;
      objc_msgSend(v30, "deleteShardItemsOfType:", 3);
      v31 = a1[4];
      if (v31)
        v32 = *(void **)(v31 + 32);
      else
        v32 = 0;
      objc_msgSend(v32, "beginBatch");
      v36[0] = v20;
      v36[1] = 3221225472;
      v36[2] = __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_2_13;
      v36[3] = &unk_24C39BE68;
      v36[4] = a1[4];
      objc_msgSend(v10, "enumerateObjectsUsingBlock:", v36);
      v33 = a1[4];
      if (v33)
        v34 = *(void **)(v33 + 32);
      else
        v34 = 0;
      objc_msgSend(v34, "endBatch");
    }
    ABSLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBCSType(a1[6]);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v39 = "-[BCSMegashardFetcher _fetchMegashardForReason:withBGSystemTask:completion:]_block_invoke_3";
      v40 = 2112;
      v41 = v35;
      _os_log_impl(&dword_20ACAD000, v14, OS_LOG_TYPE_DEFAULT, "%s successfully cached bloom filter + config item for type: %@", buf, 0x16u);

    }
  }

  (*(void (**)(void))(a1[5] + 16))();
}

void __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_11(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)MEMORY[0x20BD300D0]();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 56);
  else
    v5 = 0;
  objc_msgSend(v5, "shardItemFromURL:type:", v9, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 32);
  else
    v8 = 0;
  objc_msgSend(v8, "updateShardItem:withShardIdentifier:", v6, v6);

  objc_autoreleasePoolPop(v3);
}

void __76__BCSMegashardFetcher__fetchMegashardForReason_withBGSystemTask_completion___block_invoke_2_13(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)MEMORY[0x20BD300D0]();
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 56);
  else
    v5 = 0;
  objc_msgSend(v5, "shardItemFromURL:type:", v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    v8 = *(void **)(v7 + 32);
  else
    v8 = 0;
  objc_msgSend(v8, "updateShardItem:withShardIdentifier:", v6, v6);

  objc_autoreleasePoolPop(v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggers, 0);
  objc_storeStrong((id *)&self->_metricFactory, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong((id *)&self->_shardInstantiator, 0);
  objc_storeStrong((id *)&self->_megashardRemoteFetcher, 0);
  objc_storeStrong((id *)&self->_shardCacheSkipper, 0);
  objc_storeStrong((id *)&self->_shardCache, 0);
  objc_storeStrong((id *)&self->_configCache, 0);
}

@end
