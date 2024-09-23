@implementation HKMedicationsResolutionEngine

+ (BOOL)isVisionAssetAvailable
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKMedicationsResolutionEngine _databasePath]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  return v4;
}

+ (id)_databasePath
{
  void *v0;
  void *v1;

  objc_opt_self();
  +[HKMedicationsResolutionEngine _visionDirectoryPath]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("pbs_assets.db"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (__CFString)_homeMobileDirectoryPath
{
  void *v0;
  void *v1;
  void *v2;
  __CFString *v3;

  objc_opt_self();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "environment");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("SIMULATOR_SHARED_RESOURCES_DIRECTORY"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    v3 = v2;
  else
    v3 = CFSTR("/private/var/mobile/");

  return v3;
}

+ (id)_visionDirectoryPath
{
  void *v0;
  void *v1;

  objc_opt_self();
  +[HKMedicationsResolutionEngine _homeMobileDirectoryPath]();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Library/Health/vision"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (HKMedicationsResolutionEngine)init
{
  HKMedicationsResolutionEngine *v2;
  HKMedicationsResolver *v3;
  void *v4;
  void *v5;
  void *v6;
  HKMedicationsResolver *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKMedicationsResolutionEngine;
  v2 = -[HKMedicationsResolutionEngine init](&v10, sel_init);
  if (v2)
  {
    v3 = [HKMedicationsResolver alloc];
    v4 = (void *)MEMORY[0x24BDBCF48];
    +[HKMedicationsResolutionEngine _databasePath]();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[HKMedicationsResolver initWithAssetUrl:](v3, "initWithAssetUrl:", v6);
    -[HKMedicationsResolutionEngine setResolver:](v2, "setResolver:", v7);

    HKCreateSerialDispatchQueue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsResolutionEngine setQueue:](v2, "setQueue:", v8);

  }
  return v2;
}

- (HKMedicationsResolutionEngine)initWithAssetUrl:(id)a3
{
  id v4;
  HKMedicationsResolutionEngine *v5;
  HKMedicationsResolver *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKMedicationsResolutionEngine;
  v5 = -[HKMedicationsResolutionEngine init](&v9, sel_init);
  if (v5)
  {
    v6 = -[HKMedicationsResolver initWithAssetUrl:]([HKMedicationsResolver alloc], "initWithAssetUrl:", v4);
    -[HKMedicationsResolutionEngine setResolver:](v5, "setResolver:", v6);

    HKCreateSerialDispatchQueue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKMedicationsResolutionEngine setQueue:](v5, "setQueue:", v7);

  }
  return v5;
}

- (void)resetResolverWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HKMedicationsResolutionEngine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HKMedicationsResolutionEngine_resetResolverWithCompletionHandler___block_invoke;
  v7[3] = &unk_24EC1A2E0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __68__HKMedicationsResolutionEngine_resetResolverWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "resolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_msgSend(v2, "resetResolverWithError:", &v7);
  v4 = v7;

  if (v3)
  {
    v5 = 1;
    v6 = 0;
  }
  else
  {
    v5 = 0;
    v6 = v4;
  }
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v5, v6);

}

- (void)resolveMedicationsUsing:(id)a3 resultLimit:(int64_t)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  -[HKMedicationsResolutionEngine queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __87__HKMedicationsResolutionEngine_resolveMedicationsUsing_resultLimit_completionHandler___block_invoke;
  block[3] = &unk_24EC1A308;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(v9, block);

}

void __87__HKMedicationsResolutionEngine_resolveMedicationsUsing_resultLimit_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "resolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  objc_msgSend(v2, "resolveText:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)hkctl_resolveMedicationsUsing:(id)a3 resultLimit:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  id v32;
  id obj;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _QWORD v48[2];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[HKMedicationsResolutionEngine resolver](self, "resolver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resolveText:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v31 = v10;
    objc_msgSend(v10, "resolvedIds");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v8;
    if (objc_msgSend(v11, "count") > (unint64_t)a4)
    {
      objc_msgSend(v11, "subarrayWithRange:", 0, a4);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v11;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v36)
    {
      v34 = *(_QWORD *)v44;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v44 != v34)
            objc_enumerationMutation(obj);
          v38 = v13;
          v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v13);
          v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v14, "primaryHgId"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("primary_hg_id"));

          v17 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v14, "maxJaccardSimilarity");
          objc_msgSend(v17, "numberWithFloat:");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = v15;
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("max_jaccard_similarity"));

          v19 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          objc_msgSend(v14, "subHgIds");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v40;
            do
            {
              v24 = 0;
              do
              {
                if (*(_QWORD *)v40 != v23)
                  objc_enumerationMutation(v20);
                v25 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v24);
                v47[0] = CFSTR("hg_id");
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v25, "hgId"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v47[1] = CFSTR("jaccard_similarity");
                v48[0] = v26;
                v27 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v25, "jaccardSimilarity");
                objc_msgSend(v27, "numberWithFloat:");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v48[1] = v28;
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "addObject:", v29);

                ++v24;
              }
              while (v22 != v24);
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
            }
            while (v22);
          }

          objc_msgSend(v37, "setObject:forKeyedSubscript:", v19, CFSTR("sub_hg_ids"));
          objc_msgSend(v35, "addObject:", v37);

          v13 = v38 + 1;
        }
        while (v38 + 1 != v36);
        v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v36);
    }

    v10 = v31;
    v8 = v32;
  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (void)filter:(id)a3 transcripts:(id)a4 criterion:(float)a5 limit:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  int64_t v23;
  float v24;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  -[HKMedicationsResolutionEngine queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __86__HKMedicationsResolutionEngine_filter_transcripts_criterion_limit_completionHandler___block_invoke;
  v19[3] = &unk_24EC1A330;
  v19[4] = self;
  v20 = v12;
  v24 = a5;
  v22 = v14;
  v23 = a6;
  v21 = v13;
  v16 = v14;
  v17 = v13;
  v18 = v12;
  dispatch_async(v15, v19);

}

void __86__HKMedicationsResolutionEngine_filter_transcripts_criterion_limit_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "resolver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  LODWORD(v5) = *(_DWORD *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 64);
  v9 = 0;
  objc_msgSend(v2, "filterAndAddGenerics:transcripts:criterion:limit:error:", v3, v4, v6, &v9, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (HKMedicationsResolver)resolver
{
  return self->_resolver;
}

- (void)setResolver:(id)a3
{
  objc_storeStrong((id *)&self->_resolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
