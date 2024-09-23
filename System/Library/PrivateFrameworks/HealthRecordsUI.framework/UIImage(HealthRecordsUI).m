@implementation UIImage(HealthRecordsUI)

- (id)hr_imageWithWhiteBackground:()HealthRecordsUI
{
  void *v2;
  id v3;
  CGImage *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  const CGFloat *Components;
  void *v15;
  vImagePixelCount v16;
  vImagePixelCount v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD);
  CGImage *v22;
  CGImage *v23;
  uint8_t color[4];
  _QWORD aBlock[4];
  vImage_Buffer v26;
  void *v27;
  void *v28;
  vImage_Buffer v29;
  vImage_Buffer dest;
  vImage_Error error;
  vImage_CGImageFormat format;
  vImage_Buffer buf;

  v2 = (void *)MEMORY[0x1BCCF2F88]();
  v3 = objc_retainAutorelease(a1);
  v4 = (CGImage *)objc_msgSend(v3, "CGImage");
  memset(&buf, 0, sizeof(buf));
  objc_msgSend(v3, "size");
  v6 = v5;
  objc_msgSend(v3, "scale");
  v8 = v7;
  objc_msgSend(v3, "size");
  v10 = v9;
  objc_msgSend(v3, "scale");
  v12 = v11;
  memset(&format.colorSpace, 0, 32);
  *(_QWORD *)&format.bitsPerComponent = 0x2000000008;
  format.bitmapInfo = 4;
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v13, "CGColor"));

  if (!vImageBuffer_InitWithCGImage(&buf, &format, Components, v4, 0))
  {
    v16 = (unint64_t)(v10 * v12);
    v17 = (unint64_t)(v6 * v8);
    v18 = malloc_type_calloc(4 * v17 * v16, 1uLL, 0x100004077774924uLL);
    dest.data = v18;
    dest.height = v16;
    dest.width = v17;
    dest.rowBytes = 4 * v17;
    v19 = malloc_type_calloc(4 * v17 * v16, 1uLL, 0x100004077774924uLL);
    v29.data = v19;
    v29.height = v16;
    v29.width = v17;
    v29.rowBytes = 4 * v17;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__UIImage_HealthRecordsUI__hr_imageWithWhiteBackground___block_invoke;
    aBlock[3] = &__block_descriptor_80_e5_v8__0l;
    v26 = buf;
    v27 = v18;
    v28 = v19;
    v20 = (void (**)(_QWORD))_Block_copy(aBlock);
    *(_DWORD *)color = -1;
    error = vImageBufferFill_ARGB8888(&dest, color, 0);
    if (error || (error = vImageAlphaBlend_ARGB8888(&buf, &dest, &v29, 0)) != 0)
    {
      v20[2](v20);
    }
    else
    {
      free(buf.data);
      free(v18);
      v22 = vImageCreateCGImageFromBuffer(&v29, &format, 0, 0, 0, &error);
      v23 = v22;
      if (!error)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:", v22);
        CGImageRelease(v23);
        free(v19);
        goto LABEL_7;
      }
      CGImageRelease(v22);
      free(v19);
    }
    v15 = 0;
LABEL_7:

    goto LABEL_8;
  }
  free(buf.data);
  v15 = 0;
LABEL_8:
  objc_autoreleasePoolPop(v2);
  return v15;
}

@end
