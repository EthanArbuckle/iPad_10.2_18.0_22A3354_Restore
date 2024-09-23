@implementation MFHasAccountsEntitlement

void __MFHasAccountsEntitlement_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFDictionaryRef v2;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    v2 = SecTaskCopyValuesForEntitlements(v0, (CFArrayRef)&unk_1E4F699E8, 0);
    CFRelease(v1);
    MFHasAccountsEntitlement___hasAccountsEntitlement = -[__CFDictionary count](v2, "count") != 0;

  }
}

@end
