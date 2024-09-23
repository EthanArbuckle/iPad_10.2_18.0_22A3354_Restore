@implementation VNIOSurfaceBackedPixelBufferAttributes

void __VNIOSurfaceBackedPixelBufferAttributes_block_invoke()
{
  const __CFAllocator *v0;
  const CFDictionaryKeyCallBacks *v1;
  const CFDictionaryValueCallBacks *v2;
  CFDictionaryRef v3;
  void *v4;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v2 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  v3 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v4 = (void *)*MEMORY[0x1E0CA8FF0];
  values = v3;
  keys[0] = v4;
  VNIOSurfaceBackedPixelBufferAttributes::pixelBufferAttributes = (uint64_t)CFDictionaryCreate(v0, (const void **)keys, (const void **)&values, 1, v1, v2);
  if (v3)
    CFRelease(v3);
}

@end
