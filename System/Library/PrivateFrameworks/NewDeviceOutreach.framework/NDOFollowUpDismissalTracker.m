@implementation NDOFollowUpDismissalTracker

+ (id)_dismissedSerialNumberHashes
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("FollowupDismissedSerialNumberHashes"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x24BDBD1A8];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)uniqueIdentfierForSerialNumber:(id)a3
{
  void *v3;
  __CFString *v4;

  if (a3)
  {
    objc_msgSend(a3, "sha256Hash");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("com.apple.NewDeviceOutreach"), "stringByAppendingFormat:", CFSTR(".%@"), v3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("com.apple.NewDeviceOutreach");
  }
  return v4;
}

+ (void)storeFollowUpDismissalWithDeviceSerial:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136446467;
    v16 = "+[NDOFollowUpDismissalTracker storeFollowUpDismissalWithDeviceSerial:]";
    v17 = 2113;
    v18 = v4;
    _os_log_impl(&dword_22D064000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - Storing follow up dismissal by user %{private}@ ", (uint8_t *)&v15, 0x16u);
  }

  objc_msgSend(a1, "_dismissedSerialNumberHashes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "sha256Hash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("FollowupDismissedSerialNumberHashes"));

  objc_msgSend(v4, "sha256Hash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", CFSTR(".dismissed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v14, v12);

}

+ (void)eraseFollowUpDismissalForDeviceSerial:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _NDOLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136446210;
    v15 = "+[NDOFollowUpDismissalTracker eraseFollowUpDismissalForDeviceSerial:]";
    _os_log_impl(&dword_22D064000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s - Erasing follow up dismissal for device", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(a1, "_dismissedSerialNumberHashes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "sha256Hash");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v8);

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("FollowupDismissedSerialNumberHashes"));

  objc_msgSend(v4, "sha256Hash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "stringByAppendingString:", CFSTR(".dismissed"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v12);

}

+ (void)eraseAllFollowUpDismissals
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _NDOLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446210;
    v5 = "+[NDOFollowUpDismissalTracker eraseAllFollowUpDismissals]";
    _os_log_impl(&dword_22D064000, v2, OS_LOG_TYPE_DEFAULT, "%{public}s - Erasing all follow up dismissals", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("FollowupDismissedSerialNumberHashes"));

}

+ (BOOL)followUpIsDismissedForSerial:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_dismissedSerialNumberHashes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sha256Hash");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  _NDOLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136446466;
    v11 = "+[NDOFollowUpDismissalTracker followUpIsDismissedForSerial:]";
    v12 = 1024;
    v13 = v7;
    _os_log_impl(&dword_22D064000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s - isDismissedByUser: %d", (uint8_t *)&v10, 0x12u);
  }

  return v7;
}

@end
