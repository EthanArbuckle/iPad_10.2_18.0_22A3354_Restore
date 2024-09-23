@implementation AVAudioSession(Announce)

+ (id)an_category
{
  return (id)*MEMORY[0x24BDB15A0];
}

+ (id)an_mode
{
  return (id)*MEMORY[0x24BDB1648];
}

+ (uint64_t)an_categoryOptions
{
  void *v0;
  int v1;

  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "an_isCarPlayConnected");

  if (v1)
    return 12;
  else
    return 31;
}

- (uint64_t)an_configureWithError:()Announce
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDB1858], "an_category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDB1858], "an_mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(MEMORY[0x24BDB1858], "an_categoryOptions");
  ANLogHandleAudioSession();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138413058;
    v13 = &stru_24D370F00;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v9;
    _os_log_impl(&dword_2156FF000, v8, OS_LOG_TYPE_DEFAULT, "%@Category: %@, Mode: %@, Options: %@", (uint8_t *)&v12, 0x2Au);

  }
  v10 = objc_msgSend(a1, "setCategory:mode:options:error:", v5, v6, v7, a3);

  return v10;
}

- (uint64_t)an_configureForEndpointWithError:()Announce
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = (id)*MEMORY[0x24BDB15A8];
  objc_msgSend(MEMORY[0x24BDB1858], "an_mode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ANLogHandleAudioSession();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = &stru_24D370F00;
    v13 = 2112;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_2156FF000, v7, OS_LOG_TYPE_DEFAULT, "%@Category: %@, Mode: %@, Options: %@", (uint8_t *)&v11, 0x2Au);

  }
  v9 = objc_msgSend(a1, "setCategory:mode:options:error:", v5, v6, 19, a3);

  return v9;
}

@end
