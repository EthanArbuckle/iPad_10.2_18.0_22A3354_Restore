@implementation MPCMediaExperienceUtilities

+ (BOOL)requestBackgroundPlaybackInitiation
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  MPUIApplication();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "applicationState");

  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BE647E8];
    v13 = 0;
    v8 = objc_msgSend(v6, "setAttribute:forKey:error:", v5, v7, &v13);
    v9 = v13;

    if (v8)
      v10 = v9 == 0;
    else
      v10 = 0;
    if (!v10)
    {
      v11 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v15 = v5;
        v16 = 2112;
        v17 = v9;
        _os_log_impl(&dword_210BD8000, v11, OS_LOG_TYPE_ERROR, "Error temporarily blessing %@ for playback initialization. %@", buf, 0x16u);
      }

    }
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

@end
