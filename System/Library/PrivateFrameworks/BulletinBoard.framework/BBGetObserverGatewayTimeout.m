@implementation BBGetObserverGatewayTimeout

void __BBGetObserverGatewayTimeout_block_invoke()
{
  CFIndex AppIntegerValue;
  BOOL v1;
  uint64_t v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("BBObserverGatewayTimeout"), CFSTR("com.apple.bulletinboard"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = AppIntegerValue < 1;
  else
    v1 = 1;
  if (!v1)
  {
    v2 = AppIntegerValue;
    NSLog(CFSTR("BulletinBoard: Setting observer gateway timeout to %ld seconds"), AppIntegerValue);
    BBGetObserverGatewayTimeout___BBObserverGatewayTimeout = v2;
  }
}

@end
