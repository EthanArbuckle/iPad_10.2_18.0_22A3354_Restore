@implementation NSKeyedUnarchiver(SYAdditions)

+ (id)sy_whitelistedClasses
{
  if (sy_whitelistedClasses_onceToken != -1)
    dispatch_once(&sy_whitelistedClasses_onceToken, &__block_literal_global_9);
  return (id)sy_whitelistedClasses_supportedClasses;
}

+ (id)sy_unarchivedObjectFromData:()SYAdditions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = (void *)MEMORY[0x24BDD1620];
    v4 = a3;
    objc_msgSend((id)objc_opt_class(), "sy_whitelistedClasses");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClasses:fromData:error:", v5, v4, &v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v10;
    if (v7)
    {
      if (_sync_log_facilities_pred != -1)
        _os_once();
      v8 = _sync_log_facilities;
      if (os_log_type_enabled((os_log_t)_sync_log_facilities, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v12 = v7;
        _os_log_impl(&dword_211704000, v8, OS_LOG_TYPE_DEFAULT, "Failed to unarchive object. %{public}@", buf, 0xCu);
      }
    }

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
