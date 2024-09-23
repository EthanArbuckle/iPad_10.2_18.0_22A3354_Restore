@implementation CMPhotoSupportsHEVCHWEncode

void __CMPhotoSupportsHEVCHWEncode_block_invoke()
{
  void *v0;
  CFDictionaryRef v1;
  CFDictionaryRef v2;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v0 = (void *)*MEMORY[0x1E0CEDD20];
  values = (void *)*MEMORY[0x1E0C9AE50];
  keys[0] = v0;
  v1 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v1)
  {
    v2 = v1;
    CMPhotoSupportsHEVCHWEncode_hwSupported = VTSelectAndCreateVideoEncoderInstance() == 0;
    CFRelease(v2);
  }
}

@end
