@implementation CFPrefsCopyDefaultPreferences

_CFXPreferencesHandle *___CFPrefsCopyDefaultPreferences_block_invoke()
{
  _CFXPreferencesHandle *result;

  result = objc_alloc_init(_CFXPreferencesHandle);
  _CFPrefsCopyDefaultPreferences_defaultPrefs = (uint64_t)result;
  return result;
}

@end
