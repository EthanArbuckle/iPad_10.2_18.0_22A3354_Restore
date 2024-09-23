@implementation AWClientPreferences

+ (void)initialize
{
  uint64_t v2;
  __CFString *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  __CFString *v10;
  _QWORD v11[4];
  __CFString *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v2 = objc_opt_class();
  v3 = CFSTR("LogLevel");
  v4 = &__block_literal_global_231;
  if (registerForPrefsChange_onceToken != -1)
    dispatch_once(&registerForPrefsChange_onceToken, &__block_literal_global_218_668);
  v5 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __registerForPrefsChange_block_invoke_223;
  v14[3] = &unk_1E5F8E0F8;
  v15 = &__block_literal_global_231;
  v16 = v2;
  v6 = &__block_literal_global_231;
  v7 = (void *)MEMORY[0x1B5DF9110](v14);
  v8 = registerForPrefsChange_queue;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __registerForPrefsChange_block_invoke_2_226;
  v11[3] = &unk_1E5F8EB38;
  v12 = CFSTR("LogLevel");
  v13 = v7;
  v9 = v7;
  v10 = CFSTR("LogLevel");
  dispatch_sync(v8, v11);

}

uint64_t __33__AWClientPreferences_initialize__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    result = objc_msgSend(a2, "intValue");
  else
    result = 6;
  currentLogLevel = result;
  return result;
}

@end
