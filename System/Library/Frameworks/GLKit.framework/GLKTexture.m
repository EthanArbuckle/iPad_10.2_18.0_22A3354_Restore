@implementation GLKTexture

- (GLKTexture)init
{
  GLKTexture *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GLKTexture;
  result = -[GLKTexture init](&v3, sel_init);
  if (result)
  {
    result->_type = 5121;
    *(int32x2_t *)&result->_bindTarget = vdup_n_s32(0xDE1u);
    result->_hasPremultipliedAlpha = 0;
    result->_unpackAlignment = 4;
    result->_requestIssuedForSRGB = 0;
  }
  return result;
}

- (void)dealloc
{
  __CFData *cfData;
  objc_super v4;

  if (self->_blockSet)
    CGImageBlockSetRelease();
  cfData = self->_cfData;
  if (cfData)
    CFRelease(cfData);
  -[GLKTexture setLabel:](self, "setLabel:", 0);
  v4.receiver = self;
  v4.super_class = (Class)GLKTexture;
  -[GLKTexture dealloc](&v4, sel_dealloc);
}

- (void)updateRequestedOperationsFromOptions:(id)a3
{
  self->_requestIssuedForMipmapGeneration = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("GLKTextureLoaderGenerateMipmaps")), "BOOLValue");
  self->_requestIssuedToReorientToGL = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("GLKTextureLoaderOriginBottomLeft")), "BOOLValue");
  self->_requestIssuedForAlphaPremultiplication = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("GLKTextureLoaderApplyPremultiplication")), "BOOLValue");
  self->_requestIssuedForSRGB = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("GLKTextureLoaderSRGB")), "BOOLValue");
  self->_requestIssuedToInterpretGrayAsAlpha = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", CFSTR("GLKTextureLoaderGrayscaleAsAlpha")), "BOOLValue");
  self->_isMipmapped = self->_requestIssuedForMipmapGeneration;
}

- (BOOL)shouldApplyPremultiplication
{
  return self->_requestIssuedForAlphaPremultiplication
      && self->_hasAlpha
      && !self->_hasPremultipliedAlpha
      && self->_dataCategory != 5;
}

- (BOOL)shouldApplyReorientToGL
{
  return self->_requestIssuedToReorientToGL && self->_dataCategory != 5;
}

- (BOOL)canHonorSRGBrequest
{
  return (self->_internalFormat & 0xFFFFFFFD) == 35904;
}

- (GLKTexture)initWithData:(id)a3 forceCubeMap:(BOOL)a4 wasCubeMap:(BOOL *)a5 cubeMapIndex:(int)a6 options:(id)a7 error:(id *)a8
{
  _BOOL4 v12;
  GLKTexture *v14;
  int v15;
  int loadMode;
  _OWORD v18[2];
  __int128 v19;
  int v20;

  v12 = a4;
  v14 = -[GLKTexture init](self, "init");
  if (v14)
  {
    v20 = 0;
    v19 = 0u;
    memset(v18, 0, sizeof(v18));
    objc_msgSend(a3, "getBytes:length:", v18, 52);
    if (HIDWORD(v19) == 559044176)
      v15 = 2;
    else
      v15 = 1;
    v14->_loadMode = v15;
    -[GLKTexture updateRequestedOperationsFromOptions:](v14, "updateRequestedOperationsFromOptions:", a7);
    v14->_index = a6;
    if (a5)
      *a5 = 0;
    loadMode = v14->_loadMode;
    if (loadMode != 2)
    {
      if (loadMode != 1)
        return v14;
      v14->_isCubeMap = v12;
      if (-[GLKTexture loadWithData:options:error:](v14, "loadWithData:options:error:", a3, a7, a8))
        return v14;
LABEL_17:

      return 0;
    }
    if (!-[GLKTexture loadPVRTCData:error:](v14, "loadPVRTCData:error:", a3, a8))
      goto LABEL_17;
    if (a5 && v14->_isCubeMap)
      *a5 = 1;
    if (v12)
    {
      v14->_isCubeMap = 1;
      *(_QWORD *)&v14->_bindTarget = 0x851500008513;
    }
  }
  return v14;
}

- (GLKTexture)initWithCGImage:(CGImage *)a3 forceCubeMap:(BOOL)a4 wasCubeMap:(BOOL *)a5 cubeMapIndex:(int)a6 options:(id)a7 error:(id *)a8
{
  GLKTexture *v14;
  GLKTexture *v15;

  v14 = -[GLKTexture init](self, "init");
  v15 = v14;
  if (v14)
  {
    v14->_loadMode = 1;
    -[GLKTexture updateRequestedOperationsFromOptions:](v14, "updateRequestedOperationsFromOptions:", a7);
    v15->_isCubeMap = a4;
    v15->_index = a6;
    if (a5)
      *a5 = 0;
    if (!-[GLKTexture loadCGImage:options:error:](v15, "loadCGImage:options:error:", a3, a7, a8))
    {

      return 0;
    }
  }
  return v15;
}

- (GLKTexture)initWithDecodedData:(id)a3 width:(unsigned int)a4 height:(unsigned int)a5 rowBytes:(unsigned int)a6 texture:(id)a7 cubeMapIndex:(int)a8 options:(id)a9 error:(id *)a10
{
  GLKTexture *v16;

  v16 = -[GLKTexture init](self, "init");
  if (v16)
  {
    v16->_loadMode = objc_msgSend(a7, "loadMode");
    -[GLKTexture updateRequestedOperationsFromOptions:](v16, "updateRequestedOperationsFromOptions:", a9);
    v16->_dataCategory = objc_msgSend(a7, "dataCategory");
    v16->_imageData = (NSData *)a3;
    v16->_width = a4;
    v16->_height = a5;
    v16->_rowBytes = a6;
    v16->_index = a8;
    v16->_isCubeMap = objc_msgSend(a7, "isCubeMap");
    v16->_bitsPerPixel = objc_msgSend(a7, "bitsPerPixel");
    v16->_nComponents = objc_msgSend(a7, "nComponents");
    v16->_orientation = objc_msgSend(a7, "orientation");
    v16->_texelFormat = objc_msgSend(a7, "texelFormat");
    v16->_internalFormat = objc_msgSend(a7, "internalFormat");
    v16->_format = objc_msgSend(a7, "format");
    v16->_type = objc_msgSend(a7, "type");
    v16->_isPowerOfTwo = objc_msgSend(a7, "isPowerOfTwo");
    v16->_isVerticalFlipped = objc_msgSend(a7, "isVerticalFlipped");
    v16->_hasAlpha = objc_msgSend(a7, "hasAlpha");
    v16->_numMipMapLevels = 1;
    v16->_bindTarget = objc_msgSend(a7, "bindTarget");
    v16->_textureTarget = objc_msgSend(a7, "textureTarget");
  }
  return v16;
}

- (BOOL)loadPVRTCData:(id)a3 error:(id *)a4
{
  NSData *v7;
  unsigned int *v8;
  unsigned int v9;
  unsigned int v10;
  BOOL v11;
  char v12;
  const __CFString *v13;
  uint64_t v14;
  BOOL v15;
  unsigned int v16;
  BOOL result;
  _BOOL4 v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;

  self->_imageData = 0;
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  v7 = (NSData *)a3;
  self->_imageData = v7;
  v8 = -[NSData bytes](v7, "bytes");
  v9 = v8[4];
  if (!-[GLKTexture determinePVRFormat:](self, "determinePVRFormat:", v9))
  {
    if (a4)
    {
      v13 = CFSTR("Unsupported PVR format");
      v14 = 11;
LABEL_31:
      *a4 = (id)_GLKTextureErrorWithCodeAndErrorString(v14, (uint64_t)v13);
    }
LABEL_32:

    result = 0;
    self->_imageData = 0;
    return result;
  }
  v10 = v8[3];
  self->_numMipMapLevels = v10 + 1;
  if ((v9 & 0xFE) != 0x18)
  {
    self->_dataCategory = 7;
    goto LABEL_21;
  }
  self->_dataCategory = 5;
  v11 = self->_requestIssuedForMipmapGeneration && v10 == 0;
  v12 = !v11;
  if (v11)
  {
    if (!a4)
      goto LABEL_27;
    *a4 = (id)_GLKTextureErrorWithCodeAndErrorString(13, (uint64_t)CFSTR("Cannot generate mipmaps for compressed PVR file"));
  }
  if (self->_requestIssuedToReorientToGL)
  {
    if (a4)
    {
      v12 = 0;
      *a4 = (id)_GLKTextureErrorWithCodeAndErrorString(15, (uint64_t)CFSTR("Cannot reorient compressed PVR file"));
      goto LABEL_28;
    }
LABEL_27:
    v12 = 0;
  }
LABEL_28:
  if (self->_requestIssuedForAlphaPremultiplication)
  {
    if (a4)
    {
      v13 = CFSTR("Cannot premultiply compressed PVR file");
      v14 = 16;
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if ((v12 & 1) == 0)
    goto LABEL_32;
LABEL_21:
  v15 = v8[10] != 0;
  v16 = v8[2];
  self->_width = v16;
  result = 1;
  v18 = HIWORD(v9) & 1;
  if (v18)
    v19 = 4;
  else
    v19 = 1;
  self->_height = v8[1];
  self->_orientation = v19;
  v20 = v8[6];
  self->_bitsPerPixel = v20;
  self->_rowBytes = (v20 * v16) >> 3;
  self->_unpackAlignment = 1;
  v21 = v8[12];
  if (v21 <= 1)
    v21 = 1;
  self->_isCubeMap = (v9 & 0x1000) != 0;
  self->_isMipmapped |= BYTE1(v9) & 1;
  self->_isVerticalFlipped = v18;
  self->_hasAlpha = v15;
  self->_nPrimarySurfaces = v21;
  self->_nSurfaces = v8[3] + 1;
  *(int8x8_t *)&self->_bindTarget = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(((v9 >> 12) & 1) == 0), 0x1FuLL)), (int8x8_t)vdup_n_s32(0xDE1u), (int8x8_t)0x851500008513);
  self->_primarySurfaceLength = v8[5];
  return result;
}

- (void)alignmentFix:(unsigned int)a3 data:(const void *)a4
{
  unsigned int v5;
  int v6;
  void *result;
  int v8;
  size_t v10;
  unsigned int v11;
  unint64_t v12;
  void *memptr;

  v5 = self->_width * a3;
  v6 = self->_rowBytes - v5;
  if (!v6)
  {
    result = 0;
    v8 = 1;
LABEL_7:
    self->_unpackAlignment = v8;
    return result;
  }
  if (v6 <= 1)
  {
    result = 0;
    v8 = 2;
    goto LABEL_7;
  }
  if (v6 <= 3)
  {
    result = 0;
    v8 = 4;
    goto LABEL_7;
  }
  self->_unpackAlignment = 8;
  if (v6 < 8)
    return 0;
  v10 = (v5 + 7) & 0xFFFFFFF8;
  memptr = 0;
  if (malloc_type_posix_memalign(&memptr, 8uLL, self->_height * (unint64_t)v10, 0xA8230A87uLL))
    return 0;
  if (self->_height)
  {
    v11 = 0;
    v12 = 0;
    do
    {
      memcpy((char *)memptr + v11, (char *)a4 + (self->_rowBytes * v12++), v10);
      v11 += v10;
    }
    while (v12 < self->_height);
  }
  self->_rowBytes = v10;
  return memptr;
}

- (BOOL)decodeCGImageDataProvider:(CGImage *)a3
{
  char BitmapInfo;
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  unsigned int BitsPerPixel;
  unsigned int v9;
  BOOL v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  BOOL v14;
  CGDataProvider *DataProvider;
  __CFData *v16;
  const UInt8 *BytePtr;
  const UInt8 *v18;
  void *v19;
  void *v20;
  void *v22;

  BitmapInfo = CGImageGetBitmapInfo(a3);
  ColorSpace = CGImageGetColorSpace(a3);
  Model = CGColorSpaceGetModel(ColorSpace);
  BitsPerPixel = CGImageGetBitsPerPixel(a3);
  self->_bitsPerPixel = BitsPerPixel;
  if (BitsPerPixel != 32 && BitsPerPixel != 8 || ColorSpace && Model > kCGColorSpaceModelRGB)
    return 0;
  self->_rowBytes = CGImageGetBytesPerRow(a3);
  self->_width = CGImageGetWidth(a3);
  self->_height = CGImageGetHeight(a3);
  self->_type = 5121;
  v9 = self->_bitsPerPixel;
  if (v9 == 8)
  {
    if (ColorSpace)
      v14 = (BitmapInfo & 0x1F) == 7;
    else
      v14 = 1;
    if (v14)
      v13 = 6406;
    else
      v13 = 6409;
    if (v14)
      v12 = 23;
    else
      v12 = 20;
    self->_internalFormat = v13;
    v11 = 1;
  }
  else
  {
    if (v9 != 32)
      return 0;
    v10 = 0;
    self->_internalFormat = 6408;
    if ((BitmapInfo & 0x1Fu) > 6 || ((1 << (BitmapInfo & 0x1F)) & 0x54) == 0)
      return v10;
    v11 = 4;
    v12 = 2;
    v13 = 32993;
  }
  self->_format = v13;
  self->_texelFormat = v12;
  self->_nComponents = v11;
  DataProvider = CGImageGetDataProvider(a3);
  v16 = CGDataProviderCopyData(DataProvider);
  self->_cfData = v16;
  if (!v16)
    return 0;
  BytePtr = CFDataGetBytePtr(v16);
  if (BytePtr)
  {
    v18 = BytePtr;
    v19 = -[GLKTexture alignmentFix:data:](self, "alignmentFix:data:", v11, BytePtr);
    if (v19)
    {
      v20 = v19;
LABEL_31:
      CFRelease(self->_cfData);
      self->_cfData = 0;
      v10 = 1;
      self->_imageData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v20, self->_rowBytes * self->_height, 1);
      return v10;
    }
    if (-[GLKTexture shouldApplyReorientToGL](self, "shouldApplyReorientToGL")
      || -[GLKTexture shouldApplyPremultiplication](self, "shouldApplyPremultiplication"))
    {
      v22 = malloc_type_malloc(self->_rowBytes * (unint64_t)self->_height, 0x2E325D47uLL);
      if (v22)
      {
        v20 = v22;
        memcpy(v22, v18, self->_rowBytes * self->_height);
        goto LABEL_31;
      }
    }
    else
    {
      self->_imageData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v18, self->_rowBytes * self->_height, 0);
    }
    return 1;
  }
  CFRelease(self->_cfData);
  v10 = 0;
  self->_cfData = 0;
  return v10;
}

- (BOOL)decodeCGImageImageProvider:(CGImage *)a3 CGImageProvider:(CGImageProvider *)a4
{
  CGColorSpace *ColorSpace;
  uint64_t Model;
  uint64_t v7;
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  CGImageBlockSet *v10;
  double v11;
  double v12;
  uint64_t Data;
  uint64_t ComponentType;
  unsigned int PixelSize;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;

  ColorSpace = (CGColorSpace *)CGImageProviderGetColorSpace();
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model > 1)
    return 0;
  v7 = Model;
  CGImageProviderGetSize();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    return 0;
  v9 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("kCGImageBlockIOSurfaceOptimizedRequest"), (const void *)*MEMORY[0x24BDBD270]);
  CFDictionarySetValue(v9, CFSTR("kCGImageBlockFormatRequest"), CFSTR("kCGImageBlockFormatBGRx8"));
  v10 = (CGImageBlockSet *)CGImageProviderCopyImageBlockSetWithOptions();
  self->_blockSet = v10;
  if (v10)
  {
    if (CGImageBlockSetGetCount() != 1)
      goto LABEL_13;
    CGImageBlockSetGetImageBlock();
    CGImageBlockGetRect();
    self->_width = v11;
    self->_height = v12;
    self->_rowBytes = CGImageBlockGetBytesPerRow();
    Data = CGImageBlockGetData();
    ComponentType = CGImageBlockSetGetComponentType();
    PixelSize = CGImageBlockSetGetPixelSize();
    v16 = PixelSize == 3 ? 4 : PixelSize;
    if (-[GLKTexture determineCGImageBlockFormatWithComponentType:andPixelSize:andColorModel:](self, "determineCGImageBlockFormatWithComponentType:andPixelSize:andColorModel:", ComponentType, v16, v7))
    {
      v17 = -[GLKTexture alignmentFix:data:](self, "alignmentFix:data:", v16, Data);
      if (v17)
      {
        v18 = v17;
        CGImageBlockSetRelease();
        self->_blockSet = 0;
        v19 = 1;
        self->_imageData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", v18, self->_rowBytes * self->_height, 1);
      }
      else
      {
        self->_imageData = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytesNoCopy:length:freeWhenDone:", Data, self->_rowBytes * self->_height, 0);
        v19 = 1;
      }
    }
    else
    {
LABEL_13:
      CGImageBlockSetRelease();
      v19 = 0;
      self->_blockSet = 0;
    }
  }
  else
  {
    v19 = 0;
  }
  CFRelease(v9);
  return v19;
}

- (BOOL)decodeCGImage:(CGImage *)a3
{
  uint64_t ImageProvider;

  ImageProvider = CGImageGetImageProvider();
  if (ImageProvider)
    return -[GLKTexture decodeCGImageImageProvider:CGImageProvider:](self, "decodeCGImageImageProvider:CGImageProvider:", a3, ImageProvider);
  else
    return -[GLKTexture decodeCGImageDataProvider:](self, "decodeCGImageDataProvider:", a3);
}

- (BOOL)loadWithData:(id)a3 options:(id)a4 error:(id *)a5
{
  CGImageSourceRef v8;
  CGImageSource *v9;
  __CFDictionary *Mutable;
  __CFDictionary *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  const void *v14;
  const __CFNumber *Value;
  unsigned int orientation;
  const void *v17;
  const __CFBoolean *v18;
  CGImageRef ImageAtIndex;
  CGImage *v20;
  BOOL v21;
  BOOL result;
  void *v23;

  self->_imageData = 0;
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  self->_dataCategory = 1;
  v8 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (!v8)
    goto LABEL_18;
  v9 = v8;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
    goto LABEL_17;
  v11 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("kCGImageBlockIOSurfaceOptimizedRequest"), (const void *)*MEMORY[0x24BDBD270]);
  CFDictionarySetValue(v11, CFSTR("kCGImageBlockFormatRequest"), CFSTR("kCGImageBlockFormatBGRx8"));
  v12 = CGImageSourceCopyPropertiesAtIndex(v9, 0, v11);
  if (!v12)
    goto LABEL_17;
  v13 = v12;
  v14 = (const void *)*MEMORY[0x24BDD9698];
  if (CFDictionaryContainsKey(v12, (const void *)*MEMORY[0x24BDD9698]))
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(v13, v14);
    CFNumberGetValue(Value, kCFNumberIntType, &self->_orientation);
    orientation = self->_orientation;
    if (orientation != 1 && orientation != 4)
      self->_orientation = 0;
  }
  else
  {
    self->_orientation = 1;
  }
  v17 = (const void *)*MEMORY[0x24BDD9630];
  if (CFDictionaryContainsKey(v13, (const void *)*MEMORY[0x24BDD9630]))
  {
    v18 = (const __CFBoolean *)CFDictionaryGetValue(v13, v17);
    self->_hasAlpha = CFBooleanGetValue(v18) != 0;
  }
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v9, 0, v11);
  if (!ImageAtIndex)
  {
    CFRelease(v11);
    CFRelease(v13);
LABEL_17:
    CFRelease(v9);
    goto LABEL_18;
  }
  v20 = ImageAtIndex;
  v21 = -[GLKTexture decodeCGImage:](self, "decodeCGImage:", ImageAtIndex);
  CGImageRelease(v20);
  CFRelease(v11);
  CFRelease(v13);
  CFRelease(v9);
  if (v21)
  {
    *(_QWORD *)&self->_nPrimarySurfaces = 0x100000001;
    result = 1;
    self->_numMipMapLevels = 1;
    *(int8x8_t *)&self->_bindTarget = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(!self->_isCubeMap), 0x1FuLL)), (int8x8_t)vdup_n_s32(0xDE1u), (int8x8_t)0x851500008513);
    return result;
  }
LABEL_18:
  if (!a5)
    return 0;
  v23 = (void *)_GLKTextureErrorWithCodeAndErrorString(12, (uint64_t)CFSTR("Image decoding failed"));
  result = 0;
  *a5 = v23;
  return result;
}

- (BOOL)loadCGImage:(CGImage *)a3 options:(id)a4 error:(id *)a5
{
  BOOL v8;
  const __CFString *v9;

  if (!a3)
  {
    if (a5)
    {
      v9 = CFSTR("Invalid CGImageRef");
LABEL_10:
      v8 = 0;
      *a5 = (id)_GLKTextureErrorWithCodeAndErrorString(12, (uint64_t)v9);
      return v8;
    }
    return 0;
  }

  self->_imageData = 0;
  if (self->_blockSet)
  {
    CGImageBlockSetRelease();
    self->_blockSet = 0;
  }
  v8 = 1;
  self->_dataCategory = 1;
  self->_orientation = 1;
  self->_hasAlpha = CGImageGetAlphaInfo(a3) - 1 < 4;
  if (!-[GLKTexture decodeCGImage:](self, "decodeCGImage:", a3))
  {
    if (a5)
    {
      v9 = CFSTR("Image decoding failed");
      goto LABEL_10;
    }
    return 0;
  }
  *(_QWORD *)&self->_nPrimarySurfaces = 0x100000001;
  self->_numMipMapLevels = 1;
  *(int8x8_t *)&self->_bindTarget = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(!self->_isCubeMap), 0x1FuLL)), (int8x8_t)vdup_n_s32(0xDE1u), (int8x8_t)0x851500008513);
  return v8;
}

- (BOOL)_uploadToGLTexture:(unsigned int)a3 data:(id)a4 width:(int)a5 height:(int)a6 dataCategory:(int)a7 cubeMapIndex:(int)a8 mipMapIndex:(int)a9 error:(id *)a10
{
  NSString *label;
  GLint v18;
  uint64_t Error;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  GLint v26;
  GLint v27;
  GLint params;

  glBindTexture(self->_bindTarget, a3);
  label = self->_label;
  if (label)
    glLabelObjectEXT(0x1702u, a3, 0, -[NSString cStringUsingEncoding:](label, "cStringUsingEncoding:", 1));
  glTexParameteri(self->_bindTarget, 0x2802u, 33071);
  glTexParameteri(self->_bindTarget, 0x2803u, 33071);
  glTexParameteri(self->_bindTarget, 0x2800u, 9729);
  if (self->_isMipmapped)
    v18 = 9987;
  else
    v18 = 9729;
  glTexParameteri(self->_bindTarget, 0x2801u, v18);
  if (a7 == 5)
  {
    glCompressedTexImage2D(self->_textureTarget + a8, a9, self->_internalFormat, a5, a6, 0, objc_msgSend(a4, "length"), (const GLvoid *)objc_msgSend(a4, "bytes"));
  }
  else
  {
    params = 0;
    glGetIntegerv(0xCF5u, &params);
    glPixelStorei(0xCF5u, self->_unpackAlignment);
    glTexImage2D(self->_textureTarget + a8, a9, self->_internalFormat, a5, a6, 0, self->_format, self->_type, (const GLvoid *)objc_msgSend(a4, "bytes"));
    glPixelStorei(0xCF5u, params);
  }
  Error = glGetError();
  v20 = Error;
  if ((_DWORD)Error)
  {
    if ((_DWORD)Error == 1281)
    {
      v26 = 0;
      v27 = 0;
      glGetIntegerv(0xD33u, &v27);
      glGetIntegerv(0x851Cu, &v26);
      if (self->_isCubeMap || v27 >= a5)
      {
        if (self->_isCubeMap || v27 >= a6)
        {
          if (a5 == a6 || !self->_isCubeMap)
          {
            if (self->_isCubeMap && v26 < a5)
              v21 = CFSTR("Cube Map width / height are greater than GL_MAX_CUBE_MAP_TEXTURE_SIZE");
            else
              v21 = 0;
            if (a7 == 5 && (!self->_isCubeMap || v26 >= a5))
            {
              if (objc_msgSend(a4, "length") == (a6 * a5 * self->_bitsPerPixel) >> 3)
                v21 = 0;
              else
                v21 = CFSTR("Compressed texture image size is not consistent with the format, dimensions, and contents of the specified compressed image data.");
            }
          }
          else
          {
            v21 = CFSTR("Cube Map width and height are not equal.");
          }
        }
        else
        {
          v21 = CFSTR("Texture height is greater than GL_MAX_TEXTURE_SIZE");
        }
      }
      else
      {
        v21 = CFSTR("Texture width is greater than GL_MAX_TEXTURE_SIZE");
      }
    }
    else
    {
      v21 = CFSTR("OpenGLES Error.");
    }
    v22 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20), CFSTR("GLKTextureLoaderGLErrorKey"), v21, CFSTR("GLKTextureLoaderErrorKey"), 0);
    if (a10)
    {
      v23 = v22;
      if (a7 == 5)
        v24 = 7;
      else
        v24 = 8;
      *a10 = (id)_GLKTextureErrorWithCodeAndUserInfo(v24, v23);
    }
  }
  return (_DWORD)v20 == 0;
}

- (BOOL)uploadToGLTexture:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  char *v7;
  __int128 v8;
  char *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  unsigned int nPrimarySurfaces;
  uint64_t v15;
  char *v16;
  unsigned int nSurfaces;
  unsigned int v18;
  uint64_t index;
  unsigned int internalFormat;
  BOOL v21;
  double v22;
  int v23;
  int v24;
  char *v25;
  _BOOL4 v26;
  BOOL v27;
  signed __int32 v28;
  int32x2_t v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v33;
  __int128 v34;

  v5 = *(_QWORD *)&a3;
  if (self->_requestIssuedForSRGB && !-[GLKTexture canHonorSRGBrequest](self, "canHonorSRGBrequest"))
  {
    if (a4)
    {
      v10 = CFSTR("Incompatible decoded format for sRGB");
      v11 = 18;
      goto LABEL_12;
    }
LABEL_54:
    LOBYTE(v13) = 0;
    return v13;
  }
  if ((self->_dataCategory | 2) == 7)
  {
    v7 = -[NSData bytes](self->_imageData, "bytes");
    if (self->_dataCategory == 7
      && (-[GLKTexture shouldApplyReorientToGL](self, "shouldApplyReorientToGL")
       || -[GLKTexture shouldApplyPremultiplication](self, "shouldApplyPremultiplication")))
    {
      v9 = (char *)malloc_type_malloc(self->_rowBytes * (unint64_t)self->_height, 0x92882F41uLL);
      if (!v9)
      {
        if (a4)
        {
          v10 = CFSTR("Failed to create intermediate operation buffer.");
          v11 = 8;
LABEL_12:
          v12 = (void *)_GLKTextureErrorWithCodeAndErrorString(v11, (uint64_t)v10);
          LOBYTE(v13) = 0;
          *a4 = v12;
          return v13;
        }
        goto LABEL_54;
      }
    }
    else
    {
      v9 = 0;
    }
    nPrimarySurfaces = self->_nPrimarySurfaces;
    if (nPrimarySurfaces)
    {
      v15 = 0;
      v16 = v7 + 52;
      nSurfaces = self->_nSurfaces;
      while (!nSurfaces)
      {
LABEL_43:
        v15 = (v15 + 1);
        if (v15 >= nPrimarySurfaces)
          goto LABEL_44;
      }
      v18 = 0;
      *(_QWORD *)&v8 = *(_QWORD *)&self->_width;
      while (1)
      {
        index = v15;
        if (self->_isCubeMap)
        {
          index = v15;
          if (self->_nPrimarySurfaces == 1)
            index = self->_index;
        }
        v34 = v8;
        if (self->_dataCategory == 5)
        {
          internalFormat = self->_internalFormat;
          if (internalFormat == 35843)
          {
            v22 = COERCE_DOUBLE(vshl_u32(*(uint32x2_t *)&v8, (uint32x2_t)0xFFFFFFFEFFFFFFFDLL));
            v24 = 2;
            v23 = 32;
          }
          else
          {
            v21 = internalFormat == 35842;
            v22 = COERCE_DOUBLE(vshr_n_u32(*(uint32x2_t *)&v8, 2uLL));
            if (internalFormat == 35842)
              v23 = 16;
            else
              v23 = 0;
            if (internalFormat == 35842)
              v24 = 4;
            else
              v24 = 0;
            if (!v21)
              v22 = 0.0;
          }
          v29 = (int32x2_t)vmax_u32(*(uint32x2_t *)&v22, (uint32x2_t)0x200000002);
          v28 = vmul_lane_s32(v29, v29, 1).u32[0] * ((v24 * v23) >> 3);
          v25 = v16;
        }
        else
        {
          v25 = v16;
          if (v9)
          {
            if (-[GLKTexture shouldApplyReorientToGL](self, "shouldApplyReorientToGL", v16)
              && !-[GLKTexture reorientToGL:source:withWidth:withHeight:withRowBytes:error:](self, "reorientToGL:source:withWidth:withHeight:withRowBytes:error:", v9, v16))
            {
              goto LABEL_53;
            }
            v26 = -[GLKTexture shouldApplyPremultiplication](self, "shouldApplyPremultiplication");
            v25 = v9;
            *(_QWORD *)&v8 = v34;
            if (v26)
            {
              v27 = -[GLKTexture premultiplyWithAlpha:source:withWidth:withHeight:withRowBytes:error:](self, "premultiplyWithAlpha:source:withWidth:withHeight:withRowBytes:error:", v9, v16);
              *(_QWORD *)&v8 = v34;
              v25 = v9;
              if (!v27)
                goto LABEL_53;
            }
          }
          v28 = (vmul_lane_s32(*(int32x2_t *)&v8, *(int32x2_t *)&v8, 1).u32[0] * self->_bitsPerPixel) >> 3;
        }
        v30 = v28;
        LODWORD(v33) = v18;
        if (!-[GLKTexture _uploadToGLTexture:data:width:height:dataCategory:cubeMapIndex:mipMapIndex:error:](self, "_uploadToGLTexture:data:width:height:dataCategory:cubeMapIndex:mipMapIndex:error:", v5, objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v25, v28, 0), v34, DWORD1(v34), self->_dataCategory, index, v33, a4))break;
        v16 += v30;
        *((_QWORD *)&v8 + 1) = *((_QWORD *)&v34 + 1);
        *(uint32x2_t *)&v8 = vmax_u32(vshr_n_u32(*(uint32x2_t *)&v34, 1uLL), (uint32x2_t)0x100000001);
        ++v18;
        nSurfaces = self->_nSurfaces;
        if (v18 >= nSurfaces)
        {
          nPrimarySurfaces = self->_nPrimarySurfaces;
          goto LABEL_43;
        }
      }
      if (!v9)
        goto LABEL_54;
LABEL_53:
      free(v9);
      goto LABEL_54;
    }
LABEL_44:
    if (v9)
      free(v9);
LABEL_51:
    LOBYTE(v13) = 1;
    return v13;
  }
  if ((!-[GLKTexture shouldApplyReorientToGL](self, "shouldApplyReorientToGL")
     || (v13 = -[GLKTexture reorientToGL:source:withWidth:withHeight:withRowBytes:error:](self, "reorientToGL:source:withWidth:withHeight:withRowBytes:error:", -[NSData bytes](-[GLKTexture imageData](self, "imageData"), "bytes"), -[NSData bytes](-[GLKTexture imageData](self, "imageData"), "bytes"), self->_width, self->_height, self->_rowBytes, a4)))&& (!-[GLKTexture shouldApplyPremultiplication](self, "shouldApplyPremultiplication")|| (v13 = -[GLKTexture premultiplyWithAlpha:source:withWidth:withHeight:withRowBytes:error:](self, "premultiplyWithAlpha:source:withWidth:withHeight:withRowBytes:error:", -[NSData bytes](-[GLKTexture imageData](self, "imageData"), "bytes"), -[NSData bytes](-[GLKTexture imageData](self, "imageData"), "bytes"), self->_width, self->_height, self->_rowBytes, a4))))
  {
    LODWORD(v33) = 0;
    v31 = -[GLKTexture _uploadToGLTexture:data:width:height:dataCategory:cubeMapIndex:mipMapIndex:error:](self, "_uploadToGLTexture:data:width:height:dataCategory:cubeMapIndex:mipMapIndex:error:", v5, self->_imageData, self->_width, self->_height, self->_dataCategory, self->_index, v33, a4);
    LOBYTE(v13) = 0;
    if (v31)
      goto LABEL_51;
  }
  return v13;
}

- (BOOL)determineCGImageBlockFormatWithComponentType:(int)a3 andPixelSize:(unint64_t)a4 andColorModel:(int)a5
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  BOOL v10;

  if (a3 != 1)
    return 0;
  self->_type = 5121;
  if (a4 == 1)
  {
    if (self->_requestIssuedToInterpretGrayAsAlpha)
      v5 = 6406;
    else
      v5 = 6409;
    if (self->_requestIssuedToInterpretGrayAsAlpha)
      v9 = 23;
    else
      v9 = 20;
    v7 = 8;
    v8 = 1;
    v6 = v5;
    goto LABEL_23;
  }
  if (a4 != 2)
  {
    if (a4 == 4)
    {
      if (self->_requestIssuedForSRGB)
        v5 = 35906;
      else
        v5 = 6408;
      if (self->_requestIssuedForSRGB)
        v6 = 35906;
      else
        v6 = 32993;
      v7 = 32;
      v8 = 4;
      v9 = 2;
      goto LABEL_23;
    }
    return 0;
  }
  v10 = 0;
  if (!a5 && self->_hasAlpha)
  {
    v7 = 16;
    v8 = 2;
    v9 = 14;
    v5 = 6410;
    v6 = 6410;
LABEL_23:
    self->_internalFormat = v5;
    self->_format = v6;
    self->_texelFormat = v9;
    self->_nComponents = v8;
    v10 = 1;
    self->_bitsPerPixel = v7;
  }
  return v10;
}

- (BOOL)determinePVRFormat:(unsigned int)a3
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  if ((a3 & 0xFFFFFFF7) == 0x12)
  {
    if (self->_requestIssuedForSRGB)
      v3 = 35906;
    else
      v3 = 6408;
    self->_internalFormat = v3;
    v4 = 4;
    v5 = 1;
LABEL_6:
    v6 = 5121;
    v7 = 64;
    v8 = 60;
  }
  else
  {
    v9 = 0;
    v4 = 4;
    v5 = 27;
    v3 = 35842;
    v7 = 60;
    v8 = 56;
    v6 = 35842;
    switch(a3)
    {
      case 0x10u:
        v3 = 6408;
        v5 = 4;
        self->_format = 6408;
        v6 = 32819;
        goto LABEL_24;
      case 0x11u:
        v3 = 6408;
        self->_format = 6408;
        v5 = 3;
        v6 = 32820;
        goto LABEL_24;
      case 0x12u:
      case 0x14u:
      case 0x1Au:
        return v9;
      case 0x13u:
        v3 = 6407;
        v4 = 3;
        self->_format = 6407;
        v5 = 10;
        v6 = 33635;
        goto LABEL_24;
      case 0x15u:
        if (self->_requestIssuedForSRGB)
          v3 = 35904;
        else
          v3 = 6407;
        self->_internalFormat = v3;
        v4 = 3;
        v5 = 7;
        goto LABEL_6;
      case 0x16u:
        v3 = 6409;
        v4 = 1;
        self->_format = 6409;
        v5 = 20;
        goto LABEL_22;
      case 0x17u:
        v3 = 6410;
        v4 = 2;
        self->_format = 6410;
        v5 = 14;
        goto LABEL_22;
      case 0x18u:
        v5 = 26;
        v3 = 35843;
        v7 = 60;
        v8 = 56;
        v6 = 35843;
        break;
      case 0x19u:
        break;
      case 0x1Bu:
        v3 = 6406;
        v4 = 1;
        self->_format = 6406;
        v5 = 23;
LABEL_22:
        v6 = 5121;
        goto LABEL_24;
      default:
        if (a3 == 50)
        {
          v3 = 6408;
          v4 = 4;
          self->_format = 6408;
          v5 = 6;
          v6 = 36193;
        }
        else
        {
          if (a3 != 53)
            return v9;
          v3 = 6408;
          v4 = 4;
          self->_format = 6408;
          v5 = 5;
          v6 = 5126;
        }
LABEL_24:
        v7 = 64;
        v8 = 56;
        break;
    }
  }
  *(_DWORD *)((char *)&self->super.isa + v8) = v3;
  *(_DWORD *)((char *)&self->super.isa + v7) = v6;
  self->_texelFormat = v5;
  v9 = 1;
  self->_nComponents = v4;
  return v9;
}

- (BOOL)reorientToGL:(void *)a3 source:(void *)a4 withWidth:(unsigned int)a5 withHeight:(unsigned int)a6 withRowBytes:(unsigned int)a7 error:(id *)a8
{
  unsigned int orientation;
  unsigned int bitsPerPixel;
  unint64_t v11;
  BOOL v12;
  char v13;
  vImage_Error v14;
  const __CFString *v15;
  uint64_t v16;
  void *v17;
  vImage_Buffer dest;
  vImage_Buffer src;

  src.data = a4;
  src.height = a6;
  src.width = a5;
  src.rowBytes = a7;
  dest.data = a3;
  dest.height = a6;
  dest.width = a5;
  dest.rowBytes = a7;
  orientation = self->_orientation;
  if (orientation)
  {
    if (orientation != 1)
      return 1;
    bitsPerPixel = self->_bitsPerPixel;
    HIDWORD(v11) = bitsPerPixel;
    LODWORD(v11) = bitsPerPixel - 8;
    v12 = 1;
    switch((v11 >> 3))
    {
      case 0u:
        goto LABEL_8;
      case 1u:
      case 2u:
      case 5u:
      case 7u:
      case 0xBu:
        if (bitsPerPixel >= 0x40)
          v13 = 5;
        else
          v13 = 3;
        dest.width = self->_width * (bitsPerPixel >> v13);
        src.width = dest.width;
        if (bitsPerPixel > 0x3F)
        {
          v14 = vImageVerticalReflect_PlanarF(&src, &dest, 0);
          if (!v14)
            return 1;
        }
        else
        {
LABEL_8:
          v14 = vImageVerticalReflect_Planar8(&src, &dest, 0);
          if (!v14)
            return 1;
        }
LABEL_15:
        if (!a8)
          return 0;
        v15 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Image reorientation failed, vImageError: %ld"), v14);
        v16 = 15;
        break;
      case 3u:
        v14 = vImageVerticalReflect_ARGB8888(&src, &dest, 0);
        if (!v14)
          return 1;
        goto LABEL_15;
      case 0xFu:
        v14 = vImageVerticalReflect_ARGBFFFF(&src, &dest, 0);
        if (!v14)
          return 1;
        goto LABEL_15;
      default:
        return v12;
    }
  }
  else
  {
    if (!a8)
      return 0;
    v15 = CFSTR("Unsupported image orientation");
    v16 = 14;
  }
  v17 = (void *)_GLKTextureErrorWithCodeAndErrorString(v16, (uint64_t)v15);
  v12 = 0;
  *a8 = v17;
  return v12;
}

- (BOOL)premultiplyWithAlpha:(void *)a3 source:(void *)a4 withWidth:(unsigned int)a5 withHeight:(unsigned int)a6 withRowBytes:(unsigned int)a7 error:(id *)a8
{
  _WORD *v9;
  __int16 *v10;
  int texelFormat;
  vImage_Error v13;
  uint64_t v14;
  __int16 *v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  vImage_Error v21;
  BOOL result;
  void *v23;
  vImage_Buffer dest;
  vImage_Buffer src;

  v9 = a4;
  v10 = (__int16 *)a3;
  src.data = a4;
  src.height = a6;
  src.width = a5;
  src.rowBytes = a7;
  dest.data = a3;
  dest.height = a6;
  dest.width = a5;
  dest.rowBytes = a7;
  texelFormat = self->_texelFormat;
  if (texelFormat > 4)
  {
    if (texelFormat == 5)
    {
      v13 = vImagePremultiplyData_RGBAFFFF(&src, &dest, 0);
      goto LABEL_17;
    }
    if (texelFormat == 14)
    {
      -[GLKTexture rowBytes](self, "rowBytes");
      -[GLKTexture height](self, "height");
      v14 = 0;
      do
      {
        v15 = &v10[v14];
        v16 = HIBYTE(v9[v14]);
        *(_BYTE *)v15 = LOBYTE(v9[v14]) * v16 / 0xFF;
        *((_BYTE *)v15 + 1) = v16;
        v17 = -[GLKTexture rowBytes](self, "rowBytes");
        ++v14;
      }
      while ((v14 * 2) <= -[GLKTexture height](self, "height") * v17);
      goto LABEL_21;
    }
LABEL_20:
    NSLog(CFSTR("Cannot apply premultiplication to this texture format."), a2);
LABEL_21:
    result = 1;
    goto LABEL_22;
  }
  if ((texelFormat - 1) >= 2)
  {
    if (texelFormat == 3)
    {
      -[GLKTexture rowBytes](self, "rowBytes");
      -[GLKTexture height](self, "height");
      v18 = 0;
      do
      {
        if ((*v9 & 1) != 0)
          v19 = *v10;
        else
          v19 = 0;
        *v10++ = v19;
        ++v9;
        v18 += 4;
        v20 = -[GLKTexture rowBytes](self, "rowBytes");
      }
      while (v18 <= -[GLKTexture height](self, "height") * v20);
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  v13 = vImagePremultiplyData_RGBA8888(&src, &dest, 0);
LABEL_17:
  v21 = v13;
  result = v13 == 0;
  if (a8 && v21)
  {
    v23 = (void *)_GLKTextureErrorWithCodeAndErrorString(16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Alpha premultiplication failed, vImageError: %ld"), v21));
    result = 0;
    *a8 = v23;
  }
LABEL_22:
  self->_hasPremultipliedAlpha = result;
  return result;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (unsigned)GLTextureName
{
  return self->_GLTextureName;
}

- (void)setGLTextureName:(unsigned int)a3
{
  self->_GLTextureName = a3;
}

- (unsigned)bindTarget
{
  return self->_bindTarget;
}

- (void)setBindTarget:(unsigned int)a3
{
  self->_bindTarget = a3;
}

- (unsigned)textureTarget
{
  return self->_textureTarget;
}

- (void)setTextureTarget:(unsigned int)a3
{
  self->_textureTarget = a3;
}

- (unsigned)internalFormat
{
  return self->_internalFormat;
}

- (void)setInternalFormat:(unsigned int)a3
{
  self->_internalFormat = a3;
}

- (unsigned)format
{
  return self->_format;
}

- (void)setFormat:(unsigned int)a3
{
  self->_format = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

- (int)texelFormat
{
  return self->_texelFormat;
}

- (void)setTexelFormat:(int)a3
{
  self->_texelFormat = a3;
}

- (unsigned)width
{
  return self->_width;
}

- (void)setWidth:(unsigned int)a3
{
  self->_width = a3;
}

- (unsigned)height
{
  return self->_height;
}

- (void)setHeight:(unsigned int)a3
{
  self->_height = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

- (unsigned)numMipMapLevels
{
  return self->_numMipMapLevels;
}

- (void)setNumMipMapLevels:(unsigned int)a3
{
  self->_numMipMapLevels = a3;
}

- (unsigned)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(unsigned int)a3
{
  self->_bitsPerPixel = a3;
}

- (unsigned)rowBytes
{
  return self->_rowBytes;
}

- (void)setRowBytes:(unsigned int)a3
{
  self->_rowBytes = a3;
}

- (unsigned)nComponents
{
  return self->_nComponents;
}

- (void)setNComponents:(unsigned int)a3
{
  self->_nComponents = a3;
}

- (unsigned)nPrimarySurfaces
{
  return self->_nPrimarySurfaces;
}

- (void)setNPrimarySurfaces:(unsigned int)a3
{
  self->_nPrimarySurfaces = a3;
}

- (unsigned)nSurfaces
{
  return self->_nSurfaces;
}

- (void)setNSurfaces:(unsigned int)a3
{
  self->_nSurfaces = a3;
}

- (int)loadMode
{
  return self->_loadMode;
}

- (void)setLoadMode:(int)a3
{
  self->_loadMode = a3;
}

- (int)dataCategory
{
  return self->_dataCategory;
}

- (void)setDataCategory:(int)a3
{
  self->_dataCategory = a3;
}

- (unsigned)index
{
  return self->_index;
}

- (void)setIndex:(unsigned int)a3
{
  self->_index = a3;
}

- (BOOL)requestIssuedForMipmapGeneration
{
  return self->_requestIssuedForMipmapGeneration;
}

- (BOOL)hasPremultipliedAlpha
{
  return self->_hasPremultipliedAlpha;
}

- (BOOL)isPowerOfTwo
{
  return self->_isPowerOfTwo;
}

- (void)setIsPowerOfTwo:(BOOL)a3
{
  self->_isPowerOfTwo = a3;
}

- (BOOL)isCubeMap
{
  return self->_isCubeMap;
}

- (void)setIsCubeMap:(BOOL)a3
{
  self->_isCubeMap = a3;
}

- (BOOL)isMipmapped
{
  return self->_isMipmapped;
}

- (void)setIsMipmapped:(BOOL)a3
{
  self->_isMipmapped = a3;
}

- (BOOL)isVerticalFlipped
{
  return self->_isVerticalFlipped;
}

- (void)setIsVerticalFlipped:(BOOL)a3
{
  self->_isVerticalFlipped = a3;
}

- (BOOL)hasAlpha
{
  return self->_hasAlpha;
}

- (void)setHasAlpha:(BOOL)a3
{
  self->_hasAlpha = a3;
}

- (BOOL)reOrient
{
  return self->_reOrient;
}

- (void)setReOrient:(BOOL)a3
{
  self->_reOrient = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

@end
