@implementation MAPreferencesIsVerboseLoggingEnabled

void ___MAPreferencesIsVerboseLoggingEnabled_block_invoke()
{
  char AppBooleanValue;
  char v1;

  if (_MAPreferencesIsInternalAllowed_onceToken != -1)
    dispatch_once(&_MAPreferencesIsInternalAllowed_onceToken, &__block_literal_global_758);
  if (_MAPreferencesIsInternalAllowed__isAppleInternal)
  {
    v1 = 0;
    AppBooleanValue = _MAPreferencesGetAppBooleanValue(CFSTR("EnableVerboseLogging"), &v1);
    if (v1)
      _MAPreferencesIsVerboseLoggingEnabled__verboseLoggingEnabled = AppBooleanValue;
  }
}

@end
