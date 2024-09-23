@implementation CFBundleAllowMixedLocalizations

uint64_t __CFBundleAllowMixedLocalizations_block_invoke()
{
  uint64_t result;

  result = _CFBundleGetInfoDictionaryBoolean(CFSTR("CFBundleAllowMixedLocalizations"));
  CFBundleAllowMixedLocalizations_allowMixed = result;
  return result;
}

@end
