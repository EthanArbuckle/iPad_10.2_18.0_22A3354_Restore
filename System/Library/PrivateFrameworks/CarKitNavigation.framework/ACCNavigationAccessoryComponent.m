@implementation ACCNavigationAccessoryComponent

void __62__ACCNavigationAccessoryComponent_CarPlay__CP_ignoreMaxLength__block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForKey:", CFSTR("CPACCNavIgnoreMaxLengths"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    CP_ignoreMaxLength_ignoreMaxLength = objc_msgSend(v1, "BOOLValue");
    CarNavLogging();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      if (CP_ignoreMaxLength_ignoreMaxLength)
        v3 = CFSTR("YES");
      else
        v3 = CFSTR("NO");
      v4 = 138543362;
      v5 = v3;
      _os_log_impl(&dword_23785A000, v2, OS_LOG_TYPE_DEFAULT, "ignoreMaxLength set to %{public}@", (uint8_t *)&v4, 0xCu);
    }

  }
}

@end
