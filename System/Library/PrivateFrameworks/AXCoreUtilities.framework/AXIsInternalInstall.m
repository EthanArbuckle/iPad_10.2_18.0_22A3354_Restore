@implementation AXIsInternalInstall

void __AXIsInternalInstall_block_invoke()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID())
      AXIsInternalInstall__AXIsInternalInstall = CFBooleanGetValue(v1) != 0;
    CFRelease(v1);
  }
}

@end
