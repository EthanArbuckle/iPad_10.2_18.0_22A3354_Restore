@implementation AVCaptureClientHasEntitlement

void __AVCaptureClientHasEntitlement_block_invoke(uint64_t a1)
{
  __SecTask *v2;
  __SecTask *v3;
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;

  v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v2)
  {
    v3 = v2;
    v4 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v2, *(CFStringRef *)(a1 + 32), 0);
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      if (v6 == CFBooleanGetTypeID())
        **(_BYTE **)(a1 + 40) = CFBooleanGetValue(v5) != 0;
      CFRelease(v5);
    }
    CFRelease(v3);
  }
}

@end
