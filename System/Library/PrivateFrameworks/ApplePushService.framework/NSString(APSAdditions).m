@implementation NSString(APSAdditions)

+ (__CFString)apsStringGUID
{
  const __CFUUID *v0;
  __CFString *v1;

  v0 = CFUUIDCreate(0);
  v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

@end
