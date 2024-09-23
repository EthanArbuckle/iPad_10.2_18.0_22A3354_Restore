@implementation CPCGDestinationKTXBlockSetup

uint64_t ____CPCGDestinationKTXBlockSetup_block_invoke(_QWORD *a1, int a2, CFErrorRef *a3)
{
  const void *v6;
  const void *v7;
  CGImageDestination *v8;
  uint64_t v9;
  CFIndex v10;
  const __CFString *v11;
  char *v12;
  CFErrorRef *v13;
  int v14;
  void *v15;

  CGColorSpaceRelease(*(CGColorSpaceRef *)(*(_QWORD *)(a1[4] + 8) + 24));
  v6 = *(const void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v6)
    CFRelease(v6);
  v7 = *(const void **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v7)
    CFRelease(v7);
  v8 = *(CGImageDestination **)(*(_QWORD *)(a1[7] + 8) + 24);
  if (!v8)
  {
    v14 = 0;
    goto LABEL_16;
  }
  if (a2)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
    if (v9)
    {
      v10 = *(int *)(v9 + 8);
      if ((_DWORD)v10)
      {
        v11 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
        v12 = "Could not write ATX/KTX to disk";
        v13 = a3;
LABEL_14:
        __CPBitmapSetErrorIfNecessary(v13, v11, v10, v12);
        v14 = 1;
        goto LABEL_15;
      }
    }
    if (!CGImageDestinationFinalize(v8))
    {
      v11 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v12 = "ImageIO failed to write the image";
      v13 = a3;
      v10 = 5;
      goto LABEL_14;
    }
  }
  v14 = 0;
LABEL_15:
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1[7] + 8) + 24));
LABEL_16:
  CGDataConsumerRelease(*(CGDataConsumerRef *)(*(_QWORD *)(a1[9] + 8) + 24));
  v15 = *(void **)(*(_QWORD *)(a1[8] + 8) + 24);
  if (v15)
    free(v15);
  return v14 ^ 1u;
}

uint64_t ____CPCGDestinationKTXBlockSetup_block_invoke_2(uint64_t a1, int a2, CGImageRef image, CFErrorRef *a4)
{
  if (*(_BYTE *)(a1 + 56) && (CGImageGetColorSpace(image), (CGColorSpaceEqualToColorSpace() & 1) == 0))
  {
    if (a4)
      __CPBitmapSetErrorIfNecessary(a4, CFSTR("CPBitmapErrorDomain"), 7, "Mismatched colorSpaces");
    return 0;
  }
  else
  {
    CGImageDestinationAddImage(*(CGImageDestinationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), image, *(CFDictionaryRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    return 1;
  }
}

@end
