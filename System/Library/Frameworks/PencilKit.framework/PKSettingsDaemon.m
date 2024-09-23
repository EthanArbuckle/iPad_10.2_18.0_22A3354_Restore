@implementation PKSettingsDaemon

+ (void)prewarmServiceConnectionIfNeeded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PKSettingsDaemon_prewarmServiceConnectionIfNeeded__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (prewarmServiceConnectionIfNeeded_onceToken != -1)
    dispatch_once(&prewarmServiceConnectionIfNeeded_onceToken, block);
}

uint64_t __52__PKSettingsDaemon_prewarmServiceConnectionIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchWithErrorHandler:successHandler:", &__block_literal_global_56, &__block_literal_global_6_0);
}

void __52__PKSettingsDaemon_prewarmServiceConnectionIfNeeded__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_1BE213000, v0, OS_LOG_TYPE_ERROR, "Error creating connection to settings service", v1, 2u);
  }

}

void __52__PKSettingsDaemon_prewarmServiceConnectionIfNeeded__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "getGlobalPrefersPencilHoverPreviewEnabledWithCompletion:", &__block_literal_global_9);
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Successfully created connection to settings service", v4, 2u);
  }

}

+ (id)daemonQueue
{
  if (qword_1ECEE6318 != -1)
    dispatch_once(&qword_1ECEE6318, &__block_literal_global_11);
  return (id)_MergedGlobals_140;
}

void __31__PKSettingsDaemon_daemonQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.PencilKit.settingsDaemon", 0);
  v1 = (void *)_MergedGlobals_140;
  _MergedGlobals_140 = (uint64_t)v0;

}

+ (void)setPrefersPencilOnlyDrawing:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__PKSettingsDaemon_setPrefersPencilOnlyDrawing___block_invoke_14;
  v3[3] = &__block_descriptor_33_e38_v16__0___CHPKRemoteSettingsProtocol__8l;
  v4 = a3;
  objc_msgSend(a1, "_dispatchWithErrorHandler:successHandler:", &__block_literal_global_13, v3);
}

void __48__PKSettingsDaemon_setPrefersPencilOnlyDrawing___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = CFSTR("prefersPencilOnlyDrawing");
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1BE213000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __48__PKSettingsDaemon_setPrefersPencilOnlyDrawing___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 32))
      v5 = CFSTR("NO");
    v6 = 138412546;
    v7 = CFSTR("prefersPencilOnlyDrawing");
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Setting %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(v3, "setGlobalPrefersPencilOnlyDrawing:", *(unsigned __int8 *)(a1 + 32));
}

+ (void)prefersPencilOnlyDrawing:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __45__PKSettingsDaemon_prefersPencilOnlyDrawing___block_invoke_21;
  v3[3] = &__block_descriptor_33_e38_v16__0___CHPKRemoteSettingsProtocol__8l;
  v4 = a3;
  objc_msgSend(a1, "_dispatchWithErrorHandler:successHandler:", &__block_literal_global_20, v3);
}

void __45__PKSettingsDaemon_prefersPencilOnlyDrawing___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = CFSTR("prefersPencilOnlyDrawing");
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1BE213000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __45__PKSettingsDaemon_prefersPencilOnlyDrawing___block_invoke_21(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 32))
      v5 = CFSTR("NO");
    v6 = 138412546;
    v7 = CFSTR("prefersPencilOnlyDrawing");
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Setting %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(v3, "setGlobalPrefersPencilOnlyDrawing:", *(unsigned __int8 *)(a1 + 32));
}

+ (void)setAutoRefineEnabled:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __41__PKSettingsDaemon_setAutoRefineEnabled___block_invoke_23;
  v3[3] = &__block_descriptor_33_e38_v16__0___CHPKRemoteSettingsProtocol__8l;
  v4 = a3;
  objc_msgSend(a1, "_dispatchWithErrorHandler:successHandler:", &__block_literal_global_22, v3);
}

void __41__PKSettingsDaemon_setAutoRefineEnabled___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = CFSTR("UIAutoRefineEnabledKey");
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1BE213000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __41__PKSettingsDaemon_setAutoRefineEnabled___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 32);
    v6 = 138412546;
    v7 = CFSTR("UIAutoRefineEnabledKey");
    v8 = 1024;
    v9 = v5;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Setting '%@' to %{BOOL}d", (uint8_t *)&v6, 0x12u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setGlobalAutoRefineEnabled:withCompletion:", *(unsigned __int8 *)(a1 + 32), &__block_literal_global_27);

}

void __41__PKSettingsDaemon_setAutoRefineEnabled___block_invoke_26()
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("PKRemoteAutoRefineSettingsDidChange"), 0, 0, 1u);
}

+ (BOOL)autoRefineEnabled
{
  void *v2;
  void *v3;

  if (_os_feature_enabled_impl()
    && PKIsPadDevice()
    && CHGetPersonalizedSynthesisSupportState() >= 2
    && PKCurrentAppSupportsRefinement()
    && objc_msgSend((id)objc_opt_class(), "hasAutoRefineLocaleEnabled"))
  {
    PKUIKitUserDefaults();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", CFSTR("UIAutoRefineEnabledKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      LOBYTE(v3) = objc_msgSend(v2, "BOOLForKey:", CFSTR("UIAutoRefineEnabledKey"));

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

+ (void)openPencilPreferences
{
  objc_msgSend(a1, "_dispatchWithErrorHandler:successHandler:", &__block_literal_global_28_0, &__block_literal_global_30_0);
}

void __41__PKSettingsDaemon_openPencilPreferences__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1BE213000, v3, OS_LOG_TYPE_ERROR, "Error opening pencil preferences from palette: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __41__PKSettingsDaemon_openPencilPreferences__block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Opening Pencil Settings", v4, 2u);
  }

  objc_msgSend(v2, "openPencilSettings");
}

+ (void)setCurrentScribbleLanguageIdentifiers:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PKSettingsDaemon_setCurrentScribbleLanguageIdentifiers___block_invoke_32;
  v6[3] = &unk_1E777B928;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a1, "_dispatchWithErrorHandler:successHandler:", &__block_literal_global_31, v6);

}

void __58__PKSettingsDaemon_setCurrentScribbleLanguageIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412546;
    v5 = CFSTR("CurrentScribbleLanguages");
    v6 = 2112;
    v7 = v2;
    _os_log_error_impl(&dword_1BE213000, v3, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v4, 0x16u);
  }

}

void __58__PKSettingsDaemon_setCurrentScribbleLanguageIdentifiers___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = CFSTR("CurrentScribbleLanguages");
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1BE213000, v4, OS_LOG_TYPE_DEFAULT, "Setting %@ : %@", (uint8_t *)&v6, 0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setCurrentScribbleLanguageIdentifiers:", *(_QWORD *)(a1 + 32));

}

+ (void)setPrefersPencilHoverPreviewEnabled:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  BOOL v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke;
  aBlock[3] = &unk_1E7777F58;
  v16 = v6;
  v8 = v6;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_2;
  v13[3] = &unk_1E777B950;
  v14 = _Block_copy(aBlock);
  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_35;
  v10[3] = &unk_1E777B978;
  v12 = a3;
  v11 = v14;
  v9 = v14;
  objc_msgSend(a1, "_dispatchWithErrorHandler:successHandler:", v13, v10);

}

uint64_t __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *MEMORY[0x1E0DC51E8];
    v6 = 138412546;
    v7 = v5;
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1BE213000, v4, OS_LOG_TYPE_ERROR, "Error creating xpc connection to set %@: %@", (uint8_t *)&v6, 0x16u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  char v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_opt_respondsToSelector();
  v5 = os_log_create("com.apple.pencilkit", "PKSettingsDaemon");
  v6 = v5;
  if ((v4 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *MEMORY[0x1E0DC51E8];
      v8 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 40))
        v8 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Setting %@ to %@", buf, 0x16u);
    }

    v9 = *(unsigned __int8 *)(a1 + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_38;
    v12[3] = &unk_1E7777F58;
    v13 = *(id *)(a1 + 32);
    objc_msgSend(v3, "setGlobalPrefersPencilHoverPreviewEnabled:withCompletion:", v9, v12);

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = *MEMORY[0x1E0DC51E8];
      v11 = CFSTR("YES");
      if (!*(_BYTE *)(a1 + 40))
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 138412546;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_error_impl(&dword_1BE213000, v6, OS_LOG_TYPE_ERROR, "Unable to set %@ to %@. Proxy doesn't respond to method.", buf, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __71__PKSettingsDaemon_setPrefersPencilHoverPreviewEnabled_withCompletion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_dispatchWithErrorHandler:(id)a3 successHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "daemonQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__PKSettingsDaemon__dispatchWithErrorHandler_successHandler___block_invoke;
  v11[3] = &unk_1E777B9C8;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

void __61__PKSettingsDaemon__dispatchWithErrorHandler_successHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.handwritingd.pksettings"), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF5F3E60);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);
  objc_msgSend(v2, "resume");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __61__PKSettingsDaemon__dispatchWithErrorHandler_successHandler___block_invoke_2;
  v9 = &unk_1E777B9A0;
  v10 = *(id *)(a1 + 32);
  v11 = &v12;
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*((_BYTE *)v13 + 24))
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v4);
  }
  objc_msgSend(v2, "invalidate", v6, v7, v8, v9);

  _Block_object_dispose(&v12, 8);
}

uint64_t __61__PKSettingsDaemon__dispatchWithErrorHandler_successHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    result = (*(uint64_t (**)(void))(result + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

@end
