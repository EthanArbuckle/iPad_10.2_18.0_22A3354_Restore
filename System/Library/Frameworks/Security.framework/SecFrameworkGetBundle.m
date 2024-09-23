@implementation SecFrameworkGetBundle

void __SecFrameworkGetBundle_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  const __CFURL *v3;
  const __CFURL *v4;

  CFRetain(CFSTR("/System/Library/Frameworks/Security.framework"));
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("/System/Library/Frameworks/Security.framework"), kCFURLPOSIXPathStyle, 1u);
  if (v3)
  {
    v4 = v3;
    **(_QWORD **)(a1 + 32) = CFBundleCreate(v2, v3);
    CFRelease(v4);
  }
  else
  {
    **(_QWORD **)(a1 + 32) = 0;
  }
  CFRelease(CFSTR("/System/Library/Frameworks/Security.framework"));
}

@end
