@implementation CFNIsInDevelopmentEnvironment

void ____CFNIsInDevelopmentEnvironment_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeRef v2;

  __CFNIsInDevelopmentEnvironment::ok = os_variant_allows_internal_security_policies();
  if ((__CFNIsInDevelopmentEnvironment::ok & 1) == 0)
  {
    v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    if (v0)
    {
      v1 = v0;
      v2 = SecTaskCopyValueForEntitlement(v0, CFSTR("get-task-allow"), 0);
      if (v2)
      {
        __CFNIsInDevelopmentEnvironment::ok = v2 == (CFTypeRef)*MEMORY[0x1E0C9AE50];
      }
      else
      {
        v2 = SecTaskCopyValueForEntitlement(v1, CFSTR("com.apple.security.get-task-allow"), 0);
        __CFNIsInDevelopmentEnvironment::ok = v2 == (CFTypeRef)*MEMORY[0x1E0C9AE50];
        if (!v2)
        {
LABEL_8:
          CFRelease(v1);
          return;
        }
      }
      CFRelease(v2);
      goto LABEL_8;
    }
  }
}

@end
