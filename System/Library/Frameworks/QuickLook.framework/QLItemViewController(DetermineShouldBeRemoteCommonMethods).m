@implementation QLItemViewController(DetermineShouldBeRemoteCommonMethods)

+ (uint64_t)shouldBeRemoteForMediaContentType:()DetermineShouldBeRemoteCommonMethods
{
  id v3;
  uint64_t v4;

  v3 = a3;
  if (objc_msgSend(MEMORY[0x24BDD1488], "mainBundleSupportsBackgroundAudio")
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("public.3gpp")) & 1) == 0)
  {
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("org.3gpp.adaptive-multi-rate-audio"));
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

@end
