@implementation AVCapturePhoto

+ (void)initialize
{
  objc_opt_class();
}

- (AVCapturePhoto)initWithTimestamp:(id *)a3 photoSurface:(__IOSurface *)a4 photoSurfaceSize:(unint64_t)a5 processedFileType:(id)a6 previewPhotoSurface:(__IOSurface *)a7 embeddedThumbnailSourceSurface:(__IOSurface *)a8 metadata:(id)a9 depthDataSurface:(__IOSurface *)a10 depthMetadataDictionary:(id)a11 portraitEffectsMatteSurface:(__IOSurface *)a12 portraitEffectsMatteMetadataDictionary:(id)a13 hairSegmentationMatteSurface:(__IOSurface *)a14 hairSegmentationMatteMetadataDictionary:(id)a15 skinSegmentationMatteSurface:(__IOSurface *)a16 skinSegmentationMatteMetadataDictionary:(id)a17 teethSegmentationMatteSurface:(__IOSurface *)a18 teethSegmentationMatteMetadataDictionary:(id)a19 glassesSegmentationMatteSurface:(__IOSurface *)a20 glassesSegmentationMatteMetadataDictionary:(id)a21 constantColorConfidenceMapSurface:(__IOSurface *)a22 constantColorMetadataDictionary:(id)a23 captureRequest:(id)a24 bracketSettings:(id)a25 sequenceCount:(unint64_t)a26 photoCount:(unint64_t)a27 expectedPhotoProcessingFlags:(unsigned int)a28 sourceDeviceType:(id)a29
{
  AVCapturePhoto *v35;
  AVCapturePhotoInternal *v36;
  __int128 v37;
  __IOSurface *v38;
  id v39;
  unsigned int v40;
  void *v41;
  uint64_t v42;
  void *v43;
  BOOL v44;
  _BOOL4 v45;
  AVCaptureResolvedPhotoSettings *resolvedSettings;
  uint64_t *v47;
  unint64_t v48;
  unint64_t v49;
  NSDictionary *v50;
  uint64_t v51;
  uint64_t v52;
  __IOSurface *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  CFAllocatorRef *v59;
  AVDepthData *v60;
  AVPortraitEffectsMatte *v61;
  AVSemanticSegmentationMatte *v62;
  AVSemanticSegmentationMatte *v63;
  AVSemanticSegmentationMatte *v64;
  AVSemanticSegmentationMatte *v65;
  float v66;
  _BOOL4 v67;
  IOSurfaceRef v69;
  IOSurfaceRef v70;
  __IOSurface *surface;
  CVPixelBufferRef pixelBufferOut;
  objc_super v73;

  v73.receiver = self;
  v73.super_class = (Class)AVCapturePhoto;
  v35 = -[AVCapturePhoto init](&v73, sel_init);
  if (v35)
  {
    v70 = a8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" constantColorConfidence:%p"), a22);
    v36 = objc_alloc_init(AVCapturePhotoInternal);
    v35->_internal = v36;
    if (v36)
    {
      v37 = *(_OWORD *)&a3->var0;
      v36->timestamp.epoch = a3->var3;
      *(_OWORD *)&v36->timestamp.value = v37;
      if (a4)
        v38 = (__IOSurface *)CFRetain(a4);
      else
        v38 = 0;
      surface = a4;
      v69 = a7;
      v39 = a25;
      v35->_internal->photoSurface = v38;
      v35->_internal->photoSurfaceSize = a5;
      if (!a6)
        a6 = (id)objc_msgSend((id)objc_msgSend(a24, "unresolvedSettings"), "processedFileType");
      v40 = a28;
      v35->_internal->processedFileType = (NSString *)a6;
      if (a9)
      {
        v35->_internal->privateClientMetadata = -[AVCapturePhotoPrivateClientMetadata initWithMetadataDictionary:]([AVCapturePhotoPrivateClientMetadata alloc], "initWithMetadataDictionary:", a9);
        if (v35->_internal->privateClientMetadata)
        {
          v41 = (void *)objc_msgSend(a9, "mutableCopy");
          objc_msgSend(v41, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D040D0]);
        }
        else
        {
          v41 = 0;
        }
        v42 = objc_msgSend(a9, "objectForKeyedSubscript:", 0x1E422B148);
        if (v42)
        {
          v35->_internal->portraitMetadata = -[AVApplePortraitMetadata initWithPortraitMetadataDictionary:]([AVApplePortraitMetadata alloc], "initWithPortraitMetadataDictionary:", v42);
          if (!v41)
            v41 = (void *)objc_msgSend(a9, "mutableCopy");
          objc_msgSend(v41, "setObject:forKeyedSubscript:", 0, 0x1E422B148);
        }
        v39 = a25;
        if (v41)
        {

          v35->_internal->metadata = (NSDictionary *)objc_msgSend(v41, "copy");
        }
        else
        {
          v35->_internal->metadata = (NSDictionary *)a9;
        }
        v40 = a28;
      }
      else
      {
        v35->_internal->metadata = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      }
      v35->_internal->resolvedSettings = (AVCaptureResolvedPhotoSettings *)(id)objc_msgSend(a24, "resolvedSettings");
      v35->_internal->unresolvedSettings = (AVCapturePhotoSettings *)(id)objc_msgSend(a24, "unresolvedSettings");
      v35->_internal->bracketSettings = (AVCaptureBracketedStillImageSettings *)v39;
      v35->_internal->sequenceCount = a26;
      v35->_internal->photoCount = a27;
      v35->_internal->sourceDeviceType = (NSString *)a29;
      v43 = (void *)objc_msgSend(a9, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
      v35->_internal->expectedPhotoProcessingFlags = v40;
      v35->_internal->actualPhotoProcessingFlags = objc_msgSend((id)objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("25")), "unsignedIntValue");
      v44 = -[AVCapturePhoto _isSushiRAWPhoto](v35, "_isSushiRAWPhoto");
      v45 = -[AVCapturePhoto _isProRAWPhoto](v35, "_isProRAWPhoto");
      v35->_internal->lensStabilizationSupported = objc_msgSend(a24, "lensStabilizationSupported");
      resolvedSettings = v35->_internal->resolvedSettings;
      v47 = (uint64_t *)MEMORY[0x1E0CF2C58];
      if (v44 || v45)
      {
        v48 = -[AVCaptureResolvedPhotoSettings rawEmbeddedThumbnailDimensions](resolvedSettings, "rawEmbeddedThumbnailDimensions");
        v49 = HIDWORD(v48);
        v50 = -[AVCapturePhotoSettings rawEmbeddedThumbnailPhotoFormat](v35->_internal->unresolvedSettings, "rawEmbeddedThumbnailPhotoFormat");
      }
      else
      {
        v48 = -[AVCaptureResolvedPhotoSettings embeddedThumbnailDimensions](resolvedSettings, "embeddedThumbnailDimensions");
        v49 = HIDWORD(v48);
        v50 = -[AVCapturePhotoSettings embeddedThumbnailPhotoFormat](v35->_internal->unresolvedSettings, "embeddedThumbnailPhotoFormat");
      }
      v51 = *v47;
      v52 = -[NSDictionary objectForKeyedSubscript:](v50, "objectForKeyedSubscript:", *v47);
      v53 = surface;
      if ((_DWORD)v49)
      {
        if ((_DWORD)v48)
        {
          v54 = v52;
          if (v52)
          {
            v55 = objc_alloc(MEMORY[0x1E0C99D80]);
            v56 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
            v57 = *MEMORY[0x1E0CF2D08];
            v58 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v49);
            v35->_internal->embeddedThumbnailPhotoFormat = (NSDictionary *)objc_msgSend(v55, "initWithObjectsAndKeys:", v54, v51, v56, v57, v58, *MEMORY[0x1E0CF2CB8], 0);
            v53 = surface;
          }
        }
      }
      v59 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
      if (v53 && (v44 || -[AVCapturePhoto _isUncompressedYUVOrRGBPhoto](v35, "_isUncompressedYUVOrRGBPhoto")))
        CVPixelBufferCreateWithIOSurface(*v59, v53, 0, &v35->_internal->photoPixelBuffer);
      if (v69)
        CVPixelBufferCreateWithIOSurface(*v59, v69, 0, &v35->_internal->previewPixelBuffer);
      if (v70)
        CVPixelBufferCreateWithIOSurface(*v59, v70, 0, &v35->_internal->embeddedThumbnailSourcePixelBuffer);
      if (a10)
      {
        pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a10, 0, &pixelBufferOut);
        v60 = [AVDepthData alloc];
        v35->_internal->depthData = -[AVDepthData initWithPixelBuffer:depthMetadataDictionary:](v60, "initWithPixelBuffer:depthMetadataDictionary:", pixelBufferOut, a11);
        if (pixelBufferOut)
          CFRelease(pixelBufferOut);
      }
      if (a12)
      {
        pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a12, 0, &pixelBufferOut);
        v61 = [AVPortraitEffectsMatte alloc];
        v35->_internal->portraitEffectsMatte = -[AVPortraitEffectsMatte initWithPixelBuffer:portraitEffectsMatteMetadataDictionary:](v61, "initWithPixelBuffer:portraitEffectsMatteMetadataDictionary:", pixelBufferOut, a13);
        if (pixelBufferOut)
          CFRelease(pixelBufferOut);
      }
      if (a14)
      {
        pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a14, 0, &pixelBufferOut);
        v62 = [AVSemanticSegmentationMatte alloc];
        v35->_internal->hairSegmentationMatte = -[AVSemanticSegmentationMatte initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:](v62, "initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:", CFSTR("AVSemanticSegmentationMatteTypeHair"), pixelBufferOut, a15);
        if (pixelBufferOut)
          CFRelease(pixelBufferOut);
      }
      if (a16)
      {
        pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a16, 0, &pixelBufferOut);
        v63 = [AVSemanticSegmentationMatte alloc];
        v35->_internal->skinSegmentationMatte = -[AVSemanticSegmentationMatte initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:](v63, "initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:", CFSTR("AVSemanticSegmentationMatteTypeSkin"), pixelBufferOut, a17);
        if (pixelBufferOut)
          CFRelease(pixelBufferOut);
      }
      if (a18)
      {
        pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a18, 0, &pixelBufferOut);
        v64 = [AVSemanticSegmentationMatte alloc];
        v35->_internal->teethSegmentationMatte = -[AVSemanticSegmentationMatte initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:](v64, "initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:", CFSTR("AVSemanticSegmentationMatteTypeTeeth"), pixelBufferOut, a19);
        if (pixelBufferOut)
          CFRelease(pixelBufferOut);
      }
      if (a20)
      {
        pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a20, 0, &pixelBufferOut);
        v65 = [AVSemanticSegmentationMatte alloc];
        v35->_internal->glassesSegmentationMatte = -[AVSemanticSegmentationMatte initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:](v65, "initWithType:pixelBuffer:semanticSegmentationMatteMetadataDictionary:", CFSTR("AVSemanticSegmentationMatteTypeGlasses"), pixelBufferOut, a21);
        if (pixelBufferOut)
          CFRelease(pixelBufferOut);
      }
      if (a22)
      {
        pixelBufferOut = 0;
        CVPixelBufferCreateWithIOSurface(*v59, a22, 0, &pixelBufferOut);
        v35->_internal->constantColorConfidenceMap = pixelBufferOut;
        if (a23)
        {
          objc_msgSend((id)objc_msgSend(a23, "objectForKeyedSubscript:", *MEMORY[0x1E0D051D0]), "floatValue");
          v35->_internal->constantColorCenterWeightedMeanConfidenceLevel = v66;
        }
      }
      v67 = -[AVCapturePhotoSettings isCameraCalibrationDataDeliveryEnabled](v35->_internal->unresolvedSettings, "isCameraCalibrationDataDeliveryEnabled");
      if (a11 && v67)
        v35->_internal->cameraCalibrationData = -[AVCameraCalibrationData initWithDepthMetadataDictionary:]([AVCameraCalibrationData alloc], "initWithDepthMetadataDictionary:", a11);
    }
    else
    {

      return 0;
    }
  }
  return v35;
}

- (void)dealloc
{
  AVCapturePhotoInternal *internal;
  __IOSurface *photoSurface;
  __CVBuffer *photoPixelBuffer;
  AVCapturePhotoInternal *v6;
  __CVBuffer *previewPixelBuffer;
  __CVBuffer *embeddedThumbnailSourcePixelBuffer;
  AVCapturePhotoInternal *v9;
  __CVBuffer *constantColorConfidenceMap;
  objc_super v11;

  internal = self->_internal;
  if (internal)
  {
    photoSurface = internal->photoSurface;
    if (photoSurface)
    {
      CFRelease(photoSurface);
      internal = self->_internal;
    }
    photoPixelBuffer = internal->photoPixelBuffer;
    if (photoPixelBuffer)
    {
      CFRelease(photoPixelBuffer);
      internal = self->_internal;
    }

    v6 = self->_internal;
    previewPixelBuffer = v6->previewPixelBuffer;
    if (previewPixelBuffer)
    {
      CFRelease(previewPixelBuffer);
      v6 = self->_internal;
    }
    embeddedThumbnailSourcePixelBuffer = v6->embeddedThumbnailSourcePixelBuffer;
    if (embeddedThumbnailSourcePixelBuffer)
    {
      CFRelease(embeddedThumbnailSourcePixelBuffer);
      v6 = self->_internal;
    }

    v9 = self->_internal;
    constantColorConfidenceMap = v9->constantColorConfidenceMap;
    if (constantColorConfidenceMap)
    {
      CFRelease(constantColorConfidenceMap);
      v9 = self->_internal;
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)AVCapturePhoto;
  -[AVCapturePhoto dealloc](&v11, sel_dealloc);
}

- (id)debugDescription
{
  uint64_t v3;
  _BOOL4 v4;
  AVCapturePhotoInternal *internal;
  const __CFString *v6;
  const __CFString *v7;
  __int128 v8;
  CMTime time;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend((id)-[AVCapturePhotoSettings bracketedSettings](self->_internal->unresolvedSettings, "bracketedSettings"), "count");
  else
    v3 = 0;
  v4 = -[AVCapturePhoto isRawPhoto](self, "isRawPhoto");
  internal = self->_internal;
  if (internal->bracketSettings)
  {
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" bracket:%d/%d lens:%d %@"), internal->sequenceCount, v3, -[AVCapturePhoto lensStabilizationStatus](self, "lensStabilizationStatus"), -[AVCaptureBracketedStillImageSettings debugDescription](self->_internal->bracketSettings, "debugDescription"));
    internal = self->_internal;
  }
  else
  {
    v6 = &stru_1E421DB28;
  }
  if (v4)
    v7 = CFSTR(" (raw)");
  else
    v7 = &stru_1E421DB28;
  v8 = *(_OWORD *)&internal->timestamp.value;
  time.epoch = internal->timestamp.epoch;
  *(_OWORD *)&time.value = v8;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pts:%f %d/%d%@%@ settings:%@"), CMTimeGetSeconds(&time), self->_internal->photoCount, -[AVCaptureResolvedPhotoSettings expectedPhotoCount](self->_internal->resolvedSettings, "expectedPhotoCount"), v7, v6, -[AVCaptureResolvedPhotoSettings debugDescription](self->_internal->resolvedSettings, "debugDescription"));
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCapturePhoto debugDescription](self, "debugDescription"));
}

- (CMTime)timestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale + 8);
  return self;
}

- (BOOL)isRawPhoto
{
  return -[AVCapturePhoto _isSushiRAWPhoto](self, "_isSushiRAWPhoto")
      || -[AVCapturePhoto _isProRAWPhoto](self, "_isProRAWPhoto");
}

- (CVPixelBufferRef)pixelBuffer
{
  AVCapturePhotoInternal *internal;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (-[AVCapturePhoto _isProRAWPhoto](self, "_isProRAWPhoto"))
  {
    internal = self->_internal;
    if (internal->photoSurface)
    {
      if (!internal->photoPixelBuffer)
      {
        v5 = *MEMORY[0x1E0D09508];
        v6[0] = &unk_1E424CA08;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
        CMPhotoDNGUnpack();
      }
    }
  }
  return self->_internal->photoPixelBuffer;
}

- (CVPixelBufferRef)previewPixelBuffer
{
  return self->_internal->previewPixelBuffer;
}

- (NSDictionary)embeddedThumbnailPhotoFormat
{
  return self->_internal->embeddedThumbnailPhotoFormat;
}

- (AVDepthData)depthData
{
  AVCapturePhotoInternal *internal;
  AVDepthData *depthData;

  internal = self->_internal;
  depthData = internal->depthData;
  if (depthData)
    return depthData;
  if (!-[AVCapturePhotoSettings isDepthDataDeliveryEnabled](internal->unresolvedSettings, "isDepthDataDeliveryEnabled"))
    return 0;
  if (!self->_internal->didTryToDecodeDepthData
    && -[AVCapturePhoto _isCompressedPhoto](self, "_isCompressedPhoto")
    && !avcp_copyFirstAuxiliaryImageOfType())
  {
    self->_internal->depthData = -[AVDepthData initWithPixelBuffer:auxiliaryMetadata:]([AVDepthData alloc], "initWithPixelBuffer:auxiliaryMetadata:", 0, 0);
  }
  self->_internal->didTryToDecodeDepthData = 1;
  return self->_internal->depthData;
}

- (AVPortraitEffectsMatte)portraitEffectsMatte
{
  AVCapturePhotoInternal *internal;
  AVPortraitEffectsMatte *portraitEffectsMatte;

  internal = self->_internal;
  portraitEffectsMatte = internal->portraitEffectsMatte;
  if (portraitEffectsMatte)
    return portraitEffectsMatte;
  if (!-[AVCapturePhotoSettings isPortraitEffectsMatteDeliveryEnabled](internal->unresolvedSettings, "isPortraitEffectsMatteDeliveryEnabled"))return 0;
  if (!self->_internal->didTryToDecodePortraitEffectsMatte)
  {
    if (-[AVCapturePhoto _isCompressedPhoto](self, "_isCompressedPhoto"))
      avcp_copyFirstAuxiliaryImageOfType();
  }
  self->_internal->didTryToDecodePortraitEffectsMatte = 1;
  return self->_internal->portraitEffectsMatte;
}

- (AVSemanticSegmentationMatte)semanticSegmentationMatteForType:(AVSemanticSegmentationMatteType)semanticSegmentationMatteType
{
  AVCapturePhotoInternal *internal;
  id *p_skinSegmentationMatte;
  BOOL *p_didTryToDecodeSkinSegmentationMatte;

  if (-[NSString isEqual:](semanticSegmentationMatteType, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeSkin")))
  {
    internal = self->_internal;
    p_skinSegmentationMatte = (id *)&internal->skinSegmentationMatte;
    p_didTryToDecodeSkinSegmentationMatte = &internal->didTryToDecodeSkinSegmentationMatte;
  }
  else if (-[NSString isEqual:](semanticSegmentationMatteType, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeHair")))
  {
    internal = self->_internal;
    p_skinSegmentationMatte = (id *)&internal->hairSegmentationMatte;
    p_didTryToDecodeSkinSegmentationMatte = &internal->didTryToDecodeHairSegmentationMatte;
  }
  else if (-[NSString isEqual:](semanticSegmentationMatteType, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeTeeth")))
  {
    internal = self->_internal;
    p_skinSegmentationMatte = (id *)&internal->teethSegmentationMatte;
    p_didTryToDecodeSkinSegmentationMatte = &internal->didTryToDecodeTeethSegmentationMatte;
  }
  else
  {
    if (!-[NSString isEqual:](semanticSegmentationMatteType, "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeGlasses")))return 0;
    internal = self->_internal;
    p_skinSegmentationMatte = (id *)&internal->glassesSegmentationMatte;
    p_didTryToDecodeSkinSegmentationMatte = &internal->didTryToDecodeGlassesSegmentationMatte;
  }
  if (*p_skinSegmentationMatte)
    return (AVSemanticSegmentationMatte *)*p_skinSegmentationMatte;
  if (!-[NSArray containsObject:](-[AVCapturePhotoSettings enabledSemanticSegmentationMatteTypes](internal->unresolvedSettings, "enabledSemanticSegmentationMatteTypes"), "containsObject:", semanticSegmentationMatteType))return 0;
  if (!*p_didTryToDecodeSkinSegmentationMatte)
  {
    if (-[AVCapturePhoto _isCompressedPhoto](self, "_isCompressedPhoto"))
      avcp_copyFirstAuxiliaryImageOfType();
  }
  *p_didTryToDecodeSkinSegmentationMatte = 1;
  return (AVSemanticSegmentationMatte *)*p_skinSegmentationMatte;
}

- (NSDictionary)metadata
{
  return self->_internal->metadata;
}

- (AVCameraCalibrationData)cameraCalibrationData
{
  return self->_internal->cameraCalibrationData;
}

- (AVCaptureResolvedPhotoSettings)resolvedSettings
{
  return self->_internal->resolvedSettings;
}

- (NSInteger)photoCount
{
  return self->_internal->photoCount;
}

- (AVCaptureDeviceType)sourceDeviceType
{
  id v3;
  float v4;
  float v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  float v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (-[NSArray count](-[AVCapturePhotoSettings virtualDeviceConstituentPhotoDeliveryEnabledDevices](self->_internal->unresolvedSettings, "virtualDeviceConstituentPhotoDeliveryEnabledDevices"), "count"))
  {
    v3 = -[NSDictionary objectForKeyedSubscript:](self->_internal->metadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB50]);
    objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCB80]), "floatValue");
    v5 = v4;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = -[AVCapturePhotoSettings virtualDeviceConstituentPhotoDeliveryEnabledDevices](self->_internal->unresolvedSettings, "virtualDeviceConstituentPhotoDeliveryEnabledDevices", 0);
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v11, "lensAperture");
          if (v5 == v12)
            return (AVCaptureDeviceType)objc_msgSend(v11, "deviceType");
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }
  }
  return self->_internal->sourceDeviceType;
}

- (NSData)fileDataRepresentation
{
  NSDictionary *v3;
  NSData *v4;
  NSData *v5;
  NSData *v6;
  NSData *v7;
  NSDictionary *v9;
  uint64_t v10;
  CGImage *v11;

  if (!self->_internal->photoSurface)
    return 0;
  if (!-[AVCapturePhoto _isSushiRAWPhoto](self, "_isSushiRAWPhoto"))
  {
    if (-[AVCapturePhoto _isCompressedPhoto](self, "_isCompressedPhoto"))
    {
      IOSurfaceLock(self->_internal->photoSurface, 1u, 0);
      v7 = (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", IOSurfaceGetBaseAddress(self->_internal->photoSurface), self->_internal->photoSurfaceSize);
      IOSurfaceUnlock(self->_internal->photoSurface, 1u, 0);
      return v7;
    }
    if (-[AVCapturePhoto _isUncompressedYUVOrRGBPhoto](self, "_isUncompressedYUVOrRGBPhoto"))
    {
      v9 = -[AVCapturePhoto embeddedThumbnailPhotoFormat](self, "embeddedThumbnailPhotoFormat");
      v10 = -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]);
      v11 = avcp_copyCGImageForUncompressedBuffer(self->_internal->photoPixelBuffer);
      v5 = (NSData *)avcp_copyTIFFFileDataRepresentationForImage(v11, (const __CFDictionary *)-[AVCapturePhoto metadata](self, "metadata"), v10);
      if (v11)
        CFRelease(v11);
      v4 = v5;
      goto LABEL_4;
    }
    return 0;
  }
  v3 = -[AVCapturePhoto embeddedThumbnailPhotoFormat](self, "embeddedThumbnailPhotoFormat");
  v4 = (NSData *)avcp_copyDNGFileDataRepresentationForSushiRawBuffer((uint64_t)-[AVCapturePhoto pixelBuffer](self, "pixelBuffer"), (uint64_t)-[AVCapturePhoto _embeddedThumbnailSourcePixelBuffer](self, "_embeddedThumbnailSourcePixelBuffer"), (uint64_t)-[AVCapturePhoto metadata](self, "metadata"), -[AVCapturePhoto depthData](self, "depthData"), (uint64_t)-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]), -[AVCaptureResolvedPhotoSettings rawEmbeddedThumbnailDimensions](self->_internal->resolvedSettings, "rawEmbeddedThumbnailDimensions"));
  v5 = v4;
LABEL_4:
  v6 = v4;
  return v5;
}

- (NSData)fileDataRepresentationWithReplacementMetadata:(NSDictionary *)replacementMetadata replacementEmbeddedThumbnailPhotoFormat:(NSDictionary *)replacementEmbeddedThumbnailPhotoFormat replacementEmbeddedThumbnailPixelBuffer:(CVPixelBufferRef)replacementEmbeddedThumbnailPixelBuffer replacementDepthData:(AVDepthData *)replacementDepthData
{
  AVPortraitEffectsMatte *v11;
  NSData *v12;
  void *v13;
  uint64_t v15;

  v15 = 0;
  v11 = 0;
  if (-[AVCapturePhoto depthData](self, "depthData") == replacementDepthData)
    v11 = -[AVCapturePhoto portraitEffectsMatte](self, "portraitEffectsMatte");
  v12 = -[AVCapturePhoto _fileDataRepresentationWithReplacementMetadata:replacementEmbeddedThumbnailPhotoFormat:replacementEmbeddedThumbnailPixelBuffer:replacementDepthData:replacementPortraitEffectsMatte:replacementHairSegmentationMatte:replacementSkinSegmentationMatte:replacementTeethSegmentationMatte:replacementGlassesSegmentationMatte:replacementRawCompressionSettings:exceptionReason:](self, "_fileDataRepresentationWithReplacementMetadata:replacementEmbeddedThumbnailPhotoFormat:replacementEmbeddedThumbnailPixelBuffer:replacementDepthData:replacementPortraitEffectsMatte:replacementHairSegmentationMatte:replacementSkinSegmentationMatte:replacementTeethSegmentationMatte:replacementGlassesSegmentationMatte:replacementRawCompressionSettings:exceptionReason:", replacementMetadata, replacementEmbeddedThumbnailPhotoFormat, replacementEmbeddedThumbnailPixelBuffer, replacementDepthData, v11, -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeHair")), -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeSkin")), -[AVCapturePhoto semanticSegmentationMatteForType:](
            self,
            "semanticSegmentationMatteForType:",
            CFSTR("AVSemanticSegmentationMatteTypeTeeth")),
          -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeGlasses")), 0, &v15);
  if (v15)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v13);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v13);
  }
  return v12;
}

- (NSData)fileDataRepresentationWithCustomizer:(id)customizer
{
  NSDictionary *v5;
  AVSemanticSegmentationMatte *v6;
  AVSemanticSegmentationMatte *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSData *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSDictionary *v15;
  AVDepthData *v16;
  AVPortraitEffectsMatte *v17;
  void *v18;
  AVSemanticSegmentationMatte *v20;
  AVSemanticSegmentationMatte *v21;
  AVPortraitEffectsMatte *v22;
  AVDepthData *v23;
  uint64_t v24;
  NSDictionary *v25;

  v5 = -[AVCapturePhoto metadata](self, "metadata");
  v25 = -[AVCapturePhoto embeddedThumbnailPhotoFormat](self, "embeddedThumbnailPhotoFormat");
  v23 = -[AVCapturePhoto depthData](self, "depthData");
  v22 = -[AVCapturePhoto portraitEffectsMatte](self, "portraitEffectsMatte");
  v21 = -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeHair"));
  v20 = -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeSkin"));
  v6 = -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeTeeth"));
  v7 = -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeGlasses"));
  if (customizer)
  {
    v8 = (uint64_t)v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = (NSDictionary *)objc_msgSend(customizer, "replacementMetadataForPhoto:", self);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = objc_msgSend(customizer, "replacementEmbeddedThumbnailPixelBufferWithPhotoFormat:forPhoto:", &v25, self);
    else
      v9 = 0;
    if (-[AVCapturePhoto _isProRAWPhoto](self, "_isProRAWPhoto"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v12 = objc_msgSend(customizer, "replacementAppleProRAWCompressionSettingsForPhoto:defaultSettings:maximumBitDepth:", self, -[AVCapturePhoto _defaultRawCompressionSettings](self, "_defaultRawCompressionSettings"), -[AVCapturePhoto _maximumAppleProRAWBitDepth](self, "_maximumAppleProRAWBitDepth"));
LABEL_19:
        v14 = (uint64_t)v20;
        v15 = v5;
        v17 = v22;
        v16 = v23;
        v13 = (uint64_t)v21;
LABEL_20:
        v24 = 0;
        v11 = -[AVCapturePhoto _fileDataRepresentationWithReplacementMetadata:replacementEmbeddedThumbnailPhotoFormat:replacementEmbeddedThumbnailPixelBuffer:replacementDepthData:replacementPortraitEffectsMatte:replacementHairSegmentationMatte:replacementSkinSegmentationMatte:replacementTeethSegmentationMatte:replacementGlassesSegmentationMatte:replacementRawCompressionSettings:exceptionReason:](self, "_fileDataRepresentationWithReplacementMetadata:replacementEmbeddedThumbnailPhotoFormat:replacementEmbeddedThumbnailPixelBuffer:replacementDepthData:replacementPortraitEffectsMatte:replacementHairSegmentationMatte:replacementSkinSegmentationMatte:replacementTeethSegmentationMatte:replacementGlassesSegmentationMatte:replacementRawCompressionSettings:exceptionReason:", v15, v25, v9, v16, v17, v13, v14, v6, v8, v12, &v24);
        if (v24)
        {
          v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
          if (AVCaptureShouldThrowForAPIViolations())
            objc_exception_throw(v18);
          NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v18);
        }
        return v11;
      }
    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v23 = (AVDepthData *)objc_msgSend(customizer, "replacementDepthDataForPhoto:", self);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v22 = (AVPortraitEffectsMatte *)objc_msgSend(customizer, "replacementPortraitEffectsMatteForPhoto:", self);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v13 = objc_msgSend(customizer, "replacementSemanticSegmentationMatteOfType:forPhoto:", CFSTR("AVSemanticSegmentationMatteTypeHair"), self);
        v14 = objc_msgSend(customizer, "replacementSemanticSegmentationMatteOfType:forPhoto:", CFSTR("AVSemanticSegmentationMatteTypeSkin"), self);
        v6 = (AVSemanticSegmentationMatte *)objc_msgSend(customizer, "replacementSemanticSegmentationMatteOfType:forPhoto:", CFSTR("AVSemanticSegmentationMatteTypeTeeth"), self);
        v8 = objc_msgSend(customizer, "replacementSemanticSegmentationMatteOfType:forPhoto:", CFSTR("AVSemanticSegmentationMatteTypeGlasses"), self);
        v12 = 0;
        v15 = v5;
        v17 = v22;
        v16 = v23;
        goto LABEL_20;
      }
    }
    v12 = 0;
    goto LABEL_19;
  }
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v10);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
  return 0;
}

- (CGImageRef)CGImageRepresentation
{
  CGImage *ImageAtIndex;
  NSData *v4;
  NSString *processedFileType;
  CGImageSource *v6;
  CGImageSource *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[AVCapturePhoto _isSushiRAWPhoto](self, "_isSushiRAWPhoto"))
    return 0;
  if (-[AVCapturePhoto _isUncompressedYUVOrRGBPhoto](self, "_isUncompressedYUVOrRGBPhoto"))
  {
    ImageAtIndex = avcp_copyCGImageForUncompressedBuffer(self->_internal->photoPixelBuffer);
    if (!ImageAtIndex)
      return ImageAtIndex;
    goto LABEL_9;
  }
  if (!-[AVCapturePhoto _isCompressedPhoto](self, "_isCompressedPhoto"))
    return 0;
  v4 = -[AVCapturePhoto fileDataRepresentation](self, "fileDataRepresentation");
  if (!v4)
    return 0;
  processedFileType = self->_internal->processedFileType;
  v9 = *MEMORY[0x1E0CBD2A8];
  v10[0] = processedFileType;
  v6 = CGImageSourceCreateWithData((CFDataRef)v4, (CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1));
  if (!v6)
    return 0;
  v7 = v6;
  ImageAtIndex = CGImageSourceCreateImageAtIndex(v6, 0, 0);
  CFRelease(v7);
  if (ImageAtIndex)
LABEL_9:
    CFAutorelease(ImageAtIndex);
  return ImageAtIndex;
}

- (CGImageRef)previewCGImageRepresentation
{
  __CVBuffer *previewPixelBuffer;
  __CVBuffer *v3;
  CGImage *v4;

  previewPixelBuffer = self->_internal->previewPixelBuffer;
  if (!previewPixelBuffer)
    return 0;
  v3 = avcp_copyCGImageForUncompressedBuffer(previewPixelBuffer);
  v4 = v3;
  if (v3)
    CFAutorelease(v3);
  return v4;
}

- (AVCaptureBracketedStillImageSettings)bracketSettings
{
  return self->_internal->bracketSettings;
}

- (NSInteger)sequenceCount
{
  return self->_internal->sequenceCount;
}

- (AVCaptureLensStabilizationStatus)lensStabilizationStatus
{
  AVCapturePhotoSettings *unresolvedSettings;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;

  if (!self->_internal->lensStabilizationSupported)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    unresolvedSettings = self->_internal->unresolvedSettings;
  else
    unresolvedSettings = 0;
  if (!-[AVCapturePhotoSettings isLensStabilizationEnabled](unresolvedSettings, "isLensStabilizationEnabled"))return 1;
  v5 = *MEMORY[0x1E0CBCF70];
  v6 = -[NSDictionary objectForKeyedSubscript:](self->_internal->metadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v7 = objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D03D70]);
  v8 = -[NSDictionary objectForKeyedSubscript:](self->_internal->metadata, "objectForKeyedSubscript:", v5);
  v9 = objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D03DB8]);
  if (!(v7 | v9))
    return 4;
  v10 = (void *)v9;
  v11 = objc_msgSend((id)v7, "intValue");
  if ((objc_msgSend(v10, "intValue") & 6) != 0)
    return 3;
  if ((v11 - 1) <= 4)
    return qword_19EEEA020[v11 - 1];
  else
    return 4;
}

- (unsigned)photoProcessingFlags
{
  return self->_internal->expectedPhotoProcessingFlags;
}

- (unsigned)expectedPhotoProcessingFlags
{
  return self->_internal->expectedPhotoProcessingFlags;
}

- (unsigned)actualPhotoProcessingFlags
{
  return self->_internal->actualPhotoProcessingFlags;
}

- (id)livePhotoMovieFileURL
{
  AVCapturePhotoInternal *internal;
  AVCapturePhotoSettings *unresolvedSettings;

  internal = self->_internal;
  unresolvedSettings = internal->unresolvedSettings;
  if ((internal->expectedPhotoProcessingFlags & 1) != 0)
    return -[AVCapturePhotoSettings livePhotoMovieFileURLForOriginalPhoto](unresolvedSettings, "livePhotoMovieFileURLForOriginalPhoto");
  else
    return -[AVCapturePhotoSettings livePhotoMovieFileURL](unresolvedSettings, "livePhotoMovieFileURL");
}

- (id)privateClientMetadata
{
  return self->_internal->privateClientMetadata;
}

- (id)processedFileType
{
  return self->_internal->processedFileType;
}

- (id)portraitMetadata
{
  return self->_internal->portraitMetadata;
}

- (float)focusPixelBlurScore
{
  id v2;
  void *v3;
  float result;

  v2 = -[NSDictionary objectForKeyedSubscript:](self->_internal->metadata, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v3 = (void *)objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D03D08]);
  if (!v3)
    return NAN;
  objc_msgSend(v3, "floatValue");
  return result;
}

- (__CVBuffer)constantColorConfidenceMap
{
  return self->_internal->constantColorConfidenceMap;
}

- (float)constantColorCenterWeightedMeanConfidenceLevel
{
  return self->_internal->constantColorCenterWeightedMeanConfidenceLevel;
}

- (BOOL)isConstantColorFallbackPhoto
{
  _BOOL4 v3;

  v3 = -[AVCapturePhotoSettings isConstantColorEnabled](self->_internal->unresolvedSettings, "isConstantColorEnabled");
  if (v3)
    LOBYTE(v3) = self->_internal->constantColorConfidenceMap == 0;
  return v3;
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)-[AVCaptureResolvedPhotoSettings photoDimensions](self->_internal->resolvedSettings, "photoDimensions");
}

+ (id)AVFileTypeFromFigCaptureStillImageSettingsFileType:(int)a3 codec:(unsigned int)a4 unresolvedSettings:(id)a5
{
  id *v5;
  id result;
  id *v7;

  if (a3 <= 1751476581)
  {
    if (a3 == 1684956519)
    {
      v5 = (id *)MEMORY[0x1E0CF2AE0];
    }
    else
    {
      if (a3 != 1751476579)
        goto LABEL_13;
      v5 = (id *)MEMORY[0x1E0CF2AE8];
    }
  }
  else
  {
    switch(a3)
    {
      case 1953064550:
        v5 = (id *)MEMORY[0x1E0CF2B10];
        break;
      case 1785096550:
        v5 = (id *)MEMORY[0x1E0CF2AF8];
        break;
      case 1751476582:
        v5 = (id *)MEMORY[0x1E0CF2AF0];
        break;
      default:
        goto LABEL_13;
    }
  }
  result = *v5;
  if (*v5)
    return result;
LABEL_13:
  if ((int)a4 > 1635148592)
  {
    switch(a4)
    {
      case 0x61766331u:
        v7 = (id *)MEMORY[0x1E0CF2AC0];
        break;
      case 0x6A706567u:
        v7 = (id *)MEMORY[0x1E0CF2AF8];
        break;
      case 0x68766331u:
        v7 = (id *)MEMORY[0x1E0CF2AE8];
        break;
      default:
        return (id)objc_msgSend(a5, "processedFileType");
    }
  }
  else
  {
    if (a4 != 875704422 && a4 != 875704438 && a4 != 1111970369)
      return (id)objc_msgSend(a5, "processedFileType");
    v7 = (id *)MEMORY[0x1E0CF2B10];
  }
  result = *v7;
  if (!*v7)
    return (id)objc_msgSend(a5, "processedFileType");
  return result;
}

- (BOOL)_isCompressedPhoto
{
  AVCapturePhotoInternal *internal;
  NSString *processedFileType;
  NSDictionary *v6;
  AVCapturePhotoInternal *v7;

  if (-[AVCapturePhoto _isSushiRAWPhoto](self, "_isSushiRAWPhoto"))
    return 0;
  internal = self->_internal;
  processedFileType = internal->processedFileType;
  if (processedFileType)
  {
    if (!-[NSString isEqualToString:](processedFileType, "isEqualToString:", *MEMORY[0x1E0CF2B10]))
      return 1;
    internal = self->_internal;
  }
  v6 = -[AVCapturePhotoSettings format](internal->unresolvedSettings, "format");
  if (-[NSDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]))
    return 1;
  v7 = self->_internal;
  if (!v7->unresolvedSettings)
  {
    if (v7->photoSurface)
      return 1;
  }
  return -[AVCapturePhoto _isProRAWPhoto](self, "_isProRAWPhoto");
}

- (BOOL)_isUncompressedYUVOrRGBPhoto
{
  NSDictionary *v3;
  uint64_t v4;

  v3 = -[AVCapturePhotoSettings format](self->_internal->unresolvedSettings, "format");
  v4 = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]);
  if (v4)
  {
    if (-[AVCapturePhoto _isCompressedPhoto](self, "_isCompressedPhoto"))
      LOBYTE(v4) = 0;
    else
      LOBYTE(v4) = !-[AVCapturePhoto _isSushiRAWPhoto](self, "_isSushiRAWPhoto");
  }
  return v4;
}

- (BOOL)_isProRAWPhoto
{
  return BYTE2(self->_internal->expectedPhotoProcessingFlags) & 1;
}

- (BOOL)_isSushiRAWPhoto
{
  return LOBYTE(self->_internal->expectedPhotoProcessingFlags) >> 7;
}

- (__CVBuffer)_embeddedThumbnailSourcePixelBuffer
{
  AVCapturePhotoInternal *internal;
  __CVBuffer *result;

  internal = self->_internal;
  result = internal->embeddedThumbnailSourcePixelBuffer;
  if (!result)
    return internal->previewPixelBuffer;
  return result;
}

- (unsigned)_orientation
{
  NSDictionary *v2;
  id v3;

  v2 = -[AVCapturePhoto metadata](self, "metadata");
  v3 = -[NSDictionary objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]);
  if (v3)
    return objc_msgSend(v3, "intValue");
  else
    return 1;
}

- (int)_maximumAppleProRAWBitDepth
{
  uint64_t v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  if (-[AVCapturePhoto _isProRAWPhoto](self, "_isProRAWPhoto") && self->_internal->photoSurface)
  {
    v4 = *MEMORY[0x1E0D09510];
    v5[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    CMPhotoDNGUnpack();
  }
  return 12;
}

- (id)_defaultRawCompressionSettings
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CF2C40];
  v4[0] = *MEMORY[0x1E0CF2CE0];
  v4[1] = v2;
  v5[0] = &unk_1E424D2D8;
  v5[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[AVCapturePhoto _maximumAppleProRAWBitDepth](self, "_maximumAppleProRAWBitDepth"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
}

- (id)_fileDataRepresentationWithReplacementMetadata:(id)a3 replacementEmbeddedThumbnailPhotoFormat:(id)a4 replacementEmbeddedThumbnailPixelBuffer:(__CVBuffer *)a5 replacementDepthData:(id)a6 replacementPortraitEffectsMatte:(id)a7 replacementHairSegmentationMatte:(id)a8 replacementSkinSegmentationMatte:(id)a9 replacementTeethSegmentationMatte:(id)a10 replacementGlassesSegmentationMatte:(id)a11 replacementRawCompressionSettings:(id)a12 exceptionReason:(id *)a13
{
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSArray *v23;
  BOOL v24;
  const void *v25;
  id v26;
  CFMutableDataRef v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  double v33;
  int v34;
  __CVBuffer *v35;
  int v36;
  NSDictionary *v37;
  BOOL v38;
  int v39;
  AVSemanticSegmentationMatte *v40;
  uint64_t v41;
  char v42;
  void *v43;
  void *v44;
  _BOOL4 v45;
  _BOOL4 v46;
  NSDictionary *v47;
  uint64_t v48;
  id v49;
  AVDepthData *v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  int v54;
  int v55;
  uint64_t v56;
  int v57;
  int v58;
  uint64_t v59;
  unsigned int v60;
  unsigned int v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
  uint64_t v67;
  void *v68;
  __CVBuffer *v69;
  uint64_t v70;
  unsigned int v71;
  __CFData *v72;
  NSDictionary *v73;
  uint64_t v74;
  CGImage *v75;
  __CFData *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t photoSurfaceSize;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int v84;
  void *v85;
  CGImageMetadata *v86;
  uint64_t v87;
  CGImageMetadata *v88;
  uint64_t v89;
  const void *v90;
  uint64_t v91;
  uint64_t v92;
  const void *v93;
  uint64_t v94;
  uint64_t v95;
  const void *v96;
  uint64_t v97;
  uint64_t v98;
  const void *v99;
  uint64_t v100;
  uint64_t v101;
  __CFString *v102;
  uint64_t v104;
  const __CFString *v105;
  AVSemanticSegmentationMatte *v106;
  unsigned __int8 v107;
  AVDepthData *v108;
  unsigned int v109;
  AVDepthData *v110;
  AVPortraitEffectsMatte *v111;
  AVSemanticSegmentationMatte *v112;
  AVSemanticSegmentationMatte *v113;
  AVSemanticSegmentationMatte *v114;
  unsigned int v115;
  __CVBuffer *v116;
  AVPortraitEffectsMatte *v118;
  unint64_t v119;
  __CFString *v120;
  const void *v121;
  _QWORD v122[2];
  _QWORD v123[3];
  _QWORD v124[2];
  _QWORD v125[2];
  _QWORD v126[4];
  id v127[6];

  v127[4] = *(id *)MEMORY[0x1E0C80C00];
  v120 = 0;
  v19 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", +[AVCapturePhotoOutput validMetadataTopLevelCGImagePropertiesKeys](AVCapturePhotoOutput, "validMetadataTopLevelCGImagePropertiesKeys"));
  v20 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a3, "allKeys"));
  objc_msgSend(v20, "minusSet:", v19);
  if (objc_msgSend(v20, "count"))
  {
    v102 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("replacementMetadata contains invalid keys: %@"), v20);
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v120 = v102;
    if (!v102)
      goto LABEL_185;
    goto LABEL_184;
  }
  v118 = (AVPortraitEffectsMatte *)a7;
  v116 = a5;
  if (!a4)
  {
    if (a5)
    {
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v102 = CFSTR("If you specify a replacementEmbeddedThumbnailPixelBuffer, you must also specify a replacementEmbeddedThumbnailPhotoFormat");
      goto LABEL_206;
    }
LABEL_10:
    if (a6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v102 = CFSTR("replacementDepthData must be an instance of AVDepthData");
    }
    else
    {
      if (a7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementPortraitEffectsMatte must be an instance of AVPortraitEffectsMatte");
          goto LABEL_206;
        }
        if (!a6)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("If you wish to include a portrait effects matte in the file data representation, you must also include depth data");
          goto LABEL_206;
        }
      }
      if (a8)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementHairSegmentationMatte must be an instance of AVSemanticSegmentationMatte");
          goto LABEL_206;
        }
        if ((objc_msgSend((id)objc_msgSend(a8, "matteType"), "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeHair")) & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementHairSegmentationMatte must have a matteType of AVSemanticSegmentationMatteTypeHair");
          goto LABEL_206;
        }
      }
      if (a9)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementSkinSegmentationMatte must be an instance of AVSemanticSegmentationMatte");
          goto LABEL_206;
        }
        if ((objc_msgSend((id)objc_msgSend(a9, "matteType"), "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeSkin")) & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementSkinSegmentationMatte must have a matteType of AVSemanticSegmentationMatteTypeSkin");
          goto LABEL_206;
        }
      }
      if (a10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementTeethSegmentationMatte must be an instance of AVSemanticSegmentationMatte");
          goto LABEL_206;
        }
        if ((objc_msgSend((id)objc_msgSend(a10, "matteType"), "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeTeeth")) & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementTeethSegmentationMatte must have a matteType of AVSemanticSegmentationMatteTypeTeeth");
          goto LABEL_206;
        }
      }
      if (a11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementGlassesSegmentationMatte must be an instance of AVSemanticSegmentationMatte");
          goto LABEL_206;
        }
        if ((objc_msgSend((id)objc_msgSend(a11, "matteType"), "isEqual:", CFSTR("AVSemanticSegmentationMatteTypeGlasses")) & 1) == 0)
        {
          v27 = 0;
          v26 = 0;
          v25 = 0;
          v102 = CFSTR("replacementGlassesSegmentationMatte must have a matteType of AVSemanticSegmentationMatteTypeGlasses");
          goto LABEL_206;
        }
      }
      if (!a12)
      {
        v32 = -[AVCapturePhoto _defaultRawCompressionSettings](self, "_defaultRawCompressionSettings");
        v35 = v116;
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v28 = *MEMORY[0x1E0CF2CE0];
        v29 = *MEMORY[0x1E0CF2C40];
        v122[0] = *MEMORY[0x1E0CF2CE0];
        v122[1] = v29;
        v30 = objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v122, 2));
        v31 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", objc_msgSend(a12, "allKeys"));
        objc_msgSend(v31, "minusSet:", v30);
        if (objc_msgSend(v31, "count"))
        {
          v104 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported keys specified: %@. Supported keys are %@"), v31, v30);
          v25 = 0;
          v26 = 0;
          v27 = 0;
          v120 = (__CFString *)v104;
          goto LABEL_183;
        }
        v32 = (id)objc_msgSend(-[AVCapturePhoto _defaultRawCompressionSettings](self, "_defaultRawCompressionSettings"), "mutableCopy");
        if (objc_msgSend(a12, "objectForKeyedSubscript:", v28))
        {
          objc_msgSend(a12, "objectForKeyedSubscript:", v28);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v105 = CFSTR("replacementAppleProRAWCompressionSettings[AVVideoQualityKey] must be an instance of NSNumber");
            goto LABEL_211;
          }
          objc_msgSend((id)objc_msgSend(a12, "objectForKeyedSubscript:", v28), "doubleValue");
          if (v33 < 0.0 || v33 > 1.0)
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v105 = CFSTR("replacementAppleProRAWCompressionSettings[AVVideoQualityKey] must be a value >= 0.0 and <= 1.0");
            goto LABEL_211;
          }
          objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(a12, "objectForKeyedSubscript:", v28), v28);
        }
        if (objc_msgSend(a12, "objectForKeyedSubscript:", v29))
        {
          objc_msgSend(a12, "objectForKeyedSubscript:", v29);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v34 = objc_msgSend((id)objc_msgSend(a12, "objectForKeyedSubscript:", v29), "intValue");
            v35 = v116;
            if (v34 >= 8 && v34 <= -[AVCapturePhoto _maximumAppleProRAWBitDepth](self, "_maximumAppleProRAWBitDepth"))
            {
              objc_msgSend(v32, "setObject:forKeyedSubscript:", objc_msgSend(a12, "objectForKeyedSubscript:", v29), v29);
              goto LABEL_42;
            }
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v105 = CFSTR("replacementAppleProRAWCompressionSettings[AVVideoAppleProRAWBitDepthKey] must be a value >= 8 and <= maximumBitDepth");
          }
          else
          {
            v25 = 0;
            v26 = 0;
            v27 = 0;
            v105 = CFSTR("replacementAppleProRAWCompressionSettings[AVVideoAppleProRAWBitDepthKey] must be an instance of NSNumber");
          }
LABEL_211:
          v120 = (__CFString *)v105;
          goto LABEL_183;
        }
        v35 = v116;
LABEL_42:
        v36 = objc_msgSend(v32, "isEqual:", -[AVCapturePhoto _defaultRawCompressionSettings](self, "_defaultRawCompressionSettings"));
        if (-[AVCapturePhoto metadata](self, "metadata") == a3)
          v115 = 0;
        else
          v115 = -[NSDictionary isEqual:](-[AVCapturePhoto metadata](self, "metadata"), "isEqual:", a3) ^ 1;
        v37 = -[AVCapturePhoto embeddedThumbnailPhotoFormat](self, "embeddedThumbnailPhotoFormat");
        if (v35)
          v38 = 0;
        else
          v38 = v37 == a4;
        v39 = !v38;
        v109 = v39;
        v110 = -[AVCapturePhoto depthData](self, "depthData");
        v111 = -[AVCapturePhoto portraitEffectsMatte](self, "portraitEffectsMatte");
        v112 = -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeHair"));
        v113 = -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeSkin"));
        v114 = -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeTeeth"));
        v40 = -[AVCapturePhoto semanticSegmentationMatteForType:](self, "semanticSegmentationMatteForType:", CFSTR("AVSemanticSegmentationMatteTypeGlasses"));
        v41 = *MEMORY[0x1E0CBCFF0];
        if (objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCFF0]))
          objc_msgSend(a3, "objectForKeyedSubscript:", v41);
        v42 = v115 | v109;
        if (v110 != a6)
          v42 = 1;
        if (v111 != a7)
          v42 = 1;
        if (v112 != a8)
          v42 = 1;
        if (v113 != a9)
          v42 = 1;
        if (v114 != a10)
          v42 = 1;
        if (!(v42 & 1 | (v40 != a11) | (v36 ^ 1) & 1))
          return -[AVCapturePhoto fileDataRepresentation](self, "fileDataRepresentation");
        if (!self->_internal->photoSurface)
          goto LABEL_118;
        v108 = (AVDepthData *)a6;
        v43 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        if (!v43)
          goto LABEL_118;
        v44 = v43;
        if (v110 != v108)
        {
          objc_msgSend(v43, "addObject:", *MEMORY[0x1E0D09258]);
          objc_msgSend(v44, "addObject:", *MEMORY[0x1E0D09270]);
        }
        if (v111 != a7)
          objc_msgSend(v44, "addObject:", *MEMORY[0x1E0D09278]);
        if (v112 != a8)
          objc_msgSend(v44, "addObject:", *MEMORY[0x1E0D09288]);
        if (v113 != a9)
          objc_msgSend(v44, "addObject:", *MEMORY[0x1E0D09290]);
        if (v114 != a10)
          objc_msgSend(v44, "addObject:", *MEMORY[0x1E0D092A0]);
        v106 = v40;
        if (v40 != a11)
          objc_msgSend(v44, "addObject:", *MEMORY[0x1E0D09280]);
        v45 = -[AVCapturePhoto _isSushiRAWPhoto](self, "_isSushiRAWPhoto");
        v46 = -[AVCapturePhoto _isProRAWPhoto](self, "_isProRAWPhoto");
        v47 = -[AVCapturePhotoSettings format](self->_internal->unresolvedSettings, "format");
        v48 = *MEMORY[0x1E0CF2C58];
        v49 = -[NSDictionary objectForKeyedSubscript:](v47, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C58]);
        v107 = objc_msgSend(v49, "isEqualToString:", *MEMORY[0x1E0CF2C90]);
        if (!-[NSDictionary objectForKeyedSubscript:](-[AVCapturePhotoSettings format](self->_internal->unresolvedSettings, "format"), "objectForKeyedSubscript:", v48)|| v45)
        {
          if (!v46)
          {
            if (v45)
            {
              if ((v115 & 1) == 0)
                a3 = -[AVCapturePhoto metadata](self, "metadata");
              v69 = v116;
              if ((v109 & 1) == 0)
              {
                v69 = -[AVCapturePhoto _embeddedThumbnailSourcePixelBuffer](self, "_embeddedThumbnailSourcePixelBuffer");
                a4 = -[AVCapturePhoto embeddedThumbnailPhotoFormat](self, "embeddedThumbnailPhotoFormat");
              }
              v70 = objc_msgSend(a4, "objectForKeyedSubscript:", v48);
              v71 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2D08]), "intValue");
              v72 = (__CFData *)avcp_copyDNGFileDataRepresentationForSushiRawBuffer((uint64_t)-[AVCapturePhoto pixelBuffer](self, "pixelBuffer"), (uint64_t)v69, (uint64_t)a3, 0, v70, v71 | (unint64_t)(objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CB8]), "intValue") << 32));
              v27 = v72;
            }
            else
            {
              v73 = -[AVCapturePhotoSettings format](self->_internal->unresolvedSettings, "format");
              if (!-[NSDictionary objectForKeyedSubscript:](v73, "objectForKeyedSubscript:", *MEMORY[0x1E0CA9040]))
                goto LABEL_118;
              if ((v115 & 1) == 0)
                a3 = -[AVCapturePhoto metadata](self, "metadata");
              if ((v109 & 1) == 0)
                a4 = -[AVCapturePhoto embeddedThumbnailPhotoFormat](self, "embeddedThumbnailPhotoFormat");
              v74 = objc_msgSend(a4, "objectForKeyedSubscript:", v48);
              v75 = avcp_copyCGImageForUncompressedBuffer(self->_internal->photoPixelBuffer);
              v27 = avcp_copyTIFFFileDataRepresentationForImage(v75, (const __CFDictionary *)a3, v74);
              if (v75)
                CFRelease(v75);
              v72 = v27;
            }
            v76 = v72;
            v25 = 0;
LABEL_182:
            v26 = 0;
            goto LABEL_183;
          }
        }
        else if (!v46)
        {
          v119 = 0;
          v50 = v108;
          if (v116)
          {
            v51 = *MEMORY[0x1E0CF2D08];
            v52 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2D08]), "intValue");
            v53 = *MEMORY[0x1E0CF2CB8];
            v54 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CB8]), "intValue");
            if (v52 <= v54)
              v55 = v54;
            else
              v55 = v52;
            v56 = v55;
            v119 = v55;
            if (!v55)
            {
              v57 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[AVCapturePhotoSettings embeddedThumbnailPhotoFormat](self->_internal->unresolvedSettings, "embeddedThumbnailPhotoFormat"), "objectForKeyedSubscript:", v51), "intValue");
              v58 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](-[AVCapturePhotoSettings embeddedThumbnailPhotoFormat](self->_internal->unresolvedSettings, "embeddedThumbnailPhotoFormat"), "objectForKeyedSubscript:", v53), "intValue");
              if (v57 <= v58)
                LODWORD(v56) = v58;
              else
                LODWORD(v56) = v57;
              v56 = (int)v56;
              v119 = (int)v56;
            }
            if (!v56)
            {
              if (-[NSString isEqual:](self->_internal->processedFileType, "isEqual:", *MEMORY[0x1E0CF2AF8]))
              {
                v59 = 160;
LABEL_138:
                v119 = v59;
                goto LABEL_139;
              }
              -[AVCapturePhoto dimensions](self, "dimensions");
              -[AVCapturePhoto dimensions](self, "dimensions");
              if (CMPhotoDetermineMIAFCompliantThumbnailMaxPixelSize())
              {
                v59 = 320;
                goto LABEL_138;
              }
            }
          }
LABEL_139:
          objc_msgSend(a4, "objectForKeyedSubscript:", v48);
          v79 = AVOSTypeForString();
          photoSurfaceSize = self->_internal->photoSurfaceSize;
          v121 = 0;
          if (!CMPhotoCompressionSessionCreate())
          {
            v81 = *MEMORY[0x1E0D09308];
            v127[0] = &unk_1E424CA20;
            v82 = *MEMORY[0x1E0D09300];
            v126[0] = v81;
            v126[1] = v82;
            v127[1] = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", photoSurfaceSize);
            v126[2] = *MEMORY[0x1E0D09330];
            v127[2] = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v115);
            v126[3] = *MEMORY[0x1E0D09338];
            v127[3] = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v109);
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v127, v126, 4);
            if (!CMPhotoCompressionSessionOpenExistingContainerForModification()
              && (!a3 || !v115 || !CMPhotoCompressionSessionAddMetadataFromImageProperties()))
            {
              if (v116)
              {
                if ((v107 & (v119 > 0xA0)) != 0)
                  v83 = 160;
                else
                  v83 = v119;
                v124[0] = *MEMORY[0x1E0D09378];
                v125[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v79);
                v124[1] = *MEMORY[0x1E0D093E0];
                v125[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v83);
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v125, v124, 2);
                v84 = CMPhotoCompressionSessionAddThumbnail();
                v26 = 0;
                v27 = 0;
                v25 = v121;
                if (v84)
                  goto LABEL_183;
              }
              else
              {
                v25 = v121;
              }
              if (v108 && v110 != v108)
              {
                if (-[AVDepthData depthDataType](v108, "depthDataType") != 1751411059)
                  v50 = -[AVDepthData depthDataByConvertingToDepthDataType:](v108, "depthDataByConvertingToDepthDataType:", 1751411059);
                if (-[AVDepthData isDepthDataFiltered](v50, "isDepthDataFiltered"))
                  v85 = 0;
                else
                  v85 = &unk_1E424CA38;
                v86 = -[AVDepthData copyAuxiliaryMetadata](v50, "copyAuxiliaryMetadata");
                v87 = *MEMORY[0x1E0CBC708];
                -[AVDepthData depthDataMap](v50, "depthDataMap");
                _addAuxiliaryImage((uint64_t)v25, 0, v87, 1, 0, (uint64_t)v86, (uint64_t)v85);
                if (v86)
                  CFRelease(v86);
              }
              if (v118)
              {
                if (v111 != v118)
                {
                  v88 = -[AVPortraitEffectsMatte copyAuxiliaryMetadata](v118, "copyAuxiliaryMetadata");
                  v89 = *MEMORY[0x1E0CBC720];
                  -[AVPortraitEffectsMatte mattingImage](v118, "mattingImage");
                  _addAuxiliaryImage((uint64_t)v25, 0, v89, 5, 0, (uint64_t)v88, 0);
                  if (v88)
                    CFRelease(v88);
                }
              }
              if (a8)
              {
                if (v112 != a8)
                {
                  v90 = (const void *)objc_msgSend(a8, "copyAuxiliaryMetadata");
                  v91 = *MEMORY[0x1E0CBC730];
                  v92 = *MEMORY[0x1E0D09288];
                  objc_msgSend(a8, "mattingImage");
                  _addAuxiliaryImage((uint64_t)v25, 0, v91, 4, v92, (uint64_t)v90, 0);
                  if (v90)
                    CFRelease(v90);
                }
              }
              if (a9)
              {
                if (v113 != a9)
                {
                  v93 = (const void *)objc_msgSend(a9, "copyAuxiliaryMetadata");
                  v94 = *MEMORY[0x1E0CBC738];
                  v95 = *MEMORY[0x1E0D09290];
                  objc_msgSend(a9, "mattingImage");
                  _addAuxiliaryImage((uint64_t)v25, 0, v94, 4, v95, (uint64_t)v93, 0);
                  if (v93)
                    CFRelease(v93);
                }
              }
              if (a10)
              {
                if (v114 != a10)
                {
                  v96 = (const void *)objc_msgSend(a10, "copyAuxiliaryMetadata");
                  v97 = *MEMORY[0x1E0CBC748];
                  v98 = *MEMORY[0x1E0D092A0];
                  objc_msgSend(a10, "mattingImage");
                  _addAuxiliaryImage((uint64_t)v25, 0, v97, 4, v98, (uint64_t)v96, 0);
                  if (v96)
                    CFRelease(v96);
                }
              }
              if (a11)
              {
                if (v106 != a11)
                {
                  v99 = (const void *)objc_msgSend(a11, "copyAuxiliaryMetadata");
                  v100 = *MEMORY[0x1E0CBC728];
                  v101 = *MEMORY[0x1E0D09280];
                  objc_msgSend(a11, "mattingImage");
                  _addAuxiliaryImage((uint64_t)v25, 0, v100, 4, v101, (uint64_t)v99, 0);
                  if (v99)
                    CFRelease(v99);
                }
              }
              v127[0] = 0;
              if (!CMPhotoCompressionSessionCloseContainerAndCopyBacking())
              {
                CMPhotoCompressionSessionInvalidate();
                v27 = (CFMutableDataRef)v127[0];
                goto LABEL_182;
              }
              goto LABEL_119;
            }
          }
          v77 = (id)v121;
          if (!v121)
          {
LABEL_118:
            v25 = 0;
LABEL_119:
            v26 = 0;
            goto LABEL_120;
          }
LABEL_117:
          CFRelease(v77);
          goto LABEL_118;
        }
        v60 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2D08]), "intValue");
        v61 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CB8]), "intValue");
        v127[0] = 0;
        if (!CMPhotoDNGCompressorCreateFromSourceDNGWithModificationHandler())
        {
          if ((v36 & 1) != 0)
            goto LABEL_217;
          v62 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v63 = objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2C40]), "intValue");
          v64 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v63);
          objc_msgSend(v62, "setObject:forKeyedSubscript:", v64, *MEMORY[0x1E0D094C0]);
          objc_msgSend((id)objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0CF2CE0]), "doubleValue");
          v66 = v65;
          v67 = *MEMORY[0x1E0D094D0];
          if (v65 == 1.0)
          {
            v68 = &unk_1E424CA50;
          }
          else
          {
            objc_msgSend(v62, "setObject:forKeyedSubscript:", &unk_1E424CA68, v67);
            v68 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v66);
            v67 = *MEMORY[0x1E0D094E0];
          }
          objc_msgSend(v62, "setObject:forKeyedSubscript:", v68, v67);
          if (!CMPhotoDNGCompressorReplaceMainImageOptions())
          {
LABEL_217:
            if (!v115 || !CMPhotoDNGCompressorReplaceMainImageProperties())
            {
              if (!v109)
                goto LABEL_134;
              if (v116)
              {
                if ((int)v60 <= (int)v61)
                  v78 = v61;
                else
                  v78 = v60;
                v125[0] = *MEMORY[0x1E0D094F0];
                v126[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v78);
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 1);
                if (+[AVCapturePhotoOutput isAppleProRAWPixelFormat:](AVCapturePhotoOutput, "isAppleProRAWPixelFormat:", CVPixelBufferGetPixelFormatType(v116)))
                {
                  if (CMPhotoDNGCompressorSetPreviewImageFromRAW())
                    goto LABEL_116;
                }
                else if (CMPhotoDNGCompressorSetPreviewImage())
                {
                  goto LABEL_116;
                }
LABEL_134:
                v26 = v127[0];
                v127[0] = 0;
                if (!CMPhotoDNGCompressorFinalizeAndCreateData())
                {
                  v27 = (CFMutableDataRef)v127[0];
                  v25 = 0;
                  goto LABEL_183;
                }
                v25 = 0;
LABEL_120:
                v27 = 0;
                goto LABEL_183;
              }
              if (!CMPhotoDNGCompressorSetCompressedPreviewImage())
                goto LABEL_134;
            }
          }
        }
LABEL_116:
        v77 = v127[0];
        if (!v127[0])
          goto LABEL_118;
        goto LABEL_117;
      }
      v27 = 0;
      v26 = 0;
      v25 = 0;
      v102 = CFSTR("replacementRawCompressionSettings must be an instance of NSDictionary");
    }
LABEL_206:
    v120 = v102;
    goto LABEL_184;
  }
  v21 = *MEMORY[0x1E0CF2D08];
  v123[0] = *MEMORY[0x1E0CF2C58];
  v123[1] = v21;
  v123[2] = *MEMORY[0x1E0CF2CB8];
  v22 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v123, 3);
  if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCapturePhotoSettingsSupportRawEmbeddedThumbnailFormat"))
    && -[AVCapturePhoto isRawPhoto](self, "isRawPhoto"))
  {
    v23 = -[AVCapturePhotoSettings availableRawEmbeddedThumbnailPhotoCodecTypes](self->_internal->unresolvedSettings, "availableRawEmbeddedThumbnailPhotoCodecTypes");
  }
  else
  {
    v23 = -[AVCapturePhotoSettings availableEmbeddedThumbnailPhotoCodecTypes](self->_internal->unresolvedSettings, "availableEmbeddedThumbnailPhotoCodecTypes");
  }
  v24 = +[AVCaptureVideoSettingsValidator validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:](AVCaptureVideoSettingsValidator, "validateVideoSettings:allowingFeatures:validPixelKeys:validPixelFormats:validCodecKeys:validCodecs:exceptionReason:", a4, 25, 0, 0, v22, v23, &v120);
  v25 = 0;
  v26 = 0;
  v27 = 0;
  if (v24)
    goto LABEL_10;
LABEL_183:
  v102 = v120;
  if (v120)
LABEL_184:
    *a13 = v102;
LABEL_185:
  if (v25)
    CFRelease(v25);
  if (v26)
    CFRelease(v26);
  return v27;
}

uint64_t __384__AVCapturePhoto__fileDataRepresentationWithReplacementMetadata_replacementEmbeddedThumbnailPhotoFormat_replacementEmbeddedThumbnailPixelBuffer_replacementDepthData_replacementPortraitEffectsMatte_replacementHairSegmentationMatte_replacementSkinSegmentationMatte_replacementTeethSegmentationMatte_replacementGlassesSegmentationMatte_replacementRawCompressionSettings_exceptionReason___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0D092D0]);
  if ((unint64_t)objc_msgSend(v3, "count") >= 2)
  {
    v4 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
    if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D092C0]), "unsignedIntValue") != 1953325424)return FigSignalErrorAt();
    if (*(_BYTE *)(a1 + 48))
      objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E424CA20, *MEMORY[0x1E0D092D8]);
  }
  if ((unint64_t)objc_msgSend(v3, "count") > 2)
    return FigSignalErrorAt();
  v5 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  if (!*(_BYTE *)(a1 + 49))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v20 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D092B0]);
      v21 = objc_msgSend(v20, "count");
      if (v21 - 1 >= 0)
      {
        v22 = v21;
        v23 = *MEMORY[0x1E0D092B8];
        do
        {
          if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", objc_msgSend((id)objc_msgSend(v20, "objectAtIndexedSubscript:", --v22), "objectForKeyedSubscript:", v23)))objc_msgSend(v20, "removeObjectAtIndex:", v22);
        }
        while (v22 > 0);
      }
    }
  }
  if (*(_BYTE *)(a1 + 48) && *(_BYTE *)(a1 + 50))
  {
    v6 = *MEMORY[0x1E0D092D8];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0D092D8]);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v7 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0D092E8]);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v6);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = (void *)objc_msgSend(v3, "objectAtIndexedSubscript:", 0, 0);
    v14 = (void *)objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D092B0]);
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), v6);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }
  }
  return 0;
}

- (AVCapturePhotoInternal)internal
{
  return self->_internal;
}

@end
