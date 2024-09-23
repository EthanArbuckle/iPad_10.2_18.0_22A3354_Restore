@implementation LAMKBEventsRegister

uint64_t ___LAMKBEventsRegister_block_invoke(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[_LAMKBLog log](_LAMKBLog, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 136315650;
    v9 = "_LAMKBEventsRegister_block_invoke";
    v10 = 1024;
    v11 = a2;
    v12 = 2112;
    v13 = a3;
    _os_log_impl(&dword_1B971E000, v6, OS_LOG_TYPE_INFO, "%s:callback(type=%d, handle_state=%@", (uint8_t *)&v8, 0x1Cu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
