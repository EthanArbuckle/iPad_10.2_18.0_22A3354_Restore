@implementation MIBUDefaultPreferences

+ (BOOL)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (MIBUOnceToken != -1)
    dispatch_once(&MIBUOnceToken, &__block_literal_global_0);
  v7 = MIBUConnObj;
  if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "+[MIBUDefaultPreferences setObject:forKey:]";
    v14 = 2114;
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_222C3F000, v7, OS_LOG_TYPE_DEFAULT, "%s - Setting %{public}@ for key %{public}@", (uint8_t *)&v12, 0x20u);
  }
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v5, v6);
  v9 = objc_msgSend(v8, "synchronize");
  if ((v9 & 1) == 0)
  {
    if (MIBUOnceToken != -1)
      dispatch_once(&MIBUOnceToken, &__block_literal_global_4_0);
    v10 = MIBUConnObj;
    if (os_log_type_enabled((os_log_t)MIBUConnObj, OS_LOG_TYPE_ERROR))
      +[MIBUDefaultPreferences setObject:forKey:].cold.1((uint64_t)v5, (uint64_t)v6, v10);
  }

  return v9;
}

void __43__MIBUDefaultPreferences_setObject_forKey___block_invoke()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_3()
{
  os_log_t v0;
  void *v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = os_log_create("com.apple.mobileinboxupdater", "device");
  v1 = (void *)MIBUConnObj;
  MIBUConnObj = (uint64_t)v0;

  if (!MIBUConnObj)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

+ (id)objectForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCF50];
  v4 = a3;
  objc_msgSend(v3, "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)removeObjectForKey:(id)a3
{
  return objc_msgSend(a1, "setObject:forKey:", 0, a3);
}

+ (id)dictionaryRepresentation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (void)setObject:(os_log_t)log forKey:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "+[MIBUDefaultPreferences setObject:forKey:]";
  v5 = 2114;
  v6 = a1;
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl(&dword_222C3F000, log, OS_LOG_TYPE_ERROR, "%s - Failed to set value %{public}@ for key %{public}@", (uint8_t *)&v3, 0x20u);
}

void __43__MIBUDefaultPreferences_setObject_forKey___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_222C3F000, MEMORY[0x24BDACB70], a3, "Couldn't create os_log_t", a5, a6, a7, a8, 0);
}

@end
