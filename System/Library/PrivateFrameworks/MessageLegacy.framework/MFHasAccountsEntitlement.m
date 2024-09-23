@implementation MFHasAccountsEntitlement

__SecTask *__MFHasAccountsEntitlement_block_invoke()
{
  __SecTask *result;
  __SecTask *v1;
  CFDictionaryRef v2;
  void *v3;

  result = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (result)
  {
    v1 = result;
    v2 = SecTaskCopyValuesForEntitlements(result, (CFArrayRef)&unk_1E81EA208, 0);
    v3 = (id)CFMakeCollectable(v2);
    CFRelease(v1);
    result = (__SecTask *)objc_msgSend(v3, "count");
    MFHasAccountsEntitlement___hasAccountsEntitlement = result != 0;
  }
  return result;
}

@end
