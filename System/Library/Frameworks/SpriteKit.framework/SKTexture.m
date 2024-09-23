@implementation SKTexture

- (id)imgName
{
  return self->_imgName;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)registerTextureCache:(id)a3 forName:(id)a4
{
  objc_msgSend((id)_textureTable, "setObject:forKey:", a3, a4);
}

+ (id)lookupTextureCacheForName:(id)a3
{
  objc_msgSend((id)_textureTable, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_textureCache
{
  return self->_textureCache;
}

- (BOOL)_needsExtrusionWorkaround
{
  return self->_needsExtrusionWorkaround;
}

- (SKTexture)textureByGeneratingNormalMap
{
  return -[SKTexture textureByGeneratingNormalMapWithSmoothness:contrast:](self, "textureByGeneratingNormalMapWithSmoothness:contrast:", 0.2, 1.5);
}

- (SKTexture)textureByGeneratingNormalMapWithSmoothness:(CGFloat)smoothness contrast:(CGFloat)contrast
{
  return (SKTexture *)-[SKTexture _generateNormalMap:contrast:multiPass:](self, "_generateNormalMap:contrast:multiPass:", 0, smoothness, contrast);
}

- (void)commonInit
{
  NSString *originalAtlasName;
  NSString *subTextureName;
  NSString *imgName;
  NSArray *searchPaths;
  SKTextureCache *v7;
  SKTextureCache *textureCache;
  CIFilter *filter;
  SKTexture *originalTexture;
  OS_dispatch_queue *v16;
  OS_dispatch_queue *textureSyncQueue;
  id v18[2];

  originalAtlasName = self->_originalAtlasName;
  self->_originalAtlasName = 0;

  subTextureName = self->_subTextureName;
  self->_subTextureName = 0;

  imgName = self->_imgName;
  self->_imgName = 0;

  searchPaths = self->_searchPaths;
  self->_searchPaths = 0;

  if (-[SKTexture commonInit]::_queueInit != -1)
    dispatch_once(&-[SKTexture commonInit]::_queueInit, &__block_literal_global_6);
  v7 = (SKTextureCache *)objc_opt_new();
  textureCache = self->_textureCache;
  self->_textureCache = v7;

  *(_WORD *)&self->_disableAlpha = 0;
  *(_DWORD *)&self->_shouldGenerateMipmaps = 0;
  self->_isData = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(CGPoint *)v18 = _Q0;
  self->_cropScale = _Q0;
  self->_cropOffset.x = 0.0;
  self->_cropOffset.y = 0.0;
  *(_QWORD *)&self->_alignment = 1;
  filter = self->_filter;
  self->_filter = 0;

  originalTexture = self->_originalTexture;
  self->_originalTexture = 0;

  self->_textureTarget = 3553;
  self->_textRect.origin.x = 0.0;
  self->_textRect.origin.y = 0.0;
  self->_textRect.size = *(CGSize *)v18;
  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v18[0] = (id)objc_claimAutoreleasedReturnValue();
  v16 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.spritekit.textureSync", (dispatch_queue_attr_t)v18[0]);
  textureSyncQueue = self->_textureSyncQueue;
  self->_textureSyncQueue = v16;

}

void __23__SKTexture_commonInit__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  SKThreadSafeMapTable *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v0 = dispatch_queue_create("com.apple.spritekit.textureOp", 0);
  v1 = (void *)_textureOpQueue;
  _textureOpQueue = (uint64_t)v0;

  v2 = [SKThreadSafeMapTable alloc];
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SKThreadSafeMapTable initWithNSMapTable:](v2, "initWithNSMapTable:");
  v4 = (void *)_textureTable;
  _textureTable = v3;

}

- (void)setTextureDimension:(const CGSize *)a3 withPixelSize:(const CGSize *)a4
{
  NSObject *textureSyncQueue;
  _QWORD block[7];

  textureSyncQueue = self->_textureSyncQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SKTexture_setTextureDimension_withPixelSize___block_invoke;
  block[3] = &unk_1EA4FFF20;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(textureSyncQueue, block);
}

uint64_t __47__SKTexture_setTextureDimension_withPixelSize___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setSize:", **(double **)(a1 + 40), *(double *)(*(_QWORD *)(a1 + 40) + 8));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "setPixelSize:", **(double **)(a1 + 48), *(double *)(*(_QWORD *)(a1 + 48) + 8));
}

- (BOOL)loadImageDataFromPVRGZData:(id)a3
{
  void *v4;

  objc_msgSend(a3, "gzipInflate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SKTexture loadImageDataFromPVRData:](self, "loadImageDataFromPVRData:", v4);

  return (char)self;
}

- (BOOL)loadImageDataFromPVRData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  size_t v7;
  void *v8;
  int32x2_t v9;
  unsigned int v10;
  unsigned int v11;
  int32x2_t v12;
  _BOOL8 v13;
  void *v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  void *v20;

  v4 = objc_retainAutorelease(a3);
  v5 = objc_msgSend(v4, "bytes");
  v6 = v5;
  if (*(_DWORD *)(v5 + 44) == 559044176)
  {
    v7 = *(unsigned int *)(v5 + 20);
    v8 = malloc_type_malloc(v7, 0x9250D8CCuLL);
    memcpy(v8, (const void *)(objc_msgSend(objc_retainAutorelease(v4), "bytes") + 52), v7);
    v9 = *(int32x2_t *)(v6 + 4);
    v10 = v9.u32[1];
    v11 = v9.i32[0];
    v13 = 0;
    if (v9.i32[1])
    {
      v12 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)v9, (int8x8_t)vadd_s32(v9, (int32x2_t)-1)));
      if ((v12.i8[4] & 1) != 0 && v11 && (v12.i8[0] & 1) != 0)
        v13 = 1;
    }
    -[SKTextureCache setIsPOT:](self->_textureCache, "setIsPOT:", v13);
    -[SKTextureCache setHasAlpha:](self->_textureCache, "setHasAlpha:", *(_DWORD *)(v6 + 40) != 0);
    -[SKTextureCache setPixelSize:](self->_textureCache, "setPixelSize:", (double)v10, (double)v11);
    -[NSString lowercaseString](self->_imgName, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "rangeOfString:", CFSTR("@2x"));

    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      v18 = (double)v10;
    else
      v18 = (double)v10 * 0.5;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      v19 = (double)v11;
    else
      v19 = (double)v11 * 0.5;
    -[SKTextureCache setSize:](self->_textureCache, "setSize:", v18, v19, (double)v11 * 0.5);
    self->_isData = 1;
    -[SKTextureCache setState:](self->_textureCache, "setState:", 1);
    switch(*(_BYTE *)(v6 + 16))
    {
      case 0x10:
        -[SKTextureCache setTextureFormat:](self->_textureCache, "setTextureFormat:", 3);
        v20 = malloc_type_malloc(4 * v11 * v10, 0x193F1985uLL);
        jet_convert_pixel_data_rgba_4444_to_rgba_8888(v8, v20);
        goto LABEL_23;
      case 0x11:
        -[SKTextureCache setTextureFormat:](self->_textureCache, "setTextureFormat:", 3);
        v20 = malloc_type_malloc(4 * v11 * v10, 0xE1388C9CuLL);
        jet_convert_pixel_data_rgba_5551_to_rgba_8888(v8, v20);
        goto LABEL_23;
      case 0x12:
        goto LABEL_24;
      case 0x13:
        -[SKTextureCache setTextureFormat:](self->_textureCache, "setTextureFormat:", 3);
        v20 = malloc_type_malloc(4 * v11 * v10, 0xCBD3E3FFuLL);
        jet_convert_pixel_data_rgb_565_to_rgba_8888(v8, v20);
LABEL_23:
        free(v8);
        v8 = v20;
LABEL_24:
        -[SKTextureCache setPixelData:](self->_textureCache, "setPixelData:", v8);
        v15 = 1;
        break;
      default:
        free(v8);
        if (self->_imgName)
          goto LABEL_8;
        goto LABEL_9;
    }
  }
  else
  {
    if (self->_imgName)
    {
LABEL_8:
      objc_msgSend((id)objc_opt_class(), "description");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@: Error loading PVRTC image resource: \"%@\"), v14, self->_imgName);

    }
LABEL_9:
    v15 = 0;
  }

  return v15;
}

- (void)loadImageDataFromCGImage:(CGImage *)a3 pointsSize:(CGSize)a4
{
  double height;
  double width;
  CGImageAlphaInfo AlphaInfo;
  size_t v9;
  size_t v10;
  int8x8_t v11;
  unint64_t v12;
  unint64_t v13;
  uint8x8_t v14;
  _BOOL8 v15;
  CGColorSpace *ColorSpace;
  void *v17;
  CGColorSpace *DeviceRGB;
  CGContext *v19;
  int v20;
  double v21;
  double v22;
  size_t v23;
  void *v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  CGRect v30;
  CGRect v31;

  if (a3)
  {
    height = a4.height;
    width = a4.width;
    AlphaInfo = CGImageGetAlphaInfo(a3);
    v9 = CGImageGetWidth(a3);
    v10 = CGImageGetHeight(a3);
    v12 = v10;
    v13 = v9 * (unint64_t)v10;
    if ((v13 & 0xFFFFFFFF00000000) != 0)
      -[SKTexture loadImageDataFromCGImage:pointsSize:].cold.1();
    v15 = 0;
    if ((_DWORD)v9)
    {
      if ((v9 & ((_DWORD)v9 - 1)) == 0)
      {
        if ((_DWORD)v10)
        {
          v11.i32[0] = v10;
          v14 = (uint8x8_t)vcnt_s8(v11);
          v14.i16[0] = vaddlv_u8(v14);
          if (v14.i32[0] < 2u)
            v15 = 1;
        }
      }
    }
    -[SKTextureCache setIsPOT:](self->_textureCache, "setIsPOT:", v15);
    if (SKGetShouldUseExtendedRangeColor()
      && (ColorSpace = CGImageGetColorSpace(a3), SKColorSpaceIsWideGamut(ColorSpace)))
    {
      v17 = malloc_type_malloc(16 * v13, 0x1655AF3CuLL);
      DeviceRGB = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
      v19 = CGBitmapContextCreate(v17, v9, v12, 0x20uLL, (16 * v9), DeviceRGB, 0x2101u);
      v20 = 1;
    }
    else
    {
      v17 = malloc_type_malloc(4 * v13, 0x71113878uLL);
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      v19 = CGBitmapContextCreate(v17, v9, v12, 8uLL, (4 * v9), DeviceRGB, 0x4001u);
      v20 = 0;
    }
    CGColorSpaceRelease(DeviceRGB);
    v30.origin.x = 0.0;
    v30.origin.y = 0.0;
    v30.size.width = (double)v9;
    v30.size.height = (double)v12;
    CGContextClearRect(v19, v30);
    CGContextTranslateCTM(v19, 0.0, (double)v12);
    CGContextScaleCTM(v19, 1.0, -1.0);
    v31.origin.x = 0.0;
    v31.origin.y = 0.0;
    v31.size.width = (double)v9;
    v31.size.height = (double)v12;
    CGContextDrawImage(v19, v31, a3);
    -[SKTextureCache setHasAlpha:](self->_textureCache, "setHasAlpha:", (AlphaInfo > kCGImageAlphaNoneSkipFirst) | (0x1Eu >> AlphaInfo) & 1);
    CGContextRelease(v19);
    -[SKTextureCache setPixelSize:](self->_textureCache, "setPixelSize:", (double)v9, (double)v12);
    if (width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8))
    {
      -[SKTextureCache pixelSize](self->_textureCache, "pixelSize");
      width = v21;
      height = v22;
    }
    if (v20)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __49__SKTexture_loadImageDataFromCGImage_pointsSize___block_invoke;
      v25[3] = &unk_1EA4FFF48;
      v25[4] = &v26;
      SKCPerformResourceOperation(v25);
      v23 = (8 * v12 * v9);
      if (*((_BYTE *)v27 + 24))
      {
        v24 = malloc_type_malloc(v23, 0x4906E96DuLL);
        jet_convert_pixel_data_rgba_fp32_to_argb64_xr10_srgb(v17, v24);
        free(v17);
        -[SKTextureCache setTextureFormat:](self->_textureCache, "setTextureFormat:", 7);
      }
      else
      {
        v24 = malloc_type_malloc(v23, 0x7BCCEDBFuLL);
        jet_convert_pixel_data_rgba_fp32_to_rgba_fp16(v17, v24);
        free(v17);
        -[SKTextureCache setTextureFormat:](self->_textureCache, "setTextureFormat:", 10);
      }
      _Block_object_dispose(&v26, 8);
      v17 = v24;
    }
    else
    {
      -[SKTextureCache setTextureFormat:](self->_textureCache, "setTextureFormat:", 3);
    }
    -[SKTextureCache setSize:](self->_textureCache, "setSize:", width, height);
    -[SKTextureCache setPixelData:](self->_textureCache, "setPixelData:", v17);
    -[SKTextureCache setState:](self->_textureCache, "setState:", 1);
  }
}

void __49__SKTexture_loadImageDataFromCGImage_pointsSize___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  void *v8;
  unint64_t *v9;
  unint64_t v10;
  id v11;

  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)*a2 + 136))(*a2) == 1)
  {
    v4 = __dynamic_cast((const void *)*a2, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C0], 0);
    v5 = (std::__shared_weak_count *)a2[1];
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    (*(void (**)(void *))(*(_QWORD *)v4 + 360))(v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v8;
    if (v5)
    {
      v9 = (unint64_t *)&v5->__shared_owners_;
      do
        v10 = __ldaxr(v9);
      while (__stlxr(v10 - 1, v9));
      if (!v10)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
        v8 = v11;
      }
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = SKDeviceSupportsExtendedXR10Formats(v8);

  }
}

- (void)preloadWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = completionHandler;
  v6[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKTexture preloadTextures:withCompletionHandler:](SKTexture, "preloadTextures:withCompletionHandler:", v5, v4);

}

+ (id)preloadQueue
{
  if (+[SKTexture preloadQueue]::onceToken != -1)
    dispatch_once(&+[SKTexture preloadQueue]::onceToken, &__block_literal_global_88);
  return (id)+[SKTexture preloadQueue]::preloadQueue;
}

void __25__SKTexture_preloadQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.spritekit.preloadQueue", MEMORY[0x1E0C80D50]);
  v1 = (void *)+[SKTexture preloadQueue]::preloadQueue;
  +[SKTexture preloadQueue]::preloadQueue = (uint64_t)v0;

}

+ (void)preloadTextures:(NSArray *)textures withCompletionHandler:(void *)completionHandler
{
  NSArray *v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD block[4];
  id v25;

  v6 = textures;
  v21 = completionHandler;
  v7 = -[NSArray count](v6, "count");
  v8 = dispatch_group_create();
  objc_msgSend(a1, "preloadQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v10 = 0;
    HIDWORD(v11) = -858993459 * v7;
    LODWORD(v11) = -858993459 * v7;
    v12 = 19;
    if ((v11 >> 2) >= 0xCCCCCCD)
      v13 = 19;
    else
      v13 = 20;
    v14 = v7 / v13;
    if (v14 <= 5)
      v15 = 5;
    else
      v15 = v14;
    do
    {
      v16 = v12;
      if (v7 >= v15)
        v17 = v15;
      else
        v17 = v7;
      if (v17)
      {
        -[NSArray subarrayWithRange:](v6, "subarrayWithRange:", v10);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51__SKTexture_preloadTextures_withCompletionHandler___block_invoke;
        block[3] = &unk_1EA4FFF90;
        v25 = v18;
        v19 = v18;
        dispatch_group_async(v8, v9, block);

      }
      if (v7 < v15)
        break;
      v12 = v16 - 1;
      v10 += v15;
      v7 -= v15;
    }
    while (v16);
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __51__SKTexture_preloadTextures_withCompletionHandler___block_invoke_2;
  v22[3] = &unk_1EA4FFFB8;
  v23 = v21;
  v20 = v21;
  dispatch_group_notify(v8, v9, v22);

}

void __51__SKTexture_preloadTextures_withCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        v5 = *(id **)(*((_QWORD *)&v6 + 1) + 8 * v4);
        if (!objc_msgSend(v5[23], "state", (_QWORD)v6))
          objc_msgSend(v5, "loadImageData");
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v2);
  }

}

uint64_t __51__SKTexture_preloadTextures_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)initTextureCacheWithImageData
{
  SKTextureCache *v3;
  void *v4;
  SKTextureCache *textureCache;
  SKTextureCache *v6;

  +[SKTexture lookupTextureCacheForName:](SKTexture, "lookupTextureCacheForName:", self->_imgName);
  v3 = (SKTextureCache *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[NSString stringByDeletingPathExtension](self->_imgName, "stringByDeletingPathExtension"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        +[SKTexture lookupTextureCacheForName:](SKTexture, "lookupTextureCacheForName:", v4),
        v3 = (SKTextureCache *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3))
  {
    textureCache = self->_textureCache;
    self->_textureCache = v3;
    v6 = v3;

  }
}

- (void)loadImageData
{
  char *v3;
  NSString *v4;
  NSString *imgName;
  CGSize v6;
  NSObject *textureSyncQueue;
  char *v8;
  _QWORD block[5];

  if (self->_imgName)
  {
    -[SKTexture initTextureCacheWithImageData](self, "initTextureCacheWithImageData");
    if (-[SKTextureCache state](self->_textureCache, "state") != 1)
    {
      +[SKTextureAtlas lookupCachedTextureNamed:](SKTextureAtlas, "lookupCachedTextureNamed:", self->_imgName);
      v3 = (char *)objc_claimAutoreleasedReturnValue();
      v8 = v3;
      if (v3)
      {
        objc_msgSend(v3, "_ensureImageData");
        objc_storeStrong((id *)&self->_textureCache, *((id *)v8 + 23));
        v4 = (NSString *)objc_msgSend(*((id *)v8 + 2), "copy");
        imgName = self->_imgName;
        self->_imgName = v4;

        v6 = (CGSize)*((_OWORD *)v8 + 3);
        self->_textRect.origin = (CGPoint)*((_OWORD *)v8 + 2);
        self->_textRect.size = v6;
        self->_isPath = v8[11];
        self->_disableAlpha = v8[96];
        objc_storeStrong((id *)&self->_subTextureName, *((id *)v8 + 22));
        objc_storeStrong((id *)&self->_originalAtlasName, *((id *)v8 + 21));
        self->_needsExtrusionWorkaround = v8[10];
        self->_cropOffset = *(CGPoint *)(v8 + 120);
        self->_isRotated = v8[97];
        self->_isFlipped = v8[98];
        self->_cropScale = *(CGPoint *)(v8 + 104);

      }
      else
      {
        textureSyncQueue = self->_textureSyncQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __26__SKTexture_loadImageData__block_invoke;
        block[3] = &unk_1EA4FFF90;
        block[4] = self;
        dispatch_sync(textureSyncQueue, block);

      }
    }
  }
}

void __26__SKTexture_loadImageData__block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  CGImage *v57;
  double v58;
  double v59;
  double v60;
  uint64_t (**v61)(_QWORD);
  void *v62;
  uint64_t v63;
  uint64_t v64;
  double *v65;
  void *v66;
  double v67;
  double v68;
  int v69;
  _QWORD *v70;
  void *v71;
  double v72;
  double v73;
  char v74;
  uint64_t v75;
  char *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  __int128 v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  double v94;
  double v95;
  double v96;
  _QWORD v97[5];
  id v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "state") != 1)
  {
    v2 = *MEMORY[0x1E0C9D820];
    v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v4 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v4 + 24))
    {
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v5 = *(id *)(v4 + 24);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v100;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v100 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lastPathComponent");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "pathExtension");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "length") == 0;

            if (v13)
            {
              objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("png"));
              v14 = objc_claimAutoreleasedReturnValue();

              v11 = (void *)v14;
            }
            objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v17 = objc_retainAutorelease(v15);
              v16 = objc_msgSend(v17, "CGImage");
              objc_msgSend(v17, "size");
              v2 = v18;
              v3 = v19;

              goto LABEL_15;
            }

          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
          if (v6)
            continue;
          break;
        }
      }
      v16 = 0;
LABEL_15:

    }
    else
    {
      v16 = 0;
    }
    v20 = (void *)MEMORY[0x1E0D1A6A8];
    SKGetResourceBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "defaultUICatalogForBundle:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scale");
    v25 = v24;

    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceIdiom");

    objc_msgSend(v22, "imageWithName:scaleFactor:deviceIdiom:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), __deviceClassForInterfaceIdiom(v27), v25);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "parentNamedImageAtlastForImageNamed:scaleFactor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      +[SKTextureAtlas atlasNamed:](SKTextureAtlas, "atlasNamed:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "textureNamed:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v31)
      {
        objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(v31 + 184));
        v33 = objc_msgSend(*(id *)(v32 + 16), "copy");
        v35 = *(_QWORD *)(a1 + 32);
        v34 = (uint64_t *)(a1 + 32);
        v36 = *(void **)(v35 + 16);
        *(_QWORD *)(v35 + 16) = v33;

        v37 = *v34;
        v38 = *(_OWORD *)(v32 + 48);
        *(_OWORD *)(v37 + 32) = *(_OWORD *)(v32 + 32);
        *(_OWORD *)(v37 + 48) = v38;
        *(_BYTE *)(*v34 + 11) = *(_BYTE *)(v32 + 11);
        *(_BYTE *)(*v34 + 96) = *(_BYTE *)(v32 + 96);
        objc_storeStrong((id *)(*v34 + 176), *(id *)(v32 + 176));
        objc_storeStrong((id *)(*v34 + 168), *(id *)(v32 + 168));
        objc_storeStrong((id *)(*v34 + 152), *(id *)(v32 + 152));
        *(_OWORD *)(*v34 + 120) = *(_OWORD *)(v32 + 120);
        *(_BYTE *)(*v34 + 97) = *(_BYTE *)(v32 + 97);
        *(_BYTE *)(*v34 + 98) = *(_BYTE *)(v32 + 98);
        *(_OWORD *)(*v34 + 104) = *(_OWORD *)(v32 + 104);
        objc_storeStrong((id *)(*v34 + 208), *(id *)(v32 + 208));

LABEL_34:
LABEL_35:

        return;
      }

    }
    if (objc_msgSend(v28, "image"))
    {
      if (objc_msgSend(v28, "isAlphaCropped"))
      {
        objc_msgSend(v28, "size");
        v96 = v39;
        objc_msgSend(v28, "scale");
        v41 = v40;
        objc_msgSend(v28, "size");
        v43 = v42;
        objc_msgSend(v28, "scale");
        v45 = v44;
        objc_msgSend(v28, "alphaCroppedRect");
        v47 = v46;
        objc_msgSend(v28, "alphaCroppedRect");
        v49 = v48;
        objc_msgSend(v28, "alphaCroppedRect");
        v51 = v50;
        objc_msgSend(v28, "alphaCroppedRect");
        v53 = v52;
        objc_msgSend(v28, "alphaCroppedRect");
        v54 = v96 * v41;
        v55 = v43 * v45;
        v57 = +[SKTextureAtlas createCGImageFromCUINamedImage:withSize:atRect:](SKTextureAtlas, "createCGImageFromCUINamedImage:withSize:atRect:", objc_msgSend(v28, "image"), v54, v55, v47, v55 - (v49 + v51), v53, v56);
        objc_msgSend(v28, "scale");
        v59 = v58;
        objc_msgSend(v28, "scale");
        v2 = v54 / v59;
        v3 = v55 / v60;
        objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromCGImage:pointsSize:", v57, v2, v3);
        CGImageRelease(v57);
      }
      else
      {
        v16 = objc_msgSend(v28, "image");
        objc_msgSend(v28, "size");
        v2 = v67;
        v3 = v68;
      }
      goto LABEL_29;
    }
    if (v16)
    {
LABEL_29:
      v69 = 0;
LABEL_30:
      objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromCGImage:pointsSize:", v16, v2, v3);
      v70 = *(_QWORD **)(a1 + 32);
      if (!v70[26])
        +[SKTexture registerTextureCache:forName:](SKTexture, "registerTextureCache:forName:", v70[23], v70[2]);
      if (!v69)
        goto LABEL_35;
      objc_msgSend((id)objc_opt_class(), "description");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@: Error loading image resource: \"%@\"), v30, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      goto LABEL_34;
    }
    v97[0] = MEMORY[0x1E0C809B0];
    v97[1] = 3221225472;
    v97[2] = __26__SKTexture_loadImageData__block_invoke_3;
    v97[3] = &unk_1EA500020;
    v97[4] = *(_QWORD *)(a1 + 32);
    v98 = &__block_literal_global_98;
    v61 = (uint64_t (**)(_QWORD))MEMORY[0x1DF0CFCB0](v97);
    v62 = (void *)MEMORY[0x1E0CEA638];
    v63 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithContentsOfFile:", v63);
      v64 = objc_claimAutoreleasedReturnValue();
      v65 = (double *)MEMORY[0x1E0C9D820];
      v66 = (void *)v64;
      if (!v64)
        goto LABEL_41;
    }
    else
    {
      SKGetResourceBundle();
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "imageNamed:inBundle:", v63, v71);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      v65 = (double *)MEMORY[0x1E0C9D820];
      if (!v66)
        goto LABEL_41;
    }
    objc_msgSend(v66, "size");
    v69 = 0;
    if (v73 != *v65 || v72 != v65[1])
      goto LABEL_58;

LABEL_41:
    if ((v61[2](v61) & 1) != 0)
    {
      v74 = 0;
      v16 = 0;
      v69 = 0;
      goto LABEL_60;
    }
    v75 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasSuffix:", CFSTR(".pvr"));
    if ((v75 & 1) != 0
      || (v75 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "hasSuffix:", CFSTR(".pvrtc")), (_DWORD)v75))
    {
      __26__SKTexture_loadImageData__block_invoke_2(v75, *(void **)(*(_QWORD *)(a1 + 32) + 16));
      v76 = (char *)objc_claimAutoreleasedReturnValue();
      if (v76)
      {
        objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromPVRData:", v76);
LABEL_56:
        v74 = 0;
        v16 = 0;
        v69 = 0;
LABEL_59:

LABEL_60:
        if ((v74 & 1) == 0)
          goto LABEL_35;
        goto LABEL_30;
      }
      goto LABEL_54;
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "rangeOfString:", CFSTR(".")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      v76 = (char *)*(id *)(*(_QWORD *)(a1 + 32) + 16);
      SKGetResourceBundle();
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "pathForResource:ofType:", v76, CFSTR("pvr"));
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (v79)
      {
        objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromPVRData:", v79);
LABEL_52:

        goto LABEL_56;
      }
      SKGetResourceBundle();
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "pathForResource:ofType:", v76, CFSTR("pvrtc"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v81);
      v82 = objc_claimAutoreleasedReturnValue();
      if (v82)
      {
        v78 = v81;
        v79 = (void *)v82;
        objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromPVRData:");
        goto LABEL_52;
      }

    }
LABEL_54:
    +[SKTextureAtlas findTextureNamed:](SKTextureAtlas, "findTextureNamed:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
    v83 = objc_claimAutoreleasedReturnValue();
    v76 = (char *)v83;
    if (v83)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 184), *(id *)(v83 + 184));
      v84 = objc_msgSend(*((id *)v76 + 2), "copy");
      v86 = a1 + 32;
      v85 = *(_QWORD *)(a1 + 32);
      v87 = *(void **)(v85 + 16);
      *(_QWORD *)(v85 + 16) = v84;

      v88 = *(_QWORD *)(a1 + 32);
      v89 = *((_OWORD *)v76 + 3);
      *(_OWORD *)(v88 + 32) = *((_OWORD *)v76 + 2);
      *(_OWORD *)(v88 + 48) = v89;
      *(_BYTE *)(*(_QWORD *)v86 + 11) = v76[11];
      *(_BYTE *)(*(_QWORD *)v86 + 96) = v76[96];
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 176), *((id *)v76 + 22));
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 168), *((id *)v76 + 21));
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *((id *)v76 + 19));
      *(_OWORD *)(*(_QWORD *)v86 + 120) = *(_OWORD *)(v76 + 120);
      *(_BYTE *)(*(_QWORD *)v86 + 97) = v76[97];
      *(_BYTE *)(*(_QWORD *)v86 + 98) = v76[98];
      *(_OWORD *)(*(_QWORD *)v86 + 104) = *(_OWORD *)(v76 + 104);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 208), *((id *)v76 + 26));
      goto LABEL_56;
    }
    v90 = (void *)MEMORY[0x1E0CEA638];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "pathForResource:ofType:", CFSTR("MissingResource.png"), 0);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "imageWithContentsOfFile:", v92);
    v93 = objc_claimAutoreleasedReturnValue();

    v69 = 1;
    v66 = (void *)v93;
LABEL_58:
    v76 = objc_retainAutorelease(v66);
    v16 = objc_msgSend(v76, "CGImage");
    objc_msgSend(v76, "size");
    v2 = v94;
    v3 = v95;
    v74 = 1;
    goto LABEL_59;
  }
}

id __26__SKTexture_loadImageData__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "stringByDeletingPathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SKGetResourceBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pathForResource:ofType:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v9);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t __26__SKTexture_loadImageData__block_invoke_3(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSuffix:", CFSTR(".pvr.gz"));

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromPVRGZData:", v4);
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "pathExtension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (!v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "stringByAppendingPathExtension:", CFSTR("pvr.gz"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        v8 = 0;
        goto LABEL_9;
      }
      objc_msgSend(*(id *)(a1 + 32), "loadImageDataFromPVRGZData:", v9);

LABEL_8:
      v8 = 1;
LABEL_9:

      return v8;
    }
  }
  return 0;
}

- (SKTexture)initWithImageNamed:(id)a3
{
  id v4;
  SKTexture *v5;
  SKTexture *v6;
  uint64_t v7;
  NSString *imgName;
  NSString *v9;
  uint64_t v10;
  NSString *v11;
  SKTexture *v12;
  SKTexture *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKTexture;
  v5 = -[SKTexture init](&v15, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKTexture commonInit](v5, "commonInit");
    v7 = objc_msgSend(v4, "copy");
    imgName = v6->_imgName;
    v6->_imgName = (NSString *)v7;

    v9 = v6->_imgName;
    if (v9)
    {
      v10 = -[NSString length](v9, "length");
      v11 = v6->_imgName;
      if (!v10)
      {
        v6->_imgName = (NSString *)CFSTR("MissingResource.png");

        +[SKTexture _textureWithImageNamed:](SKTexture, "_textureWithImageNamed:", v6->_imgName);
        v12 = (SKTexture *)objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      }
      if (-[NSString isAbsolutePath](v11, "isAbsolutePath"))
        v6->_isPath = 1;
    }
  }
  v12 = v6;
LABEL_7:
  v13 = v12;

  return v13;
}

- (SKTexture)init
{
  SKTexture *v2;
  SKTexture *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKTexture;
  v2 = -[SKTexture init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SKTexture commonInit](v2, "commonInit");
  return v3;
}

- (SKTexture)initWithImagePath:(id)a3
{
  id v4;
  SKTexture *v5;
  SKTexture *v6;
  uint64_t v7;
  NSString *imgName;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SKTexture;
  v5 = -[SKTexture init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SKTexture commonInit](v5, "commonInit");
    v6->_isPath = 1;
    v7 = objc_msgSend(v4, "copy");
    imgName = v6->_imgName;
    v6->_imgName = (NSString *)v7;

  }
  return v6;
}

- (SKTexture)initWithCoder:(id)a3
{
  id v4;
  SKTexture *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v53;
  objc_super v54;

  v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)SKTexture;
  v5 = -[SKTexture init](&v54, sel_init);
  v6 = (uint64_t)v5;
  if (!v5)
    goto LABEL_13;
  -[SKTexture commonInit](v5, "commonInit");
  *(_BYTE *)(v6 + 12) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isData"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v4;
    objc_msgSend(v7, "searchPaths");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v8;

  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalAtlasName"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(v6 + 168);
  *(_QWORD *)(v6 + 168) = v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_subTextureName"));
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(void **)(v6 + 176);
  *(_QWORD *)(v6 + 176) = v12;

  if (*(_QWORD *)(v6 + 168) && *(_QWORD *)(v6 + 176))
  {
    if (!objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCapture")))
    {
      +[SKTextureAtlas atlasNamed:](SKTextureAtlas, "atlasNamed:", *(_QWORD *)(v6 + 168));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "textureNamed:", *(_QWORD *)(v6 + 176));
      v53 = objc_claimAutoreleasedReturnValue();

      v6 = v53;
      goto LABEL_10;
    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalTexture"));
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(v6 + 152);
    *(_QWORD *)(v6 + 152) = v14;

    objc_msgSend(*(id *)(v6 + 152), "_textureCache");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(v6 + 184);
    *(_QWORD *)(v6 + 184) = v16;

    *(_BYTE *)(v6 + 11) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isPath"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imgName"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_textRect"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "CGRectValue");
    *(_QWORD *)(v6 + 32) = v21;
    *(_QWORD *)(v6 + 40) = v22;
    *(_QWORD *)(v6 + 48) = v23;
    *(_QWORD *)(v6 + 56) = v24;

    *(_BYTE *)(v6 + 97) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isRotated"));
    *(_BYTE *)(v6 + 98) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isFlipped"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cropOffset"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "CGPointValue");
    *(_QWORD *)(v6 + 120) = v26;
    *(_QWORD *)(v6 + 128) = v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cropScale"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "CGPointValue");
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pixelSize"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "CGSizeValue");
    objc_msgSend(*(id *)(v6 + 184), "setPixelSize:");

    *(_BYTE *)(v6 + 11) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isPath"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imgName"));
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v32;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_textRect"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "CGRectValue");
    *(_QWORD *)(v6 + 32) = v35;
    *(_QWORD *)(v6 + 40) = v36;
    *(_QWORD *)(v6 + 48) = v37;
    *(_QWORD *)(v6 + 56) = v38;

    *(_BYTE *)(v6 + 97) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isRotated"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cropOffset"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "CGPointValue");
    *(_QWORD *)(v6 + 120) = v40;
    *(_QWORD *)(v6 + 128) = v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_cropScale"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "CGPointValue");
  }
  *(_QWORD *)(v6 + 104) = v29;
  *(_QWORD *)(v6 + 112) = v30;
LABEL_10:

  if (*(_BYTE *)(v6 + 12))
  {
    objc_msgSend(*(id *)(v6 + 184), "setState:", 1);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_pixelSize"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "CGSizeValue");
    objc_msgSend(*(id *)(v6 + 184), "setPixelSize:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_size"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "CGSizeValue");
    objc_msgSend(*(id *)(v6 + 184), "setSize:");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_textRect"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "CGRectValue");
    *(_QWORD *)(v6 + 32) = v45;
    *(_QWORD *)(v6 + 40) = v46;
    *(_QWORD *)(v6 + 48) = v47;
    *(_QWORD *)(v6 + 56) = v48;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_imageData"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithData:", v49));
    v51 = objc_msgSend(v50, "CGImage");
    objc_msgSend(*(id *)(v6 + 184), "size");
    objc_msgSend((id)v6, "loadImageDataFromCGImage:pointsSize:", v51);

  }
  *(_BYTE *)(v6 + 96) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disableAlpha"));
  objc_msgSend((id)v6, "setFilteringMode:", (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("_filteringMode")));
LABEL_13:

  return (SKTexture *)v6;
}

- (BOOL)isEqualToTexture:(id)a3
{
  SKTexture *v4;
  SKTexture *v5;
  SKTextureFilteringMode v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  NSString *originalAtlasName;
  NSString *subTextureName;
  id v22;
  id v23;
  char v24;

  v4 = (SKTexture *)a3;
  v5 = v4;
  if (self == v4)
    goto LABEL_33;
  if (self->_isPath != v4->_isPath)
    goto LABEL_20;
  if (self->_performFullCapture != v4->_performFullCapture)
    goto LABEL_20;
  if (self->_disableAlpha != v4->_disableAlpha)
    goto LABEL_20;
  if (self->_isRotated != v4->_isRotated)
    goto LABEL_20;
  if (self->_isFlipped != v4->_isFlipped)
    goto LABEL_20;
  v6 = -[SKTexture filteringMode](self, "filteringMode");
  if (v6 != -[SKTexture filteringMode](v5, "filteringMode"))
    goto LABEL_20;
  -[SKTextureCache size](self->_textureCache, "size");
  v8 = v7;
  -[SKTextureCache size](v5->_textureCache, "size");
  if (v8 != v9)
    goto LABEL_20;
  -[SKTextureCache size](self->_textureCache, "size");
  v11 = v10;
  -[SKTextureCache size](v5->_textureCache, "size");
  if (v11 != v12)
    goto LABEL_20;
  -[SKTextureCache pixelSize](self->_textureCache, "pixelSize");
  v14 = v13;
  -[SKTextureCache pixelSize](v5->_textureCache, "pixelSize");
  if (v14 != v15)
    goto LABEL_20;
  -[SKTextureCache pixelSize](self->_textureCache, "pixelSize");
  v17 = v16;
  -[SKTextureCache pixelSize](v5->_textureCache, "pixelSize");
  if (v17 != v18)
    goto LABEL_20;
  if (self->_cropOffset.x != v5->_cropOffset.x)
    goto LABEL_20;
  if (self->_cropOffset.y != v5->_cropOffset.y)
    goto LABEL_20;
  if (self->_cropScale.x != v5->_cropScale.x)
    goto LABEL_20;
  if (self->_cropScale.y != v5->_cropScale.y)
    goto LABEL_20;
  if (self->_textRect.origin.x != v5->_textRect.origin.x)
    goto LABEL_20;
  if (self->_textRect.origin.y != v5->_textRect.origin.y)
    goto LABEL_20;
  if (self->_textRect.size.width != v5->_textRect.size.width)
    goto LABEL_20;
  if (self->_textRect.size.height != v5->_textRect.size.height)
    goto LABEL_20;
  originalAtlasName = self->_originalAtlasName;
  if ((unint64_t)originalAtlasName | (unint64_t)v5->_originalAtlasName)
  {
    if (!-[NSString isEqualToString:](originalAtlasName, "isEqualToString:"))
      goto LABEL_20;
  }
  subTextureName = self->_subTextureName;
  if ((unint64_t)subTextureName | (unint64_t)v5->_subTextureName)
  {
    if (!-[NSString isEqualToString:](subTextureName, "isEqualToString:"))
      goto LABEL_20;
  }
  if (!-[NSString isEqualToString:](self->_imgName, "isEqualToString:", v5->_imgName))
    goto LABEL_20;
  if (-[SKTexture performFullCapture](self, "performFullCapture"))
  {
    if (!self->_originalTexture)
    {
      if (self->_isData != v5->_isData)
        goto LABEL_20;
      goto LABEL_32;
    }
LABEL_33:
    v19 = 1;
    goto LABEL_34;
  }
  if (self->_isData != v5->_isData)
    goto LABEL_20;
  if (!self->_isData)
    goto LABEL_33;
LABEL_32:
  v22 = -[SKTexture _copyImageData](self, "_copyImageData");
  v23 = -[SKTexture _copyImageData](v5, "_copyImageData");
  v24 = objc_msgSend(v22, "isEqual:", v23);

  if ((v24 & 1) != 0)
    goto LABEL_33;
LABEL_20:
  v19 = 0;
LABEL_34:

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  SKTexture *originalTexture;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeObject:forKey:", self->_originalAtlasName, CFSTR("_originalAtlasName"));
  objc_msgSend(v13, "encodeObject:forKey:", self->_subTextureName, CFSTR("_subTextureName"));
  objc_msgSend(v13, "encodeBool:forKey:", self->_isPath, CFSTR("_isPath"));
  objc_msgSend(v13, "encodeBool:forKey:", -[SKTexture performFullCapture](self, "performFullCapture"), CFSTR("_isCapture"));
  if (!-[SKTexture performFullCapture](self, "performFullCapture"))
  {
    objc_msgSend(v13, "encodeBool:forKey:", self->_isData, CFSTR("_isData"));
    if (!self->_isData)
      goto LABEL_8;
    v5 = -[SKTexture _copyImageData](self, "_copyImageData");
    objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("_imageData"));
LABEL_7:

    goto LABEL_8;
  }
  originalTexture = self->_originalTexture;
  if (!originalTexture)
  {
    objc_msgSend(v13, "encodeBool:forKey:", 1, CFSTR("_isData"));
    v5 = -[SKTexture _copyImageData](self, "_copyImageData");
    objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("_imageData"));
    goto LABEL_7;
  }
  objc_msgSend(v13, "encodeObject:forKey:", originalTexture, CFSTR("_originalTexture"));
LABEL_8:
  objc_msgSend(v13, "encodeObject:forKey:", self->_imgName, CFSTR("_imgName"));
  objc_msgSend(v13, "encodeBool:forKey:", self->_disableAlpha, CFSTR("_disableAlpha"));
  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[SKTextureCache size](self->_textureCache, "size");
  objc_msgSend(v6, "valueWithCGSize:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("_size"));

  v8 = (void *)MEMORY[0x1E0CB3B18];
  -[SKTextureCache pixelSize](self->_textureCache, "pixelSize");
  objc_msgSend(v8, "valueWithCGSize:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("_pixelSize"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", self->_textRect.origin.x, self->_textRect.origin.y, self->_textRect.size.width, self->_textRect.size.height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("_textRect"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_cropOffset.x, self->_cropOffset.y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("_cropOffset"));

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", self->_cropScale.x, self->_cropScale.y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("_cropScale"));

  objc_msgSend(v13, "encodeBool:forKey:", self->_isRotated, CFSTR("_isRotated"));
  objc_msgSend(v13, "encodeBool:forKey:", self->_isFlipped, CFSTR("_isFlipped"));
  objc_msgSend(v13, "encodeInteger:forKey:", -[SKTexture filteringMode](self, "filteringMode"), CFSTR("_filteringMode"));

}

+ (SKTexture)textureWithImageNamed:(NSString *)name
{
  NSString *v4;
  void *v5;

  v4 = name;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImageNamed:", v4);

  return (SKTexture *)v5;
}

+ (SKTexture)textureWithImageNamed:(id)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  CGFloat *v10;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v10 = (CGFloat *)objc_msgSend(objc_alloc((Class)a1), "initWithImageNamed:", v9);
  v10[4] = x;
  v10[5] = y;
  v10[6] = width;
  v10[7] = height;

  return (SKTexture *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  CGSize size;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_imgName, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  size = self->_textRect.size;
  *(CGPoint *)(v4 + 32) = self->_textRect.origin;
  *(CGSize *)(v4 + 48) = size;
  *(_BYTE *)(v4 + 11) = self->_isPath;
  objc_msgSend(*(id *)(v4 + 184), "setHasAlpha:", -[SKTextureCache hasAlpha](self->_textureCache, "hasAlpha"));
  *(_BYTE *)(v4 + 96) = self->_disableAlpha;
  *(_BYTE *)(v4 + 10) = self->_needsExtrusionWorkaround;
  objc_storeStrong((id *)(v4 + 176), self->_subTextureName);
  objc_storeStrong((id *)(v4 + 168), self->_originalAtlasName);
  objc_storeStrong((id *)(v4 + 184), self->_textureCache);
  *(CGPoint *)(v4 + 120) = self->_cropOffset;
  *(_BYTE *)(v4 + 97) = self->_isRotated;
  *(_BYTE *)(v4 + 98) = self->_isFlipped;
  *(CGPoint *)(v4 + 104) = self->_cropScale;
  objc_storeStrong((id *)(v4 + 208), self->_rootAtlas);
  return (id)v4;
}

+ (SKTexture)textureWithRect:(CGRect)rect inTexture:(SKTexture *)texture
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  SKTexture *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  SKTextureCache *v16;
  CGSize v18;

  height = rect.size.height;
  width = rect.size.width;
  y = rect.origin.y;
  x = rect.origin.x;
  v10 = texture;
  if (SKGetLinkedOnOrAfter() && (width < 0.0 || height < 0.0))
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v18.width = width;
    v18.height = height;
    NSStringFromCGSize(v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid size specified (should be positive): %@"), v12);

  }
  v13 = objc_alloc_init((Class)a1);
  v14 = -[NSString copy](v10->_imgName, "copy");
  v15 = (void *)*((_QWORD *)v13 + 2);
  *((_QWORD *)v13 + 2) = v14;

  objc_storeStrong((id *)v13 + 19, texture);
  objc_storeStrong((id *)v13 + 22, v10->_subTextureName);
  objc_storeStrong((id *)v13 + 21, v10->_originalAtlasName);
  *((CGFloat *)v13 + 4) = x;
  *((CGFloat *)v13 + 5) = y;
  *((double *)v13 + 6) = width;
  *((double *)v13 + 7) = height;
  *((_BYTE *)v13 + 11) = v10->_isPath;
  objc_storeStrong((id *)v13 + 26, v10->_rootAtlas);
  v16 = v10->_textureCache;
  if (v16
    || (+[SKTexture lookupTextureCacheForName:](SKTexture, "lookupTextureCacheForName:", *((_QWORD *)v13 + 2)), (v16 = (SKTextureCache *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_storeStrong((id *)v13 + 23, v16);
  }
  else
  {
    objc_msgSend(*((id *)v13 + 23), "setHasAlpha:", -[SKTextureCache hasAlpha](v10->_textureCache, "hasAlpha"));
    *((_BYTE *)v13 + 96) = v10->_disableAlpha;
    -[SKTextureCache pixelSize](v10->_textureCache, "pixelSize");
    objc_msgSend(*((id *)v13 + 23), "setPixelSize:");
    -[SKTextureCache size](v10->_textureCache, "size");
    objc_msgSend(*((id *)v13 + 23), "setSize:");
    objc_msgSend(*((id *)v13 + 23), "setState:", -[SKTextureCache state](v10->_textureCache, "state"));
    v16 = 0;
  }

  return (SKTexture *)v13;
}

+ (SKTexture)textureVectorNoiseWithSmoothness:(CGFloat)smoothness size:(CGSize)size
{
  id *v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  int v10;
  double v11;
  int v12;
  double v13;
  _BYTE *v14;
  float v15;
  unsigned int v16;
  BOOL v17;
  int32x2_t v18;
  _BOOL8 v19;
  double v21;

  v5 = 0;
  v21 = round(size.width);
  v6 = fmax(v21, 0.0);
  if (v6 != 0.0)
  {
    v7 = round(size.height);
    v8 = fmax(v7, 0.0);
    if (v8 != 0.0)
    {
      v5 = (id *)objc_alloc_init((Class)a1);
      objc_msgSend(v5[23], "setPixelData:", malloc_type_malloc(vcvtd_n_u64_f64(v6 * v8, 2uLL), 0x73BD441DuLL));
      v9 = objc_msgSend(v5[23], "pixelData");
      __exp10(smoothness * -2.0 + 3.0);
      if (v7 > 0.0)
      {
        v10 = 0;
        v11 = 0.0;
        do
        {
          if (v21 > 0.0)
          {
            v12 = 0;
            v13 = 0.0;
            do
            {
              srdnoise3();
              v14 = (_BYTE *)(v9 + (int)vcvtd_n_s64_f64(v13 + v11 * v6, 2uLL));
              *v14 = (int)(float)((float)((float)(0.0 * 0.10206) + 0.5) * 255.0);
              v14[1] = (int)(float)((float)((float)(0.0 * 0.10206) + 0.5) * 255.0);
              v14[2] = (int)(float)((float)((float)(0.0 * 0.10206) + 0.5) * 255.0);
              v14[3] = (int)(float)((float)((float)(v15 * 0.5) + 0.5) * 255.0);
              v13 = (double)++v12;
            }
            while (v6 > (double)v12);
          }
          v11 = (double)++v10;
        }
        while (v8 > (double)v10);
      }
      v16 = v8;
      if (v6)
        v17 = v16 == 0;
      else
        v17 = 1;
      v19 = 0;
      if (!v17)
      {
        v18 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v6, v16), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v6, v16), (int32x2_t)-1)));
        if ((v18.i8[4] & 1) != 0 && (v18.i8[0] & 1) != 0)
          v19 = 1;
      }
      objc_msgSend(v5[23], "setIsPOT:", v19);
      objc_msgSend(v5[23], "setHasAlpha:", 1);
      objc_msgSend(v5[23], "setPixelSize:", v6, v8);
      objc_msgSend(v5[23], "setSize:", v6, v8);
      *((_BYTE *)v5 + 12) = 1;
      objc_msgSend(v5[23], "setState:", 1);
    }
  }
  return (SKTexture *)v5;
}

+ (SKTexture)textureNoiseWithSmoothness:(CGFloat)smoothness size:(CGSize)size grayscale:(BOOL)grayscale
{
  id *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v11;
  int v12;
  double v13;
  int v14;
  double v15;
  __int32 v16;
  float32x4_t v17;
  __int32 v18;
  __int32 v19;
  __int32 v20;
  int v21;
  float32x4_t v22;
  int16x8_t v23;
  unsigned int v24;
  BOOL v25;
  int32x2_t v26;
  _BOOL8 v27;
  double v29;
  double v30;
  __int32 v31;
  __int32 v32;
  __int32 v33;
  float32x4_t v34;

  v6 = 0;
  v30 = round(size.width);
  v7 = fmax(v30, 0.0);
  if (v7 != 0.0)
  {
    v8 = round(size.height);
    v9 = fmax(v8, 0.0);
    if (v9 != 0.0)
    {
      v6 = (id *)objc_alloc_init((Class)a1);
      objc_msgSend(v6[23], "setPixelData:", malloc_type_malloc(vcvtd_n_u64_f64(v7 * v9, 2uLL), 0xE4EE1079uLL));
      v11 = objc_msgSend(v6[23], "pixelData");
      __exp10(smoothness * -2.0 + 3.0);
      if (v8 > 0.0)
      {
        v12 = 0;
        v13 = 0.0;
        v34 = (float32x4_t)vdupq_n_s32(0x437F0000u);
        v29 = v9;
        do
        {
          if (v30 > 0.0)
          {
            v14 = 0;
            v15 = 0.0;
            do
            {
              snoise2();
              v17.i32[0] = v16;
              v18 = v16;
              v19 = v16;
              if (!grayscale)
              {
                v33 = v16;
                snoise2();
                v32 = v20;
                snoise2();
                v31 = v21;
                snoise2();
                v18 = v32;
                v17.i32[0] = v33;
                v19 = v31;
              }
              v17.i32[1] = v18;
              v17.i64[1] = __PAIR64__(v16, v19);
              v22.i64[0] = 0x3F0000003F000000;
              v22.i64[1] = 0x3F0000003F000000;
              v23 = (int16x8_t)vcvtq_s32_f32(vmulq_f32(vmlaq_f32(v22, v22, v17), v34));
              *(int16x4_t *)v23.i8 = vmovn_s32((int32x4_t)v23);
              *(_DWORD *)(v11 + (int)vcvtd_n_s64_f64(v15 + v13 * v7, 2uLL)) = vmovn_s16(v23).u32[0];
              v15 = (double)++v14;
            }
            while (v7 > (double)v14);
          }
          v13 = (double)++v12;
          v9 = v29;
        }
        while (v29 > (double)v12);
      }
      v24 = v9;
      if (v7)
        v25 = v24 == 0;
      else
        v25 = 1;
      v27 = 0;
      if (!v25)
      {
        v26 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v7, v24), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v7, v24), (int32x2_t)-1)));
        if ((v26.i8[4] & 1) != 0 && (v26.i8[0] & 1) != 0)
          v27 = 1;
      }
      objc_msgSend(v6[23], "setIsPOT:", v27);
      objc_msgSend(v6[23], "setHasAlpha:", 1);
      objc_msgSend(v6[23], "setPixelSize:", v7, v9);
      objc_msgSend(v6[23], "setSize:", v7, v9);
      *((_BYTE *)v6 + 12) = 1;
      objc_msgSend(v6[23], "setState:", 1);
    }
  }
  return (SKTexture *)v6;
}

+ (SKTexture)textureWithCGImage:(CGImage *)a3 pointSize:(CGSize)a4
{
  double height;
  double width;
  _BYTE *v7;

  height = a4.height;
  width = a4.width;
  v7 = objc_alloc_init((Class)a1);
  v7[12] = 1;
  objc_msgSend(v7, "loadImageDataFromCGImage:pointsSize:", a3, width, height);
  return (SKTexture *)v7;
}

+ (SKTexture)textureWithCGImage:(CGImageRef)image
{
  return (SKTexture *)objc_msgSend(a1, "textureWithCGImage:pointSize:", image, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

+ (SKTexture)textureWithImage:(UIImage *)image
{
  UIImage *v4;
  uint64_t v5;
  void *v6;

  v4 = objc_retainAutorelease(image);
  v5 = -[UIImage CGImage](v4, "CGImage");
  -[UIImage size](v4, "size");
  objc_msgSend(a1, "textureWithCGImage:pointSize:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (SKTexture *)v6;
}

+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size
{
  double height;
  double width;
  NSData *v7;
  id *v8;
  unsigned int v9;
  unsigned int v10;
  int8x8_t v11;
  int8x8_t v12;
  unsigned int v13;
  uint8x8_t v14;
  uint64_t v16;

  height = size.height;
  width = size.width;
  v7 = pixelData;
  v8 = 0;
  if (v7 && width > 0.0 && height > 0.0)
  {
    v8 = (id *)objc_alloc_init((Class)a1);
    v9 = vcvtpd_u64_f64(width);
    v10 = vcvtpd_u64_f64(height);
    objc_msgSend(v8[23], "setPixelData:", malloc_type_malloc(4 * v10 * v9, 0x100004077774924uLL));
    memcpy((void *)objc_msgSend(v8[23], "pixelData"), -[NSData bytes](objc_retainAutorelease(v7), "bytes"), 4 * v10 * v9);
    if (!v9 || !v10)
      goto LABEL_11;
    v11.i32[0] = v9;
    v12 = vcnt_s8(v11);
    v12.i16[0] = vaddlv_u8((uint8x8_t)v12);
    v13 = v12.i32[0];
    v12.i32[0] = v10;
    v14 = (uint8x8_t)vcnt_s8(v12);
    v14.i16[0] = vaddlv_u8(v14);
    if (v13 <= 1 && v14.i32[0] < 2u)
      v16 = 1;
    else
LABEL_11:
      v16 = 0;
    objc_msgSend(v8[23], "setIsPOT:", v16);
    objc_msgSend(v8[23], "setHasAlpha:", 1);
    objc_msgSend(v8[23], "setPixelSize:", width, height);
    objc_msgSend(v8[23], "setSize:", width, height);
    *((_BYTE *)v8 + 12) = 1;
    objc_msgSend(v8[23], "setState:", 1);
  }

  return (SKTexture *)v8;
}

+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size flipped:(BOOL)flipped
{
  double height;
  double width;
  NSData *v9;
  id *v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  int8x8_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unsigned int v19;
  int8x8_t v20;
  unsigned int v21;
  uint8x8_t v22;
  uint64_t v24;

  height = size.height;
  width = size.width;
  v9 = pixelData;
  v10 = 0;
  if (v9 && width > 0.0 && height > 0.0)
  {
    if (flipped)
    {
      v10 = (id *)objc_alloc_init((Class)a1);
      v11 = vcvtpd_u64_f64(width);
      v12 = vcvtpd_u64_f64(height);
      objc_msgSend(v10[23], "setPixelData:", malloc_type_malloc(4 * v12 * v11, 0x100004077774924uLL));
      v13 = -[NSData bytes](objc_retainAutorelease(v9), "bytes");
      v14 = objc_msgSend(v10[23], "pixelData");
      if (v12)
      {
        v16 = (char *)v14;
        v17 = 4 * v11;
        v18 = (char *)(v13 + v17 * (v12 + 0x3FFFFFFF));
        v19 = v12;
        do
        {
          memcpy(v16, v18, 4 * v11);
          v16 += v17;
          v18 -= v17;
          --v19;
        }
        while (v19);
      }
      if (!v11 || !v12)
        goto LABEL_16;
      v15.i32[0] = v11;
      v20 = vcnt_s8(v15);
      v20.i16[0] = vaddlv_u8((uint8x8_t)v20);
      v21 = v20.i32[0];
      v20.i32[0] = v12;
      v22 = (uint8x8_t)vcnt_s8(v20);
      v22.i16[0] = vaddlv_u8(v22);
      if (v21 <= 1 && v22.i32[0] < 2u)
        v24 = 1;
      else
LABEL_16:
        v24 = 0;
      objc_msgSend(v10[23], "setIsPOT:", v24);
      objc_msgSend(v10[23], "setHasAlpha:", 1);
      objc_msgSend(v10[23], "setPixelSize:", width, height);
      objc_msgSend(v10[23], "setSize:", width, height);
      *((_BYTE *)v10 + 12) = 1;
      objc_msgSend(v10[23], "setState:", 1);
    }
    else
    {
      objc_msgSend(a1, "textureWithData:size:", v9, width, height);
      v10 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }

  return (SKTexture *)v10;
}

+ (SKTexture)textureWithData:(NSData *)pixelData size:(CGSize)size rowLength:(unsigned int)rowLength alignment:(unsigned int)alignment
{
  double height;
  double width;
  NSData *v11;
  id *v12;
  unsigned int v13;
  unsigned int v14;
  int8x8_t v15;
  int8x8_t v16;
  unsigned int v17;
  uint8x8_t v18;
  uint64_t v20;

  height = size.height;
  width = size.width;
  v11 = pixelData;
  v12 = 0;
  if (v11 && width > 0.0 && height > 0.0)
  {
    v12 = (id *)objc_alloc_init((Class)a1);
    v13 = vcvtpd_u64_f64(width);
    v14 = vcvtpd_u64_f64(height);
    objc_msgSend(v12[23], "setPixelData:", malloc_type_malloc(4 * v14 * v13, 0x100004077774924uLL));
    memcpy((void *)objc_msgSend(v12[23], "pixelData"), -[NSData bytes](objc_retainAutorelease(v11), "bytes"), 4 * v14 * v13);
    if (!v13 || !v14)
      goto LABEL_11;
    v15.i32[0] = v13;
    v16 = vcnt_s8(v15);
    v16.i16[0] = vaddlv_u8((uint8x8_t)v16);
    v17 = v16.i32[0];
    v16.i32[0] = v14;
    v18 = (uint8x8_t)vcnt_s8(v16);
    v18.i16[0] = vaddlv_u8(v18);
    if (v17 <= 1 && v18.i32[0] < 2u)
      v20 = 1;
    else
LABEL_11:
      v20 = 0;
    objc_msgSend(v12[23], "setIsPOT:", v20);
    objc_msgSend(v12[23], "setHasAlpha:", 1);
    objc_msgSend(v12[23], "setPixelSize:", width, height);
    objc_msgSend(v12[23], "setSize:", width, height);
    *((_BYTE *)v12 + 12) = 1;
    *((_DWORD *)v12 + 34) = alignment;
    *((_DWORD *)v12 + 35) = rowLength;
    objc_msgSend(v12[23], "setState:", 1);
  }

  return (SKTexture *)v12;
}

- (BOOL)hasAlpha
{
  return -[SKTextureCache hasAlpha](self->_textureCache, "hasAlpha");
}

- (CGRect)textureRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_textRect.origin.x;
  y = self->_textRect.origin.y;
  width = self->_textRect.size.width;
  height = self->_textRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  -[SKTexture _ensureImageData](self, "_ensureImageData");
  -[SKTextureCache size](self->_textureCache, "size");
  v4 = v3;
  v6 = v5;
  -[SKTexture textureRect](self, "textureRect");
  v8 = v7;
  v10 = v9;
  v11 = -[SKTexture isRotated](self, "isRotated");
  v12 = v4 * v8;
  -[SKTexture cropScale](self, "cropScale");
  v14 = v13;
  v16 = v15;
  v17 = v6 * v10;
  -[SKTexture cropScale](self, "cropScale");
  v20 = v17 / v19;
  if (!v11)
    v20 = v12 / v14;
  v21 = v17 / v18;
  if (v11)
    v21 = v12 / v16;
  result.height = v21;
  result.width = v20;
  return result;
}

- (SKTexture)textureByApplyingCIFilter:(CIFilter *)filter
{
  CIFilter *v4;
  id *v5;
  SKTexture *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unsigned int v21;
  unsigned int v22;
  int32x2_t v23;
  _BOOL8 v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;

  v4 = filter;
  v5 = (id *)objc_alloc_init((Class)objc_opt_class());
  v6 = self;
  -[SKTexture _ensureImageData](v6, "_ensureImageData");
  v7 = (void *)-[CIFilter copy](v4, "copy");
  -[SKTextureCache pixelSize](v6->_textureCache, "pixelSize");
  v9 = v8;
  -[SKTextureCache pixelSize](v6->_textureCache, "pixelSize");
  if (v4)
  {
    v11 = v10;
    v12 = (void *)MEMORY[0x1E0C9DDC8];
    objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", 1.0, 1.0, 1.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageWithColor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "imageByCroppingToRect:", 0.0, 0.0, v9, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setValue:forKey:", v15, CFSTR("inputImage"));
    objc_msgSend(v7, "valueForKey:", CFSTR("outputImage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "extent");
    v18 = v17;
    v20 = v19;

  }
  else
  {
    v18 = *MEMORY[0x1E0C9D820];
    v20 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v21 = vcvtpd_u64_f64(v18);
  v24 = 0;
  if (v21)
  {
    v22 = vcvtpd_u64_f64(v20);
    v23 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v21, v22), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v21, v22), (int32x2_t)-1)));
    if ((v23.i8[4] & 1) != 0 && v22 && (v23.i8[0] & 1) != 0)
      v24 = 1;
  }
  objc_msgSend(v5[23], "setIsPOT:", v24);
  objc_storeStrong(v5 + 18, v7);
  objc_storeStrong(v5 + 19, self);
  objc_msgSend(v5[23], "setState:", 1);
  objc_msgSend(v5[23], "setPixelSize:", v18, v20);
  -[SKTextureCache size](v6->_textureCache, "size");
  v26 = v25;
  -[SKTextureCache pixelSize](v6->_textureCache, "pixelSize");
  v28 = v27;
  objc_msgSend(v5[23], "pixelSize");
  v30 = v29;
  -[SKTextureCache size](v6->_textureCache, "size");
  v32 = v31;
  -[SKTextureCache pixelSize](v6->_textureCache, "pixelSize");
  v34 = v33;
  objc_msgSend(v5[23], "pixelSize");
  objc_msgSend(v5[23], "setSize:", v26 / v28 * v30, v32 / v34 * v35);

  return (SKTexture *)v5;
}

- (id)description
{
  __CFString *v3;
  NSString *subTextureName;
  __CFString *v5;
  NSString *imgName;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  CIFilter *filter;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  if (self->_isData)
  {
    v3 = CFSTR("<data>");
    goto LABEL_8;
  }
  subTextureName = self->_subTextureName;
  if (subTextureName)
  {
    v5 = subTextureName;
LABEL_7:
    v3 = v5;
    goto LABEL_8;
  }
  imgName = self->_imgName;
  if (imgName)
  {
    -[NSString lastPathComponent](imgName, "lastPathComponent");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  filter = self->_filter;
  if (filter)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[CIFilter name](filter, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKTexture imageNameOrPath](self->_originalTexture, "imageNameOrPath");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@(%@)>"), v15, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v3 = (__CFString *)v18;
  }
  else
  {
    v3 = 0;
  }
LABEL_8:
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[SKTexture pixelSize](self, "pixelSize");
  v9 = v8;
  -[SKTexture pixelSize](self, "pixelSize");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("<SKTexture> '%@' (%d x %d)"), v3, (int)v9, (int)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)usesMipmaps
{
  return self->_shouldGenerateMipmaps;
}

- (void)setUsesMipmaps:(BOOL)usesMipmaps
{
  self->_shouldGenerateMipmaps = usesMipmaps;
}

- (void)_ensureImageData
{
  SKTextureCache *textureCache;

  textureCache = self->_textureCache;
  if (!textureCache || -[SKTextureCache state](textureCache, "state") != 1)
    -[SKTexture loadImageData](self, "loadImageData");
}

- (void)setWrapMode:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  -[SKTexture _ensureImageData](self, "_ensureImageData");
  if (-[SKTextureCache wrapMode](self->_textureCache, "wrapMode") != (_DWORD)v3)
    -[SKTextureCache setWrapMode:](self->_textureCache, "setWrapMode:", v3);
}

- (int)wrapMode
{
  -[SKTexture _ensureImageData](self, "_ensureImageData");
  return -[SKTextureCache wrapMode](self->_textureCache, "wrapMode");
}

- (void)setFilteringMode:(SKTextureFilteringMode)filteringMode
{
  -[SKTexture _ensureImageData](self, "_ensureImageData");
  if (-[SKTextureCache filteringMode](self->_textureCache, "filteringMode") != filteringMode)
    -[SKTextureCache setFilteringMode:](self->_textureCache, "setFilteringMode:", filteringMode);
}

- (SKTextureFilteringMode)filteringMode
{
  -[SKTexture _ensureImageData](self, "_ensureImageData");
  return -[SKTextureCache filteringMode](self->_textureCache, "filteringMode");
}

- (void)dealloc
{
  SKTextureCache *textureCache;
  NSString *imgName;
  objc_super v5;

  textureCache = self->_textureCache;
  self->_textureCache = 0;

  imgName = self->_imgName;
  self->_imgName = 0;

  v5.receiver = self;
  v5.super_class = (Class)SKTexture;
  -[SKTexture dealloc](&v5, sel_dealloc);
}

+ (id)_textureWithImageNamed:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathForResource:ofType:", v4, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v5[2];
  v5[2] = v7;

  *((_BYTE *)v5 + 11) = 1;
  return v5;
}

- (CGPoint)cropScale
{
  double x;
  double y;
  CGPoint result;

  x = self->_cropScale.x;
  y = self->_cropScale.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCropScale:(CGPoint)a3
{
  self->_cropScale = a3;
}

- (CGPoint)cropOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_cropOffset.x;
  y = self->_cropOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setCropOffset:(CGPoint)a3
{
  self->_cropOffset = a3;
}

- (NSString)originalAtlasName
{
  return self->_originalAtlasName;
}

- (void)setOriginalAtlasName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSString)subTextureName
{
  return self->_subTextureName;
}

- (void)setSubTextureName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (BOOL)performFullCapture
{
  return self->_performFullCapture;
}

- (void)setPerformFullCapture:(BOOL)a3
{
  self->_performFullCapture = a3;
}

- (BOOL)isRepeatable
{
  return self->_isRepeatable;
}

- (SKTextureAtlas)rootAtlas
{
  return self->_rootAtlas;
}

- (void)setRootAtlas:(id)a3
{
  objc_storeStrong((id *)&self->_rootAtlas, a3);
}

- (unsigned)alphaMap
{
  return self->_alphaMap;
}

- (CGSize)alphaMapSize
{
  double width;
  double height;
  CGSize result;

  width = self->_alphaMapSize.width;
  height = self->_alphaMapSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setNeedsExtrusionWorkaround:(BOOL)a3
{
  self->_needsExtrusionWorkaround = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootAtlas, 0);
  objc_storeStrong((id *)&self->_textureSyncQueue, 0);
  objc_storeStrong((id *)&self->_textureCache, 0);
  objc_storeStrong((id *)&self->_subTextureName, 0);
  objc_storeStrong((id *)&self->_originalAtlasName, 0);
  objc_storeStrong((id *)&self->_originalTexture, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_searchPaths, 0);
  objc_storeStrong((id *)&self->_imgName, 0);
}

- (SKTexture)initWithBackingTetxure:(shared_ptr<jet_texture>)a3
{
  jet_texture *ptr;
  uint64_t (***v5)(_QWORD, SEL);
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unsigned int v9;
  __n128 v10;
  unsigned int v11;
  double v12;
  SKTexture *v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;

  ptr = a3.__ptr_;
  v5 = *(uint64_t (****)(_QWORD, SEL))a3.__ptr_;
  v6 = (std::__shared_weak_count *)*((_QWORD *)a3.__ptr_ + 1);
  v18 = *(_QWORD *)a3.__ptr_;
  v19 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
    v5 = *(uint64_t (****)(_QWORD, SEL))a3.__ptr_;
  }
  v9 = (**v5)(v5, a2);
  v10 = ((__n128 (*)(_QWORD))*(_QWORD *)(**(_QWORD **)ptr + 8))(*(_QWORD *)ptr);
  v10.n128_f32[0] = (float)v9;
  *(float *)&v12 = (float)v11;
  v13 = -[SKTexture initWithBackingTetxure:logicalWidth:height:](self, "initWithBackingTetxure:logicalWidth:height:", &v18, v10.n128_f64[0], v12);
  v14 = v19;
  if (v19)
  {
    v15 = (unint64_t *)&v19->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }

  return v13;
}

- (SKTexture)initWithBackingTetxure:(shared_ptr<jet_texture>)a3 logicalWidth:(float)a4 height:(float)a5
{
  jet_texture *ptr;
  SKTexture *v8;
  SKTexture *v9;
  SKTexture *v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int32x2_t v14;
  _BOOL8 v15;
  NSString *imgName;
  SKTextureCache *textureCache;
  std::__shared_weak_count *v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  uint64_t v25;
  std::__shared_weak_count *v26;

  ptr = a3.__ptr_;
  v8 = -[SKTexture init](self, "init", a3.__ptr_, a3.__cntrl_);
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    v11 = (***(uint64_t (****)(_QWORD))ptr)(*(_QWORD *)ptr);
    v12 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)ptr + 8))(*(_QWORD *)ptr);
    v13 = v12;
    v15 = 0;
    if (v11)
    {
      v14 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v11, v12), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v11, v12), (int32x2_t)-1)));
      if ((v14.i8[4] & 1) != 0 && v12 && (v14.i8[0] & 1) != 0)
        v15 = 1;
    }
    -[SKTextureCache setIsPOT:](v10->_textureCache, "setIsPOT:", v15);
    imgName = v10->_imgName;
    v10->_imgName = 0;

    -[SKTextureCache setPixelSize:](v10->_textureCache, "setPixelSize:", (double)v11, (double)v13);
    -[SKTextureCache setSize:](v10->_textureCache, "setSize:", a4, a5);
    -[SKTextureCache setState:](v10->_textureCache, "setState:", 1);
    textureCache = v10->_textureCache;
    v18 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
    v25 = *(_QWORD *)ptr;
    v26 = v18;
    if (v18)
    {
      p_shared_owners = (unint64_t *)&v18->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    -[SKTextureCache setBackingTexture:](textureCache, "setBackingTexture:", &v25);
    v21 = v26;
    if (v26)
    {
      v22 = (unint64_t *)&v26->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
  }

  return v9;
}

- (shared_ptr<jet_texture>)_backingTexture
{
  uint64_t *v2;
  uint64_t *v4;
  SKTextureCache *textureCache;
  SKTextureCache *v6;
  jet_texture *v7;
  __shared_weak_count *v8;
  std::__shared_weak_count *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  SKTextureCache *v14;
  uint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  SKTexture *originalTexture;
  uint64_t *v21;
  unint64_t v22;
  SKTexture *v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  uint64_t *v28;
  unint64_t v29;
  _QWORD v30[6];
  std::__shared_weak_count *v31;
  _QWORD v32[5];
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  std::__shared_weak_count *v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  shared_ptr<jet_texture> result;

  v4 = v2;
  textureCache = self->_textureCache;
  if (!textureCache || -[SKTextureCache state](textureCache, "state") != 1)
    -[SKTexture loadImageData](self, "loadImageData");
  v6 = self->_textureCache;
  if (v6)
  {
    v7 = (jet_texture *)-[SKTextureCache backingTexture](v6, "backingTexture");
    if (v37)
    {
      v9 = v38;
      *v4 = v37;
      v4[1] = (uint64_t)v9;
      v4 = &v37;
LABEL_18:
      *v4 = 0;
      v4[1] = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v37 = 0;
    v38 = 0;
  }
  -[SKTextureCache pixelSize](self->_textureCache, "pixelSize");
  v11 = v10;
  -[SKTextureCache pixelSize](self->_textureCache, "pixelSize");
  v13 = v12;
  v14 = self->_textureCache;
  if (v14)
  {
    -[SKTextureCache backingTexture](v14, "backingTexture");
    if (!v36)
      goto LABEL_13;
    p_shared_owners = &v36->__shared_owners_;
    do
      v16 = __ldaxr((unint64_t *)p_shared_owners);
    while (__stlxr(v16 - 1, (unint64_t *)p_shared_owners));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
      if (v35)
        goto LABEL_16;
    }
    else
    {
LABEL_13:
      if (v35)
        goto LABEL_16;
    }
  }
  if (-[SKTextureCache pixelData](self->_textureCache, "pixelData"))
  {
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __38__SKTexture_Internal___backingTexture__block_invoke;
    v32[3] = &unk_1EA500048;
    v33 = vcvtpd_u64_f64(v11);
    v34 = vcvtpd_u64_f64(v13);
    v32[4] = self;
    SKCPerformResourceOperation(v32);
    free(-[SKTextureCache pixelData](self->_textureCache, "pixelData"));
    -[SKTextureCache setPixelData:](self->_textureCache, "setPixelData:", 0);
  }
  else
  {
    originalTexture = self->_originalTexture;
    if (originalTexture && self->_filter)
    {
      -[SKTexture _backingTexture](originalTexture, "_backingTexture");
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3321888768;
      v30[2] = __38__SKTexture_Internal___backingTexture__block_invoke_2;
      v30[3] = &unk_1EA500070;
      v30[5] = v35;
      v31 = v36;
      if (v36)
      {
        v21 = &v36->__shared_owners_;
        do
          v22 = __ldxr((unint64_t *)v21);
        while (__stxr(v22 + 1, (unint64_t *)v21));
      }
      v30[4] = self;
      SKCPerformResourceOperation(v30);
      v23 = self->_originalTexture;
      self->_originalTexture = 0;

      v24 = v31;
      if (v31)
      {
        v25 = (unint64_t *)&v31->__shared_owners_;
        do
          v26 = __ldaxr(v25);
        while (__stlxr(v26 - 1, v25));
        if (!v26)
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
      }
      v27 = v36;
      if (v36)
      {
        v28 = &v36->__shared_owners_;
        do
          v29 = __ldaxr((unint64_t *)v28);
        while (__stlxr(v29 - 1, (unint64_t *)v28));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
    }
  }
LABEL_16:
  v7 = (jet_texture *)self->_textureCache;
  if (!v7)
    goto LABEL_18;
  v7 = (jet_texture *)-[jet_texture backingTexture](v7, "backingTexture");
LABEL_19:
  v17 = v38;
  if (v38)
  {
    v18 = (unint64_t *)&v38->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  result.__cntrl_ = v8;
  result.__ptr_ = v7;
  return result;
}

void __38__SKTexture_Internal___backingTexture__block_invoke(uint64_t a1)
{
  uint64_t texture_2d;
  void *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;

  kdebug_trace();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "textureFormat");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "pixelData");
  texture_2d = jet_context::create_texture_2d();
  std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v14, texture_2d);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  v12 = v14;
  v13 = v15;
  if (v15)
  {
    p_shared_owners = (unint64_t *)&v15->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  objc_msgSend(v3, "setBackingTexture:", &v12);
  v6 = v13;
  if (v13)
  {
    v7 = (unint64_t *)&v13->__shared_owners_;
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  v9 = v15;
  if (v15)
  {
    v10 = (unint64_t *)&v15->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void __38__SKTexture_Internal___backingTexture__block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  std::__shared_weak_count *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)*a2 + 48))(*a2, *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setValue:forKey:", v4, CFSTR("inputImage"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "valueForKey:", CFSTR("outputImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(_QWORD, void *))(*(_QWORD *)*a2 + 40))(*a2, v5);
  std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v18, v6);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 184);
  v16 = v18;
  v17 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  objc_msgSend(v7, "setBackingTexture:", &v16);
  v10 = v17;
  if (v17)
  {
    v11 = (unint64_t *)&v17->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setValue:forKey:", 0, CFSTR("inputImage"), v16);
  v13 = v19;
  if (v19)
  {
    v14 = (unint64_t *)&v19->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

}

- (void)setIsData:(BOOL)a3
{
  self->_isData = a3;
}

- (void)_setImageName:(id)a3
{
  objc_storeStrong((id *)&self->_imgName, a3);
  self->_isData = 0;
}

- (CGSize)pixelSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  -[SKTexture _ensureImageData](self, "_ensureImageData");
  -[SKTextureCache pixelSize](self->_textureCache, "pixelSize");
  v4 = v3;
  v6 = v5;
  -[SKTexture textureRect](self, "textureRect");
  v8 = v7;
  v10 = v9;
  v11 = -[SKTexture isRotated](self, "isRotated");
  v12 = v4 * v8;
  -[SKTexture cropScale](self, "cropScale");
  v14 = v13;
  v16 = v15;
  v17 = v6 * v10;
  -[SKTexture cropScale](self, "cropScale");
  v19 = v17 / v18;
  v21 = v17 / v20;
  if (v11)
    v21 = v12 / v16;
  else
    v19 = v12 / v14;
  v22 = fabs(v19);
  v23 = fabs(v21);
  result.height = v23;
  result.width = v22;
  return result;
}

- (BOOL)isRotated
{
  return self->_isRotated;
}

- (void)setIsRotated:(BOOL)a3
{
  self->_isRotated = a3;
}

- (BOOL)isFlipped
{
  return self->_isFlipped;
}

- (void)setIsFlipped:(BOOL)a3
{
  self->_isFlipped = a3;
}

- (unsigned)textureTarget
{
  return self->_textureTarget;
}

- (void)setTextureTarget:(unsigned int)a3
{
  self->_textureTarget = a3;
}

+ (void)_reloadTextureCacheForImageNamed:(id)a3
{
  id v3;

  objc_msgSend((id)_textureTable, "objectForKey:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "_reset");

}

+ (id)_cachedTextureNames
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend((id)_textureTable, "keyEnumerator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)_textureTable, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  while (1)
  {
    objc_msgSend(v2, "nextObject");
    v5 = objc_claimAutoreleasedReturnValue();

    if (!v5)
      break;
    v4 = (void *)v5;
    objc_msgSend(v3, "addObject:", v5);
  }

  return v3;
}

- (id)_copyImageData
{
  CGImage *v2;
  UIImage *v3;
  void *v4;

  if (self->_originalTexture)
    self = self->_originalTexture;
  v2 = -[SKTexture _createCGImage](self, "_createCGImage");
  objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:", v2);
  v3 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIImagePNGRepresentation(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v2);

  return v4;
}

+ (id)compressedTextureWithData:(id)a3
{
  id v4;
  _DWORD *v5;
  id *v6;
  size_t v7;
  unsigned int v8;

  v4 = objc_retainAutorelease(a3);
  v5 = (_DWORD *)objc_msgSend(v4, "bytes");
  if (v5[11] == 559044176)
  {
    v6 = (id *)objc_alloc_init((Class)a1);
    v7 = v5[5];
    objc_msgSend(v6[23], "setPixelData:", malloc_type_malloc(v7, 0xF634550uLL));
    memcpy((void *)objc_msgSend(v6[23], "pixelData"), (const void *)(objc_msgSend(objc_retainAutorelease(v4), "bytes") + 52), v7);
    v8 = v5[1];
    LODWORD(v7) = v5[2];
    objc_msgSend(v6[23], "setHasAlpha:", v5[10] != 0);
    objc_msgSend(v6[23], "setPixelSize:", (double)v7, (double)v8);
    objc_msgSend(v6[23], "setSize:", (double)v7, (double)v8);
    *((_BYTE *)v6 + 12) = 1;
    objc_msgSend(v6[23], "setState:", 1);
    free((void *)objc_msgSend(v6[23], "pixelData"));

  }
  return 0;
}

+ (id)compressedTextureWithData:(id)a3 size:(CGSize)a4 bitsPerPixel:(unsigned int)a5 hasAlpha:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  id *v12;
  double v13;
  double v14;
  double v15;
  size_t v16;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  if (v11 && width > 0.0 && height > 0.0 && (a5 == 4 || a5 == 2))
  {
    v12 = (id *)objc_alloc_init((Class)a1);
    v13 = ceil(width);
    v14 = ceil(height);
    v15 = 3.0;
    if (v6)
      v15 = 4.0;
    v16 = (unint64_t)(v15 * (v13 * v14 * (double)a5)) >> 3;
    objc_msgSend(v12[23], "setPixelData:", malloc_type_malloc(v16, 0x2C8D4E4BuLL));
    memcpy((void *)objc_msgSend(v12[23], "pixelData"), (const void *)objc_msgSend(objc_retainAutorelease(v11), "bytes"), v16);
    objc_msgSend(v12[23], "setHasAlpha:", v6);
    objc_msgSend(v12[23], "setPixelSize:", v13, v14);
    objc_msgSend(v12[23], "setSize:", v13, v14);
    *((_BYTE *)v12 + 12) = 1;
    objc_msgSend(v12[23], "setState:", 1);
    free((void *)objc_msgSend(v12[23], "pixelData"));

  }
  return 0;
}

- (id)_generateNormalMap:(double)a3 contrast:(double)a4 multiPass:(unint64_t)a5
{
  CGImage *v9;
  CGImage *v10;
  size_t Width;
  size_t Height;
  unsigned int v13;
  double v14;
  void *v15;
  CGColorSpace *DeviceRGB;
  CGContext *v17;
  void *v18;
  CGRect v20;
  CGRect v21;

  v9 = -[SKTexture _createCGImage](self, "_createCGImage");
  v10 = v9;
  if (v9)
  {
    Width = CGImageGetWidth(v9);
    Height = CGImageGetHeight(v10);
    v13 = Height;
    v14 = (double)Height;
    v15 = malloc_type_malloc((4 * Width * Height), 0x15DC9E00uLL);
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v17 = CGBitmapContextCreate(v15, Width, v13, 8uLL, (4 * Width), DeviceRGB, 0x4001u);
    CGColorSpaceRelease(DeviceRGB);
    v20.origin.x = 0.0;
    v20.origin.y = 0.0;
    v20.size.width = (double)Width;
    v20.size.height = v14;
    CGContextClearRect(v17, v20);
    CGContextTranslateCTM(v17, 0.0, v14);
    CGContextScaleCTM(v17, 1.0, -1.0);
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = (double)Width;
    v21.size.height = v14;
    CGContextDrawImage(v17, v21, v10);
    CGContextRelease(v17);
    CGImageRelease(v10);
    if (SKGenerateNormalMapWithMultiSampling(Width, v13, (unsigned int *)v15, a5, a3, a4))
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:", v15, 4 * (unint64_t)(double)Width * (unint64_t)v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[SKTexture textureWithData:size:](SKTexture, "textureWithData:size:", v18, (double)Width, v14);
      v10 = (CGImage *)objc_claimAutoreleasedReturnValue();
      *((_BYTE *)v10 + 97) = self->_isRotated;

    }
    else
    {
      free(v15);
      v10 = 0;
    }
  }
  return v10;
}

- (NSString)imageNameOrPath
{
  return self->_imgName;
}

+ (SKTexture)textureWithImagePath:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithImagePath:", v4);

  return (SKTexture *)v5;
}

+ (id)_textureByTransferingData:(char *)a3 size:(CGSize)a4
{
  id *v4;
  double width;
  double height;
  double v8;
  double v9;

  v4 = 0;
  if (a3)
  {
    width = a4.width;
    if (a4.width > 0.0)
    {
      height = a4.height;
      if (a4.height > 0.0)
      {
        v4 = (id *)objc_alloc_init((Class)a1);
        objc_msgSend(v4[23], "setPixelData:", a3);
        objc_msgSend(v4[23], "setHasAlpha:", 1);
        v8 = ceil(width);
        v9 = ceil(height);
        objc_msgSend(v4[23], "setPixelSize:", v8, v9);
        objc_msgSend(v4[23], "setSize:", v8, v9);
        *((_BYTE *)v4 + 12) = 1;
        objc_msgSend(v4[23], "setState:", 1);
      }
    }
  }
  return v4;
}

+ (id)_textureByTransferingData:(char *)a3 size:(CGSize)a4 rowLength:(unsigned int)a5 alignment:(unsigned int)a6
{
  id *v6;
  double width;
  double height;
  double v12;
  double v13;
  unsigned int v14;
  BOOL v15;
  int32x2_t v16;
  _BOOL8 v17;

  v6 = 0;
  if (a3)
  {
    width = a4.width;
    if (a4.width > 0.0)
    {
      height = a4.height;
      if (a4.height > 0.0)
      {
        v6 = (id *)objc_alloc_init((Class)a1);
        objc_msgSend(v6[23], "setPixelData:", a3);
        v12 = ceil(width);
        v13 = ceil(height);
        v14 = v13;
        if (v12)
          v15 = v14 == 0;
        else
          v15 = 1;
        v17 = 0;
        if (!v15)
        {
          v16 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v12, v14), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v12, v14), (int32x2_t)-1)));
          if ((v16.i8[4] & 1) != 0 && (v16.i8[0] & 1) != 0)
            v17 = 1;
        }
        objc_msgSend(v6[23], "setIsPOT:", v17);
        objc_msgSend(v6[23], "setHasAlpha:", 1);
        objc_msgSend(v6[23], "setPixelSize:", v12, v13);
        objc_msgSend(v6[23], "setSize:", v12, v13);
        *((_BYTE *)v6 + 12) = 1;
        objc_msgSend(v6[23], "setState:", 1);
        *((_DWORD *)v6 + 34) = a6;
        *((_DWORD *)v6 + 35) = a5;
      }
    }
  }
  return v6;
}

+ (id)_textureWithGLTextureId:(unsigned int)a3 size:(CGSize)a4
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithGLTextureId:size:", *(_QWORD *)&a3, a4.width, a4.height);
}

- (id)_initWithGLTextureId:(unsigned int)a3 size:(CGSize)a4
{
  double height;
  double width;
  SKTexture *v6;
  SKTexture *v7;
  SKTexture *v8;
  SKTexture *v9;
  unsigned int v10;
  unsigned int v11;
  BOOL v12;
  int32x2_t v13;
  _BOOL8 v14;
  NSString *imgName;

  height = a4.height;
  width = a4.width;
  v6 = -[SKTexture init](self, "init", *(_QWORD *)&a3);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    v9 = v8;
    v10 = vcvtpd_u64_f64(width);
    v11 = vcvtpd_u64_f64(height);
    if (v10)
      v12 = v11 == 0;
    else
      v12 = 1;
    v14 = 0;
    if (!v12)
    {
      v13 = vceqz_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(v10, v11), (int8x8_t)vadd_s32((int32x2_t)__PAIR64__(v10, v11), (int32x2_t)-1)));
      if ((v13.i8[4] & 1) != 0 && (v13.i8[0] & 1) != 0)
        v14 = 1;
    }
    -[SKTextureCache setIsPOT:](v8->_textureCache, "setIsPOT:", v14);
    imgName = v9->_imgName;
    v9->_imgName = 0;

    v9->_isData = 1;
    -[SKTextureCache setPixelData:](v9->_textureCache, "setPixelData:", 0);
    -[SKTextureCache setPixelSize:](v9->_textureCache, "setPixelSize:", width, height);
    -[SKTextureCache setSize:](v9->_textureCache, "setSize:", width, height);
    -[SKTextureCache setState:](v9->_textureCache, "setState:", 1);
  }

  return v7;
}

- (int)glTextureId
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  int v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v12[6];
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[SKTexture _backingTexture](self, "_backingTexture");
  if (v14)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3321888768;
    v12[2] = __33__SKTexture_Private__glTextureId__block_invoke;
    v12[3] = &unk_1EA5000A8;
    v12[4] = &v16;
    v12[5] = v14;
    v13 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v3 = __ldxr(p_shared_owners);
      while (__stxr(v3 + 1, p_shared_owners));
    }
    SKCPerformResourceOperation(v12);
    v4 = v13;
    if (v13)
    {
      v5 = (unint64_t *)&v13->__shared_owners_;
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  v7 = *((_DWORD *)v17 + 6);
  v8 = v15;
  if (v15)
  {
    v9 = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  _Block_object_dispose(&v16, 8);
  return v7;
}

void __33__SKTexture_Private__glTextureId__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;

  if (!(*(unsigned int (**)(_QWORD))(*(_QWORD *)*a2 + 136))(*a2))
  {
    v4 = __dynamic_cast((const void *)*a2, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C8], 0);
    v5 = (std::__shared_weak_count *)a2[1];
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (*(uint64_t (**)(void *, _QWORD))(*(_QWORD *)v4 + 392))(v4, *(_QWORD *)(a1 + 40));
    if (v5)
    {
      v8 = (unint64_t *)&v5->__shared_owners_;
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

+ (SKTexture)textureWithIOSurfaceID:(unsigned int)a3 width:(unsigned int)a4 height:(unsigned int)a5 format:(unsigned int)a6
{
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  void *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  _QWORD v20[5];
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  __n128 (*v28)(__n128 *, __n128 *);
  uint64_t (*v29)(uint64_t);
  const char *v30;
  uint64_t v31;
  std::__shared_weak_count *v32;

  v25 = 0;
  v26 = &v25;
  v27 = 0x4012000000;
  v28 = __Block_byref_object_copy__4;
  v29 = __Block_byref_object_dispose__4;
  v31 = 0;
  v32 = 0;
  v30 = "";
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__SKTexture_Private__textureWithIOSurfaceID_width_height_format___block_invoke;
  v20[3] = &unk_1EA5000E0;
  v20[4] = &v25;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  SKCPerformResourceOperation(v20);
  if (v26[6])
  {
    v6 = objc_alloc((Class)objc_opt_class());
    v7 = (std::__shared_weak_count *)v26[7];
    v18 = v26[6];
    v19 = v7;
    if (v7)
    {
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    v10 = (void *)objc_msgSend(v6, "initWithBackingTetxure:", &v18);
    v11 = v19;
    if (v19)
    {
      v12 = (unint64_t *)&v19->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
  }
  else
  {
    v10 = 0;
  }
  _Block_object_dispose(&v25, 8);
  v14 = v32;
  if (v32)
  {
    v15 = (unint64_t *)&v32->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  return (SKTexture *)v10;
}

void __65__SKTexture_Private__textureWithIOSurfaceID_width_height_format___block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  __int128 v7;

  v3 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)*a2 + 32))(*a2, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), 0);
  std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v7, v3);
  std::shared_ptr<jet_buffer_pool>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48, &v7);
  v4 = (std::__shared_weak_count *)*((_QWORD *)&v7 + 1);
  if (*((_QWORD *)&v7 + 1))
  {
    v5 = (unint64_t *)(*((_QWORD *)&v7 + 1) + 8);
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
      std::__shared_weak_count::__release_weak(v4);
    }
  }
}

+ (SKTexture)textureWithMetalTexture:(id)a3
{
  id v3;
  id v4;
  id v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  __n128 (*v25)(__n128 *, __n128 *);
  uint64_t (*v26)(uint64_t);
  const char *v27;
  uint64_t v28;
  std::__shared_weak_count *v29;

  v3 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x4012000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  v29 = 0;
  v27 = "";
  v28 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __46__SKTexture_Private__textureWithMetalTexture___block_invoke;
  v19[3] = &unk_1EA500108;
  v21 = &v22;
  v4 = v3;
  v20 = v4;
  SKCPerformResourceOperation(v19);
  if (v23[6])
  {
    v5 = objc_alloc((Class)objc_opt_class());
    v6 = (std::__shared_weak_count *)v23[7];
    v17 = v23[6];
    v18 = v6;
    if (v6)
    {
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      do
        v8 = __ldxr(p_shared_owners);
      while (__stxr(v8 + 1, p_shared_owners));
    }
    v9 = (void *)objc_msgSend(v5, "initWithBackingTetxure:", &v17);
    v10 = v18;
    if (v18)
    {
      v11 = (unint64_t *)&v18->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  else
  {
    v9 = 0;
  }

  _Block_object_dispose(&v22, 8);
  v13 = v29;
  if (v29)
  {
    v14 = (unint64_t *)&v29->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }

  return (SKTexture *)v9;
}

void __46__SKTexture_Private__textureWithMetalTexture___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  __int128 v15;
  void *v16;
  std::__shared_weak_count *v17;

  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)*a2 + 136))(*a2) == 1)
  {
    v4 = __dynamic_cast((const void *)*a2, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C0], 0);
    v5 = (std::__shared_weak_count *)a2[1];
    v16 = v4;
    v17 = v5;
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    v8 = (*(uint64_t (**)(void *, _QWORD))(*(_QWORD *)v4 + 408))(v4, *(_QWORD *)(a1 + 32));
    std::shared_ptr<jet_texture>::shared_ptr[abi:ne180100]<jet_texture,void>(&v15, v8);
    std::shared_ptr<jet_buffer_pool>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48, &v15);
    v9 = (std::__shared_weak_count *)*((_QWORD *)&v15 + 1);
    if (*((_QWORD *)&v15 + 1))
    {
      v10 = (unint64_t *)(*((_QWORD *)&v15 + 1) + 8);
      do
        v11 = __ldaxr(v10);
      while (__stlxr(v11 - 1, v10));
      if (!v11)
      {
        ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
        std::__shared_weak_count::__release_weak(v9);
      }
    }
    v12 = v17;
    if (v17)
    {
      v13 = (unint64_t *)&v17->__shared_owners_;
      do
        v14 = __ldaxr(v13);
      while (__stlxr(v14 - 1, v13));
      if (!v14)
      {
        ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
        std::__shared_weak_count::__release_weak(v12);
      }
    }
  }
}

- (id)metalTexture
{
  unint64_t *p_shared_owners;
  unint64_t v3;
  std::__shared_weak_count *v4;
  unint64_t *v5;
  unint64_t v6;
  id v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  _QWORD v12[6];
  std::__shared_weak_count *v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__332;
  v20 = __Block_byref_object_dispose__333;
  v21 = 0;
  -[SKTexture _backingTexture](self, "_backingTexture");
  if (v14)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3321888768;
    v12[2] = __34__SKTexture_Private__metalTexture__block_invoke;
    v12[3] = &unk_1EA5000A8;
    v12[4] = &v16;
    v12[5] = v14;
    v13 = v15;
    if (v15)
    {
      p_shared_owners = (unint64_t *)&v15->__shared_owners_;
      do
        v3 = __ldxr(p_shared_owners);
      while (__stxr(v3 + 1, p_shared_owners));
    }
    SKCPerformResourceOperation(v12);
    v4 = v13;
    if (v13)
    {
      v5 = (unint64_t *)&v13->__shared_owners_;
      do
        v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
  }
  v7 = (id)v17[5];
  v8 = v15;
  if (v15)
  {
    v9 = (unint64_t *)&v15->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
  _Block_object_dispose(&v16, 8);

  return v7;
}

void __34__SKTexture_Private__metalTexture__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t *v11;
  unint64_t v12;

  if ((*(unsigned int (**)(_QWORD))(*(_QWORD *)*a2 + 136))(*a2) == 1)
  {
    v4 = __dynamic_cast((const void *)*a2, MEMORY[0x1E0D3F0B8], MEMORY[0x1E0D3F0C0], 0);
    v5 = (std::__shared_weak_count *)a2[1];
    if (v5)
    {
      p_shared_owners = (unint64_t *)&v5->__shared_owners_;
      do
        v7 = __ldxr(p_shared_owners);
      while (__stxr(v7 + 1, p_shared_owners));
    }
    (*(void (**)(void *, _QWORD))(*(_QWORD *)v4 + 432))(v4, *(_QWORD *)(a1 + 40));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (v5)
    {
      v11 = (unint64_t *)&v5->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
        std::__shared_weak_count::__release_weak(v5);
      }
    }
  }
}

- (int)_convert_jet_texture_format_to_ci_format:(unsigned int)a3
{
  int *v3;

  if (a3 - 1 > 0xD)
    v3 = (int *)MEMORY[0x1E0C9E070];
  else
    v3 = (int *)qword_1EA500148[a3 - 1];
  return *v3;
}

- (CGImage)_newTextureFromGLCache
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;
  CGImage *Image;
  unsigned int v8;
  int v9;
  _BYTE *v10;
  double y;
  double x;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  uint64_t i;
  unint64_t j;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t n;
  unint64_t ii;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  int v44;
  int v45;
  uint64_t k;
  unint64_t m;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  int v53;
  int v54;
  uint64_t jj;
  unint64_t kk;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  unsigned int v60;
  uint64_t v61;
  CGColorSpace *DeviceRGB;
  void *v63;
  uint64_t v64;
  unsigned int v65;
  int v66;
  unsigned int v67;
  int v68;
  void *v69;
  void *v70;
  uint64_t v71;
  unsigned int v72;
  int v73;
  unsigned int v74;
  int v75;
  void *v76;
  void *v77;
  size_t Width;
  size_t Height;
  size_t BitsPerComponent;
  size_t BitsPerPixel;
  size_t BytesPerRow;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  BOOL v88;
  float v90;
  float v91;
  float v92;
  float v93;
  void *v94;
  CGColorSpace *v95;
  CGContext *v96;
  std::__shared_weak_count *v97;
  unint64_t *p_shared_owners;
  unint64_t v99;
  int v101;
  unsigned int v102;
  unsigned int v103;
  SKTexture *v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  uint64_t v116;
  unsigned int v117;
  unsigned int v118;
  unsigned int v119;
  unsigned int v120;
  unsigned int v121;
  int v122;
  int v123;
  _BYTE *v124;
  _BYTE *v125;
  int v126;
  unsigned int v127;
  _QWORD v128[6];
  uint64_t v129;
  std::__shared_weak_count *v130;
  CGRect v131;
  CGRect v132;

  -[SKTexture _ensureImageData](self, "_ensureImageData");
  -[SKTexture _backingTexture](self, "_backingTexture");
  v3 = (**(uint64_t (***)(uint64_t))v129)(v129);
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 8))(v129);
  if (v4 * v3)
  {
    v5 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
    if (v5 > 6)
      v6 = 1;
    else
      v6 = dword_1DC922BD0[v5];
    v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 1;
    if (v8 > 0xC)
      v9 = 4;
    else
      v9 = dword_1DC922BEC[v8];
    v10 = malloc_type_malloc(v6 * v4 * v3 * v9, 0xFD65CEF7uLL);
    v128[0] = MEMORY[0x1E0C809B0];
    v128[1] = 3221225472;
    v128[2] = __44__SKTexture_Private___newTextureFromGLCache__block_invoke;
    v128[3] = &__block_descriptor_48_e69_v24__0_shared_ptr_jet_context____jet_context_____shared_weak_count__8l;
    v128[4] = &v129;
    v128[5] = v10;
    SKCPerformResourceOperation(v128);
    x = self->_textRect.origin.x;
    y = self->_textRect.origin.y;
    v13 = (y * (double)v4 + 0.5);
    v116 = (x * (double)v3 + 0.5);
    v127 = ((x + self->_textRect.size.width) * (double)v3 + 0.5);
    v117 = ((y + self->_textRect.size.height) * (double)v4 + 0.5);
    if (self->_isRotated)
      v14 = v117 - v13;
    else
      v14 = v127 - v116;
    if (self->_isRotated)
      v15 = v127 - v116;
    else
      v15 = v117 - v13;
    v16 = v129;
    v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
    if (v17 > 6)
      v18 = 1;
    else
      v18 = dword_1DC922BD0[v17];
    v19 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v16 + 32))(v16) - 1;
    if (v19 > 0xC)
      v20 = 4;
    else
      v20 = dword_1DC922BEC[v19];
    v125 = malloc_type_malloc(v18 * v14 * v15 * v20, 0x3DE5AECFuLL);
    v21 = v129;
    v22 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
    if (v22 > 6)
      v23 = 1;
    else
      v23 = dword_1DC922BD0[v22];
    v24 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v21 + 32))(v21) - 1;
    if (v24 > 0xC)
      v25 = 4;
    else
      v25 = dword_1DC922BEC[v24];
    v126 = v25 * v23;
    v104 = self;
    v124 = v10;
    v102 = v15;
    v103 = v14;
    v101 = v14 * v15;
    if (self->_isFlipped)
    {
      if (self->_isRotated)
      {
        if (v117 > v13)
        {
          v26 = v126 * (v116 + v13 * v3);
          v105 = v126 * v3;
          v27 = v126 * v103 * (v15 - 1);
          do
          {
            v118 = v13;
            v108 = v27;
            v112 = v26;
            for (i = v116; i < v127; v27 -= v126 * v103)
            {
              for (j = 0; ; ++j)
              {
                v30 = v129;
                v31 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
                v32 = v31 > 6 ? 1 : qword_1DC922B30[v31];
                v33 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v30 + 32))(v30) - 1;
                v34 = v33 > 0xC ? 4 : qword_1DC922B68[v33];
                if (j >= v34 * v32)
                  break;
                v125[v27 + j] = v124[v26 + j];
              }
              ++i;
              v26 += v126;
            }
            v13 = v118 + 1;
            v26 = v112 + v105;
            v27 = v108 + v126;
          }
          while (v118 + 1 != v117);
        }
      }
      else if (v117 > v13)
      {
        v44 = 0;
        v45 = v126 * (v116 + v13 * v3);
        v107 = v126 * v14;
        v110 = v126 * v3;
        do
        {
          v120 = v13;
          v122 = v44;
          v114 = v45;
          for (k = v116; k < v127; v44 += v126)
          {
            for (m = 0; ; ++m)
            {
              v48 = v129;
              v49 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
              v50 = v49 > 6 ? 1 : qword_1DC922B30[v49];
              v51 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v48 + 32))(v48) - 1;
              v52 = v51 > 0xC ? 4 : qword_1DC922B68[v51];
              if (m >= v52 * v50)
                break;
              v125[v44 + m] = v124[v45 + m];
            }
            ++k;
            v45 += v126;
          }
          v13 = v120 + 1;
          v45 = v114 + v110;
          v44 = v122 + v107;
        }
        while (v120 + 1 != v117);
      }
    }
    else if (self->_isRotated)
    {
      if (v117 > v13)
      {
        v35 = v126 * (v116 + v13 * v3);
        v106 = v126 * v3;
        v36 = v126 * (v103 * v15 - 1);
        do
        {
          v119 = v13;
          v109 = v36;
          v113 = v35;
          for (n = v116; n < v127; v36 -= v126 * v103)
          {
            for (ii = 0; ; ++ii)
            {
              v39 = v129;
              v40 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
              v41 = v40 > 6 ? 1 : qword_1DC922B30[v40];
              v42 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v39 + 32))(v39) - 1;
              v43 = v42 > 0xC ? 4 : qword_1DC922B68[v42];
              if (ii >= v43 * v41)
                break;
              v125[v36 + ii] = v124[v35 + ii];
            }
            ++n;
            v35 += v126;
          }
          v13 = v119 + 1;
          v35 = v113 + v106;
          v36 = v109 - v126;
        }
        while (v119 + 1 != v117);
      }
    }
    else if (v117 > v13)
    {
      v53 = v126 * (v116 + v13 * v3);
      v111 = v126 * v3;
      v54 = v126 * v103 * (~v13 + v117);
      do
      {
        v121 = v13;
        v123 = v53;
        v115 = v54;
        for (jj = v116; jj < v127; v54 += v126)
        {
          for (kk = 0; ; ++kk)
          {
            v57 = v129;
            v58 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
            v59 = v58 > 6 ? 1 : qword_1DC922B30[v58];
            v60 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v57 + 32))(v57) - 1;
            v61 = v60 > 0xC ? 4 : qword_1DC922B68[v60];
            if (kk >= v61 * v59)
              break;
            v125[v54 + kk] = v124[v53 + kk];
          }
          ++jj;
          v53 += v126;
        }
        v13 = v121 + 1;
        v53 = v123 + v111;
        v54 = v115 - v126 * v103;
      }
      while (v121 + 1 != v117);
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    v63 = (void *)MEMORY[0x1E0C99D50];
    v64 = v129;
    v65 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
    if (v65 > 6)
      v66 = 1;
    else
      v66 = dword_1DC922BD0[v65];
    v67 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v64 + 32))(v64) - 1;
    if (v67 > 0xC)
      v68 = 4;
    else
      v68 = dword_1DC922BEC[v67];
    objc_msgSend(v63, "dataWithBytes:length:", v125, (v66 * v101 * v68));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = (void *)MEMORY[0x1E0C9DDC8];
    v71 = v129;
    v72 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129) - 7;
    if (v72 > 6)
      v73 = 1;
    else
      v73 = dword_1DC922BD0[v72];
    v74 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v71 + 32))(v71) - 1;
    if (v74 > 0xC)
      v75 = 4;
    else
      v75 = dword_1DC922BEC[v74];
    objc_msgSend(v70, "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v69, v73 * v103 * v75, -[SKTexture _convert_jet_texture_format_to_ci_format:](v104, "_convert_jet_texture_format_to_ci_format:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v129 + 32))(v129)), DeviceRGB, (double)v103, (double)v102);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C9DD90], "context");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "extent");
    Image = (CGImage *)objc_msgSend(v77, "createCGImage:fromRect:", v76);
    CGColorSpaceRelease(DeviceRGB);
    free(v124);
    free(v125);
    if (Image)
    {
      Width = CGImageGetWidth(Image);
      Height = CGImageGetHeight(Image);
      BitsPerComponent = CGImageGetBitsPerComponent(Image);
      BitsPerPixel = CGImageGetBitsPerPixel(Image);
      BytesPerRow = CGImageGetBytesPerRow(Image);
      -[SKTexture pixelSize](v104, "pixelSize");
      v85 = (double)Width;
      v86 = (double)Height;
      v87 = (double)BitsPerPixel;
      v88 = v83 <= (double)Width && v84 <= v86;
      if (!v88 || BytesPerRow != (unint64_t)((double)Width * (double)BitsPerPixel * 0.125))
      {
        v90 = v83;
        v91 = roundf(v90);
        v92 = v84;
        v93 = roundf(v92);
        v94 = malloc_type_malloc((unint64_t)(v91 * v93 * v87 * 0.125), 0x9DC48F5CuLL);
        v95 = CGColorSpaceCreateDeviceRGB();
        v96 = CGBitmapContextCreate(v94, (unint64_t)v91, (unint64_t)v93, BitsPerComponent, (unint64_t)(v87 * v91 * 0.125), v95, 0x4001u);
        CGColorSpaceRelease(v95);
        v131.origin.x = 0.0;
        v131.origin.y = 0.0;
        v131.size.width = v91;
        v131.size.height = v93;
        CGContextClearRect(v96, v131);
        v132.origin.x = v104->_cropOffset.x * v85 + (v91 - v85) * 0.5;
        v132.origin.y = v104->_cropOffset.y * v86 + (v93 - v86) * 0.5;
        v132.size.width = v85;
        v132.size.height = v86;
        CGContextDrawImage(v96, v132, Image);
        CGImageRelease(Image);
        Image = CGBitmapContextCreateImage(v96);
        CGContextRelease(v96);
        free(v94);
      }
    }

  }
  else
  {
    Image = 0;
  }
  v97 = v130;
  if (v130)
  {
    p_shared_owners = (unint64_t *)&v130->__shared_owners_;
    do
      v99 = __ldaxr(p_shared_owners);
    while (__stlxr(v99 - 1, p_shared_owners));
    if (!v99)
    {
      ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
      std::__shared_weak_count::__release_weak(v97);
    }
  }
  return Image;
}

uint64_t __44__SKTexture_Private___newTextureFromGLCache__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(***(_QWORD ***)(a1 + 32) + 72))(**(_QWORD **)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);
}

- (void)_savePngFromGLCache:(id)a3
{
  CGImage *v4;
  UIImage *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[SKTexture _createCGImage](self, "_createCGImage");
  v5 = (UIImage *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA638]), "initWithCGImage:", v4);
  UIImagePNGRepresentation(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "writeToFile:atomically:", v7, 1);
  CGImageRelease(v4);

}

- (void)loadImageDataFromCGImage:pointsSize:.cold.1()
{
  _os_crash();
  __break(1u);
  AnalyticsSendEventLazy();
}

@end
