@implementation COStateManager(AppleTV)

+ (id)appleTV_COStateManagerWithSuiteName:()AppleTV clusters:homeIdentifier:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "count") == 1 && objc_msgSend(v6, "containsObject:", *MEMORY[0x24BE19C60]))
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19E58]), "initWithSuiteName:clusters:", v5, v6);
    COCoreLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 134217984;
      v11 = v7;
      _os_log_impl(&dword_215E92000, v8, OS_LOG_TYPE_DEFAULT, "Creating an AppleTV COStateManager instance %p", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    COCoreLogForCategory(6);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[COStateManager(AppleTV) appleTV_COStateManagerWithSuiteName:clusters:homeIdentifier:].cold.1((uint64_t)v6, v8);
    v7 = 0;
  }

  return v7;
}

+ (void)appleTV_COStateManagerWithSuiteName:()AppleTV clusters:homeIdentifier:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215E92000, a2, OS_LOG_TYPE_ERROR, "Failed to create an Apple TV COStateManager instance. Invalid clusters provided %@", (uint8_t *)&v2, 0xCu);
}

@end
