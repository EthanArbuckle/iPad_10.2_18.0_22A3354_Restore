@implementation MPCAssetLoader

- (void)setConfigurator:(id)a3
{
  objc_storeStrong((id *)&self->_configurator, a3);
}

- (MPCAssetLoader)initWithDelegate:(id)a3
{
  id v4;
  MPCAssetLoader *v5;
  MPCAssetLoader *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MPCAssetLoader;
  v5 = -[MPCAssetLoader init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)loadAssetFor:(id)a3 task:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void (**v17)(void *, _QWORD, void *);
  void *v18;
  MPCPlayerItemConfigurator *configurator;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  MPCAssetLoader *v28;
  void (**v29)(void *, _QWORD, void *);
  _QWORD aBlock[4];
  id v31;
  MPCAssetLoader *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  MPCAssetLoader *v38;
  id v39;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  -[MPCAssetLoader configurator](self, "configurator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCAssetLoader.m"), 67, CFSTR("MPCAssetLoader must have a configurator set to work properly"));

  }
  if ((objc_msgSend(v9, "hasLoadableAsset") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPCAssetLoader.m"), 68, CFSTR("Attempting to load an item which has no loadable asset: %@"), v9);

  }
  v13 = v9;
  v14 = MEMORY[0x24BDAC760];
  v34 = MEMORY[0x24BDAC760];
  v35 = 3221225472;
  v36 = __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke;
  v37 = &unk_24CABA1D0;
  v38 = self;
  v39 = v13;
  msv_dispatch_on_main_queue();
  aBlock[0] = v14;
  aBlock[1] = 3221225472;
  aBlock[2] = __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_2;
  aBlock[3] = &unk_24CAB39C0;
  v15 = v11;
  v33 = v15;
  v16 = v39;
  v31 = v16;
  v32 = self;
  v17 = (void (**)(void *, _QWORD, void *))_Block_copy(aBlock);
  if (objc_msgSend(v10, "isCancelled"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 28, CFSTR("MPCAssetLoadingOperation - Asset loading cancelled - Item:%@"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2](v17, 0, v18);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      configurator = self->_configurator;
      v20 = v16;
      -[MPCPlayerItemConfigurator audioAssetTypeSelector](configurator, "audioAssetTypeSelector");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAudioAssetTypeSelector:", v21);

    }
    +[MPCMFAssetLoadingTask wrap:](MPCMFAssetLoadingTask, "wrap:", v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    v25[1] = 3221225472;
    v25[2] = __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_4;
    v25[3] = &unk_24CAB39E8;
    v26 = v10;
    v29 = v17;
    v27 = v16;
    v28 = self;
    objc_msgSend(v27, "_loadAssetAndPlayerItemWithTask:completion:", v22, v25);

    v18 = v26;
  }

}

- (void)loadAssetValuesFor:(id)a3 keys:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "isAssetLoaded"))
  {
    objc_msgSend(v7, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__MPCAssetLoader_loadAssetValuesFor_keys_completion___block_invoke;
    v11[3] = &unk_24CAB9720;
    v12 = v9;
    objc_msgSend(v10, "loadValuesAsynchronouslyForKeys:completionHandler:", v8, v11);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 0, CFSTR("Asset is not loaded or was recently released due to MediaServices interruption"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v9 + 2))(v9, v10);
  }

}

- (double)unloadingPlaybackAssetsOnIdleDuration
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadingPlaybackAssetsOnIdleDuration");
  v4 = v3;

  return v4;
}

- (BOOL)_configureItem:(id)a3 playerItem:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  int v22;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v11 = os_signpost_id_make_with_pointer(v10, v8);

  v12 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "ConfigureItem", ", buf, 2u);
  }

  -[MPCAssetLoader configurator](self, "configurator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v14, "configureQueueItem:playerItem:error:", v8, v9, &v24);

  v15 = v24;
  v16 = os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
  v17 = v16;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    objc_msgSend(v8, "analyticsContentType");
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v19 = objc_msgSend(v18, "UTF8String");
    objc_msgSend(v8, "analyticsFormatType");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = objc_msgSend(v20, "UTF8String");
    v22 = objc_msgSend(v8, "isStartItem");
    *(_DWORD *)buf = 136446722;
    v26 = v19;
    v27 = 2082;
    v28 = v21;
    v29 = 1026;
    v30 = v22;
    _os_signpost_emit_with_name_impl(&dword_210BD8000, v17, OS_SIGNPOST_INTERVAL_END, v11, "ConfigureItem", " enableTelemetry=YES contentType=%{public, signpost.telemetry:string1, name=contentType}s format=%{public, signpost.telemetry:string2, name=format}s isStartItem=%{public, signpost.telemetry:number1, name=isStartItem}d", buf, 0x1Cu);

  }
  if (a5 && v15)
    *a5 = objc_retainAutorelease(v15);

  return v15 == 0;
}

- (MPCAssetLoaderDelegate)delegate
{
  return (MPCAssetLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MPCPlayerItemConfigurator)configurator
{
  return self->_configurator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __53__MPCAssetLoader_loadAssetValuesFor_keys_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLoadingDidStartForItem:", *(_QWORD *)(a1 + 40));

}

void __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_2(int8x16_t *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  int8x16_t v7;

  v4 = a3;
  (*(void (**)(void))(a1[3].i64[0] + 16))();
  v7 = a1[2];
  v5 = (id)v7.i64[0];
  v6 = v4;
  msv_dispatch_on_main_queue();

}

void __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "isCancelled"))
  {
    v7 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 28, CFSTR("MPCAssetLoadingOperation - Asset loading cancelled - Item:%@"), *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
  else if (v5)
  {
    v10 = *(_QWORD *)(a1 + 40);
    v9 = *(void **)(a1 + 48);
    v15 = 0;
    objc_msgSend(v9, "_configureItem:playerItem:error:", v10, v5, &v15);
    v11 = v15;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    if (!v6)
    {
      objc_msgSend(*(id *)(a1 + 40), "itemError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        v14 = v12;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1540], "msv_errorWithDomain:code:debugDescription:", CFSTR("MPCError"), 24, CFSTR("MPCAssetLoadingOperation - Asset loading failed [No AVPlayerItem] - Item:%@"), *(_QWORD *)(a1 + 40));
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = v14;

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __47__MPCAssetLoader_loadAssetFor_task_completion___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetLoadingDidCompleteForItem:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
