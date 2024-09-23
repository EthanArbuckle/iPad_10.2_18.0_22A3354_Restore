@implementation MSDSetupUILocalization

+ (id)localizedStringForKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = a3;
  objc_msgSend(v4, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/MobileStoreDemoSetupUI.framework"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_24F47DB30, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedStringWithFormat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)localizedStringForKey:(id)a3 withStringArgument:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;

  v5 = a4;
  +[MSDSetupUILocalization localizedStringForKey:](MSDSetupUILocalization, "localizedStringForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v6, CFSTR("%@"), &v11, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (!v7)
  {
    defaultLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[MSDSetupUILocalization localizedStringForKey:withStringArgument:].cold.1((uint64_t)v6, v8, v9);

  }
  return v7;
}

+ (void)localizedStringForKey:(NSObject *)a3 withStringArgument:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = a1;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_22A6E6000, a3, OS_LOG_TYPE_ERROR, "Failed to validate localized format string %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
