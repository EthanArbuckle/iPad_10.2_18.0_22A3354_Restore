@implementation CSPostBuildInstallService

- (void)registerPostBuildInstallService
{
  NSObject *v3;
  xpc_object_t v4;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[CSPostBuildInstallService registerPostBuildInstallService]";
    v8 = 2080;
    v9 = "com.apple.cs.postinstall";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Registering for post build install/first unlock activity - %s", buf, 0x16u);
  }
  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, (const char *)*MEMORY[0x1E0C808B8], 1);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __60__CSPostBuildInstallService_registerPostBuildInstallService__block_invoke;
  handler[3] = &unk_1E7C27AD0;
  handler[4] = self;
  xpc_activity_register("com.apple.cs.postinstall", v4, handler);

}

- (void)_performPostBuildInstallWithCompletion:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD *v8;
  _QWORD v9[5];
  id v10;

  v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__14762;
  v9[4] = __Block_byref_object_dispose__14763;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0DA8C28], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__CSPostBuildInstallService__performPostBuildInstallWithCompletion___block_invoke;
  v6[3] = &unk_1E7C26748;
  v8 = v9;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "triggerVoiceProfileCleanupWithCompletion:", v6);

  _Block_object_dispose(v9, 8);
}

void __68__CSPostBuildInstallService__performPostBuildInstallWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v5)
  {
    v6 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v8 = 136315394;
      v9 = "-[CSPostBuildInstallService _performPostBuildInstallWithCompletion:]_block_invoke";
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1C2614000, v6, OS_LOG_TYPE_ERROR, "%s ERR: Failed SSR post build install chores with error %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

}

void __60__CSPostBuildInstallService_registerPostBuildInstallService__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  int v8;
  _BOOL4 v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  NSObject *v18;
  _xpc_activity_s *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  _xpc_activity_s *v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  _xpc_activity_s *v31;
  __int16 v32;
  xpc_activity_state_t v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  v5 = (os_log_t *)MEMORY[0x1E0D18F60];
  v6 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v29 = "-[CSPostBuildInstallService registerPostBuildInstallService]_block_invoke";
    v30 = 2112;
    v31 = v3;
    v32 = 2048;
    v33 = state;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Received event for XPC activity: %@ in state: %ld", buf, 0x20u);
  }
  objc_msgSend(MEMORY[0x1E0D19128], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFirstUnlocked");

  if (xpc_activity_should_defer(v3) || (v8 & 1) == 0 && CSIsIOS())
  {
    v9 = xpc_activity_set_state(v3, 3);
    v10 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("No");
      v29 = "-[CSPostBuildInstallService registerPostBuildInstallService]_block_invoke";
      *(_DWORD *)buf = 136315906;
      if (v9)
        v12 = CFSTR("Yes");
      else
        v12 = CFSTR("No");
      v30 = 2112;
      v31 = v3;
      v32 = 2112;
      if (v8)
        v11 = CFSTR("Yes");
      v33 = (xpc_activity_state_t)v12;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_1C2614000, v10, OS_LOG_TYPE_DEFAULT, "%s XPC activity: %@ deferred: %@ firstUnlock: %@", buf, 0x2Au);
    }
    goto LABEL_28;
  }
  v13 = *v5;
  v14 = os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT);
  if (state == 2)
  {
    if (v14)
    {
      *(_DWORD *)buf = 136315138;
      v29 = "-[CSPostBuildInstallService registerPostBuildInstallService]_block_invoke";
      _os_log_impl(&dword_1C2614000, v13, OS_LOG_TYPE_DEFAULT, "%s Registered XPC activity got triggered...", buf, 0xCu);
    }
    if (CSIsTV())
    {
      v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[CSPostBuildInstallService registerPostBuildInstallService]_block_invoke";
        v16 = "%s Skipping post build activity on ATV";
LABEL_26:
        _os_log_impl(&dword_1C2614000, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
        goto LABEL_27;
      }
      goto LABEL_27;
    }
    objc_msgSend(MEMORY[0x1E0D19280], "sharedInstance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEnabled");

    if ((v21 & 1) == 0)
    {
      v15 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v29 = "-[CSPostBuildInstallService registerPostBuildInstallService]_block_invoke";
        v16 = "%s VT is disabled, skipping post build activity !";
        goto LABEL_26;
      }
LABEL_27:
      xpc_activity_set_state(v3, 5);
      goto LABEL_28;
    }
    if (xpc_activity_set_state(v3, 4))
    {
      v22 = (void *)os_transaction_create();
      v23 = *(void **)(a1 + 32);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __60__CSPostBuildInstallService_registerPostBuildInstallService__block_invoke_8;
      v25[3] = &unk_1E7C282A8;
      v26 = v3;
      v27 = v22;
      v24 = v22;
      objc_msgSend(v23, "_performPostBuildInstallWithCompletion:", v25);

    }
  }
  else if (v14)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    v18 = v13;
    objc_msgSend(v17, "numberWithLong:", state);
    v19 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v29 = "-[CSPostBuildInstallService registerPostBuildInstallService]_block_invoke";
    v30 = 2112;
    v31 = v19;
    _os_log_impl(&dword_1C2614000, v18, OS_LOG_TYPE_DEFAULT, "%s Registered XPC activity complete. State: %@.", buf, 0x16u);

  }
LABEL_28:

}

void __60__CSPostBuildInstallService_registerPostBuildInstallService__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5);
  v4 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[CSPostBuildInstallService registerPostBuildInstallService]_block_invoke";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Post build install/first unlock tasks got completed with error - %{public}@", (uint8_t *)&v5, 0x16u);
  }

}

+ (id)sharedService
{
  if ((objc_msgSend(MEMORY[0x1E0D19260], "isDarwinOS") & 1) != 0)
    return 0;
  if (sharedService_onceToken_14787 != -1)
    dispatch_once(&sharedService_onceToken_14787, &__block_literal_global_14788);
  return (id)sharedService_sharedService;
}

void __42__CSPostBuildInstallService_sharedService__block_invoke()
{
  CSPostBuildInstallService *v0;
  void *v1;

  CSLogInitIfNeeded();
  v0 = objc_alloc_init(CSPostBuildInstallService);
  v1 = (void *)sharedService_sharedService;
  sharedService_sharedService = (uint64_t)v0;

}

@end
