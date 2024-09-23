@implementation CIImageRowReader

+ (id)fromImageFile:(id)a3
{
  const __CFURL *v4;
  CGImageSource *v5;
  CGImageSource *v6;
  CGImageRef ImageAtIndex;
  CGImage *v8;
  id v9;

  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", a3))
    return 0;
  v4 = (const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", a3);
  if (!v4)
    return 0;
  v5 = CGImageSourceCreateWithURL(v4, 0);
  if (!v5)
    return 0;
  v6 = v5;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v5, 0, 0);
  if (ImageAtIndex)
  {
    v8 = ImageAtIndex;
    v9 = +[CIImageRowReader fromImage:](CIImageRowReader, "fromImage:", ImageAtIndex);
    CGImageRelease(v8);
  }
  else
  {
    v9 = 0;
  }
  CFRelease(v6);
  return v9;
}

+ (id)fromImage:(CGImage *)a3
{
  unint64_t Width;
  unint64_t Height;
  size_t BitsPerComponent;
  CGColorSpaceRef ColorSpace;
  CIImageRowReader *v8;
  CGColorSpace *v9;
  void *v10;
  void *v11;
  CGContext *v12;
  CGColorSpace *v13;
  CGRect v15;

  if (!a3)
    return 0;
  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  v8 = 0;
  if (!Width || !Height || !BitsPerComponent)
    return v8;
  v9 = ColorSpace;
  v10 = malloc_type_calloc(Height, 4 * Width, 0xE0B9042EuLL);
  if (!v10)
    return 0;
  v11 = v10;
  v12 = CGBitmapContextCreate(v10, Width, Height, BitsPerComponent, 4 * Width, v9, 5u);
  v15.size.width = (double)Width;
  v15.size.height = (double)Height;
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  CGContextDrawImage(v12, v15, a3);
  CGContextFlush(v12);
  CGContextRelease(v12);
  v8 = objc_alloc_init(CIImageRowReader);
  v8->bpr = 4 * Width;
  v8->data = v11;
  v8->height = Height;
  v8->width = Width;
  if (v9)
    v13 = (CGColorSpace *)CFRetain(v9);
  else
    v13 = 0;
  v8->cs = v13;
  *(_QWORD *)&v8->red = 0x3000200010000;
  return v8;
}

- (void)_dumpImage:(id)a3 colorspace:(CGColorSpace *)a4
{
  void *v7;
  const __CFData *v8;
  unint64_t width;
  unint64_t height;
  CGDataProvider *v11;
  CGDataProvider *v12;
  CGBitmapInfo v13;
  CGImage *v14;
  const __CFURL *v15;
  CGImageDestination *v16;

  v7 = (void *)objc_opt_new();
  v8 = (const __CFData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->data, self->height * self->bpr);
  height = self->height;
  width = self->width;
  v11 = CGDataProviderCreateWithCFData(v8);
  if (v11)
  {
    v12 = v11;
    if (self->alpha && self->alpha != 3)
      abort();
    if (self->alpha)
      v13 = 5;
    else
      v13 = 6;
    v14 = CGImageCreate((unint64_t)(double)width, (unint64_t)(double)height, 8uLL, 0x20uLL, self->bpr, a4, v13, v11, 0, 0, kCGRenderingIntentDefault);
    CGDataProviderRelease(v12);
    if (v14)
    {
      v15 = (const __CFURL *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", a3);
      v16 = CGImageDestinationCreateWithURL(v15, CFSTR("public.tiff"), 1uLL, 0);
      CGImageDestinationAddImage(v16, v14, 0);
      CGImageDestinationFinalize(v16);
      CGImageRelease(v14);
      CFRelease(v16);

    }
  }
  objc_msgSend(v7, "drain");
}

- (void)dumpImage:(id)a3
{
  CGColorSpace *v5;

  if (self->cs)
  {
    -[CIImageRowReader _dumpImage:colorspace:](self, "_dumpImage:colorspace:", a3);
  }
  else
  {
    v5 = +[CIContext defaultRGBColorSpace](CIContext, "defaultRGBColorSpace");
    -[CIImageRowReader _dumpImage:colorspace:](self, "_dumpImage:colorspace:", a3, v5);
    if (v5)
      CGColorSpaceRelease(v5);
  }
}

- (void)dumpImageAsDeviceRGB:(id)a3
{
  CGColorSpace *DeviceRGB;

  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  -[CIImageRowReader _dumpImage:colorspace:](self, "_dumpImage:colorspace:", a3, DeviceRGB);
  CGColorSpaceRelease(DeviceRGB);
}

+ (id)forImage:(id)a3 downscaleToMax:(unsigned int)a4 colorspace:(CGColorSpace *)a5 usingContext:(id)a6
{
  id v9;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  double v15;
  CGFloat v17;
  CGAffineTransform v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v9 = a3;
  objc_msgSend(a3, "extent");
  x = v19.origin.x;
  y = v19.origin.y;
  width = v19.size.width;
  height = v19.size.height;
  if (CGRectIsNull(v19))
    return 0;
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  if (CGRectIsInfinite(v20))
    return 0;
  v21.origin.x = x;
  v21.origin.y = y;
  v21.size.width = width;
  v21.size.height = height;
  if (CGRectIsEmpty(v21))
    return 0;
  v15 = (double)a4;
  if (width > (double)a4 || height > v15)
  {
    v17 = fmin(fmin(v15 / width, v15 / height), 1.0);
    CGAffineTransformMakeScale(&v18, v17, v17);
    v9 = (id)objc_msgSend(v9, "imageByApplyingTransform:", &v18);
  }
  return +[CIImageRowReader forImage:usingContext:colorspace:](CIImageRowReader, "forImage:usingContext:colorspace:", v9, a6, a5);
}

- (void)dumpImageAsDict:(id)a3
{
  _QWORD v5[8];
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("bytes");
  v6[0] = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->data, self->bpr * self->height);
  v5[1] = CFSTR("width");
  v6[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->width);
  v5[2] = CFSTR("height");
  v6[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->height);
  v5[3] = CFSTR("bpr");
  v6[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", self->bpr);
  v5[4] = CFSTR("red");
  v6[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->red);
  v5[5] = CFSTR("green");
  v6[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->green);
  v5[6] = CFSTR("blue");
  v6[6] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->blue);
  v5[7] = CFSTR("alpha");
  v6[7] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", self->alpha);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 8), "writeToFile:atomically:", a3, 1);
}

+ (id)withDictionary:(id)a3
{
  CIImageRowReader *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(CIImageRowReader);
  v5 = (void *)objc_msgSend(a3, "valueForKey:", CFSTR("bytes"));
  v6 = malloc_type_malloc(objc_msgSend(v5, "length"), 0xB788E73AuLL);
  v4->data = v6;
  memcpy(v6, (const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"));
  v4->bpr = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("bpr")), "unsignedLongValue");
  v4->width = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("width")), "unsignedLongValue");
  v4->height = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("height")), "unsignedLongValue");
  v4->red = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("red")), "shortValue");
  v4->green = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("green")), "shortValue");
  v4->blue = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("blue")), "shortValue");
  v4->alpha = objc_msgSend((id)objc_msgSend(a3, "valueForKey:", CFSTR("alpha")), "shortValue");
  return v4;
}

+ (id)forImage:(id)a3 usingContext:(id)a4
{
  CGColorSpace *v6;
  id v7;

  v6 = +[CIContext defaultRGBColorSpace](CIContext, "defaultRGBColorSpace");
  v7 = +[CIImageRowReader forImage:usingContext:colorspace:](CIImageRowReader, "forImage:usingContext:colorspace:", a3, a4, v6);
  CGColorSpaceRelease(v6);
  return v7;
}

+ (id)forImage:(id)a3 usingContext:(id)a4 colorspace:(CGColorSpace *)a5
{
  CIImageRowReader *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  signed int v14;
  double v15;
  size_t v16;
  void *v17;
  void *v18;
  CGColorSpace *v19;

  v8 = objc_alloc_init(CIImageRowReader);
  objc_msgSend(a3, "extent");
  v10 = v9;
  v12 = v11;
  *(float *)&v9 = v13;
  v14 = vcvtms_s32_f32(*(float *)&v9);
  *(float *)&v9 = v15;
  v16 = (int)vcvtms_s32_f32(*(float *)&v9);
  v17 = malloc_type_calloc(4 * v14, v16, 0xAC1BC31CuLL);
  if (v17)
  {
    v18 = v17;
    objc_msgSend(a4, "render:toBitmap:rowBytes:bounds:format:colorSpace:", a3, v17, 4 * v14, 264, a5, v10, v12, (double)(unint64_t)v14, (double)v16);
    v8->bpr = 4 * v14;
    v8->data = v18;
    v8->height = v16;
    v8->width = v14;
    *(_QWORD *)&v8->red = 0x3000200010000;
    if (a5)
      v19 = (CGColorSpace *)CFRetain(a5);
    else
      v19 = 0;
    v8->cs = v19;
  }
  return v8;
}

- (CIImageRowReader)init
{
  CIImageRowReader *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CIImageRowReader;
  result = -[CIImageRowReader init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->bpr = 0u;
    *(_OWORD *)&result->height = 0u;
  }
  return result;
}

- (void)dealloc
{
  void *data;
  CGColorSpace *cs;
  objc_super v5;

  data = self->data;
  if (data)
    free(data);
  cs = self->cs;
  if (cs)
    CGColorSpaceRelease(cs);
  v5.receiver = self;
  v5.super_class = (Class)CIImageRowReader;
  -[CIImageRowReader dealloc](&v5, sel_dealloc);
}

- (unint64_t)width
{
  return self->width;
}

- (unint64_t)height
{
  return self->height;
}

- (signed)red
{
  return self->red;
}

- (signed)green
{
  return self->green;
}

- (signed)blue
{
  return self->blue;
}

- (signed)alpha
{
  return self->alpha;
}

- (const)rowAtIndex:(unsigned int)a3
{
  char *data;

  data = (char *)self->data;
  if (data)
    return &data[self->bpr * a3];
  else
    return 0;
}

- (unsigned)bytesPerPixel
{
  return 4;
}

@end
