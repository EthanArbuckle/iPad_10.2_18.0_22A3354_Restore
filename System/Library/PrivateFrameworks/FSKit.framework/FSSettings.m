@implementation FSSettings

+ (id)defaultSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__FSSettings_defaultSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultSettings_onceToken != -1)
    dispatch_once(&defaultSettings_onceToken, block);
  return (id)defaultSettings_def;
}

void __29__FSSettings_defaultSettings__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)defaultSettings_def;
  defaultSettings_def = (uint64_t)v1;

}

- (NSURL)settingsContainer
{
  if (settingsContainer_onceToken != -1)
    dispatch_once(&settingsContainer_onceToken, &__block_literal_global_0);
  return (NSURL *)(id)settingsContainer_containerURL;
}

void __31__FSSettings_settingsContainer__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  char v7;
  NSObject *v8;
  id v9;
  char v10;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.fskit.settings"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)settingsContainer_containerURL;
  settingsContainer_containerURL = v1;

  if (settingsContainer_containerURL)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend((id)settingsContainer_containerURL, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v10);

    if ((v5 & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      v9 = 0;
      v7 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", settingsContainer_containerURL, 1, 0, &v9);
      v6 = v9;
      if ((v7 & 1) == 0)
      {
        fskit_std_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __31__FSSettings_settingsContainer__block_invoke_cold_1((uint64_t)v6, v8);

      }
    }

  }
}

- (NSURL)probeOrderArray
{
  void *v2;
  void *v3;

  -[FSSettings settingsContainer](self, "settingsContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("probeOrder.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)enabledModulesArray
{
  void *v2;
  void *v3;

  -[FSSettings settingsContainer](self, "settingsContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("enabledModules.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

void __31__FSSettings_settingsContainer__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_23B2A6000, a2, OS_LOG_TYPE_ERROR, "Error creating container: %@", (uint8_t *)&v2, 0xCu);
}

@end
