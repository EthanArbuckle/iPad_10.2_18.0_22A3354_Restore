@implementation CPApplicationLauncher

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sLauncher;
}

void __39__CPApplicationLauncher_sharedInstance__block_invoke()
{
  CPApplicationLauncher *v0;
  void *v1;

  v0 = objc_alloc_init(CPApplicationLauncher);
  v1 = (void *)sharedInstance_sLauncher;
  sharedInstance_sLauncher = (uint64_t)v0;

}

- (CPApplicationLauncher)init
{
  CPApplicationLauncher *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  NSMutableDictionary *v5;
  NSMutableDictionary *sessionIDtoAuthMap;
  NSMutableDictionary *v7;
  NSMutableDictionary *sessionIDtoCompletionMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *bundleIDToAssertionMap;
  CPFeatureFlags *v11;
  CPFeatureFlags *featureFlags;
  CPApplicationLauncherSwift *v13;
  CPApplicationLauncherSwift *newApplicationLauncher;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CPApplicationLauncher;
  v2 = -[CPApplicationLauncher init](&v16, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.copresence.applauncher", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionIDtoAuthMap = v2->_sessionIDtoAuthMap;
    v2->_sessionIDtoAuthMap = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionIDtoCompletionMap = v2->_sessionIDtoCompletionMap;
    v2->_sessionIDtoCompletionMap = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    bundleIDToAssertionMap = v2->_bundleIDToAssertionMap;
    v2->_bundleIDToAssertionMap = v9;

    v11 = objc_alloc_init(CPFeatureFlags);
    featureFlags = v2->_featureFlags;
    v2->_featureFlags = v11;

    v13 = objc_alloc_init(CPApplicationLauncherSwift);
    newApplicationLauncher = v2->_newApplicationLauncher;
    v2->_newApplicationLauncher = v13;

  }
  return v2;
}

- (NSString)placementSceneIdentifier
{
  void *v3;
  int v4;
  void *v5;

  -[CPApplicationLauncher featureFlags](self, "featureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "newApplicationLauncherEnabled");

  if (v4)
  {
    -[CPApplicationLauncherSwift placementSceneIdentifier](self->_newApplicationLauncher, "placementSceneIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (void)setPlacementSceneIdentifier:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[CPApplicationLauncher featureFlags](self, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "newApplicationLauncherEnabled");

  if (v5)
    -[CPApplicationLauncherSwift setPlacementSceneIdentifier:](self->_newApplicationLauncher, "setPlacementSceneIdentifier:", v6);

}

- (void)launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[CPApplicationLauncher featureFlags](self, "featureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "newApplicationLauncherEnabled");

  if (v11)
  {
    -[CPApplicationLauncherSwift launchAppForActivitySession:options:completion:](self->_newApplicationLauncher, "launchAppForActivitySession:options:completion:", v8, a4, v9);
  }
  else
  {
    -[CPApplicationLauncher workQueue](self, "workQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__CPApplicationLauncher_launchAppForActivitySession_options_completion___block_invoke;
    v13[3] = &unk_1E5C80DA0;
    v13[4] = self;
    v14 = v8;
    v16 = a4;
    v15 = v9;
    dispatch_async(v12, v13);

  }
}

uint64_t __72__CPApplicationLauncher_launchAppForActivitySession_options_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchAppForActivitySession:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

- (void)revokeBackgroundAuthorizationForBundleID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  CPApplicationLauncher *v10;

  v4 = a3;
  -[CPApplicationLauncher featureFlags](self, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "newApplicationLauncherEnabled");

  if (v6)
  {
    -[CPApplicationLauncherSwift revokeBackgroundAuthorizationForBundleID:](self->_newApplicationLauncher, "revokeBackgroundAuthorizationForBundleID:", v4);
  }
  else
  {
    -[CPApplicationLauncher workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__CPApplicationLauncher_revokeBackgroundAuthorizationForBundleID___block_invoke;
    v8[3] = &unk_1E5C80DC8;
    v9 = v4;
    v10 = self;
    dispatch_async(v7, v8);

  }
}

void __66__CPApplicationLauncher_revokeBackgroundAuthorizationForBundleID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v15;
  const char *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  CPDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v15 = 136315394;
      v16 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForBundleID:]_block_invoke";
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_1ACCCC000, v4, OS_LOG_TYPE_INFO, "%s Request to remove pip authorizations for %@", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_authorizationsForBundleID:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v4, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_revokeAuthorizations:", v4);
    }
    else
    {
      CPDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v15 = 136315394;
        v16 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForBundleID:]_block_invoke";
        v17 = 2112;
        v18 = v14;
        _os_log_impl(&dword_1ACCCC000, v13, OS_LOG_TYPE_INFO, "%s [PiP] No existing background pip authorizations to remove for %@", (uint8_t *)&v15, 0x16u);
      }

    }
    objc_msgSend(*(id *)(a1 + 40), "_invalidateBKSAssertionForBundleID:", *(_QWORD *)(a1 + 32));
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    __66__CPApplicationLauncher_revokeBackgroundAuthorizationForBundleID___block_invoke_cold_1(v4, v6, v7, v8, v9, v10, v11, v12);
  }

}

- (void)revokeBackgroundAuthorizationForSession:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  CPApplicationLauncher *v10;

  v4 = a3;
  -[CPApplicationLauncher featureFlags](self, "featureFlags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "newApplicationLauncherEnabled");

  if (v6)
  {
    -[CPApplicationLauncherSwift revokeBackgroundAuthorizationForSession:](self->_newApplicationLauncher, "revokeBackgroundAuthorizationForSession:", v4);
  }
  else
  {
    -[CPApplicationLauncher workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __65__CPApplicationLauncher_revokeBackgroundAuthorizationForSession___block_invoke;
    v8[3] = &unk_1E5C80DC8;
    v9 = v4;
    v10 = self;
    dispatch_async(v7, v8);

  }
}

void __65__CPApplicationLauncher_revokeBackgroundAuthorizationForSession___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CPDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v14 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForSession:]_block_invoke";
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1ACCCC000, v2, OS_LOG_TYPE_INFO, "%s Request to remove pip authorizations for %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_authorizationForActivitySession:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v6 = *(void **)(a1 + 40);
    v12 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_revokeAuthorizations:", v7);
  }
  else
  {
    CPDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 136315394;
      v14 = "-[CPApplicationLauncher revokeBackgroundAuthorizationForSession:]_block_invoke";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1ACCCC000, v7, OS_LOG_TYPE_INFO, "%s No pip authorizations found for %@", buf, 0x16u);
    }
  }

  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "activity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_invalidateBKSAssertionForBundleID:", v11);

}

- (void)_launchAppForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *, unint64_t);
  void *v24;
  CPApplicationLauncher *v25;
  id v26;

  v8 = a3;
  v9 = a5;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  if ((a4 & 1) == 0)
    goto LABEL_4;
  objc_msgSend(v8, "activity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "metadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "typedIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DBD5C0]);

  if (v15)
  {
    -[CPApplicationLauncher _sessionIDForActivity:](self, "_sessionIDForActivity:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0D6C9B0]);
    objc_msgSend(v8, "activity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __73__CPApplicationLauncher__launchAppForActivitySession_options_completion___block_invoke;
    v24 = &unk_1E5C80E18;
    v25 = self;
    v26 = v8;
    v20 = (void *)objc_msgSend(v17, "initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:", v16, v19, &v21);

    -[CPApplicationLauncher _insertAuth:completion:forSessionID:](self, "_insertAuth:completion:forSessionID:", v20, v9, v16, v21, v22, v23, v24, v25);
  }
  else
  {
LABEL_4:
    -[CPApplicationLauncher _launchAndAcquireAssertionIfNecessaryForActivitySession:options:completion:](self, "_launchAndAcquireAssertionIfNecessaryForActivitySession:options:completion:", v8, a4, v9);
  }

}

void __73__CPApplicationLauncher__launchAppForActivitySession_options_completion___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  unint64_t v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  CPDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3 > 5)
      v7 = CFSTR("Unknown state");
    else
      v7 = off_1E5C80F28[a3];
    objc_msgSend(v5, "activitySessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v17 = "-[CPApplicationLauncher _launchAppForActivitySession:options:completion:]_block_invoke";
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    _os_log_impl(&dword_1ACCCC000, v6, OS_LOG_TYPE_INFO, "%s Got PGBackgroundPIPAuthorization authorization transitioned to state %@ for session id %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__CPApplicationLauncher__launchAppForActivitySession_options_completion___block_invoke_63;
  v12[3] = &unk_1E5C80DF0;
  v10 = *(void **)(a1 + 40);
  v12[4] = *(_QWORD *)(a1 + 32);
  v13 = v5;
  v14 = v10;
  v15 = a3;
  v11 = v5;
  dispatch_async(v9, v12);

}

uint64_t __73__CPApplicationLauncher__launchAppForActivitySession_options_completion___block_invoke_63(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStateTransitionForAuthorization:activitySession:state:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_launchApplicationForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;

  v8 = a5;
  v9 = a3;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  objc_msgSend(v9, "activity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "representativeBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CPApplicationLauncher _openApplicationOptionsForActivitySession:options:](self, "_openApplicationOptionsForActivitySession:options:", v9, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke;
  v17[3] = &unk_1E5C80E68;
  v17[4] = self;
  v18 = v12;
  v19 = v8;
  v15 = v8;
  v16 = v12;
  objc_msgSend(v14, "openApplication:withOptions:completion:", v16, v13, v17);

}

void __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke_2;
  v11[3] = &unk_1E5C80E40;
  v12 = v5;
  v13 = a1[5];
  v8 = a1[6];
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  CPDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = a1[5];
      v9 = 136315394;
      v10 = "-[CPApplicationLauncher _launchApplicationForActivitySession:options:completion:]_block_invoke_2";
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_1ACCCC000, v4, OS_LOG_TYPE_INFO, "%s Successfully launched application with bundle identifier %@", (uint8_t *)&v9, 0x16u);
    }

    v6 = *(uint64_t (**)(void))(a1[7] + 16);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke_2_cold_1((uint64_t)a1, v4, v7);

    v6 = *(uint64_t (**)(void))(a1[7] + 16);
  }
  return v6();
}

- (id)_openApplicationOptionsForActivitySession:(id)a3 options:(int64_t)a4
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D00]);
  }
  else
  {
    TUUnlockDeviceWithPromptFrontBoardOptionsDictionary();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v7);

  }
  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_launchAndAcquireAssertionIfNecessaryForActivitySession:(id)a3 options:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a3;
  v9 = a5;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__CPApplicationLauncher__launchAndAcquireAssertionIfNecessaryForActivitySession_options_completion___block_invoke;
  v13[3] = &unk_1E5C80E90;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  -[CPApplicationLauncher _launchApplicationForActivitySession:options:completion:](self, "_launchApplicationForActivitySession:options:completion:", v12, a4, v13);

}

void __100__CPApplicationLauncher__launchAndAcquireAssertionIfNecessaryForActivitySession_options_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  id v14;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v14 = v5;
    if ((*(_BYTE *)(a1 + 56) & 1) == 0)
      goto LABEL_4;
    v7 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "activity", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v7) = objc_msgSend(v7, "_acquireAssertionForBundleID:", v9);

    v6 = v14;
    if ((v7 & 1) == 0)
    {
      v13 = *(_QWORD *)(a1 + 48);
      if (v13)
      {
        v11 = *(void (**)(void))(v13 + 16);
        goto LABEL_10;
      }
    }
    else
    {
LABEL_4:
      v10 = *(_QWORD *)(a1 + 48);
      if (v10)
      {
        v11 = *(void (**)(void))(v10 + 16);
LABEL_10:
        v11();
        v6 = v14;
      }
    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 48);
    if (v12)
    {
      v11 = *(void (**)(void))(v12 + 16);
      v14 = v6;
      goto LABEL_10;
    }
  }

}

- (id)_sessionIDForActivity:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_sessionIDForAuthorization:(id)a3
{
  return (id)objc_msgSend(a3, "activitySessionIdentifier");
}

- (void)_invokeAndDequeueCompletionForSessionID:(id)a3 success:(BOOL)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[CPApplicationLauncher sessionIDtoCompletionMap](self, "sessionIDtoCompletionMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    CPDefaultLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v15 = 136315650;
      v16 = "-[CPApplicationLauncher _invokeAndDequeueCompletionForSessionID:success:error:]";
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1ACCCC000, v13, OS_LOG_TYPE_INFO, "%s Invoking completion for %@ error %@", (uint8_t *)&v15, 0x20u);
    }

    ((void (**)(_QWORD, _BOOL8, id))v12)[2](v12, v6, v9);
    -[CPApplicationLauncher sessionIDtoCompletionMap](self, "sessionIDtoCompletionMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v8);

  }
}

- (void)_insertBKSAssertion:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (v6 && objc_msgSend(v7, "length"))
  {
    -[CPApplicationLauncher bundleIDToAssertionMap](self, "bundleIDToAssertionMap");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v6, v7);
  }
  else
  {
    CPDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CPApplicationLauncher _insertBKSAssertion:forBundleID:].cold.1();
  }

}

- (void)_invalidateBKSAssertionForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (objc_msgSend(v4, "length"))
  {
    -[CPApplicationLauncher bundleIDToAssertionMap](self, "bundleIDToAssertionMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    CPDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
    if (v7)
    {
      if (v9)
      {
        v17 = 136315394;
        v18 = "-[CPApplicationLauncher _invalidateBKSAssertionForBundleID:]";
        v19 = 2112;
        v20 = v4;
        _os_log_impl(&dword_1ACCCC000, v8, OS_LOG_TYPE_INFO, "%s Removing process assertion for %@", (uint8_t *)&v17, 0x16u);
      }

      -[NSObject invalidate](v7, "invalidate");
      -[CPApplicationLauncher bundleIDToAssertionMap](self, "bundleIDToAssertionMap");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v8, "removeObjectForKey:", v4);
    }
    else if (v9)
    {
      v17 = 136315394;
      v18 = "-[CPApplicationLauncher _invalidateBKSAssertionForBundleID:]";
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1ACCCC000, v8, OS_LOG_TYPE_INFO, "%s No existing process assertion for %@", (uint8_t *)&v17, 0x16u);
    }

  }
  else
  {
    CPDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CPApplicationLauncher _invalidateBKSAssertionForBundleID:].cold.1(v7, v10, v11, v12, v13, v14, v15, v16);
  }

}

- (BOOL)_acquireAssertionForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[CPProcessAssertion processAssertionWithBundleIdentifier:](CPProcessAssertion, "processAssertionWithBundleIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "acquire");
  if (v7)
  {
    -[CPApplicationLauncher _insertBKSAssertion:forBundleID:](self, "_insertBKSAssertion:forBundleID:", v6, v4);
    CPDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 136315394;
      v11 = "-[CPApplicationLauncher _acquireAssertionForBundleID:]";
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1ACCCC000, v8, OS_LOG_TYPE_INFO, "%s Acquired assertion for %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    CPDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CPApplicationLauncher _acquireAssertionForBundleID:].cold.1();
  }

  return v7;
}

- (void)_validatePiPStartedFor:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "state");
  CPDefaultLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11 == 3)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 136315394;
      v15 = "-[CPApplicationLauncher _validatePiPStartedFor:bundleID:]";
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1ACCCC000, v13, OS_LOG_TYPE_INFO, "%s [PiP] %@ started pip successfully", (uint8_t *)&v14, 0x16u);
    }

    -[CPApplicationLauncher _invokeAndDequeueCompletionForSessionID:success:error:](self, "_invokeAndDequeueCompletionForSessionID:success:error:", v6, 1, 0);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CPApplicationLauncher _validatePiPStartedFor:bundleID:].cold.1();

    -[CPApplicationLauncher _invalidateBKSAssertionForBundleID:](self, "_invalidateBKSAssertionForBundleID:", v7);
    -[CPApplicationLauncher _revokeAndRemoveAuthForSessionID:](self, "_revokeAndRemoveAuthForSessionID:", v6);
  }

}

- (void)_handleStateTransitionForAuthorization:(id)a3 activitySession:(id)a4 state:(int64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  switch(a5)
  {
    case 0:
    case 1:
      break;
    case 2:
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __86__CPApplicationLauncher__handleStateTransitionForAuthorization_activitySession_state___block_invoke;
      v14[3] = &unk_1E5C80EB8;
      v14[4] = self;
      v15 = v8;
      -[CPApplicationLauncher _launchAndAcquireAssertionIfNecessaryForActivitySession:options:completion:](self, "_launchAndAcquireAssertionIfNecessaryForActivitySession:options:completion:", v9, 1, v14);

      break;
    case 3:
      objc_msgSend(v8, "activitySessionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPApplicationLauncher _invokeAndDequeueCompletionForSessionID:success:error:](self, "_invokeAndDequeueCompletionForSessionID:success:error:", v11, 1, 0);
      goto LABEL_8;
    case 4:
    case 5:
      objc_msgSend(v8, "activitySessionIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPApplicationLauncher _revokeAndRemoveAuthForSessionID:](self, "_revokeAndRemoveAuthForSessionID:", v11);
LABEL_8:

      break;
    default:
      CPDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v17 = "-[CPApplicationLauncher _handleStateTransitionForAuthorization:activitySession:state:]";
        v18 = 2112;
        v19 = v8;
        v20 = 2112;
        v21 = v13;
        _os_log_impl(&dword_1ACCCC000, v12, OS_LOG_TYPE_INFO, "%s [PiP] Got unexpected auth state %@ for authorization %@", buf, 0x20u);

      }
      break;
  }

}

void __86__CPApplicationLauncher__handleStateTransitionForAuthorization_activitySession_state___block_invoke(uint64_t a1, int a2)
{
  dispatch_time_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;

  if (a2)
  {
    v3 = dispatch_time(0, 10000000000);
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__CPApplicationLauncher__handleStateTransitionForAuthorization_activitySession_state___block_invoke_2;
    block[3] = &unk_1E5C80DC8;
    v5 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v10 = v5;
    dispatch_after(v3, v4, block);

  }
  else
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "activitySessionIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    +[CPError errorWithCode:](CPError, "errorWithCode:", 22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_invokeAndDequeueCompletionForSessionID:success:error:", v8, 0, v7);

  }
}

void __86__CPApplicationLauncher__handleStateTransitionForAuthorization_activitySession_state___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activitySessionIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_validatePiPStartedFor:bundleID:", v4, v3);

}

- (void)_revokeAndRemoveAuthForSessionID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    CPDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v11 = 136315650;
      v12 = "-[CPApplicationLauncher _revokeAndRemoveAuthForSessionID:]";
      v13 = 2112;
      v14 = v7;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1ACCCC000, v8, OS_LOG_TYPE_INFO, "%s [PiP] Revoking and removing auth %@ sessionID %@", (uint8_t *)&v11, 0x20u);
    }

    objc_msgSend(v7, "revoke");
    -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v4);

  }
  +[CPError errorWithCode:](CPError, "errorWithCode:", 23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPApplicationLauncher _invokeAndDequeueCompletionForSessionID:success:error:](self, "_invokeAndDequeueCompletionForSessionID:success:error:", v4, 0, v10);

}

- (void)_insertAuth:(id)a3 completion:(id)a4 forSessionID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    CPDefaultLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v18 = 136315650;
      v19 = "-[CPApplicationLauncher _insertAuth:completion:forSessionID:]";
      v20 = 2112;
      v21 = v13;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1ACCCC000, v14, OS_LOG_TYPE_INFO, "%s [PiP] Revoking and removing auth %@ sessionID %@", (uint8_t *)&v18, 0x20u);
    }

    objc_msgSend(v13, "revoke");
  }
  -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v10, v9);

  if (v8)
  {
    v16 = _Block_copy(v8);
    -[CPApplicationLauncher sessionIDtoCompletionMap](self, "sessionIDtoCompletionMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v9);

  }
}

- (BOOL)_sessionAlreadyAuthorizingOrAuthorizedForPiP:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (unint64_t)(objc_msgSend(v7, "state") - 1) < 3;
  else
    v8 = 0;

  return v8;
}

- (void)_authorizePiPForActivity:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, BOOL, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, unint64_t);
  void *v25;
  CPApplicationLauncher *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, BOOL, _QWORD))a4;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[CPApplicationLauncher _sessionIDForActivity:](self, "_sessionIDForActivity:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CPApplicationLauncher _sessionAlreadyAuthorizingOrAuthorizedForPiP:](self, "_sessionAlreadyAuthorizingOrAuthorizedForPiP:", v9))
  {
    v7[2](v7, v9 != 0, 0);
  }
  else
  {
    objc_msgSend(v6, "activity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "context");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "typedIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("CPGroupActivityWatchTogetherContext"));

    if (v14)
    {
      CPDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v29 = "-[CPApplicationLauncher _authorizePiPForActivity:withCompletion:]";
        v30 = 2112;
        v31 = v6;
        _os_log_impl(&dword_1ACCCC000, v15, OS_LOG_TYPE_INFO, "%s [PiP] Requesting PiP auth for activity session %@", buf, 0x16u);
      }

      v16 = objc_alloc(MEMORY[0x1E0D6C9B0]);
      objc_msgSend(v6, "activity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MEMORY[0x1E0C809B0];
      v23 = 3221225472;
      v24 = __65__CPApplicationLauncher__authorizePiPForActivity_withCompletion___block_invoke;
      v25 = &unk_1E5C80E18;
      v26 = self;
      v19 = v9;
      v27 = v19;
      v20 = (void *)objc_msgSend(v16, "initWithActivitySessionIdentifier:appBundleIdentifier:stateTransitionHandler:", v19, v18, &v22);

      -[CPApplicationLauncher _insertAuth:completion:forSessionID:](self, "_insertAuth:completion:forSessionID:", v20, v7, v19, v22, v23, v24, v25, v26);
    }
    else
    {
      +[CPError errorWithCode:](CPError, "errorWithCode:", 23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, BOOL, void *))v7)[2](v7, 0, v21);

    }
  }

}

void __65__CPApplicationLauncher__authorizePiPForActivity_withCompletion___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  id v13;
  unint64_t v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  CPDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (a3 > 5)
      v7 = CFSTR("Unknown state");
    else
      v7 = off_1E5C80F28[a3];
    objc_msgSend(v5, "activitySessionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v16 = "-[CPApplicationLauncher _authorizePiPForActivity:withCompletion:]_block_invoke";
    v17 = 2112;
    v18 = v7;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1ACCCC000, v6, OS_LOG_TYPE_INFO, "%s [PiP] PGBackgroundPIPAuthorization authorization transitioned to state %@ for sessionID %@", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__CPApplicationLauncher__authorizePiPForActivity_withCompletion___block_invoke_74;
  block[3] = &unk_1E5C80EE0;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(a1 + 40);
  v14 = a3;
  block[4] = v10;
  v13 = v11;
  dispatch_async(v9, block);

}

void __65__CPApplicationLauncher__authorizePiPForActivity_withCompletion___block_invoke_74(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  if ((unint64_t)(v2 - 4) >= 2)
  {
    if (v2 == 2)
      objc_msgSend(*(id *)(a1 + 32), "_invokeAndDequeueCompletionForSessionID:success:error:", *(_QWORD *)(a1 + 40), 1, 0);
  }
  else
  {
    +[CPError errorWithCode:](CPError, "errorWithCode:", 23);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_invokeAndDequeueCompletionForSessionID:success:error:", *(_QWORD *)(a1 + 40), 0, v3);

  }
}

- (void)authorizePiPForActivity:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CPApplicationLauncher featureFlags](self, "featureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "newApplicationLauncherEnabled");

  if (v9)
  {
    -[CPApplicationLauncherSwift authorizePiPForActivitySession:completion:](self->_newApplicationLauncher, "authorizePiPForActivitySession:completion:", v6, v7);
  }
  else
  {
    -[CPApplicationLauncher workQueue](self, "workQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__CPApplicationLauncher_authorizePiPForActivity_withCompletion___block_invoke;
    block[3] = &unk_1E5C80F08;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(v10, block);

  }
}

uint64_t __64__CPApplicationLauncher_authorizePiPForActivity_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_authorizePiPForActivity:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_authorizationsForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CPApplicationLauncher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "appBundleIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if (v15)
          objc_msgSend(v6, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v16 = (void *)objc_msgSend(v6, "copy");
  return v16;
}

- (id)_authorizationForActivitySession:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[CPApplicationLauncher _sessionIDForActivity:](self, "_sessionIDForActivity:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_revokeAuthorizations:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          CPDefaultLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v10, "activitySessionIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v20 = "-[CPApplicationLauncher _revokeAuthorizations:]";
            v21 = 2112;
            v22 = v10;
            v23 = 2112;
            v24 = v12;
            _os_log_impl(&dword_1ACCCC000, v11, OS_LOG_TYPE_INFO, "%s [PiP] Revoking and removing auth %@ sessionID %@", buf, 0x20u);

          }
          objc_msgSend(v10, "revoke");
          -[CPApplicationLauncher sessionIDtoAuthMap](self, "sessionIDtoAuthMap");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[CPApplicationLauncher _sessionIDForAuthorization:](self, "_sessionIDForAuthorization:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "removeObjectForKey:", v14);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v25, 16);
      }
      while (v7);
    }

  }
}

- (NSMutableDictionary)sessionIDtoAuthMap
{
  return self->_sessionIDtoAuthMap;
}

- (void)setSessionIDtoAuthMap:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIDtoAuthMap, a3);
}

- (NSMutableDictionary)sessionIDtoCompletionMap
{
  return self->_sessionIDtoCompletionMap;
}

- (void)setSessionIDtoCompletionMap:(id)a3
{
  objc_storeStrong((id *)&self->_sessionIDtoCompletionMap, a3);
}

- (NSMutableDictionary)bundleIDToAssertionMap
{
  return self->_bundleIDToAssertionMap;
}

- (void)setBundleIDToAssertionMap:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIDToAssertionMap, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (CPFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_bundleIDToAssertionMap, 0);
  objc_storeStrong((id *)&self->_sessionIDtoCompletionMap, 0);
  objc_storeStrong((id *)&self->_sessionIDtoAuthMap, 0);
  objc_storeStrong((id *)&self->_newApplicationLauncher, 0);
}

void __66__CPApplicationLauncher_revokeBackgroundAuthorizationForBundleID___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1ACCCC000, a1, a3, "%s Invalid input trying to revoke app background pip authorization", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __81__CPApplicationLauncher__launchApplicationForActivitySession_options_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 136315650;
  v6 = "-[CPApplicationLauncher _launchApplicationForActivitySession:options:completion:]_block_invoke";
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  OUTLINED_FUNCTION_4(&dword_1ACCCC000, a2, a3, "%s Attempt to open application with bundle identifier %@ failed with error %@", (uint8_t *)&v5);
}

- (void)_insertBKSAssertion:forBundleID:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  NSObject *v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_1();
  v4 = v0;
  v5 = v1;
  OUTLINED_FUNCTION_4(&dword_1ACCCC000, v2, (uint64_t)v2, "%s Error inserting assertion %@ for bundleID %@", (uint8_t *)v3);
}

- (void)_invalidateBKSAssertionForBundleID:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_1ACCCC000, a1, a3, "%s Invalid bundle id passed into to remove BKS assertion", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_acquireAssertionForBundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ACCCC000, v0, v1, "%s Failed to acquire assertion for %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_validatePiPStartedFor:bundleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1ACCCC000, v0, v1, "%s [PiP] %@ failed to start pip", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
