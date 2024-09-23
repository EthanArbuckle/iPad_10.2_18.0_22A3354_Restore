@implementation UTType

void __70__UTType_FPCaching__fp_cachedTypeWithIdentifier_alreadyAvailableType___block_invoke()
{
  const __CFAllocator *Default;
  __SecTask *v1;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  uint64_t v5;
  void *v6;

  Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.private.coreservices.canmaplsdatabase"), 0);
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CFBooleanGetTypeID())
      fp_cachedTypeWithIdentifier_alreadyAvailableType__hasFastSequenceNumber = CFBooleanGetValue(v3) != 0;
    CFRelease(v3);
  }
  CFRelease(v1);
  v5 = objc_opt_new();
  v6 = (void *)fp_cachedTypeWithIdentifier_alreadyAvailableType__cache;
  fp_cachedTypeWithIdentifier_alreadyAvailableType__cache = v5;

}

@end
