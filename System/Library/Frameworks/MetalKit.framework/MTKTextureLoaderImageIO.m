@implementation MTKTextureLoaderImageIO

- (id)getDataForArrayElement:(unint64_t)a3 face:(unint64_t)a4 level:(unint64_t)a5 depthPlane:(unint64_t)a6 bytesPerRow:(unint64_t *)a7 bytesPerImage:(unint64_t *)a8
{
  unint64_t bytesPerRow;
  unint64_t v13;

  bytesPerRow = self->_bytesPerRow;
  v13 = -[MTKTextureLoaderData height](self, "height", a3, a4, a5, a6) * bytesPerRow;
  *a7 = self->_bytesPerRow;
  *a8 = v13;
  return (id)objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", -[NSData bytes](self->_imageData, "bytes") + v13 * a4, v13, 0);
}

- (BOOL)decodeCGImageImageProvider:(CGImage *)a3 CGImageProvider:(CGImageProvider *)a4 options:(id)a5
{
  CGColorSpace *ColorSpace;
  __CFDictionary *v9;
  __CFDictionary *Mutable;
  const void *v11;
  size_t BitsPerComponent;
  uint64_t AlphaInfo;
  CGImageBlockSet *v14;
  _BOOL8 v15;
  double v16;
  double v17;
  double v18;
  uint64_t ComponentType;
  unsigned int PixelSize;
  size_t v21;
  _BOOL4 expandRGBToRGBA;
  int v23;
  size_t v24;
  char *v25;
  char *v26;
  BOOL v27;
  BOOL result;
  void *v29;
  id v30;
  unint64_t v31;
  void *v32;
  char *v33;
  _BOOL8 v34;
  id v35;
  uint64_t v36;
  char *Data;

  ColorSpace = (CGColorSpace *)CGImageProviderGetColorSpace();
  if (CGColorSpaceGetModel(ColorSpace) > kCGColorSpaceModelRGB)
  {
    v9 = 0;
    goto LABEL_16;
  }
  CGImageProviderGetSize();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  v9 = Mutable;
  if (Mutable)
  {
    v11 = (const void *)*MEMORY[0x24BDBD270];
    CFDictionarySetValue(Mutable, CFSTR("kCGImageBlockSingletonRequest"), (const void *)*MEMORY[0x24BDBD270]);
    CGImageGetBitsPerPixel(a3);
    BitsPerComponent = CGImageGetBitsPerComponent(a3);
    AlphaInfo = CGImageGetAlphaInfo(a3);
    CGImageGetBitmapInfo(a3);
    if (BitsPerComponent == 8)
    {
      CFDictionarySetValue(v9, CFSTR("kCGImageBlockIOSurfaceOptimizedRequest"), v11);
      CFDictionarySetValue(v9, CFSTR("kCGImageBlockFormatRequest"), CFSTR("kCGImageBlockFormatBGRx8"));
    }
    v14 = (CGImageBlockSet *)CGImageProviderCopyImageBlockSetWithOptions();
    self->_blockSet = v14;
    if (v14)
    {
      if (CGImageBlockSetGetCount() == 1)
      {
        v15 = BitsPerComponent == 8;
        CGImageBlockSetGetImageBlock();
        CGImageBlockGetRect();
        v17 = v16;
        -[MTKTextureLoaderData setWidth:](self, "setWidth:", (unint64_t)v18);
        -[MTKTextureLoaderData setHeight:](self, "setHeight:", (unint64_t)v17);
        self->_bytesPerRow = CGImageBlockGetBytesPerRow();
        Data = (char *)CGImageBlockGetData();
        ComponentType = CGImageBlockSetGetComponentType();
        PixelSize = CGImageBlockSetGetPixelSize();
        v21 = v15 && PixelSize == 3 ? 4 : PixelSize;
        if (-[MTKTextureLoaderImageIO determineCGImageBlockFormatWithComponentType:alphaInfo:andPixelSizeBytes:andColorSpace:isOptimized:options:](self, "determineCGImageBlockFormatWithComponentType:alphaInfo:andPixelSizeBytes:andColorSpace:isOptimized:options:", ComponentType, AlphaInfo, v21, ColorSpace, v15, a5))
        {
          expandRGBToRGBA = self->_expandRGBToRGBA;
          if (!self->_expandRGBToRGBA)
          {
            v26 = Data;
LABEL_22:
            if ((_mtkLinkedOnOrAfter(0) & 1) != 0
              || (__CFString *)-[MTKTextureLoaderData imageOrigin](self, "imageOrigin") == CFSTR("MTKTextureLoaderOriginBottomLeft"))
            {
              v30 = objc_alloc(MEMORY[0x24BDBCE50]);
              v31 = self->_bytesPerRow * -[MTKTextureLoaderData height](self, "height");
              v32 = v30;
              v33 = v26;
              v34 = expandRGBToRGBA;
            }
            else
            {
              v29 = malloc_type_malloc(self->_bytesPerRow * -[MTKTextureLoaderData height](self, "height"), 0x77A72E94uLL);
              reflectImage(v26, v29, -[MTKTextureLoaderData width](self, "width"), -[MTKTextureLoaderData height](self, "height"), self->_bytesPerRow, 8 * self->_pixelFormatInfo.type.normal.pixelBytes, self->_pixelFormatInfo.type.normal.componentCount);
              if (expandRGBToRGBA)
              {
                free(v26);
              }
              else
              {
                CGImageBlockSetRelease();
                self->_blockSet = 0;
              }
              v35 = objc_alloc(MEMORY[0x24BDBCE50]);
              v31 = self->_bytesPerRow * -[MTKTextureLoaderData height](self, "height");
              v32 = v35;
              v33 = (char *)v29;
              v34 = 1;
            }
            self->_imageData = (NSData *)objc_msgSend(v32, "initWithBytesNoCopy:length:freeWhenDone:", v33, v31, v34);
            v27 = 1;
            goto LABEL_19;
          }
          v23 = ComponentType - 2;
          if ((ComponentType - 2) >= 4)
            -[MTKTextureLoaderImageIO decodeCGImageImageProvider:CGImageProvider:options:].cold.1();
          v36 = qword_20AE4B7F0[v23];
          v24 = qword_20AE4B810[v23];
          v25 = (char *)malloc_type_malloc(4* v24* -[MTKTextureLoaderData height](self, "height")* -[MTKTextureLoaderData width](self, "width"), 0x7055CC3FuLL);
          if (::expandRGBToRGBA(Data, v25, -[MTKTextureLoaderData width](self, "width"), -[MTKTextureLoaderData height](self, "height"), self->_bytesPerRow, v21, v24, v36))
          {
            self->_bytesPerRow = 4 * v24 * -[MTKTextureLoaderData width](self, "width");
            CGImageBlockSetRelease();
            self->_blockSet = 0;
            v26 = v25;
            goto LABEL_22;
          }
        }
      }
    }
  }
LABEL_16:
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  v27 = 0;
  result = 0;
  if (v9)
  {
LABEL_19:
    CFRelease(v9);
    return v27;
  }
  return result;
}

- (BOOL)determineCGImageBlockFormatWithComponentType:(int)a3 alphaInfo:(unsigned int)a4 andPixelSizeBytes:(unint64_t)a5 andColorSpace:(CGColorSpace *)a6 isOptimized:(BOOL)a7 options:(id)a8
{
  _BOOL4 v9;
  CGColorSpaceRef v14;
  int v15;
  MTKTextureLoaderImageIO *v16;
  uint64_t v17;
  BOOL result;
  __int128 v19;
  __int128 v20;
  MTKTextureLoaderImageIO *v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;

  v9 = a7;
  self->_expandRGBToRGBA = 0;
  v14 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF318]);
  v15 = 0;
  if (_mtkLinkedOnOrAfter(0))
    v15 = CFEqual(a6, v14) != 0;
  CFRelease(v14);
  if (objc_msgSend(a8, "objectForKey:", CFSTR("MTKTextureLoaderOptionSRGB")))
    v15 = objc_msgSend((id)objc_msgSend(a8, "objectForKey:", CFSTR("MTKTextureLoaderOptionSRGB")), "BOOLValue");
  switch(a3)
  {
    case 1:
      if (a5 == 1)
      {
        v16 = self;
        if (v15)
          v17 = 11;
        else
          v17 = 10;
        goto LABEL_41;
      }
      if (a5 == 2)
      {
        v16 = self;
        if (v15)
          v17 = 31;
        else
          v17 = 30;
        goto LABEL_41;
      }
      if (a5 != 4)
        return 0;
      if (v9)
      {
        v16 = self;
        if (v15)
          v17 = 81;
        else
          v17 = 80;
LABEL_41:
        -[MTKTextureLoaderData setPixelFormat:](v16, "setPixelFormat:", v17);
      }
LABEL_42:
      -[MTKTextureLoaderData pixelFormat](self, "pixelFormat");
      MTLPixelFormatGetInfoForDevice();
      *(_OWORD *)&self->_pixelFormatInfo.name = v23;
      *(_OWORD *)&self->_pixelFormatInfo.castClass = v24;
      *(_OWORD *)&self->_pixelFormatInfo.type.compressed.blockWidth = v25;
      self->_pixelFormatInfo.type.normal.pixelBytesRenderMSAA = v26;
      return self->_pixelFormatInfo.flags & 1;
    case 2:
      result = 0;
      switch(a5)
      {
        case 2uLL:
          v16 = self;
          v17 = 20;
          goto LABEL_41;
        case 4uLL:
          v16 = self;
          v17 = 60;
          goto LABEL_41;
        case 6uLL:
          v21 = self;
          v22 = 110;
          goto LABEL_36;
        case 8uLL:
          v16 = self;
          v17 = 110;
          goto LABEL_41;
        default:
          return result;
      }
      return result;
    case 3:
      *((_QWORD *)&v19 + 1) = a5;
      *(_QWORD *)&v19 = a5 - 4;
      switch((unint64_t)(v19 >> 2))
      {
        case 0uLL:
          v16 = self;
          v17 = 53;
          goto LABEL_41;
        case 1uLL:
          v16 = self;
          v17 = 103;
          goto LABEL_41;
        case 2uLL:
          v21 = self;
          v22 = 123;
          goto LABEL_36;
        case 3uLL:
          v16 = self;
          v17 = 123;
          goto LABEL_41;
        default:
          return 0;
      }
    case 4:
      *((_QWORD *)&v20 + 1) = a5;
      *(_QWORD *)&v20 = a5 - 4;
      switch((unint64_t)(v20 >> 2))
      {
        case 0uLL:
          v16 = self;
          v17 = 55;
          goto LABEL_41;
        case 1uLL:
          v16 = self;
          v17 = 105;
          goto LABEL_41;
        case 2uLL:
          v21 = self;
          v22 = 125;
          goto LABEL_36;
        case 3uLL:
          v16 = self;
          v17 = 125;
          goto LABEL_41;
        default:
          return 0;
      }
    case 5:
      result = 0;
      switch(a5)
      {
        case 2uLL:
          v16 = self;
          v17 = 25;
          goto LABEL_41;
        case 4uLL:
          v16 = self;
          v17 = 65;
          goto LABEL_41;
        case 6uLL:
          v21 = self;
          v22 = 115;
LABEL_36:
          -[MTKTextureLoaderData setPixelFormat:](v21, "setPixelFormat:", v22);
          self->_expandRGBToRGBA = 1;
          goto LABEL_42;
        case 8uLL:
          v16 = self;
          v17 = 115;
          goto LABEL_41;
        default:
          return result;
      }
      return result;
    default:
      return 0;
  }
}

- (MTKTextureLoaderImageIO)initWithCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5
{
  MTKTextureLoaderImageIO *v8;
  MTKTextureLoaderImageIO *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTKTextureLoaderImageIO;
  v8 = -[MTKTextureLoaderData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    if (!-[MTKTextureLoaderImageIO decodeCGImage:options:](v8, "decodeCGImage:options:", a3, a4))
    {
      v9 = 0;
      if (a5)
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Image decoding failed"));
    }
  }
  return v9;
}

- (MTKTextureLoaderImageIO)initWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  MTKTextureLoaderImageIO *v8;
  CGImageSourceRef v9;
  CGImageSource *v10;
  __CFDictionary *Mutable;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const __CFDictionary *v14;
  const void *v15;
  uint64_t v16;
  MTKTextureLoaderOrigin *v17;
  CGImageRef ImageAtIndex;
  CGImage *v19;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)MTKTextureLoaderImageIO;
  v8 = -[MTKTextureLoaderData init](&v24, sel_init);
  if (v8)
  {
    v9 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
    if (!v9)
    {
      if (a5)
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Image decoding failed"));

      return 0;
    }
    v10 = v9;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
    if (!Mutable)
    {
      if (a5)
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Image decoding failed"));

      goto LABEL_40;
    }
    v12 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("kCGImageBlockIOSurfaceOptimizedRequest"), (const void *)*MEMORY[0x24BDBD270]);
    v13 = CGImageSourceCopyPropertiesAtIndex(v10, 0, v12);
    if (!v13)
    {
      if (a5)
        *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)CFSTR("Image decoding failed"));

      goto LABEL_39;
    }
    v14 = v13;
    v15 = (const void *)*MEMORY[0x24BDD9698];
    if (CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x24BDD9698]))
    {
      v16 = objc_msgSend((id)CFDictionaryGetValue(v14, v15), "integerValue");
      if (v16 == 1)
      {
        v17 = &MTKTextureLoaderOriginTopLeft;
      }
      else
      {
        if (v16 != 4)
        {
          if (a5)
          {
            v21 = CFSTR("Unsupported image orientation");
            goto LABEL_32;
          }
LABEL_33:

LABEL_38:
          CFRelease(v14);
LABEL_39:
          CFRelease(v12);
LABEL_40:
          CFRelease(v10);
          return 0;
        }
        v17 = &MTKTextureLoaderOriginBottomLeft;
      }
      -[MTKTextureLoaderData setImageOrigin:](v8, "setImageOrigin:", *v17);
    }
    ImageAtIndex = CGImageSourceCreateImageAtIndex(v10, 0, v12);
    if (ImageAtIndex)
    {
      v19 = ImageAtIndex;
      if (-[MTKTextureLoaderImageIO decodeCGImage:options:](v8, "decodeCGImage:options:", ImageAtIndex, a4))
      {
        if (!objc_msgSend(a4, "objectForKey:", CFSTR("MTKTextureLoaderOptionCubeLayout")))
        {
LABEL_25:
          CGImageRelease(v19);
          CFRelease(v14);
          CFRelease(v12);
          CFRelease(v10);
          return v8;
        }
        v20 = -[MTKTextureLoaderData height](v8, "height");
        if (v20 == 6 * -[MTKTextureLoaderData width](v8, "width"))
        {
          -[MTKTextureLoaderData setHeight:](v8, "setHeight:", -[MTKTextureLoaderData width](v8, "width"));
          -[MTKTextureLoaderData setNumFaces:](v8, "setNumFaces:", 6);
          -[MTKTextureLoaderData setTextureType:](v8, "setTextureType:", 5);
          goto LABEL_25;
        }
        if (!a5)
          goto LABEL_37;
        v22 = CFSTR("Image height must be six times the image width for a vertical cubemap texture");
      }
      else
      {
        if (!a5)
        {
LABEL_37:

          CGImageRelease(v19);
          goto LABEL_38;
        }
        v22 = CFSTR("Image decoding failed");
      }
      *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v22);
      goto LABEL_37;
    }
    if (a5)
    {
      v21 = CFSTR("Image decoding failed");
LABEL_32:
      *a5 = (id)_newMTKTextureErrorWithCodeAndErrorString(0, (uint64_t)v21);
      goto LABEL_33;
    }
    goto LABEL_33;
  }
  return v8;
}

- (BOOL)decodeCGImage:(CGImage *)a3 options:(id)a4
{
  uint64_t ImageProvider;

  ImageProvider = CGImageGetImageProvider();
  if (ImageProvider)
    return -[MTKTextureLoaderImageIO decodeCGImageImageProvider:CGImageProvider:options:](self, "decodeCGImageImageProvider:CGImageProvider:options:", a3, ImageProvider, a4);
  else
    return -[MTKTextureLoaderImageIO decodeCGImageDataProvider:options:](self, "decodeCGImageDataProvider:options:", a3, a4);
}

- (void)dealloc
{
  __CFData *cfData;
  objc_super v4;

  self->_imageData = 0;
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  cfData = self->_cfData;
  if (cfData)
  {
    CFRelease(cfData);
    self->_cfData = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MTKTextureLoaderImageIO;
  -[MTKTextureLoaderData dealloc](&v4, sel_dealloc);
}

- (BOOL)decodeCGImageDataProvider:(CGImage *)a3 options:(id)a4
{
  char BitmapInfo;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  int BitsPerPixel;
  int v10;
  __CFData *v11;
  uint64_t v12;
  CGDataProvider *DataProvider;
  const UInt8 *BytePtr;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;

  BitmapInfo = CGImageGetBitmapInfo(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  Model = CGColorSpaceGetModel(ColorSpace);
  BitsPerPixel = CGImageGetBitsPerPixel(a3);
  v10 = BitsPerPixel;
  if (BitsPerPixel != 32 && BitsPerPixel != 8 || ColorSpace && Model > kCGColorSpaceModelRGB)
    goto LABEL_8;
  self->_bytesPerRow = CGImageGetBytesPerRow(a3);
  -[MTKTextureLoaderData setWidth:](self, "setWidth:", CGImageGetWidth(a3));
  -[MTKTextureLoaderData setHeight:](self, "setHeight:", CGImageGetHeight(a3));
  if (v10 == 8)
  {
    if ((BitmapInfo & 0x1F) == 7 || ColorSpace == 0)
      v12 = 1;
    else
      v12 = 10;
LABEL_16:
    -[MTKTextureLoaderData setPixelFormat:](self, "setPixelFormat:", v12);
LABEL_17:
    -[MTKTextureLoaderData pixelFormat](self, "pixelFormat", v12);
    MTLPixelFormatGetInfoForDevice();
    *(_OWORD *)&self->_pixelFormatInfo.name = v17;
    *(_OWORD *)&self->_pixelFormatInfo.castClass = v18;
    *(_OWORD *)&self->_pixelFormatInfo.type.compressed.blockWidth = v19;
    self->_pixelFormatInfo.type.normal.pixelBytesRenderMSAA = v20;
    DataProvider = CGImageGetDataProvider(a3);
    v11 = CGDataProviderCopyData(DataProvider);
    self->_cfData = v11;
    if (v11)
    {
      BytePtr = CFDataGetBytePtr(v11);
      if (BytePtr)
      {
        self->_imageData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", BytePtr, self->_bytesPerRow * -[MTKTextureLoaderData height](self, "height"), 0);
        LOBYTE(v11) = 1;
      }
      else
      {
        CFRelease(self->_cfData);
        LOBYTE(v11) = 0;
        self->_cfData = 0;
      }
    }
    return (char)v11;
  }
  if (v10 != 32)
  {
LABEL_8:
    LOBYTE(v11) = 0;
    return (char)v11;
  }
  -[MTKTextureLoaderData setPixelFormat:](self, "setPixelFormat:", 70);
  LOBYTE(v11) = 0;
  v12 = 80;
  switch(BitmapInfo & 0x1F)
  {
    case 0:
      return (char)v11;
    case 2:
    case 4:
    case 6:
      goto LABEL_16;
    default:
      goto LABEL_17;
  }
  return (char)v11;
}

- (void)decodeCGImageImageProvider:CGImageProvider:options:.cold.1()
{
  __assert_rtn("getFillValueForComponentType", "MTKTextureLoaderImageIO.m", 700, "!\"Incorrect values being passed to fillForComponent\");
}

@end
