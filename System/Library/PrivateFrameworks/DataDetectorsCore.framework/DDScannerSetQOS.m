@implementation DDScannerSetQOS

__CFBundle *__DDScannerSetQOS_block_invoke()
{
  __CFBundle *result;

  result = CFBundleGetMainBundle();
  if (result)
  {
    result = (__CFBundle *)CFBundleGetIdentifier(result);
    if (result)
    {
      result = (__CFBundle *)CFStringHasPrefix((CFStringRef)result, CFSTR("com.apple.WebKit.WebContent"));
      DDScannerSetQOS_inWebProcess = (char)result;
    }
  }
  return result;
}

@end
