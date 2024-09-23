@implementation UNNotificationContentExtensionManager

void __56___UNNotificationContentExtensionManager_sharedInstance__block_invoke()
{
  _UNNotificationContentExtensionManager *v0;
  void *v1;

  v0 = objc_alloc_init(_UNNotificationContentExtensionManager);
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

void __66___UNNotificationContentExtensionManager__beginMatchingExtensions__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionsCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "registerExtensions:", v5);

  }
  else if (v6)
  {
    v9 = (void *)UNLogExtensions;
    if (os_log_type_enabled((os_log_t)UNLogExtensions, OS_LOG_TYPE_ERROR))
      __66___UNNotificationContentExtensionManager__beginMatchingExtensions__block_invoke_cold_1(v9, v7);
  }

}

void __66___UNNotificationContentExtensionManager__beginMatchingExtensions__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_216870000, v3, OS_LOG_TYPE_ERROR, "Error matching extensions: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
