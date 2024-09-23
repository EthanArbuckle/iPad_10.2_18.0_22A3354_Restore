@implementation EDConversationDailyCloudExportActivityManager

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__EDConversationDailyCloudExportActivityManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_21 != -1)
    dispatch_once(&log_onceToken_21, block);
  return (OS_os_log *)(id)log_log_21;
}

void __52__EDConversationDailyCloudExportActivityManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_21;
  log_log_21 = (uint64_t)v1;

}

+ (void)scheduleWithConversationExportDelegate:(id)a3 conversationManager:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  EDConversationDailyiCloudExporter *v8;
  EDConversationDailyiCloudExporter *v9;
  void *v10;
  _QWORD aBlock[4];
  EDConversationDailyiCloudExporter *v12;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  +[EDConversationDailyCloudExportActivityManager log](EDConversationDailyCloudExportActivityManager, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "Library purgeable upgrader has been scheduled.", buf, 2u);
  }

  v8 = -[EDConversationDailyiCloudExporter initWithDelegate:conversationManager:]([EDConversationDailyiCloudExporter alloc], "initWithDelegate:conversationManager:", v5, v6);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__EDConversationDailyCloudExportActivityManager_scheduleWithConversationExportDelegate_conversationManager___block_invoke_2;
  aBlock[3] = &unk_1E949BC90;
  v12 = v8;
  v9 = v8;
  v10 = _Block_copy(aBlock);
  ef_xpc_activity_register();

}

void __108__EDConversationDailyCloudExportActivityManager_scheduleWithConversationExportDelegate_conversationManager___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict;

  xdict = a2;
  xpc_dictionary_set_int64(xdict, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_string(xdict, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(xdict, (const char *)*MEMORY[0x1E0C808A8], 1);

}

uint64_t __108__EDConversationDailyCloudExportActivityManager_scheduleWithConversationExportDelegate_conversationManager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "run");
}

@end
