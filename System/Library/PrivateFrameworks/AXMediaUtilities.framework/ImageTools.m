@implementation ImageTools

+ (__CFString)guessType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id *v6;
  __CFString *v7;

  v3 = a3;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
  {
    v5 = v3;

    v4 = v5;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("png")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0CEC580];
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("jpg")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0CEC530];
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("tiff")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0CEC600];
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("bmp")) & 1) != 0)
  {
    v6 = (id *)MEMORY[0x1E0CEC460];
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("raw")))
    {
      v7 = 0;
      goto LABEL_14;
    }
    v6 = (id *)MEMORY[0x1E0CEC5B8];
  }
  objc_msgSend(*v6, "identifier");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v7;
}

+ (id)getValueForTag:(id)a3 inObject:(id)a4
{
  return (id)objc_msgSend(a1, "getValueForTag:inObject:depth:parent:", a3, a4, 0, 0);
}

+ (id)getValueForTag:(id)a3 inObject:(id)a4 depth:(int)a5 parent:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  id v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v10, "allKeys");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v33;
      v15 = (a5 + 1);
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          if ((objc_msgSend(v17, "isEqualToString:", v9) & 1) != 0)
          {
            objc_msgSend(v10, "objectForKeyedSubscript:", v17);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_21;
          }
          objc_msgSend(v10, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (id)objc_msgSend(a1, "getValueForTag:inObject:depth:parent:", v9, v18, v15, v10);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v13)
          continue;
        break;
      }
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v26 = 0;
      goto LABEL_23;
    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v10;
    v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v29;
      v23 = (a5 + 1);
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(v11);
          v25 = (id)objc_msgSend(a1, "getValueForTag:inObject:depth:parent:", v9, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), v23, v11, (_QWORD)v28);
        }
        v21 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v21);
    }
  }
  v26 = 0;
LABEL_21:

LABEL_23:
  return v26;
}

+ (CGImage)rotateImage:(CGImage *)a3 withAngle:(float)a4 andXFlip:(BOOL)a5 andYFlip:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  float v10;
  __float2 v11;
  float v12;
  float v13;
  float Width;
  float v15;
  float v16;
  float v17;
  uint32_t AlphaInfo;
  size_t BitsPerComponent;
  CGColorSpace *ColorSpace;
  CGContext *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGImage *Image;
  CGAffineTransform v29;
  CGAffineTransform t1;
  CGAffineTransform v31;
  CGAffineTransform transform;
  CGAffineTransform v33;
  CGRect v34;

  v6 = a6;
  v7 = a5;
  v10 = (float)(a4 * 3.1416) / 180.0;
  v11 = __sincosf_stret(v10);
  v12 = fabsf(v11.__cosval);
  v13 = fabsf(v11.__sinval);
  Width = (float)CGImageGetWidth(a3);
  v15 = (float)(v13 * (float)CGImageGetHeight(a3)) + (float)(Width * v12);
  v16 = (float)CGImageGetWidth(a3);
  v17 = (float)(v12 * (float)CGImageGetHeight(a3)) + (float)(v16 * v13);
  AlphaInfo = CGImageGetAlphaInfo(a3);
  BitsPerComponent = CGImageGetBitsPerComponent(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  v21 = CGBitmapContextCreate(0, (unint64_t)v15, (unint64_t)v17, BitsPerComponent, 0, ColorSpace, AlphaInfo);
  CGContextSetAllowsAntialiasing(v21, 0);
  CGContextSetShouldAntialias(v21, 0);
  CGContextSetInterpolationQuality(v21, kCGInterpolationLow);
  memset(&v33, 0, sizeof(v33));
  v22 = v15;
  v23 = v17;
  if (v6)
  {
    v24 = -1.0;
  }
  else
  {
    v23 = 0.0;
    v24 = 1.0;
  }
  if (v7)
  {
    v25 = -1.0;
  }
  else
  {
    v22 = 0.0;
    v25 = 1.0;
  }
  CGAffineTransformMakeTranslation(&v33, v22, v23);
  v31 = v33;
  CGAffineTransformScale(&transform, &v31, v25, v24);
  v33 = transform;
  if (a4 != 0.0)
  {
    memset(&transform, 0, sizeof(transform));
    CGAffineTransformMakeTranslation(&transform, (float)(v15 * 0.5), (float)(v17 * 0.5));
    t1 = transform;
    CGAffineTransformRotate(&v31, &t1, v10);
    transform = v31;
    t1 = v31;
    CGAffineTransformTranslate(&v31, &t1, (float)(v17 * -0.5), (float)(v15 * -0.5));
    transform = v31;
    t1 = v31;
    v29 = v33;
    CGAffineTransformConcat(&v31, &t1, &v29);
    v33 = v31;
  }
  transform = v33;
  CGContextConcatCTM(v21, &transform);
  v26 = (double)CGImageGetWidth(a3);
  v34.size.height = (double)CGImageGetHeight(a3);
  v34.origin.x = 0.0;
  v34.origin.y = 0.0;
  v34.size.width = v26;
  CGContextDrawImage(v21, v34, a3);
  CGContextFlush(v21);
  Image = CGBitmapContextCreateImage(v21);
  CGContextRelease(v21);
  return Image;
}

+ (CGImage)rotateImage:(CGImage *)a3 accordingToEXIFOrientation:(int)a4
{
  double v4;
  CGImage *result;
  uint64_t v6;
  uint64_t v7;

  switch(a4)
  {
    case 2:
      LODWORD(v4) = 0;
      goto LABEL_10;
    case 3:
      LODWORD(v4) = 0;
      goto LABEL_14;
    case 4:
      LODWORD(v4) = 0;
      goto LABEL_7;
    case 5:
      LODWORD(v4) = 1119092736;
LABEL_7:
      v6 = 0;
      goto LABEL_15;
    case 6:
      LODWORD(v4) = -1028390912;
      v6 = 0;
      goto LABEL_11;
    case 7:
      LODWORD(v4) = 1119092736;
LABEL_10:
      v6 = 1;
LABEL_11:
      v7 = 0;
      goto LABEL_12;
    case 8:
      LODWORD(v4) = -1028390912;
LABEL_14:
      v6 = 1;
LABEL_15:
      v7 = 1;
LABEL_12:
      result = +[ImageTools rotateImage:withAngle:andXFlip:andYFlip:](ImageTools, "rotateImage:withAngle:andXFlip:andYFlip:", a3, v6, v7, v4);
      break;
    default:
      result = CGImageCreateCopy(a3);
      break;
  }
  return result;
}

+ (CGContext)createARGBBitmapContextWithImage:(CGImage *)a3
{
  size_t Width;
  size_t Height;
  CGColorSpace *ColorSpace;
  CGColorSpace *DeviceGray;
  uint32_t v8;
  void *v9;
  CGContextRef v10;
  CGContext *v11;
  void *v13;
  uint64_t v14;
  const __CFString *v15;
  id v16;

  Width = CGImageGetWidth(a3);
  Height = CGImageGetHeight(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  if (CGColorSpaceGetModel(ColorSpace))
  {
    DeviceGray = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v8 = 2;
    if (DeviceGray)
      goto LABEL_3;
LABEL_7:
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99750];
    v15 = CFSTR("Could not allocate color space");
    goto LABEL_10;
  }
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v8 = 0;
  if (!DeviceGray)
    goto LABEL_7;
LABEL_3:
  v9 = malloc_type_malloc(4 * Width * Height, 0xCD5F7386uLL);
  if (!v9)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99750];
    v15 = CFSTR("Could not allocate bitmap memory");
    goto LABEL_10;
  }
  v10 = CGBitmapContextCreate(v9, Width, Height, 8uLL, 4 * Width, DeviceGray, v8);
  if (!v10)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99750];
    v15 = CFSTR("Could not allocate context");
LABEL_10:
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v11 = v10;
  CGColorSpaceRelease(DeviceGray);
  return v11;
}

+ (CGImage)loadCGImageFromURL:(id)a3 error:(id *)ImageAtIndex
{
  const __CFURL *v5;
  CGImageSource *v6;
  CGImageSource *v7;
  void *v8;

  v5 = (const __CFURL *)a3;
  v6 = CGImageSourceCreateWithURL(v5, 0);
  if (v6)
  {
    v7 = v6;
    ImageAtIndex = (id *)CGImageSourceCreateImageAtIndex(v6, 0, 0);
    CFRelease(v7);
  }
  else if (ImageAtIndex)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Could not create image from URL %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, v8);
    *ImageAtIndex = (id)objc_claimAutoreleasedReturnValue();

    ImageAtIndex = 0;
  }

  return (CGImage *)ImageAtIndex;
}

+ (CGImage)loadCGImageEXIFRotatedFromSource:(CGImageSource *)a3 error:(id *)a4
{
  CGImageRef ImageAtIndex;
  CFDictionaryRef v6;
  void *v7;
  void *v8;
  uint64_t v9;
  CGImage *v10;

  if (a3)
  {
    ImageAtIndex = CGImageSourceCreateImageAtIndex(a3, 0, 0);
    v6 = CGImageSourceCopyPropertiesAtIndex(a3, 0, 0);
    +[ImageTools getValueForTag:inObject:](ImageTools, "getValueForTag:inObject:", CFSTR("Orientation"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[ImageTools getValueForTag:inObject:](ImageTools, "getValueForTag:inObject:", CFSTR("Orientation"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "intValue");

      v10 = +[ImageTools rotateImage:accordingToEXIFOrientation:](ImageTools, "rotateImage:accordingToEXIFOrientation:", ImageAtIndex, v9);
      CFRelease(ImageAtIndex);
      ImageAtIndex = v10;
    }
    CFRelease(a3);

  }
  else if (a4)
  {
    +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("could not create image from data"));
    ImageAtIndex = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return ImageAtIndex;
}

+ (CGImage)loadCGImageEXIFRotatedFromURL:(id)a3 error:(id *)a4
{
  CGImageSourceRef v6;
  CGImage *v7;

  v6 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  v7 = (CGImage *)objc_msgSend(a1, "loadCGImageEXIFRotatedFromSource:error:", v6, a4);
  CFRelease(v6);
  return v7;
}

+ (CGImage)loadCGImageEXIFRotatedFromData:(id)a3 error:(id *)a4
{
  CGImageSourceRef v6;
  CGImage *v7;

  v6 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  v7 = (CGImage *)objc_msgSend(a1, "loadCGImageEXIFRotatedFromSource:error:", v6, a4);
  CFRelease(v6);
  return v7;
}

+ (void)loadRawBufferFromData:(id)a3 width:(unsigned int *)a4 height:(unsigned int *)a5 rowBytes:(unsigned int *)a6 error:(id *)a7
{
  id v11;
  void *v12;
  size_t v13;
  void *v14;

  v11 = a3;
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "getBytes:range:", a4, 0, 4);
    objc_msgSend(v12, "getBytes:range:", a5, 4, 4);
    objc_msgSend(v12, "getBytes:range:", a6, 8, 4);
    v13 = *a5 * *a6;
    v14 = malloc_type_malloc(v13, 0x9FD6CA7AuLL);
    objc_msgSend(v12, "getBytes:range:", v14, 12, v13);
  }
  else
  {
    if (a7)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16757, CFSTR("Failed to load raw buffer"));
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = 0;
    *a4 = 0;
    *a5 = 0;
    *a6 = 0;
  }

  return v14;
}

+ (void)loadRawBufferFromURL:(id)a3 width:(unsigned int *)a4 height:(unsigned int *)a5 rowBytes:(unsigned int *)a6 error:(id *)a7
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v11 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(a3, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dataWithContentsOfFile:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = +[ImageTools loadRawBufferFromData:width:height:rowBytes:error:](ImageTools, "loadRawBufferFromData:width:height:rowBytes:error:", v13, a4, a5, a6, a7);
  return v14;
}

+ (id)numberOfChannelsInImageData:(id)a3 error:(id *)a4
{
  const __CFData *v5;
  const __CFData *v6;
  CGImageSource *v7;
  CGImageSource *v8;
  CGImage *ImageAtIndex;
  CFStringRef *v10;
  void *v11;
  uint64_t v12;
  CGColorSpace *v13;
  int NumberOfComponents;
  void *v15;

  v5 = (const __CFData *)a3;
  v6 = v5;
  if (v5)
  {
    v7 = CGImageSourceCreateWithData(v5, 0);
    if (v7)
    {
      v8 = v7;
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
      CFRelease(v8);
      if (ImageAtIndex)
      {
        if (CGImageGetBitsPerPixel(ImageAtIndex) == 32)
        {
          v10 = (CFStringRef *)MEMORY[0x1E0C9DA10];
        }
        else
        {
          if (CGImageGetBitsPerPixel(ImageAtIndex) != 8)
          {
            if (a4)
            {
              +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Format not supported (input image must be 32 or 8 bits per pixels)"));
              v13 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v13 = 0;
            }
            goto LABEL_13;
          }
          v10 = (CFStringRef *)MEMORY[0x1E0C9D978];
        }
        v13 = CGColorSpaceCreateWithName(*v10);
LABEL_13:
        CFRelease(ImageAtIndex);
        NumberOfComponents = CGColorSpaceGetNumberOfComponents(v13);
        CGColorSpaceRelease(v13);
        v12 = NumberOfComponents;
        goto LABEL_14;
      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: data is nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16765, v11);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  v12 = -1;
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (vImage_Buffer)loadVImageBufferFromData:(id)a3 isRaw:(BOOL)a4 lumaOnly:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  _BOOL4 v8;
  const __CFData *v9;
  const __CFData *v10;
  vImage_Buffer *v11;
  CGColorSpace *v12;
  CGContext *v13;
  void *v14;
  CGImageSource *v15;
  CGImage *ImageAtIndex;
  size_t Width;
  double v18;
  unint64_t height;
  double v20;
  unint64_t v21;
  void *v22;
  size_t v23;
  size_t v24;
  size_t BytesPerRow;
  CGContext *v26;
  id v27;
  size_t v28;
  unint64_t v29;
  unint64_t v30;
  void *v31;
  CGColorSpace *v32;
  size_t v33;
  size_t v34;
  size_t v35;
  uint32_t v36;
  CGContext *v37;
  size_t v38;
  void *v39;
  void *v40;
  size_t v41;
  size_t v42;
  size_t rowBytes;
  uint32_t BitmapInfo;
  id v45;
  void *Data;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  char *v50;
  char *v51;
  vImagePixelCount v52;
  char *v53;
  size_t v54;
  CGRect v56;
  CGRect v57;
  CGRect v58;

  v7 = a5;
  v8 = a4;
  v9 = (const __CFData *)a3;
  v10 = v9;
  if (a6)
  {
    if (v9)
    {
      if (v8)
      {
LABEL_4:
        if (v7)
          NSLog(CFSTR("Ignoring lumaOnly flag when operating on RAW buffers"));
        v11 = (vImage_Buffer *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
        v12 = 0;
        v13 = 0;
        v11->data = +[ImageTools loadRawBufferFromData:width:height:rowBytes:error:](ImageTools, "loadRawBufferFromData:width:height:rowBytes:error:", v10, &v11->width, &v11->height, &v11->rowBytes, a6);
        goto LABEL_40;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: data is nil"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16765, v14);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      if (v8)
        goto LABEL_4;
    }
    v15 = CGImageSourceCreateWithData(v10, 0);
    v11 = (vImage_Buffer *)v15;
    if (v15)
    {
      ImageAtIndex = CGImageSourceCreateImageAtIndex(v15, 0, 0);
      CFRelease(v11);
      if (ImageAtIndex)
      {
        if (CGImageGetBitsPerPixel(ImageAtIndex) == 32)
        {
          v11 = (vImage_Buffer *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
          v11->height = CGImageGetHeight(ImageAtIndex);
          Width = CGImageGetWidth(ImageAtIndex);
          v11->width = Width;
          v18 = (double)Width;
          height = v11->height;
          v20 = (double)height;
          if (v7)
          {
            v21 = (Width + 15) & 0xFFFFFFFFFFFFFFF0;
            v11->rowBytes = v21;
            v22 = malloc_type_malloc(height * v21, 0xDDB706B4uLL);
            v11->data = v22;
            if (v22)
            {
              v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
              v24 = v11->height;
              v23 = v11->width;
              BytesPerRow = CGImageGetBytesPerRow(ImageAtIndex);
              v26 = CGBitmapContextCreate(0, v23, v24, 8uLL, BytesPerRow, v12, 0x2002u);
              v13 = v26;
              if (v26)
              {
                v56.origin.x = 0.0;
                v56.origin.y = 0.0;
                v56.size.width = v18;
                v56.size.height = v20;
                CGContextDrawImage(v26, v56, ImageAtIndex);
              }
              else
              {
                +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to create the context"));
                *a6 = (id)objc_claimAutoreleasedReturnValue();
              }
              Data = CGBitmapContextGetData(v13);
              v47 = +[ImageTools extractLumaFromBGRA8Buffer:withWidth:andWithHeight:andWithBytesPerRow:toBuffer:withBytesPerRow:](ImageTools, "extractLumaFromBGRA8Buffer:withWidth:andWithHeight:andWithBytesPerRow:toBuffer:withBytesPerRow:", Data, LODWORD(v11->width), LODWORD(v11->height), CGBitmapContextGetBytesPerRow(v13), v11->data, v11->rowBytes);
              if (v47 != 128)
              {
                v48 = v47;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", CVML_getStatusDescription(v47));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", v48, v49);
                *a6 = (id)objc_claimAutoreleasedReturnValue();

              }
              goto LABEL_39;
            }
          }
          else
          {
            v38 = CGImageGetBytesPerRow(ImageAtIndex);
            v11->rowBytes = v38;
            v39 = malloc_type_malloc(v11->height * v38, 0x2F0129F6uLL);
            v11->data = v39;
            if (v39)
            {
              v12 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
              v40 = v11->data;
              v41 = v11->height;
              v42 = v11->width;
              rowBytes = v11->rowBytes;
              BitmapInfo = CGImageGetBitmapInfo(ImageAtIndex);
              v13 = CGBitmapContextCreate(v40, v42, v41, 8uLL, rowBytes, v12, BitmapInfo);
              if (v13
                || (v13 = CGBitmapContextCreate(v11->data, v11->width, v11->height, 8uLL, v11->rowBytes, v12, 1u)) != 0)
              {
                v58.origin.x = 0.0;
                v58.origin.y = 0.0;
                v58.size.width = v18;
                v58.size.height = v20;
                CGContextDrawImage(v13, v58, ImageAtIndex);
LABEL_39:
                CFRelease(ImageAtIndex);
                goto LABEL_40;
              }
              +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to create the context"));
              v45 = (id)objc_claimAutoreleasedReturnValue();
LABEL_30:
              *a6 = v45;
              goto LABEL_39;
            }
          }
        }
        else
        {
          if (CGImageGetBitsPerPixel(ImageAtIndex) != 8)
          {
            +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Format not supported (input image must be 32 or 8 bits per pixels)"));
            v45 = (id)objc_claimAutoreleasedReturnValue();
            v11 = 0;
            goto LABEL_29;
          }
          v11 = (vImage_Buffer *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
          v11->height = CGImageGetHeight(ImageAtIndex);
          v28 = CGImageGetWidth(ImageAtIndex);
          v29 = v11->height;
          v30 = (v28 + 15) & 0xFFFFFFFFFFFFFFF0;
          v11->width = v28;
          v11->rowBytes = v30;
          v31 = malloc_type_malloc(v29 * v30, 0xEB4B3BuLL);
          v11->data = v31;
          if (v31)
          {
            v32 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
            v34 = v11->height;
            v33 = v11->width;
            v35 = CGImageGetBytesPerRow(ImageAtIndex);
            v36 = CGImageGetBitmapInfo(ImageAtIndex);
            v37 = CGBitmapContextCreate(0, v33, v34, 8uLL, v35, v32, v36);
            v13 = v37;
            if (v37)
            {
              v57.size.width = (double)v28;
              v57.size.height = (double)v29;
              v57.origin.x = 0.0;
              v57.origin.y = 0.0;
              CGContextDrawImage(v37, v57, ImageAtIndex);
            }
            else
            {
              +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to create the context"));
              *a6 = (id)objc_claimAutoreleasedReturnValue();
            }
            v50 = (char *)CGBitmapContextGetData(v13);
            if (v11->height)
            {
              v51 = v50;
              v52 = 0;
              v53 = (char *)v11->data;
              do
              {
                v54 = CGBitmapContextGetBytesPerRow(v13);
                memcpy(v53, v51, v54);
                v51 += CGBitmapContextGetBytesPerRow(v13);
                v53 += v11->rowBytes;
                ++v52;
              }
              while (v52 < v11->height);
            }
            CGColorSpaceRelease(v32);
            v12 = 0;
            goto LABEL_39;
          }
        }
        +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to allocate the image buffer"));
        v45 = (id)objc_claimAutoreleasedReturnValue();
LABEL_29:
        v12 = 0;
        v13 = 0;
        goto LABEL_30;
      }
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not extract first image from bundle"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
      v11 = 0;
    }
    else
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not create image from data"));
      v27 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = 0;
    v13 = 0;
    *a6 = v27;
LABEL_40:
    CGContextRelease(v13);
    CGColorSpaceRelease(v12);
    goto LABEL_41;
  }
  v11 = 0;
LABEL_41:

  return v11;
}

+ (vImage_Buffer)loadVImageBufferFromURL:(id)a3 lumaOnly:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  vImage_Buffer *v11;

  v6 = a4;
  if (a5)
    *a5 = 0;
  v7 = a3;
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[ImageTools guessType:](ImageTools, "guessType:", v8);

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = +[ImageTools loadVImageBufferFromData:isRaw:lumaOnly:error:](ImageTools, "loadVImageBufferFromData:isRaw:lumaOnly:error:", v10, CFEqual(v9, (CFTypeRef)*MEMORY[0x1E0CEC5B8]) != 0, v6, a5);
  return v11;
}

+ (vImage_Buffer)loadVImageBufferEXIFRotatedFromURL:(id)a3 error:(id *)a4
{
  CGImage *v5;
  _OWORD v7[2];

  v5 = +[ImageTools loadCGImageEXIFRotatedFromURL:error:](ImageTools, "loadCGImageEXIFRotatedFromURL:error:", a3);
  if (a4)
  {
    if (*a4)
    {
      a4 = 0;
    }
    else
    {
      memset(v7, 0, sizeof(v7));
      +[ImageTools getVImageBufferFromCGImage:error:](ImageTools, "getVImageBufferFromCGImage:error:", v5, a4);
      a4 = (id *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
      *a4 = *(id *)&v7[0];
      *(_OWORD *)(a4 + 1) = *(_OWORD *)((char *)v7 + 8);
      a4[3] = (id)*((_QWORD *)&v7[1] + 1);
    }
  }
  CGImageRelease(v5);
  return (vImage_Buffer *)a4;
}

+ (vImage_Buffer)loadVImageBufferEXIFRotatedFromData:(id)a3 error:(id *)a4
{
  CGImage *v5;
  _OWORD v7[2];

  v5 = +[ImageTools loadCGImageEXIFRotatedFromData:error:](ImageTools, "loadCGImageEXIFRotatedFromData:error:", a3);
  if (a4)
  {
    if (*a4)
    {
      a4 = 0;
    }
    else
    {
      memset(v7, 0, sizeof(v7));
      +[ImageTools getVImageBufferFromCGImage:error:](ImageTools, "getVImageBufferFromCGImage:error:", v5, a4);
      a4 = (id *)malloc_type_malloc(0x20uLL, 0x1080040ABB4582EuLL);
      *a4 = *(id *)&v7[0];
      *(_OWORD *)(a4 + 1) = *(_OWORD *)((char *)v7 + 8);
      a4[3] = (id)*((_QWORD *)&v7[1] + 1);
    }
  }
  CGImageRelease(v5);
  return (vImage_Buffer *)a4;
}

+ (__CVBuffer)loadCVPixelBufferARGB8FromURL:(id)a3 error:(id *)a4
{
  const __CFURL *v5;
  CGImageSource *v6;
  CGImageSource *v7;
  CGImage *ImageAtIndex;
  int Width;
  int Height;
  __CFDictionary *IOSurfacePropertiesDictionary;
  __CFDictionary *v12;
  const __CFDictionary *v13;
  void *v14;
  CGColorSpace *v15;
  CGContext *v16;
  int v17;
  id v18;
  const char *ModuleDescription;
  const char *StatusDescription;
  const __CFAllocator *v21;
  size_t v22;
  size_t v23;
  size_t v24;
  size_t v25;
  void *BaseAddress;
  size_t v27;
  size_t v28;
  size_t BytesPerRow;
  CGContext *v30;
  __CVBuffer *v31;
  CVPixelBufferRef pixelBufferOut;
  CGRect v34;

  v5 = (const __CFURL *)a3;
  pixelBufferOut = 0;
  v6 = CGImageSourceCreateWithURL(v5, 0);
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Could not create image from URL %@"), v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_9;
  }
  v7 = v6;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
  CFRelease(v7);
  if (!ImageAtIndex)
  {
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not extract first image from bundle"));
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v13 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
LABEL_9:
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v13 = 0;
    goto LABEL_30;
  }
  if (CGImageGetBitsPerPixel(ImageAtIndex) == 32)
  {
    Width = CGImageGetWidth(ImageAtIndex);
    Height = CGImageGetHeight(ImageAtIndex);
    IOSurfacePropertiesDictionary = ImageTools_fcssCreateIOSurfacePropertiesDictionary(Width, Height, 32);
    if (IOSurfacePropertiesDictionary)
    {
      v12 = IOSurfacePropertiesDictionary;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", IOSurfacePropertiesDictionary, *MEMORY[0x1E0CA8FF0], 0);
      v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      CFRelease(v12);
      v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v22 = CGImageGetWidth(ImageAtIndex);
      v23 = CGImageGetHeight(ImageAtIndex);
      if (!CVPixelBufferCreate(v21, v22, v23, 0x20u, v13, &pixelBufferOut))
      {
        CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
        v24 = CVPixelBufferGetWidth(pixelBufferOut);
        v25 = CVPixelBufferGetHeight(pixelBufferOut);
        v15 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
        BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
        v27 = CVPixelBufferGetWidth(pixelBufferOut);
        v28 = CVPixelBufferGetHeight(pixelBufferOut);
        BytesPerRow = CVPixelBufferGetBytesPerRow(pixelBufferOut);
        v30 = CGBitmapContextCreate(BaseAddress, v27, v28, 8uLL, BytesPerRow, v15, 6u);
        if (v30)
        {
          v16 = v30;
          v34.size.height = (double)v25;
          v34.size.width = (double)v24;
          v34.origin.x = 0.0;
          v34.origin.y = 0.0;
          CGContextDrawImage(v30, v34, ImageAtIndex);
        }
        else if (a4)
        {
          +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to create the context"));
          v16 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        v17 = 1;
        goto LABEL_29;
      }
      if (a4)
      {
        +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to create the CVPixelBuffer"));
        v18 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
LABEL_22:
      v17 = 0;
      v16 = 0;
      v15 = 0;
      goto LABEL_29;
    }
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to create the IOSurface properties"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    ModuleDescription = CVML_getModuleDescription(16766);
    StatusDescription = CVML_getStatusDescription(0x417EuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -2, StatusDescription, "+[ImageTools loadCVPixelBufferARGB8FromURL:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 727);
LABEL_17:
    v13 = 0;
    goto LABEL_22;
  }
  if (!a4)
    goto LABEL_17;
  +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Format not supported (input image must be 32 bits per pixels)"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
LABEL_21:
  v17 = 0;
  v16 = 0;
  v15 = 0;
  *a4 = v18;
LABEL_29:
  CFRelease(ImageAtIndex);
LABEL_30:
  CGContextRelease(v16);
  CGColorSpaceRelease(v15);
  if (v17)
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 1uLL);
  v31 = pixelBufferOut;

  return v31;
}

+ (__CVBuffer)loadCVPixelBuffer420YpCbCr8FromURL:(id)a3 error:(id *)a4
{
  const __CFURL *v5;
  unint64_t v6;
  CGImageSource *v7;
  CGImageSource *v8;
  CGImage *ImageAtIndex;
  CGDataProvider *DataProvider;
  const __CFData *v11;
  int Width;
  int Height;
  __CFDictionary *IOSurfacePropertiesDictionary;
  __CFDictionary *v15;
  const __CFDictionary *v16;
  void *v17;
  int v18;
  const char *v19;
  const char *v20;
  const __CFAllocator *v21;
  size_t v22;
  size_t v23;
  unsigned int BitsPerPixel;
  CGImageAlphaInfo AlphaInfo;
  int v26;
  size_t v27;
  void *v28;
  size_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const char *ModuleDescription;
  const char *StatusDescription;
  int v35;
  size_t v36;
  size_t BytesPerRow;
  void *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  void *v40;
  uint64_t v41;
  void *v42;
  __CVBuffer *v43;
  size_t v45;
  size_t v46;
  size_t v47;
  const UInt8 *BytePtr;
  const UInt8 *v49;
  _BOOL4 v50;
  CVPixelBufferRef pixelBufferOut;

  v5 = (const __CFURL *)a3;
  v6 = 16768;
  pixelBufferOut = 0;
  v7 = CGImageSourceCreateWithURL(v5, 0);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Could not create image from URL %@"), v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    v16 = 0;
    goto LABEL_37;
  }
  v8 = v7;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v7, 0, 0);
  DataProvider = CGImageGetDataProvider(ImageAtIndex);
  v11 = CGDataProviderCopyData(DataProvider);
  CFRelease(v8);
  if (ImageAtIndex)
  {
    if (CGImageGetBitsPerPixel(ImageAtIndex) == 32 || CGImageGetBitsPerPixel(ImageAtIndex) == 8)
    {
      Width = CGImageGetWidth(ImageAtIndex);
      Height = CGImageGetHeight(ImageAtIndex);
      IOSurfacePropertiesDictionary = ImageTools_fcssCreateIOSurfacePropertiesDictionary(Width, Height, 875704422);
      if (IOSurfacePropertiesDictionary)
      {
        v15 = IOSurfacePropertiesDictionary;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", IOSurfacePropertiesDictionary, *MEMORY[0x1E0CA8FF0], 0);
        v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CFRelease(v15);
        v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v22 = CGImageGetWidth(ImageAtIndex);
        v23 = CGImageGetHeight(ImageAtIndex);
        if (CVPixelBufferCreate(v21, v22, v23, 0x34323066u, v16, &pixelBufferOut))
          goto LABEL_23;
        CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
        BitsPerPixel = CGImageGetBitsPerPixel(ImageAtIndex);
        AlphaInfo = CGImageGetAlphaInfo(ImageAtIndex);
        v26 = (BitsPerPixel >> 3);
        if (v26 == 4)
        {
          v50 = AlphaInfo == kCGImageAlphaFirst;
          BytePtr = CFDataGetBytePtr(v11);
          v46 = CGImageGetWidth(ImageAtIndex);
          v36 = CGImageGetHeight(ImageAtIndex);
          BytesPerRow = CGImageGetBytesPerRow(ImageAtIndex);
          BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
          BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 0);
          v40 = CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 1uLL);
          v41 = +[ImageTools create420YCbCr8BufferFromRGB8Buffer:withWidth:andWithHeight:andWithBytesPerRow:andAlphaFirst:toLumaBuffer:withBytesPerRowLuma:andToChromaBuffer:withBytesPerRowChroma:](ImageTools, "create420YCbCr8BufferFromRGB8Buffer:withWidth:andWithHeight:andWithBytesPerRow:andAlphaFirst:toLumaBuffer:withBytesPerRowLuma:andToChromaBuffer:withBytesPerRowChroma:", BytePtr, v46, v36, BytesPerRow, v50, BaseAddressOfPlane, BytesPerRowOfPlane, v40, CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 1uLL));
          v6 = v41;
          v18 = 1;
          if (v41 > 0x7FuLL)
            goto LABEL_34;
          v32 = v41 - 128;
          ModuleDescription = CVML_getModuleDescription(v41);
          StatusDescription = CVML_getStatusDescription(v6);
          v35 = 870;
        }
        else if (v26 == 1)
        {
          v49 = CFDataGetBytePtr(v11);
          v47 = CGImageGetWidth(ImageAtIndex);
          v45 = CGImageGetHeight(ImageAtIndex);
          v27 = CGImageGetBytesPerRow(ImageAtIndex);
          v28 = CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 0);
          v29 = CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 0);
          v18 = 1;
          v30 = CVPixelBufferGetBaseAddressOfPlane(pixelBufferOut, 1uLL);
          v31 = +[ImageTools create420YCbCr8BufferFromPlanar8Buffer:withWidth:andWithHeight:andWithBytesPerRow:toLumaBuffer:withBytesPerRowLuma:andToChromaBuffer:withBytesPerRowChroma:](ImageTools, "create420YCbCr8BufferFromPlanar8Buffer:withWidth:andWithHeight:andWithBytesPerRow:toLumaBuffer:withBytesPerRowLuma:andToChromaBuffer:withBytesPerRowChroma:", v49, v47, v45, v27, v28, v29, v30, CVPixelBufferGetBytesPerRowOfPlane(pixelBufferOut, 1uLL));
          v6 = v31;
          if (v31 > 0x7FuLL)
            goto LABEL_34;
          v32 = v31 - 128;
          ModuleDescription = CVML_getModuleDescription(v31);
          StatusDescription = CVML_getStatusDescription(v6);
          v35 = 857;
        }
        else
        {
          if (a4)
          {
            +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("unexpected number of bytes per pixels"));
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          v6 = 16747;
          v32 = -21;
          ModuleDescription = CVML_getModuleDescription(16747);
          StatusDescription = CVML_getStatusDescription(0x416BuLL);
          v35 = 875;
        }
        syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, v32, StatusDescription, "+[ImageTools loadCVPixelBuffer420YpCbCr8FromURL:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", v35);
        v18 = 1;
LABEL_34:
        CFRelease(ImageAtIndex);
        if (v11)
        {
LABEL_35:
          CFRelease(v11);
          if ((v18 & 1) == 0)
            goto LABEL_37;
          goto LABEL_36;
        }
        goto LABEL_18;
      }
      v6 = 16766;
      if (a4)
      {
        +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to create the IOSurface properties"));
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = CVML_getModuleDescription(16766);
      v20 = CVML_getStatusDescription(0x417EuLL);
      syslog(3, "%s error %lld:%s in %s @ %s:%d\n", v19, -2, v20, "+[ImageTools loadCVPixelBuffer420YpCbCr8FromURL:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 828);
    }
    else if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Format not supported (input image must be 32 bits per pixels)"));
      v16 = 0;
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_34;
    }
    v16 = 0;
LABEL_23:
    v18 = 0;
    goto LABEL_34;
  }
  if (a4)
  {
    +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not extract first image from bundle"));
    v18 = 0;
    v16 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_35;
  }
  else
  {
    v18 = 0;
    v16 = 0;
    if (v11)
      goto LABEL_35;
  }
LABEL_18:
  if (v18)
LABEL_36:
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 1uLL);
LABEL_37:
  if (v6 != 128)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Could not load 420YpCbCr8 buffer"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", v6, v42);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  v43 = pixelBufferOut;

  return v43;
}

+ (id)saveCVPixelBufferPlane8:(int)a3 from:(__CVBuffer *)a4 withName:(id)a5 inFolder:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *BaseAddressOfPlane;
  size_t BytesPerRowOfPlane;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  CGColorSpace *v18;
  CGDataProvider *v19;
  CGImage *v20;
  CGImageDestination *v21;

  v10 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "length"))
  {
    if (v11)
    {
      objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSTemporaryDirectory();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathComponent:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    CVPixelBufferLockBaseAddress(a4, 1uLL);
    BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a4, a3);
    BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a4, a3);
    WidthOfPlane = CVPixelBufferGetWidthOfPlane(a4, a3);
    HeightOfPlane = CVPixelBufferGetHeightOfPlane(a4, a3);
    v18 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
    v19 = CGDataProviderCreateWithData(0, BaseAddressOfPlane, HeightOfPlane * BytesPerRowOfPlane, 0);
    v20 = CGImageCreate(WidthOfPlane, HeightOfPlane, 8uLL, 8uLL, BytesPerRowOfPlane, v18, 0, v19, 0, 0, kCGRenderingIntentDefault);
    v21 = CGImageDestinationCreateWithURL((CFURLRef)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v12), +[ImageTools guessType:](ImageTools, "guessType:", v10), 1uLL, 0);
    CGImageDestinationAddImage(v21, v20, 0);
    CGImageDestinationFinalize(v21);
    CVPixelBufferUnlockBaseAddress(a4, 1uLL);
    CGImageRelease(v20);
    CGDataProviderRelease(v19);
    CGColorSpaceRelease(v18);
    CFRelease(v21);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)saveCVPixelBufferRGBA8:(__CVBuffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *BaseAddress;
  size_t BytesPerRow;
  size_t Width;
  size_t Height;
  CGColorSpace *v16;
  CGDataProvider *v17;
  CGImage *v18;
  CGImageDestination *v19;

  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    if (v9)
    {
      objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSTemporaryDirectory();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    BaseAddress = CVPixelBufferGetBaseAddress(a3);
    BytesPerRow = CVPixelBufferGetBytesPerRow(a3);
    Width = CVPixelBufferGetWidth(a3);
    Height = CVPixelBufferGetHeight(a3);
    v16 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v17 = CGDataProviderCreateWithData(0, BaseAddress, Height * BytesPerRow, 0);
    v18 = CGImageCreate(Width, Height, 8uLL, 0x20uLL, BytesPerRow, v16, 0, v17, 0, 0, kCGRenderingIntentDefault);
    v19 = CGImageDestinationCreateWithURL((CFURLRef)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10), +[ImageTools guessType:](ImageTools, "guessType:", v8), 1uLL, 0);
    CGImageDestinationAddImage(v19, v18, 0);
    CGImageDestinationFinalize(v19);
    CVPixelBufferUnlockBaseAddress(a3, 1uLL);
    CGImageRelease(v18);
    CGDataProviderRelease(v17);
    CGColorSpaceRelease(v16);
    CFRelease(v19);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)saveCVPixelBuffer420YpCbCr8:(__CVBuffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  int Width;
  int Height;
  __CFDictionary *IOSurfacePropertiesDictionary;
  __CFDictionary *v14;
  const __CFDictionary *v15;
  unint64_t v16;
  const char *v17;
  const char *v18;
  void *v19;
  const __CFAllocator *v20;
  size_t v21;
  size_t v22;
  const char *ModuleDescription;
  signed int PixelFormatType;
  void *v25;
  size_t v26;
  void *v27;
  size_t v28;
  size_t v29;
  size_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  int v36;
  size_t BytesPerRowOfPlane;
  void *v38;
  size_t v39;
  void *v40;
  size_t v41;
  unsigned int v42;
  unsigned int v43;
  void *BaseAddress;
  uint64_t v45;
  const char *v46;
  void *v47;
  uint64_t v49;
  uint64_t v50;
  const char *StatusDescription;
  const char *v52;
  void *BaseAddressOfPlane;
  id v54;
  id *v55;
  id v56;
  CVPixelBufferRef pixelBufferOut;

  v9 = a4;
  v10 = a5;
  pixelBufferOut = 0;
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  IOSurfacePropertiesDictionary = ImageTools_fcssCreateIOSurfacePropertiesDictionary(Width, Height, 32);
  if (IOSurfacePropertiesDictionary)
  {
    v14 = IOSurfacePropertiesDictionary;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", IOSurfacePropertiesDictionary, *MEMORY[0x1E0CA8FF0], 0);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFRelease(v14);
    CVPixelBufferLockBaseAddress(a3, 1uLL);
    v20 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v21 = CVPixelBufferGetWidth(a3);
    v22 = CVPixelBufferGetHeight(a3);
    if (CVPixelBufferCreate(v20, v21, v22, 0x20u, v15, &pixelBufferOut))
    {
      v16 = 16766;
      ModuleDescription = CVML_getModuleDescription(16766);
      StatusDescription = CVML_getStatusDescription(0x417EuLL);
      syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -2, StatusDescription, "+[ImageTools saveCVPixelBuffer420YpCbCr8:withName:inFolder:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1042);
LABEL_8:
      v19 = 0;
      goto LABEL_21;
    }
    CVPixelBufferLockBaseAddress(pixelBufferOut, 1uLL);
    PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
    if (PixelFormatType > 1714696751)
    {
      if (PixelFormatType == 2033463856 || PixelFormatType == 1714696752)
      {
        v54 = v10;
        v55 = a6;
        v56 = v9;
        BaseAddressOfPlane = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
        BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
        v38 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
        v39 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
        v40 = CVPixelBufferGetBaseAddressOfPlane(a3, 2uLL);
        v41 = CVPixelBufferGetBytesPerRowOfPlane(a3, 2uLL);
        v42 = CVPixelBufferGetWidth(a3);
        v43 = CVPixelBufferGetHeight(a3);
        BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
        LOBYTE(v50) = 0;
        v45 = +[ImageTools createRGB8BufferFrom420Y8PlanarBuffer:withBytesPerRowY:andFrom420Cb8Buffer:withBytesPerRowCb:andFrom420Cr8Buffer:withBytesPerRowCr:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:](ImageTools, "createRGB8BufferFrom420Y8PlanarBuffer:withBytesPerRowY:andFrom420Cb8Buffer:withBytesPerRowCb:andFrom420Cr8Buffer:withBytesPerRowCr:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:", BaseAddressOfPlane, BytesPerRowOfPlane, v38, v39, v40, v41, __PAIR64__(v43, v42), v50, BaseAddress, CVPixelBufferGetBytesPerRow(pixelBufferOut));
        v16 = v45;
        if (v45 <= 0x7FuLL)
        {
          v33 = v45 - 128;
          v34 = CVML_getModuleDescription(v45);
          v35 = CVML_getStatusDescription(v16);
          v36 = 1061;
          goto LABEL_18;
        }
LABEL_19:
        a6 = v55;
        v9 = v56;
        v10 = v54;
        +[ImageTools saveCVPixelBufferRGBA8:withName:inFolder:error:](ImageTools, "saveCVPixelBufferRGBA8:withName:inFolder:error:", pixelBufferOut, v56, v54, v55);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
        CVPixelBufferUnlockBaseAddress(a3, 1uLL);
        if (pixelBufferOut)
          CVPixelBufferRelease(pixelBufferOut);
        goto LABEL_23;
      }
    }
    else if (PixelFormatType == 875704422 || PixelFormatType == 875704438)
    {
      v54 = v10;
      v55 = a6;
      v56 = v9;
      v25 = CVPixelBufferGetBaseAddressOfPlane(a3, 0);
      v26 = CVPixelBufferGetBytesPerRowOfPlane(a3, 0);
      v27 = CVPixelBufferGetBaseAddressOfPlane(a3, 1uLL);
      v28 = CVPixelBufferGetBytesPerRowOfPlane(a3, 1uLL);
      v29 = CVPixelBufferGetWidth(a3);
      v30 = CVPixelBufferGetHeight(a3);
      v31 = CVPixelBufferGetBaseAddress(pixelBufferOut);
      LOBYTE(v49) = 0;
      v32 = +[ImageTools createRGB8BufferFrom420Y8BiPlanarBuffer:withBytesPerRowLuma:andFrom420CbCr8Buffer:withBytesPerRowChroma:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:](ImageTools, "createRGB8BufferFrom420Y8BiPlanarBuffer:withBytesPerRowLuma:andFrom420CbCr8Buffer:withBytesPerRowChroma:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:", v25, v26, v27, v28, v29, v30, v49, v31, CVPixelBufferGetBytesPerRow(pixelBufferOut));
      v16 = v32;
      if (v32 <= 0x7FuLL)
      {
        v33 = v32 - 128;
        v34 = CVML_getModuleDescription(v32);
        v35 = CVML_getStatusDescription(v16);
        v36 = 1074;
LABEL_18:
        syslog(3, "%s error %lld:%s in %s @ %s:%d\n", v34, v33, v35, "+[ImageTools saveCVPixelBuffer420YpCbCr8:withName:inFolder:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", v36);
        v19 = 0;
        a6 = v55;
        v9 = v56;
        v10 = v54;
        goto LABEL_21;
      }
      goto LABEL_19;
    }
    v16 = 16747;
    v46 = CVML_getModuleDescription(16747);
    v52 = CVML_getStatusDescription(0x416BuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", v46, -21, v52, "+[ImageTools saveCVPixelBuffer420YpCbCr8:withName:inFolder:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1079);
    goto LABEL_8;
  }
  if (a6)
  {
    +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Failed to create the IOSurface properties"));
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = 16766;
  v17 = CVML_getModuleDescription(16766);
  v18 = CVML_getStatusDescription(0x417EuLL);
  syslog(3, "%s error %lld:%s in %s @ %s:%d\n", v17, -2, v18, "+[ImageTools saveCVPixelBuffer420YpCbCr8:withName:inFolder:error:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1027);
  v19 = 0;
  v15 = 0;
LABEL_23:
  if (v16 != 128)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Could not save 420YpCbCr8 buffer"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (a6)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", v16, v47);
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v19;
}

+ (CGImage)newCGImageFromPlanar8VImageBuffer:(const vImage_Buffer *)a3 error:(id *)a4
{
  CGColorSpace *v6;
  CGDataProvider *v7;
  CGDataProvider *v8;
  CGImageRef v9;
  CGImage *v10;

  v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D978]);
  v7 = CGDataProviderCreateWithData(0, a3->data, a3->height * a3->rowBytes, 0);
  if (!v7)
  {
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not create data provider."));
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
        return v10;
    }
    else
    {
      v10 = 0;
      if (!v6)
        return v10;
    }
LABEL_9:
    CGColorSpaceRelease(v6);
    return v10;
  }
  v8 = v7;
  v9 = CGImageCreate(a3->width, a3->height, 8uLL, 8uLL, a3->rowBytes, v6, 0, v7, 0, 0, kCGRenderingIntentDefault);
  v10 = v9;
  if (a4 && !v9)
  {
    +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not create image."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGDataProviderRelease(v8);
  if (v6)
    goto LABEL_9;
  return v10;
}

+ (id)saveVImageBufferPlanar8ToJPEGData:(const vImage_Buffer *)a3 withCompressionQuality:(float)a4 error:(id *)a5
{
  CGImage *v7;
  __CFData *v8;
  __CFString *v9;
  CGImageDestination *v10;
  double v11;
  void *v12;
  void *v13;

  v7 = +[ImageTools newCGImageFromPlanar8VImageBuffer:error:](ImageTools, "newCGImageFromPlanar8VImageBuffer:error:", a3);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v8 = (__CFData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = CGImageDestinationCreateWithData(v8, v9, 1uLL, 0);

    if (v10)
    {
      v12 = (void *)MEMORY[0x1E0C99D80];
      *(float *)&v11 = a4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageDestinationSetProperties(v10, (CFDictionaryRef)objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E0CBC780], 0));

      CGImageDestinationAddImage(v10, v7, 0);
      if (!CGImageDestinationFinalize(v10))
      {
        if (a5)
        {
          +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not finalize image."));
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        v8 = 0;
      }
      CFRelease(v10);
      CGImageRelease(v7);
      v7 = v8;
      v8 = v7;
    }
    else
    {
      if (a5)
      {
        +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not create image destination."));
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      CGImageRelease(v7);
      v7 = 0;
    }

  }
  return v7;
}

+ (id)saveVImageBufferPlanar8ToData:(const vImage_Buffer *)a3 deriveTypeFromFileName:(id)a4 error:(id *)a5
{
  id v7;
  CGImage *v8;
  CGImage *v9;
  void *v10;

  v7 = a4;
  v8 = +[ImageTools newCGImageFromPlanar8VImageBuffer:error:](ImageTools, "newCGImageFromPlanar8VImageBuffer:error:", a3, a5);
  if (v8)
  {
    v9 = v8;
    +[ImageTools writeImageToData:type:error:](ImageTools, "writeImageToData:type:error:", v8, +[ImageTools guessType:](ImageTools, "guessType:", v7), a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v9);
  }
  else
  {
    CGImageRelease(0);
    v10 = 0;
  }

  return v10;
}

+ (id)saveVImageBufferPlanar8:(const vImage_Buffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  CGImage *v13;
  CGImage *v14;
  _BOOL4 v15;
  id v16;

  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    if (v10)
    {
      objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSTemporaryDirectory();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathComponent:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = +[ImageTools newCGImageFromPlanar8VImageBuffer:error:](ImageTools, "newCGImageFromPlanar8VImageBuffer:error:", a3, a6);
    if (v13)
    {
      v14 = v13;
      v15 = +[ImageTools writeImage:toFile:error:](ImageTools, "writeImage:toFile:error:", v13, v11, a6);
      CGImageRelease(v14);
      if (!v15)
      {
        v16 = 0;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v11 = 0;
  }
  v16 = v11;
  v11 = v16;
LABEL_10:

  return v16;
}

+ (CGImage)newCGImageFromRGBA8VImageBuffer:(const vImage_Buffer *)a3 error:(id *)a4
{
  CGColorSpace *v6;
  CGDataProvider *v7;
  CGDataProvider *v8;
  CGImageRef v9;
  CGImage *v10;

  v6 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v7 = CGDataProviderCreateWithData(0, a3->data, a3->height * a3->rowBytes, 0);
  if (!v7)
  {
    if (a4)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not create data provider."));
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
        return v10;
    }
    else
    {
      v10 = 0;
      if (!v6)
        return v10;
    }
LABEL_9:
    CGColorSpaceRelease(v6);
    return v10;
  }
  v8 = v7;
  v9 = CGImageCreate(a3->width, a3->height, 8uLL, 0x20uLL, a3->rowBytes, v6, 0, v7, 0, 0, kCGRenderingIntentDefault);
  v10 = v9;
  if (a4 && !v9)
  {
    +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not create image."));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  CGDataProviderRelease(v8);
  if (v6)
    goto LABEL_9;
  return v10;
}

+ (id)writeImageToData:(CGImage *)a3 type:(__CFString *)a4 error:(id *)a5
{
  __CFData *v8;
  CGImageDestination *v9;
  CGImageDestination *v10;
  __CFData *v11;

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v8 = (__CFData *)objc_claimAutoreleasedReturnValue();
  v9 = CGImageDestinationCreateWithData(v8, a4, 1uLL, 0);
  if (v9)
  {
    v10 = v9;
    CGImageDestinationAddImage(v9, a3, 0);
    if (!CGImageDestinationFinalize(v10))
    {
      if (a5)
      {
        +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not finalize image."));
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }

      v8 = 0;
    }
    CFRelease(v10);
    v11 = v8;
    v8 = v11;
  }
  else if (a5)
  {
    +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not create image destination."));
    v11 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)saveVImageBufferRGBA8ToJPEGData:(const vImage_Buffer *)a3 withCompressionQuality:(float)a4 error:(id *)a5
{
  CGImage *v7;
  __CFData *v8;
  __CFString *v9;
  CGImageDestination *v10;
  double v11;
  void *v12;
  void *v13;

  v7 = +[ImageTools newCGImageFromRGBA8VImageBuffer:error:](ImageTools, "newCGImageFromRGBA8VImageBuffer:error:", a3);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v8 = (__CFData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v10 = CGImageDestinationCreateWithData(v8, v9, 1uLL, 0);

    if (v10)
    {
      v12 = (void *)MEMORY[0x1E0C99D80];
      *(float *)&v11 = a4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CGImageDestinationSetProperties(v10, (CFDictionaryRef)objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x1E0CBC780], 0));

      CGImageDestinationAddImage(v10, v7, 0);
      if (!CGImageDestinationFinalize(v10))
      {
        if (a5)
        {
          +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not finalize image."));
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }

        v8 = 0;
      }
      CFRelease(v10);
      CGImageRelease(v7);
      v7 = v8;
      v8 = v7;
    }
    else
    {
      if (a5)
      {
        +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not create image destination."));
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      CGImageRelease(v7);
      v7 = 0;
    }

  }
  return v7;
}

+ (id)saveVImageBufferRGBA8ToData:(const vImage_Buffer *)a3 deriveTypeFromFileName:(id)a4 error:(id *)a5
{
  id v7;
  CGImage *v8;
  CGImage *v9;
  void *v10;

  v7 = a4;
  v8 = +[ImageTools newCGImageFromRGBA8VImageBuffer:error:](ImageTools, "newCGImageFromRGBA8VImageBuffer:error:", a3, a5);
  if (v8)
  {
    v9 = v8;
    +[ImageTools writeImageToData:type:error:](ImageTools, "writeImageToData:type:error:", v8, +[ImageTools guessType:](ImageTools, "guessType:", v7), a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)writeImage:(CGImage *)a3 toFile:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  const __CFURL *v9;
  __CFString *v10;
  CGImageDestination *v11;
  CGImageDestination *v12;
  BOOL v13;
  BOOL v14;

  v7 = (void *)MEMORY[0x1E0C99E98];
  v8 = a4;
  v9 = (const __CFURL *)objc_msgSend(v7, "fileURLWithPath:", v8);
  v10 = +[ImageTools guessType:](ImageTools, "guessType:", v8);

  v11 = CGImageDestinationCreateWithURL(v9, v10, 1uLL, 0);
  if (v11)
  {
    v12 = v11;
    CGImageDestinationAddImage(v11, a3, 0);
    v13 = CGImageDestinationFinalize(v12);
    v14 = v13;
    if (a5 && !v13)
    {
      +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not finalize image."));
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    CFRelease(v12);
  }
  else if (a5)
  {
    +[AX_CVML_Error createNSErrorWithStatus:andMessage:](AX_CVML_Error, "createNSErrorWithStatus:andMessage:", 16766, CFSTR("Could not finalize image."));
    v14 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    return 0;
  }
  return v14;
}

+ (id)saveVImageBufferRGBA8:(const vImage_Buffer *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  CGImage *v13;
  CGImage *v14;
  id v15;

  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    if (v10)
    {
      objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSTemporaryDirectory();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingPathComponent:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = +[ImageTools newCGImageFromRGBA8VImageBuffer:error:](ImageTools, "newCGImageFromRGBA8VImageBuffer:error:", a3, a6);
    if (!v13)
    {
      v15 = 0;
      goto LABEL_12;
    }
    v14 = v13;
    if (!+[ImageTools writeImage:toFile:error:](ImageTools, "writeImage:toFile:error:", v13, v11, a6))
    {

      v11 = 0;
    }
    CGImageRelease(v14);
  }
  else
  {
    v11 = 0;
  }
  v15 = v11;
  v11 = v15;
LABEL_12:

  return v15;
}

+ (id)saveCGImage:(const CGImage *)a3 withName:(id)a4 inFolder:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  const __CFURL *v12;
  NSObject *v13;
  CGImageDestination *v14;
  CGImageDestination *v15;
  _BOOL8 v16;
  NSObject *v17;
  const __CFURL *v18;
  int v20;
  const __CFURL *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    if (v9)
    {
      objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSTemporaryDirectory();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingPathComponent:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v12 = (const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
    AXLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412290;
      v21 = v12;
      _os_log_impl(&dword_1B0E3B000, v13, OS_LOG_TYPE_DEFAULT, "Saving image to URL: %@", (uint8_t *)&v20, 0xCu);
    }

    v14 = CGImageDestinationCreateWithURL(v12, +[ImageTools guessType:](ImageTools, "guessType:", v8), 1uLL, 0);
    if (v14)
    {
      v15 = v14;
      CGImageDestinationAddImage(v14, a3, 0);
      v16 = CGImageDestinationFinalize(v15);
      AXLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v16);
        v18 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
        v20 = 138412290;
        v21 = v18;
        _os_log_impl(&dword_1B0E3B000, v17, OS_LOG_TYPE_DEFAULT, "Succe: %@", (uint8_t *)&v20, 0xCu);

      }
      CFRelease(v15);
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)saveRawBuffer:(void *)a3 withWidth:(unsigned int)a4 andHeight:(unsigned int)a5 andRowBytes:(unsigned int)a6 withName:(id)a7 inFolder:(id)a8 error:(id *)a9
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;

  v21 = a5;
  v22 = a4;
  v20 = a6;
  v13 = a7;
  v14 = a8;
  if (objc_msgSend(v13, "length"))
  {
    if (v14)
    {
      objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      NSTemporaryDirectory();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathComponent:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v17 = a5 * a6;
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v17 + 12);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "replaceBytesInRange:withBytes:", 0, 4, &v22);
    objc_msgSend(v18, "replaceBytesInRange:withBytes:", 4, 4, &v20);
    objc_msgSend(v18, "replaceBytesInRange:withBytes:", 8, 4, &v21);
    objc_msgSend(v18, "replaceBytesInRange:withBytes:", 12, v17, a3);
    objc_msgSend(v18, "writeToFile:atomically:", v15, 1);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (vImage_Buffer)getVImageBufferFromCVPixelBuffer:(SEL)a3 channel:(__CVBuffer *)a4 error:(int)a5
{
  vImage_Buffer *result;

  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  if (CVPixelBufferGetPlaneCount(a4))
  {
    retstr->data = CVPixelBufferGetBaseAddressOfPlane(a4, a5);
    retstr->height = CVPixelBufferGetHeightOfPlane(a4, a5);
    retstr->width = CVPixelBufferGetWidthOfPlane(a4, a5);
    result = (vImage_Buffer *)CVPixelBufferGetBytesPerRowOfPlane(a4, a5);
  }
  else
  {
    retstr->data = CVPixelBufferGetBaseAddress(a4);
    retstr->height = CVPixelBufferGetHeight(a4);
    retstr->width = CVPixelBufferGetWidth(a4);
    result = (vImage_Buffer *)CVPixelBufferGetBytesPerRow(a4);
  }
  retstr->rowBytes = (size_t)result;
  return result;
}

+ (vImage_Buffer)getVImageBufferFromCGImageLuma:(SEL)a3 error:(CGImage *)a4
{
  CGContext *v7;
  size_t Width;
  size_t Height;
  unsigned __int8 *Data;
  size_t v11;
  void *v12;
  _BYTE *v13;
  int v14;
  uint64_t v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  uint64_t v21;
  int v22;
  unsigned int v23;
  vImage_Buffer *result;
  unsigned __int8 *v25;
  size_t v26;
  int v27;
  int v28;
  CGRect v29;

  v7 = +[ImageTools createARGBBitmapContextWithImage:](ImageTools, "createARGBBitmapContextWithImage:", a4, a5);
  Width = CGImageGetWidth(a4);
  Height = CGImageGetHeight(a4);
  v29.size.width = (double)Width;
  v29.size.height = (double)Height;
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  CGContextDrawImage(v7, v29, a4);
  Data = (unsigned __int8 *)CGBitmapContextGetData(v7);
  retstr->data = 0;
  retstr->height = Height;
  v11 = (Width + 15) & 0xFFFFFFFFFFFFFFF0;
  v28 = Width;
  retstr->width = Width;
  retstr->rowBytes = v11;
  v25 = Data;
  v26 = v11;
  v12 = malloc_type_malloc(v11 * Height, 0x20EEE66AuLL);
  retstr->data = v12;
  v27 = Height;
  if ((int)Height >= 1)
  {
    v13 = v12;
    v14 = 0;
    v15 = Width;
    v16 = v25;
    do
    {
      if (v28 >= 1)
      {
        v17 = 0;
        LODWORD(v18) = 0;
        do
        {
          ColorSpace = CGImageGetColorSpace(a4);
          Model = CGColorSpaceGetModel(ColorSpace);
          v21 = (int)v18;
          v18 = (int)v18 + 1;
          if (Model)
          {
            v22 = v16[v18];
            LODWORD(v18) = v21 + 4;
            v23 = (77 * v22 + 151 * v16[v21 + 2] + 28 * v16[v21 + 3]) >> 8;
          }
          else
          {
            v23 = (255 * v16[v21]) >> 8;
          }
          v13[v17++] = v23;
        }
        while (v15 != v17);
      }
      v16 += CGBitmapContextGetBytesPerRow(v7);
      v13 += v26;
      ++v14;
    }
    while (v14 != v27);
  }
  CGContextRelease(v7);
  free(v25);
  return result;
}

+ (vImage_Buffer)getVImageBufferFromCGImage:(SEL)a3 error:(CGImage *)a4
{
  CGDataProvider *DataProvider;
  const __CFData *v8;
  size_t Length;
  void *v10;
  const UInt8 *BytePtr;
  size_t v12;
  vImage_Buffer *result;

  DataProvider = CGImageGetDataProvider(a4);
  v8 = CGDataProviderCopyData(DataProvider);
  *(_OWORD *)&retstr->data = 0u;
  *(_OWORD *)&retstr->width = 0u;
  retstr->width = CGImageGetWidth(a4);
  retstr->height = CGImageGetHeight(a4);
  retstr->rowBytes = CGImageGetBytesPerRow(a4);
  Length = CFDataGetLength(v8);
  v10 = malloc_type_malloc(Length, 0xADB244AAuLL);
  retstr->data = v10;
  BytePtr = CFDataGetBytePtr(v8);
  v12 = CFDataGetLength(v8);
  memcpy(v10, BytePtr, v12);
  CFRelease(v8);
  return result;
}

+ (int64_t)extractLumaFromBGRA8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 toBuffer:(void *)a7 withBytesPerRow:(unint64_t)a8
{
  int64_t v8;
  const char *ModuleDescription;
  const char *StatusDescription;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  unsigned __int8 *v17;
  unint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  _BYTE *v21;
  unint64_t v22;
  unsigned __int8 *v23;
  int8x8x4_t v25;

  if (a3 && a7)
  {
    v8 = 16768;
    if (a5)
    {
      v11 = 0;
      v12 = a5;
      v13 = a4 - 8;
      v14 = a4;
      v15 = a4 - 8;
      v16 = (char *)a7 + 8;
      v17 = (unsigned __int8 *)a3;
      do
      {
        v18 = 0;
        v19 = v16;
        do
        {
          v25 = vld4_s8((const char *)a3);
          a3 = (char *)a3 + 32;
          v20 = v18;
          v21 = v19;
          *(int8x8_t *)((char *)a7 + v18) = vaddhn_s16((int16x8_t)vmlal_u8(vmull_u8((uint8x8_t)v25.val[1], (uint8x8_t)0x9696969696969696), (uint8x8_t)v25.val[0], (uint8x8_t)0x1D1D1D1D1D1D1D1DLL), (int16x8_t)vmull_u8((uint8x8_t)v25.val[2], (uint8x8_t)0x4C4C4C4C4C4C4C4CLL));
          v18 += 8;
          v19 += 8;
        }
        while (v18 <= v13);
        if (v18 < v14)
        {
          v22 = v15 - v20;
          v23 = v17;
          do
          {
            *v21++ = (unsigned __int16)(29 * *v23 + 150 * v23[1] + 76 * v23[2]) >> 8;
            v23 += 4;
            --v22;
          }
          while (v22);
        }
        a7 = (char *)a7 + v18;
        v17 += a6;
        ++v11;
        v16 += a8;
      }
      while (v11 != v12);
    }
  }
  else
  {
    v8 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools extractLumaFromBGRA8Buffer:withWidth:andWithHeight:andWithBytesPerRow:toBuffer:withBytesPerRow:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1537);
  }
  return v8;
}

+ (int64_t)create420YCbCr8BufferFromPlanar8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 toLumaBuffer:(void *)a7 withBytesPerRowLuma:(unint64_t)a8 andToChromaBuffer:(void *)a9 withBytesPerRowChroma:(unint64_t)a10
{
  char *v11;
  char *v14;
  _BYTE *v15;
  int64_t v16;
  const char *ModuleDescription;
  const char *StatusDescription;
  int v19;
  char *v20;
  int v21;
  char *v22;
  unint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;

  v11 = (char *)a7;
  v14 = (char *)a3;
  v15 = a9;
  if (a3 && a7 && a9)
  {
    v16 = 16768;
    if (a5 >= 1)
    {
      v19 = a5;
      v20 = (char *)a3;
      do
      {
        memcpy(v11, v20, a4);
        v20 += a6;
        v11 += a8;
        --v19;
      }
      while (v19);
      v16 = 16768;
      if (a5 >= 2)
      {
        v21 = 0;
        v22 = &v14[a6];
        v23 = 2 * a6;
        do
        {
          if (a4 >= 1)
          {
            v24 = 1;
            v25 = v15;
            do
            {
              *v25++ = (v14[v24]
                      + v14[v24 - 1]
                      + v22[v24 - 1]
                      + v22[v24]) >> 2;
              v26 = v24 + 1;
              v24 += 2;
            }
            while (v26 < a4);
          }
          v22 += v23;
          v14 += v23;
          v15 += a10;
          ++v21;
        }
        while (v21 != a5 >> 1);
      }
    }
  }
  else
  {
    v16 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools create420YCbCr8BufferFromPlanar8Buffer:withWidth:andWithHeight:andWithBytesPerRow:toLumaBuffer:withBytesPerRowLuma:andToChromaBuffer:withBytesPerRowChroma:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1615);
  }
  return v16;
}

+ (int64_t)create420YCbCr8BufferFromRGB8Buffer:(void *)a3 withWidth:(int)a4 andWithHeight:(int)a5 andWithBytesPerRow:(unint64_t)a6 andAlphaFirst:(BOOL)a7 toLumaBuffer:(void *)a8 withBytesPerRowLuma:(unint64_t)a9 andToChromaBuffer:(void *)a10 withBytesPerRowChroma:(unint64_t)a11
{
  float v11;
  float v12;
  _BYTE *v13;
  int64_t v14;
  const char *ModuleDescription;
  const char *StatusDescription;
  int v17;
  char *v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  unsigned int v26;
  unsigned int v27;
  float v28;
  float v29;
  unsigned int v30;
  float v31;
  float v32;
  unsigned int v33;
  float v34;
  float v35;
  float v36;
  float v37;
  _BYTE *v38;
  unsigned int v39;
  float v40;
  float v41;
  float v42;
  float v43;
  unsigned int v44;
  float v45;
  float v46;
  float v47;
  float v48;
  char *v49;
  unsigned int v50;
  float v51;
  unsigned int v52;
  float v53;
  float v54;
  float v55;
  unsigned int v56;
  float v57;
  unsigned int v58;
  float v59;
  unint64_t v60;
  unsigned int v61;
  char *v62;
  unsigned int v63;
  float v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  float v68;

  v13 = a10;
  if (a3 && a8 && a10)
  {
    v14 = 16768;
    v17 = a5 >> 1;
    v18 = (char *)a3 + a7;
    v19 = a4 >> 1;
    v20 = 2 * (a6 - 4 * a4) + 8;
    v21 = (a6 - 4 * a4) + 12;
    do
    {
      v22 = 0;
      v23 = &v18[v20];
      v24 = &v18[v21];
      v25 = v18;
      v26 = v19;
      do
      {
        LOBYTE(v11) = *v25;
        LOBYTE(v12) = v25[1];
        *(float *)&v27 = (float)LODWORD(v12) * 0.5872;
        v28 = *(float *)&v27 + (float)((float)LODWORD(v11) * 0.2988);
        LOBYTE(v27) = v25[2];
        v29 = (float)(v28 + (float)((float)v27 * 0.114)) + 0.5;
        v30 = 1132396544;
        if (v29 >= 0.0)
          v31 = v29;
        else
          v31 = 0.0;
        if (v29 <= 255.0)
          v32 = v31;
        else
          v32 = 255.0;
        *((_BYTE *)a8 + v22) = (int)v32;
        LOBYTE(v32) = *v25;
        LOBYTE(v31) = v25[1];
        *(float *)&v33 = (float)LODWORD(v31) * -0.3391;
        v34 = *(float *)&v33 + (float)((float)LODWORD(v32) * -0.1726);
        LOBYTE(v33) = v25[2];
        v35 = (float)(v34 + (float)((float)v33 * 0.5117)) + 128.5;
        if (v35 >= 0.0)
          v36 = v35;
        else
          v36 = 0.0;
        if (v35 <= 255.0)
          v37 = v36;
        else
          v37 = 255.0;
        v38 = &v13[v22];
        v13[v22] = (int)v37;
        LOBYTE(v37) = *v25;
        LOBYTE(v36) = v25[1];
        *(float *)&v39 = (float)LODWORD(v36) * -0.4282;
        v40 = *(float *)&v39 + (float)((float)LODWORD(v37) * 0.5115);
        LOBYTE(v39) = v25[2];
        v41 = (float)(v40 + (float)((float)v39 * -0.083)) + 128.5;
        if (v41 >= 0.0)
          v42 = v41;
        else
          v42 = 0.0;
        if (v41 <= 255.0)
          v43 = v42;
        else
          v43 = 255.0;
        v18 = v23;
        v38[1] = (int)v43;
        LOBYTE(v43) = v25[4];
        LOBYTE(v42) = v25[5];
        *(float *)&v44 = (float)LODWORD(v42) * 0.5872;
        v45 = *(float *)&v44 + (float)((float)LODWORD(v43) * 0.2988);
        LOBYTE(v44) = v25[6];
        v46 = (float)(v45 + (float)((float)v44 * 0.114)) + 0.5;
        if (v46 >= 0.0)
          v47 = v46;
        else
          v47 = 0.0;
        if (v46 <= 255.0)
          v48 = v47;
        else
          v48 = 255.0;
        v49 = v24;
        *((_BYTE *)a8 + v22 + 1) = (int)v48;
        LOBYTE(v48) = *v38;
        LOBYTE(v30) = v25[4];
        *(float *)&v50 = (float)v30;
        v51 = (float)LODWORD(v48) + (float)(*(float *)&v50 * -0.1726);
        LOBYTE(v50) = v25[5];
        *(float *)&v52 = (float)v50;
        v53 = v51 + (float)(*(float *)&v52 * -0.3391);
        LOBYTE(v52) = v25[6];
        v54 = (float)((float)(v53 + (float)((float)v52 * 0.5117)) + 128.5) * 0.5;
        v55 = 255.0;
        if (v54 <= 255.0)
        {
          v55 = 0.0;
          if (v54 >= 0.0)
            v55 = v54;
        }
        *v38 = (int)v55;
        LOBYTE(v54) = v38[1];
        LOBYTE(v55) = v25[4];
        *(float *)&v56 = (float)LODWORD(v55);
        v57 = (float)LODWORD(v54) + (float)(*(float *)&v56 * 0.5115);
        LOBYTE(v56) = v25[5];
        *(float *)&v58 = (float)v56;
        v59 = v57 + (float)(*(float *)&v58 * -0.4282);
        LOBYTE(v58) = v25[6];
        v11 = (float)((float)(v59 + (float)((float)v58 * -0.083)) + 128.5) * 0.5;
        v12 = 255.0;
        if (v11 <= 255.0)
        {
          v12 = 0.0;
          if (v11 >= 0.0)
            v12 = v11;
        }
        v25 += 8;
        v38[1] = (int)v12;
        v22 += 2;
        v23 += 8;
        v24 += 8;
        --v26;
      }
      while (v26);
      v60 = a9;
      v61 = v19;
      do
      {
        v62 = (char *)a8 + v60;
        LOBYTE(v11) = *(v49 - 2);
        LOBYTE(v12) = *(v49 - 3);
        *(float *)&v63 = (float)LODWORD(v12) * 0.5872;
        v64 = *(float *)&v63 + (float)((float)LODWORD(v11) * 0.2988);
        LOBYTE(v63) = *(v49 - 4);
        *(float *)&v65 = (float)v63;
        *(float *)&v66 = (float)(v64 + (float)(*(float *)&v65 * 0.114)) + 0.5;
        *v62 = (int)*(float *)&v66;
        LOBYTE(v66) = v49[2];
        LOBYTE(v65) = v49[1];
        *(float *)&v67 = (float)v65 * 0.5872;
        v68 = *(float *)&v67 + (float)((float)v66 * 0.2988);
        LOBYTE(v67) = *v49;
        v12 = (float)v67;
        v11 = (float)(v68 + (float)(v12 * 0.114)) + 0.5;
        v62[1] = (int)v11;
        v18 += 8;
        v60 += 2;
        v49 += 8;
        --v61;
      }
      while (v61);
      a8 = (char *)a8 + a9 + a9;
      v13 += a11;
      --v17;
    }
    while (v17);
  }
  else
  {
    v14 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools create420YCbCr8BufferFromRGB8Buffer:withWidth:andWithHeight:andWithBytesPerRow:andAlphaFirst:toLumaBuffer:withBytesPerRowLuma:andToChromaBuffer:withBytesPerRowChroma:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1666);
  }
  return v14;
}

+ (int64_t)createRGB8BufferFrom420Y8PlanarBuffer:(void *)a3 withBytesPerRowY:(unint64_t)a4 andFrom420Cb8Buffer:(void *)a5 withBytesPerRowCb:(unint64_t)a6 andFrom420Cr8Buffer:(void *)a7 withBytesPerRowCr:(unint64_t)a8 andWithWidth:(int)a9 andWithHeight:(int)a10 andAlphaFirst:(BOOL)a11 toRGB8Buffer:(void *)__b withBytesPerRowDst:(unint64_t)a13
{
  int64_t v17;
  const char *ModuleDescription;
  const char *StatusDescription;
  int v20;
  unsigned int v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  char *v32;
  int v33;
  int v34;
  int v35;
  unsigned int v36;
  int v37;
  int v38;
  char *v39;
  int32x2_t v40;
  int32x2_t v41;
  int32x2_t v42;
  char v43;
  int32x2_t v44;
  unsigned int v45;
  int32x2_t v46;
  char *v47;
  int v48;
  unsigned int v49;
  int32x2_t v50;
  int v51;
  unsigned int v52;
  int32x2_t v53;
  int v54;

  if (a7 && a5 && a3 && __b)
  {
    v20 = a10 >> 1;
    memset(__b, 255, a10 * a13);
    v21 = 0;
    v22 = (char *)a3 + 1;
    do
    {
      if (a9 >= 1)
      {
        v23 = 0;
        v24 = (char *)__b + a13 * v21;
        v25 = v21 + 1;
        v26 = &v22[a4 * v25];
        v27 = &v22[a4 * v21];
        v28 = (char *)__b + a13 * v25;
        v29 = v21 >> 1;
        v30 = (unsigned __int8 *)a7 + v29 * a8;
        v31 = (unsigned __int8 *)a5 + v29 * a6;
        do
        {
          v32 = &v24[a11];
          v34 = *v31++;
          v33 = v34;
          v35 = *v30++;
          v33 -= 128;
          v36 = v27[v23 - 1];
          v37 = 512 - 343 * v33;
          v38 = 1773 * v33 + 512;
          v39 = &v26[v23];
          v40.i32[0] = 512;
          v40.i32[1] = v37;
          v41 = vmla_s32(v40, vdup_n_s32(v35 - 128), (int32x2_t)0xFFFFFD370000057CLL);
          v42 = vdup_n_s32(v36);
          if ((int)((v36 + (v38 >> 10)) & ~((int)(v36 + (v38 >> 10)) >> 31)) >= 255)
            v43 = -1;
          else
            v43 = (v36 + (v38 >> 10)) & ~((int)(v36 + (v38 >> 10)) >> 31);
          v44 = vmin_s32(vmax_s32(vsra_n_s32(v42, v41, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          v32[2] = v43;
          v32[1] = v44.i8[4];
          *v32 = v44.i8[0];
          v45 = *(v39 - 1);
          v46 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v45), v41, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          v47 = &v28[a11];
          *v47 = v46.i8[0];
          v48 = (v45 + (v38 >> 10)) & ~((int)(v45 + (v38 >> 10)) >> 31);
          v47[1] = v46.i8[4];
          if (v48 >= 255)
            LOBYTE(v48) = -1;
          v47[2] = v48;
          v49 = v27[v23];
          v50 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v49), v41, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          v32[4] = v50.i8[0];
          v51 = (v49 + (v38 >> 10)) & ~((int)(v49 + (v38 >> 10)) >> 31);
          v32[5] = v50.i8[4];
          if (v51 >= 255)
            LOBYTE(v51) = -1;
          v32[6] = v51;
          v52 = *v39;
          v53 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v52), v41, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          v47[4] = v53.i8[0];
          v54 = (v52 + (v38 >> 10)) & ~((int)(v52 + (v38 >> 10)) >> 31);
          v47[5] = v53.i8[4];
          if (v54 >= 255)
            LOBYTE(v54) = -1;
          v47[6] = v54;
          v23 += 2;
          v24 += 8;
          v28 += 8;
        }
        while ((int)v23 < a9);
      }
      v21 += 2;
      --v20;
    }
    while (v20);
    return 16768;
  }
  else
  {
    v17 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools createRGB8BufferFrom420Y8PlanarBuffer:withBytesPerRowY:andFrom420Cb8Buffer:withBytesPerRowCb:andFrom420Cr8Buffer:withBytesPerRowCr:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1769);
  }
  return v17;
}

+ (int64_t)createRGB8BufferFrom420Y8BiPlanarBuffer:(void *)a3 withBytesPerRowLuma:(unint64_t)a4 andFrom420CbCr8Buffer:(void *)a5 withBytesPerRowChroma:(unint64_t)a6 andWithWidth:(int)a7 andWithHeight:(int)a8 andAlphaFirst:(BOOL)a9 toRGB8Buffer:(void *)__b withBytesPerRowDst:(unint64_t)a11
{
  int64_t v16;
  const char *ModuleDescription;
  const char *StatusDescription;
  int v19;
  unsigned int v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;
  int v34;
  int v35;
  int32x2_t v36;
  int32x2_t v37;
  int32x2_t v38;
  unsigned int v39;
  int32x2_t v40;
  int v41;
  unsigned int v42;
  int32x2_t v43;
  int v44;
  unsigned int v45;
  int32x2_t v46;
  int v47;

  if (a5 && a3 && __b)
  {
    v19 = a8 >> 1;
    memset(__b, 255, a8 * a11);
    v20 = 0;
    v21 = (char *)__b + a9 + 4;
    v22 = (char *)a3 + 1;
    do
    {
      if (a7 >= 1)
      {
        v23 = 0;
        v24 = &v21[a11 * v20];
        v25 = v20 + 1;
        v26 = &v22[a4 * v25];
        v27 = &v22[a4 * v20];
        v28 = (char *)a5 + a6 * ((unint64_t)v20 >> 1);
        v29 = &v21[a11 * v25];
        do
        {
          v30 = v28[v23] - 128;
          v31 = v28[v23 + 1] - 128;
          v32 = v27[v23 - 1];
          v33 = 512 - 343 * v30;
          v34 = 1773 * v30 + 512;
          v35 = (v32 + (v34 >> 10)) & ~((int)(v32 + (v34 >> 10)) >> 31);
          if (v35 >= 255)
            LOBYTE(v35) = -1;
          *(v24 - 2) = v35;
          v36.i32[0] = 512;
          v36.i32[1] = v33;
          v37 = vmla_s32(v36, vdup_n_s32(v31), (int32x2_t)0xFFFFFD370000057CLL);
          v38 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v32), v37, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          *(v24 - 3) = v38.i8[4];
          *(v24 - 4) = v38.i8[0];
          v39 = v26[v23 - 1];
          v40 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v39), v37, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          *(v29 - 4) = v40.i8[0];
          *(v29 - 3) = v40.i8[4];
          v41 = (v39 + (v34 >> 10)) & ~((int)(v39 + (v34 >> 10)) >> 31);
          if (v41 >= 255)
            LOBYTE(v41) = -1;
          *(v29 - 2) = v41;
          v42 = v27[v23];
          v43 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v42), v37, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          *v24 = v43.i8[0];
          v24[1] = v43.i8[4];
          v44 = (v42 + (v34 >> 10)) & ~((int)(v42 + (v34 >> 10)) >> 31);
          if (v44 >= 255)
            LOBYTE(v44) = -1;
          v24[2] = v44;
          v45 = v26[v23];
          v46 = vmin_s32(vmax_s32(vsra_n_s32(vdup_n_s32(v45), v37, 0xAuLL), 0), (int32x2_t)0xFF000000FFLL);
          *v29 = v46.i8[0];
          v29[1] = v46.i8[4];
          v47 = (v45 + (v34 >> 10)) & ~((int)(v45 + (v34 >> 10)) >> 31);
          if (v47 >= 255)
            LOBYTE(v47) = -1;
          v29[2] = v47;
          v23 += 2;
          v24 += 8;
          v29 += 8;
        }
        while ((int)v23 < a7);
      }
      v20 += 2;
      --v19;
    }
    while (v19);
    return 16768;
  }
  else
  {
    v16 = 16765;
    ModuleDescription = CVML_getModuleDescription(16765);
    StatusDescription = CVML_getStatusDescription(0x417DuLL);
    syslog(3, "%s error %lld:%s in %s @ %s:%d\n", ModuleDescription, -3, StatusDescription, "+[ImageTools createRGB8BufferFrom420Y8BiPlanarBuffer:withBytesPerRowLuma:andFrom420CbCr8Buffer:withBytesPerRowChroma:andWithWidth:andWithHeight:andAlphaFirst:toRGB8Buffer:withBytesPerRowDst:]", "/Library/Caches/com.apple.xbs/Sources/AccessibilityMediaUtilities/AXMediaUtilities/source/ImageTools.m", 1873);
  }
  return v16;
}

@end
