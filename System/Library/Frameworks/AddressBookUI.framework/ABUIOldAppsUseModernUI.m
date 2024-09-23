@implementation ABUIOldAppsUseModernUI

uint64_t __ABUIOldAppsUseModernUI_block_invoke()
{
  uint64_t result;
  BOOL v1;
  char v2;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("ABOldAppsUseModernUI"), (CFStringRef)*MEMORY[0x24BDBD568], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  v2 = !v1;
  ABUIOldAppsUseModernUI_enabled = v2;
  return result;
}

@end
