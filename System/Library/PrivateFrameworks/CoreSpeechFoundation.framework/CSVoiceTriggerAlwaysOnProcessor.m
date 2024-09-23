@implementation CSVoiceTriggerAlwaysOnProcessor

- (CSVoiceTriggerAlwaysOnProcessor)init
{
  CSVoiceTriggerAlwaysOnProcessor *v3;
  CSVoiceTriggerAlwaysOnProcessor *v4;
  id v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  dispatch_group_t v8;
  OS_dispatch_group *aopSwitchGroup;
  objc_super v11;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CSVoiceTriggerAlwaysOnProcessor;
    v4 = -[CSVoiceTriggerAlwaysOnProcessor init](&v11, sel_init);
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v6 = dispatch_queue_create((const char *)objc_msgSend(v5, "UTF8String"), 0);
      queue = v4->_queue;
      v4->_queue = (OS_dispatch_queue *)v6;

      v8 = dispatch_group_create();
      aopSwitchGroup = v4->_aopSwitchGroup;
      v4->_aopSwitchGroup = (OS_dispatch_group *)v8;

    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)enableVoiceTriggerOnAlwaysOnProcessorWithAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CSVoiceTriggerAlwaysOnProcessor *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke;
  block[3] = &unk_1E687F5D0;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(queue, block);

}

- (void)disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __88__CSVoiceTriggerAlwaysOnProcessor_disableVoiceTriggerOnAlwaysOnProcessorWithCompletion___block_invoke;
  v7[3] = &unk_1E6881160;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)_setBuiltInRTModelDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = CSLogCategoryVT;
  if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[CSVoiceTriggerAlwaysOnProcessor _setBuiltInRTModelDictionary:]";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s setting rtModel dictionary : %{public}@", (uint8_t *)&v5, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0DC8660], "setCurrentBuiltInRTModelDictionary:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_aopSwitchGroup, 0);
}

void __88__CSVoiceTriggerAlwaysOnProcessor_disableVoiceTriggerOnAlwaysOnProcessorWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[CSUserSessionActiveMonitor sharedInstance](CSUserSessionActiveMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserActive");

  if ((v3 & 1) != 0)
  {
    dispatch_group_wait(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8), 0xFFFFFFFFFFFFFFFFLL);
    v4 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:]_block_invoke";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Disabling VoiceTrigger in AOP", buf, 0xCu);
    }
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
    +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __88__CSVoiceTriggerAlwaysOnProcessor_disableVoiceTriggerOnAlwaysOnProcessorWithCompletion___block_invoke_18;
    v10[3] = &unk_1E687EF40;
    v6 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v6;
    objc_msgSend(v5, "enableVoiceTriggerListening:completionBlock:", 0, v10);

  }
  else
  {
    v7 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v7, OS_LOG_TYPE_ERROR, "%s Current user doesn't have owner ship of AOP, it cannot disable AOP VoiceTrigger", buf, 0xCu);
    }
    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 507, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

    }
  }
}

void __88__CSVoiceTriggerAlwaysOnProcessor_disableVoiceTriggerOnAlwaysOnProcessorWithCompletion___block_invoke_18(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[CSVoiceTriggerAlwaysOnProcessor disableVoiceTriggerOnAlwaysOnProcessorWithCompletion:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Failed to disable AOP VoiceTrigger", (uint8_t *)&v6, 0xCu);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_setBuiltInRTModelDictionary:", 0);
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

void __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke(id *a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void (**v11)(id, void *);
  void *v12;
  CSKeywordAnalyzerNDEAPI *v13;
  void *v14;
  CSKeywordAnalyzerNDEAPI *v15;
  NSObject *v16;
  void *v17;
  int v18;
  NSObject *v19;
  void *v20;
  void (**v21)(id, CSOSTransaction *);
  CSOSTransaction *v22;
  NSObject *v23;
  CSOSTransaction *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void (**v32)(id, _QWORD);
  void (**v33)(id, CSOSTransaction *);
  void *v34;
  void *v35;
  _QWORD v36[5];
  CSOSTransaction *v37;
  id v38;
  __int128 *p_buf;
  _QWORD v40[5];
  id v41;
  CSOSTransaction *v42;
  id v43;
  __int128 *v44;
  id v45;
  uint8_t v46[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int128 buf;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  +[CSUserSessionActiveMonitor sharedInstance](CSUserSessionActiveMonitor, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUserActive");

  v4 = CSLogCategoryVT;
  if ((v3 & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:c"
                                      "ompletion:]_block_invoke";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Updating VoiceTrigger Configuration", (uint8_t *)&buf, 0xCu);
    }
    objc_msgSend(a1[4], "RTModelWithFallbackLanguage:", CFSTR("xx-XX"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "builtInRTModelDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__5136;
    v55 = __Block_byref_object_dispose__5137;
    v56 = 0;
    objc_msgSend(MEMORY[0x1E0DC8660], "requestCurrentBuiltInRTModelDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToDictionary:", v6);
    v9 = CSLogCategoryVT;
    v10 = os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)v46 = 136315650;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        v48 = 2114;
        v49 = v6;
        v50 = 2114;
        v51 = v7;
        _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s RT model %{public}@ already set (current RT model : %{public}@, skip updating", v46, 0x20u);
      }
LABEL_33:
      v32 = (void (**)(id, _QWORD))a1[6];
      if (v32)
        v32[2](v32, *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      goto LABEL_41;
    }
    if (v10)
    {
      *(_DWORD *)v46 = 136315650;
      v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
      v48 = 2114;
      v49 = v7;
      v50 = 2114;
      v51 = v6;
      _os_log_impl(&dword_1B502E000, v9, OS_LOG_TYPE_DEFAULT, "%s Going to replace current RT model %{public}@ with : %{public}@", v46, 0x20u);
    }
    objc_msgSend(v5, "modelData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = [CSKeywordAnalyzerNDEAPI alloc];
      objc_msgSend(v5, "modelData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CSKeywordAnalyzerNDEAPI initWithBlob:](v13, "initWithBlob:", v14);

      v16 = CSLogCategoryVT;
      if (!v15)
      {
        if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)v46 = 136315138;
          v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
          _os_log_fault_impl(&dword_1B502E000, v16, OS_LOG_TYPE_FAULT, "%s Unable to send model to AOP since it failed to initialize NDEAPI", v46, 0xCu);
        }
        v33 = (void (**)(id, CSOSTransaction *))a1[6];
        if (!v33)
          goto LABEL_41;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 508, 0);
        v22 = (CSOSTransaction *)objc_claimAutoreleasedReturnValue();
        v33[2](v33, v22);
        goto LABEL_40;
      }
      if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v46 = 136315138;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        _os_log_impl(&dword_1B502E000, v16, OS_LOG_TYPE_DEFAULT, "%s Successfully validate model with NDEAPI", v46, 0xCu);
      }

    }
    dispatch_group_wait(*((dispatch_group_t *)a1[5] + 1), 0xFFFFFFFFFFFFFFFFLL);
    if (!v6)
    {
      objc_msgSend(a1[5], "_setBuiltInRTModelDictionary:", 0);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 503, 0);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v29;

      v31 = CSLogCategoryVT;
      if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v46 = 136315138;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        _os_log_error_impl(&dword_1B502E000, v31, OS_LOG_TYPE_ERROR, "%s RTModel doesn't exist, fail to enable VoiceTrigger in AOP", v46, 0xCu);
      }
      goto LABEL_33;
    }
    if (v7
      || (+[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "checkAOPConfigurationWatchDog"),
          v17,
          !v18))
    {
      v23 = CSLogCategoryVT;
      if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v46 = 136315138;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        _os_log_impl(&dword_1B502E000, v23, OS_LOG_TYPE_DEFAULT, "%s Enabling VoiceTrigger in AOP", v46, 0xCu);
      }
      dispatch_group_enter(*((dispatch_group_t *)a1[5] + 1));
      v24 = -[CSOSTransaction initWithDescription:]([CSOSTransaction alloc], "initWithDescription:", CFSTR("AOP Configuration Transaction"));
      +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setAOPConfigurationWatchDog");

      if (+[CSUtils isExclaveHardware](CSUtils, "isExclaveHardware"))
      {
        v26 = CSLogCategoryVT;
        if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v46 = 136315138;
          v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
          _os_log_impl(&dword_1B502E000, v26, OS_LOG_TYPE_DEFAULT, "%s Directly enable AOP without configuring model", v46, 0xCu);
        }
        +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_16;
        v36[3] = &unk_1E687EF18;
        v28 = a1[5];
        p_buf = &buf;
        v36[4] = v28;
        v22 = v24;
        v37 = v22;
        v38 = a1[6];
        objc_msgSend(v27, "enableVoiceTriggerListening:completionBlock:", 1, v36);

      }
      else
      {
        +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak((id *)v46, v34);

        +[CSAVVoiceTriggerClientManager sharedVoiceTriggerClient](CSAVVoiceTriggerClientManager, "sharedVoiceTriggerClient");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_14;
        v40[3] = &unk_1E687EEF0;
        objc_copyWeak(&v45, (id *)v46);
        v40[4] = a1[5];
        v44 = &buf;
        v41 = v6;
        v22 = v24;
        v42 = v22;
        v43 = a1[6];
        objc_msgSend(v35, "updateVoiceTriggerConfiguration:completionBlock:", v41, v40);

        objc_destroyWeak(&v45);
        objc_destroyWeak((id *)v46);
      }
    }
    else
    {
      v19 = CSLogCategoryVT;
      if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v46 = 136315138;
        v47 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
        _os_log_fault_impl(&dword_1B502E000, v19, OS_LOG_TYPE_FAULT, "%s Unable to enable AOP, due to AOP Enable WatchDog", v46, 0xCu);
      }
      +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "clearAOPConfigurationWatchDog");

      v21 = (void (**)(id, CSOSTransaction *))a1[6];
      if (!v21)
        goto LABEL_41;
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 510, 0);
      v22 = (CSOSTransaction *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, v22);
    }
LABEL_40:

LABEL_41:
    _Block_object_dispose(&buf, 8);

    goto LABEL_42;
  }
  if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:com"
                                    "pletion:]_block_invoke";
    _os_log_error_impl(&dword_1B502E000, v4, OS_LOG_TYPE_ERROR, "%s Current user doesn't have owner ship of AOP, it cannot enable AOP VoiceTrigger", (uint8_t *)&buf, 0xCu);
  }
  v11 = (void (**)(id, void *))a1[6];
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 507, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v5);
LABEL_42:

  }
}

void __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_14(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setBuiltInRTModelDictionary:", 0);
    v5 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to update AOP VoiceTrigger configuration", buf, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
    +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clearAOPConfigurationWatchDog");

    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_2;
    v10[3] = &unk_1E687EEC8;
    v15 = *(_QWORD *)(a1 + 64);
    v9 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = 0;
    v12 = v9;
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    objc_msgSend(WeakRetained, "enableVoiceTriggerListening:completionBlock:", 1, v10);

  }
}

void __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_16(_QWORD *a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (v4)
  {
    v5 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke";
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to enable AOP VoiceTrigger", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 8));
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearAOPConfigurationWatchDog");

  v7 = a1[6];
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40));

}

void __93__CSVoiceTriggerAlwaysOnProcessor_enableVoiceTriggerOnAlwaysOnProcessorWithAsset_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "_setBuiltInRTModelDictionary:", 0);
    v5 = CSLogCategoryVT;
    if (os_log_type_enabled((os_log_t)CSLogCategoryVT, OS_LOG_TYPE_ERROR))
    {
      v8 = 136315138;
      v9 = "-[CSVoiceTriggerAlwaysOnProcessor enableVoiceTriggerOnAlwaysOnProcessorWithAsset:completion:]_block_invoke_2";
      _os_log_error_impl(&dword_1B502E000, v5, OS_LOG_TYPE_ERROR, "%s Failed to enable AOP VoiceTrigger", (uint8_t *)&v8, 0xCu);
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(a1 + 40));
  }
  else
  {
    objc_msgSend(v4, "_setBuiltInRTModelDictionary:", *(_QWORD *)(a1 + 48));
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
  +[CSFPreferences sharedPreferences](CSFPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clearAOPConfigurationWatchDog");

  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));

}

@end
