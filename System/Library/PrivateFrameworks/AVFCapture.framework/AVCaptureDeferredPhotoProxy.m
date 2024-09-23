@implementation AVCaptureDeferredPhotoProxy

- (AVCaptureDeferredPhotoProxy)init
{
  void *v4;
  objc_super v5;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor) & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVCaptureDeferredPhotoProxy;
    return -[AVCaptureDeferredPhotoProxy init](&v5, sel_init);
  }
  else
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v4);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v4);
    return 0;
  }
}

- (AVCaptureDeferredPhotoProxy)initWithApplicationIdentifier:(id)a3 captureRequestIdentifier:(id)a4 photoIdentifier:(id)a5 timestamp:(id *)a6 expectedPhotoProcessingFlags:(unsigned int)a7
{
  AVCaptureDeferredPhotoProxy *v13;
  void *v14;
  unsigned int v16;
  __int128 v17;
  int64_t var3;
  objc_super v19;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor) & 1) != 0)
  {
    v19.receiver = self;
    v19.super_class = (Class)AVCaptureDeferredPhotoProxy;
    v17 = *(_OWORD *)&a6->var0;
    var3 = a6->var3;
    v16 = a7;
    v13 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](&v19, sel_initWithTimestamp_photoSurface_photoSurfaceSize_processedFileType_previewPhotoSurface_embeddedThumbnailSourceSurface_metadata_depthDataSurface_depthMetadataDictionary_portraitEffectsMatteSurface_portraitEffectsMatteMetadataDictionary_hairSegmentationMatteSurface_hairSegmentationMatteMetadataDictionary_skinSegmentationMatteSurface_skinSegmentationMatteMetadataDictionary_teethSegmentationMatteSurface_teethSegmentationMatteMetadataDictionary_glassesSegmentationMatteSurface_glassesSegmentationMatteMetadataDictionary_constantColorConfidenceMapSurface_constantColorMetadataDictionary_captureRequest_bracketSettings_sequenceCount_photoCount_expectedPhotoProcessingFlags_sourceDeviceType_, &v17, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
            0,
            0,
            0,
            0,
            0,
            0,
            1,
            1,
            v16,
            CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera"));
    if (v13)
    {
      v13->_applicationIdentifier = (NSString *)objc_msgSend(a3, "copy");
      v13->_captureRequestIdentifier = (NSString *)objc_msgSend(a4, "copy");
      v13->_photoIdentifier = (NSString *)objc_msgSend(a5, "copy");
    }
  }
  else
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v14);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    return 0;
  }
  return v13;
}

- (AVCaptureDeferredPhotoProxy)initWithTimestamp:(id *)a3 proxySurface:(__IOSurface *)a4 proxySurfaceSize:(unint64_t)a5 proxyFileType:(id)a6 previewPhotoSurface:(__IOSurface *)a7 metadata:(id)a8 captureRequest:(id)a9 sequenceCount:(unint64_t)a10 photoCount:(unint64_t)a11 applicationIdentifier:(id)a12 captureRequestIdentifier:(id)a13 photoIdentifier:(id)a14 expectedPhotoProcessingFlags:(unsigned int)a15 sourceDeviceType:(id)a16
{
  AVCaptureDeferredPhotoProxy *v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVCaptureDeferredPhotoProxy;
  v18 = *a3;
  v16 = -[AVCapturePhoto initWithTimestamp:photoSurface:photoSurfaceSize:processedFileType:previewPhotoSurface:embeddedThumbnailSourceSurface:metadata:depthDataSurface:depthMetadataDictionary:portraitEffectsMatteSurface:portraitEffectsMatteMetadataDictionary:hairSegmentationMatteSurface:hairSegmentationMatteMetadataDictionary:skinSegmentationMatteSurface:skinSegmentationMatteMetadataDictionary:teethSegmentationMatteSurface:teethSegmentationMatteMetadataDictionary:glassesSegmentationMatteSurface:glassesSegmentationMatteMetadataDictionary:constantColorConfidenceMapSurface:constantColorMetadataDictionary:captureRequest:bracketSettings:sequenceCount:photoCount:expectedPhotoProcessingFlags:sourceDeviceType:](&v19, sel_initWithTimestamp_photoSurface_photoSurfaceSize_processedFileType_previewPhotoSurface_embeddedThumbnailSourceSurface_metadata_depthDataSurface_depthMetadataDictionary_portraitEffectsMatteSurface_portraitEffectsMatteMetadataDictionary_hairSegmentationMatteSurface_hairSegmentationMatteMetadataDictionary_skinSegmentationMatteSurface_skinSegmentationMatteMetadataDictionary_teethSegmentationMatteSurface_teethSegmentationMatteMetadataDictionary_glassesSegmentationMatteSurface_glassesSegmentationMatteMetadataDictionary_constantColorConfidenceMapSurface_constantColorMetadataDictionary_captureRequest_bracketSettings_sequenceCount_photoCount_expectedPhotoProcessingFlags_sourceDeviceType_, &v18, a4, a5, a6, a7, 0, a8, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
          0,
          0,
          0,
          0,
          a9,
          0,
          a10,
          a11,
          a15,
          a16);
  if (v16)
  {
    v16->_applicationIdentifier = (NSString *)objc_msgSend(a12, "copy");
    v16->_captureRequestIdentifier = (NSString *)objc_msgSend(a13, "copy");
    v16->_photoIdentifier = (NSString *)objc_msgSend(a14, "copy");
  }
  return v16;
}

- (AVCaptureDeferredPhotoProxy)initWithDeferredPhotoIdentifier:(id)a3
{
  return -[AVCaptureDeferredPhotoProxy initWithDeferredPhotoIdentifier:applicationIdentifier:](self, "initWithDeferredPhotoIdentifier:applicationIdentifier:", a3, 0x1E4220D28);
}

- (AVCaptureDeferredPhotoProxy)initWithDeferredPhotoIdentifier:(id)a3 applicationIdentifier:(id)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  __int128 v13;
  uint64_t v14;

  if ((AVCaptureClientHasEntitlement((void *)AVCaptureEntitlementDeferredPhotoProcessor) & 1) != 0)
  {
    v7 = (void *)objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("/"));
    if (objc_msgSend(v7, "count") == 2)
    {
      v8 = (void *)objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
      v9 = (void *)objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    }
    else
    {
      v8 = 0;
      v9 = 0;
    }
    if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
    {
      v13 = *MEMORY[0x1E0CA2E18];
      v14 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      return -[AVCaptureDeferredPhotoProxy initWithApplicationIdentifier:captureRequestIdentifier:photoIdentifier:timestamp:expectedPhotoProcessingFlags:](self, "initWithApplicationIdentifier:captureRequestIdentifier:photoIdentifier:timestamp:expectedPhotoProcessingFlags:", a4, v8, v9, &v13, 0);
    }
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0, a3);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v12);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v12);
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
  }
  return 0;
}

- (NSString)deferredPhotoIdentifier
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@"), self->_captureRequestIdentifier, self->_photoIdentifier);
}

- (id)captureRequestIdentifier
{
  return self->_captureRequestIdentifier;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeferredPhotoProxy;
  -[AVCapturePhoto dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[NSString isEqual:](self->_applicationIdentifier, "isEqual:", objc_msgSend(a3, "applicationIdentifier"));
      if (v5)
      {
        v5 = -[NSString isEqual:](self->_captureRequestIdentifier, "isEqual:", objc_msgSend(a3, "captureRequestIdentifier"));
        if (v5)
          LOBYTE(v5) = -[NSString isEqual:](self->_photoIdentifier, "isEqual:", objc_msgSend(a3, "persistentStorageUUID"));
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)debugDescription
{
  uint64_t v3;
  void *v4;
  Float64 Seconds;
  NSInteger v6;
  NSUInteger v7;
  id v8;
  CMTime time;

  v3 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("proxy:{%dx%d deferredPhotoIdentifier:%@%@}"), -[AVCaptureDeferredPhotoProxy dimensions](self, "dimensions"), (unint64_t)-[AVCaptureDeferredPhotoProxy dimensions](self, "dimensions") >> 32, -[AVCaptureDeferredPhotoProxy deferredPhotoIdentifier](self, "deferredPhotoIdentifier"), &stru_1E421DB28);
  v4 = (void *)MEMORY[0x1E0CB3940];
  if (self)
    -[AVCapturePhoto timestamp](self, "timestamp");
  else
    memset(&time, 0, sizeof(time));
  Seconds = CMTimeGetSeconds(&time);
  v6 = -[AVCapturePhoto photoCount](self, "photoCount");
  v7 = -[AVCaptureResolvedPhotoSettings expectedPhotoCount](-[AVCapturePhoto resolvedSettings](self, "resolvedSettings"), "expectedPhotoCount");
  v8 = -[AVCaptureResolvedPhotoSettings debugDescription](-[AVCapturePhoto resolvedSettings](self, "resolvedSettings"), "debugDescription");
  -[AVCapturePhoto expectedPhotoProcessingFlags](self, "expectedPhotoProcessingFlags");
  return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("pts:%f %d/%d %@ settings:%@ flags: %@"), *(_QWORD *)&Seconds, v6, v7, v3, v8, AVAppleMakerNoteProcessingFlagsToShortString());
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[AVCaptureDeferredPhotoProxy debugDescription](self, "debugDescription"));
}

- ($2825F4736939C4A6D3AD43837233062D)dimensions
{
  return ($2825F4736939C4A6D3AD43837233062D)objc_msgSend((id)-[AVCapturePhoto internal](self, "internal")[104], "deferredPhotoProxyDimensions");
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)persistentStorageUUID
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

@end
