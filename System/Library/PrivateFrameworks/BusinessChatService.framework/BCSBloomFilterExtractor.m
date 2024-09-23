@implementation BCSBloomFilterExtractor

- (void)extractShardsURLsFromBloomFilterURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  void (**v29)(_QWORD, _QWORD, _QWORD);
  _QWORD v30[4];
  id v31;
  os_signpost_id_t v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  ABSLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_20ACAD000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "Unzip Megashard", (const char *)&unk_20AD230D5, buf, 2u);
  }

  v11 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke;
  v30[3] = &unk_24C39C058;
  v32 = v8;
  v12 = v6;
  v31 = v12;
  v13 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x20BD30274](v30);
  +[BCSPathProvider sharedInstance](BCSPathProvider, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "tempURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@_%@"), CFSTR("bloom_filter"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "URLByAppendingPathComponent:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke_10;
    v27[3] = &unk_24C39C0A8;
    v29 = v13;
    v21 = v20;
    v28 = v21;
    v22 = (void *)MEMORY[0x20BD30274](v27);
    ABSLogCommon();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v21;
      _os_log_debug_impl(&dword_20ACAD000, v23, OS_LOG_TYPE_DEBUG, "Unzipping megashard to %@", buf, 0xCu);
    }

    v24 = objc_alloc(MEMORY[0x24BE50890]);
    v25 = (void *)objc_msgSend(v24, "initWithInputURL:outputURL:identifier:operation:completionBlock:queue:", v5, v21, 0, 1, v22, MEMORY[0x24BDAC9B8]);
    objc_msgSend(v25, "start");

  }
  else
  {
    v35 = *MEMORY[0x24BDD0FC8];
    v36[0] = CFSTR("Failed get temp directory");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 100, v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    ((void (**)(_QWORD, _QWORD, void *))v13)[2](v13, 0, v19);
  }

}

void __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  uint8_t v10[16];

  v5 = a3;
  v6 = a2;
  ABSLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 40);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_20ACAD000, v8, OS_SIGNPOST_INTERVAL_END, v9, "Unzip Megashard", (const char *)&unk_20AD230D5, v10, 2u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  _QWORD v23[5];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  const __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "cleanup");
  if (objc_msgSend(v3, "didErrorOccur"))
  {
    v33 = *MEMORY[0x24BDD0FC8];
    v34[0] = CFSTR("Failed to unzip the megashard");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__1;
    v28 = __Block_byref_object_dispose__1;
    v29 = 0;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", *MEMORY[0x24BDBCC60]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke_15;
    v23[3] = &unk_24C39C080;
    v23[4] = &v24;
    objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v8, 0, v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25[5])
    {
      ABSLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_20ACAD000, v10, OS_LOG_TYPE_ERROR, "Error enumerating the unzipped shards on disk", buf, 2u);
      }

      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v19;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v12);
            objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15++), (_QWORD)v18);
          }
          while (v13 != v15);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v32, 16);
        }
        while (v13);
      }

      if (objc_msgSend(v11, "count"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
      else
      {
        v30 = *MEMORY[0x24BDD0FC8];
        v31 = CFSTR("No shards in the unzipped megashard");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[BCSError errorWithDomain:code:userInfo:](BCSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.businessservices"), 42, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    _Block_object_dispose(&v24, 8);

  }
}

uint64_t __74__BCSBloomFilterExtractor_extractShardsURLsFromBloomFilterURL_completion___block_invoke_15(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

- (void)extractShardsURLsFromFilterShardURL:(id)a3 domainShardURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BCSBloomFilterExtractor *v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __89__BCSBloomFilterExtractor_extractShardsURLsFromFilterShardURL_domainShardURL_completion___block_invoke;
    v11[3] = &unk_24C39C0F8;
    v12 = v8;
    v15 = v10;
    v13 = v9;
    v14 = self;
    -[BCSBloomFilterExtractor extractShardsURLsFromBloomFilterURL:completion:](self, "extractShardsURLsFromBloomFilterURL:completion:", v12, v11);

  }
}

void __89__BCSBloomFilterExtractor_extractShardsURLsFromFilterShardURL_domainShardURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (*v7)(void);
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v6 && *(_QWORD *)(a1 + 32))
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_7:
    v7();
    goto LABEL_8;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (!v8)
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
    goto LABEL_7;
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __89__BCSBloomFilterExtractor_extractShardsURLsFromFilterShardURL_domainShardURL_completion___block_invoke_2;
  v10[3] = &unk_24C39C0D0;
  v9 = *(void **)(a1 + 48);
  v12 = *(id *)(a1 + 56);
  v11 = v5;
  objc_msgSend(v9, "extractShardsURLsFromBloomFilterURL:completion:", v8, v10);

LABEL_8:
}

uint64_t __89__BCSBloomFilterExtractor_extractShardsURLsFromFilterShardURL_domainShardURL_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), a2, a3);
}

@end
