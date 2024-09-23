@implementation CADeviceIsAppleBundle

const __CFString *__CADeviceIsAppleBundle_block_invoke()
{
  __CFBundle *MainBundle;
  const __CFString *result;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  if (result)
  {
    result = (const __CFString *)CFStringHasPrefix(result, CFSTR("com.apple."));
    CADeviceIsAppleBundle::apple_bundle = (_DWORD)result != 0;
  }
  return result;
}

@end
