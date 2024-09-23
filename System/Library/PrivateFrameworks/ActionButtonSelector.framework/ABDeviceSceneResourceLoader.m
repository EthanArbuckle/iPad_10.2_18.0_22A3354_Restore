@implementation ABDeviceSceneResourceLoader

void __43__ABDeviceSceneResourceLoader_sharedLoader__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedLoader_loader;
  sharedLoader_loader = v0;

}

- (ABDeviceSceneResourceLoader)init
{
  ABDeviceSceneResourceLoader *v2;
  uint64_t v3;
  NSMutableOrderedSet *completions;
  uint64_t v5;
  NSHashTable *cancellables;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ABDeviceSceneResourceLoader;
  v2 = -[ABDeviceSceneResourceLoader init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    completions = v2->_completions;
    v2->_completions = (NSMutableOrderedSet *)v3;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    cancellables = v2->_cancellables;
    v2->_cancellables = (NSHashTable *)v5;

  }
  return v2;
}

void __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_didCompleteWithSuccess:", *(unsigned __int8 *)(a1 + 40));

}

- (void)_didCompleteWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSMutableOrderedSet *completions;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  ABDeviceSceneResourceLoader *v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v3 = a3;
  v25 = *MEMORY[0x24BDAC8D0];
  ABLogger();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("failure");
    if (v3)
      v6 = CFSTR("success");
    *(_DWORD *)buf = 138543618;
    v22 = self;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_235E72000, v5, OS_LOG_TYPE_DEFAULT, "(%{public}@) finished loading scene resources: (%{public}@)", buf, 0x16u);
  }

  v7 = 2;
  if (!v3)
    v7 = 3;
  self->_state = v7;
  -[ABDeviceSceneResourceLoader setShouldAbortLoading:](self, "setShouldAbortLoading:", 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)-[NSMutableOrderedSet copy](self->_completions, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        (*(void (**)(uint64_t, _BOOL8))(v13 + 16))(v13, v3);
        completions = self->_completions;
        v15 = (void *)MEMORY[0x23B7E420C](v13);
        -[NSMutableOrderedSet removeObject:](completions, "removeObject:", v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)setShouldAbortLoading:(BOOL)a3
{
  self->_shouldAbortLoading = a3;
}

- (BOOL)_loadResources
{
  void *v3;
  void *v4;
  SCNView *sceneView;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10[15];
  id location[18];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ABLoadDeviceSceneModel(v3, (uint64_t)location);
  __move_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64((uint64_t)&self->_sceneModel, (uint64_t *)location);
  objc_msgSend(MEMORY[0x24BDF6950], "redColor", __copy_constructor_8_8_s0_s8_s16_s24_s32_s40_s48_t56w64((uint64_t)v10, (uint64_t)&self->_sceneModel.buttonModel).n128_f64[0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ABDeviceSceneButtonModelSetColor(v10, v4, 0.1);

  -[SCNView setScene:](self->_sceneView, "setScene:", self->_sceneModel.scene);
  objc_initWeak(location, self);
  sceneView = self->_sceneView;
  -[SCNView scene](sceneView, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __45__ABDeviceSceneResourceLoader__loadResources__block_invoke;
  v8[3] = &unk_25073EE68;
  objc_copyWeak(&v9, location);
  LOBYTE(sceneView) = -[SCNView prepareObject:shouldAbortBlock:](sceneView, "prepareObject:shouldAbortBlock:", v6, v8);
  objc_destroyWeak(&v9);

  objc_destroyWeak(location);
  return (char)sceneView;
}

- (ABDeviceSceneResourceLoadingCancellable)loadResourcesWithCompletion:(uint64_t)a1
{
  void (**v3)(id, uint64_t);
  NSObject *v4;
  unint64_t v5;
  const __CFString *v6;
  ABDeviceSceneResourceLoadingCancellable *v7;
  void *v8;
  ABDeviceSceneResourceLoadingCancellable *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD block[4];
  id v26;
  _QWORD v27[4];
  void (**v28)(id, uint64_t);
  _BYTE *v29;
  id v30;
  id location;
  uint8_t v32[4];
  uint64_t v33;
  _BYTE buf[24];
  void (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37[3];

  v37[2] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!a1)
  {
LABEL_10:
    v7 = 0;
    goto LABEL_20;
  }
  ABLogger();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 24) - 1;
    if (v5 > 2)
      v6 = CFSTR("Empty");
    else
      v6 = off_25073EE88[v5];
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = a1;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v6;
    _os_log_impl(&dword_235E72000, v4, OS_LOG_TYPE_DEFAULT, "(%{public}@) requested scene resources, current state is (%{public}@)", buf, 0x16u);
  }

  if (*(_QWORD *)(a1 + 24) == 2)
  {
    if (v3)
      v3[2](v3, 1);
    goto LABEL_10;
  }
  v8 = (void *)objc_msgSend(v3, "copy");

  objc_initWeak(&location, (id)a1);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3042000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  v37[0] = 0;
  v9 = [ABDeviceSceneResourceLoadingCancellable alloc];
  v10 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke;
  v27[3] = &unk_25073EDC8;
  objc_copyWeak(&v30, &location);
  v29 = buf;
  v3 = v8;
  v28 = v3;
  v7 = -[ABDeviceSceneResourceLoadingCancellable initWithCancelBlock:](v9, "initWithCancelBlock:", v27);
  objc_storeWeak((id *)(*(_QWORD *)&buf[8] + 40), v7);
  if (v3)
  {
    v11 = *(void **)(a1 + 8);
    v12 = (void *)MEMORY[0x23B7E420C](v3);
    objc_msgSend(v11, "addObject:", v12);

  }
  if (*(_QWORD *)(a1 + 24) != 1)
  {
    ABLogger();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v32 = 138543362;
      v33 = a1;
      _os_log_impl(&dword_235E72000, v13, OS_LOG_TYPE_DEFAULT, "(%{public}@) begin loading scene resources", v32, 0xCu);
    }

    *(_QWORD *)(a1 + 24) = 1;
    if (!*(_QWORD *)(a1 + 32))
    {
      dispatch_get_global_queue(21, 0);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = dispatch_queue_create_with_target_V2("com.apple.device-scene-loader", 0, v14);
      v16 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v15;

    }
    v17 = objc_alloc(MEMORY[0x24BDE8298]);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bounds");
    v19 = objc_msgSend(v17, "initWithFrame:");
    v20 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = v19;

    objc_msgSend(*(id *)(a1 + 48), "setAntialiasingMode:", 2);
    objc_msgSend(*(id *)(a1 + 48), "setJitteringEnabled:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setBackgroundColor:", v21);

    objc_msgSend(*(id *)(a1 + 48), "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAllowsDisplayCompositing:", 0);

    v23 = *(NSObject **)(a1 + 32);
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke_17;
    block[3] = &unk_25073EE18;
    objc_copyWeak(&v26, &location);
    dispatch_async(v23, block);
    objc_destroyWeak(&v26);
  }

  objc_destroyWeak(&v30);
  _Block_object_dispose(buf, 8);
  objc_destroyWeak(v37);
  objc_destroyWeak(&location);
LABEL_20:

  return v7;
}

+ (id)sharedLoader
{
  objc_opt_self();
  if (sharedLoader_onceToken != -1)
    dispatch_once(&sharedLoader_onceToken, &__block_literal_global);
  return (id)sharedLoader_loader;
}

uint64_t __45__ABDeviceSceneResourceLoader__loadResources__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = objc_msgSend(WeakRetained, "shouldAbortLoading");
  else
    v3 = 1;

  return v3;
}

- (BOOL)shouldAbortLoading
{
  return self->_shouldAbortLoading;
}

void __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(WeakRetained, "_didCancelWithToken:completion:", v2, *(_QWORD *)(a1 + 32));

}

void __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke_17(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  char v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend(WeakRetained, "_loadResources");

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__ABDeviceSceneResourceLoader_loadResourcesWithCompletion___block_invoke_2;
  v4[3] = &unk_25073EDF0;
  objc_copyWeak(&v5, v1);
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v4);
  objc_destroyWeak(&v5);
}

- (void)releaseResources
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  _QWORD *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    ABLogger();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1[3]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = a1;
      v11 = 2114;
      v12 = v3;
      _os_log_impl(&dword_235E72000, v2, OS_LOG_TYPE_DEFAULT, "(%{public}@) release scene resource, current state is (%{public}@)", buf, 0x16u);

    }
    v4 = a1[3];
    if (v4 == 2)
    {
      objc_msgSend(a1, "_doCleanup");
    }
    else if (v4 == 1)
    {
      objc_msgSend(a1, "setShouldAbortLoading:", 1);
      objc_initWeak((id *)buf, a1);
      v5 = (void *)a1[1];
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __47__ABDeviceSceneResourceLoader_releaseResources__block_invoke;
      v7[3] = &unk_25073EE40;
      objc_copyWeak(&v8, (id *)buf);
      v6 = (void *)MEMORY[0x23B7E420C](v7);
      objc_msgSend(v5, "addObject:", v6);

      objc_destroyWeak(&v8);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __47__ABDeviceSceneResourceLoader_releaseResources__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_doCleanup");

}

- (BOOL)areResourcesLoaded
{
  if (result)
    return *(_QWORD *)(result + 24) == 2;
  return result;
}

- (void)_didCancelWithToken:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableOrderedSet *completions;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  const __CFString *v13;
  int v14;
  ABDeviceSceneResourceLoader *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    completions = self->_completions;
    v10 = (void *)MEMORY[0x23B7E420C](v7);
    -[NSMutableOrderedSet removeObject:](completions, "removeObject:", v10);

  }
  -[NSHashTable removeObject:](self->_cancellables, "removeObject:", v6);
  if (!-[NSHashTable count](self->_cancellables, "count") && self->_state == 1)
  {
    ABLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_state - 1;
      if (v12 > 2)
        v13 = CFSTR("Empty");
      else
        v13 = off_25073EE88[v12];
      v14 = 138543618;
      v15 = self;
      v16 = 2114;
      v17 = v13;
      _os_log_impl(&dword_235E72000, v11, OS_LOG_TYPE_DEFAULT, "(%{public}@) cancel scene resource loading, current state is (%{public}@)", (uint8_t *)&v14, 0x16u);
    }

    -[ABDeviceSceneResourceLoader setShouldAbortLoading:](self, "setShouldAbortLoading:", 1);
  }

}

- (void)_doCleanup
{
  SCNView *sceneView;
  _OWORD v4[9];

  sceneView = self->_sceneView;
  self->_sceneView = 0;

  memset(v4, 0, sizeof(v4));
  __copy_assignment_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64((id *)&self->_sceneModel.scene, (id *)v4);
  self->_state = 0;
  __destructor_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72((id *)v4);
}

- (uint64_t)sceneView
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (double)sceneModel
{
  double result;

  if (a1)
    return __copy_constructor_8_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72_t80w64((_QWORD *)a2, (id *)(a1 + 56));
  result = 0.0;
  *(_OWORD *)(a2 + 112) = 0u;
  *(_OWORD *)(a2 + 128) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  return result;
}

- (void).cxx_destruct
{
  __destructor_8_s0_s8_s16_S_s24_s32_s40_s48_s56_s64_s72((id *)&self->_sceneModel.scene);
  objc_storeStrong((id *)&self->_sceneView, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cancellables, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
