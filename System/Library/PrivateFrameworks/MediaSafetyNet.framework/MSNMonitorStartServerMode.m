@implementation MSNMonitorStartServerMode

void __MSNMonitorStartServerMode_block_invoke(int a1, int token)
{
  uint32_t state;
  int v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t state64;
  uint8_t buf[4];
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  state64 = 0;
  state = notify_get_state(token, &state64);
  if (state64)
    v3 = 2;
  else
    v3 = 1;
  if (state)
    v3 = 0;
  g_keyboardState = v3;
  MSNLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (g_keyboardState >= 3)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __MSNMonitorStartServerMode_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);

      abort();
    }
    v5 = off_1E97762E0[g_keyboardState];
    *(_DWORD *)buf = 136315138;
    v16 = v5;
    _os_log_impl(&dword_1D416F000, v4, OS_LOG_TYPE_INFO, "Updated keyboard state: %s", buf, 0xCu);
  }

}

void __MSNMonitorStartServerMode_block_invoke_14(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  v4 = s_mediaSafetyNetQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __MSNMonitorStartServerMode_block_invoke_2;
  block[3] = &unk_1E9775FF8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __MSNMonitorStartServerMode_block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  NSObject *v21;
  char *v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  char *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  if (!v1)
  {
    g_uiState = 3;
    return;
  }
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  objc_msgSend(v1, "elements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (!v3)
  {

    v4 = 0;
    v5 = 0;
    goto LABEL_29;
  }
  v4 = 0;
  v36 = 0;
  v5 = 0;
  v6 = *(_QWORD *)v39;
  v7 = *MEMORY[0x1E0DAB668];
  v35 = *MEMORY[0x1E0D22C78];
  obj = v2;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(_QWORD *)v39 != v6)
        objc_enumerationMutation(obj);
      v9 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
      objc_msgSend(v9, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v7);

      if ((v11 & 1) != 0)
      {
        v12 = v5;
        v13 = v4;
        v5 = v9;
LABEL_15:
        v17 = v9;

        v4 = v13;
        continue;
      }
      objc_msgSend(v9, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v35);

      if ((v15 & 1) != 0)
      {
        v12 = v36;
        v13 = v4;
        v36 = v9;
        goto LABEL_15;
      }
      if (!v4)
      {
        v12 = 0;
        v13 = v9;
        goto LABEL_15;
      }
      v16 = objc_msgSend(v9, "level");
      v12 = v4;
      v13 = v9;
      if (v16 > objc_msgSend(v4, "level"))
        goto LABEL_15;
    }
    v3 = (void *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  }
  while (v3);

  v3 = v36;
  if (v36 || !v5)
  {
    if (v36)
    {
      if (!v4 || (v19 = objc_msgSend(v36, "level"), v19 > objc_msgSend(v4, "level")))
      {
        v20 = 1;
        goto LABEL_32;
      }
    }
    goto LABEL_29;
  }
  if (!v4)
  {
    v3 = 0;
    goto LABEL_31;
  }
  v18 = objc_msgSend(v5, "level");
  v3 = 0;
  if (v18 <= objc_msgSend(v4, "level"))
  {
LABEL_29:
    v20 = 3;
    goto LABEL_32;
  }
LABEL_31:
  v20 = 2;
LABEL_32:
  g_uiState = v20;
  MSNLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    if (g_uiState >= 4)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        __MSNMonitorStartServerMode_block_invoke_cold_1(v27, v28, v29, v30, v31, v32, v33, v34);

      abort();
    }
    v22 = off_1E97762F8[g_uiState];
    *(_DWORD *)buf = 136315138;
    v43 = v22;
    _os_log_impl(&dword_1D416F000, v21, OS_LOG_TYPE_INFO, "Updated view state: %s", buf, 0xCu);
  }

  if (g_uiState == 2)
  {
    if (s_pillDataSource_block_invoke_once != -1)
      dispatch_once(&s_pillDataSource_block_invoke_once, &__block_literal_global_18);
    +[MSNTTR sharedInstance](MSNTTR, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "pendedTTR");

    if (v24)
    {
      MSNLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D416F000, v25, OS_LOG_TYPE_INFO, "Home, continuing TTR.", buf, 2u);
      }

      +[MSNTTR sharedInstance](MSNTTR, "sharedInstance");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "continueTTR");

    }
  }

}

void __MSNMonitorStartServerMode_block_invoke_17()
{
  CFPropertyListRef v0;
  const void *v1;
  CFPropertyListRef v2;
  void *v3;

  v0 = CFPreferencesCopyAppValue(CFSTR("MediaSafetyNetWaitingTTR"), CFSTR("com.apple.mediaserverd"));
  if (v0)
  {
    v1 = v0;
    v2 = CFPreferencesCopyAppValue(CFSTR("MediaSafetyNetWaitingTTRDate"), CFSTR("com.apple.mediaserverd"));
    +[MSNTTR sharedInstance](MSNTTR, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginTTRWithTitle:date:", v1, v2);

    if (v2)
      CFRelease(v2);
    CFRelease(v1);
  }
}

void __MSNMonitorStartServerMode_block_invoke_29(uint64_t a1, int a2)
{
  NSObject *v3;
  uint32_t state;
  int v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t state64;
  uint8_t buf[4];
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  g_production = 0;
  MSNLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D416F000, v3, OS_LOG_TYPE_INFO, "Microphone override changed", buf, 2u);
  }

  state64 = 0;
  state = notify_get_state(a2, &state64);
  if (state64)
    v5 = 1;
  else
    v5 = 2;
  if (state)
    v5 = 0;
  g_microphoneState = v5;
  MSNLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (g_microphoneState >= 4)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __MSNMonitorStartServerMode_block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

      abort();
    }
    v7 = off_1E9776318[g_microphoneState];
    *(_DWORD *)buf = 136315138;
    v18 = v7;
    _os_log_impl(&dword_1D416F000, v6, OS_LOG_TYPE_INFO, "Updated microphone state: %s", buf, 0xCu);
  }

}

void __MSNMonitorStartServerMode_block_invoke_34(uint64_t a1, int a2)
{
  NSObject *v3;
  uint32_t state;
  int v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t state64;
  uint8_t buf[4];
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  g_production = 0;
  MSNLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D416F000, v3, OS_LOG_TYPE_INFO, "Camera override changed", buf, 2u);
  }

  state64 = 0;
  state = notify_get_state(a2, &state64);
  if (state64)
    v5 = 1;
  else
    v5 = 2;
  if (state)
    v5 = 0;
  g_cameraState = v5;
  MSNLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    if (g_cameraState >= 4)
    {
      qword_1EFE381E8 = (uint64_t)"Unknown state";
      MSNLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __MSNMonitorStartServerMode_block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

      abort();
    }
    v7 = off_1E9776318[g_cameraState];
    *(_DWORD *)buf = 136315138;
    v18 = v7;
    _os_log_impl(&dword_1D416F000, v6, OS_LOG_TYPE_INFO, "Updated camera state: %s", buf, 0xCu);
  }

}

void __MSNMonitorStartServerMode_block_invoke_37(int a1, int token)
{
  NSObject *v2;
  char *v3;
  const char *v4;
  char *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t state64;
  uint8_t buf[4];
  char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  g_production = 0;
  state64 = 0;
  if (!notify_get_state(token, &state64))
  {
    if (state64)
    {
      g_pillState = state64;
      s_lockPill = 1;
      MSNLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        if (g_pillState < 3)
        {
          v3 = off_1E9776338[g_pillState];
          *(_DWORD *)buf = 136315138;
          v16 = v3;
          v4 = "Updated pill state: %s";
LABEL_9:
          _os_log_impl(&dword_1D416F000, v2, OS_LOG_TYPE_INFO, v4, buf, 0xCu);
          goto LABEL_10;
        }
        qword_1EFE381E8 = (uint64_t)"Unknown state";
        MSNLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
LABEL_15:
          __MSNMonitorStartServerMode_block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_16:

        abort();
      }
    }
    else
    {
      s_lockPill = 0;
      g_pillState = 0;
      MSNLog();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        if (g_pillState < 3)
        {
          v5 = off_1E9776338[g_pillState];
          *(_DWORD *)buf = 136315138;
          v16 = v5;
          v4 = "Reset pill state: %s";
          goto LABEL_9;
        }
        qword_1EFE381E8 = (uint64_t)"Unknown state";
        MSNLog();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          goto LABEL_15;
        goto LABEL_16;
      }
    }
LABEL_10:

  }
}

void __MSNMonitorStartServerMode_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1D416F000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
