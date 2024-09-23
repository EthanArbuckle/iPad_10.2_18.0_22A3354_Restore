@implementation CDSystemTimeCallbackSchedulerSetAlarmEventStreamHandler

void ___CDSystemTimeCallbackSchedulerSetAlarmEventStreamHandler_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  const char *string;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  _BYTE v10[22];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a2;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  string = xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81298]);

  xpc_set_event();
  v7 = _os_activity_create(&dword_18DD73000, "Duet: ContextStore com.apple.alarm handler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  *(_QWORD *)v10 = 0;
  *(_QWORD *)&v10[8] = 0;
  os_activity_scope_enter(v7, (os_activity_scope_state_t)v10);
  os_activity_scope_leave((os_activity_scope_state_t)v10);

  objc_msgSend(MEMORY[0x1E0D158F0], "contextChannel");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    _CDFormattedDate();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v10 = 138412546;
    *(_QWORD *)&v10[4] = v9;
    *(_WORD *)&v10[12] = 2080;
    *(_QWORD *)&v10[14] = string;
    _os_log_impl(&dword_18DD73000, v8, OS_LOG_TYPE_DEFAULT, "com.apple.alarm xpc event handler at %@ for %s", v10, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "_handleCallbackAtDate:", v5);

}

@end
