@implementation WriteMMappedImage

void ___WriteMMappedImage_block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  id v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[4];
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _BridgeIconCachePath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v2 = objc_msgSend(v0, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 0, 0, &v7);
  v3 = v7;

  if (v2)
    v4 = v3 == 0;
  else
    v4 = 0;
  if (!v4)
  {
    bps_utility_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      _BridgeIconCachePath();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_21147E000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create (%@) dir: %@", buf, 0x16u);

    }
  }

}

void ___WriteMMappedImage_block_invoke_108(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  _CachePathForIcon(*(void **)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "writeToCPBitmapFile:flags:", v2, 0);

}

@end
