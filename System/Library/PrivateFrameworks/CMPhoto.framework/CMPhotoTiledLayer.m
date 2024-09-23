@implementation CMPhotoTiledLayer

- (double)_zoomStartScaleForImage:(CGSize)a3 placeholderImageSize:(CGSize)a4
{
  double width;
  double v5;
  double result;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  width = a3.width;
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result = 0.0;
  if ((width != *MEMORY[0x1E0C9D820] || a3.height != v5) && (a4.width != *MEMORY[0x1E0C9D820] || a4.height != v5))
  {
    v9 = a4.width / width;
    v10 = a4.height / a3.height;
    if (a4.width / width <= v10)
      v9 = v10;
    v11 = 1.0;
    do
    {
      v12 = v11;
      v11 = v11 * 0.5;
    }
    while (v11 > v9);
    v13 = 0.0;
    if (v12 >= 0.0)
      v13 = v12;
    return fmin(v13, 1.0);
  }
  return result;
}

- (void)_setupConverterForSourceColorSpace:(CGColorSpace *)a3 destinationColorSpace:(CGColorSpace *)a4
{
  void *v7;
  MTLDevice *v8;
  CGColorConversionInfoRef v9;
  CGColorConversionInfoRef v10;
  OS_dispatch_queue *v11;
  const CGColorConversionInfo *v12;
  MTLDevice *metalDevice;
  NSObject *metalQueue;
  CFDataRef v15;
  CFDataRef v16;
  const __CFData *v17;
  const __CFData *v18;
  ColorSyncProfileRef v19;
  ColorSyncProfileRef v20;
  const ColorSyncProfile *v21;
  const ColorSyncProfile *v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  ColorSyncTransformRef v32;
  ColorSyncTransform *v33;
  void *v34;
  id v35;
  vImage_CGImageFormat destFormat;
  vImage_CGImageFormat srcFormat;
  _QWORD v38[2];
  _QWORD v39[3];
  _QWORD v40[3];
  _QWORD v41[3];
  _QWORD v42[3];
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1A85D1038](self, a2);
  v8 = (MTLDevice *)MTLCreateSystemDefaultDevice();
  self->_metalDevice = v8;
  if (!v8)
  {
LABEL_12:
    *(_QWORD *)&srcFormat.bitsPerComponent = 0x2000000008;
    srcFormat.colorSpace = a3;
    srcFormat.bitmapInfo = 8198;
    memset(&srcFormat.version, 0, 20);
    *(_QWORD *)&destFormat.bitsPerComponent = 0x2000000008;
    destFormat.colorSpace = a4;
    destFormat.bitmapInfo = 8198;
    memset(&destFormat.version, 0, 20);
    v15 = CGColorSpaceCopyICCData(a3);
    v16 = CGColorSpaceCopyICCData(a4);
    v17 = v15;
    v18 = v16;
    if (v15)
    {
      if (v16)
      {
        v19 = ColorSyncProfileCreate(v15, 0);
        v20 = ColorSyncProfileCreate(v16, 0);
        v21 = v19;
        v22 = v20;
        if (v19)
        {
          if (v20)
          {
            v23 = (_QWORD *)MEMORY[0x1E0C955B8];
            v24 = (uint64_t *)MEMORY[0x1E0C955C0];
            v25 = *MEMORY[0x1E0C955C0];
            v41[0] = *MEMORY[0x1E0C955B8];
            v41[1] = v25;
            v26 = (uint64_t *)MEMORY[0x1E0C955C8];
            v27 = *MEMORY[0x1E0C955C8];
            v42[0] = v19;
            v42[1] = v27;
            v28 = (_QWORD *)MEMORY[0x1E0C95608];
            v41[2] = *MEMORY[0x1E0C95608];
            v42[2] = *MEMORY[0x1E0C955E8];
            v29 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 3);
            v30 = *v24;
            v39[0] = *v23;
            v39[1] = v30;
            v31 = *v26;
            v40[0] = v20;
            v40[1] = v31;
            v39[2] = *v28;
            v40[2] = *MEMORY[0x1E0C955F8];
            v38[0] = v29;
            v38[1] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
            v32 = ColorSyncTransformCreate((CFArrayRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2), 0);
            v33 = v32;
            if (v32)
            {
              v34 = (void *)MEMORY[0x1A85CFD00](v32, *MEMORY[0x1E0C955F0], 0);
              v35 = v34;
              if (v34)
                self->_vimageConverter = vImageConverter_CreateWithColorSyncCodeFragment(v34, &srcFormat, &destFormat, 0, 0, 0);
            }
          }
        }
      }
    }
    goto LABEL_19;
  }
  v43 = *MEMORY[0x1E0C9DA28];
  v44[0] = MEMORY[0x1E0C9AAB0];
  v9 = CGColorConversionInfoCreateFromList((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1), a3, kCGColorConversionTransformFromSpace, kCGRenderingIntentDefault, a4, 1, 0, 0);
  if (v9)
  {
    v10 = v9;
    self->_metalConverter = (MPSImageConversion *)objc_msgSend(objc_alloc(MEMORY[0x1E0CC6E20]), "initWithDevice:srcAlpha:destAlpha:backgroundColor:conversionInfo:", self->_metalDevice, 1, 1, 0, v9);
    self->_metalCmdQueue = (MTLCommandQueue *)-[MTLDevice newCommandQueue](self->_metalDevice, "newCommandQueue");
    v11 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.coremedia.tiledlayer.metalconversion", 0);
    self->_metalQueue = v11;
    if (v11)
      dispatch_queue_set_specific((dispatch_queue_t)v11, (const void *)kMetalQueueID, (void *)kMetalQueueID, 0);
    v12 = v10;
  }
  metalDevice = self->_metalDevice;
  if (!metalDevice || !self->_metalConverter || !self->_metalCmdQueue || !self->_metalQueue)
  {

    self->_metalDevice = 0;
    self->_metalCmdQueue = 0;

    self->_metalConverter = 0;
    metalQueue = self->_metalQueue;
    if (metalQueue)
    {
      dispatch_release(metalQueue);
      self->_metalQueue = 0;
    }
    goto LABEL_12;
  }
LABEL_19:
  objc_autoreleasePoolPop(v7);
}

- (void)_setHDROptions:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  CGColorSpace *colorSpaceFlexGTC;
  _QWORD v8[4];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((self->_decodeToHDROutputMode - 1) <= 4)
    {
      v8[0] = CFSTR("DecodeToHDROutputMode");
      v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
      if (self->_decodeToHDROutputModePreferMeteor)
        v6 = MEMORY[0x1E0C9AAB0];
      else
        v6 = MEMORY[0x1E0C9AAA0];
      v9[0] = v5;
      v9[1] = v6;
      v8[1] = CFSTR("DecodeToHDROutputModePreferMeteor");
      v8[2] = CFSTR("DecodeToHDROutputModeUseBaselayerOrientation");
      v8[3] = CFSTR("DecodeToHDRAddFlexGTC");
      v9[2] = MEMORY[0x1E0C9AAB0];
      v9[3] = MEMORY[0x1E0C9AAA0];
      objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 4), CFSTR("DecodeToHDROutput"));
    }
    colorSpaceFlexGTC = self->_colorSpaceFlexGTC;
    if (colorSpaceFlexGTC)
      objc_msgSend(a3, "setObject:forKeyedSubscript:", colorSpaceFlexGTC, CFSTR("UseProvidedColorSpace"));
  }
}

- (void)_prepareForDecodeSynchronous
{
  CFDictionaryRef DictionaryRepresentation;
  void *v4;
  CFTypeRef cf;
  CGRect v6;

  if (self->_shouldTile && self->_containerFormat == 1 && !self->_prepareFinished)
  {
    cf = 0;
    v6.size.width = self->_tileSize.width;
    v6.size.height = self->_tileSize.height;
    v6.origin.x = 0.0;
    v6.origin.y = 0.0;
    DictionaryRepresentation = CGRectCreateDictionaryRepresentation(v6);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("DryRun"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", DictionaryRepresentation, CFSTR("SourceCropRect"));
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
    -[CMPhotoTiledLayer _setHDROptions:](self, "_setHDROptions:", v4);
    self->_err = CMPhotoDecompressionContainerCreateImageForIndex(&self->_container->var0.var0, (const __CFNumber *)self->_imageIndex, (const __CFDictionary *)v4, 2, (uint64_t)&cf);

    if (cf)
      CFRelease(cf);
  }
  self->_prepareFinished = 1;
}

- (void)prepareForDecode
{
  NSObject *updateQueue;
  _QWORD v3[5];
  _QWORD block[5];

  updateQueue = self->_updateQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __37__CMPhotoTiledLayer_prepareForDecode__block_invoke;
  v3[3] = &unk_1E53F5A80;
  v3[4] = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CMPhotoDispatchAsync_block_invoke;
  block[3] = &unk_1E53F6180;
  block[4] = v3;
  dispatch_async(updateQueue, block);
}

uint64_t __37__CMPhotoTiledLayer_prepareForDecode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareForDecodeSynchronous");
}

- (CMPhotoTiledLayer)initWithContainer:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6
{
  double height;
  double width;
  double v9;
  double v10;
  CMPhotoTiledLayer *v12;
  CMPhotoTiledLayer *v13;
  NSObject *v14;
  const __CFAllocator *v15;
  const void **p_decodeSession;
  int Container;
  uint64_t *p_container;
  double *p_width;
  int AuxiliaryImageCountForIndexWithOptions;
  uint64_t v21;
  int v22;
  BOOL v23;
  int v24;
  CGColorSpace *v25;
  int v26;
  double v27;
  double *v28;
  const __CFDictionary *Value;
  const __CFDictionary *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  double v36;
  int v37;
  int v38;
  int v39;
  double v40;
  double v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  double v49;
  BOOL v50;
  char v51;
  char v52;
  int v53;
  int v54;
  int v55;
  BOOL v56;
  double v57;
  float v58;
  double v59;
  CGSize v60;
  int v62;
  uint64_t v63;
  int v64;
  uint64x2_t v65;
  objc_super v66;
  CGColorSpaceRef v67;
  CFDictionaryRef theDict;
  _QWORD v69[4];
  _QWORD v70[7];

  height = a6.height;
  width = a6.width;
  v9 = a5.height;
  v10 = a5.width;
  v70[4] = *MEMORY[0x1E0C80C00];
  v67 = 0;
  theDict = 0;
  v66.receiver = self;
  v66.super_class = (Class)CMPhotoTiledLayer;
  v12 = -[CMPhotoTiledLayer init](&v66, sel_init);
  v13 = v12;
  if (!v12)
  {
    v22 = 0;
    goto LABEL_90;
  }
  if (!CMPhotoDecompressionDetectContainerFormat((const __CFData *)a3, &v12->_containerFormat))
    goto LABEL_97;
  v13->_hasExtendedColorDisplay = MGGetBoolAnswer();
  v13->_imageIndex = a4;
  v13->_decodePixelFormat = 875704422;
  v13->_decodeToHDROutputMode = 0;
  v13->_decodeToHDROutputModePreferMeteor = 0;
  v14 = dispatch_queue_create("com.apple.coremedia.tiledlayer.update", 0);
  v13->_updateQueue = (OS_dispatch_queue *)v14;
  dispatch_queue_set_specific(v14, (const void *)kUpdateQueueID, (void *)kUpdateQueueID, 0);
  v13->_schedulingQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CMPhoto.tiledlayer.scheduling", 0);
  v15 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  p_decodeSession = (const void **)&v13->_decodeSession;
  Container = CMPhotoDecompressionSessionCreate((const __CFAllocator *)*MEMORY[0x1E0C9AE00], 0, &v13->_decodeSession);
  if (Container
    || (p_container = (uint64_t *)&v13->_container,
        (Container = CMPhotoDecompressionSessionCreateContainer(*p_decodeSession, 0, (const __CFData *)a3, 0, (uint64_t *)&v13->_container)) != 0))
  {
    v22 = Container;
    goto LABEL_90;
  }
  v65 = 0uLL;
  v64 = 0;
  if (CMPhotoDecompressionContainerGetImageGeometryForIndexWithOptions((_QWORD *)*p_container, (const __CFNumber *)v13->_imageIndex, 0, (uint64_t)&v65, (uint64_t)&v65.i64[1], (uint64_t)&v64))
  {
LABEL_97:
    v22 = -1;
    goto LABEL_90;
  }
  p_width = &v13->_imageSize.width;
  v13->_imageSize = (CGSize)vcvtq_f64_u64(v65);
  v13->_imageOrientation = v64;
  v63 = 0;
  AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerGetAuxiliaryImageCountForIndexWithOptions(*p_container, v13->_imageIndex, 0, (uint64_t)&v63);
  if (AuxiliaryImageCountForIndexWithOptions)
    goto LABEL_87;
  if (v63 >= 1)
  {
    v21 = 0;
    do
    {
      v62 = 0;
      AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerGetAuxiliaryImageTypeForIndexWithOptions((_QWORD *)*p_container, (const __CFNumber *)v13->_imageIndex, v21, 0, (uint64_t)&v62, 0);
      if (AuxiliaryImageCountForIndexWithOptions)
        goto LABEL_87;
      if (v62 == 3)
      {
        v13->_hasAlpha = 1;
        v13->_decodePixelFormat = 1111970369;
        break;
      }
    }
    while (++v21 < v63);
  }
  AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerCopyCGColorSpaceForIndexWithOptions((_QWORD *)*p_container, (const __CFNumber *)v13->_imageIndex, 0, (uint64_t)&v67);
  if (AuxiliaryImageCountForIndexWithOptions)
    v23 = AuxiliaryImageCountForIndexWithOptions == -16993;
  else
    v23 = 1;
  if (v23)
  {
    if (!v67 || v13->_hasAlpha)
    {
      v24 = 0;
LABEL_38:
      AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionContainerCopyImagePropertiesForIndexWithOptions((_QWORD *)*p_container, (const __CFNumber *)v13->_imageIndex, 0, 0, 0, (CFTypeRef *)&theDict);
      if (!AuxiliaryImageCountForIndexWithOptions)
      {
        v27 = width * height >= 1000000.0 ? 512.0 : 256.0;
        v28 = &v13->_tileSize.width;
        Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, (const void *)*MEMORY[0x1E0CBD090]);
        if (Value
          && (v30 = Value,
              v31 = (void *)CFDictionaryGetValue(Value, (const void *)*MEMORY[0x1E0CBD0E8]),
              v32 = (void *)CFDictionaryGetValue(v30, (const void *)*MEMORY[0x1E0CBD0E0]),
              v31)
          && (v33 = v32) != 0)
        {
          v34 = (double)objc_msgSend(v31, "integerValue");
          v35 = objc_msgSend(v33, "integerValue");
          v36 = (double)v35;
          if (v27 > v34)
            v34 = (floor(v27 / v34) + 1.0) * v34;
          v27 = v27 <= v36 ? (double)v35 : (floor(v27 / v36) + 1.0) * v36;
        }
        else
        {
          v34 = v27;
        }
        *v28 = v34;
        v13->_tileSize.height = v27;
        v37 = (int)width / (int)(v34 * 0.5) + 1;
        v38 = v37 + v37 * ((int)height / (int)(v27 * 0.5));
        v39 = (v38 + v38 / 4) / 10 + v38 + v38 / 4;
        v41 = *p_width;
        v40 = v13->_imageSize.height;
        v42 = (int)(v34 * v27);
        v43 = (int)(*p_width * v40);
        v44 = 4 * v42;
        v45 = 3 * v42 / 2;
        v46 = v43;
        if (v13->_decodePixelFormat == 875704422)
        {
          v47 = 3 * v43 / 2;
        }
        else
        {
          v45 = v44;
          v47 = 4 * v43;
        }
        v48 = v45 * v39;
        if (v41 <= v40)
          v49 = v13->_imageSize.height;
        else
          v49 = *p_width;
        v50 = v49 >= 4096.0 || v48 < v47;
        v51 = v50;
        if (v50)
          v52 = 1;
        else
          v52 = v24;
        v53 = 4 * v46;
        v54 = 3 * v46 / 2;
        if (v13->_conversionPixelFormat == 875704422)
          v55 = v54;
        else
          v55 = v53;
        v56 = v48 < v55 + v47;
        if ((v51 & 1) != 0)
          v56 = v52;
        if (!v24)
          v56 = v52;
        if (width >= height)
          v57 = height;
        else
          v57 = width;
        v58 = v49 / v57;
        if (v58 > 2.0)
          v56 = 1;
        v13->_shouldTile = v56;
        if (!v56)
        {
          if (v34 > v41)
            v41 = v34;
          if (v27 > v40)
            v40 = v27;
          *v28 = v41;
          v13->_tileSize.height = v40;
          v39 = 1;
        }
        v69[0] = CFSTR("HighWaterBytes");
        v69[1] = CFSTR("LowWaterBytes");
        v70[0] = &unk_1E53FE6A0;
        v70[1] = &unk_1E53FE6A0;
        v69[2] = CFSTR("HighWaterBufferCount");
        v70[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (2 * v39 + 50));
        v69[3] = CFSTR("LowWaterBufferCount");
        v70[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (2 * v39));
        AuxiliaryImageCountForIndexWithOptions = CMPhotoSurfacePoolCreate(v15, (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v70, v69, 4), (uint64_t *)&v13->_surfacePool);
        if (!AuxiliaryImageCountForIndexWithOptions)
        {
          AuxiliaryImageCountForIndexWithOptions = CMPhotoDecompressionSessionSetSurfacePool((uint64_t)*p_decodeSession, v13->_surfacePool);
          if (!AuxiliaryImageCountForIndexWithOptions)
          {
            -[CMPhotoTiledLayer setFrame:](v13, "setFrame:", 0.0, 0.0, *p_width, v13->_imageSize.height);
            v22 = CMPhotoCacheCreate(v15, v39, &v13->_tileCache);
            if (!v22)
            {
              v13->_visibleTileKeys = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
              v13->_subLayers = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
              v13->_zoomLevel = -1;
              v13->_lock._os_unfair_lock_opaque = 0;
              -[CMPhotoTiledLayer _zoomStartScaleForImage:placeholderImageSize:](v13, "_zoomStartScaleForImage:placeholderImageSize:", *p_width, v13->_imageSize.height, v10, v9);
              v13->_zoomStartScale = v59;
              v60 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
              v13->_lastVisibleRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
              v13->_lastVisibleRect.size = v60;
              v13->_lastAboveZoomThreshold = 0;
              v13->_showTileBorders = 0;
            }
            goto LABEL_88;
          }
        }
      }
      goto LABEL_87;
    }
    v25 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    if (v25 && (CGColorSpaceEqualToColorSpace() & 1) == 0)
    {
      if (v13->_hasExtendedColorDisplay)
      {
        if (CGColorSpaceUsesITUR_2100TF(v67))
        {
          if (_getEnableHDRPreferences_onceToken != -1)
            dispatch_once(&_getEnableHDRPreferences_onceToken, &__block_literal_global_205);
          v24 = 0;
          v13->_decodePixelFormat = 2019963440;
          v13->_isHDRFile = 1;
          v13->_isHDROutput = 1;
          goto LABEL_37;
        }
      }
      else
      {
        -[CMPhotoTiledLayer _setupConverterForSourceColorSpace:destinationColorSpace:](v13, "_setupConverterForSourceColorSpace:destinationColorSpace:", v67, v25);
        if (v13->_metalConverter || v13->_vimageConverter)
        {
          v13->_decodePixelFormat = 1111970369;
          if (v13->_hasExtendedColorDisplay)
            v26 = 1999843442;
          else
            v26 = 1111970369;
          v13->_conversionPixelFormat = v26;
          v24 = 1;
          goto LABEL_37;
        }
      }
    }
    v24 = 0;
LABEL_37:
    CGColorSpaceRelease(v25);
    goto LABEL_38;
  }
LABEL_87:
  v22 = AuxiliaryImageCountForIndexWithOptions;
LABEL_88:
  if (theDict)
    CFRelease(theDict);
LABEL_90:
  if (v67)
    CFRelease(v67);
  if (v22)
  {

    return 0;
  }
  return v13;
}

- (CMPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 backgroundImageSize:(CGSize)a5 screenSize:(CGSize)a6
{
  double height;
  double width;
  double v8;
  double v9;
  CMPhotoTiledLayer *v12;

  height = a6.height;
  width = a6.width;
  v8 = a5.height;
  v9 = a5.width;
  v12 = 0;
  if (!FigCreateBlockBufferWithCFDataNoCopy())
    return -[CMPhotoTiledLayer initWithContainer:containerImageIndex:backgroundImageSize:screenSize:](self, "initWithContainer:containerImageIndex:backgroundImageSize:screenSize:", 0, a4, v9, v8, width, height);
  return v12;
}

- (CMPhotoTiledLayer)initWithContainerData:(id)a3 containerImageIndex:(int64_t)a4 placeholderImage:(CGImage *)a5 screenSize:(CGSize)a6
{
  return -[CMPhotoTiledLayer initWithContainerData:containerImageIndex:backgroundImageSize:screenSize:](self, "initWithContainerData:containerImageIndex:backgroundImageSize:screenSize:", a3, a4, a5, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8), a6.width, a6.height);
}

- (void)dealloc
{
  OS_dispatch_queue *updateQueue;
  OS_dispatch_queue *schedulingQueue;
  OS_dispatch_queue *metalQueue;
  MTLDevice *metalDevice;
  MTLCommandQueue *metalCmdQueue;
  MPSImageConversion *metalConverter;
  vImageConverter *vimageConverter;
  NSMutableSet *visibleTileKeys;
  NSMutableDictionary *subLayers;
  CMPhotoSurfacePool *surfacePool;
  CMPhotoDecompressionContainer *container;
  CMPhotoDecompressionSession *decodeSession;
  CMPhotoCache *tileCache;
  CGImage *placeholderImage;
  CGColorSpace *colorSpaceFlexGTC;
  MTLCommandQueue *v18;
  MTLDevice *v19;
  OS_dispatch_queue *v20;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *v22;
  objc_super v23;
  _QWORD block[19];

  updateQueue = self->_updateQueue;
  schedulingQueue = self->_schedulingQueue;
  metalQueue = self->_metalQueue;
  metalDevice = self->_metalDevice;
  metalCmdQueue = self->_metalCmdQueue;
  metalConverter = self->_metalConverter;
  vimageConverter = self->_vimageConverter;
  visibleTileKeys = self->_visibleTileKeys;
  subLayers = self->_subLayers;
  surfacePool = self->_surfacePool;
  container = self->_container;
  decodeSession = self->_decodeSession;
  tileCache = self->_tileCache;
  placeholderImage = self->_placeholderImage;
  if (_getDeferredDeallocQueue_onceToken != -1)
  {
    v21 = self->_schedulingQueue;
    v22 = self->_updateQueue;
    v19 = self->_metalDevice;
    v20 = self->_metalQueue;
    v18 = self->_metalCmdQueue;
    dispatch_once(&_getDeferredDeallocQueue_onceToken, &__block_literal_global_206);
    metalCmdQueue = v18;
    metalDevice = v19;
    metalQueue = v20;
    schedulingQueue = v21;
    updateQueue = v22;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__CMPhotoTiledLayer_dealloc__block_invoke;
  block[3] = &unk_1E53F5FB8;
  block[4] = updateQueue;
  block[5] = schedulingQueue;
  block[6] = metalQueue;
  block[7] = metalDevice;
  block[8] = metalCmdQueue;
  block[9] = metalConverter;
  block[10] = visibleTileKeys;
  block[11] = subLayers;
  block[12] = vimageConverter;
  block[13] = surfacePool;
  block[14] = container;
  block[15] = decodeSession;
  block[16] = tileCache;
  block[17] = placeholderImage;
  dispatch_async((dispatch_queue_t)_gDeferredDeallocQueue, block);
  colorSpaceFlexGTC = self->_colorSpaceFlexGTC;
  if (colorSpaceFlexGTC)
    CFRelease(colorSpaceFlexGTC);
  v23.receiver = self;
  v23.super_class = (Class)CMPhotoTiledLayer;
  -[CMPhotoTiledLayer dealloc](&v23, sel_dealloc, v18, v19, v20, v21, v22);
}

void __28__CMPhotoTiledLayer_dealloc__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  uint64_t block;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  void *v16;

  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    v3 = (void *)kUpdateQueueID;
    if (dispatch_queue_get_specific(*(dispatch_queue_t *)(a1 + 32), (const void *)kUpdateQueueID) == v3
      || (block = MEMORY[0x1E0C809B0],
          v13 = 3221225472,
          v14 = __CMPhotoDispatchSync_block_invoke,
          v15 = &unk_1E53F6180,
          v16 = &__block_literal_global_14,
          dispatch_sync(v2, &block),
          (v2 = *(NSObject **)(a1 + 32)) != 0))
    {
      dispatch_release(v2);
    }
  }
  v4 = *(NSObject **)(a1 + 40);
  if (v4)
    dispatch_release(v4);
  v5 = *(NSObject **)(a1 + 48);
  if (v5)
  {
    v6 = (void *)kMetalQueueID;
    if (dispatch_queue_get_specific(*(dispatch_queue_t *)(a1 + 48), (const void *)kMetalQueueID) == v6
      || (block = MEMORY[0x1E0C809B0],
          v13 = 3221225472,
          v14 = __CMPhotoDispatchSync_block_invoke,
          v15 = &unk_1E53F6180,
          v16 = &__block_literal_global_58,
          dispatch_sync(v5, &block),
          (v5 = *(NSObject **)(a1 + 48)) != 0))
    {
      dispatch_release(v5);
    }
  }

  v7 = *(const void **)(a1 + 96);
  if (v7)
    CFRelease(v7);

  v8 = *(const void **)(a1 + 104);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 112);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(a1 + 120);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(a1 + 128);
  if (v11)
    CFRelease(v11);
  CGImageRelease(*(CGImageRef *)(a1 + 136));
}

- (void)flushCache
{
  CMPhotoCacheRemoveAllItems((uint64_t)self->_tileCache);
  CMPhotoDecompressionSessionFlushCachedBuffers((uint64_t)self->_decodeSession, 0, 0);
  CMPhotoSurfacePoolFlushCaches((uint64_t)self->_surfacePool, 0);
}

- (void)_updateSubLayers:(id)a3 zoomScale:(double)a4
{
  CGColor *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  CGColor *v14;
  _BOOL8 v15;
  void *v16;
  CGColorSpace *space;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  space = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
  v7 = CGColorCreate(space, _updateSubLayers_zoomScale__black);
  objc_msgSend(MEMORY[0x1E0CD28B8], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B8], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B8], "setAnimationDuration:", 0.0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(a3);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (objc_msgSend(v12, "visible"))
        {
          v13 = (void *)objc_msgSend(MEMORY[0x1E0CD27A0], "layer");
          if (self->_showTileBorders)
          {
            v14 = CGColorCreate(space, _updateSubLayers_zoomScale__orange);
            objc_msgSend(v13, "setBorderColor:", v14);
            CGColorRelease(v14);
            objc_msgSend(v13, "setBorderWidth:", 4.0);
          }
          objc_msgSend(v12, "imageRect");
          objc_msgSend(v13, "setFrame:");
          objc_msgSend(v13, "setContents:", objc_msgSend(v12, "decodedSurface"));
          objc_msgSend(v12, "contentsRect");
          objc_msgSend(v13, "setContentsRect:");
          objc_msgSend(v13, "setBackgroundColor:", v7);
          objc_msgSend(v13, "setOpaque:", 1);
          v15 = self->_isHDROutput && self->_shouldDisplayHDR;
          objc_msgSend(v13, "setWantsExtendedDynamicRangeContent:", v15);
          -[CMPhotoTiledLayer addSublayer:](self, "addSublayer:", v13);
          -[NSMutableDictionary setObject:forKey:](self->_subLayers, "setObject:forKey:", v13, objc_msgSend(v12, "key"));
        }
        else
        {
          v16 = (void *)-[NSMutableDictionary objectForKey:](self->_subLayers, "objectForKey:", objc_msgSend(v12, "key"));
          objc_msgSend(v16, "removeFromSuperlayer");
          objc_msgSend(v16, "setContents:", 0);
          -[NSMutableDictionary removeObjectForKey:](self->_subLayers, "removeObjectForKey:", objc_msgSend(v12, "key"));
        }
      }
      v9 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }
  if (a4 > 1.0 && _getRasterizeWhenZoomedPreferences_onceToken != -1)
    dispatch_once(&_getRasterizeWhenZoomedPreferences_onceToken, &__block_literal_global_208);
  -[CMPhotoTiledLayer setShouldRasterize:](self, "setShouldRasterize:", a4 > 1.0);
  objc_msgSend(MEMORY[0x1E0CD28B8], "commit");
  CGColorRelease(v7);
  CGColorSpaceRelease(space);
}

- (void)_runMetalConversionOnSurface:(__IOSurface *)a3 cropRect:(CGRect)a4 completionHandler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *metalQueue;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[10];
  IOSurfaceRef v25;
  _QWORD block[6];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = (void *)MEMORY[0x1A85D1038](self, a2);
  v25 = 0;
  CMPhotoSurfacePoolCreateImageSurface((uint64_t)self->_surfacePool, self->_conversionPixelFormat, (unint64_t)width, (unint64_t)height, 1, 0x10uLL, 0x10uLL, 1, 0, 1, 0, &v25, 0);
  if (v25)
  {
    v13 = (void *)-[MTLCommandQueue commandBuffer](self->_metalCmdQueue, "commandBuffer");
    if (self->_hasExtendedColorDisplay)
      v14 = 554;
    else
      v14 = 80;
    v15 = objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", 80, (unint64_t)width, (unint64_t)height, 0);
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CC6BB0], "texture2DDescriptorWithPixelFormat:width:height:mipmapped:", v14, (unint64_t)width, (unint64_t)height, 0);
    objc_msgSend(v16, "setUsage:", 6);
    v17 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_metalDevice, "newTextureWithDescriptor:iosurface:plane:", v15, a3, 0);
    v18 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_metalDevice, "newTextureWithDescriptor:iosurface:plane:", v16, v25, 0);
    -[MPSImageConversion encodeToCommandBuffer:sourceTexture:destinationTexture:](self->_metalConverter, "encodeToCommandBuffer:sourceTexture:destinationTexture:", v13, v17, v18);

    v19 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke;
    v24[3] = &unk_1E53F5FE0;
    v24[4] = a5;
    v24[5] = v25;
    v24[6] = 0;
    v24[7] = 0;
    *(double *)&v24[8] = (double)(unint64_t)width;
    *(double *)&v24[9] = (double)(unint64_t)height;
    objc_msgSend(v13, "addScheduledHandler:", v24);
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke_2;
    v23[3] = &__block_descriptor_40_e28_v16__0___MTLCommandBuffer__8l;
    v23[4] = a3;
    objc_msgSend(v13, "addCompletedHandler:", v23);
    objc_msgSend(v13, "commit");
    v20 = v13;
    metalQueue = self->_metalQueue;
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke_3;
    v22[3] = &unk_1E53F5A80;
    v22[4] = v13;
    block[0] = v19;
    block[1] = 3221225472;
    block[2] = __CMPhotoDispatchAsync_block_invoke;
    block[3] = &unk_1E53F6180;
    block[4] = v22;
    dispatch_async(metalQueue, block);
  }
  else
  {
    (*((void (**)(id, __IOSurface *, double, double, double, double))a5 + 2))(a5, a3, x, y, width, height);
  }
  objc_autoreleasePoolPop(v12);
}

void __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke_2(uint64_t a1)
{
  __IOSurface *v1;

  v1 = *(__IOSurface **)(a1 + 32);
  if (v1)
    IOSurfaceDecrementUseCount(v1);
}

void __77__CMPhotoTiledLayer__runMetalConversionOnSurface_cropRect_completionHandler___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "waitUntilScheduled");

}

- (void)_runVImageConversionOnSurface:(__IOSurface *)a3 cropRect:(CGRect)a4 completionHandler:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  vImagePixelCount v12;
  vImagePixelCount v13;
  vImage_Error v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  vImage_Buffer dests;
  vImage_Buffer srcs;
  IOSurfaceRef v21;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = (unint64_t)a4.size.width;
  v13 = (unint64_t)a4.size.height;
  v21 = 0;
  CMPhotoSurfacePoolCreateImageSurface((uint64_t)self->_surfacePool, self->_conversionPixelFormat, (unint64_t)a4.size.width, (unint64_t)a4.size.height, 1, 0x10uLL, 0x10uLL, 1, 0, 1, 0, &v21, 0);
  if (v21)
  {
    IOSurfaceLock(a3, 0, 0);
    IOSurfaceLock(v21, 0, 0);
    srcs.data = IOSurfaceGetBaseAddress(a3);
    srcs.height = v13;
    srcs.width = v12;
    srcs.rowBytes = IOSurfaceGetBytesPerRow(a3);
    dests.data = IOSurfaceGetBaseAddress(v21);
    dests.height = v13;
    dests.width = v12;
    dests.rowBytes = IOSurfaceGetBytesPerRow(v21);
    v14 = vImageConvert_AnyToAny(self->_vimageConverter, &srcs, &dests, 0, 0x10u);
    IOSurfaceUnlock(a3, 0, 0);
    IOSurfaceUnlock(v21, 0, 0);
    if (v14)
    {
      if (v21)
        IOSurfaceDecrementUseCount(v21);
      v15.n128_f64[0] = x;
      v16.n128_f64[0] = y;
      v17.n128_f64[0] = width;
      v18.n128_f64[0] = height;
      (*((void (**)(id, __IOSurface *, __n128, __n128, __n128, __n128))a5 + 2))(a5, a3, v15, v16, v17, v18);
    }
    else
    {
      if (a3)
        IOSurfaceDecrementUseCount(a3);
      v15.n128_u64[0] = 0;
      v16.n128_u64[0] = 0;
      v17.n128_f64[0] = (double)v12;
      v18.n128_f64[0] = (double)v13;
      (*((void (**)(id, IOSurfaceRef, __n128, __n128, __n128, __n128))a5 + 2))(a5, v21, v15, v16, v17, v18);
    }
    CFRelease(v21);
  }
  else
  {
    (*((void (**)(id, __IOSurface *, double, double, double, double))a5 + 2))(a5, a3, x, y, width, height);
  }
}

- (void)_decodeImageRectangle:(CGRect)a3 forLevel:(int)a4 zoomScale:(double)a5 requestId:(unsigned int)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  NSMutableSet *visibleTileKeys;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int *v27;
  BOOL v28;
  int v29;
  BOOL v30;
  CMPhotoTile *v31;
  uint64_t v32;
  unint64_t v33;
  unsigned int v34;
  int v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *metalQueue;
  unsigned int v41;
  int v42;
  int v43;
  int v44;
  unsigned int v45;
  const void *v46;
  void *ItemForKey;
  double v48;
  double v49;
  BOOL v50;
  double v51;
  double v52;
  int v53;
  void *v54;
  double v55;
  NSObject *schedulingQueue;
  int v57;
  int v58;
  double v59;
  id v60;
  int v61;
  int v62;
  uint64_t v63;
  int v64;
  unsigned int v65;
  CFDictionaryRef theDict;
  void *v67;
  CMPhotoTiledLayer *v68;
  NSMutableSet *v69;
  int v70;
  int v71;
  int v72;
  _QWORD v73[8];
  _QWORD block[7];
  _QWORD v75[7];
  _QWORD aBlock[9];
  unint64_t v77;
  _QWORD v78[8];
  CGRect v79;
  _QWORD v80[4];
  unsigned int v81;
  _QWORD v82[3];
  int v83;
  _QWORD v84[3];
  int v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  unint64_t v96;
  uint64_t v97;
  void (*v98)(uint64_t);
  void *v99;
  _QWORD *v100;
  _BYTE v101[128];
  uint64_t v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v102 = *MEMORY[0x1E0C80C00];
  -[CMPhotoTiledLayer _prepareForDecodeSynchronous](self, "_prepareForDecodeSynchronous");
  if (self->_err)
    return;
  v65 = a6;
  v59 = a5;
  v60 = a7;
  v16 = self->_tileSize.width;
  v17 = self->_tileSize.height;
  v69 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  v63 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  if (!self->_isHDROutput || self->_metalConverter || self->_vimageConverter)
    v20 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_decodePixelFormat);
  else
    v20 = &unk_1E53FE6B8;
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, CFSTR("OutputPixelFormat"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E53FE6D0, CFSTR("TiledDownsampling"));
  objc_msgSend(v19, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ForceHighSpeedDecode"));
  if (self->_containerFormat == 1)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_shouldTile), CFSTR("AccelerationMode"));
  v67 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  objc_msgSend(v19, "setObject:forKeyedSubscript:");
  theDict = (CFDictionaryRef)v19;
  -[CMPhotoTiledLayer _setHDROptions:](self, "_setHDROptions:", v19);
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v68 = self;
  visibleTileKeys = self->_visibleTileKeys;
  v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](visibleTileKeys, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
  v64 = (int)v16 << a4;
  v61 = (int)v17 << a4;
  v70 = (int)(y / (double)v61);
  v71 = (int)((x + width + -1.0) / (double)v64);
  v72 = (int)(x / (double)v64);
  v23 = (int)((y + height + -1.0) / (double)v61);
  if (v22)
  {
    v24 = *(_QWORD *)v93;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v93 != v24)
          objc_enumerationMutation(visibleTileKeys);
        v26 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v25);
        v27 = (int *)objc_msgSend(v26, "bytes");
        if (v27[2] == a4
          && (*v27 >= v72 ? (v28 = *v27 <= v71) : (v28 = 0),
              v28 && ((v29 = v27[1], v29 >= v70) ? (v30 = v29 <= v23) : (v30 = 0), v30)))
        {
          -[NSMutableSet addObject:](v69, "addObject:", v26);
        }
        else
        {
          v31 = objc_alloc_init(CMPhotoTile);
          -[CMPhotoTile setVisible:](v31, "setVisible:", 0);
          -[CMPhotoTile setKey:](v31, "setKey:", v26);
          objc_msgSend(v18, "addObject:", v31);

        }
        ++v25;
      }
      while (v22 != v25);
      v32 = -[NSMutableSet countByEnumeratingWithState:objects:count:](visibleTileKeys, "countByEnumeratingWithState:objects:count:", &v92, v101, 16);
      v22 = v32;
    }
    while (v32);
  }
  v86 = 0;
  v87 = &v86;
  v88 = 0x3052000000;
  v89 = __Block_byref_object_copy_;
  v90 = __Block_byref_object_dispose_;
  v91 = 0;
  v84[0] = 0;
  v84[1] = v84;
  v84[2] = 0x2020000000;
  v85 = 0;
  v82[0] = 0;
  v82[1] = v82;
  v82[2] = 0x2020000000;
  v33 = MEMORY[0x1E0C809B0];
  v83 = 0;
  v80[0] = MEMORY[0x1E0C809B0];
  v80[1] = 3221225472;
  v80[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke;
  v80[3] = &__block_descriptor_36_e1459_i40__0__CMPhotoDecompressionSession____CFRuntimeBase_QAQ__os_unfair_lock_s_I_Q____CFSet_____C_______CFArray_i____C_______CFArray_i____C_______CFArray_i____C_______CFArray_i____Ci_os_unfair_lock_s_I______CFArray____CMPhotoSurfacePool___CMPhotoScaleAndRotateSession___CMPhotoCodecSessionPool___CMPhotoCodecSessionPool____vQ_8__CMPhotoDecompressionContainer____CFRuntimeBase_QAQ___CMPhotoDecompressionSession_CCCCC__CMPhotoDecompressionContainerVTable___________CFAllocator___OpaqueFigPictureCollection___OpaqueFigFormatReader_____Cqq__CGImageMetadata_____CFDictionary_i____C____CFArray_____Cqq____CC____CCC____CC_________CFAllocator____CCq___OpaqueFigFormatReader_____CFDictionary_________CFArray_____CFArray__C________CFAllocator____i____v____CFURL_____IOSurface_____CFData___OpaqueCMBlockBuffer____OpaqueCMByteStream____OpaqueFigSimpleMutex_______C____CFArray_____CMPhotoUnifiedJPEGDecoder____C___QQ_iCCi____CFData_____CC______QQ_iI__CGImageMetadata_____CFString_____CFDictionary____qQ_Ci____CFData___CGColorSpace_____CFDictionary__qQ________CC___qQ_iC___C___QQ_i___qQ_i_____CC___qQ_____CC___qQ_____CFData_____CC___qQ_____CFData_____CC____CFData_____CC____CFData__________CFAllocator____i____v____CFURL_____IOSurface_____CFData___OpaqueCMBlockBuffer____OpaqueCMByteStream_____CFData_____C___iIIIIffifiiiiIIIIi___II____IIIi_II_100C____CGColorSpace_____CFData_____CFString_____CFString_____CFArray_____CFArray____QQ___Cq____Cq_i_______CFArray__q_qqqq__16Q24_v32l;
  v34 = a6;
  v81 = a6;
  if (v68->_shouldTile)
  {
    v35 = CMPhotoDecompressionSetAsyncPreDecodeCallback((uint64_t)v68->_decodeSession, v80, (uint64_t)&v68->_requestID);
    v68->_err = v35;
    v36 = (int)v16 << a4;
    if (v35 || v70 > v23)
      goto LABEL_33;
LABEL_43:
    v42 = (int)(y / (double)v61);
    if (v70 <= v23)
      v42 = (int)((y + height + -1.0) / (double)v61);
    v62 = v42;
    v58 = v72 * v36;
    while (v72 > v71)
    {
LABEL_63:
      v50 = v70++ == v62;
      if (v50)
        goto LABEL_33;
    }
    v43 = v58;
    v44 = v72;
    while (1)
    {
      v45 = atomic_load(&v68->_requestID);
      if (v45 != v34)
        goto LABEL_33;
      v96 = __PAIR64__(v70, v44);
      LODWORD(v97) = a4;
      v46 = (const void *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v96, 12);
      ItemForKey = (void *)CMPhotoCacheGetItemForKey((uint64_t)v68->_tileCache, v46);
      if ((-[NSMutableSet containsObject:](v68->_visibleTileKeys, "containsObject:", v46) & 1) == 0)
      {
        if (ItemForKey)
        {
          objc_msgSend(ItemForKey, "setVisible:", 1);
          os_unfair_lock_lock(&v68->_lock);
          objc_msgSend(v18, "addObject:", ItemForKey);
          -[NSMutableSet addObject:](v69, "addObject:", v46);
          os_unfair_lock_unlock(&v68->_lock);
        }
        else
        {
          v103.origin.x = (double)v43;
          v105.size.width = v68->_imageSize.width;
          v105.size.height = v68->_imageSize.height;
          v105.origin.x = 0.0;
          v105.origin.y = 0.0;
          v103.origin.y = (double)(v70 * v61);
          v103.size.width = (double)v64;
          v103.size.height = (double)v61;
          v104 = CGRectIntersection(v103, v105);
          v48 = v104.size.width;
          v49 = v104.size.height;
          if ((int)v104.size.width)
            v50 = (int)v104.size.height == 0;
          else
            v50 = 1;
          if (!v50)
          {
            v51 = v104.origin.x;
            v52 = v104.origin.y;
            v77 = 0;
            v78[0] = v33;
            v78[1] = 3221225472;
            v78[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_2;
            v78[3] = &unk_1E53F6048;
            v79 = v104;
            v78[4] = v46;
            v78[5] = v68;
            v78[6] = v18;
            v78[7] = v69;
            v53 = CMPhotoDecompressionSessionReserveRequestID((uint64_t)v68->_decodeSession, &v77);
            v68->_err = v53;
            if (v53)
              goto LABEL_63;
            v54 = (void *)MEMORY[0x1A85D1038]();
            v36 = (int)v16 << a4;
            v34 = v65;
            objc_msgSend(v67, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51), CFSTR("X"));
            objc_msgSend(v67, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52), CFSTR("Y"));
            objc_msgSend(v67, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v48), CFSTR("Width"));
            objc_msgSend(v67, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v49), CFSTR("Height"));
            if (v48 <= v49)
              v55 = v49;
            else
              v55 = v48;
            -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", vcvtmd_u64_f64(1.0 / (double)(1 << a4) * v55)), CFSTR("MaxPixelSize"));
            -[__CFDictionary setObject:forKeyedSubscript:](theDict, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v77), CFSTR("RequestIDOverride"));
            objc_autoreleasePoolPop(v54);
            aBlock[0] = v33;
            aBlock[1] = 3221225472;
            aBlock[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_3;
            aBlock[3] = &unk_1E53F6098;
            aBlock[4] = v68;
            aBlock[5] = v78;
            aBlock[6] = v82;
            aBlock[7] = &v86;
            aBlock[8] = v84;
            schedulingQueue = v68->_schedulingQueue;
            v75[0] = v33;
            v75[1] = 3221225472;
            v75[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_5;
            v75[3] = &unk_1E53F60C0;
            v75[4] = v63;
            v75[5] = v84;
            v75[6] = v77;
            dispatch_sync(schedulingQueue, v75);
            v57 = CMPhotoDecompressionContainerDecodeImageForIndexAsync(&v68->_container->var0.var0, (const __CFNumber *)v68->_imageIndex, theDict, 2, (uint64_t)&v77, aBlock);
            if (v57)
            {
              v68->_err = v57;
              goto LABEL_63;
            }
            if (v68->_err)
              goto LABEL_63;
          }
        }
      }
      ++v44;
      v43 += v36;
      if (v71 + 1 == v44)
        goto LABEL_63;
    }
  }
  v36 = (int)v16 << a4;
  if (v70 <= v23)
    goto LABEL_43;
LABEL_33:
  v37 = v68->_schedulingQueue;
  block[0] = v33;
  block[1] = 3221225472;
  block[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_6;
  block[3] = &unk_1E53F6070;
  block[4] = v84;
  block[5] = v82;
  block[6] = &v86;
  dispatch_sync(v37, block);
  v38 = v87[5];
  if (v38)
  {
    dispatch_semaphore_wait(v38, 0xFFFFFFFFFFFFFFFFLL);
    v39 = v87[5];
    if (v39)
    {
      dispatch_release(v39);
      v87[5] = 0;
    }
  }
  metalQueue = v68->_metalQueue;
  if (metalQueue)
  {
    v96 = v33;
    v97 = 3221225472;
    v98 = __CMPhotoDispatchSync_block_invoke;
    v99 = &unk_1E53F6180;
    v100 = &__block_literal_global_82;
    dispatch_sync(metalQueue, &v96);
  }
  CMPhotoDecompressionSetAsyncPreDecodeCallback((uint64_t)v68->_decodeSession, 0, 0);
  v41 = atomic_load(&v68->_requestID);
  if (v41 == v34)
  {

    v68->_visibleTileKeys = v69;
    v68->_zoomLevel = a4;
    v73[0] = v33;
    v73[1] = 3221225472;
    v73[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_8;
    v73[3] = &unk_1E53F6108;
    v73[4] = v68;
    v73[5] = v18;
    *(double *)&v73[7] = v59;
    v73[6] = v60;
    v96 = v33;
    v97 = 3221225472;
    v98 = __CMPhotoDispatchAsync_block_invoke;
    v99 = &unk_1E53F6180;
    v100 = v73;
    dispatch_async(MEMORY[0x1E0C80D38], &v96);
  }
  else
  {

  }
  _Block_object_dispose(v82, 8);
  _Block_object_dispose(v84, 8);
  _Block_object_dispose(&v86, 8);
}

uint64_t __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  int v5;
  unsigned int v6;

  v5 = *(_DWORD *)(a1 + 32);
  v6 = atomic_load(a5);
  if (v5 == v6)
    return 0;
  else
    return 4294950191;
}

void __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_2(uint64_t a1, IOSurfaceRef buffer, double a3, double a4, double a5, double a6)
{
  double Width;
  size_t Height;
  double v14;
  double v15;
  int v16;
  CMPhotoTile *v17;

  Width = (double)IOSurfaceGetWidth(buffer);
  Height = IOSurfaceGetHeight(buffer);
  v14 = a4 / (double)Height;
  v15 = a6 / (double)Height;
  v17 = objc_alloc_init(CMPhotoTile);
  -[CMPhotoTile setDecodedSurface:](v17, "setDecodedSurface:", buffer);
  -[CMPhotoTile setVisible:](v17, "setVisible:", 1);
  -[CMPhotoTile setKey:](v17, "setKey:", *(_QWORD *)(a1 + 32));
  -[CMPhotoTile setImageRect:](v17, "setImageRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  -[CMPhotoTile setContentsRect:](v17, "setContentsRect:", a3 / Width, v14, a5 / Width, v15);
  v16 = CMPhotoCacheAddItemForKey(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 144), *(const void **)(a1 + 32), v17);
  if (v16)
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 140) = v16;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 224));
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);
  objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 224));

}

void __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, __CVBuffer *a6)
{
  double PixelBufferCLAPAsRect;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __IOSurface *IOSurface;
  __IOSurface *v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD block[4];
  __int128 v21;
  uint64_t v22;

  if (!a4 && a5 == 2)
  {
    PixelBufferCLAPAsRect = CMPhotoGetPixelBufferCLAPAsRect(a6);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 136) || !CMPhotoPixelBufferPremultiplyWithAlpha(a6))
    {
      IOSurface = CVPixelBufferGetIOSurface(a6);
      if (IOSurface)
      {
        v16 = IOSurface;
        IOSurfaceIncrementUseCount(IOSurface);
        v17 = *(_QWORD **)(a1 + 32);
        if (v17[15])
        {
          objc_msgSend(v17, "_runMetalConversionOnSurface:cropRect:completionHandler:", v16, *(_QWORD *)(a1 + 40), PixelBufferCLAPAsRect, v10, v12, v14);
        }
        else
        {
          v18 = *(_QWORD *)(a1 + 40);
          if (v17[16])
            objc_msgSend(v17, "_runVImageConversionOnSurface:cropRect:completionHandler:", v16, v18, PixelBufferCLAPAsRect, v10, v12, v14);
          else
            (*(void (**)(_QWORD, __IOSurface *, double, double, double, double))(v18 + 16))(*(_QWORD *)(a1 + 40), v16, PixelBufferCLAPAsRect, v10, v12, v14);
        }
      }
    }
  }
  v19 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 184);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_4;
  block[3] = &unk_1E53F6070;
  v21 = *(_OWORD *)(a1 + 48);
  v22 = *(_QWORD *)(a1 + 64);
  dispatch_sync(v19, block);
}

NSObject *__90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_4(_QWORD *a1)
{
  NSObject *result;

  ++*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
  result = *(NSObject **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (result)
  {
    if (*(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) == *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24))
      return dispatch_semaphore_signal(result);
  }
  return result;
}

uint64_t __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 48);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v1));
}

dispatch_semaphore_t __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_6(dispatch_semaphore_t result)
{
  dispatch_semaphore_t v1;

  if (*(_DWORD *)(*((_QWORD *)result[4].isa + 1) + 24) != *(_DWORD *)(*((_QWORD *)result[5].isa + 1) + 24))
  {
    v1 = result;
    result = dispatch_semaphore_create(0);
    *(_QWORD *)(*((_QWORD *)v1[6].isa + 1) + 40) = result;
  }
  return result;
}

uint64_t __90__CMPhotoTiledLayer__decodeImageRectangle_forLevel_zoomScale_requestId_completionHandler___block_invoke_8(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateSubLayers:zoomScale:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 56));

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_removeAllTiles
{
  NSMutableSet *visibleTileKeys;
  _QWORD v4[6];
  _QWORD block[5];

  visibleTileKeys = self->_visibleTileKeys;
  self->_visibleTileKeys = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__CMPhotoTiledLayer__removeAllTiles__block_invoke;
  v4[3] = &unk_1E53F6130;
  v4[4] = visibleTileKeys;
  v4[5] = self;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __CMPhotoDispatchAsync_block_invoke;
  block[3] = &unk_1E53F6180;
  block[4] = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __36__CMPhotoTiledLayer__removeAllTiles__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD28B8], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B8], "setDisableActions:", 1);
  objc_msgSend(MEMORY[0x1E0CD28B8], "setAnimationDuration:", 0.0);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(void **)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "objectForKey:", v7);
        objc_msgSend(v8, "removeFromSuperlayer");
        objc_msgSend(v8, "setContents:", 0);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 168), "removeObjectForKey:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  objc_msgSend(MEMORY[0x1E0CD28B8], "commit");

}

- (BOOL)_visibleTileRegionHasChanged:(CGRect)a3 level:(int)a4
{
  double lastZoomScale;
  unsigned int v6;
  double v7;
  int v8;
  int x;
  int v10;
  int y;
  BOOL result;

  lastZoomScale = self->_lastZoomScale;
  if (lastZoomScale >= 0.5 || !self->_shouldTile)
  {
    v6 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0.5;
    do
    {
      v7 = v7 * 0.5;
      ++v6;
    }
    while (v7 > lastZoomScale);
  }
  if (v6 >= 3)
    v6 = 3;
  result = v6 != a4
        || (v8 = (int)self->_tileSize.width << a4,
            x = (int)self->_lastVisibleRect.origin.x,
            (int)a3.origin.x / v8 != x / v8)
        || (v10 = (int)self->_tileSize.height << a4,
            y = (int)self->_lastVisibleRect.origin.y,
            (int)a3.origin.y / v10 != y / v10)
        || ((int)a3.size.width + (int)a3.origin.x - 1) / v8 != (x + (int)self->_lastVisibleRect.size.width - 1) / v8
        || ((int)a3.size.height + (int)a3.origin.y - 1) / v10 != ((int)self->_lastVisibleRect.size.height + y - 1) / v10;
  return result;
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4 completionHandler:(id)a5
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  unsigned int v13;
  double v14;
  uint64_t v15;
  BOOL v16;
  double lastZoomScale;
  BOOL v18;
  char v20;
  double zoomStartScale;
  int lastAboveZoomThreshold;
  int v23;
  char v24;
  NSObject *updateQueue;
  unsigned int *p_requestID;
  unsigned int v27;
  unsigned int v28;
  _QWORD *v29;
  _QWORD v30[11];
  int v31;
  unsigned int v32;
  _QWORD v33[5];
  uint64_t block;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  id v38;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4 >= 0.5 || !self->_shouldTile)
  {
    v13 = 0;
  }
  else
  {
    v13 = 0;
    v14 = 0.5;
    do
    {
      v14 = v14 * 0.5;
      ++v13;
    }
    while (v14 > a4);
  }
  if (v13 >= 3)
    v15 = 3;
  else
    v15 = v13;
  v16 = -[CMPhotoTiledLayer _visibleTileRegionHasChanged:level:](self, "_visibleTileRegionHasChanged:level:", v15, a3.origin.x, y, a3.size.width, a3.size.height);
  lastZoomScale = self->_lastZoomScale;
  v18 = a4 <= 1.0;
  if (lastZoomScale <= 1.0)
    v18 = 0;
  v20 = a4 > 1.0 && lastZoomScale <= 1.0 || v18;
  zoomStartScale = self->_zoomStartScale;
  lastAboveZoomThreshold = self->_lastAboveZoomThreshold;
  self->_lastVisibleRect.origin.x = x;
  self->_lastVisibleRect.origin.y = y;
  v23 = zoomStartScale < a4;
  self->_lastVisibleRect.size.width = width;
  self->_lastVisibleRect.size.height = height;
  self->_lastZoomScale = a4;
  self->_lastAboveZoomThreshold = v23;
  v24 = lastAboveZoomThreshold != v23 || v16;
  if ((v20 & 1) != 0 || (v24 & 1) != 0)
  {
    p_requestID = &self->_requestID;
    do
    {
      v27 = __ldaxr(p_requestID);
      v28 = v27 + 1;
    }
    while (__stlxr(v28, p_requestID));
    if (zoomStartScale >= a4)
    {
      updateQueue = self->_updateQueue;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __69__CMPhotoTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke;
      v33[3] = &unk_1E53F5A80;
      v33[4] = self;
      block = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __CMPhotoDispatchAsync_block_invoke;
      v37 = &unk_1E53F6180;
      v29 = v33;
    }
    else
    {
      if (self->_err)
        return;
      updateQueue = self->_updateQueue;
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __69__CMPhotoTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke_2;
      v30[3] = &unk_1E53F6158;
      *(CGFloat *)&v30[6] = x;
      *(double *)&v30[7] = y;
      *(CGFloat *)&v30[8] = width;
      *(CGFloat *)&v30[9] = height;
      *(double *)&v30[10] = a4;
      v31 = v15;
      v32 = v28;
      v30[4] = self;
      v30[5] = a5;
      block = MEMORY[0x1E0C809B0];
      v35 = 3221225472;
      v36 = __CMPhotoDispatchAsync_block_invoke;
      v37 = &unk_1E53F6180;
      v29 = v30;
    }
    v38 = v29;
  }
  else
  {
    if (!a5)
      return;
    block = MEMORY[0x1E0C809B0];
    v35 = 3221225472;
    v36 = __CMPhotoDispatchAsync_block_invoke;
    v37 = &unk_1E53F6180;
    v38 = a5;
    updateQueue = MEMORY[0x1E0C80D38];
  }
  dispatch_async(updateQueue, &block);
}

uint64_t __69__CMPhotoTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeAllTiles");
}

uint64_t __69__CMPhotoTiledLayer_setVisibleRectangle_zoomScale_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_decodeImageRectangle:forLevel:zoomScale:requestId:completionHandler:", *(unsigned int *)(a1 + 88), *(unsigned int *)(a1 + 92), *(_QWORD *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

- (void)setVisibleRectangle:(CGRect)a3 zoomScale:(double)a4
{
  -[CMPhotoTiledLayer setVisibleRectangle:zoomScale:completionHandler:](self, "setVisibleRectangle:zoomScale:completionHandler:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (void)setFlexGTCColorSpace:(CGColorSpace *)a3
{
  CGColorSpace *colorSpaceFlexGTC;
  CGColorSpace *v6;

  colorSpaceFlexGTC = self->_colorSpaceFlexGTC;
  if (colorSpaceFlexGTC)
    CFRelease(colorSpaceFlexGTC);
  if (a3)
    v6 = (CGColorSpace *)CFRetain(a3);
  else
    v6 = 0;
  self->_colorSpaceFlexGTC = v6;
}

- (void)setShouldDisplayHDR:(BOOL)a3
{
  self->_shouldDisplayHDR = a3;
}

- (void)setDecodeToHDROutputMode:(int)a3
{
  BOOL v3;

  self->_decodeToHDROutputMode = a3;
  v3 = (a3 - 1) < 5 && ((0x1Du >> (a3 - 1)) & 1) != 0 || self->_isHDRFile;
  self->_isHDROutput = v3;
}

- (void)sizeToFit
{
  double v3;
  double v4;

  -[CMPhotoTiledLayer frame](self, "frame");
  v4 = v3;
  -[CMPhotoTiledLayer frame](self, "frame");
  -[CMPhotoTiledLayer setFrame:](self, "setFrame:", v4);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)imageOrientation
{
  return self->_imageOrientation;
}

- (BOOL)shouldDisplayHDR
{
  return self->_shouldDisplayHDR;
}

- (int)decodeToHDROutputMode
{
  return self->_decodeToHDROutputMode;
}

- (BOOL)decodeToHDROutputModePreferMeteor
{
  return self->_decodeToHDROutputModePreferMeteor;
}

- (void)setDecodeToHDROutputModePreferMeteor:(BOOL)a3
{
  self->_decodeToHDROutputModePreferMeteor = a3;
}

@end
