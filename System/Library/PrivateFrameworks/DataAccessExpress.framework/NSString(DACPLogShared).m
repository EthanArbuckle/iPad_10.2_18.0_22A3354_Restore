@implementation NSString(DACPLogShared)

+ (__CFString)DACPLogMakeUUID
{
  const __CFAllocator *v0;
  const __CFUUID *v1;
  __CFString *v2;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

@end
