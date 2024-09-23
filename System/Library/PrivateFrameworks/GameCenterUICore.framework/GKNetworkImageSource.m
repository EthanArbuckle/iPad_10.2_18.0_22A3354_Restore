@implementation GKNetworkImageSource

- (BOOL)imageNeedsRefresh:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKImageSource renderedDefaultImage](self, "renderedDefaultImage");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  return v5 == v4;
}

- (void)loadImageForURLString:(id)a3 reference:(id)a4 queue:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  GKNetworkImageSource *v14;

  v10 = a3;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__GKNetworkImageSource_loadImageForURLString_reference_queue_handler___block_invoke;
  v12[3] = &unk_24DC27D68;
  v13 = v10;
  v14 = self;
  v11 = v10;
  -[GKNetworkImageSource loadImageForURLString:loader:reference:queue:handler:](self, "loadImageForURLString:loader:reference:queue:handler:", v11, v12, a4, a5, a6);

}

void __70__GKNetworkImageSource_loadImageForURLString_reference_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "syncQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__GKNetworkImageSource_loadImageForURLString_reference_queue_handler___block_invoke_2;
  v8[3] = &unk_24DC27D40;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "_gkloadRemoteImageForURL:queue:withCompletionHandler:", v5, v6, v8);

}

uint64_t __70__GKNetworkImageSource_loadImageForURLString_reference_queue_handler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)loadAndCacheAvatarFromGamedForURLString:(id)a3 useUIImage:(BOOL)a4 cacheSubdirectory:(id)a5 reference:(id)a6 queue:(id)a7 handler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  BOOL v32;

  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (!v17)
  {
    v17 = (id)MEMORY[0x24BDAC9B8];
    v19 = MEMORY[0x24BDAC9B8];
  }
  v20 = (void *)MEMORY[0x24BE3A188];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKImageSource.m", 705, "-[GKNetworkImageSource loadAndCacheAvatarFromGamedForURLString:useUIImage:cacheSubdirectory:reference:queue:handler:]");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dispatchGroupWithName:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = MEMORY[0x24BDAC760];
  if (v14)
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke;
    v28[3] = &unk_24DC27E30;
    v28[4] = self;
    v29 = v15;
    v32 = a4;
    v30 = v22;
    v31 = v14;
    objc_msgSend(v30, "perform:", v28);

  }
  if (v18)
  {
    v24[0] = v23;
    v24[1] = 3221225472;
    v24[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_235;
    v24[3] = &unk_24DC27E58;
    v27 = v18;
    v25 = v22;
    v26 = v16;
    objc_msgSend(v25, "notifyOnQueue:block:", v17, v24);

  }
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "syncQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2;
  v7[3] = &unk_24DC27E08;
  v5 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v12 = *(_BYTE *)(a1 + 64);
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = v3;
  v6 = v3;
  dispatch_async(v4, v7);

}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  id v34;
  char v35;
  id v36;

  objc_msgSend(*(id *)(a1 + 32), "keyForImageIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cacheKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v3;
  objc_msgSend(*(id *)(a1 + 32), "cache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "prepareForUsingUIImage:", *(unsigned __int8 *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 48), "setResult:", v5);
    v6 = (NSObject **)MEMORY[0x24BE3A308];
    v7 = *MEMORY[0x24BE3A308];
    if (!*MEMORY[0x24BE3A308])
    {
      v8 = (id)GKOSLoggers();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_cold_2();
  }
  else
  {
    v12 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_228;
    v28[3] = &unk_24DC27DE0;
    v29 = *(id *)(a1 + 48);
    v30 = *(id *)(a1 + 56);
    v31 = *(id *)(a1 + 40);
    v13 = v2;
    v35 = *(_BYTE *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 32);
    v32 = v13;
    v33 = v14;
    v15 = v3;
    v34 = v15;
    v16 = (void (**)(_QWORD))MEMORY[0x220737704](v28);
    objc_msgSend(*(id *)(a1 + 32), "loadingGroups");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 32), "loadingGroups");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        if (!*MEMORY[0x24BE3A308])
          v20 = (id)GKOSLoggers();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E8], OS_LOG_TYPE_DEBUG))
          __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_cold_1();
        v21 = *(void **)(a1 + 48);
        objc_msgSend((id)objc_opt_class(), "syncQueue");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v12;
        v25[1] = 3221225472;
        v25[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_234;
        v25[3] = &unk_24DC278C0;
        v26 = *(id *)(a1 + 48);
        v27 = v19;
        objc_msgSend(v21, "join:queue:block:", v27, v22, v25);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "loadingGroups");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v15);

        v16[2](v16);
      }

    }
    else
    {
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjects:forKeys:count:", a1 + 48, &v36, 1);
      objc_msgSend(*(id *)(a1 + 32), "setLoadingGroups:", v23);

      v16[2](v16);
    }

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v9, v10, v11);

}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_228(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  char v13;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_229;
  v6[3] = &unk_24DC27DB8;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 48);
  v9 = *(id *)(a1 + 56);
  v13 = *(_BYTE *)(a1 + 80);
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = *(void **)(a1 + 72);
  v10 = v3;
  v11 = v4;
  v12 = v5;
  objc_msgSend(v2, "perform:", v6);

}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_229(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  char v19;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3A178], "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "utilityService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "basename");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3;
  v13[3] = &unk_24DC27D90;
  v19 = *(_BYTE *)(a1 + 80);
  v9 = *(id *)(a1 + 56);
  v10 = *(_QWORD *)(a1 + 64);
  v11 = *(void **)(a1 + 72);
  v14 = v9;
  v15 = v10;
  v16 = v11;
  v17 = *(id *)(a1 + 32);
  v18 = v3;
  v12 = v3;
  objc_msgSend(v6, "requestImageDataForURL:subdirectory:fileName:handler:", v4, v7, v8, v13);

}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  GKAvatarImage *v4;
  void *v5;
  NSObject **v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v4 = -[GKAvatarImage initWithPNGData:useUIImage:]([GKAvatarImage alloc], "initWithPNGData:useUIImage:", v3, *(unsigned __int8 *)(a1 + 72));
    objc_msgSend(*(id *)(a1 + 32), "setResult:", v4);
    objc_msgSend(*(id *)(a1 + 40), "cache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v4, *(_QWORD *)(a1 + 48));

    v6 = (NSObject **)MEMORY[0x24BE3A308];
    v7 = *MEMORY[0x24BE3A308];
    if (!*MEMORY[0x24BE3A308])
    {
      v8 = (id)GKOSLoggers();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3_cold_2();

  }
  else
  {
    if (!*MEMORY[0x24BE3A308])
      v9 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A300], OS_LOG_TYPE_ERROR))
      __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3_cold_1();
  }
  objc_msgSend(*(id *)(a1 + 40), "loadingGroups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_234(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v2);

}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_235(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (void)loadImageForURLString:(id)a3 loader:(id)a4 reference:(id)a5 queue:(id)a6 handler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v15)
  {
    v15 = (id)MEMORY[0x24BDAC9B8];
    v17 = MEMORY[0x24BDAC9B8];
  }
  v18 = (void *)MEMORY[0x24BE3A188];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKImageSource.m", 788, "-[GKNetworkImageSource loadImageForURLString:loader:reference:queue:handler:]");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dispatchGroupWithName:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[GKImageSource shouldUseTestImage](self, "shouldUseTestImage"))
  {
    if (v16)
    {
      -[GKImageSource renderedTestImage](self, "renderedTestImage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setResult:", v21);

LABEL_9:
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2_237;
      v22[3] = &unk_24DC27E58;
      v25 = v16;
      v23 = v20;
      v24 = v14;
      objc_msgSend(v23, "notifyOnQueue:block:", v15, v22);

    }
  }
  else
  {
    if (v12)
    {
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke;
      v26[3] = &unk_24DC27F20;
      v26[4] = self;
      v27 = v12;
      v28 = v20;
      v29 = v13;
      objc_msgSend(v28, "perform:", v26);

    }
    if (v16)
      goto LABEL_9;
  }

}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD block[5];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend((id)objc_opt_class(), "syncQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2;
  block[3] = &unk_24DC27EF8;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  v10 = *(id *)(a1 + 56);
  v11 = v3;
  v6 = v3;
  dispatch_async(v4, block);

}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;

  objc_msgSend(*(id *)(a1 + 32), "cachedImageForIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 48), "setResult:", v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "keyForImageIdentifier:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheKey");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_3;
    v24[3] = &unk_24DC27ED0;
    v25 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(a1 + 40);
    v29 = v8;
    v26 = v9;
    v27 = v10;
    v11 = v30;
    v28 = v11;
    v12 = (void (**)(_QWORD))MEMORY[0x220737704](v24);
    objc_msgSend(*(id *)(a1 + 32), "loadingGroups");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "loadingGroups");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        if (!*MEMORY[0x24BE3A308])
          v16 = (id)GKOSLoggers();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E8], OS_LOG_TYPE_DEBUG))
          __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2_cold_1();
        v17 = *(void **)(a1 + 48);
        objc_msgSend((id)objc_opt_class(), "syncQueue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v21[0] = v7;
        v21[1] = 3221225472;
        v21[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_236;
        v21[3] = &unk_24DC278C0;
        v22 = *(id *)(a1 + 48);
        v23 = v15;
        objc_msgSend(v17, "join:queue:block:", v23, v18, v21);

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "loadingGroups");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), v11);

        v12[2](v12);
      }

    }
    else
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjects:forKeys:count:", a1 + 48, &v30, 1);
      objc_msgSend(*(id *)(a1 + 32), "setLoadingGroups:", v19);

      v12[2](v12);
    }

  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), v3, v4, v5);

}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_4;
  v6[3] = &unk_24DC27EA8;
  v3 = *(id *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v10 = v3;
  v6[4] = v4;
  v7 = v5;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "perform:", v6);

}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void (*v6)(uint64_t, _QWORD *);
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 64);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_5;
  v8[3] = &unk_24DC27E80;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  v12 = v3;
  v6 = *(void (**)(uint64_t, _QWORD *))(v4 + 16);
  v7 = v3;
  v6(v4, v8);

}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "processAndCacheImage:forIdentifier:", v3, *(_QWORD *)(a1 + 40));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!*MEMORY[0x24BE3A308])
      v5 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E8], OS_LOG_TYPE_DEBUG))
      __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_5_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "renderedDefaultImage");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  objc_msgSend(*(id *)(a1 + 48), "setResult:", v4);
  objc_msgSend(*(id *)(a1 + 32), "loadingGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 56));

  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_236(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 40), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResult:", v2);

}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2_237(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (NSMutableDictionary)loadingGroups
{
  return self->_loadingGroups;
}

- (void)setLoadingGroups:(id)a3
{
  objc_storeStrong((id *)&self->_loadingGroups, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingGroups, 0);
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_219F71000, v0, v1, "Queuing duplicate avatar image load request:%@", v2);
  OUTLINED_FUNCTION_3();
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_219F71000, v0, v1, "Avatar image representation found in in-memory cache for: %@", v2);
  OUTLINED_FUNCTION_3();
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  v4 = 2112;
  v5 = v0;
  OUTLINED_FUNCTION_0_2(&dword_219F71000, v1, v2, "Failed to load avatar image from gamed: %@\ncache key: %@", v3);
  OUTLINED_FUNCTION_3();
}

void __117__GKNetworkImageSource_loadAndCacheAvatarFromGamedForURLString_useUIImage_cacheSubdirectory_reference_queue_handler___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_219F71000, v0, v1, "Loaded avatar image from gamed %@", v2);
  OUTLINED_FUNCTION_3();
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_219F71000, v0, v1, "Queuing duplicate image load request:%@", v2);
  OUTLINED_FUNCTION_3();
}

void __77__GKNetworkImageSource_loadImageForURLString_loader_reference_queue_handler___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_219F71000, v0, v1, "no image received for identifier:%@", v2);
  OUTLINED_FUNCTION_3();
}

@end
