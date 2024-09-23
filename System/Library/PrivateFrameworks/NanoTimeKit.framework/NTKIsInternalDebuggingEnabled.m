@implementation NTKIsInternalDebuggingEnabled

uint64_t __NTKIsInternalDebuggingEnabled_block_invoke()
{
  uint64_t result;
  BOOL v1;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("NTKFaceInternalDebuggingEnabled"), CFSTR("com.apple.NanoTimeKit.face"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v1 = (_DWORD)result == 0;
  else
    v1 = 1;
  if (!v1)
    NTKIsInternalDebuggingEnabled_isEnabled = 1;
  return result;
}

@end
