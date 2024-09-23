@implementation FCConfigurationManager

void __39__FCConfigurationManager_segmentSetIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)segmentSetIDs
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__FCConfigurationManager_segmentSetIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (FCNewsAppConfiguration)possiblyUnfetchedAppConfiguration
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__FCConfigurationManager_possiblyUnfetchedAppConfiguration__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (FCNewsAppConfiguration *)v5;
}

- (void)fetchAppConfigurationIfNeededWithCompletion:(id)a3
{
  -[FCConfigurationManager fetchAppConfigurationIfNeededWithCompletionQueue:completion:](self, "fetchAppConfigurationIfNeededWithCompletionQueue:completion:", MEMORY[0x1E0C80D38], a3);
}

void __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
}

void __59__FCConfigurationManager__currentAppConfigurationIsExpired__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  -[FCConfigurationManager currentAppConfiguration](*(id **)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  -[FCConfigurationManager lastModificationDate](*(id **)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)lastModificationDate
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[12], "assertLocked");
    a1 = (id *)v1[3];
  }
  return a1;
}

- (id)currentAppConfiguration
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[12], "assertLocked");
    a1 = (id *)v1[2];
  }
  return a1;
}

uint64_t __83__FCConfigurationManager_fetchConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t __86__FCConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __49__FCConfigurationManager_fetchedAppConfiguration__block_invoke(uint64_t a1)
{
  void *v2;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isDefaultConfiguration") & 1) != 0)
    v2 = 0;
  else
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  uint8_t buf[8];
  _QWORD aBlock[5];
  id v25;
  id v26;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2;
  aBlock[3] = &unk_1E463E730;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v25 = v5;
  v26 = *(id *)(a1 + 48);
  v6 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCConfigurationManager _currentAppConfigurationIsExpired](*(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 56) || !v7 || ((objc_msgSend(v7, "isDefaultConfiguration") | v8) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v10, OS_LOG_TYPE_DEFAULT, "will refresh app configuration", buf, 2u);
    }
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
    {
      v12 = *(void **)(v11 + 32);
      v13 = *(_QWORD *)(v11 + 104);
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
    v14 = *(_QWORD *)(a1 + 40);
    v18[0] = v4;
    v18[1] = 3221225472;
    v18[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_93;
    v18[3] = &unk_1E463E758;
    v19 = v9;
    v22 = v6;
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v20 = v15;
    v21 = v16;
    v17 = v9;
    objc_msgSend(v12, "fetchSingleConfigurationWithSettings:completionQueue:completion:", v14, v13, v18);

  }
  else if (v6)
  {
    (*((void (**)(void *, _QWORD))v6 + 2))(v6, 0);
  }

}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  v4 = (_QWORD *)a1[4];
  if (v4)
    v4 = (_QWORD *)v4[12];
  v5 = v4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_3;
  v7[3] = &unk_1E463AD80;
  v7[4] = a1[4];
  v7[5] = &v8;
  objc_msgSend(v5, "performWithLockSync:", v7);

  (*(void (**)(void))(a1[5] + 16))();
  v6 = a1[6];
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v9[5], v3);
  _Block_object_dispose(&v8, 8);

}

uint64_t __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)fetchConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__FCConfigurationManager_fetchConfigurationIfNeededWithCompletionQueue_completion___block_invoke;
  v10[3] = &unk_1E463E5C8;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[FCConfigurationManager _fetchAppConfigurationIfNeededWithForceRefresh:completion:]((uint64_t)self, 0, v10);

}

- (void)fetchAppConfigurationIfNeededWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__FCConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke;
  v10[3] = &unk_1E463E5C8;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[FCConfigurationManager _fetchAppConfigurationIfNeededWithForceRefresh:completion:]((uint64_t)self, 0, v10);

}

- (void)_fetchAppConfigurationIfNeededWithForceRefresh:(void *)a3 completion:
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  char v10;

  v5 = a3;
  v6 = v5;
  if (a1)
  {
    v7 = *(NSObject **)(a1 + 104);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke;
    block[3] = &unk_1E463E708;
    block[4] = a1;
    v9 = v5;
    v10 = a2;
    dispatch_async(v7, block);

  }
}

- (void)fetchConfigurationIfNeededWithCompletion:(id)a3
{
  -[FCConfigurationManager fetchConfigurationIfNeededWithCompletionQueue:completion:](self, "fetchConfigurationIfNeededWithCompletionQueue:completion:", MEMORY[0x1E0C80D38], a3);
}

void __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void (**v4)(void *, uint64_t, _QWORD);
  _BYTE *v5;
  void *v6;
  void *v7;
  char v8;
  char v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  id v22;
  _QWORD *v23;
  void *v24;
  void *v25;
  char v26;
  _QWORD v27[4];
  void (**v28)(void *, uint64_t, _QWORD);
  char v29;
  _QWORD aBlock[5];
  id v31;
  _QWORD v32[5];
  id v33;
  _QWORD *v34;
  char v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  aBlock[2] = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_2;
  aBlock[3] = &unk_1E463E6B8;
  v2 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  v31 = v2;
  v4 = (void (**)(void *, uint64_t, _QWORD))_Block_copy(aBlock);
  v5 = *(_BYTE **)(a1 + 32);
  if (!v5 || !v5[10])
  {
    objc_msgSend(v5, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "isDefaultConfiguration");
      v9 = 1;
      if (!*(_BYTE *)(a1 + 48) && (v8 & 1) == 0)
      {
        v4[2](v4, 1, 0);
        if (!-[FCConfigurationManager _currentAppConfigurationIsExpired](*(_QWORD *)(a1 + 32)))
        {
LABEL_15:

          goto LABEL_16;
        }
        v9 = 0;
      }
    }
    else
    {
      v9 = 1;
    }
    v26 = v9;
    -[FCConfigurationManager _storefrontID](*(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(id **)(a1 + 32);
    +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:cachePolicy:](v11, CFSTR("appConfigRequest"), v10, 0, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(_QWORD *)(a1 + 32);
    v36[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD **)(a1 + 32);
    if (v16)
      v16 = (_QWORD *)v16[6];
    v17 = v16;
    objc_msgSend(v17, "feldsparID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v14, v15, v18, v10, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(_BYTE *)(a1 + 48);
    v27[0] = v3;
    v27[1] = 3221225472;
    v27[2] = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_6;
    v27[3] = &unk_1E463E6E0;
    v28 = v4;
    v29 = v26;
    v22 = v19;
    v23 = v27;
    v24 = v23;
    if (v20)
    {
      v25 = *(void **)(v20 + 112);
      v32[0] = v3;
      v32[1] = 3221225472;
      v32[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke;
      v32[3] = &unk_1E463E780;
      v32[4] = v20;
      v34 = v23;
      v35 = v21;
      v33 = v22;
      objc_msgSend(v25, "enqueueBlock:", v32);

    }
    goto LABEL_15;
  }
  v4[2](v4, 1, 0);
LABEL_16:

}

- (FCCoreConfiguration)configuration
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__FCConfigurationManager_configuration__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (FCCoreConfiguration *)v5;
}

void __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v5 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__18;
  v14 = __Block_byref_object_dispose__18;
  v15 = 0;
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
    v6 = (_QWORD *)v6[12];
  v7 = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __84__FCConfigurationManager__fetchAppConfigurationIfNeededWithForceRefresh_completion___block_invoke_3;
  v9[3] = &unk_1E463AD80;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = &v10;
  objc_msgSend(v7, "performWithLockSync:", v9);

  if (a2)
  {
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v11[5], v5);
  }
  _Block_object_dispose(&v10, 8);

}

- (BOOL)_currentAppConfigurationIsExpired
{
  _BOOL8 v1;
  id v2;
  double v3;
  double v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v1 = a1;
  v27 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__18;
    v21 = __Block_byref_object_dispose__18;
    v22 = 0;
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__18;
    v15 = __Block_byref_object_dispose__18;
    v16 = 0;
    v2 = *(id *)(a1 + 96);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __59__FCConfigurationManager__currentAppConfigurationIsExpired__block_invoke;
    v10[3] = &unk_1E463D9D8;
    v10[4] = v1;
    v10[5] = &v17;
    v10[6] = &v11;
    objc_msgSend(v2, "performWithLockSync:", v10);

    objc_msgSend((id)v12[5], "fc_timeIntervalUntilNow");
    v4 = v3;
    v5 = objc_msgSend((id)v18[5], "appConfigRefreshRate");
    v1 = v4 >= (double)v5;
    if (v4 >= (double)v5)
    {
      v6 = (id)FCAppConfigurationLog;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = v12[5];
        v8 = objc_msgSend((id)v18[5], "appConfigRefreshRate");
        *(_DWORD *)buf = 138543618;
        v24 = v7;
        v25 = 2048;
        v26 = v8;
        _os_log_impl(&dword_1A1B90000, v6, OS_LOG_TYPE_DEFAULT, "App config needs to refresh lastModificationDate: %{public}@ refreshRate: %lld", buf, 0x16u);
      }

    }
    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }
  return v1;
}

void __86__FCConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__FCConfigurationManager_fetchAppConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1E463DC60;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

void __83__FCConfigurationManager_fetchConfigurationIfNeededWithCompletionQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__FCConfigurationManager_fetchConfigurationIfNeededWithCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_1E463DC60;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

- (id)_storefrontID
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "contentStoreFrontID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "supportedContentStoreFrontID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(MEMORY[0x1E0DE7910], "nf_object:isEqualToObject:", v2, v4);
  v6 = FCAppConfigurationLog;
  v7 = os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v12 = 138543362;
      v13 = v2;
      v8 = "configuration manager will use the current storefrontID: %{public}@";
      v9 = v6;
      v10 = 12;
LABEL_7:
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else if (v7)
  {
    v12 = 138543618;
    v13 = v2;
    v14 = 2114;
    v15 = v4;
    v8 = "configuration manager will fall back from the current storefrontID: %{public}@ to the supported storefrontID: %{public}@";
    v9 = v6;
    v10 = 22;
    goto LABEL_7;
  }

  return v4;
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (void)_configurationDidChangeSignificantConfigChange:(int)a3 paywallConfigDidChange:(char)a4 scienceExperimentFieldsDidChange:
{
  NSObject *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  id *v20;
  id v21;
  id v22;
  char v23;
  char v24;
  char v25;
  uint8_t buf[4];
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1[12], "assertLocked");
    v8 = FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v27 = a2;
      v28 = 1024;
      v29 = a3;
      _os_log_impl(&dword_1A1B90000, v8, OS_LOG_TYPE_DEFAULT, "configuration manager notify observers with significantConfigChange: %d paywallConfigDidChange: %d", buf, 0xEu);
    }
    v9 = a1[26];
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = a1[25];
    objc_msgSend(v11, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[FCConfigurationManager currentAppConfiguration](a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __129__FCConfigurationManager__configurationDidChangeSignificantConfigChange_paywallConfigDidChange_scienceExperimentFieldsDidChange___block_invoke;
    block[3] = &unk_1E463E848;
    v19 = v10;
    v20 = a1;
    v23 = a4;
    v21 = v14;
    v22 = v12;
    v24 = a2;
    v25 = a3;
    v15 = v12;
    v16 = v14;
    v17 = v10;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __42__FCConfigurationManager_appConfiguration__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1[4] + 16), "copy");
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_BYTE *)(a1[4] + 9);
}

void __39__FCConfigurationManager_configuration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __59__FCConfigurationManager_possiblyUnfetchedAppConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (FCNewsAppConfiguration)appConfiguration
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v9;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__18;
  v15 = __Block_byref_object_dispose__18;
  v16 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__FCConfigurationManager_appConfiguration__block_invoke;
  v10[3] = &unk_1E463D9D8;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v10);

  if (!NSClassFromString(CFSTR("XCTest")) && !*((_BYTE *)v18 + 24))
  {
    v5 = MEMORY[0x1E0C81028];
    v6 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("shouldn't be calling -appConfiguration without first making an attempt to fetch the app config"));
      *(_DWORD *)buf = 136315906;
      v22 = "-[FCConfigurationManager appConfiguration]";
      v23 = 2080;
      v24 = "FCConfigurationManager.m";
      v25 = 1024;
      v26 = 291;
      v27 = 2114;
      v28 = v9;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return (FCNewsAppConfiguration *)v7;
}

uint64_t __47__FCConfigurationManager_addAppConfigObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 200);
  else
    v3 = 0;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40))
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already an observer"), *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCConfigurationManager addAppConfigObserver:]_block_invoke";
    v10 = 2080;
    v11 = "FCConfigurationManager.m";
    v12 = 1024;
    v13 = 367;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 200);
  else
    v5 = 0;
  return objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __38__FCConfigurationManager_addObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(void **)(v2 + 208);
  else
    v3 = 0;
  if (objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 40))
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%p is already an observer"), *(_QWORD *)(a1 + 40));
    *(_DWORD *)buf = 136315906;
    v9 = "-[FCConfigurationManager addObserver:]_block_invoke";
    v10 = 2080;
    v11 = "FCConfigurationManager.m";
    v12 = 1024;
    v13 = 422;
    v14 = 2114;
    v15 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
    v5 = *(void **)(v4 + 208);
  else
    v5 = 0;
  return objc_msgSend(v5, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addAppConfigObserver:(id)a3
{
  id v4;
  void *v5;
  NFUnfairLock *accessLock;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self)
      accessLock = self->_accessLock;
    else
      accessLock = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__FCConfigurationManager_addAppConfigObserver___block_invoke;
    v8[3] = &unk_1E463AD10;
    v8[4] = self;
    v9 = v4;
    -[NFUnfairLock performWithLockSync:](accessLock, "performWithLockSync:", v8);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCConfigurationManager addAppConfigObserver:]";
    v12 = 2080;
    v13 = "FCConfigurationManager.m";
    v14 = 1024;
    v15 = 362;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NFUnfairLock *accessLock;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self)
      accessLock = self->_accessLock;
    else
      accessLock = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__FCConfigurationManager_addObserver___block_invoke;
    v8[3] = &unk_1E463AD10;
    v8[4] = self;
    v9 = v4;
    -[NFUnfairLock performWithLockSync:](accessLock, "performWithLockSync:", v8);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCConfigurationManager addObserver:]";
    v12 = 2080;
    v13 = "FCConfigurationManager.m";
    v14 = 1024;
    v15 = 417;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

- (void)_saveConfigData:(uint64_t)a3 forRequestKey:
{
  void *v4;
  id v5;
  id v6;

  if (a1)
  {
    v4 = *(void **)(a1 + 152);
    v5 = a2;
    objc_msgSend(v4, "URLByAppendingPathComponent:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeToURL:atomically:", v6, 1);

  }
}

- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5 appShortVersionString:(id)a6 buildNumberString:(id)a7 networkBehaviorMonitor:(id)a8
{
  return -[FCConfigurationManager initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:appShortVersionString:buildNumberString:networkBehaviorMonitor:appActivityMonitor:applicationState:](self, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:appShortVersionString:buildNumberString:networkBehaviorMonitor:appActivityMonitor:applicationState:", a3, a4, a5, a6, a7, a8, 0, 0);
}

- (id)_loadConfigDataForRequestKey:(void *)a1
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "URLByAppendingPathComponent:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setTreatmentIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (void)setSegmentSetIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (FCNewsAppConfiguration)fetchedAppConfiguration
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__FCConfigurationManager_fetchedAppConfiguration__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (FCNewsAppConfiguration *)v5;
}

void __38__FCConfigurationManager_treatmentIDs__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 216), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __129__FCConfigurationManager__configurationDidChangeSignificantConfigChange_paywallConfigDidChange_scienceExperimentFieldsDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "configurationManager:configurationDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
        if (*(_BYTE *)(a1 + 64) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "configurationManagerScienceExperimentFieldsDidChange:", *(_QWORD *)(a1 + 40));
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v4);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = *(id *)(a1 + 56);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "configurationManager:appConfigurationDidChange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v14);
        if (*(_BYTE *)(a1 + 65) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "configurationManagerSignificantAppConfigChange:", *(_QWORD *)(a1 + 40));
        if (*(_BYTE *)(a1 + 66) && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "configurationManagerPaywallConfigDidChange:", *(_QWORD *)(a1 + 40));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

void __45__FCConfigurationManager_overrideAppConfigID__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  if (NFInternalBuild())
  {
    NewsCoreUserDefaults();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "BOOLForKey:", CFSTR("enable_config_overrides")) & 1) != 0)
    {
      NewsCoreUserDefaults();
      v0 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v0, "stringForKey:", CFSTR("override_appconfig_id"));
      v1 = objc_claimAutoreleasedReturnValue();
      v2 = (void *)_MergedGlobals_147;
      _MergedGlobals_147 = v1;

    }
    else
    {
      v0 = (void *)_MergedGlobals_147;
      _MergedGlobals_147 = 0;
    }

    v3 = v4;
  }
  else
  {
    v3 = (void *)_MergedGlobals_147;
    _MergedGlobals_147 = 0;
  }

}

- (NSArray)treatmentIDs
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__FCConfigurationManager_treatmentIDs__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSArray *)v5;
}

- (FCConfigurationManager)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCConfigurationManager init]";
    v9 = 2080;
    v10 = "FCConfigurationManager.m";
    v11 = 1024;
    v12 = 137;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCConfigurationManager init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (id)initForTesting
{
  FCConfigurationManager *v2;
  uint64_t v3;
  FCNewsAppConfig *currentAppConfiguration;
  uint64_t v5;
  NFUnfairLock *accessLock;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *workQueue;
  FCAsyncSerialQueue *v11;
  FCAsyncSerialQueue *remoteAppConfigSerialQueue;
  FCAsyncSerialQueue *v13;
  FCAsyncSerialQueue *remoteWidgetConfigSerialQueue;
  FCAsyncSerialQueue *v15;
  FCAsyncSerialQueue *remoteTodayConfigSerialQueue;
  FCAsyncSerialQueue *v17;
  FCAsyncSerialQueue *remoteMagazineConfigSerialQueue;
  FCAsyncSerialQueue *v19;
  FCAsyncSerialQueue *remoteAudioConfigSerialQueue;
  void *v21;
  uint64_t v22;
  NSString *appShortVersionString;
  void *v24;
  uint64_t v25;
  NSString *buildNumberString;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)FCConfigurationManager;
  v2 = -[FCConfigurationManager init](&v28, sel_init);
  if (v2)
  {
    +[FCNewsAppConfig defaultConfigurationForStoreFrontID:]((uint64_t)FCNewsAppConfig, CFSTR("143441"));
    v3 = objc_claimAutoreleasedReturnValue();
    currentAppConfiguration = v2->_currentAppConfiguration;
    v2->_currentAppConfiguration = (FCNewsAppConfig *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
    accessLock = v2->_accessLock;
    v2->_accessLock = (NFUnfairLock *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("FCAppConfig.workQueue", v8);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v9;

    v11 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", v2->_workQueue, 25);
    remoteAppConfigSerialQueue = v2->_remoteAppConfigSerialQueue;
    v2->_remoteAppConfigSerialQueue = v11;

    v13 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", v2->_workQueue, 25);
    remoteWidgetConfigSerialQueue = v2->_remoteWidgetConfigSerialQueue;
    v2->_remoteWidgetConfigSerialQueue = v13;

    v15 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", v2->_workQueue, 25);
    remoteTodayConfigSerialQueue = v2->_remoteTodayConfigSerialQueue;
    v2->_remoteTodayConfigSerialQueue = v15;

    v17 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", v2->_workQueue, 25);
    remoteMagazineConfigSerialQueue = v2->_remoteMagazineConfigSerialQueue;
    v2->_remoteMagazineConfigSerialQueue = v17;

    v19 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", v2->_workQueue, 25);
    remoteAudioConfigSerialQueue = v2->_remoteAudioConfigSerialQueue;
    v2->_remoteAudioConfigSerialQueue = v19;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v22 = objc_claimAutoreleasedReturnValue();
    appShortVersionString = v2->_appShortVersionString;
    v2->_appShortVersionString = (NSString *)v22;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
    v25 = objc_claimAutoreleasedReturnValue();
    buildNumberString = v2->_buildNumberString;
    v2->_buildNumberString = (NSString *)v25;

    v2->_applicationState = 0;
    v2->_runningUnitTests = 1;
  }
  return v2;
}

- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  FCConfigurationManager *v16;

  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForInfoDictionaryKey:", CFSTR("CFBundleVersion"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[FCConfigurationManager initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:appShortVersionString:buildNumberString:networkBehaviorMonitor:appActivityMonitor:applicationState:](self, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:appShortVersionString:buildNumberString:networkBehaviorMonitor:appActivityMonitor:applicationState:", v11, v10, v9, v13, v15, 0, 0, 0);

  return v16;
}

- (FCConfigurationManager)initWithContextConfiguration:(id)a3 contentHostDirectoryFileURL:(id)a4 feldsparIDProvider:(id)a5 appShortVersionString:(id)a6 buildNumberString:(id)a7 networkBehaviorMonitor:(id)a8 appActivityMonitor:(id)a9 applicationState:(unint64_t)a10
{
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  void *v33;
  FCAsyncSerialQueue *v34;
  void *v35;
  FCAsyncSerialQueue *v36;
  void *v37;
  FCAsyncSerialQueue *v38;
  void *v39;
  FCAsyncSerialQueue *v40;
  void *v41;
  FCAsyncSerialQueue *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  char v51;
  void *v52;
  uint64_t v53;
  void *v54;
  FCKeyValueStore *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t i;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  SEL v72;
  SEL v73;
  SEL v74;
  void *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t j;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  _BYTE *v91;
  uint64_t v92;
  void *v93;
  NSObject *v94;
  uint64_t v95;
  id v96;
  void *v97;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  void *v107;
  id obj;
  id v109;
  id selfa;
  _QWORD v111[4];
  id v112;
  objc_super v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint8_t buf[4];
  uint64_t v123;
  _BYTE v124[128];
  id location[19];

  location[16] = *(id *)MEMORY[0x1E0C80C00];
  v101 = a3;
  v102 = a4;
  v99 = a5;
  v104 = a6;
  v103 = a7;
  v100 = a8;
  v105 = a9;
  v113.receiver = self;
  v113.super_class = (Class)FCConfigurationManager;
  selfa = -[FCConfigurationManager init](&v113, sel_init);
  if (!selfa)
    goto LABEL_77;
  objc_storeStrong((id *)selfa + 5, a3);
  objc_storeStrong((id *)selfa + 6, a5);
  objc_msgSend(*((id *)selfa + 6), "addObserver:", selfa);
  v17 = objc_msgSend(v104, "copy");
  v18 = (void *)*((_QWORD *)selfa + 7);
  *((_QWORD *)selfa + 7) = v17;

  v19 = objc_msgSend(v103, "copy");
  v20 = (void *)*((_QWORD *)selfa + 8);
  *((_QWORD *)selfa + 8) = v19;

  *((_QWORD *)selfa + 9) = a10;
  objc_storeStrong((id *)selfa + 10, a9);
  if (v105)
    objc_msgSend(v105, "addObserver:", selfa);
  objc_storeStrong((id *)selfa + 11, a8);
  objc_msgSend(v101, "contentContainerCombinationIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "URLByAppendingPathComponent:isDirectory:", v21, 1);
  v106 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D86F48]), "initWithContentDirectoryURL:", v106);
  v23 = (void *)*((_QWORD *)selfa + 4);
  *((_QWORD *)selfa + 4) = v22;

  v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D60B18]), "initWithOptions:", 1);
  v25 = (void *)*((_QWORD *)selfa + 12);
  *((_QWORD *)selfa + 12) = v24;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)*((_QWORD *)selfa + 26);
  *((_QWORD *)selfa + 26) = v26;

  objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = (void *)*((_QWORD *)selfa + 25);
  *((_QWORD *)selfa + 25) = v28;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v30 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v30, QOS_CLASS_USER_INITIATED, 0);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = dispatch_queue_create("FCAppConfig.workQueue", v31);
  v33 = (void *)*((_QWORD *)selfa + 13);
  *((_QWORD *)selfa + 13) = v32;

  v34 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", *((_QWORD *)selfa + 13), 25);
  v35 = (void *)*((_QWORD *)selfa + 14);
  *((_QWORD *)selfa + 14) = v34;

  v36 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", *((_QWORD *)selfa + 13), 25);
  v37 = (void *)*((_QWORD *)selfa + 15);
  *((_QWORD *)selfa + 15) = v36;

  v38 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", *((_QWORD *)selfa + 13), 25);
  v39 = (void *)*((_QWORD *)selfa + 16);
  *((_QWORD *)selfa + 16) = v38;

  v40 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", *((_QWORD *)selfa + 13), 25);
  v41 = (void *)*((_QWORD *)selfa + 17);
  *((_QWORD *)selfa + 17) = v40;

  v42 = -[FCAsyncSerialQueue initWithUnderlyingQueue:qualityOfService:]([FCAsyncSerialQueue alloc], "initWithUnderlyingQueue:qualityOfService:", *((_QWORD *)selfa + 13), 25);
  v43 = (void *)*((_QWORD *)selfa + 18);
  *((_QWORD *)selfa + 18) = v42;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "stringForKey:", CFSTR("FCAppConfigurationBundleShortVersionKey"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "infoDictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("CFBundleShortVersionString"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v48, "isEqualToString:", v45) & 1) == 0
    || (NewsCoreUserDefaults(),
        v49 = (void *)objc_claimAutoreleasedReturnValue(),
        v50 = objc_msgSend(v49, "BOOLForKey:", CFSTR("force_refresh_user_segmentation")),
        v49,
        v50))
  {
    objc_msgSend(v44, "setObject:forKey:", v48, CFSTR("FCAppConfigurationBundleShortVersionKey"));
    NewsCoreUserDefaults();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setBool:forKey:", 0, CFSTR("force_refresh_user_segmentation"));

    v51 = 1;
  }
  else
  {
    v51 = 0;
  }

  *((_BYTE *)selfa + 8) = v51;
  objc_msgSend(v106, "URLByAppendingPathComponent:", CFSTR("app-configs"));
  v53 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)*((_QWORD *)selfa + 19);
  *((_QWORD *)selfa + 19) = v53;

  v55 = [FCKeyValueStore alloc];
  objc_msgSend(v106, "relativePath");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:](v55, "initWithName:directory:version:options:classRegistry:", CFSTR("app-config"), v56, 2, 0, 0);
  v58 = (void *)*((_QWORD *)selfa + 20);
  *((_QWORD *)selfa + 20) = v57;

  if (*((_BYTE *)selfa + 8))
  {
    objc_msgSend(*((id *)selfa + 20), "removeAllObjects");
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "removeItemAtURL:error:", *((_QWORD *)selfa + 19), 0);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *((_QWORD *)selfa + 19), 1, 0, 0);

  v109 = *((id *)selfa + 20);
  -[FCConfigurationManager _storefrontID]((uint64_t)selfa);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = 0u;
  v121 = 0u;
  v119 = 0u;
  v118 = 0u;
  location[0] = CFSTR("appConfigRequest");
  location[1] = CFSTR("magazinesConfigRequest");
  location[2] = CFSTR("audioConfigRequest");
  location[3] = CFSTR("todayConfigRequest");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", location, 4);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v61 = 0;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, location, 16);
  if (v62)
  {
    v63 = *(_QWORD *)v119;
    do
    {
      for (i = 0; i != v62; ++i)
      {
        if (*(_QWORD *)v119 != v63)
          objc_enumerationMutation(obj);
        v65 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
        v66 = (void *)MEMORY[0x1A8580B64]();
        if (objc_msgSend(v65, "isEqualToString:", CFSTR("appConfigRequest")))
        {
          -[FCConfigurationManager _loadConfigDataForRequestKey:](*((void **)selfa + 19), (uint64_t)v65);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCConfigurationManager _deviceInfoWithFormatVersion:](*((void **)selfa + 7), *((_QWORD *)selfa + 8), 0);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v68;
          if (v67)
          {
            objc_msgSend(v68, "preferredLanguages");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            +[FCNewsAppConfig configurationWithData:storefrontID:preferredLanguageTags:]((uint64_t)FCNewsAppConfig, v67, v107, v70);
            v71 = objc_claimAutoreleasedReturnValue();

            v61 = v70;
          }
          else
          {
            v71 = 0;
          }

        }
        else
        {
          if (objc_msgSend(v65, "isEqualToString:", CFSTR("magazinesConfigRequest")))
          {
            -[FCConfigurationManager _loadConfigDataForRequestKey:](*((void **)selfa + 19), (uint64_t)v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setProperty_nonatomic_copy(selfa, v72, v67, 176);
          }
          else if (objc_msgSend(v65, "isEqualToString:", CFSTR("todayConfigRequest")))
          {
            -[FCConfigurationManager _loadConfigDataForRequestKey:](*((void **)selfa + 19), (uint64_t)v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setProperty_nonatomic_copy(selfa, v73, v67, 184);
          }
          else
          {
            if (!objc_msgSend(v65, "isEqualToString:", CFSTR("audioConfigRequest")))
              goto LABEL_28;
            -[FCConfigurationManager _loadConfigDataForRequestKey:](*((void **)selfa + 19), (uint64_t)v65);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_setProperty_nonatomic_copy(selfa, v74, v67, 192);
          }
          v71 = (uint64_t)v61;
        }

        v61 = (void *)v71;
LABEL_28:
        objc_autoreleasePoolPop(v66);
      }
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v118, location, 16);
    }
    while (v62);
  }

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  objc_msgSend(v109, "allKeys");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
  if (!v77)
    goto LABEL_66;
  v78 = *(_QWORD *)v115;
  do
  {
    for (j = 0; j != v77; ++j)
    {
      if (*(_QWORD *)v115 != v78)
        objc_enumerationMutation(v75);
      v80 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
      if (objc_msgSend(v80, "isEqualToString:", CFSTR("lastModificationDate")))
      {
        objc_opt_class();
        objc_msgSend(v109, "objectForKey:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (v81)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v82 = v81;
          else
            v82 = 0;
        }
        else
        {
          v82 = 0;
        }
        v85 = v76;
        v76 = v82;
      }
      else if (objc_msgSend(v80, "isEqualToString:", CFSTR("treatmentIDs")))
      {
        objc_opt_class();
        objc_msgSend(v109, "objectForKey:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (v81)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v83 = v81;
          else
            v83 = 0;
        }
        else
        {
          v83 = 0;
        }
        v85 = v83;
        objc_msgSend(selfa, "setTreatmentIDs:", v85);
      }
      else if (objc_msgSend(v80, "isEqualToString:", CFSTR("segmentSetIDs")))
      {
        objc_opt_class();
        objc_msgSend(v109, "objectForKey:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (v81)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v84 = v81;
          else
            v84 = 0;
        }
        else
        {
          v84 = 0;
        }
        v85 = v84;
        objc_msgSend(selfa, "setSegmentSetIDs:", v85);
      }
      else
      {
        if (!objc_msgSend(v80, "isEqualToString:", CFSTR("widgetConfigurationDict")))
          continue;
        objc_opt_class();
        objc_msgSend(v109, "objectForKey:", v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (v81)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v86 = v81;
          else
            v86 = 0;
        }
        else
        {
          v86 = 0;
        }
        v87 = v86;
        v85 = (id)*((_QWORD *)selfa + 21);
        *((_QWORD *)selfa + 21) = v87;
      }

    }
    v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v114, v124, 16);
  }
  while (v77);
LABEL_66:

  v88 = (void *)*((_QWORD *)selfa + 21);
  if (v88)
  {
    objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("widgetAppConfiguration"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("widgetLanguageConfiguration"));
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:]([FCNewsAppConfig alloc], v89, v107, v90);

    v61 = v91;
  }
  if (v76)
  {
    objc_storeStrong((id *)selfa + 3, v76);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v92 = objc_claimAutoreleasedReturnValue();
    v93 = (void *)*((_QWORD *)selfa + 3);
    *((_QWORD *)selfa + 3) = v92;

    objc_msgSend(v109, "setObject:forKey:", *((_QWORD *)selfa + 3), CFSTR("lastModificationDate"));
  }
  v94 = FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
  {
    v95 = *((_QWORD *)selfa + 3);
    *(_DWORD *)buf = 138543362;
    v123 = v95;
    _os_log_impl(&dword_1A1B90000, v94, OS_LOG_TYPE_DEFAULT, "App config initialized with lastModificationDate: %{public}@", buf, 0xCu);
  }
  if (v61)
  {
    v96 = v61;
  }
  else
  {
    +[FCNewsAppConfig defaultConfigurationForStoreFrontID:]((uint64_t)FCNewsAppConfig, v107);
    v96 = (id)objc_claimAutoreleasedReturnValue();
  }
  v97 = (void *)*((_QWORD *)selfa + 2);
  *((_QWORD *)selfa + 2) = v96;

  objc_initWeak(location, selfa);
  v111[0] = MEMORY[0x1E0C809B0];
  v111[1] = 3221225472;
  v111[2] = __201__FCConfigurationManager_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_appShortVersionString_buildNumberString_networkBehaviorMonitor_appActivityMonitor_applicationState___block_invoke;
  v111[3] = &unk_1E463E5A0;
  objc_copyWeak(&v112, location);
  objc_msgSend(*((id *)selfa + 4), "setNetworkEventHandler:", v111);
  objc_destroyWeak(&v112);
  objc_destroyWeak(location);

LABEL_77:
  return (FCConfigurationManager *)selfa;
}

void __201__FCConfigurationManager_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_appShortVersionString_buildNumberString_networkBehaviorMonitor_appActivityMonitor_applicationState___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  char v19;
  void *v20;
  int v21;
  FCNetworkEvent *v22;
  id *WeakRetained;
  _QWORD v24[4];
  id v25;

  v6 = (id *)(a1 + 32);
  v7 = a3;
  v8 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v6);
  v9 = v8;
  v10 = v7;
  if (WeakRetained)
  {
    v11 = (void *)MEMORY[0x1E0C99E60];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __76__FCConfigurationManager__logNetworkEvent_configurationSettings_isFallback___block_invoke;
    v24[3] = &unk_1E463AE18;
    v25 = v10;
    objc_msgSend(v11, "fc_set:", v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("appConfigRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToSet:", v13);

    if (v14)
    {
      if (a4)
        v15 = 16;
      else
        v15 = 18;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("todayConfigRequest"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v12, "isEqualToSet:", v16);

      if ((v17 & 1) != 0)
      {
        v15 = 20;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("widgetConfigRequest"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v12, "isEqualToSet:", v18);

        if ((v19 & 1) != 0)
        {
          v15 = 22;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("widgetConfigRequest"), CFSTR("todayConfigRequest"), 0);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v12, "isEqualToSet:", v20);

          if (!v21)
          {
LABEL_13:

            goto LABEL_14;
          }
          v15 = 23;
        }
      }
    }
    v22 = -[FCNetworkEvent initWithType:rcNetworkEvent:]([FCNetworkEvent alloc], "initWithType:rcNetworkEvent:", v15, v9);
    objc_msgSend(WeakRetained[11], "logNetworkEvent:", v22);

    goto LABEL_13;
  }
LABEL_14:

}

- (FCNewsAppConfiguration)jsonEncodableAppConfiguration
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__FCConfigurationManager_jsonEncodableAppConfiguration__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (FCNewsAppConfiguration *)v5;
}

void __55__FCConfigurationManager_jsonEncodableAppConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)refreshAppConfigurationIfNeededWithCompletionQueue:(id)a3 refreshCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__FCConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke;
  v10[3] = &unk_1E463E5C8;
  v11 = v6;
  v12 = v7;
  v8 = v6;
  v9 = v7;
  -[FCConfigurationManager _fetchAppConfigurationIfNeededWithForceRefresh:completion:]((uint64_t)self, 1, v10);

}

void __95__FCConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__FCConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_2;
    block[3] = &unk_1E463DC60;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __95__FCConfigurationManager_refreshAppConfigurationIfNeededWithCompletionQueue_refreshCompletion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchAppWidgetConfigurationWithTodayLiteConfig:(BOOL)a3 additionalFields:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  FCAsyncSerialQueue *remoteWidgetConfigSerialQueue;
  id v15;
  void *v16;
  void *v17;
  _BYTE buf[24];
  __int128 v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "additionalFields != nil");
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[FCConfigurationManager fetchAppWidgetConfigurationWithTodayLiteConfig:additionalFields:completion:]";
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = "FCConfigurationManager.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v19) = 352;
    WORD2(v19) = 2114;
    *(_QWORD *)((char *)&v19 + 6) = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v10 = v8;
  v11 = (void *)MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C80D38];
  v13 = v9;
  if (self)
  {
    if (!v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "additionalFields != nil");
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[FCConfigurationManager _fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig:additi"
                           "onalFields:completionQueue:completion:]";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = "FCConfigurationManager.m";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v19) = 873;
      WORD2(v19) = 2114;
      *(_QWORD *)((char *)&v19 + 6) = v17;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    remoteWidgetConfigSerialQueue = self->_remoteWidgetConfigSerialQueue;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke;
    *(_QWORD *)&v19 = &unk_1E463E820;
    *((_QWORD *)&v19 + 1) = self;
    v22 = v13;
    v20 = v10;
    v23 = a3;
    v24 = 0;
    v15 = v11;
    v21 = v11;
    -[FCAsyncSerialQueue enqueueBlock:](remoteWidgetConfigSerialQueue, "enqueueBlock:", buf);

  }
}

- (void)removeAppConfigObserver:(id)a3
{
  id v4;
  void *v5;
  NFUnfairLock *accessLock;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self)
      accessLock = self->_accessLock;
    else
      accessLock = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50__FCConfigurationManager_removeAppConfigObserver___block_invoke;
    v8[3] = &unk_1E463AD10;
    v8[4] = self;
    v9 = v4;
    -[NFUnfairLock performWithLockSync:](accessLock, "performWithLockSync:", v8);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCConfigurationManager removeAppConfigObserver:]";
    v12 = 2080;
    v13 = "FCConfigurationManager.m";
    v14 = 1024;
    v15 = 375;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

uint64_t __50__FCConfigurationManager_removeAppConfigObserver___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[25];
  return objc_msgSend(v1, "removeObject:", *(_QWORD *)(a1 + 40));
}

- (NSString)feldsparID
{
  void *v2;
  void *v3;

  if (self)
    self = (FCConfigurationManager *)self->_feldsparIDProvider;
  -[FCConfigurationManager feldsparID](self, "feldsparID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSString *)v3;
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NFUnfairLock *accessLock;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (self)
      accessLock = self->_accessLock;
    else
      accessLock = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __41__FCConfigurationManager_removeObserver___block_invoke;
    v8[3] = &unk_1E463AD10;
    v8[4] = self;
    v9 = v4;
    -[NFUnfairLock performWithLockSync:](accessLock, "performWithLockSync:", v8);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "observer != nil");
    *(_DWORD *)buf = 136315906;
    v11 = "-[FCConfigurationManager removeObserver:]";
    v12 = 2080;
    v13 = "FCConfigurationManager.m";
    v14 = 1024;
    v15 = 430;
    v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
}

uint64_t __41__FCConfigurationManager_removeObserver___block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1)
    v1 = (_QWORD *)v1[26];
  return objc_msgSend(v1, "removeObject:", *(_QWORD *)(a1 + 40));
}

- (NSData)magazinesConfigurationData
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FCConfigurationManager_magazinesConfigurationData__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSData *)v5;
}

void __52__FCConfigurationManager_magazinesConfigurationData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)fetchMagazinesConfigurationIfNeededWithCompletionQueue:(id)a3 formatVersion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  FCAsyncSerialQueue *remoteMagazineConfigSerialQueue;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __106__FCConfigurationManager_fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke;
  v21 = &unk_1E463E5F0;
  v22 = v8;
  v23 = v9;
  v11 = v8;
  v12 = v9;
  v13 = v11;
  v14 = a4;
  v15 = &v18;
  v16 = v15;
  if (self)
  {
    remoteMagazineConfigSerialQueue = self->_remoteMagazineConfigSerialQueue;
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke;
    v24[3] = &unk_1E463E640;
    v24[4] = self;
    v27 = v15;
    v25 = v13;
    v26 = v14;
    -[FCAsyncSerialQueue enqueueBlock:](remoteMagazineConfigSerialQueue, "enqueueBlock:", v24, v18, v19, v20, v21, v22, v23);

  }
}

void __106__FCConfigurationManager_fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__FCConfigurationManager_fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2;
    block[3] = &unk_1E463DC60;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __106__FCConfigurationManager_fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  void (**v23)(_QWORD);
  _QWORD block[5];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && *(_BYTE *)(v4 + 10))
  {
    v5 = *(void **)(a1 + 56);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2;
      block[3] = &unk_1E463B2D0;
      v7 = v5;
      block[4] = *(_QWORD *)(a1 + 32);
      v25 = v7;
      dispatch_async(v6, block);

    }
    v3[2](v3);
  }
  else
  {
    -[FCConfigurationManager _storefrontID](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id **)(a1 + 32);
    +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:cachePolicy:](v9, CFSTR("magazinesConfigRequest"), v8, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 32);
    v26[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD **)(a1 + 32);
    if (v14)
      v14 = (_QWORD *)v14[6];
    v15 = v14;
    objc_msgSend(v15, "feldsparID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v12, v13, v16, v8, 0, *(void **)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(void **)(v18 + 32);
    else
      v19 = 0;
    v20 = *(_QWORD *)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_3;
    v21[3] = &unk_1E463E668;
    v21[4] = v18;
    v22 = *(id *)(a1 + 56);
    v23 = v3;
    objc_msgSend(v19, "fetchSingleConfigurationWithSettings:completionQueue:completion:", v17, v20, v21);

  }
}

uint64_t __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(_QWORD *)(v3 + 176);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v4, 0);
}

- (id)_requestInfoForRequestKey:(void *)a3 storefrontID:(void *)a4 additionalChangeTags:(void *)a5 cachePolicy:
{
  if (a1)
  {
    -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:feedType:cachePolicy:](a1, a2, a3, a4, 0, a5);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_configurationSettingsWithRequestInfos:(void *)a3 feldsparID:(void *)a4 storefrontID:(unsigned int)a5 contextConfiguration:(void *)a6 useBackgroundRefreshRate:requestMode:formatVersion:
{
  void *v11;
  id v12;
  id v13;
  __CFString *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  int v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  void *v54;
  char v55;
  void *v56;
  __CFString *v57;
  void *v58;
  void *v59;
  unsigned int v60;

  if (a1)
  {
    v11 = *(void **)(a1 + 40);
    v12 = a6;
    v13 = a4;
    v14 = a3;
    v15 = a2;
    v16 = objc_msgSend(v11, "environment") - 1;
    if (v16 > 5)
      v17 = 0;
    else
      v17 = qword_1A1E821E8[v16];
    v58 = v15;
    v59 = v13;
    v57 = v14;
    if (NFInternalBuild())
    {
      NewsCoreUserDefaults();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "BOOLForKey:", CFSTR("disable_ab_testing_user_segmentation"));

      NewsCoreUserDefaults();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLForKey:", CFSTR("enable_extra_logs_user_segmentation"));

    }
    else
    {
      v21 = 0;
      v19 = 0;
    }
    v22 = *(unsigned __int8 *)(a1 + 8);
    *(_BYTE *)(a1 + 8) = 0;
    objc_opt_self();
    v60 = a5;
    v55 = v21;
    v54 = v12;
    if (NFInternalBuild())
    {
      v23 = v22;
      NewsCoreUserDefaults();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "BOOLForKey:", CFSTR("enable_overrides_user_segmentation"));

      if (v25)
      {
        NewsCoreUserDefaults();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringForKey:", CFSTR("override_segment_set_ids"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = a1;
        if (objc_msgSend(v27, "length"))
        {
          objc_msgSend(v27, "componentsSeparatedByString:", CFSTR(","));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v29 = 0;
        }
        objc_msgSend(v29, "fc_arrayByTransformingWithBlock:", &__block_literal_global_141);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v28 = a1;
        v30 = 0;
      }
      v31 = v17;
      v32 = v19;
      v22 = v23;
    }
    else
    {
      v28 = a1;
      v30 = 0;
      v31 = v17;
      v32 = v19;
    }
    objc_opt_self();
    if (NFInternalBuild())
    {
      v33 = v22;
      NewsCoreUserDefaults();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "BOOLForKey:", CFSTR("enable_overrides_user_segmentation"));

      if (v35)
      {
        NewsCoreUserDefaults();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringForKey:", CFSTR("override_additional_segment_set_ids"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v37, "length"))
        {
          objc_msgSend(v37, "componentsSeparatedByString:", CFSTR(","));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = 0;
        }
        v22 = v33;
        objc_msgSend(v38, "fc_arrayByTransformingWithBlock:", &__block_literal_global_143);
        v39 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v39 = 0;
        v22 = v33;
      }
    }
    else
    {
      v39 = 0;
    }
    if (objc_msgSend(v30, "count"))
    {

      v39 = 0;
    }
    NewsCoreUserDefaults();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "stringForKey:", CFSTR("configuration_source"));
    v41 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v41, "isEqualToString:", CFSTR("endpoint_source")) & 1) != 0)
    {
      v42 = 1;
    }
    else if (objc_msgSend(v41, "isEqualToString:", CFSTR("cloudkit_source")))
    {
      v42 = 2;
    }
    else
    {
      v42 = 0;
    }

    LOBYTE(v53) = v55;
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D86F58]), "initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:", v32, v30, v39, v42, v31, v22 != 0, v53);
    v44 = &stru_1E464BC40;
    if (v57)
      v44 = v57;
    v45 = v44;
    -[FCConfigurationManager _deviceInfoWithFormatVersion:](*(void **)(v28 + 56), *(_QWORD *)(v28 + 64), (uint64_t)v54);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v56 = v39;
    v47 = objc_alloc(MEMORY[0x1E0D86F50]);
    AppBundleID();
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v47, "initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:", v58, v45, v59, v48, v46);

    objc_msgSend(v49, "setDebugOverrides:", v43);
    objc_msgSend(v49, "setUseBackgroundRefreshRate:", v60);
    objc_msgSend(v49, "setRequestMode:", 1);
    objc_msgSend(v49, "setEndpointTimeoutDuration:", 15.0);
    v50 = *(_QWORD *)(v28 + 72);
    if (v50 == 2)
      v51 = 2;
    else
      v51 = v50 == 1;
    objc_msgSend(v49, "setApplicationState:", v51);

  }
  else
  {
    v49 = 0;
  }
  return v49;
}

void __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[6];
  __int128 v23;

  v7 = a2;
  v8 = a5;
  v9 = v8;
  if (!v7 || v8)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4;
    v22[3] = &unk_1E463E618;
    v22[4] = *(_QWORD *)(a1 + 32);
    v22[5] = v8;
    v23 = *(_OWORD *)(a1 + 40);
    v19 = (id)v23;
    __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4(v22);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(void **)(v10 + 96);
    else
      v11 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_5;
    v20[3] = &unk_1E463AD10;
    v20[4] = v10;
    v21 = v7;
    objc_msgSend(v11, "performWithLockSync:", v20);
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
    {
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
        v18 = *(_QWORD *)(v17 + 176);
      else
        v18 = 0;
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v16 + 16))(v16, v18, 0);
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v12, v13, v14, v15);

  }
}

uint64_t __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);

  v2 = a1[4];
  if (v2)
  {
    v3 = a1[6];
    if (*(_QWORD *)(v2 + 176))
    {
      if (v3)
      {
        v4 = *(void (**)(void))(v3 + 16);
LABEL_8:
        v4();
        return (*(uint64_t (**)(void))(a1[7] + 16))();
      }
      return (*(uint64_t (**)(void))(a1[7] + 16))();
    }
  }
  else
  {
    v3 = a1[6];
  }
  if (v3)
  {
    v4 = *(void (**)(void))(v3 + 16);
    goto LABEL_8;
  }
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __107__FCConfigurationManager__fetchMagazinesConfigurationIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_5(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 176);
    v3 = *(void **)(a1 + 32);
  }
  -[FCConfigurationManager _saveConfigData:forRequestKey:]((uint64_t)v3, *(void **)(a1 + 40), (uint64_t)CFSTR("magazinesConfigRequest"));
}

- (NSData)todayFeedConfigurationData
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__FCConfigurationManager_todayFeedConfigurationData__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSData *)v5;
}

void __52__FCConfigurationManager_todayFeedConfigurationData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)fetchTodayFeedConfigurationIfNeededWithCompletionQueue:(id)a3 feedType:(unint64_t)a4 formatVersion:(id)a5 cachePolicy:(id)a6 networkActivityBlock:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  FCAsyncSerialQueue *remoteTodayConfigSerialQueue;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  uint64_t *v36;
  id v37;
  unint64_t v38;

  v14 = a3;
  v15 = a8;
  v16 = MEMORY[0x1E0C809B0];
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __148__FCConfigurationManager_fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke;
  v29 = &unk_1E463E5F0;
  v30 = v14;
  v31 = v15;
  v17 = v14;
  v18 = v15;
  v19 = v17;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = &v26;
  v24 = v23;
  if (self)
  {
    remoteTodayConfigSerialQueue = self->_remoteTodayConfigSerialQueue;
    v32[0] = v16;
    v32[1] = 3221225472;
    v32[2] = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke;
    v32[3] = &unk_1E463E690;
    v32[4] = self;
    v36 = v23;
    v33 = v19;
    v38 = a4;
    v34 = v21;
    v35 = v20;
    v37 = v22;
    -[FCAsyncSerialQueue enqueueBlock:](remoteTodayConfigSerialQueue, "enqueueBlock:", v32, v26, v27, v28, v29, v30, v31);

  }
}

void __148__FCConfigurationManager_fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __148__FCConfigurationManager_fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_2;
    block[3] = &unk_1E463DC60;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __148__FCConfigurationManager_fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (**v20)(_QWORD);
  uint64_t v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && *(_BYTE *)(v4 + 10))
  {
    v5 = *(void **)(a1 + 64);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_2;
      block[3] = &unk_1E463B2D0;
      v7 = v5;
      block[4] = *(_QWORD *)(a1 + 32);
      v26 = v7;
      dispatch_async(v6, block);

    }
    v3[2](v3);
  }
  else
  {
    -[FCConfigurationManager _storefrontID](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:feedType:cachePolicy:](*(id **)(a1 + 32), CFSTR("todayConfigRequest"), v8, 0, *(_QWORD *)(a1 + 80), *(void **)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v27[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD **)(a1 + 32);
    if (v12)
      v12 = (_QWORD *)v12[6];
    v13 = v12;
    objc_msgSend(v13, "feldsparID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v10, v11, v14, v8, 0, *(void **)(a1 + 56));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
      v17 = *(void **)(v16 + 32);
    else
      v17 = 0;
    v18 = *(_QWORD *)(a1 + 40);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_3;
    v22[3] = &unk_1E463E668;
    v19 = *(_QWORD *)(a1 + 72);
    v23 = *(id *)(a1 + 64);
    v20 = v3;
    v21 = *(_QWORD *)(a1 + 32);
    v24 = v20;
    v22[4] = v21;
    objc_msgSend(v17, "fetchSingleConfigurationWithSettings:networkActivityBlock:completionQueue:completion:", v15, v19, v18, v22);

  }
}

uint64_t __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(_QWORD *)(v3 + 184);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v4, 0);
}

- (id)_requestInfoForRequestKey:(void *)a3 storefrontID:(void *)a4 additionalChangeTags:(uint64_t)a5 feedType:(void *)a6 cachePolicy:
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  __CFString *v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  if (!a1)
  {
    v29 = 0;
    goto LABEL_40;
  }
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = v11;
  if ((objc_msgSend(v15, "isEqualToString:", CFSTR("appConfigRequest")) & 1) != 0)
  {
    v16 = CFSTR("appConfigurationWrapper");
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("widgetConfigRequest")) & 1) != 0)
  {
    v16 = CFSTR("widgetConfigurationWrapper");
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("magazinesConfigRequest")) & 1) != 0)
  {
    v16 = CFSTR("magazinesConfigurationWrapper");
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("todayConfigRequest")) & 1) != 0)
  {
    v16 = CFSTR("todayConfigWrapper");
  }
  else if ((objc_msgSend(v15, "isEqualToString:", CFSTR("audioConfigRequest")) & 1) != 0)
  {
    v16 = CFSTR("audioConfigWrapper");
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case not implemented"));
      *(_DWORD *)buf = 136315906;
      v35 = "-[FCConfigurationManager _responseKeyForRequestKey:]";
      v36 = 2080;
      v37 = "FCConfigurationManager.m";
      v38 = 1024;
      v39 = 1439;
      v40 = 2114;
      v41 = v31;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v16 = 0;
  }

  v17 = v16;
  v18 = v15;
  v19 = v14;
  v33 = v12;
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("appConfigRequest")))
  {
    objc_opt_self();
    v20 = v11;
    if (qword_1ED0F7ED0 != -1)
      dispatch_once(&qword_1ED0F7ED0, &__block_literal_global_144);
    v21 = (id)_MergedGlobals_147;
    if (objc_msgSend(v21, "length"))
    {
      v22 = v21;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("configuration-json"), v19);
      v22 = (id)objc_claimAutoreleasedReturnValue();
    }
    v24 = v22;
    goto LABEL_30;
  }
  if (objc_msgSend(v18, "isEqualToString:", CFSTR("magazinesConfigRequest")))
  {
    v20 = v11;
    objc_msgSend(a1, "possiblyUnfetchedAppConfiguration");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "magazinesConfigRecordID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");

LABEL_30:
    goto LABEL_31;
  }
  if ((objc_msgSend(v18, "isEqualToString:", CFSTR("widgetConfigRequest")) & 1) != 0
    || (objc_msgSend(v18, "isEqualToString:", CFSTR("todayConfigRequest")) & 1) != 0
    || (objc_msgSend(v18, "isEqualToString:", CFSTR("audioConfigRequest")) & 1) != 0
    || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v20 = v11;
  }
  else
  {
    v20 = v11;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Case not implemented"));
    *(_DWORD *)buf = 136315906;
    v35 = "-[FCConfigurationManager _recordIDForRequestKey:storefrontID:]";
    v36 = 2080;
    v37 = "FCConfigurationManager.m";
    v38 = 1024;
    v39 = 1529;
    v40 = 2114;
    v41 = v32;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v24 = 0;
LABEL_31:

  if (objc_msgSend(v24, "length"))
  {
    objc_msgSend(a1[5], "contentContainerIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    FCPermanentURLForRecordID(v24, 3, v25, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v26 = 0;
  }
  v11 = v20;

  if (a5 != 2)
    a5 = a5 == 1;
  v27 = objc_msgSend(v33, "cachePolicy");

  if (v27 == 1)
    objc_msgSend(MEMORY[0x1E0D86F38], "ignoreCachePolicy");
  else
    objc_msgSend(MEMORY[0x1E0D86F38], "defaultCachePolicy");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D86F70]), "initWithRequestKey:responseKey:fallbackURL:requestType:additionalChangeTags:requestFeedType:cachePolicy:", v18, v17, v26, v13 != 0, v13, a5, v28);

LABEL_40:
  return v29;
}

void __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_3(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[5];
  id v24;

  v7 = a2;
  v8 = a5;
  v9 = v8;
  if (!v7 || v8)
  {
    v19 = (void *)a1[5];
    v20 = a1[6];
    v21 = v19;
    v22 = v21;
    if (v21)
      (*((void (**)(id, _QWORD, void *))v21 + 2))(v21, 0, v9);
    (*(void (**)(uint64_t))(v20 + 16))(v20);

  }
  else
  {
    v10 = a1[4];
    if (v10)
      v11 = *(void **)(v10 + 96);
    else
      v11 = 0;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_5;
    v23[3] = &unk_1E463AD10;
    v23[4] = v10;
    v24 = v7;
    objc_msgSend(v11, "performWithLockSync:", v23);
    v16 = a1[5];
    if (v16)
    {
      v17 = a1[4];
      if (v17)
        v18 = *(_QWORD *)(v17 + 184);
      else
        v18 = 0;
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v16 + 16))(v16, v18, 0);
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(a1[6] + 16))(a1[6], v12, v13, v14, v15);

  }
}

void __149__FCConfigurationManager__fetchTodayFeedConfigurationIfNeededWithCompletionQueue_feedType_formatVersion_cachePolicy_networkActivityBlock_completion___block_invoke_5(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 184);
    v3 = *(void **)(a1 + 32);
  }
  -[FCConfigurationManager _saveConfigData:forRequestKey:]((uint64_t)v3, *(void **)(a1 + 40), (uint64_t)CFSTR("todayConfigRequest"));
}

- (NSData)audioFeedConfigData
{
  NFUnfairLock *accessLock;
  NFUnfairLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18;
  v12 = __Block_byref_object_dispose__18;
  v13 = 0;
  if (self)
    accessLock = self->_accessLock;
  else
    accessLock = 0;
  v4 = accessLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__FCConfigurationManager_audioFeedConfigData__block_invoke;
  v7[3] = &unk_1E463AD80;
  v7[4] = self;
  v7[5] = &v8;
  -[NFUnfairLock performWithLockSync:](v4, "performWithLockSync:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSData *)v5;
}

void __45__FCConfigurationManager_audioFeedConfigData__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 192), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)fetchAudioFeedConfigIfNeededWithCompletionQueue:(id)a3 formatVersion:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  FCAsyncSerialQueue *remoteAudioConfigSerialQueue;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;

  v8 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __99__FCConfigurationManager_fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke;
  v21 = &unk_1E463E5F0;
  v22 = v8;
  v23 = v9;
  v11 = v8;
  v12 = v9;
  v13 = v11;
  v14 = a4;
  v15 = &v18;
  v16 = v15;
  if (self)
  {
    remoteAudioConfigSerialQueue = self->_remoteAudioConfigSerialQueue;
    v24[0] = v10;
    v24[1] = 3221225472;
    v24[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke;
    v24[3] = &unk_1E463E640;
    v24[4] = self;
    v27 = v15;
    v25 = v13;
    v26 = v14;
    -[FCAsyncSerialQueue enqueueBlock:](remoteAudioConfigSerialQueue, "enqueueBlock:", v24, v18, v19, v20, v21, v22, v23);

  }
}

void __99__FCConfigurationManager_fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 40);
  if (v7)
  {
    v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __99__FCConfigurationManager_fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2;
    block[3] = &unk_1E463DC60;
    v12 = v7;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __99__FCConfigurationManager_fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  void (**v23)(_QWORD);
  _QWORD block[5];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 && *(_BYTE *)(v4 + 10))
  {
    v5 = *(void **)(a1 + 56);
    if (v5)
    {
      v6 = *(NSObject **)(a1 + 40);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2;
      block[3] = &unk_1E463B2D0;
      v7 = v5;
      block[4] = *(_QWORD *)(a1 + 32);
      v25 = v7;
      dispatch_async(v6, block);

    }
    v3[2](v3);
  }
  else
  {
    -[FCConfigurationManager _storefrontID](v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(id **)(a1 + 32);
    +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:cachePolicy:](v9, CFSTR("audioConfigRequest"), v8, 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = *(_QWORD *)(a1 + 32);
    v26[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD **)(a1 + 32);
    if (v14)
      v14 = (_QWORD *)v14[6];
    v15 = v14;
    objc_msgSend(v15, "feldsparID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v12, v13, v16, v8, 0, *(void **)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(void **)(v18 + 32);
    else
      v19 = 0;
    v20 = *(_QWORD *)(a1 + 40);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_3;
    v21[3] = &unk_1E463E668;
    v21[4] = v18;
    v22 = *(id *)(a1 + 56);
    v23 = v3;
    objc_msgSend(v19, "fetchSingleConfigurationWithSettings:completionQueue:completion:", v17, v20, v21);

  }
}

uint64_t __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    v4 = *(_QWORD *)(v3 + 192);
  else
    v4 = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16))(v2, v4, 0);
}

void __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[6];
  __int128 v23;

  v7 = a2;
  v8 = a5;
  v9 = v8;
  if (!v7 || v8)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4;
    v22[3] = &unk_1E463E618;
    v22[4] = *(_QWORD *)(a1 + 32);
    v22[5] = v8;
    v23 = *(_OWORD *)(a1 + 40);
    v19 = (id)v23;
    __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4(v22);

  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    if (v10)
      v11 = *(void **)(v10 + 96);
    else
      v11 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_5;
    v20[3] = &unk_1E463AD10;
    v20[4] = v10;
    v21 = v7;
    objc_msgSend(v11, "performWithLockSync:", v20);
    v16 = *(_QWORD *)(a1 + 40);
    if (v16)
    {
      v17 = *(_QWORD *)(a1 + 32);
      if (v17)
        v18 = *(_QWORD *)(v17 + 192);
      else
        v18 = 0;
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v16 + 16))(v16, v18, 0);
    }
    (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v12, v13, v14, v15);

  }
}

uint64_t __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = a1[4];
  if (!v2)
  {
    v4 = a1[6];
    if (!v4)
      return (*(uint64_t (**)(void))(a1[7] + 16))();
    v5 = 0;
    goto LABEL_6;
  }
  v3 = *(_QWORD *)(v2 + 192);
  v4 = a1[6];
  if (v3)
    v5 = v3;
  else
    v5 = 0;
  if (v4)
LABEL_6:
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, v5, a1[5]);
  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

void __100__FCConfigurationManager__fetchAudioFeedConfigIfNeededWithCompletionQueue_formatVersion_completion___block_invoke_5(uint64_t a1, const char *a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, a2, *(id *)(a1 + 40), 192);
    v3 = *(void **)(a1 + 32);
  }
  -[FCConfigurationManager _saveConfigData:forRequestKey:]((uint64_t)v3, *(void **)(a1 + 40), (uint64_t)CFSTR("audioConfigRequest"));
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_93(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  uint64_t v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!v9 || v12)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_94;
    v31[3] = &unk_1E463CCB8;
    v32 = *(id *)(a1 + 32);
    v33 = v12;
    v34 = *(_QWORD *)(a1 + 56);
    v23 = v32;
    __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_94(v31);
  }
  else
  {
    v14 = (void *)FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(void **)(a1 + 32);
      v16 = v14;
      *(_DWORD *)buf = 134217984;
      v36 = objc_msgSend(v15, "fc_millisecondTimeIntervalUntilNow");
      _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "did refresh app configuration, time=%llums", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "storefrontID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "deviceInfo");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferredLanguages");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[FCNewsAppConfig configurationWithData:storefrontID:preferredLanguageTags:]((uint64_t)FCNewsAppConfig, v9, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = *(_QWORD *)(a1 + 48);
      if (v21)
        v22 = *(void **)(v21 + 96);
      else
        v22 = 0;
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_96;
      v26[3] = &unk_1E463C840;
      v26[4] = v21;
      v27 = v10;
      v28 = v11;
      v23 = v20;
      v29 = v23;
      v30 = v9;
      objc_msgSend(v22, "performWithLockSync:", v26);
      v24 = *(_QWORD *)(a1 + 56);
      if (v24)
        (*(void (**)(uint64_t, _QWORD))(v24 + 16))(v24, 0);

    }
    else
    {
      v25 = *(_QWORD *)(a1 + 56);
      if (v25)
        (*(void (**)(uint64_t, _QWORD))(v25 + 16))(v25, 0);
      v23 = 0;
    }
  }

}

uint64_t __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_94(_QWORD *a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[4];
    v4 = v2;
    v5 = objc_msgSend(v3, "fc_millisecondTimeIntervalUntilNow");
    v6 = a1[5];
    v8 = 134218242;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_1A1B90000, v4, OS_LOG_TYPE_DEFAULT, "failed to refresh app configuration, time=%llums, error=%{public}@", (uint8_t *)&v8, 0x16u);

  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, a1[5]);
  return result;
}

void __93__FCConfigurationManager__refreshAppConfigurationWithConfigurationSettings_force_completion___block_invoke_2_96(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  id *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

  }
  else
  {
    v6 = 0;
  }

  v7 = *(id **)(a1 + 32);
  -[FCConfigurationManager currentAppConfiguration](v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 56);
  v10 = v8;
  v11 = v9;
  v12 = v11;
  if (v7)
  {
    if (objc_msgSend(v11, "checkForPaywallConfigChangesEnabled"))
    {
      objc_msgSend(v10, "paidBundleConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "paidBundleConfig");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v7) = objc_msgSend(v13, "arePaywallConfigsEqualToOtherPaidBundleConfig:", v14) ^ 1;

    }
    else
    {
      LODWORD(v7) = 0;
    }
  }

  v15 = *(id **)(a1 + 32);
  -[FCConfigurationManager currentAppConfiguration](v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v15 = (id *)MEMORY[0x1E0DE7910];
    v17 = *(id *)(a1 + 56);
    v18 = v16;
    objc_msgSend(v18, "engagementCohortsExpField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "engagementCohortsExpField");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v15) = objc_msgSend(v15, "nf_object:isEqualToObject:", v19, v20);

    v21 = (void *)MEMORY[0x1E0DE7910];
    objc_msgSend(v18, "conversionCohortsExpField");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "conversionCohortsExpField");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    LOBYTE(v17) = objc_msgSend(v21, "nf_object:isEqualToObject:", v22, v23);
    LOBYTE(v15) = v15 & v17 ^ 1;
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetHandle setRemoteURL:](*(_QWORD *)(a1 + 32), v24);

  v26 = *(void **)(a1 + 32);
  if (v26)
  {
    objc_setProperty_nonatomic_copy(v26, v25, *(id *)(a1 + 56), 16);
    v26 = *(void **)(a1 + 32);
  }
  objc_msgSend(v26, "setTreatmentIDs:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSegmentSetIDs:", *(_QWORD *)(a1 + 48));
  -[FCConfigurationManager _saveConfigData:forRequestKey:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 64), (uint64_t)CFSTR("appConfigRequest"));
  v27 = *(_QWORD *)(a1 + 32);
  if (v27)
    v28 = *(void **)(v27 + 160);
  else
    v28 = 0;
  v29 = v28;
  -[FCConfigurationManager lastModificationDate]((id *)v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKey:", v30, CFSTR("lastModificationDate"));

  v31 = *(_QWORD *)(a1 + 32);
  if (v31)
    v32 = *(void **)(v31 + 160);
  else
    v32 = 0;
  objc_msgSend(v32, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("treatmentIDs"));
  v33 = *(_QWORD *)(a1 + 32);
  if (v33)
    v34 = *(void **)(v33 + 160);
  else
    v34 = 0;
  objc_msgSend(v34, "setObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("segmentSetIDs"));
  -[FCConfigurationManager _configurationDidChangeSignificantConfigChange:paywallConfigDidChange:scienceExperimentFieldsDidChange:](*(id **)(a1 + 32), v6 == 0, (int)v7, (char)v15);
}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD *v28;
  unsigned int v29;
  _QWORD *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD aBlock[5];
  id v52;
  id v53;
  uint8_t buf[4];
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_2;
  aBlock[3] = &unk_1E463E7A8;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v42 = v3;
  v52 = v42;
  v53 = *(id *)(a1 + 56);
  v39 = _Block_copy(aBlock);
  -[FCConfigurationManager _storefrontID](*(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    v7 = *(void **)(v6 + 168);
  else
    v7 = 0;
  -[FCConfigurationManager _changeTagsInWidgetConfigurationDict:](v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1E0C9AA60];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = (void *)FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    v55 = v14;
    _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "configuration manager will include %lu cached changeTags in the widgetConfigRequest", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", v39);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(id **)(a1 + 32);
  +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:cachePolicy:](v16, CFSTR("widgetConfigRequest"), v5, v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *(void **)(a1 + 40);
  v49[0] = v4;
  v49[1] = 3221225472;
  v49[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_100;
  v49[3] = &unk_1E463E7D0;
  v20 = v18;
  v50 = v20;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v49);
  objc_msgSend(v15, "addObject:", v20);
  if (*(_BYTE *)(a1 + 64))
  {
    v21 = *(id **)(a1 + 32);
    +[FCCachePolicy defaultCachePolicy](FCCachePolicy, "defaultCachePolicy");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _requestInfoForRequestKey:storefrontID:additionalChangeTags:feedType:cachePolicy:](v21, CFSTR("todayConfigRequest"), v5, 0, 2, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "addObject:", v23);
  }
  else
  {
    v23 = 0;
  }
  v24 = *(_QWORD *)(a1 + 32);
  if (v24)
    v25 = *(void **)(v24 + 48);
  else
    v25 = 0;
  v26 = v25;
  objc_msgSend(v26, "feldsparID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = *(_QWORD **)(a1 + 32);
  v41 = v11;
  if (v28)
    v28 = (_QWORD *)v28[5];
  v29 = *(unsigned __int8 *)(a1 + 65);
  v30 = v28;
  -[FCConfigurationManager _configurationSettingsWithRequestInfos:feldsparID:storefrontID:contextConfiguration:useBackgroundRefreshRate:requestMode:formatVersion:](v24, v15, v27, v5, v29, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = *(_QWORD *)(a1 + 32);
  if (v32)
    v33 = *(void **)(v32 + 32);
  else
    v33 = 0;
  v34 = *(_QWORD *)(a1 + 48);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_2_102;
  v43[3] = &unk_1E463E7F8;
  v44 = v20;
  v45 = v23;
  v47 = v31;
  v48 = v40;
  v46 = v32;
  v35 = v31;
  v36 = v40;
  v37 = v23;
  v38 = v20;
  objc_msgSend(v33, "fetchMultiConfigurationWithSettings:completionQueue:completion:", v35, v34, v43);

}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_2(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__18;
  v18 = __Block_byref_object_dispose__18;
  v19 = 0;
  v10 = (_QWORD *)a1[4];
  if (v10)
    v10 = (_QWORD *)v10[12];
  v11 = v10;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3;
  v13[3] = &unk_1E463AD80;
  v13[4] = a1[4];
  v13[5] = &v14;
  objc_msgSend(v11, "performWithLockSync:", v13);

  (*(void (**)(void))(a1[5] + 16))();
  v12 = a1[6];
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id, id, id))(v12 + 16))(v12, v15[5], v7, v8, v9);
  _Block_object_dispose(&v14, 8);

}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 16));
}

- (id)_changeTagsInWidgetConfigurationDict:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("articles"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _changeTagsInRecords:](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("articleLists"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _changeTagsInRecords:](v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tags"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCConfigurationManager _changeTagsInRecords:](v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v16 = 134218496;
      v17 = objc_msgSend(v7, "count");
      v18 = 2048;
      v19 = objc_msgSend(v9, "count");
      v20 = 2048;
      v21 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_1A1B90000, v13, OS_LOG_TYPE_DEFAULT, "configuration manager received articleChangeTags: %lu articleListChangeTags: %lu tagChangeTags: %lu in the widgetConfigurationData", (uint8_t *)&v16, 0x20u);

    }
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_100(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forAdditionalField:", a3, a2);
}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_2_102(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  void *v44;
  void *v45;
  FCNewsAppConfig *v46;
  void *v47;
  _BYTE *v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  NSObject *log;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  _QWORD v69[5];
  id v70;
  id v71;
  _BYTE *v72;
  id v73;
  _QWORD v74[6];
  _QWORD v75[7];
  id v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  __int16 v81;
  uint64_t v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(*(id *)(a1 + 32), "requestCacheKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 40);
  if (v15)
  {
    objc_msgSend(v15, "requestCacheKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_8;
  }
  else
  {
    v17 = 0;
    if (v12)
    {
LABEL_8:
      v75[0] = MEMORY[0x1E0C809B0];
      v75[1] = 3221225472;
      v75[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3_103;
      v75[3] = &unk_1E463DB98;
      v21 = *(void **)(a1 + 64);
      v75[5] = v17;
      v75[6] = v21;
      v75[4] = v12;
      v22 = v21;
      v20 = v12;
      __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3_103(v75);
      goto LABEL_28;
    }
  }
  if (!v14)
    goto LABEL_8;
  v68 = v17;
  v18 = *(_QWORD *)(a1 + 48);
  v19 = v14;
  v67 = v14;
  if (v18)
  {
    v76 = 0;
    v65 = v19;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v19, 0, &v76);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = v76;
    if (v23)
    {
      v61 = v11;
      v62 = v10;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("widgetConfiguration"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("widgetConfiguration"));

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("singleTagConfiguration"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v25, CFSTR("singleTagConfiguration"));

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("widgetAppConfiguration"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("widgetAppConfiguration"));

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("articles"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v18 + 168), "objectForKeyedSubscript:", CFSTR("articles"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCConfigurationManager _mergeRecords:withCachedRecords:](v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("articles"));

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("articleLists"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v18 + 168), "objectForKeyedSubscript:", CFSTR("articleLists"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCConfigurationManager _mergeRecords:withCachedRecords:](v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v32, CFSTR("articleLists"));

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("tags"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v18 + 168), "objectForKeyedSubscript:", CFSTR("tags"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCConfigurationManager _mergeRecords:withCachedRecords:](v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v35, CFSTR("tags"));

      v36 = (void *)FCAppConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
      {
        log = v36;
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("articles"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("articleLists"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "count");
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("tags"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");
        *(_DWORD *)buf = 134218496;
        v78 = v38;
        v79 = 2048;
        v80 = v40;
        v81 = 2048;
        v82 = v42;
        _os_log_impl(&dword_1A1B90000, log, OS_LOG_TYPE_DEFAULT, "merged widget cached data articles: %lu articleLists: %lu tags: %lu", buf, 0x20u);

      }
      v11 = v61;
      v10 = v62;
    }
    else
    {
      v43 = FCAppConfigurationLog;
      if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v63;
        v78 = (uint64_t)v63;
        _os_log_impl(&dword_1A1B90000, v43, OS_LOG_TYPE_DEFAULT, "unable to parse the widget configuration data with error: %{public}@", buf, 0xCu);
        v20 = 0;
LABEL_17:

        v19 = v65;
        goto LABEL_18;
      }
      v20 = 0;
    }
    v44 = v63;
    goto LABEL_17;
  }
  v20 = 0;
LABEL_18:

  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("widgetAppConfiguration"));
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("widgetLanguageConfiguration"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = [FCNewsAppConfig alloc];
  objc_msgSend(*(id *)(a1 + 56), "storefrontID");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = -[FCNewsAppConfig initWithConfigDictionary:storefrontID:languageConfigDictionary:](v46, v22, v47, v45);

  if (v48)
  {
    v64 = v12;
    v66 = v9;
    v49 = v10;
    -[FCConfigurationManager _changeTagsInWidgetConfigurationDict:](*(_QWORD *)(a1 + 48), v20);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    v51 = (void *)FCAppConfigurationLog;
    if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_DEFAULT))
    {
      v52 = v51;
      v53 = objc_msgSend(v50, "count");
      *(_DWORD *)buf = 134217984;
      v78 = v53;
      _os_log_impl(&dword_1A1B90000, v52, OS_LOG_TYPE_DEFAULT, "configuration manager received and merged %lu total changeTags in the widgetConfigurationData", buf, 0xCu);

    }
    v54 = v11;
    v55 = *(_QWORD *)(a1 + 48);
    if (v55)
      v56 = *(void **)(v55 + 96);
    else
      v56 = 0;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_107;
    v69[3] = &unk_1E463C840;
    v69[4] = v55;
    v70 = v49;
    v71 = v54;
    v72 = v48;
    v57 = v20;
    v73 = v57;
    objc_msgSend(v56, "performWithLockSync:", v69);
    v58 = *(_QWORD *)(a1 + 64);
    if (v58)
      (*(void (**)(uint64_t, id, void *, _QWORD))(v58 + 16))(v58, v57, v68, 0);

    v10 = v49;
    v11 = v54;
    v12 = v64;
    v9 = v66;
  }
  else
  {
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_106;
    v74[3] = &unk_1E463B2D0;
    v59 = *(void **)(a1 + 64);
    v74[4] = v68;
    v74[5] = v59;
    v50 = v59;
    __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_106((uint64_t)v74);
  }

  v14 = v67;
  v17 = v68;
LABEL_28:

}

uint64_t __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_3_103(_QWORD *a1)
{
  NSObject *v2;
  uint64_t result;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    v4 = a1[4];
    v5 = 138412290;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "configuration manager received error: %@, returning cached configuration", (uint8_t *)&v5, 0xCu);
  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, a1[5], a1[4]);
  return result;
}

uint64_t __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_106(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  v2 = FCAppConfigurationLog;
  if (os_log_type_enabled((os_log_t)FCAppConfigurationLog, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "configuration manager received invalid appConfiguration, returning cached configuration", v4, 2u);
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 32), 0);
  return result;
}

void __132__FCConfigurationManager__fetchRemoteAppWidgetConfigurationIfNeededWithTodayLiteConfig_additionalFields_completionQueue_completion___block_invoke_107(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  void *v8;
  void *v9;
  id *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqual:", v3))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", *(_QWORD *)(a1 + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

  }
  else
  {
    v6 = 0;
  }

  v8 = *(void **)(a1 + 32);
  if (v8)
    objc_setProperty_nonatomic_copy(v8, v7, *(id *)(a1 + 56), 16);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCAssetHandle setRemoteURL:](*(_QWORD *)(a1 + 32), v9);

  objc_msgSend(*(id *)(a1 + 32), "setTreatmentIDs:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setSegmentSetIDs:", *(_QWORD *)(a1 + 48));
  v10 = *(id **)(a1 + 32);
  if (v10)
  {
    objc_storeStrong(v10 + 21, *(id *)(a1 + 64));
    v11 = *(_QWORD *)(a1 + 32);
    if (v11)
      v10 = *(id **)(v11 + 160);
    else
      v10 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v10;
  -[FCConfigurationManager lastModificationDate]((id *)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKey:", v13, CFSTR("lastModificationDate"));

  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    v15 = *(void **)(v14 + 160);
  else
    v15 = 0;
  objc_msgSend(v15, "setObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("treatmentIDs"));
  v16 = *(_QWORD *)(a1 + 32);
  if (v16)
    v17 = *(void **)(v16 + 160);
  else
    v17 = 0;
  objc_msgSend(v17, "setObject:forKey:", *(_QWORD *)(a1 + 48), CFSTR("segmentSetIDs"));
  if (*(_QWORD *)(a1 + 64))
  {
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
      v19 = *(void **)(v18 + 160);
    else
      v19 = 0;
    objc_msgSend(v19, "setObject:forKey:");
  }
  -[FCConfigurationManager _configurationDidChangeSignificantConfigChange:paywallConfigDidChange:scienceExperimentFieldsDidChange:](*(id **)(a1 + 32), v6 == 0, 0, 0);
}

- (id)_deviceInfoWithFormatVersion:(uint64_t)a3
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0D86F60];
  v6 = a1;
  objc_msgSend(v5, "defaultDeviceInfoWithAppVersion:formatVersion:seedNumber:buildNumber:", v6, a3, 0, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __76__FCConfigurationManager__logNetworkEvent_configurationSettings_isFallback___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "requestInfos", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "requestKey");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)feldsparIDProviderDidChangeFeldsparID:(id)a3
{
  -[FCConfigurationManager fetchAppConfigurationIfNeededWithCompletion:](self, "fetchAppConfigurationIfNeededWithCompletion:", 0);
}

- (void)activityObservingApplicationDidEnterBackground
{
  self->_applicationState = 2;
}

- (void)activityObservingApplicationWillEnterForeground
{
  self->_applicationState = 1;
}

uint64_t __55__FCConfigurationManager_internalOverrideSegmentSetIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

uint64_t __65__FCConfigurationManager_internalOverrideAdditionalSegmentSetIDs__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

- (id)_mergeRecords:(void *)a1 withCachedRecords:(void *)a2
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  id obj;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v25 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("id"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "allKeys");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12 < 4)
        {
          if (!v10 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("incomplete data in fetched record %@"), v8);
            *(_DWORD *)buf = 136315906;
            v31 = "-[FCConfigurationManager _mergeRecords:withCachedRecords:]";
            v32 = 2080;
            v33 = "FCConfigurationManager.m";
            v34 = 1024;
            v35 = 1647;
            v36 = 2114;
            v37 = v21;
            _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: IncompleteFetchedRecord) : %s %s:%d %{public}@", buf, 0x26u);

          }
          v13 = 0;
        }
        else
        {
          v13 = v8;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("changeTag"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("changeTag"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if (v16)
        {
          v17 = v10;

          objc_msgSend(v17, "allKeys");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19 <= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("incomplete data in cached record %@"), v17);
            *(_DWORD *)buf = 136315906;
            v31 = "-[FCConfigurationManager _mergeRecords:withCachedRecords:]";
            v32 = 2080;
            v33 = "FCConfigurationManager.m";
            v34 = 1024;
            v35 = 1654;
            v36 = 2114;
            v37 = v20;
            _os_log_fault_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "*** Assertion failure (Identifier: IncompleteCachedRecord) : %s %s:%d %{public}@", buf, 0x26u);

          }
        }
        else
        {
          v17 = v13;
        }
        if (v17)
          objc_msgSend(v24, "setObject:forKey:", v17, v9);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v5);
  }

  return v24;
}

- (id)_changeTagsInRecords:(void *)a1
{
  id v1;
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__FCConfigurationManager__changeTagsInRecords___block_invoke_2;
    v5[3] = &unk_1E463E1E0;
    v3 = v2;
    v6 = v3;
    objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v5);

  }
  else
  {
    v3 = (id)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

void __47__FCConfigurationManager__changeTagsInRecords___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0D86F40];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("changeTag"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("lastModified"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v6, "initWithIdentifier:contentHash:lastModifiedString:", v7, v8, v9);
  v10 = v11;
  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
    v10 = v11;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentSetIDs, 0);
  objc_storeStrong((id *)&self->_treatmentIDs, 0);
  objc_storeStrong((id *)&self->_coreConfigObservers, 0);
  objc_storeStrong((id *)&self->_appConfigObservers, 0);
  objc_storeStrong((id *)&self->_currentAudioFeedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentTodayFeedConfiguration, 0);
  objc_storeStrong((id *)&self->_currentMagazinesConfiguration, 0);
  objc_storeStrong((id *)&self->_cachedWidgetConfigurationDict, 0);
  objc_storeStrong((id *)&self->_localStore, 0);
  objc_storeStrong((id *)&self->_containerDirectory, 0);
  objc_storeStrong((id *)&self->_remoteAudioConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteMagazineConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteTodayConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteWidgetConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_remoteAppConfigSerialQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_networkBehaviorMonitor, 0);
  objc_storeStrong((id *)&self->_appActivityMonitor, 0);
  objc_storeStrong((id *)&self->_buildNumberString, 0);
  objc_storeStrong((id *)&self->_appShortVersionString, 0);
  objc_storeStrong((id *)&self->_feldsparIDProvider, 0);
  objc_storeStrong((id *)&self->_contextConfiguration, 0);
  objc_storeStrong((id *)&self->_remoteConfigurationManager, 0);
  objc_storeStrong((id *)&self->_lastModificationDate, 0);
  objc_storeStrong((id *)&self->_currentAppConfiguration, 0);
}

@end
