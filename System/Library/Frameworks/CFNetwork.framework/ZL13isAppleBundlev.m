@implementation ZL13isAppleBundlev

const __CFString *___ZL13isAppleBundlev_block_invoke()
{
  __CFBundle *MainBundle;
  const __CFString *result;
  uint64_t v2;

  MainBundle = CFBundleGetMainBundle();
  result = CFBundleGetIdentifier(MainBundle);
  v2 = (uint64_t)result;
  if (!result)
  {
    isAppleBundle(void)::_isAppleBundle = 1;
    goto LABEL_5;
  }
  result = (const __CFString *)CFStringHasPrefix(result, CFSTR("com.apple."));
  isAppleBundle(void)::_isAppleBundle = (_DWORD)result != 0;
  if ((_DWORD)result)
LABEL_5:
    appleBundleID = v2;
  return result;
}

@end
