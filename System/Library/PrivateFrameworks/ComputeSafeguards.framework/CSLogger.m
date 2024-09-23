@implementation CSLogger

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_4);
}

void __22__CSLogger_initialize__block_invoke()
{
  os_log_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = os_log_create("com.apple.computesafeguards", "default");
  v1 = (void *)csLog;
  csLog = (uint64_t)v0;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)logCategories;
  logCategories = v2;

  lock = 0;
}

+ (id)defaultCategory
{
  return (id)csLog;
}

+ (id)logForCategory:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&lock);
  objc_msgSend((id)logCategories, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = os_log_create("com.apple.computesafeguards", (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
  objc_msgSend((id)logCategories, "setObject:forKeyedSubscript:", v4, v3);
  os_unfair_lock_unlock((os_unfair_lock_t)&lock);

  return v4;
}

@end
