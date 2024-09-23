@implementation AVTResourceCacheSupport

void __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "resourceForItem:scope:cacheMissHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(NSObject **)(a1 + 56);
  if (v3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_2;
    v4[3] = &unk_1EA51D058;
    v6 = *(id *)(a1 + 72);
    v5 = v2;
    dispatch_async(v3, v4);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

+ (id)resourceFromCache:(id)a3 forItem:(id)a4 scope:(id)a5 preflightCacheMissHandler:(id)a6 cacheMissHandler:(id)a7 cacheMissQueue:(id)a8 taskScheduler:(id)a9 callbackQueue:(id)a10 resourceHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void (**v24)(id, void *);
  void *v25;
  void *v26;
  id v27;
  id v28;
  void (**v29)(id, void *);
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void (**v39)(id, id, id);
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void (**v49)(id, void *);

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v39 = (void (**)(id, id, id))a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = v16;
  v24 = (void (**)(id, void *))a11;
  objc_msgSend(v16, "resourceForItem:scope:", v17, v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    v24[2](v24, v25);
    v26 = 0;
  }
  else
  {
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke;
    v43[3] = &unk_1EA520440;
    v36 = v23;
    v44 = v23;
    v27 = v17;
    v45 = v27;
    v28 = v18;
    v46 = v28;
    v37 = v19;
    v48 = v19;
    v35 = v22;
    v47 = v22;
    v29 = v24;
    v49 = v29;
    v30 = MEMORY[0x1DF0D0754](v43);
    v31 = (void *)v30;
    v38 = v20;
    if (v20)
    {
      if (v39)
      {
        v39[2](v39, v27, v28);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          v29[2](v29, v32);

      }
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_3;
      v40[3] = &unk_1EA520490;
      v41 = v38;
      v42 = v31;
      v33 = (void *)objc_msgSend(v40, "copy");
      objc_msgSend(v21, "scheduleTask:", v33);
      v26 = (void *)MEMORY[0x1DF0D0754](v33);

    }
    else
    {
      (*(void (**)(uint64_t))(v30 + 16))(v30);
      v26 = 0;
    }

    v19 = v37;
    v20 = v38;
    v22 = v35;
    v23 = v36;
  }

  return v26;
}

uint64_t __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_4;
  v6[3] = &unk_1EA520468;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __161__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

+ (id)resourceFromCache:(id)a3 forItem:(id)a4 scope:(id)a5 preflightCacheMissHandler:(id)a6 cacheMissWithCompletionHandler:(id)a7 cacheMissQueue:(id)a8 taskScheduler:(id)a9 callbackQueue:(id)a10 resourceHandler:(id)a11
{
  id v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, id, id);
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void (**v25)(id, void *);
  void *v26;
  void *v27;
  id v28;
  id v29;
  void (**v30)(id, void *);
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  id v39;
  void (**v40)(_QWORD, id, id);
  void *v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void (**v52)(id, void *);

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = (void (**)(_QWORD, id, id))a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = v16;
  v25 = (void (**)(id, void *))a11;
  objc_msgSend(v16, "resourceForItem:scope:", v17, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v20;
  if (v26)
  {
    v25[2](v25, v26);
    v27 = 0;
  }
  else
  {
    v40 = v19;
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke;
    v45[3] = &unk_1EA520508;
    v51 = v20;
    v28 = v17;
    v46 = v28;
    v29 = v18;
    v47 = v29;
    v38 = v24;
    v48 = v24;
    v37 = v23;
    v49 = v23;
    v30 = v25;
    v52 = v30;
    v39 = v21;
    v31 = v21;
    v50 = v31;
    v32 = MEMORY[0x1DF0D0754](v45);
    v33 = (void *)v32;
    if (v31)
    {
      if (v40)
      {
        v40[2](v40, v28, v29);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (v34)
          v30[2](v30, v34);

      }
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_7;
      v42[3] = &unk_1EA520490;
      v43 = v31;
      v44 = v33;
      v35 = (void *)objc_msgSend(v42, "copy");
      objc_msgSend(v22, "scheduleTask:", v35);
      v27 = (void *)MEMORY[0x1DF0D0754](v35);

    }
    else
    {
      (*(void (**)(uint64_t))(v32 + 16))(v32);
      v27 = 0;
    }

    v21 = v39;
    v19 = v40;
    v23 = v37;
    v24 = v38;
  }

  return v27;
}

void __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_2;
  v5[3] = &unk_1EA5204E0;
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 56);
  v11 = *(id *)(a1 + 80);
  v10 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v2 + 16))(v2, v3, v4, v5);

}

void __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void (**v6)(_QWORD);
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  void (**v10)(_QWORD);
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_3;
  v11[3] = &unk_1EA51F950;
  v5 = v3;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = *(id *)(a1 + 72);
  v6 = (void (**)(_QWORD))MEMORY[0x1DF0D0754](v11);
  v7 = v6;
  v8 = *(NSObject **)(a1 + 64);
  if (v8)
  {
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_6;
    block[3] = &unk_1EA51D810;
    v10 = v6;
    dispatch_async(v8, block);

  }
  else
  {
    v6[2](v6);
  }

}

void __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v2 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_4;
  v9[3] = &unk_1EA5204B8;
  v10 = *(id *)(a1 + 32);
  v3 = (void *)MEMORY[0x1DF0D0754](v9);
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "resourceForItem:scope:cacheMissHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);
  v5 = *(NSObject **)(a1 + 64);
  if (v5)
  {
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_5;
    block[3] = &unk_1EA51D058;
    v8 = *(id *)(a1 + 72);
    v7 = *(id *)(a1 + 32);
    dispatch_async(v5, block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

id __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_4(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_8;
  v6[3] = &unk_1EA520468;
  v4 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v5 = v3;
  dispatch_async(v4, v6);

}

uint64_t __175__AVTResourceCacheSupport_resourceFromCache_forItem_scope_preflightCacheMissHandler_cacheMissWithCompletionHandler_cacheMissQueue_taskScheduler_callbackQueue_resourceHandler___block_invoke_8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
