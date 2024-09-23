@implementation VideoSpillMapMetalSession

+ (unint64_t)metalPixelFormatForPixelFormat:(unsigned int)a3 withTransferFunction:(unsigned __int8)a4
{
  unint64_t result;
  int v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;

  result = 0;
  if ((int)a3 <= 1111970368)
  {
    if ((int)a3 <= 645428783)
    {
      if (a3 != 641230384)
      {
        v5 = 641234480;
LABEL_15:
        if (a3 != v5)
          return result;
      }
LABEL_16:
      v7 = a4 == 8;
      v6 = 520;
      v8 = 500;
LABEL_22:
      if (v7)
        return v8;
      else
        return v6;
    }
    if (a3 != 645428784)
    {
      if (a3 != 875704422)
      {
        v5 = 875704438;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    goto LABEL_19;
  }
  if ((int)a3 <= 1885745711)
  {
    if (a3 == 1111970369)
      return 80;
    if (a3 != 1882468912)
      return result;
    goto LABEL_19;
  }
  if (a3 == 1885745712)
  {
LABEL_19:
    v6 = 528;
    if (a4 == 16)
      v6 = 567;
    v7 = a4 == 8;
    v8 = 508;
    goto LABEL_22;
  }
  if (a3 == 2016686640 || a3 == 2019963440)
  {
    v6 = 525;
    if (a4 == 16)
      v6 = 564;
    v7 = a4 == 8;
    v8 = 505;
    goto LABEL_22;
  }
  return result;
}

- (VideoSpillMapMetalSession)init
{
  VideoSpillMapMetalSession *v2;
  VideoSpillMapMetalSession *v3;
  VideoSpillMapMetalSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VideoSpillMapMetalSession;
  v2 = -[VideoSpillMapMetalSession init](&v6, sel_init);
  v3 = v2;
  if (v2 && !-[VideoSpillMapMetalSession configureGPU](v2, "configureGPU"))
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)dealloc
{
  __CVPixelBufferPool *spillBufferPoolUnprotected;
  __CVPixelBufferPool *spillBufferPoolScreenScrapingProtected;
  __CVPixelBufferPool *spillBufferPoolHDCPType0;
  __CVPixelBufferPool *spillBufferPoolHDCPType1;
  __CFDictionary *spillmapBufferProperties;
  __CVMetalTextureCache *textureCacheBGRA;
  __CVMetalTextureCache *textureCacheSpillmap;
  objc_super v10;

  spillBufferPoolUnprotected = self->_spillBufferPoolUnprotected;
  if (spillBufferPoolUnprotected)
    CFRelease(spillBufferPoolUnprotected);
  spillBufferPoolScreenScrapingProtected = self->_spillBufferPoolScreenScrapingProtected;
  if (spillBufferPoolScreenScrapingProtected)
    CFRelease(spillBufferPoolScreenScrapingProtected);
  spillBufferPoolHDCPType0 = self->_spillBufferPoolHDCPType0;
  if (spillBufferPoolHDCPType0)
    CFRelease(spillBufferPoolHDCPType0);
  spillBufferPoolHDCPType1 = self->_spillBufferPoolHDCPType1;
  if (spillBufferPoolHDCPType1)
    CFRelease(spillBufferPoolHDCPType1);
  spillmapBufferProperties = self->_spillmapBufferProperties;
  if (spillmapBufferProperties)
    CFRelease(spillmapBufferProperties);
  textureCacheBGRA = self->_textureCacheBGRA;
  if (textureCacheBGRA)
    CFRelease(textureCacheBGRA);
  textureCacheSpillmap = self->_textureCacheSpillmap;
  if (textureCacheSpillmap)
    CFRelease(textureCacheSpillmap);
  v10.receiver = self;
  v10.super_class = (Class)VideoSpillMapMetalSession;
  -[VideoSpillMapMetalSession dealloc](&v10, sel_dealloc);
}

- (int)configureGPU
{
  MTLDevice *v3;
  MTLDevice *device;
  MTLDevice *v5;
  MTLCommandQueue *v6;
  MTLCommandQueue *commandQueue;
  re *v8;
  MPSImageBilinearScale *v9;
  MPSImageBilinearScale *bilinearScale;
  re *v11;
  re *v12;
  int v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  const char *v17;
  re *v19;
  NSDictionary *v20;
  NSDictionary *readAttributes;
  NSDictionary *v22;
  NSDictionary *readWriteAttributes;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  device = self->_device;
  self->_device = v3;

  v5 = self->_device;
  if (!v5)
  {
    v16 = *re::videoLogObjects(0);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      return 11;
    *(_WORD *)buf = 0;
    v17 = "[VideoLightSpillGenerator] [configureGPU] Unable to get metal device";
LABEL_13:
    _os_log_error_impl(&dword_224FE9000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
    return 11;
  }
  v6 = (MTLCommandQueue *)-[MTLDevice newCommandQueue](v5, "newCommandQueue");
  commandQueue = self->_commandQueue;
  self->_commandQueue = v6;

  if (!self->_commandQueue)
  {
    v16 = *re::videoLogObjects(v8);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      return 11;
    *(_WORD *)buf = 0;
    v17 = "[VideoLightSpillGenerator] [configureGPU] Unable to get command queue";
    goto LABEL_13;
  }
  v9 = (MPSImageBilinearScale *)objc_msgSend(objc_alloc(MEMORY[0x24BDDE388]), "initWithDevice:", self->_device);
  bilinearScale = self->_bilinearScale;
  self->_bilinearScale = v9;

  if (!self->_bilinearScale)
  {
    v16 = *re::videoLogObjects(v11);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v17 = "[VideoLightSpillGenerator] [configureGPU] Unable to initialize bilinear scaling filter";
      goto LABEL_13;
    }
    return 11;
  }
  v12 = (re *)CVMetalTextureCacheCreate(0, 0, self->_device, 0, &self->_textureCacheBGRA);
  if ((_DWORD)v12)
  {
    v13 = (int)v12;
    v14 = *re::videoLogObjects(v12);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v29 = v13;
      v15 = "[VideoLightSpillGenerator] [configureGPU] Error creating texture cache BGRA: %d";
LABEL_19:
      _os_log_error_impl(&dword_224FE9000, v14, OS_LOG_TYPE_ERROR, v15, buf, 8u);
    }
  }
  else
  {
    v19 = (re *)CVMetalTextureCacheCreate(0, 0, self->_device, 0, &self->_textureCacheSpillmap);
    if ((_DWORD)v19)
    {
      v13 = (int)v19;
      v14 = *re::videoLogObjects(v19);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v29 = v13;
        v15 = "[VideoLightSpillGenerator] [configureGPU] Error creating texture cache spill map: %d";
        goto LABEL_19;
      }
    }
    else
    {
      if (!self->_readAttributes)
      {
        v26 = *MEMORY[0x24BDC55C8];
        v27 = &unk_24EDB7B08;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v20 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        readAttributes = self->_readAttributes;
        self->_readAttributes = v20;

      }
      if (!self->_readWriteAttributes)
      {
        v24 = *MEMORY[0x24BDC55C8];
        v25 = &unk_24EDB7B20;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1);
        v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        readWriteAttributes = self->_readWriteAttributes;
        self->_readWriteAttributes = v22;

      }
      return 0;
    }
  }
  return v13;
}

- (int)configureSession:(__IOSurface *)a3 setWidth:(int)a4 setHeight:(int)a5
{
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  __CFDictionary *v10;
  const __CFString *v11;
  const void *v12;
  re *v13;
  int v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  re *v19;
  re *v20;
  re *v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!Mutable)
      return 7;
    v9 = Mutable;
    CFDictionarySetInt32(Mutable, (const __CFString *)*MEMORY[0x24BDD8FD0], a4);
    CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x24BDD8EB0], a5);
    CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x24BDD8EF8], 1111970369);
    CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x24BDD8E38], 4 * a4);
    CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x24BDD8E30], 4);
    v10 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    self->_spillmapBufferProperties = v10;
    if (v10)
    {
      CFDictionarySetInt32(v10, (const __CFString *)*MEMORY[0x24BDC5708], a4);
      CFDictionarySetInt32(self->_spillmapBufferProperties, (const __CFString *)*MEMORY[0x24BDC5650], a5);
      CFDictionarySetInt32(self->_spillmapBufferProperties, (const __CFString *)*MEMORY[0x24BDC56B8], 1111970369);
      v11 = (const __CFString *)*MEMORY[0x24BDD8FC0];
      CFDictionarySetInt32(v9, (const __CFString *)*MEMORY[0x24BDD8FC0], 0);
      v12 = (const void *)*MEMORY[0x24BDC5668];
      CFDictionarySetValue(self->_spillmapBufferProperties, (const void *)*MEMORY[0x24BDC5668], v9);
      v13 = (re *)CVPixelBufferPoolCreate(0, 0, self->_spillmapBufferProperties, &self->_spillBufferPoolUnprotected);
      if ((_DWORD)v13)
      {
        v14 = (int)v13;
        v15 = *re::videoLogObjects(v13);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          v22 = 67109120;
          v23 = v14;
          v16 = "[VideoLightSpillGenerator] [configureSession] Error creating unprotected spill map buffer pool: %d";
LABEL_21:
          _os_log_error_impl(&dword_224FE9000, v15, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v22, 8u);
        }
      }
      else
      {
        CFDictionarySetInt32(v9, v11, 1);
        CFDictionarySetValue(self->_spillmapBufferProperties, v12, v9);
        v19 = (re *)CVPixelBufferPoolCreate(0, 0, self->_spillmapBufferProperties, &self->_spillBufferPoolScreenScrapingProtected);
        if ((_DWORD)v19)
        {
          v14 = (int)v19;
          v15 = *re::videoLogObjects(v19);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v22 = 67109120;
            v23 = v14;
            v16 = "[VideoLightSpillGenerator] [configureSession] Error creating screen scraping protected spill map buffer pool: %d";
            goto LABEL_21;
          }
        }
        else
        {
          CFDictionarySetInt32(v9, v11, 3);
          CFDictionarySetValue(self->_spillmapBufferProperties, v12, v9);
          v20 = (re *)CVPixelBufferPoolCreate(0, 0, self->_spillmapBufferProperties, &self->_spillBufferPoolHDCPType0);
          if ((_DWORD)v20)
          {
            v14 = (int)v20;
            v15 = *re::videoLogObjects(v20);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v22 = 67109120;
              v23 = v14;
              v16 = "[VideoLightSpillGenerator] [configureSession] Error creating HDCPType0 spill map buffer pool: %d";
              goto LABEL_21;
            }
          }
          else
          {
            CFDictionarySetInt32(v9, v11, 7);
            CFDictionarySetValue(self->_spillmapBufferProperties, v12, v9);
            v21 = (re *)CVPixelBufferPoolCreate(0, 0, self->_spillmapBufferProperties, &self->_spillBufferPoolHDCPType1);
            v14 = (int)v21;
            if (!(_DWORD)v21)
            {
              CFRelease(v9);
              return v14;
            }
            v15 = *re::videoLogObjects(v21);
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              v22 = 67109120;
              v23 = v14;
              v16 = "[VideoLightSpillGenerator] [configureSession] Error creating HDCPType1 spill map buffer pool: %d";
              goto LABEL_21;
            }
          }
        }
      }
    }
    else
    {
      return 7;
    }
  }
  else
  {
    v17 = *re::videoLogObjects((re *)self);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_224FE9000, v17, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [configureSession] Source iosurface is unavailable", (uint8_t *)&v22, 2u);
    }
    return 11;
  }
  return v14;
}

- (int)configureIntermediateTextureProcessing:(int)a3 setHeight:(int)a4 setSigma:(float)a5
{
  MTLTextureDescriptor *v7;
  MTLTextureDescriptor *intermediateImageDescriptor;
  id v9;
  double v10;
  MPSImageGaussianBlur *v11;
  MPSImageGaussianBlur *gaussianBlur;
  MPSImageGaussianBlur *v13;
  NSObject *v15;
  uint8_t v16[16];

  objc_msgSend(MEMORY[0x24BDDD740], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 81, a3, a4, 0);
  v7 = (MTLTextureDescriptor *)objc_claimAutoreleasedReturnValue();
  intermediateImageDescriptor = self->_intermediateImageDescriptor;
  self->_intermediateImageDescriptor = v7;

  -[MTLTextureDescriptor setStorageMode:](self->_intermediateImageDescriptor, "setStorageMode:", 2);
  -[MTLTextureDescriptor setUsage:](self->_intermediateImageDescriptor, "setUsage:", 3);
  if (!self->_intermediateImageDescriptor)
    return 7;
  v9 = objc_alloc(MEMORY[0x24BDDE3C8]);
  *(float *)&v10 = a5;
  v11 = (MPSImageGaussianBlur *)objc_msgSend(v9, "initWithDevice:sigma:", self->_device, v10);
  gaussianBlur = self->_gaussianBlur;
  self->_gaussianBlur = v11;

  v13 = self->_gaussianBlur;
  if (v13)
  {
    -[MPSImageGaussianBlur setEdgeMode:](v13, "setEdgeMode:", 1);
    return 0;
  }
  else
  {
    v15 = *re::videoLogObjects(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_224FE9000, v15, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [configureIntermediateTextureProcessing] Unable to initialize gaussian filter", v16, 2u);
    }
    return 11;
  }
}

- (id)loadTexture:(__CVBuffer *)a3 withAttributes:(id)a4 forPlane:(unsigned int)a5 withCache:(__CVMetalTextureCache *)a6 withFormat:(unint64_t)a7
{
  size_t v10;
  const __CFDictionary *v11;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  void *v14;
  NSObject *v15;
  uint8_t buf[8];
  CVMetalTextureRef image;

  image = 0;
  v10 = a5;
  v11 = (const __CFDictionary *)a4;
  WidthOfPlane = CVPixelBufferGetWidthOfPlane(a3, v10);
  HeightOfPlane = CVPixelBufferGetHeightOfPlane(a3, v10);
  LODWORD(a7) = CVMetalTextureCacheCreateTextureFromImage(0, a6, a3, v11, (MTLPixelFormat)a7, WidthOfPlane, HeightOfPlane, v10, &image);

  if ((_DWORD)a7)
  {
    if (image)
      CFRelease(image);
LABEL_8:
    v14 = 0;
    return v14;
  }
  if (!image)
  {
    v15 = *re::videoLogObjects(0);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_224FE9000, v15, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [VideoSpillMapMetalSession->loadTexture] Unable to create texture from pixel buffer.", buf, 2u);
    }
    goto LABEL_8;
  }
  CVMetalTextureGetTexture(image);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(image);
  return v14;
}

- (int)calculateDrmSpillmapMetal:(__CVBuffer *)a3 emitSpillmap:(__CVBuffer *)a4 setLayout:(int)a5 withAllocator:(void *)a6
{
  void *v11;
  unint64_t ProtectionOptions;
  re *v13;
  NSObject *v14;
  int v15;
  re *PixelBuffer;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  IOSurfaceRef IOSurface;
  int v22;
  int v23;
  unsigned int v24;
  __IOSurface *v25;
  re *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  float v36;
  float v37;
  float v38;
  float v39;
  double v40;
  float x;
  double v42;
  float y;
  double v44;
  float v45;
  double v46;
  MPSImageBilinearScale *bilinearScale;
  MTLDevice *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  int Width;
  int Height;
  uint64_t v55;
  float v56;
  uint64_t v57;
  MPSImageBilinearScale *v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  const char *v62;
  void *v63;
  _QWORD v64[6];
  uint8_t v65[8];
  id v66;
  _QWORD v67[6];
  uint8_t v68[8];
  double v69;
  double v70;
  double v71;
  char v72;
  uint8_t buf[16];
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  int v80;
  CGRect CleanRect;

  -[MTLCommandQueue commandBuffer](self->_commandQueue, "commandBuffer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CVPixelBufferGetIOSurface(a3);
  ProtectionOptions = IOSurfaceGetProtectionOptions();
  v13 = (re *)objc_msgSend(v11, "setProtectionOptions:", ProtectionOptions);
  if (ProtectionOptions >= 8 || ((0x8Bu >> ProtectionOptions) & 1) == 0)
  {
    v14 = *re::videoLogObjects(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_224FE9000, v14, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unsupported frame protection option", buf, 2u);
    }
    v15 = 10;
    goto LABEL_6;
  }
  PixelBuffer = (re *)CVPixelBufferPoolCreatePixelBuffer(0, *(CVPixelBufferPoolRef *)((char *)&self->super.isa + qword_22619E568[ProtectionOptions]), a4);
  if (!(_WORD)PixelBuffer)
  {
    -[VideoSpillMapMetalSession loadTexture:withAttributes:forPlane:withCache:withFormat:](self, "loadTexture:withAttributes:forPlane:withCache:withFormat:", *a4, self->_readWriteAttributes, 0, self->_textureCacheSpillmap, 81);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (!v19)
    {
      v28 = *re::videoLogObjects(0);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_224FE9000, v28, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unable to create spillmap texture from cache", buf, 2u);
      }
      v15 = 11;
      goto LABEL_60;
    }
    v63 = (void *)v19;
    v80 = 0;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    *(_OWORD *)buf = 0u;
    IOSurface = CVPixelBufferGetIOSurface(a3);
    re::_IOSurfaceGetBulkAttachments((uint64_t)IOSurface, (uint64_t)buf);
    v23 = v22;
    v24 = BYTE12(v76);
    v25 = CVPixelBufferGetIOSurface(*a4);
    v72 = 13;
    v26 = (re *)re::_IOSurfaceSetBulkAttachments2();
    if ((_DWORD)v26)
    {
      v15 = (int)v26;
      v27 = *re::videoLogObjects(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v68 = 0;
        _os_log_error_impl(&dword_224FE9000, v27, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unable to set surface properties", v68, 2u);
      }
LABEL_15:
      v20 = v63;
LABEL_60:

      goto LABEL_6;
    }
    if (v23)
      v29 = 2;
    else
      v29 = v24;
    v30 = +[VideoSpillMapMetalSession metalPixelFormatForPixelFormat:withTransferFunction:](VideoSpillMapMetalSession, "metalPixelFormatForPixelFormat:withTransferFunction:", CVPixelBufferGetPixelFormatType(a3), v29);
    if (!v30)
    {
      v59 = *re::videoLogObjects(0);
      if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v68 = 0;
        _os_log_error_impl(&dword_224FE9000, v59, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unsupported pixel format", v68, 2u);
      }
      v15 = 10;
      goto LABEL_15;
    }
    -[VideoSpillMapMetalSession loadTexture:withAttributes:forPlane:withCache:withFormat:](self, "loadTexture:withAttributes:forPlane:withCache:withFormat:", a3, self->_readAttributes, 0, self->_textureCacheBGRA, v30);
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = (void *)v31;
    if (!v31)
    {
      v60 = *re::videoLogObjects(0);
      v20 = v63;
      if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v68 = 0;
        _os_log_error_impl(&dword_224FE9000, v60, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unable to create BGRA texture from cache", v68, 2u);
      }
      v15 = 11;
      goto LABEL_59;
    }
    v33 = (void *)v31;
    v34 = -[MTLTextureDescriptor width](self->_intermediateImageDescriptor, "width");
    v35 = -[MTLTextureDescriptor height](self->_intermediateImageDescriptor, "height");
    CleanRect = CVImageBufferGetCleanRect(a3);
    v36 = (float)(unint64_t)v34;
    v37 = (float)(unint64_t)v34 / CleanRect.size.width;
    v38 = (float)(unint64_t)v35;
    v39 = (float)(unint64_t)v35 / CleanRect.size.height;
    v40 = v37;
    if (CleanRect.origin.x != 0.0)
      CleanRect.origin.x = 0.0 - CleanRect.origin.x * v37;
    x = CleanRect.origin.x;
    v42 = v39;
    if (CleanRect.origin.y != 0.0)
      CleanRect.origin.y = 0.0 - CleanRect.origin.y * v39;
    y = CleanRect.origin.y;
    v44 = (float)(v39 + v39);
    v45 = x + x;
    v46 = (float)(v37 + v37);
    if (a5 != 1)
    {
      v46 = v40;
      v45 = x;
    }
    if (a5 == 2)
      v46 = v40;
    else
      v44 = v42;
    if (a5 == 2)
      y = y + y;
    else
      x = v45;
    *(double *)v68 = v46;
    v69 = v44;
    v70 = x;
    v71 = y;
    -[MPSImageBilinearScale setScaleTransform:](self->_bilinearScale, "setScaleTransform:", v68);
    memset(v67, 0, 24);
    bilinearScale = self->_bilinearScale;
    v67[3] = v34;
    v67[4] = v35;
    v67[5] = 1;
    -[MPSImageBilinearScale setClipRect:](bilinearScale, "setClipRect:", v67);
    if (!*((_QWORD *)a6 + 6))
    {
      v48 = self->_device;
      v66 = v48;
      if (!*((_QWORD *)a6 + 6))
      {
        re::ObjCObject::operator=((id *)a6 + 6, &v66);
        v48 = (MTLDevice *)v66;
      }

    }
    re::VideoTextureAllocator::createTextureInternal((uint64_t)a6, v34, v35, 81, 2, 3u, 0, 0, (unint64_t *)v65, ProtectionOptions);
    v49 = *(id *)v65;
    v50 = v49;
    if (v49)

    re::VideoTextureAllocator::createTextureInternal((uint64_t)a6, v34, v35, 81, 2, 3u, 0, 0, (unint64_t *)v65, ProtectionOptions);
    v51 = *(id *)v65;
    v52 = v51;
    if (v51)
    {

      v32 = v33;
      if (v50)
      {
        -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_bilinearScale, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, v33, v50);
        -[MPSImageGaussianBlur encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_gaussianBlur, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, v50, v52);
        Width = IOSurfaceGetWidth(v25);
        Height = IOSurfaceGetHeight(v25);
        v55 = Width;
        v56 = (float)Width;
        v57 = Height;
        *(double *)v68 = (float)(v56 / v36);
        v69 = (float)((float)Height / v38);
        v70 = 0.0;
        v71 = 0.0;
        -[MPSImageBilinearScale setScaleTransform:](self->_bilinearScale, "setScaleTransform:", v68);
        memset(v64, 0, 24);
        v58 = self->_bilinearScale;
        v64[3] = v55;
        v64[4] = v57;
        v64[5] = 1;
        -[MPSImageBilinearScale setClipRect:](v58, "setClipRect:", v64);
        v20 = v63;
        -[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_bilinearScale, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, v52, v63);
        if ((objc_msgSend(v11, "commitAndWaitUntilSubmitted") & 1) == 0)
          objc_msgSend(v11, "waitUntilScheduled");
        v15 = 0;
        goto LABEL_58;
      }
    }
    else
    {
      v32 = v33;
      if (v50)
      {
        v61 = *re::videoLogObjects((re *)-[MPSImageBilinearScale encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_bilinearScale, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v11, v33, v50));
        if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        {
LABEL_57:
          v15 = 7;
          v20 = v63;
LABEL_58:

LABEL_59:
          goto LABEL_60;
        }
        *(_WORD *)v65 = 0;
        v62 = "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Failed to generate imgIntermediateBlurTexture";
LABEL_62:
        _os_log_error_impl(&dword_224FE9000, v61, OS_LOG_TYPE_ERROR, v62, v65, 2u);
        goto LABEL_57;
      }
    }
    v61 = *re::videoLogObjects((re *)v51);
    if (!os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      goto LABEL_57;
    *(_WORD *)v65 = 0;
    v62 = "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Failed to generate imgIntermediateTexture";
    goto LABEL_62;
  }
  v18 = *re::videoLogObjects(PixelBuffer);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_224FE9000, v18, OS_LOG_TYPE_ERROR, "[VideoLightSpillGenerator] [calculateDrmSpillmapMetal] Unable to create spillmap pixel buffer from pool", buf, 2u);
  }
  v15 = 11;
LABEL_6:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gaussianBlur, 0);
  objc_storeStrong((id *)&self->_intermediateImageDescriptor, 0);
  objc_storeStrong((id *)&self->_readWriteAttributes, 0);
  objc_storeStrong((id *)&self->_readAttributes, 0);
  objc_storeStrong((id *)&self->_bilinearScale, 0);
  objc_storeStrong((id *)&self->_commandQueue, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
