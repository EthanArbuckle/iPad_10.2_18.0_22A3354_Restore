@implementation INVoiceShortcutCenter

uint64_t __48__INVoiceShortcutCenter_setShortcutSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "intent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "intent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = _INIsIntentValidForSuggestion(v4);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)setShortcutSuggestions:(NSArray *)suggestions
{
  void *v3;
  void *v4;
  id v5;

  -[NSArray if_objectsPassingTest:](suggestions, "if_objectsPassingTest:", &__block_literal_global_38967);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  INContainingBundleIdentifierForCurrentProcess();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _INVCVoiceShortcutClient();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShortcutSuggestions:forAppWithBundleIdentifier:", v5, v3);

}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

void __37__INVoiceShortcutCenter_sharedCenter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedCenter_sharedCenter;
  sharedCenter_sharedCenter = (uint64_t)v0;

}

- (INVoiceShortcutCenter)init
{
  void *v3;
  INVoiceShortcutCenter *v4;

  _INVCVoiceShortcutClient();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[INVoiceShortcutCenter _initWithVoiceShortcutClient:](self, "_initWithVoiceShortcutClient:", v3);

  return v4;
}

- (id)_initWithVoiceShortcutClient:(id)a3
{
  id v5;
  INVoiceShortcutCenter *v6;
  NSObject *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INVoiceShortcutCenter;
  v6 = -[INVoiceShortcutCenter init](&v9, sel_init);
  if (v6)
  {
    if (!v5)
    {
      v7 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v11 = "-[INVoiceShortcutCenter _initWithVoiceShortcutClient:]";
        _os_log_error_impl(&dword_18BEBC000, v7, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; initing without one",
          buf,
          0xCu);
      }
    }
    objc_storeStrong((id *)&v6->_voiceShortcutClient, a3);
  }

  return v6;
}

+ (INVoiceShortcutCenter)sharedCenter
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__INVoiceShortcutCenter_sharedCenter__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCenter_onceToken != -1)
    dispatch_once(&sharedCenter_onceToken, block);
  return (INVoiceShortcutCenter *)(id)sharedCenter_sharedCenter;
}

- (void)getAllVoiceShortcutsWithCompletion:(void *)completionHandler
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  -[INVoiceShortcutCenter voiceShortcutClient](self, "voiceShortcutClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __60__INVoiceShortcutCenter_getAllVoiceShortcutsWithCompletion___block_invoke;
    v7[3] = &unk_1E2291BE8;
    v8 = v4;
    objc_msgSend(v5, "getVoiceShortcutsWithCompletion:", v7);

  }
  else
  {
    v6 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[INVoiceShortcutCenter getAllVoiceShortcutsWithCompletion:]";
      _os_log_error_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; completing with nil",
        buf,
        0xCu);
    }
    (*((void (**)(void *, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
  }

}

- (void)getVoiceShortcutWithIdentifier:(NSUUID *)identifier completion:(void *)completionHandler
{
  NSUUID *v6;
  void (**v7)(void *, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  NSObject *v13;
  _QWORD v14[4];
  NSUUID *v15;
  void (**v16)(void *, _QWORD, void *);
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = identifier;
  v7 = completionHandler;
  -[INVoiceShortcutCenter voiceShortcutClient](self, "voiceShortcutClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v11 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[INVoiceShortcutCenter getVoiceShortcutWithIdentifier:completion:]";
      _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, "%s No VoiceShortcutClient; completing with nil and error",
        buf,
        0xCu);
    }
    v12 = CFSTR("No INVoiceShortcutClient");
    goto LABEL_10;
  }
  if (!v6)
  {
    v13 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[INVoiceShortcutCenter getVoiceShortcutWithIdentifier:completion:]";
      _os_log_error_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_ERROR, "%s Client passed a nil voice shortcut identifier; completing with nil and error",
        buf,
        0xCu);
    }
    v12 = CFSTR("Client passed a nil voice shortcut identifier");
LABEL_10:
    _INVoiceShortcutError(7001, v12, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v10);
    goto LABEL_11;
  }
  -[NSUUID UUIDString](v6, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__INVoiceShortcutCenter_getVoiceShortcutWithIdentifier_completion___block_invoke;
  v14[3] = &unk_1E228C858;
  v15 = v6;
  v16 = v7;
  objc_msgSend(v8, "getVoiceShortcutWithIdentifier:completion:", v9, v14);

  v10 = v15;
LABEL_11:

}

- (INVCVoiceShortcutClient)voiceShortcutClient
{
  return self->_voiceShortcutClient;
}

- (void)_setVoiceShortcutClient:(id)a3
{
  objc_storeStrong((id *)&self->_voiceShortcutClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceShortcutClient, 0);
}

void __67__INVoiceShortcutCenter_getVoiceShortcutWithIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = -[INVoiceShortcut _initWithVCVoiceShortcut:]([INVoiceShortcut alloc], "_initWithVCVoiceShortcut:", v5);
    if (v7)
    {
      (*(void (**)(_QWORD, id, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v7, 0);
    }
    else
    {
      v11 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[INVoiceShortcutCenter getVoiceShortcutWithIdentifier:completion:]_block_invoke";
        v17 = 2114;
        v18 = v5;
        _os_log_error_impl(&dword_18BEBC000, v11, OS_LOG_TYPE_ERROR, "%s Failed to create an INVoiceShortcut from VCVoiceShortcut=%{public}@", (uint8_t *)&v15, 0x16u);
      }
      v12 = *(_QWORD *)(a1 + 40);
      _INVoiceShortcutError(7000, CFSTR("Failed to create an INVoiceShortcut"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v12 + 16))(v12, 0, v13);

    }
    goto LABEL_12;
  }
  v8 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v14 = *(void **)(a1 + 32);
    v15 = 136315650;
    v16 = "-[INVoiceShortcutCenter getVoiceShortcutWithIdentifier:completion:]_block_invoke";
    v17 = 2114;
    v18 = v14;
    v19 = 2114;
    v20 = v6;
    _os_log_error_impl(&dword_18BEBC000, v8, OS_LOG_TYPE_ERROR, "%s Error from -getVoiceShortcutWithIdentifier=%{public}@: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  v9 = dyld_program_sdk_at_least();
  v10 = *(_QWORD *)(a1 + 40);
  if (!v9)
  {
    _INVoiceShortcutError(7001, CFSTR("Failed to get voice shortcut"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, id))(v10 + 16))(v10, 0, v7);
LABEL_12:

    goto LABEL_13;
  }
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v10 + 16))(v10, 0, 0);
LABEL_13:

}

void __60__INVoiceShortcutCenter_getAllVoiceShortcutsWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v19 = a1;
    v20 = v6;
    v8 = (void *)objc_opt_new();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v5;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v23 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
          v15 = -[INVoiceShortcut _initWithVCVoiceShortcut:]([INVoiceShortcut alloc], "_initWithVCVoiceShortcut:", v14);
          if (v15)
          {
            objc_msgSend(v8, "addObject:", v15);
          }
          else
          {
            v16 = INSiriLogContextIntents;
            if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315394;
              v28 = "-[INVoiceShortcutCenter getAllVoiceShortcutsWithCompletion:]_block_invoke";
              v29 = 2114;
              v30 = v14;
              _os_log_error_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_ERROR, "%s Failed to create an INVoiceShortcut from VCVoiceShortcut=%{public}@", buf, 0x16u);
            }
          }

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v11);
    }

    (*(void (**)(void))(*(_QWORD *)(v19 + 32) + 16))();
    v7 = v20;
    v5 = v21;
  }
  else
  {
    v17 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v28 = "-[INVoiceShortcutCenter getAllVoiceShortcutsWithCompletion:]_block_invoke";
      v29 = 2114;
      v30 = v7;
      _os_log_error_impl(&dword_18BEBC000, v17, OS_LOG_TYPE_ERROR, "%s Error from -getVoiceShortcutsWithCompletion: %{public}@", buf, 0x16u);
    }
    v18 = *(_QWORD *)(a1 + 32);
    _INVoiceShortcutError(7001, CFSTR("Failed to get voice shortcuts"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v18 + 16))(v18, 0, v8);
  }

}

@end
