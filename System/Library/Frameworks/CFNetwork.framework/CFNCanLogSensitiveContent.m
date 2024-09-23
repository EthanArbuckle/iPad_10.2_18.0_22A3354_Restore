@implementation CFNCanLogSensitiveContent

void ____CFNCanLogSensitiveContent_block_invoke()
{
  BOOL v0;

  if (__CFNIsInDevelopmentEnvironment::onceToken != -1)
    dispatch_once(&__CFNIsInDevelopmentEnvironment::onceToken, &__block_literal_global_21_4777);
  if (__CFNIsInDevelopmentEnvironment::ok)
    v0 = 1;
  else
    v0 = CFPreferencesAppValueIsForced(CFSTR("AppleCFNetworkDiagnosticLogging"), CFSTR("Apple Global Domain")) != 0;
  __CFNCanLogSensitiveContent::ok = v0;
}

@end
