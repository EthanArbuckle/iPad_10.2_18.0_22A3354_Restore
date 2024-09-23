@implementation LSAppsAnalyticsStartListening

void ___LSAppsAnalyticsStartListening_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _xpc_activity_s *v4;
  xpc_activity_state_t state;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  __int128 v9;
  BOOL (*v10)(uint64_t);
  void *v11;
  _xpc_activity_s *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)MEMORY[0x186DAE7A0]();
  v4 = (_xpc_activity_s *)v2;
  state = xpc_activity_get_state(v4);
  _LSDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(v9) = 134217984;
    *(_QWORD *)((char *)&v9 + 4) = state;
    _os_log_impl(&dword_182882000, v6, OS_LOG_TYPE_INFO, "Default apps analytics activity state: %lli", (uint8_t *)&v9, 0xCu);
  }

  if (state == 2)
  {
    if (xpc_activity_set_state(v4, 4))
    {
      +[LSDBExecutionContext sharedServerInstance]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v9 = MEMORY[0x1E0C809B0];
      *((_QWORD *)&v9 + 1) = 3221225472;
      v10 = ___ZN14LaunchServices13AppsAnalyticsL14handleActivityEPU24objcproto13OS_xpc_object8NSObject_block_invoke;
      v11 = &unk_1E103FC48;
      v12 = v4;
      -[LSDBExecutionContext performAsyncRead:]((uint64_t)v7, &v9);

      v8 = v12;
    }
    else
    {
      _LSDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_182882000, v8, OS_LOG_TYPE_INFO, "Failed to continue analytics activity.", (uint8_t *)&v9, 2u);
      }
    }

  }
  objc_autoreleasePoolPop(v3);

}

@end
