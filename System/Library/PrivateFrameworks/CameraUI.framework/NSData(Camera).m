@implementation NSData(Camera)

+ (id)dataWithIOSurface:()Camera usedSize:
{
  void *v4;

  v4 = 0;
  if (buffer && a4)
  {
    if (IOSurfaceGetAllocSize(buffer) < a4 || IOSurfaceLock(buffer, 1u, 0))
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", IOSurfaceGetBaseAddress(buffer), a4);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      IOSurfaceUnlock(buffer, 1u, 0);
    }
  }
  return v4;
}

@end
