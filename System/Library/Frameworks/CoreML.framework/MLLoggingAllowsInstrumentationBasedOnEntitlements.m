@implementation MLLoggingAllowsInstrumentationBasedOnEntitlements

void __MLLoggingAllowsInstrumentationBasedOnEntitlements_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeRef v2;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    v2 = SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.private.coreml.tracing-allowed"), 0);
    MLLoggingAllowsInstrumentationBasedOnEntitlements_allowed = v2 == (CFTypeRef)*MEMORY[0x1E0C9AE50];
    if (v2)
      CFRelease(v2);
    CFRelease(v1);
  }
}

@end
