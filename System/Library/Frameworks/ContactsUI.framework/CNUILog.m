@implementation CNUILog

CFIndex ___CNUILog_block_invoke()
{
  CFIndex result;
  uint64_t v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppIntegerValue(CFSTR("CNUILogLevel"), (CFStringRef)*MEMORY[0x1E0C9B248], &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = result;
  else
    v1 = 0;
  _CNUILog_logsEnabled = v1;
  return result;
}

@end
