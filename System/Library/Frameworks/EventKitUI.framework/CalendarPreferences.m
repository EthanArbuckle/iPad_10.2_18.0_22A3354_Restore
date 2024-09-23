@implementation CalendarPreferences

void __40__CalendarPreferences_sharedPreferences__block_invoke()
{
  CalendarPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(CalendarPreferences);
  v1 = (void *)sharedPreferences_sharedPreferences;
  sharedPreferences_sharedPreferences = (uint64_t)v0;

}

+ (id)sharedPreferences
{
  if (sharedPreferences_onceToken != -1)
    dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_63);
  return (id)sharedPreferences_sharedPreferences;
}

@end
