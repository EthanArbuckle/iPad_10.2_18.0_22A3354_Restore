@implementation HMAccessory(Announce)

- (id)an_announceSettingFromAccessorySettings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "settings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groups");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_29);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "settings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "na_firstObjectPassingTest:", &__block_literal_global_8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    if (ANLogHandleAccessory_Announce_once != -1)
      dispatch_once(&ANLogHandleAccessory_Announce_once, &__block_literal_global_11_0);
    v9 = (id)ANLogHandleAccessory_Announce_logger;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412546;
      v12 = &stru_1E93913D0;
      v13 = 2112;
      v14 = a1;
      _os_log_impl(&dword_1D23A0000, v9, OS_LOG_TYPE_ERROR, "%@Failed to find Announce Setting Group in Accessory Settings %@", (uint8_t *)&v11, 0x16u);
    }

    v8 = 0;
  }

  return v8;
}

@end
