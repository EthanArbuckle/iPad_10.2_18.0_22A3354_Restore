@implementation AMSLogConfig

void __57__AMSLogConfig_AppStoreKitInternal__ask_generalLogConfig__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CFDBB0]);
  objc_msgSend(v2, "setSubsystem:", CFSTR("com.apple.AppStoreKitInternal"));
  objc_msgSend(v2, "setCategory:", CFSTR("ASK General"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)ask_generalLogConfig_logConfig;
  ask_generalLogConfig_logConfig = v0;

}

@end
