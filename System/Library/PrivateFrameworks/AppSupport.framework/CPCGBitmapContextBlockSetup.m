@implementation CPCGBitmapContextBlockSetup

uint64_t ____CPCGBitmapContextBlockSetup_block_invoke(_QWORD *a1)
{
  const void *v2;
  void *v3;
  CGColorSpaceRef *v4;

  v2 = *(const void **)(*(_QWORD *)(a1[4] + 8) + 24);
  if (v2)
    CFRelease(v2);
  v3 = *(void **)(*(_QWORD *)(a1[5] + 8) + 24);
  if (v3)
    free(v3);
  v4 = *(CGColorSpaceRef **)(*(_QWORD *)(a1[6] + 8) + 24);
  if (v4)
  {
    CGColorSpaceRelease(*v4);
    CGColorSpaceRelease(*(CGColorSpaceRef *)(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) + 8));
    free(*(void **)(*(_QWORD *)(a1[6] + 8) + 24));
  }
  return 1;
}

uint64_t ____CPCGBitmapContextBlockSetup_block_invoke_2(uint64_t a1, uint64_t a2, CGImageRef image, CFErrorRef *a4)
{
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  CGFloat v14;
  CGFloat v15;
  CGImage *v16;
  uint64_t v17;
  size_t v18;
  const __CFString *v20;
  char *v21;
  CFErrorRef *v22;
  CFIndex v23;
  const __CFString *v24;
  CGRect v25;
  CGRect v26;

  if (*(_BYTE *)(a1 + 88) && (CGImageGetColorSpace(image), (CGColorSpaceEqualToColorSpace() & 1) == 0))
  {
    if (a4)
    {
      v20 = CFSTR("CPBitmapErrorDomain");
      v21 = "Mismatched colorSpaces";
      v22 = a4;
      v23 = 7;
LABEL_15:
      __CPBitmapSetErrorIfNecessary(v22, v20, v23, v21);
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 56);
    if (!v8)
      return 1;
    v9 = 0;
    v10 = 0;
    v11 = *(_QWORD *)(a1 + 64);
    while (1)
    {
      v12 = v8 - v9;
      v13 = v12 >= v11 ? v11 : v12;
      v25.origin.y = (double)v9;
      v14 = (double)*(unint64_t *)(a1 + 72);
      v15 = (double)(v11 - v13);
      v25.origin.x = 0.0;
      v25.size.width = v14;
      v25.size.height = (double)v13;
      v16 = CGImageCreateWithImageInRect(image, v25);
      bzero(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), *(_QWORD *)(a1 + 80));
      v26.origin.x = 0.0;
      v26.origin.y = v15;
      v26.size.width = v14;
      v26.size.height = (double)v13;
      CGContextDrawImage(*(CGContextRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), v26, v16);
      CGImageRelease(v16);
      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      v18 = *(_QWORD *)(v17 + 32) * v13;
      if (pwrite(*(_DWORD *)(a2 + 24), *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), v18, v10 + *(_QWORD *)(v17 + 40) * *(_QWORD *)(a2 + 88)) == -1)break;
      v10 += v18;
      v8 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 64);
      v9 += v11;
      if (v9 >= v8)
        return 1;
    }
    if (a4)
    {
      v24 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v23 = *__error();
      v21 = "Could not write bitmap to disk";
      v22 = a4;
      v20 = v24;
      goto LABEL_15;
    }
  }
  return 0;
}

@end
