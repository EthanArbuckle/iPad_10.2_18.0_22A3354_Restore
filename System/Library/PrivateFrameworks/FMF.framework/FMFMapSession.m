@implementation FMFMapSession

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__FMFMapSession_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_dispatch_predicate != -1)
    dispatch_once(&sharedInstance_dispatch_predicate, block);
  return (id)sharedInstance__instance;
}

void __31__FMFMapSession_sharedInstance__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__instance;
  sharedInstance__instance = (uint64_t)v0;

  v2 = (id)objc_opt_new();
  objc_msgSend((id)sharedInstance__instance, "setMapCache:", v2);

}

+ (id)newConnection
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1F03A8C08);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.icloud.FMF.FMFMapXPCService"));
  objc_msgSend(v3, "setRemoteObjectInterface:", v2);
  objc_msgSend(v3, "resume");

  return v3;
}

- (void)gridImageForWidth:(double)a3 height:(double)a4 cache:(BOOL)a5 andCompletion:(id)a6
{
  _BOOL4 v6;
  void (**v10)(id, void *, _QWORD);
  FMFMapSession *v11;
  FMFMapSession *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  FMFMapSession *v19;
  void (**v20)(id, void *, _QWORD);
  double v21;
  double v22;
  BOOL v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a5;
  v10 = (void (**)(id, void *, _QWORD))a6;
  v11 = self;
  v12 = v11;
  if (v6
    && (-[FMFMapSession mapCache](v11, "mapCache"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "cachedGridImageForWidth:andHeight:", a3, a4),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v14))
  {
    v10[2](v10, v14, 0);

  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v15 = +[FMFMapSession newConnection](FMFMapSession, "newConnection");
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__FMFMapSession_gridImageForWidth_height_cache_andCompletion___block_invoke;
    v24[3] = &unk_1EA4F26B8;
    v24[4] = &v25;
    objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && v26[5])
    {
      ((void (*)(void (**)(id, void *, _QWORD), _QWORD))v10[2])(v10, 0);
    }
    else
    {
      v18[0] = v16;
      v18[1] = 3221225472;
      v18[2] = __62__FMFMapSession_gridImageForWidth_height_cache_andCompletion___block_invoke_2;
      v18[3] = &unk_1EA4F26E0;
      v23 = v6;
      v19 = v12;
      v21 = a3;
      v22 = a4;
      v20 = v10;
      objc_msgSend(v17, "gridImageForWidth:height:andCompletion:", v18, a3, a4);

    }
    _Block_object_dispose(&v25, 8);

  }
}

void __62__FMFMapSession_gridImageForWidth_height_cache_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __62__FMFMapSession_gridImageForWidth_height_cache_andCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "mapCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheGridImage:forWidth:andHeight:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)mapImageForLocation:(id)a3 radius:(double)a4 width:(double)a5 height:(double)a6 cache:(BOOL)a7 andCompletion:(id)a8
{
  -[FMFMapSession mapImageForLocation:isShifted:radius:width:height:cache:andCompletion:](self, "mapImageForLocation:isShifted:radius:width:height:cache:andCompletion:", a3, 0, a7, a8, a4, a5, a6);
}

- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 radius:(double)a5 width:(double)a6 height:(double)a7 cache:(BOOL)a8 andCompletion:(id)a9
{
  _BOOL8 v9;
  _BOOL8 v13;
  id v16;
  id v17;
  FMFMapImageRequest *v18;

  v9 = a8;
  v13 = a4;
  v16 = a9;
  v17 = a3;
  v18 = -[FMFMapImageRequest initWithLocation:isShifted:radius:width:height:andCachingEnabled:]([FMFMapImageRequest alloc], "initWithLocation:isShifted:radius:width:height:andCachingEnabled:", v17, v13, v9, a5, a6, a7);

  -[FMFMapSession mapImageForRequest:andCompletion:](self, "mapImageForRequest:andCompletion:", v18, v16);
}

- (void)noLocationImageForWidth:(double)a3 height:(double)a4 cache:(BOOL)a5 andCompletion:(id)a6
{
  _BOOL4 v6;
  void (**v10)(id, void *, _QWORD);
  FMFMapSession *v11;
  FMFMapSession *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  FMFMapSession *v19;
  void (**v20)(id, void *, _QWORD);
  double v21;
  double v22;
  BOOL v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a5;
  v10 = (void (**)(id, void *, _QWORD))a6;
  v11 = self;
  v12 = v11;
  if (v6
    && (-[FMFMapSession mapCache](v11, "mapCache"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v13, "cachedNoLocationImageForWidth:andHeight:", a3, a4),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        v14))
  {
    v10[2](v10, v14, 0);

  }
  else
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v15 = +[FMFMapSession newConnection](FMFMapSession, "newConnection");
    v16 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __68__FMFMapSession_noLocationImageForWidth_height_cache_andCompletion___block_invoke;
    v24[3] = &unk_1EA4F26B8;
    v24[4] = &v25;
    objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 && v26[5])
    {
      ((void (*)(void (**)(id, void *, _QWORD), _QWORD))v10[2])(v10, 0);
    }
    else
    {
      v18[0] = v16;
      v18[1] = 3221225472;
      v18[2] = __68__FMFMapSession_noLocationImageForWidth_height_cache_andCompletion___block_invoke_2;
      v18[3] = &unk_1EA4F26E0;
      v23 = v6;
      v19 = v12;
      v21 = a3;
      v22 = a4;
      v20 = v10;
      objc_msgSend(v17, "noLocationImageForWidth:height:andCompletion:", v18, a3, a4);

    }
    _Block_object_dispose(&v25, 8);

  }
}

void __68__FMFMapSession_noLocationImageForWidth_height_cache_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __68__FMFMapSession_noLocationImageForWidth_height_cache_andCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "mapCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheNoLocationImage:forWidth:andHeight:", v7, *(double *)(a1 + 48), *(double *)(a1 + 56));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)mapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 width:(double)a6 height:(double)a7 cache:(BOOL)a8 andCompletion:(id)a9
{
  -[FMFMapSession mapImageForLocation:isShifted:altitude:pitch:width:height:cache:andCompletion:](self, "mapImageForLocation:isShifted:altitude:pitch:width:height:cache:andCompletion:", a3, 0, a8, a9, a4, a5, a6, a7);
}

- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 width:(double)a7 height:(double)a8 cache:(BOOL)a9 andCompletion:(id)a10
{
  _BOOL8 v10;
  _BOOL8 v15;
  id v18;
  id v19;
  FMFMapImageRequest *v20;

  v10 = a9;
  v15 = a4;
  v18 = a10;
  v19 = a3;
  v20 = -[FMFMapImageRequest initWithLocation:isShifted:altitude:pitch:width:height:andCachingEnabled:]([FMFMapImageRequest alloc], "initWithLocation:isShifted:altitude:pitch:width:height:andCachingEnabled:", v19, v15, v10, a5, a6, a7, a8);

  -[FMFMapSession mapImageForRequest:andCompletion:](self, "mapImageForRequest:andCompletion:", v20, v18);
}

- (void)mapImageForRequest:(id)a3 andCompletion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  FMFMapSession *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  FMFMapSession *v22;
  void (**v23)(id, _QWORD);
  _QWORD v24[5];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  LogCategory_FMFMapXPC();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[FMFMapSession mapImageForRequest:andCompletion:].cold.3();

  v9 = self;
  if (!objc_msgSend(v6, "cachingEnabled")
    || (-[FMFMapSession mapCache](v9, "mapCache"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "cachedMapImageForRequest:", v6),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__0;
    v29 = __Block_byref_object_dispose__0;
    v30 = 0;
    v13 = +[FMFMapSession newConnection](FMFMapSession, "newConnection");
    v14 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke;
    v24[3] = &unk_1EA4F26B8;
    v24[4] = &v25;
    objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", v24);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v26[5])
    {
      v7[2](v7, 0);
    }
    else
    {
      -[FMFMapSession mapCache](v9, "mapCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "pendingMapImageForRequest:", v6);

      LogCategory_FMFMapXPC();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        -[FMFMapSession mapImageForRequest:andCompletion:].cold.1();

      if (v17 && objc_msgSend(v6, "priority") < 1)
      {
        if (!v7)
          goto LABEL_17;
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("FMFMapXPCService"), 206, 0);
        ((void (*)(void (**)(id, _QWORD), _QWORD, void *))v7[2])(v7, 0, v19);
      }
      else
      {
        v20[0] = v14;
        v20[1] = 3221225472;
        v20[2] = __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66;
        v20[3] = &unk_1EA4F2708;
        v21 = v6;
        v22 = v9;
        v23 = v7;
        objc_msgSend(v15, "mapImageForRequest:andCompletion:", v21, v20);

        v19 = v21;
      }

    }
LABEL_17:

    _Block_object_dispose(&v25, 8);
    goto LABEL_18;
  }
  LogCategory_FMFMapXPC();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[FMFMapSession mapImageForRequest:andCompletion:].cold.2();

  ((void (*)(void (**)(id, _QWORD), void *, _QWORD))v7[2])(v7, v11, 0);
LABEL_18:

}

void __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

void __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "cachingEnabled"))
  {
    objc_msgSend(*(id *)(a1 + 40), "mapCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cacheMapImage:forRequest:", v5, *(_QWORD *)(a1 + 32));

  }
  LogCategory_FMFMapXPC();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v9)
      __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66_cold_2((uint64_t)v6, v8);
  }
  else if (v9)
  {
    __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66_cold_1();
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)gridImageForScreenRatio:(double)a3 andCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD);
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = (void (**)(id, _QWORD))a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v6 = +[FMFMapSession newConnection](FMFMapSession, "newConnection");
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__FMFMapSession_gridImageForScreenRatio_andCompletion___block_invoke;
  v11[3] = &unk_1EA4F26B8;
  v11[4] = &v12;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v13[5])
  {
    v5[2](v5, 0);
  }
  else
  {
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __55__FMFMapSession_gridImageForScreenRatio_andCompletion___block_invoke_2;
    v9[3] = &unk_1EA4F2730;
    v10 = v5;
    objc_msgSend(v8, "gridImageForScreenRatio:andCompletion:", v9, a3);

  }
  _Block_object_dispose(&v12, 8);

}

void __55__FMFMapSession_gridImageForScreenRatio_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

uint64_t __55__FMFMapSession_gridImageForScreenRatio_andCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)noLocationImageForScreenRatio:(double)a3 andCompletion:(id)a4
{
  void (**v5)(id, _QWORD);
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  void (**v10)(id, _QWORD);
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = (void (**)(id, _QWORD))a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  v6 = +[FMFMapSession newConnection](FMFMapSession, "newConnection");
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__FMFMapSession_noLocationImageForScreenRatio_andCompletion___block_invoke;
  v11[3] = &unk_1EA4F26B8;
  v11[4] = &v12;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && v13[5])
  {
    v5[2](v5, 0);
  }
  else
  {
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __61__FMFMapSession_noLocationImageForScreenRatio_andCompletion___block_invoke_2;
    v9[3] = &unk_1EA4F2730;
    v10 = v5;
    objc_msgSend(v8, "noLocationImageForScreenRatio:andCompletion:", v9, a3);

  }
  _Block_object_dispose(&v12, 8);

}

void __61__FMFMapSession_noLocationImageForScreenRatio_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

uint64_t __61__FMFMapSession_noLocationImageForScreenRatio_andCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)mapImageForLocation:(id)a3 altitude:(double)a4 pitch:(double)a5 screenRatio:(double)a6 andCompletion:(id)a7
{
  -[FMFMapSession mapImageForLocation:isShifted:altitude:pitch:screenRatio:andCompletion:](self, "mapImageForLocation:isShifted:altitude:pitch:screenRatio:andCompletion:", a3, 0, a7, a4, a5, a6);
}

- (void)mapImageForLocation:(id)a3 isShifted:(BOOL)a4 altitude:(double)a5 pitch:(double)a6 screenRatio:(double)a7 andCompletion:(id)a8
{
  _BOOL8 v12;
  id v13;
  void (**v14)(id, _QWORD);
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, _QWORD);
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v12 = a4;
  v13 = a3;
  v14 = (void (**)(id, _QWORD))a8;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v15 = +[FMFMapSession newConnection](FMFMapSession, "newConnection");
  v16 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__FMFMapSession_mapImageForLocation_isShifted_altitude_pitch_screenRatio_andCompletion___block_invoke;
  v20[3] = &unk_1EA4F26B8;
  v20[4] = &v21;
  objc_msgSend(v15, "remoteObjectProxyWithErrorHandler:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && v22[5])
  {
    v14[2](v14, 0);
  }
  else
  {
    v18[0] = v16;
    v18[1] = 3221225472;
    v18[2] = __88__FMFMapSession_mapImageForLocation_isShifted_altitude_pitch_screenRatio_andCompletion___block_invoke_2;
    v18[3] = &unk_1EA4F2730;
    v19 = v14;
    objc_msgSend(v17, "mapImageForLocation:isShifted:altitude:pitch:screenRatio:andCompletion:", v13, v12, v18, a5, a6, a7);

  }
  _Block_object_dispose(&v21, 8);

}

void __88__FMFMapSession_mapImageForLocation_isShifted_altitude_pitch_screenRatio_andCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  id v5;

  v4 = a2;
  if (v4)
  {
    v5 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    v4 = v5;
  }

}

uint64_t __88__FMFMapSession_mapImageForLocation_isShifted_altitude_pitch_screenRatio_andCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (FMFMapCache)mapCache
{
  return self->_mapCache;
}

- (void)setMapCache:(id)a3
{
  objc_storeStrong((id *)&self->_mapCache, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_mapCache, 0);
}

- (void)mapImageForRequest:andCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1DC81B000, v0, v1, "requesting new map from XPC service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mapImageForRequest:andCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1DC81B000, v0, v1, "returning cached map", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)mapImageForRequest:andCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1DC81B000, v0, v1, "mapImageForRequest:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1DC81B000, v0, v1, "returning new map from XPC service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __50__FMFMapSession_mapImageForRequest_andCompletion___block_invoke_66_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1DC81B000, a2, OS_LOG_TYPE_DEBUG, "Error generating maps %@", (uint8_t *)&v2, 0xCu);
}

@end
