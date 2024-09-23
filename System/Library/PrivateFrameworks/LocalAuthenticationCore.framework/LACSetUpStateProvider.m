@implementation LACSetUpStateProvider

+ (LACSetUpStateProvider)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_12);
  return (LACSetUpStateProvider *)(id)sharedInstance_sharedInstance_5;
}

void __39__LACSetUpStateProvider_sharedInstance__block_invoke()
{
  LACSetUpStateProvider *v0;
  void *v1;

  v0 = objc_alloc_init(LACSetUpStateProvider);
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v0;

}

- (BOOL)hasCompletedSetup
{
  unsigned int (*BYSetupAssistantNeedsToRunSymbolLoc)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v10 = xmmword_2510C2678;
    v11 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (SetupAssistantLibraryCore_frameworkLibrary && getBYSetupAssistantNeedsToRunSymbolLoc())
  {
    BYSetupAssistantNeedsToRunSymbolLoc = (unsigned int (*)(_QWORD, uint64_t, uint64_t, uint64_t))getBYSetupAssistantNeedsToRunSymbolLoc();
    if (!BYSetupAssistantNeedsToRunSymbolLoc)
      soft_CRIsSelfRepairedComponent_cold_1();
    v6 = BYSetupAssistantNeedsToRunSymbolLoc(BYSetupAssistantNeedsToRunSymbolLoc, v3, v4, v5) ^ 1;
    LACLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = 138412290;
      *(_QWORD *)((char *)&v10 + 4) = v8;
      _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "hasCompletedSetup: %@", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    LACLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LACSetUpStateProvider hasCompletedSetup].cold.1(v7);
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)hasCompletedSetup
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2409DC000, log, OS_LOG_TYPE_ERROR, "Setup checks are not available due to missing dependencies", v1, 2u);
}

@end
