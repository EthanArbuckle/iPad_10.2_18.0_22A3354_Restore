@implementation NSString(DAKeychainAdditions)

- (__CFString)stringByURLQuoting
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  v2 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, originalString, &stru_1E7B93480, CFSTR("?"), 0x8000100u);
  v3 = v2;
  if (!v2)
    v2 = originalString;
  v4 = v2;

  return v4;
}

@end
