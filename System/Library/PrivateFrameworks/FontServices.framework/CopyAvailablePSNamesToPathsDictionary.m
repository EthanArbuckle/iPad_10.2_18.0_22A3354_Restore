@implementation CopyAvailablePSNamesToPathsDictionary

void __CopyAvailablePSNamesToPathsDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  const __CFString *v5;
  __CFString *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  v6 = (__CFString *)v5;
  if (v5
    && CFStringCompare(v5, CFSTR("/System/Library/PrivateFrameworks/FontServices.framework/CorePrivate/PingFangUI.ttc"), 0) == kCFCompareEqualTo&& (objc_msgSend(v7, "hasPrefix:", CFSTR(".")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v7);
  }

}

@end
