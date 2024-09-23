@implementation IsWorkingInDictionaryApp

__CFBundle *__IsWorkingInDictionaryApp_block_invoke()
{
  __CFBundle *result;
  BOOL v1;

  result = CFBundleGetMainBundle();
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    if (result)
    {
      result = (__CFBundle *)CFStringCompare((CFStringRef)result, CFSTR("com.apple.Dictionary"), 0);
      v1 = result == 0;
    }
    else
    {
      v1 = 0;
    }
    IsWorkingInDictionaryApp__Flag = v1;
  }
  return result;
}

@end
