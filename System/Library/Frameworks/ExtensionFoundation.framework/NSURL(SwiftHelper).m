@implementation NSURL(SwiftHelper)

- (CFURLRef)_EX_URLForBundleExecutable
{
  __CFBundle *Unique;
  __CFBundle *v1;
  CFURLRef v2;

  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (Unique)
  {
    v1 = Unique;
    v2 = CFBundleCopyExecutableURL(Unique);
    CFRelease(v1);
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end
