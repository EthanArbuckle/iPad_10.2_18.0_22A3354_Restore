@implementation ATXModeConfigurationColoringBookLoggingClient

- (void)logColoringBookWasSeenForModeIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(17, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__ATXModeConfigurationColoringBookLoggingClient_logColoringBookWasSeenForModeIdentifier___block_invoke;
  block[3] = &unk_1E4D57590;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __89__ATXModeConfigurationColoringBookLoggingClient_logColoringBookWasSeenForModeIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v2 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v3 = (void *)objc_msgSend(v2, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
  v4 = *MEMORY[0x1E0CF95C0];
  v10 = v3;
  objc_msgSend(v3, "dictionaryForKey:", *MEMORY[0x1E0CF95C0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = (id)objc_opt_new();
  v9 = v8;

  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *(_QWORD *)(a1 + 32));
  objc_msgSend(v10, "setObject:forKey:", v9, v4);

}

@end
