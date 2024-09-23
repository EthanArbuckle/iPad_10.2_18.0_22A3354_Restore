@implementation CBPreferencesSettingsProvider

+ (CBPreferencesSettingsProvider)sharedInstance
{
  CBPreferencesSettingsProvider *v3;

  objc_sync_enter(a1);
  if (sharedInstance_onceToken_6 != -1)
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_16);
  v3 = (CBPreferencesSettingsProvider *)sharedInstance__sharedObject_6;
  objc_sync_exit(a1);
  return v3;
}

CBPreferencesSettingsProvider *__47__CBPreferencesSettingsProvider_sharedInstance__block_invoke()
{
  CBPreferencesSettingsProvider *result;

  result = objc_alloc_init(CBPreferencesSettingsProvider);
  sharedInstance__sharedObject_6 = (uint64_t)result;
  return result;
}

- (BOOL)specifiesAABCurveUpdateStrategy
{
  CFStringRef *v3;
  id v4;

  v3 = (CFStringRef *)MEMORY[0x1E0C9B260];
  CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = (id)CFPreferencesCopyValue(CFSTR("CBAABCurveUpdateStrategyType"), CFSTR("com.apple.CoreBrightness"), *v3, (CFStringRef)*MEMORY[0x1E0C9B250]);
  if (!v4)
    return 0;

  return 1;
}

- (unint64_t)aabUpdateStrategyType
{
  CFStringRef *v3;
  id v4;
  unint64_t v5;

  v5 = 2;
  v3 = (CFStringRef *)MEMORY[0x1E0C9B260];
  CFPreferencesSynchronize(CFSTR("com.apple.CoreBrightness"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v4 = (id)CFPreferencesCopyValue(CFSTR("CBAABCurveUpdateStrategyType"), CFSTR("com.apple.CoreBrightness"), *v3, (CFStringRef)*MEMORY[0x1E0C9B250]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = (int)objc_msgSend(v4, "intValue");

  return v5;
}

@end
