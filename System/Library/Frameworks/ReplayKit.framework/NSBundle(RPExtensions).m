@implementation NSBundle(RPExtensions)

+ (id)_rpLocalizedStringFromFrameworkBundleWithKey:()RPExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "_rpFrameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preferredLanguage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:localization:", v4, 0, CFSTR("Localizable"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(a1, "fallbackLanguage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:localization:", v4, 0, CFSTR("Localizable"), v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(v5, "localizedStringForKey:value:table:", v4, 0, CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

+ (id)preferredLanguage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDD1488];
  objc_msgSend((id)objc_opt_class(), "_rpFrameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredLocalizationsFromArray:forPreferences:", v3, v0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_rpFrameworkBundle
{
  if (_rpFrameworkBundle_onceToken != -1)
    dispatch_once(&_rpFrameworkBundle_onceToken, &__block_literal_global_0);
  return (id)_rpFrameworkBundle_sFrameworkBundle;
}

- (id)_rpLocalizedAppName
{
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD1D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    || (objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD298]),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = v2;
    v4 = v3;
  }
  else
  {
    objc_msgSend(a1, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD280]);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v4 = 0;
  }

  return v3;
}

+ (id)_rpLocalizedAppNameFromBundleID:()RPExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (objc_msgSend(v7, "isEqualToString:", &stru_24D15E550) & 1) == 0
      && !objc_msgSend(v8, "isEqualToString:", CFSTR("$(PRODUCT_BUNDLE_IDENTIFIER)")))
    {
      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "_rpLocalizedAppName");
  v9 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v9;
  if (!v9)
  {
LABEL_10:
    v10 = v3;

    v8 = v10;
    goto LABEL_11;
  }
LABEL_8:
  if ((objc_msgSend(v8, "isEqualToString:", &stru_24D15E550) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("$(PRODUCT_BUNDLE_IDENTIFIER)")))
  {
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

+ (id)fallbackLanguage
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("-"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)baseIdentifier:()RPExtensions
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeLastObject");
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)executablePathWithPID:()RPExtensions
{
  _BYTE buffer[4096];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", buffer, proc_pidpath(pid, buffer, 0x1000u), 4);
}

+ (id)bundleWithPID:()RPExtensions
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(MEMORY[0x24BDD1488], "executablePathWithPID:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!__RPLogLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "+[NSBundle(RPExtensions) bundleWithPID:]";
    v8 = 1024;
    v9 = 115;
    v10 = 2112;
    v11 = v2;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d  executableURL:%@", (uint8_t *)&v6, 0x1Cu);
  }
  if (v2)
  {
    v3 = (void *)_CFBundleCopyBundleURLForExecutableURL();
    if (!__RPLogLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136446722;
      v7 = "+[NSBundle(RPExtensions) bundleWithPID:]";
      v8 = 1024;
      v9 = 119;
      v10 = 2112;
      v11 = v3;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d  bundleURL:%@", (uint8_t *)&v6, 0x1Cu);
    }
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithURL:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
