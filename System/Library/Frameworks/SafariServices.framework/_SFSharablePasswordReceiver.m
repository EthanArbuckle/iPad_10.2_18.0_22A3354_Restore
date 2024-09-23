@implementation _SFSharablePasswordReceiver

+ (void)openPasswordManagerURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0CA5878];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v6 = objc_msgSend(v5, "openSensitiveURL:withOptions:error:", v4, 0, &v9);

  v7 = v9;
  if ((v6 & 1) == 0)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswordSharing();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[_SFSharablePasswordReceiver openPasswordManagerURL:].cold.1(v8, v7);
  }

}

+ (void)openPasswordManagerURL:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to open to password manager URL with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
