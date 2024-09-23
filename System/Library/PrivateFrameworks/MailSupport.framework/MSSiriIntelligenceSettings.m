@implementation MSSiriIntelligenceSettings

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__MSSiriIntelligenceSettings_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (OS_os_log *)(id)log_log_2;
}

void __33__MSSiriIntelligenceSettings_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

+ (BOOL)canShowSiriSuggestions
{
  unsigned __int8 v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__MSSiriIntelligenceSettings_canShowSiriSuggestions__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (canShowSiriSuggestions_onceToken != -1)
    dispatch_once(&canShowSiriSuggestions_onceToken, block);
  v2 = atomic_load(sMSCanShowSiriSuggestions);
  v3 = v2 & 1;
  +[MSSiriIntelligenceSettings log](MSSiriIntelligenceSettings, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[MSSiriIntelligenceSettings canShowSiriSuggestions].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

  return v3;
}

uint64_t __52__MSSiriIntelligenceSettings_canShowSiriSuggestions__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_initializeSettings");
}

+ (void)setCanShowSiriSuggestions:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  atomic_store(a3, sMSCanShowSiriSuggestions);
  +[MSSiriIntelligenceSettings log](MSSiriIntelligenceSettings, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[MSSiriIntelligenceSettings setCanShowSiriSuggestions:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);

}

+ (void)_initializeSettings
{
  void *v3;
  NSObject *v4;
  int out_token;
  _QWORD v6[4];
  __CFString *v7;
  id v8;

  atomic_store(SGAppCanShowSiriSuggestions(CFSTR("com.apple.mobilemail")), sMSCanShowSiriSuggestions);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__MSSiriIntelligenceSettings__initializeSettings__block_invoke;
  v6[3] = &unk_1E716E3F8;
  v7 = CFSTR("com.apple.mobilemail");
  v8 = a1;
  v3 = (void *)MEMORY[0x1BCCCCFE8](v6);
  out_token = 0;
  dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch("com.apple.suggestions.settingsChanged", &out_token, v4, v3);

}

uint64_t __49__MSSiriIntelligenceSettings__initializeSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "setCanShowSiriSuggestions:", SGAppCanShowSiriSuggestions(*(void **)(a1 + 32)));
}

+ (void)canShowSiriSuggestions
{
  OUTLINED_FUNCTION_0(&dword_1B9D1A000, a2, a3, "canShowSiriSuggestions = %d", a5, a6, a7, a8, 0);
}

+ (void)setCanShowSiriSuggestions:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9D1A000, a2, a3, "setCanShowSiriSuggestions = %d", a5, a6, a7, a8, 0);
}

@end
