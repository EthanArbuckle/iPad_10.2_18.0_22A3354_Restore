@implementation AVOutputContextIsSystemContextAllowed

void __AVOutputContextIsSystemContextAllowed_block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.avfoundation.allow-system-wide-context"), 0);
    if (v2)
    {
      v3 = v2;
      v4 = CFGetTypeID(v2);
      if (v4 == CFBooleanGetTypeID())
        AVOutputContextIsSystemContextAllowed_isAllowed = CFBooleanGetValue(v3) != 0;
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

@end
