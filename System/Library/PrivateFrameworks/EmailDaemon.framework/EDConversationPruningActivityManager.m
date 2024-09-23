@implementation EDConversationPruningActivityManager

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__EDConversationPruningActivityManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_25 != -1)
    dispatch_once(&log_onceToken_25, block);
  return (OS_os_log *)(id)log_log_25;
}

void __43__EDConversationPruningActivityManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_25;
  log_log_25 = (uint64_t)v1;

}

+ (void)scheduleWithConversationManager:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  _QWORD aBlock[4];
  id v8;
  uint8_t buf[16];

  v3 = a3;
  +[EDConversationPruningActivityManager log](EDConversationPruningActivityManager, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v4, OS_LOG_TYPE_INFO, "Library purgeable upgrader has been scheduled.", buf, 2u);
  }

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__EDConversationPruningActivityManager_scheduleWithConversationManager___block_invoke_2;
  aBlock[3] = &unk_1E949BC90;
  v5 = v3;
  v8 = v5;
  v6 = _Block_copy(aBlock);
  ef_xpc_activity_register();

}

void __72__EDConversationPruningActivityManager_scheduleWithConversationManager___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808D8], 1);

}

void __72__EDConversationPruningActivityManager_scheduleWithConversationManager___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  +[EDConversationPruningActivityManager log](EDConversationPruningActivityManager, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v2, OS_LOG_TYPE_INFO, "Started pruning conversations", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "pruneDatabasePurgingOldestEntries:", 0);
  +[EDConversationPruningActivityManager log](EDConversationPruningActivityManager, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D2F2C000, v3, OS_LOG_TYPE_INFO, "Finished pruning conversations", v4, 2u);
  }

}

@end
