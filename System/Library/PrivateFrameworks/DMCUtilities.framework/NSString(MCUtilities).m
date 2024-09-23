@implementation NSString(MCUtilities)

+ (__CFString)DMCMakeUUID
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

- (id)DMCAppendGreenteaSuffix
{
  id v2;

  if ((DMCIsGreenTea() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_CH"), a1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

@end
