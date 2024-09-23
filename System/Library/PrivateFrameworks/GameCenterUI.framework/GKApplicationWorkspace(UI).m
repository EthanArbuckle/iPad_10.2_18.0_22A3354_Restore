@implementation GKApplicationWorkspace(UI)

- (uint64_t)applicationIsInstalled:()UI
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CA5878];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applicationIsInstalled:", v4);

  return v6;
}

- (void)openGameCenterSettings
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "cannot openGameCenterSettings because of error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)openURL:()UI
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v10 = *MEMORY[0x1E0D22D88];
  v11[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v3, v4, &v9);
  v6 = v9;

  if (v6)
  {
    if (!*MEMORY[0x1E0D25460])
      v7 = (id)GKOSLoggers();
    v8 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      -[GKApplicationWorkspace(UI) openURL:].cold.1((uint64_t)v3, (uint64_t)v6, v8);
  }

}

- (void)openURL:()UI .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "cannot openURL: %@, because of error: %@", (uint8_t *)&v3, 0x16u);
}

@end
