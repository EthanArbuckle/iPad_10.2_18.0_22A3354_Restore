@implementation CNSiriIntelligenceSettings

- (CNSiriIntelligenceSettings)init
{
  CNSiriIntelligenceSettings *v2;
  void *v3;
  unsigned __int8 v4;
  NSObject *v5;
  CNSiriIntelligenceSettings *v6;
  _QWORD handler[4];
  __CFString *v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CNSiriIntelligenceSettings;
  v2 = -[CNSiriIntelligenceSettings init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
    v4 = objc_msgSend(v3, "containsObject:", CFSTR("com.apple.MobileAddressBook")) ^ 1;

    atomic_store(v4, (unsigned __int8 *)&v2->_shouldShowSiriSuggestions);
    objc_initWeak(&location, v2);
    dispatch_get_global_queue(17, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __34__CNSiriIntelligenceSettings_init__block_invoke;
    handler[3] = &unk_1E29FE220;
    objc_copyWeak(&v10, &location);
    v9 = CFSTR("com.apple.MobileAddressBook");
    notify_register_dispatch("com.apple.suggestions.settingsChanged", &v2->_notificationToken, v5, handler);

    v6 = v2;
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (BOOL)shouldShowSiriSuggestions
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldShowSiriSuggestions);
  v3 = v2 & 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[CNSiriIntelligenceSettings shouldShowSiriSuggestions].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
  return v3;
}

void __34__CNSiriIntelligenceSettings_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  int v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = *(id *)(a1 + 32);
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("AppCanShowSiriSuggestionsBlacklist"), CFSTR("com.apple.suggestions"));
    v4 = objc_msgSend(v3, "containsObject:", v2);

    objc_msgSend(WeakRetained, "setShouldShowSiriSuggestions:", v4 ^ 1u);
  }

}

- (void)setShouldShowSiriSuggestions:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  atomic_store(a3, (unsigned __int8 *)&self->_shouldShowSiriSuggestions);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    -[CNSiriIntelligenceSettings setShouldShowSiriSuggestions:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (void)dealloc
{
  int notificationToken;
  objc_super v4;

  notificationToken = self->_notificationToken;
  if (notificationToken)
    notify_cancel(notificationToken);
  v4.receiver = self;
  v4.super_class = (Class)CNSiriIntelligenceSettings;
  -[CNSiriIntelligenceSettings dealloc](&v4, sel_dealloc);
}

- (void)shouldShowSiriSuggestions
{
  OUTLINED_FUNCTION_0_6(&dword_18F8BD000, MEMORY[0x1E0C81028], a3, "canShowSiriSuggestions = %d", a5, a6, a7, a8, 0);
}

- (void)setShouldShowSiriSuggestions:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_6(&dword_18F8BD000, MEMORY[0x1E0C81028], a3, "setCanShowSiriSuggestions = %d", a5, a6, a7, a8, 0);
}

@end
