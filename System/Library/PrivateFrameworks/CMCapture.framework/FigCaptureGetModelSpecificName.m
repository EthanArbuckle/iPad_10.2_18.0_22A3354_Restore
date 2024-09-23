@implementation FigCaptureGetModelSpecificName

void __FigCaptureGetModelSpecificName_block_invoke()
{
  const __CFAllocator *v0;
  __CFString *Mutable;
  const __CFString *v2;
  CFIndex Length;
  CFIndex v4;
  CFRange v5;
  void *v6;
  size_t v7;
  char cStr[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  *(_OWORD *)cStr = 0u;
  v9 = 0u;
  v7 = 64;
  sysctlbyname("hw.model", cStr, &v7, 0, 0);
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (Mutable)
  {
    v2 = Mutable;
    CFStringAppendCString(Mutable, cStr, 0);
    Length = CFStringGetLength(v2);
    if (CFStringHasSuffix(v2, CFSTR("AP")))
      v4 = Length - 2;
    else
      v4 = 0;
    if (CFStringHasSuffix(v2, CFSTR("DEV")))
      v5.length = Length - 3;
    else
      v5.length = v4;
    if (v5.length < 1)
    {
      v6 = (void *)CFRetain(v2);
    }
    else
    {
      v5.location = 0;
      v6 = (void *)CFStringCreateWithSubstring(v0, v2, v5);
    }
    FigCaptureGetModelSpecificName_sModelNameStr = (uint64_t)v6;
    CFRelease(v2);
  }
  if (!FigCaptureGetModelSpecificName_sModelNameStr)
    FigCaptureGetModelSpecificName_sModelNameStr = (uint64_t)CFSTR("N51");
}

@end
