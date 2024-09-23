@implementation CalCFPreferencesStore

+ (id)shared
{
  if (shared_onceToken_0 != -1)
    dispatch_once(&shared_onceToken_0, &__block_literal_global_118);
  return (id)shared_store;
}

void __31__CalCFPreferencesStore_shared__block_invoke()
{
  CalCFPreferencesStore *v0;
  void *v1;

  v0 = objc_alloc_init(CalCFPreferencesStore);
  v1 = (void *)shared_store;
  shared_store = (uint64_t)v0;

}

- (BOOL)getBoolean:(BOOL *)a3 forDomain:(id)a4 key:(id)a5
{
  int AppBooleanValue;
  int v7;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a5, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  v7 = keyExistsAndHasValidFormat;
  if (keyExistsAndHasValidFormat)
    *a3 = AppBooleanValue != 0;
  return v7 != 0;
}

- (BOOL)getInteger:(int64_t *)a3 forDomain:(id)a4 key:(id)a5
{
  CFIndex AppIntegerValue;
  int v7;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue((CFStringRef)a5, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  v7 = keyExistsAndHasValidFormat;
  if (keyExistsAndHasValidFormat)
    *a3 = AppIntegerValue;
  return v7 != 0;
}

- (BOOL)getValue:(id *)a3 forDomain:(id)a4 key:(id)a5
{
  void *v6;
  void *v7;

  v6 = (void *)CFPreferencesCopyAppValue((CFStringRef)a5, (CFStringRef)a4);
  v7 = v6;
  if (v6)
    *a3 = objc_retainAutorelease(v6);

  return v7 != 0;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a5, a3, (CFStringRef)a4);
}

- (void)synchronizeDomain:(id)a3
{
  CFPreferencesAppSynchronize((CFStringRef)a3);
}

@end
