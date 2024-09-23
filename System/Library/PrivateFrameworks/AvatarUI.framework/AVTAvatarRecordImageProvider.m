@implementation AVTAvatarRecordImageProvider

- (_AVTAvatarRecordImageProvider)backingProvider
{
  return self->_backingProvider;
}

- (id)imageForRecord:(id)a3 scope:(id)a4
{
  return -[AVTAvatarRecordImageProvider imageForRecord:scope:usingService:](self, "imageForRecord:scope:usingService:", a3, a4, 0);
}

id __58___AVTAvatarRecordImageProvider__providerForRecord_scope___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id (*v20)(id *);
  void *v21;
  uint64_t v22;
  id v23;
  id v24;

  v5 = a2;
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __58___AVTAvatarRecordImageProvider__providerForRecord_scope___block_invoke_2;
  v21 = &unk_1EA51F718;
  v6 = *(void **)(a1 + 40);
  v22 = *(_QWORD *)(a1 + 32);
  v23 = v6;
  v24 = *(id *)(a1 + 48);
  v7 = (void *)MEMORY[0x1DF0D0754](&v18);
  objc_msgSend(*(id *)(a1 + 32), "peristentCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  if ((a3 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "renderingScheduler");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if ((a3 & 1) != 0)
  {
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v8, v10, v9, 0, v7, v11, v12, 0, v5, v18, v19, v20, v21, v22, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v8, v10, v9, 0, v7, v11, v13, v15, v5, v18, v19, v20, v21, v22, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v16 = (void *)MEMORY[0x1DF0D0754](v14);

  return v16;
}

id __58___AVTAvatarRecordImageProvider__providerForRecord_scope___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1[4], "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "size");
  objc_msgSend(v2, "logRenderingRecord:size:", v3);

  v4 = a1[5];
  objc_msgSend(a1[4], "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editorCoreModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[AVTAvatarConfiguration configurationForRecord:coreModel:](AVTAvatarConfiguration, "configurationForRecord:coreModel:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "configurationRenderer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageForAvatarConfiguration:scope:", v7, a1[6]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  AVTPassThroughResourceCache *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v28;
  _QWORD v29[5];
  id v30;
  id v31;
  id v32;
  char v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  id location;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "peristentCache");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "volatileCache");
    v7 = objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "allowPreFlight"))
    {
      objc_msgSend(*(id *)(a1 + 40), "puppetName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_2;
      v44[3] = &unk_1EA51F718;
      v45 = *(id *)(a1 + 48);
      v46 = *(id *)(a1 + 40);
      v47 = v8;
      v9 = v8;
      v10 = (void *)MEMORY[0x1DF0D0754](v44);

    }
    else
    {
      v10 = 0;
    }
    v6 = (id)v7;
  }
  else
  {
    v10 = 0;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_3;
    v34[3] = &unk_1EA51F768;
    objc_copyWeak(&v42, &location);
    v6 = v6;
    v35 = v6;
    v36 = *(id *)(a1 + 56);
    v37 = *(id *)(a1 + 48);
    v40 = v5;
    v41 = v10;
    v11 = *(id *)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 32);
    v38 = v11;
    v39 = v12;
    v13 = (void *)MEMORY[0x1DF0D0754](v34);
    objc_msgSend(*(id *)(a1 + 32), "renderingScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scheduleTask:", v13);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  else
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_2_18;
    v29[3] = &unk_1EA51F790;
    v15 = *(void **)(a1 + 40);
    v29[4] = *(_QWORD *)(a1 + 32);
    v30 = v15;
    v31 = *(id *)(a1 + 48);
    v32 = *(id *)(a1 + 64);
    v33 = *(_BYTE *)(a1 + 72);
    v16 = (void *)MEMORY[0x1DF0D0754](v29);
    v28 = v10;
    if (!*(_BYTE *)(a1 + 73))
    {
      v17 = objc_alloc_init(AVTPassThroughResourceCache);

      v6 = v17;
    }
    v19 = *(_QWORD *)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v20 = a3;
    if ((a3 & 1) != 0)
    {
      v21 = v5;
      v22 = 0;
    }
    else
    {
      v21 = v5;
      objc_msgSend(*(id *)(a1 + 32), "workQueue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "renderingScheduler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v20 & 1) != 0)
    {
      v24 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v25 = v19;
    v10 = v28;
    +[AVTResourceCacheSupport resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:](AVTResourceCacheSupport, "resourceFromCache:forItem:scope:preflightCacheMissHandler:cacheMissHandler:cacheMissQueue:taskScheduler:callbackQueue:resourceHandler:", v6, v18, v25, v28, v16, v22, v23, v24, v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v20 & 1) != 0)
    {
      v22 = v23;
    }
    else
    {

    }
    v5 = v21;
  }
  v26 = (void *)MEMORY[0x1DF0D0754](v13);

  return v26;
}

id __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "isEditable"))
    v3 = 2;
  else
    v3 = 1;
  objc_msgSend(v2, "adaptedFramingModeForObjectType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    v9 = *MEMORY[0x1E0D00598];
    v10[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0D00648], "thumbnailForAnimojiNamed:options:", *(_QWORD *)(a1 + 48), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 32), "resourceForItem:scope:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    || (v5 = *(_QWORD *)(a1 + 80)) != 0
    && ((*(void (**)(uint64_t, _QWORD, _QWORD))(v5 + 16))(v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)),
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = (void *)v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
  else
  {
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_4;
    v13 = &unk_1EA51CEB0;
    v14 = WeakRetained;
    v15 = *(id *)(a1 + 56);
    v6 = *(id *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 64);
    v16 = v6;
    v17 = v7;
    v8 = (void *)MEMORY[0x1DF0D0754](&v10);
    objc_msgSend(*(id *)(a1 + 32), "resourceForItem:scope:cacheMissHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8, v10, v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();

  }
}

id __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  dispatch_time_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  NSObject *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logGeneratingImageInServiceForRecord:", v8);

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteRenderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__16;
  v30 = __Block_byref_object_dispose__16;
  v31 = 0;
  v11 = dispatch_semaphore_create(0);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_15;
  v23 = &unk_1EA51E0D8;
  v25 = &v26;
  v14 = v11;
  v24 = v14;
  objc_msgSend(v10, "getSnapshotAndCacheForAvatarRecord:scope:withReply:", v12, v13, &v20);
  v15 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v14, v15))
  {
    objc_msgSend(*(id *)(a1 + 56), "logger", v20, v21, v22, v23);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "description");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logTimedOutWaitingForSnapshotInService:", v17);

  }
  v18 = (id)v27[5];

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_15(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

id __92___AVTAvatarRecordImageProvider__providerForAvatar_forRecord_scope_usingCache_usingService___block_invoke_2_18(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "size");
  objc_msgSend(v2, "logRenderingRecord:size:", v3);

  v4 = *(id *)(a1 + 56);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0D00858], "avatarForRecord:", *(_QWORD *)(a1 + 40));
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "avatarRenderer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageForAvatar:scope:usingService:", v4, *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logNilImageReturnedFromAVTAvatarRecordImageProvider");

  }
  return v6;
}

- (AVTAvatarRecordImageProvider)init
{
  void *v3;
  _AVTAvatarRecordImageProvider *v4;
  AVTAvatarRecordImageProvider *v5;

  +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_AVTAvatarRecordImageProvider initWithEnvironment:]([_AVTAvatarRecordImageProvider alloc], "initWithEnvironment:", v3);
  v5 = -[AVTAvatarRecordImageProvider initWithBackingProvider:](self, "initWithBackingProvider:", v4);

  return v5;
}

- (AVTAvatarRecordImageProvider)initWithBackingProvider:(id)a3
{
  id v5;
  AVTAvatarRecordImageProvider *v6;
  AVTAvatarRecordImageProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AVTAvatarRecordImageProvider;
  v6 = -[AVTAvatarRecordImageProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_backingProvider, a3);

  return v7;
}

- (id)imageForRecord:(id)a3 scope:(id)a4 usingService:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[AVTAvatarRecordImageProvider backingProvider](self, "backingProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "providerForRecord:scope:usingService:", v8, v9, v5);
  v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__19;
  v20 = __Block_byref_object_dispose__19;
  v21 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__AVTAvatarRecordImageProvider_imageForRecord_scope_usingService___block_invoke;
  v15[3] = &unk_1EA520158;
  v15[4] = &v16;
  v12 = (id)((uint64_t (**)(_QWORD, _QWORD *, uint64_t))v11)[2](v11, v15, 1);
  v13 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v13;
}

void __66__AVTAvatarRecordImageProvider_imageForRecord_scope_usingService___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)imageForRecord:(id)a3 scope:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  id v12;
  id v13;

  v13 = a5;
  v8 = a4;
  v9 = a3;
  -[AVTAvatarRecordImageProvider backingProvider](self, "backingProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "providerForRecord:scope:", v9, v8);
  v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  v12 = (id)((uint64_t (**)(_QWORD, id, _QWORD))v11)[2](v11, v13, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingProvider, 0);
}

@end
