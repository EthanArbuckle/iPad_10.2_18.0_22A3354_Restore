@implementation HUTriggerUtilities

+ (void)preloadShortcuts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HUTriggerUtilities_preloadShortcuts__block_invoke;
  v7[3] = &unk_1E6F4D988;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __38__HUTriggerUtilities_preloadShortcuts__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0DD9D78], "setCachedHomes:", *(_QWORD *)(a1 + 32));
}

+ (void)preloadShortcutHomeManager
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D519E8], "globalAsyncScheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performBlock:", &__block_literal_global_58);

}

uint64_t __48__HUTriggerUtilities_preloadShortcutHomeManager__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0DDA0F0], "preloadHomeManager");
}

@end
