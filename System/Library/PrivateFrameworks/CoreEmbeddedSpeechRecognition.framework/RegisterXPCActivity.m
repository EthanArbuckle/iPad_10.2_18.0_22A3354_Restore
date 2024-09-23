@implementation RegisterXPCActivity

void ___RegisterXPCActivity_block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  xpc_activity_state_t state;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  NSObject *v9;
  const __CFString *v10;
  _QWORD v11[4];
  _xpc_activity_s *v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  _xpc_activity_s *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      if (!*(_QWORD *)(a1 + 32))
        goto LABEL_15;
      if (!xpc_activity_set_state(v3, 4))
      {
        v5 = *MEMORY[0x1E0CFE6C0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v14 = "_RegisterXPCActivity_block_invoke";
          _os_log_error_impl(&dword_1B3E5F000, v5, OS_LOG_TYPE_ERROR, "%s Failed setting activity state to continue", buf, 0xCu);
        }
      }
      v6 = *(_QWORD *)(a1 + 32);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = ___RegisterXPCActivity_block_invoke_186;
      v11[3] = &unk_1E6734990;
      v12 = v3;
      (*(void (**)(uint64_t, _xpc_activity_s *, _QWORD *))(v6 + 16))(v6, v12, v11);

    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _xpc_activity_s *))(v7 + 16))(v7, v3);
  }
  if (xpc_activity_should_defer(v3))
  {
    v8 = xpc_activity_set_state(v3, 3);
    v9 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      v10 = CFSTR("No");
      *(_DWORD *)buf = 136315650;
      v14 = "_RegisterXPCActivity_block_invoke";
      v15 = 2112;
      v16 = v3;
      if (v8)
        v10 = CFSTR("Yes");
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1B3E5F000, v9, OS_LOG_TYPE_INFO, "%s Deferring activity:%@ deferred:%@", buf, 0x20u);
    }
  }
LABEL_15:

}

void ___RegisterXPCActivity_block_invoke_186(uint64_t a1)
{
  NSObject *v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    v1 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
    {
      v2 = 136315138;
      v3 = "_RegisterXPCActivity_block_invoke";
      _os_log_error_impl(&dword_1B3E5F000, v1, OS_LOG_TYPE_ERROR, "%s Failed setting activity state to done", (uint8_t *)&v2, 0xCu);
    }
  }
}

@end
