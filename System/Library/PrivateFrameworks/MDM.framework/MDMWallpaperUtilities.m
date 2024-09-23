@implementation MDMWallpaperUtilities

- (void)setWallpaper:(id)a3 forLockScreen:(BOOL)a4 homeScreen:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;
  BOOL v20;
  id location;

  v10 = a3;
  v11 = a6;
  -[MDMWallpaperUtilities _storeImageToTempDirectory:](self, "_storeImageToTempDirectory:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __81__MDMWallpaperUtilities_setWallpaper_forLockScreen_homeScreen_completionHandler___block_invoke;
  v15[3] = &unk_24EB69A60;
  objc_copyWeak(&v18, &location);
  v13 = v11;
  v17 = v13;
  v14 = v12;
  v16 = v14;
  v19 = a4;
  v20 = a5;
  -[MDMWallpaperUtilities _createNewConfigurationIfNeeedWithCompletionHandler:](self, "_createNewConfigurationIfNeeedWithCompletionHandler:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __81__MDMWallpaperUtilities_setWallpaper_forLockScreen_homeScreen_completionHandler___block_invoke(uint64_t a1, unsigned int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v8)
    {
      v10 = *(_QWORD *)(a1 + 40);
      if (v10)
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v8);
    }
    else
    {
      objc_initWeak(&location, WeakRetained);
      v11 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(a1 + 56))
        v12 = 1;
      else
        v12 = a2;
      if (*(_BYTE *)(a1 + 57))
        v13 = 1;
      else
        v13 = a2;
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __81__MDMWallpaperUtilities_setWallpaper_forLockScreen_homeScreen_completionHandler___block_invoke_2;
      v14[3] = &unk_24EB69A38;
      objc_copyWeak(&v17, &location);
      v15 = *(id *)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      objc_msgSend(WeakRetained, "_setWallpaper:forConfigurationWithUUID:setLockScreen:setHomeScreen:completionHandler:", v11, v7, v12, v13, v14);

      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }

}

void __81__MDMWallpaperUtilities_setWallpaper_forLockScreen_homeScreen_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_removeImageFromURL:", *(_QWORD *)(a1 + 32));
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }

}

- (void)_createNewConfigurationIfNeeedWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  MDMWallpaperUtilities *v10;
  id v11;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wallpaperConfigurationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_DEFAULT, "Existing wallpaper config UUID is not nil.", buf, 2u);
    }
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __77__MDMWallpaperUtilities__createNewConfigurationIfNeeedWithCompletionHandler___block_invoke;
    v8[3] = &unk_24EB69A88;
    v11 = v4;
    v9 = v6;
    v10 = self;
    -[MDMWallpaperUtilities _verifyWallpaperConfigExistsWithUUID:completionHandler:](self, "_verifyWallpaperConfigExistsWithUUID:completionHandler:", v9, v8);

  }
  else
  {
    -[MDMWallpaperUtilities _createNewConfigurationWithCompletionHandler:](self, "_createNewConfigurationWithCompletionHandler:", v4);
  }

}

uint64_t __77__MDMWallpaperUtilities__createNewConfigurationIfNeeedWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 40), "_createNewConfigurationWithCompletionHandler:", *(_QWORD *)(a1 + 48));
  v3 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_222CB9000, v3, OS_LOG_TYPE_DEFAULT, "Found existing wallpaper configuration.", v5, 2u);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)_createNewConfigurationWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Will create new wallpaper configuration...", (uint8_t *)buf, 2u);
  }
  objc_initWeak(buf, self);
  -[MDMWallpaperUtilities posterService](self, "posterService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__MDMWallpaperUtilities__createNewConfigurationWithCompletionHandler___block_invoke;
  v8[3] = &unk_24EB69AB0;
  objc_copyWeak(&v10, buf);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "createPosterConfigurationForProviderIdentifier:posterDescriptorIdentifier:role:completion:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider"), 0, 0, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

void __70__MDMWallpaperUtilities__createNewConfigurationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v14 = 138543362;
        v15 = v6;
        _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_ERROR, "Failed to create poster configuration with error: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      v9 = *(_QWORD *)(a1 + 32);
      if (v9)
        (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v9 + 16))(v9, 0, 0, v6);
    }
    else
    {
      objc_msgSend(v5, "serverUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWallpaperConfigurationUUID:", v10);

      v12 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138543362;
        v15 = v10;
        _os_log_impl(&dword_222CB9000, v12, OS_LOG_TYPE_DEFAULT, "Poster configuration created with UUID: %{public}@", (uint8_t *)&v14, 0xCu);
      }
      v13 = *(_QWORD *)(a1 + 32);
      if (v13)
        (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(v13 + 16))(v13, 1, v10, 0);

    }
  }

}

- (void)_verifyWallpaperConfigExistsWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[MDMWallpaperUtilities externalPosterService](self, "externalPosterService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__MDMWallpaperUtilities__verifyWallpaperConfigExistsWithUUID_completionHandler___block_invoke;
  v11[3] = &unk_24EB69AD8;
  objc_copyWeak(&v14, &location);
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "fetchEligibleConfigurationsWithCompletion:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

}

void __80__MDMWallpaperUtilities__verifyWallpaperConfigExistsWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v11 = 138543362;
        v12 = v6;
        _os_log_impl(&dword_222CB9000, v8, OS_LOG_TYPE_ERROR, "Failed to fetch eligible configuration with error: %{public}@", (uint8_t *)&v11, 0xCu);
      }
    }
    v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "Wallpaper configuration with UUID (%{public}@) exists.", (uint8_t *)&v11, 0xCu);
    }
    (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v5, "containsObject:", *(_QWORD *)(a1 + 32)));
  }

}

- (void)_setWallpaper:(id)a3 forConfigurationWithUUID:(id)a4 setLockScreen:(BOOL)a5 setHomeScreen:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  uint8_t buf[16];

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  v15 = (void *)objc_opt_new();
  v16 = (void *)objc_opt_new();
  if (v9)
  {
    v17 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v17, OS_LOG_TYPE_DEFAULT, "Will update lock screen", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BE74C50], "posterUpdateLockScreenPosterWithImageAtURL:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObject:", v18);

  }
  if (v8)
  {
    v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v19, OS_LOG_TYPE_DEFAULT, "Will update home screen", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BE74C50], "posterUpdateHomeScreenPosterWithImageAtURL:", v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE74C50], "posterUpdateHomeScreenAppearance:", 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v20);
    objc_msgSend(v16, "addObject:", v21);

  }
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __110__MDMWallpaperUtilities__setWallpaper_forConfigurationWithUUID_setLockScreen_setHomeScreen_completionHandler___block_invoke;
  v25[3] = &unk_24EB69B00;
  v25[4] = self;
  v26 = v13;
  v27 = v16;
  v28 = v14;
  v22 = v16;
  v23 = v13;
  v24 = v14;
  -[MDMWallpaperUtilities _updateWallpaperConfiguraitonWithUUID:updates:retryCount:completionHandler:](self, "_updateWallpaperConfiguraitonWithUUID:updates:retryCount:completionHandler:", v23, v15, 2, v25);

}

void __110__MDMWallpaperUtilities__setWallpaper_forConfigurationWithUUID_setLockScreen_setHomeScreen_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  if (a2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __110__MDMWallpaperUtilities__setWallpaper_forConfigurationWithUUID_setLockScreen_setHomeScreen_completionHandler___block_invoke_2;
    v5[3] = &unk_24EB68318;
    v4 = *(_QWORD *)(a1 + 48);
    v6 = *(id *)(a1 + 56);
    objc_msgSend(v2, "_updateWallpaperConfiguraitonWithUUID:updates:retryCount:completionHandler:", v3, v4, 2, v5);

  }
}

uint64_t __110__MDMWallpaperUtilities__setWallpaper_forConfigurationWithUUID_setLockScreen_setHomeScreen_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateWallpaperConfiguraitonWithUUID:(id)a3 updates:(id)a4 retryCount:(unint64_t)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __100__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_retryCount_completionHandler___block_invoke;
  v16[3] = &unk_24EB69B50;
  v19 = v12;
  v20 = a5;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[MDMWallpaperUtilities _updateWallpaperConfiguraitonWithUUID:updates:completionHandler:](self, "_updateWallpaperConfiguraitonWithUUID:updates:completionHandler:", v15, v14, v16);

}

void __100__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_retryCount_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
    goto LABEL_6;
  v4 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134217984;
    v18 = v5;
    _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_ERROR, "Failed to update wallpaper. Retry count %ld", buf, 0xCu);
  }
  if (*(_QWORD *)(a1 + 64))
  {
    v6 = dispatch_time(0, 500000000);
    dispatch_get_global_queue(0, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __100__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_retryCount_completionHandler___block_invoke_8;
    block[3] = &unk_24EB69B28;
    v8 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v13 = v8;
    v9 = *(id *)(a1 + 48);
    v11 = *(void **)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v14 = v9;
    v16 = v10;
    v15 = v11;
    dispatch_after(v6, v7, block);

  }
  else
  {
LABEL_6:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __100__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_retryCount_completionHandler___block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_222CB9000, v2, OS_LOG_TYPE_DEFAULT, "Retry setting wallpaper...", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updateWallpaperConfiguraitonWithUUID:updates:retryCount:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64) - 1, *(_QWORD *)(a1 + 56));
}

- (void)_updateWallpaperConfiguraitonWithUUID:(id)a3 updates:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8 && objc_msgSend(v9, "count"))
  {
    objc_initWeak(&location, self);
    -[MDMWallpaperUtilities posterService](self, "posterService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke;
    v12[3] = &unk_24EB69BA0;
    objc_copyWeak(&v14, &location);
    v13 = v10;
    objc_msgSend(v11, "updatePosterConfigurationMatchingUUID:updates:completion:", v8, v9, v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

void __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = *(NSObject **)DMCLogObjects();
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v16 = v7;
        _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_ERROR, "Failed to update poster configuration UUID with error: %{public}@", buf, 0xCu);
      }
      v10 = *(_QWORD *)(a1 + 32);
      if (v10)
        (*(void (**)(uint64_t, id))(v10 + 16))(v10, v7);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_222CB9000, v9, OS_LOG_TYPE_DEFAULT, "Poster configuration updated.", buf, 2u);
      }
      objc_msgSend(WeakRetained, "posterService");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke_12;
      v12[3] = &unk_24EB69B78;
      v14 = *(id *)(a1 + 32);
      v12[4] = WeakRetained;
      v13 = v6;
      objc_msgSend(v11, "updateSelectedForRoleIdentifier:newlySelectedConfiguration:completion:", CFSTR("PRPosterRoleLockScreen"), v13, v12);

    }
  }

}

void __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)DMCLogObjects();
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v3;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_ERROR, "Failed to selected configuration with error: %{public}@", buf, 0xCu);
    }
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_222CB9000, v4, OS_LOG_TYPE_DEFAULT, "Poster configuration selected.", buf, 2u);
    }
    objc_msgSend(*(id *)(a1 + 32), "posterService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke_13;
    v8[3] = &unk_24EB68318;
    v7 = *(_QWORD *)(a1 + 40);
    v9 = *(id *)(a1 + 48);
    objc_msgSend(v6, "refreshSnapshotForPosterConfiguration:completion:", v7, v8);

  }
}

void __89__MDMWallpaperUtilities__updateWallpaperConfiguraitonWithUUID_updates_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(NSObject **)DMCLogObjects();
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v3;
      v5 = "Failed to refresh snapshot for poster configuration with error: %{public}@";
      v6 = v4;
      v7 = OS_LOG_TYPE_ERROR;
      v8 = 12;
LABEL_6:
      _os_log_impl(&dword_222CB9000, v6, v7, v5, (uint8_t *)&v9, v8);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v9) = 0;
    v5 = "Poster configuration snapshot refreshed.";
    v6 = v4;
    v7 = OS_LOG_TYPE_DEFAULT;
    v8 = 2;
    goto LABEL_6;
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v3);

}

- (PRSService)posterService
{
  PRSService *posterService;
  PRSService *v4;
  PRSService *v5;

  posterService = self->_posterService;
  if (!posterService)
  {
    v4 = (PRSService *)objc_alloc_init(MEMORY[0x24BE74C60]);
    v5 = self->_posterService;
    self->_posterService = v4;

    posterService = self->_posterService;
  }
  return posterService;
}

- (PRSExternalSystemService)externalPosterService
{
  PRSExternalSystemService *externalPosterService;
  PRSExternalSystemService *v4;
  PRSExternalSystemService *v5;

  externalPosterService = self->_externalPosterService;
  if (!externalPosterService)
  {
    v4 = (PRSExternalSystemService *)objc_alloc_init(MEMORY[0x24BE74C08]);
    v5 = self->_externalPosterService;
    self->_externalPosterService = v4;

    externalPosterService = self->_externalPosterService;
  }
  return externalPosterService;
}

- (id)_storeImageToTempDirectory:(id)a3
{
  UIImage *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (UIImage *)a3;
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("MDMWallpaper.png"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initFileURLWithPath:", v5);
  UIImagePNGRepresentation(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  v8 = objc_msgSend(v7, "writeToURL:options:error:", v6, 1, &v16);
  v9 = v16;

  v10 = *(NSObject **)DMCLogObjects();
  if ((v8 & 1) != 0)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v6;
      v11 = "Image stored to url: %{public}@";
      v12 = v10;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 12;
LABEL_6:
      _os_log_impl(&dword_222CB9000, v12, v13, v11, buf, v14);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v18 = v6;
    v19 = 2114;
    v20 = v9;
    v11 = "Failed to write image to url: %{public}@, error: %{public}@";
    v12 = v10;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 22;
    goto LABEL_6;
  }

  return v6;
}

- (void)_removeImageFromURL:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  objc_msgSend(v4, "removeItemAtURL:error:", v3, &v7);
  v5 = v7;

  if (v5)
  {
    v6 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v3;
      _os_log_impl(&dword_222CB9000, v6, OS_LOG_TYPE_ERROR, "Failed to remove image from URL with error: %{public}@", buf, 0xCu);
    }
  }

}

- (void)setPosterService:(id)a3
{
  objc_storeStrong((id *)&self->_posterService, a3);
}

- (void)setExternalPosterService:(id)a3
{
  objc_storeStrong((id *)&self->_externalPosterService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalPosterService, 0);
  objc_storeStrong((id *)&self->_posterService, 0);
}

@end
