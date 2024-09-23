@implementation CFBundleFollowParentLocalization

__CFBundle *__CFBundleFollowParentLocalization_block_invoke()
{
  __CFBundle *result;

  result = (__CFBundle *)_CFBundleGetInfoDictionaryBoolean(CFSTR("CFBundleFollowParentLocalization"));
  if ((_DWORD)result
    || (result = CFBundleGetMainBundle()) != 0
    && (result = CFBundleGetInfoDictionary(result)) != 0
    && (result = (__CFBundle *)CFDictionaryGetValue(result, CFSTR("NSExtension"))) != 0)
  {
    CFBundleFollowParentLocalization_followParent = 1;
  }
  return result;
}

@end
