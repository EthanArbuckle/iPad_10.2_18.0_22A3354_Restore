@implementation CMPhotoIsTileDecoderAvailable

void __CMPhotoIsTileDecoderAvailable_block_invoke_2()
{
  sTileDecodersAvailable_1 = 1;
}

void __CMPhotoIsTileDecoderAvailable_block_invoke(uint64_t a1)
{
  CMVideoCodecType v1;
  const __CFAllocator *v2;
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  BOOL v5;
  CFTypeRef cf;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 32);
  cf = 0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  keys[0] = *(void **)MEMORY[0x1E0CEDCA0];
  values = (void *)*MEMORY[0x1E0C9AE50];
  v3 = CFDictionaryCreate(v2, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_9;
  }
  v4 = v3;
  if (v1 == 1635135537 || v1 == 1752589105 || v1 == 1635148593)
  {
    if (!FigVideoFormatDescriptionCreateWithSampleDescriptionExtensionAtom())
    {
LABEL_6:
      v5 = VTTileDecompressionSessionCreate() == 0;
      goto LABEL_7;
    }
  }
  else if (!CMVideoFormatDescriptionCreate(v2, v1, 1024, 1024, 0, (CMVideoFormatDescriptionRef *)&cf))
  {
    goto LABEL_6;
  }
  v5 = 0;
LABEL_7:
  CFRelease(v4);
  if (cf)
    CFRelease(cf);
LABEL_9:
  sTileDecodersAvailable_0 = v5;
}

void __CMPhotoIsTileDecoderAvailable_block_invoke_3()
{
  sTileDecodersAvailable_2 = 1;
}

@end
